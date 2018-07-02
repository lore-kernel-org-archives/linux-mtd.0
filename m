Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZtbE-0003nH-JU
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 07:50:18 +0000
Message-ID: <1530517784.469.94.camel@gmail.com>
Subject: Re: [PATCH v3 1/2] ubi: provide a way to skip CRC checks
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com,  linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,  thomas.petazzoni@bootlin.com
Date: Mon, 02 Jul 2018 10:49:44 +0300
In-Reply-To: <1814021.2UnKZ8bNR8@blindfold>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <3f9cef553d4f5da3fe2d76113d79ada1f0fe5224.1530169759.git-series.quentin.schulz@bootlin.com>
 <1530516625.469.82.camel@gmail.com> <1814021.2UnKZ8bNR8@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-07-02 at 09:43 +0200, Richard Weinberger wrote:
> Artem,
> 
> Am Montag, 2. Juli 2018, 09:30:25 CEST schrieb Artem Bityutskiy:
> > Hi,
> > 
> > On Thu, 2018-06-28 at 09:40 +0200, Quentin Schulz wrote:
> > > diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
> > > index d4b2e87..e9e9ecb 100644
> > > --- a/drivers/mtd/ubi/kapi.c
> > > +++ b/drivers/mtd/ubi/kapi.c
> > > @@ -202,7 +202,7 @@ struct ubi_volume_desc *ubi_open_volume(int
> > > ubi_num, int vol_id, int mode)
> > >  	desc->mode = mode;
> > >  
> > >  	mutex_lock(&ubi->ckvol_mutex);
> > > -	if (!vol->checked) {
> > > +	if (!vol->checked && !vol->skip_check) {
> > >  		/* This is the first open - check the volume */
> > >  		err = ubi_check_volume(ubi, vol_id);
> > >  		if (err < 0) {
> > 
> > Did you deliberately did not add a similar check to
> > 'vol_cdev_write()' ?
> > You want to skip checking on load but do have the checking after
> > volume update ?
> > Looks a bit inconsistent to me. At the very least deserves a
> > comment in
> > 'vol_cdev_write()' about why 'skip_check' flag is ignored there.
> 
> Well, the idea is skipping the check, not the crc32 on the medium.
> That way we can later, if needed, offer a way to drop the flag but
> and don't have to rewrite with crc32-enabled.

I understand that. I am talking about cdev.c line 370. We will check
the CRC after the update regardless of 'skip_check'. So I point out
that this is not very consistent with what we do in
'ubi_open_volume()'.

Is this deliberate or not? If this is deliberate, we should at least
add an explanation comment in 'vol_cdev_write()'.
