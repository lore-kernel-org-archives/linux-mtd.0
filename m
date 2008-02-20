Received: from exprod7og111.obsmtp.com ([64.18.2.175])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRq45-0006Kd-G4
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 14:36:54 +0000
Date: Wed, 20 Feb 2008 14:36:46 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <chaz20080220143646.GJ4539@artesyncp.com>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<20080212152124.GA21878@lazybastard.org>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080219150822.GA29587@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008-02-19 16:08:22 +0100, Jörn Engel:
> [ Just returned home. ]

Hi Jörn,

I've got to admit I've been a little too busy to look at it
myself. I'll send a patch for the obvious fixes soon though.

[...]
> > Well, yes that raised a concern to me, the "exit" function
> > returns "void". If the del_mtd_device fails with EBUSY at the
> > moment (such as when a /dev/mtdblock<x> is mounted), we ignore
> > it and go on with freeing everything leaving a dangling mtd.
> > 
> > Is there a way around that?
> 
> For module unload we should be safe.  Errors are only returned if the
> device doesn't exist (a clear bug) or if the device is still being used.
> Module refcounting should prevent the latter case, so either way we have
> a bug if del_mtd_device returns an error.

At the moment, when we bind a mtd device to a block device, we
don't increase the refcount. When a mtdblock on a block2mtd, the
refcount is not increased either (the mtdblock's one is I
guess).

When you unload block2mtd, the block2mtd exit code tries and
remove the mtd bindings. If it fails, it exits anyway, leaving
some dangling stuff. That's why I suggested that the exit code
doesn't do the cleaning but that the requirement of cleaning
things up is  put upon the user before he is allowed to unload
the module (increasing the refcount every time block2mtd is used
to map a mtd to a block device).

> When removing the device via your proposed interface we should simply
> return the error to userspace, if the interface permits.  Sysfs doesn't
> seem to permit error returns, so we should keep the device alive and do
> nothing.

Agreed, that's what I was doing in my patch. But I wasn't doing
anything with the refcount, this was still handled as before,
that is we relied on the exit code to do the clean up.

Best regards,
Stephane
