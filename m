Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZsc7-0004OQ-9z
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 06:47:10 +0000
Date: Mon, 2 Jul 2018 08:46:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joe Perches <joe@perches.com>
Cc: Richard Weinberger  <richard@nod.at>, Quentin Schulz
 <quentin.schulz@bootlin.com>, dedekind1@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v3 2/2] ubi: expose the volume CRC check skip flag
Message-ID: <20180702084653.566d54bb@bbrezillon>
In-Reply-To: <cdc8383433a1f67f4d5f5d9c528e116ee10c7466.camel@perches.com>
References: <cover.6d66955e7c1848c8255870deb42eddb69bd276f3.1530169759.git-series.quentin.schulz@bootlin.com>
 <0ace6202bddb495ae0e632ae2fd0346f99fcdab4.1530169759.git-series.quentin.schulz@bootlin.com>
 <382648641.QZzOm4Mo72@blindfold>
 <20180701223347.2cef133b@bbrezillon>
 <cdc8383433a1f67f4d5f5d9c528e116ee10c7466.camel@perches.com>
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

On Sun, 01 Jul 2018 13:54:32 -0700
Joe Perches <joe@perches.com> wrote:

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
> 

Yes, I know, but I remember checkpatch complaining about that in one
of my patch (maybe it was a slightly different case though). Anyway, I
double checked and, as you report, checkpatch does not complain, so
please ignore this comment (sorry for the noise).
