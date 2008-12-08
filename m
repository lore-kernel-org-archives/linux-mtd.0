Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9iP7-0002J4-OY
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 15:52:14 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: UBI/DVB ioctl conflict?
Date: Mon, 8 Dec 2008 16:50:53 +0100
References: <20081207095811.13b51cca@zod.rchland.ibm.com>
	<200812081041.14178.laurentp@cse-semaphore.com>
	<1228729915.13686.95.camel@sauron>
In-Reply-To: <1228729915.13686.95.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812081650.54346.arnd@arndb.de>
Cc: Laurent Pinchart <laurentp@cse-semaphore.com>,
	v4l-dvb-maintainer@linuxtv.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 08 December 2008, Artem Bityutskiy wrote:
> On Mon, 2008-12-08 at 10:41 +0100, Laurent Pinchart wrote:
> > Correct me if I'm wrong, but doesn't this only matters for devices that would 
> > implement both the UBI and DVB API on the same inode ? That would be quite 
> > unlikely.
> 
> Yeah, I guess. But this anyway makes sense to keep ioctls
> non-overlapping.

We try hard (but sometimes fail) to keep every ioctl number unique.
The reason for this is that the device drivers are not the only
pieces of code that look at them. Specifically, three other things
frequently cause problems here:

* strace wants to know about ioctl numbers so that it can show
the arguments in a meaningful way when tracing a program.

* the original 64 bit emulation for ioctl numbers in fs/compat_ioctl.c
assumes that it should translate specific calls in a given way. This
is not important if both device drivers handle all their ioctls through
their own ->compat_ioctl file operation.

* A number of binary emulation layers try to convert between different
formats (endianess, word size, ioctl numbers). The most common ones are
Linux-on-BSD, x86-on-ia64, x86-on-powerpc and Unix-on-Linux emulation
layers in user space.

	Arnd <><
