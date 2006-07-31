Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7Zof-0003fq-47
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 11:36:29 -0400
Date: Mon, 31 Jul 2006 17:36:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: BUG: missing get_mtd_device when running cat /dev/mtdblock*
Message-ID: <20060731153623.GD16710@wohnheim.fh-wedel.de>
References: <20060731142615.GB16710@wohnheim.fh-wedel.de>
	<625fc13d0607310805i1d13877fj12e37607be038212@mail.gmail.com>
	<20060731151216.GC16710@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060731151216.GC16710@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 July 2006 17:12:16 +0200, Jörn Engel wrote:
> On Mon, 31 July 2006 10:05:52 -0500, Josh Boyer wrote:
> > On 7/31/06, Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > >While debugging on a 2.6.5 kernel (with fairly recent mtd) I noticed
> > >that mtdblock appears to be bypassing get_mtd_device().
> > 
> > Yes, it bypasses calling that.  But...
> > 
> > >Can anyone verify this on current mtd by adding a simple printk() to
> > >get_mtd_device() and running cat /dev/mtdblock0 > /dev/null or so?
> > >
> > >I am assuming this is not desired behaviour and should get fixed.
> > 
> > It seems mtd_blkdevs.c handles the reference counting itself.  See
> > blktrans_open.  Most certainly this could be changed to call
> > get_mtd_device instead, but I believe all the locking is correct as it
> > stands.
> > 
> > Might want to double check though.
> 
> Well, the gluebi patch does not work with that.  Among other things,
> gluebi introduced two new methods to struct mtd_info:
> 
> +	int (*open) (struct mtd_info *mtd);
> +	int (*close) (struct mtd_info *mtd);

And with those two methods, the refcounting in mtd_blkdevs.c is no
longer correct.  It is plain impossibly to synchronize mtd_blkdevs.c
and mtdcore.c race-free.  You can end up calling open() twice or not
at all, depending on your design.

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
