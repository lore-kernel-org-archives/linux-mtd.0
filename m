Received: from ool-18be22cd.dyn.optonline.net ([24.190.34.205] helo=iral.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170Foc-0006Fs-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 06:59:42 +0100
References: <20020423190845.486244B001@iral.com>
            <3CC5EB96.C1D137E4@Rikers.org>
In-Reply-To: <3CC5EB96.C1D137E4@Rikers.org> 
From: "Albert Rybalkin" <albertr@forbes.net>
To: Tim Riker <Tim@Rikers.org>
Cc: Albert Rybalkin <albertr@forbes.net>,
	linux-mtd@lists.infradead.org
Subject: Re: mtd partitions on Sharp Zaurus
Date: Wed, 24 Apr 2002 05:59:11 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <20020424055911.486BB4B001@iral.com>
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

Thanks alot to all who replied and answered my questions, I really
appreciate your help. 

> 
> The latest kernel releases include proper read/write mtd flash drivers
> but incomplete partition information imho. jffs2 will work with an
> alternate kernel. The OpenZaurus project is configured to use jffs2
> instead of cramfs. 
> 

Doh. Don't know how I missed OpenZaurus, sorry... Just downloaded their
initrd and it's jffs2, indeed!
About missing partition information... Since the zaurus partition
info ("name",size, offset) is known, do you think it could be possible
to add it to some map driver? I saw your patch dated January 2002 at 
http://opensource.lineo.com/~timr/zaurus
but linux/drivers/mtd/maps/sa1100-flash.c v 1.7 does not seem to have any
mentioning of coolio partitions. Was it removed from kernel source or
moved along to other place? 

> The bootloader used on the Zaurus is a modified version of Angel. It
> uses multiple partitions as described on: 
> 
> http://www.btinternet.com/~p.flinders/sl-5000d/romimage-layout.html 
> 
> 128k - angel
> 128k - cf updater
> 512k - diagnostics
> 1M - kernel
> 14M+128k - root filesystem
> 128k - partition info 
> 
> It would be a fairly simple matter to convert that over to: 
> 
> 128k - blob (including CF updater, diagnostics, and partition table)
> 16M-128k - rootfs (including kernel and modules) 
> 

Ok, so /dev/mtdblock0 is "Angel" and /dev/mtdblock4 is initrd?
If I'll make my own jffs2 version of initrd and flash it in place
of Sharp's cramfs, does it mean that it could be mounted on
/dev/mtdblock4 ? Or am I missing the point? 

> 
> Ask your Sharp reps for this feature if you are interested in fitting
> more data in the internal flash. 
> 

It sure would be nice to get rid of small partitions and save some space.
I'll ask somebody from Sharp when I get a chance. Can you please give
me more details (email is ok) on what you need from sharp to
make it happen?
Thanks,
 -albertr
