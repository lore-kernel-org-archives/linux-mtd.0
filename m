Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZshS-0007Hp-SI
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 06:52:40 +0000
Date: Mon, 2 Jul 2018 08:52:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/2] ubi: expose the volume CRC check skip flag
Message-ID: <20180702085227.2b418264@bbrezillon>
In-Reply-To: <20180702064433.kvxcacdhuenzk5j3@qschulz>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <382648641.QZzOm4Mo72@blindfold>
 <20180701223347.2cef133b@bbrezillon> <3709236.JAAyN4mQyL@blindfold>
 <20180702064433.kvxcacdhuenzk5j3@qschulz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2 Jul 2018 08:44:33 +0200
Quentin Schulz <quentin.schulz@bootlin.com> wrote:

> Hi Richard, Boris,
> 
> On Sun, Jul 01, 2018 at 10:50:41PM +0200, Richard Weinberger wrote:
> > Am Sonntag, 1. Juli 2018, 22:33:47 CEST schrieb Boris Brezillon:  
> > > On Sun, 01 Jul 2018 21:35:57 +0200
> > > Richard Weinberger <richard@nod.at> wrote:
> > >   
> > > > Quentin,
> > > > 
> > > > Am Donnerstag, 28. Juni 2018, 09:40:53 CEST schrieb Quentin Schulz:  
> > > > > Now that we have the logic for skipping CRC check for static UBI volumes
> > > > > in the core, let's expose it to users.
> > > > > 
> > > > > This makes use of a padding byte in the volume description data
> > > > > structure as a flag. This flag only tell for now whether we should skip
> > > > > the CRC check of a volume.
> > > > > 
> > > > > This checks the UBI volume for which we are trying to skip the CRC check
> > > > > is static.
> > > > > 
> > > > > Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > > > Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> > > > > Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > > > ---
> > > > >  drivers/mtd/ubi/cdev.c      |  4 ++++
> > > > >  drivers/mtd/ubi/vmt.c       |  3 +++
> > > > >  include/uapi/mtd/ubi-user.h | 16 ++++++++++++++--
> > > > >  3 files changed, 21 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> > > > > index 45c3296..3eea1df 100644
> > > > > --- a/drivers/mtd/ubi/cdev.c
> > > > > +++ b/drivers/mtd/ubi/cdev.c
> > > > > @@ -622,6 +622,10 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
> > > > >  	    req->vol_type != UBI_STATIC_VOLUME)
> > > > >  		goto bad;
> > > > >  
> > > > > +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&  
> > > 
> > > Oops, missed that req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG check was
> > > missing parens (checkpatch --strict should complain about that).  
> > 
> > Latest when building my local branch or in linux-next we had noticed.
> > No need to worry.
> >    
> > > > > +	    req->vol_type != UBI_STATIC_VOLUME)
> > > > > +		goto bad;    
> > > > 
> > > > We should also reject unknown flags here.  
> > > 
> > > I agree.  
> 
> Should I send another version of my patches for it?

Yes please, respin your series with this additional check. Just define

#define UBI_VOL_VALID_FLGS	(UBI_VOL_SKIP_CRC_CHECK_FLG)

and then, in verify_mkvol_req() add

	if (req->flags & ~UBI_VOL_VALID_FLGS)
		goto bad;

> Same for
> parenthesis around the flags masking above?

No need to fix that one (unless Richard cares), as it seems I had it
wrong.
