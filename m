Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxkQZ-0000rb-WF
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 06:45:53 -0400
To: David Woodhouse <dwmw2@infradead.org>
References: <200408191006.06637.gruber.m@utanet.at>
	<1092904352.3777.75.camel@imladris.demon.co.uk>
	<200408191140.53073.gruber.m@utanet.at>
	<1092910597.14552.1683.camel@hades.cambridge.redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 19 Aug 2004 04:45:48 -0600
In-Reply-To: <1092910597.14552.1683.camel@hades.cambridge.redhat.com>
Message-ID: <m33c2j76eb.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
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

David Woodhouse <dwmw2@infradead.org> writes:

> On Thu, 2004-08-19 at 11:40 +0200, Manfred Gruber wrote:
> > Am Donnerstag, 19. August 2004 10:32 schrieben Sie:
> > 
> > > Our code which should handle suspending erases to allow programming is
> > > broken. So we disabled it -- you have to wait for erases to complete
> > > before the code will write data to the flash instead.
> > 
> > Then i have to change the do_write_oneword function to wait until erase is 
> > finshed ?
> 
> No, we did that already. And we put that printk in to remind us to fix
> it properly some time soon.

When you get to that please make certain the code is disabled for
chips coming from jedec_probe as by and large they don't support erase 
suspend.  I was wondering why there was a print statement in there with
no code connected to it. 

> > the difference is: cp rootfs.img /dev/mtd only uses:
> > 
> > MTD_write
> > MTD_do_write_buffer
> > and so on ...
> > 
> > and cp a file on the mounted image uses:
> > 
> > MTD do_write_buffer(): WRITE 0x0028641c(0xe0011985)
> > MTD do_write_oneword(): WRITE 0x0028641c(0xd5997a45)
> > MTD do_write_oneword(): software timeout
> 
> Hmmm ok, so it's do_write_oneword() which is broken.

Possibly it still could be the chip. do_write_oneword since it
is read the data back anyway confirms that the data read back is
what was written.  I don't believe the write_buffer code path
does any but the most rudimentary sanity checks.

Eric
