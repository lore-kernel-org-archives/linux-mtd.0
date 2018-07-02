Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZthD-00080o-BU
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 07:56:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 1/2] ubi: provide a way to skip CRC checks
Date: Mon, 02 Jul 2018 09:56:14 +0200
Message-ID: <1767453.cfoEQ8yxZA@blindfold>
In-Reply-To: <20180702095121.67bc61ef@bbrezillon>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <1530516625.469.82.camel@gmail.com> <20180702095121.67bc61ef@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 2. Juli 2018, 09:51:21 CEST schrieb Boris Brezillon:
> Hi Artem,
> 
> On Mon, 02 Jul 2018 10:30:25 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > Hi,
> > 
> > On Thu, 2018-06-28 at 09:40 +0200, Quentin Schulz wrote:
> > > diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> > > index d4b2e87..e9e9ecb 100644
> > > --- a/drivers/mtd/ubi/kapi.c
> > > +++ b/drivers/mtd/ubi/kapi.c
> > > @@ -202,7 +202,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
> > >  	desc->mode = mode;
> > >  
> > >  	mutex_lock(&ubi->ckvol_mutex);
> > > -	if (!vol->checked) {
> > > +	if (!vol->checked && !vol->skip_check) {
> > >  		/* This is the first open - check the volume */
> > >  		err = ubi_check_volume(ubi, vol_id);
> > >  		if (err < 0) {  
> > 
> > Did you deliberately did not add a similar check to 'vol_cdev_write()' ?
> > You want to skip checking on load but do have the checking after volume update ?
> 
> Yep, it's on purpose, I asked Quentin to keep the test on the update
> volume path.
> 
> > Looks a bit inconsistent to me. At the very least deserves a comment in
> > 'vol_cdev_write()' about why 'skip_check' flag is ignored there.
> 
> Well, I thought checking the CRC just after updating the volume made
> sense, just to make sure things were written correctly on the medium.
> Let's add a comment explaining why we keep the check here, unless you
> see a strong reason to get rid of this check in the update path.

+1

I also vote for keeping the check.
vol->skip_check is really just "skip the check upon volume open".

Thanks,
//richard
