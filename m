Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxjLG-0000TJ-GU
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 05:36:19 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Thu, 19 Aug 2004 11:40:53 +0200
References: <200408191006.06637.gruber.m@utanet.at>
	<1092904352.3777.75.camel@imladris.demon.co.uk>
In-Reply-To: <1092904352.3777.75.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200408191140.53073.gruber.m@utanet.at>
Subject: Re: JFFS2 with AM29LV256M
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 19. August 2004 10:32 schrieben Sie:

> Our code which should handle suspending erases to allow programming is
> broken. So we disabled it -- you have to wait for erases to complete
> before the code will write data to the flash instead.

Then i have to change the do_write_oneword function to wait until erase is 
finshed ?

> That's odd. You have indeed done the correct things -- but writing to
> the /dev/mtd2 device works, while jffs2 writes don't. I don't quite see
> what's different.

the difference is: cp rootfs.img /dev/mtd only uses:

MTD_write
MTD_do_write_buffer
and so on ...

and cp a file on the mounted image uses:

MTD do_write_buffer(): WRITE 0x0028641c(0xe0011985)
MTD do_write_oneword(): WRITE 0x0028641c(0xd5997a45)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 45 bytes at 0x0004641c failed. returned -5, retlen 36

> There have been some changes to the chip driver for AMD chips recently.
> Out of interest, could you try an unpatched 2.6.8 kernel and see if that
> behaves the same?

I have done this with a 2.6.8-rc3 there was the same problem, because of that 
i haved used the snapshot of yesterday.

thanks regards manfred
