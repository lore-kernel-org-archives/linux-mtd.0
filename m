Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mIqM-0006qX-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2001 18:51:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010926105217.A29296@recycle.lbl.gov> 
References: <20010926105217.A29296@recycle.lbl.gov> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__put_user_bad' in `mtdblock_ioctl', arch=ARM 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 26 Sep 2001 19:00:34 +0100
Message-ID: <15249.1001527234@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ldoolitt@recycle.lbl.gov said:
> It appears as if mtdblock_ioctl() in drivers/mtd/mtdblock.c, faced
> with the case BLKGETSIZE64, does a put_user() of a 64-bit number.
> Eight-byte put_user()'s are not supported on ARM or x86.
>     (ref: include/asm-{arm,i386}/uaccess.h, macro __put_user_size)

> Whazzup?

We don't have 64-bit put_user support for ARM yet. Comment out the
BLKGETSIZE64 case for now.

--
dwmw2
