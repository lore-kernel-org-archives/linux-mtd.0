Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZjTg-0000Ms-Ry
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 21:01:50 +0000
From: Richard Weinberger <richard@nod.at>
To: Joe Perches <joe@perches.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>, dedekind1@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/2] ubi: expose the volume CRC check skip flag
Date: Sun, 01 Jul 2018 23:01:30 +0200
Message-ID: <2098416.O8QMNZQyoz@blindfold>
In-Reply-To: <cdc8383433a1f67f4d5f5d9c528e116ee10c7466.camel@perches.com>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <20180701223347.2cef133b@bbrezillon>
 <cdc8383433a1f67f4d5f5d9c528e116ee10c7466.camel@perches.com>
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

Am Sonntag, 1. Juli 2018, 22:54:32 CEST schrieb Joe Perches:
> On Sun, 2018-07-01 at 22:33 +0200, Boris Brezillon wrote:
> > On Sun, 01 Jul 2018 21:35:57 +0200 Richard Weinberger <richard@nod.at> wrote:
> > > Am Donnerstag, 28. Juni 2018, 09:40:53 CEST schrieb Quentin Schulz:
> > > > Now that we have the logic for skipping CRC check for static UBI volumes
> > > > in the core, let's expose it to users.
> []
> > > > diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> []
> > > > @@ -622,6 +622,10 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
> > > >  	    req->vol_type != UBI_STATIC_VOLUME)
> > > >  		goto bad;
> > > >  
> > > > +	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&
> > 
> > Oops, missed that req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG check was
> > missing parens (checkpatch --strict should complain about that).
> 
> Why should checkpatch complain?
> & has higher precedence than &&.

The code is more readable.

Thanks,
//richard
