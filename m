Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZjJ9-0004AS-7g
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 20:50:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/2] ubi: expose the volume CRC check skip flag
Date: Sun, 01 Jul 2018 22:50:41 +0200
Message-ID: <3709236.JAAyN4mQyL@blindfold>
In-Reply-To: <20180701223347.2cef133b@bbrezillon>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <382648641.QZzOm4Mo72@blindfold> <20180701223347.2cef133b@bbrezillon>
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

Am Sonntag, 1. Juli 2018, 22:33:47 CEST schrieb Boris Brezillon:
> On Sun, 01 Jul 2018 21:35:57 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
> > Quentin,
> > 
> > Am Donnerstag, 28. Juni 2018, 09:40:53 CEST schrieb Quentin Schulz:
> > > Now that we have the logic for skipping CRC check for static UBI volumes
> > > in the core, let's expose it to users.
> > > 
> > > This makes use of a padding byte in the volume description data
> > > structure as a flag. This flag only tell for now whether we should skip
> > > the CRC check of a volume.
> > > 
> > > This checks the UBI volume for which we are trying to skip the CRC check
> > > is static.
> > > 
> > > Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  drivers/mtd/ubi/cdev.c      |  4 ++++
> > >  drivers/mtd/ubi/vmt.c       |  3 +++
> > >  include/uapi/mtd/ubi-user.h | 16 ++++++++++++++--
> > >  3 files changed, 21 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> > > index 45c3296..3eea1df 100644
> > > --- a/drivers/mtd/ubi/cdev.c
> > > +++ b/drivers/mtd/ubi/cdev.c
> > > @@ -622,6 +622,10 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
> > >  	    req->vol_type != UBI_STATIC_VOLUME)
> > >  		goto bad;
> > >  
> > > +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&
> 
> Oops, missed that req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG check was
> missing parens (checkpatch --strict should complain about that).

Latest when building my local branch or in linux-next we had noticed.
No need to worry.
 
> > > +	    req->vol_type != UBI_STATIC_VOLUME)
> > > +		goto bad;  
> > 
> > We should also reject unknown flags here.
> 
> I agree. Talking about missing checks, it seems that none of the
> padding sections are checked (I hope all mkvol users are zero-ing the
> struct as requested in ubi-user.h). And we should probably also
> check that vtbl->flags does not contain unknown flags.

At least mtd-utils does zeros the request struct before using it.
So it does the right thing.

Adding checks for non-zero padding and more checking for vtbl->flags
is a good idea.

Thanks,
//richard
