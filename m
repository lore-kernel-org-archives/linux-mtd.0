Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XpYp-00026S-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 21:50:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020725184738.26475.qmail@mail.com> 
References: <20020725184738.26475.qmail@mail.com> 
To: "Mike Schumi" <schumi@techie.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_do_reserve_space 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 21:50:00 +0100
Message-ID: <21898.1027630200@redhat.com>
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

schumi@techie.com said:
> Then the Flash Loader I'm using adds a 0x40 header to the beginning of
> every binary image loaded to flash. It adds 0x40 to the Linux Loader
> (blob), Kernel, and jffs2.  

> I got confused by your emails!?! is this causing the problem we are
> seeing or its only causing the printks and sanity checks?! 
>  If its only causing the sanity checks to appear, its fine for now
> (I'll fix the loader later on). But if its the cause of the kernel
> panic let me know.  

It was causing the panic. Now that I've added the sanity check in the patch
I sent you, it's causing that instead of a panic, and also it's causing the
corruption which prevents your init from starting.

--
dwmw2
