Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxiLb-0000Cy-NE
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 04:32:36 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200408191006.06637.gruber.m@utanet.at>
References: <200408191006.06637.gruber.m@utanet.at>
Content-Type: text/plain
Message-Id: <1092904352.3777.75.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 19 Aug 2004 09:32:32 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 with AM29LV256M
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-08-19 at 10:06 +0200, Manfred Gruber wrote:
> until now is this correct, what does the Disabling erase-suspend-program due 
> to code brokenness mean ?

Our code which should handle suspending erases to allow programming is
broken. So we disabled it -- you have to wait for erases to complete
before the code will write data to the flash instead.

> then i erase on flash partition with:
> flash_eraseall /dev/mtd2
> and copy the rootfs.img to the partition:
> cp rootfs.img /dev/mtd2
> mount it with:
> mount -t jffs2 /dev/mtdblock2 /mnt
> 
> until now all worked, i think i have done the correct things... but:
> 
> when i now copy a file in the mounted jffs2-image dir i get alot of this 
> messages:
> 
> MTD do_write_oneword(): WRITE 0x00286bc0(0x978d0902)
> MTD do_write_oneword(): software timeout
> MTD do_write_oneword(): software timeout
> MTD do_write_oneword(): software timeout
> MTD do_write_oneword(): software timeout
> Write of 1887 bytes at 0x00046b7c failed. returned -5, retlen 1884

That's odd. You have indeed done the correct things -- but writing to
the /dev/mtd2 device works, while jffs2 writes don't. I don't quite see
what's different. 

There have been some changes to the chip driver for AMD chips recently.
Out of interest, could you try an unpatched 2.6.8 kernel and see if that
behaves the same?

-- 
dwmw2
