Received: from modemcable096.213-200-24.mc.videotron.ca ([24.200.213.96]
	helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CxFqz-0007ht-Gr
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2005 21:39:22 -0500
Date: Fri, 4 Feb 2005 21:39:10 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: stiger <bhe@jadechip.com>
In-Reply-To: <001501c3eb8f$1e9cf780$33050a0a@jadechip.net>
Message-ID: <Pine.LNX.4.61.0502042136340.25997@localhost.localdomain>
References: <001501c3eb8f$1e9cf780$33050a0a@jadechip.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: flash unlock on VPB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Feb 2004, stiger wrote:

> hello,
> 
> i'm using VPB + kernel 2.6.9
> but i found the flash cannot write, it should be unlocked first.
> 
> if not use root filesystem in flash, I can use flash_unlock to unlock the
> flash.
> but if burn root filesystem into flash, i have to change the kernel code.
> 
> i add these code at driver/mtd/mtdpart.c->add_mtd_partitions()
> 
>         if((slave->mtd.flags & MTD_WRITEABLE) && slave->mtd.unlock ){
>             slave->mtd.unlock(&(slave->mtd), 0, slave->mtd.size );
>         }
> 
> now, it works.
> but i think it's a stupid way to do this.
> is there any other way to do this ?

The unlock is usually called from the map driver in that case.


Nicolas
