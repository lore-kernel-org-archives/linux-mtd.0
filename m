From: David Woodhouse <dwmw2@infradead.org>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200408191140.53073.gruber.m@utanet.at>
References: <200408191006.06637.gruber.m@utanet.at>
	<1092904352.3777.75.camel@imladris.demon.co.uk>
	<200408191140.53073.gruber.m@utanet.at>
Content-Type: text/plain
Message-Id: <1092910597.14552.1683.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 19 Aug 2004 11:16:37 +0100
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

On Thu, 2004-08-19 at 11:40 +0200, Manfred Gruber wrote:
> Am Donnerstag, 19. August 2004 10:32 schrieben Sie:
> 
> > Our code which should handle suspending erases to allow programming is
> > broken. So we disabled it -- you have to wait for erases to complete
> > before the code will write data to the flash instead.
> 
> Then i have to change the do_write_oneword function to wait until erase is 
> finshed ?

No, we did that already. And we put that printk in to remind us to fix
it properly some time soon.
> the difference is: cp rootfs.img /dev/mtd only uses:
> 
> MTD_write
> MTD_do_write_buffer
> and so on ...
> 
> and cp a file on the mounted image uses:
> 
> MTD do_write_buffer(): WRITE 0x0028641c(0xe0011985)
> MTD do_write_oneword(): WRITE 0x0028641c(0xd5997a45)
> MTD do_write_oneword(): software timeout

Hmmm ok, so it's do_write_oneword() which is broken.

-- 
dwmw2
