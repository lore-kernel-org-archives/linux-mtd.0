Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl6cw-0008VL-CG
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 11:59:35 -0400
Date: Tue, 30 May 2006 17:59:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060530155922.GB26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004502.2885.193.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1149004502.2885.193.camel@hades.cambridge.redhat.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 16:55:02 +0100, David Woodhouse wrote:
> On Tue, 2006-05-30 at 17:50 +0200, Jörn Engel wrote:
> > Until recently, we had four different variants of jffs2 wbuf code,
> > depending on the flash type.  I fail to see the difference between
> > those four and have already merged two of them.  Unless I am missing
> > something important, the other three can also be combined into one.
> > 
> > But doing so would result in something like
> >         if ((mtd->type == MTD_NAND) || (mtd->type == MTD_SIBLEY) ||
> >                         (mtd->type == MTD_ECCNOR) ||
> >                         (mtd->type == MTD_DATAFLASH))
> 
> That's why we _also_ have the flags, and why we abstract that still
> further in application-specific code, like jffs2_can_mark_obsolete()
> 
> But you seem to want to kill _both_ the type _and_ the flag -- you say
> that you want the MTD_KF_NOR_WBUF_FLASH flag to go away. So explain --
> what do you want to do instead?

	if (mtd->writesize > 1)

If the device does not allow writes to happen in arbitrary hunks, we
need wbuf.  That's all.

The currently three different variants of initializing wbuf need to be
converged into one generic method.  That won't happen just now, so I
introduced a temporary flag for one variant of initialization code.
The real gain comes with merging the three remaining variants,
obviously.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
