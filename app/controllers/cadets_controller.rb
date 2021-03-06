class CadetsController < ApplicationController
  # GET /cadets
  # GET /cadets.xml
  def index

	@cadets = Cadet.name_like(params[:q])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cadets }
	  format.js   { render :nothing => true } 
	  format.json { render :json => @cadets }
    end
  end

  # GET /cadets/1
  # GET /cadets/1.xml
  def show
    @cadet = Cadet.find(params[:id])
	@awards = @cadet.awards

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cadet }
    end
  end

  # GET /cadets/new
  # GET /cadets/new.xml
  def new
    @cadet = Cadet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cadet }
    end
  end

  # GET /cadets/1/edit
  def edit
    @cadet = Cadet.find(params[:id])
  end

  # POST /cadets
  # POST /cadets.xml
  def create
    @cadet = Cadet.new(params[:cadet])

    respond_to do |format|
      if @cadet.save
        format.html { redirect_to(@cadet, :notice => 'Cadet was successfully created.') }
        format.xml  { render :xml => @cadet, :status => :created, :location => @cadet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cadet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cadets/1
  # PUT /cadets/1.xml
  def update
    @cadet = Cadet.find(params[:id])

    respond_to do |format|
      if @cadet.update_attributes(params[:cadet])
        format.html { redirect_to(@cadet, :notice => 'Cadet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cadet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cadets/1
  # DELETE /cadets/1.xml
  def destroy
    @cadet = Cadet.find(params[:id])
    @cadet.destroy

    respond_to do |format|
      format.html { redirect_to(cadets_url) }
      format.xml  { head :ok }
    end
  end
end
