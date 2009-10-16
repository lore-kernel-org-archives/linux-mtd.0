Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MygY8-0003fb-QQ
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 06:44:34 +0000
Subject: Re: [patch 4/5] mtd: Remove BKL and convert to unlocked_ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <20091015202758.523050101@linutronix.de>
References: <20091015202722.372890083@linutronix.de>
	<20091015202758.523050101@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Oct 2009 09:44:00 +0300
Message-Id: <1255675440.32489.311.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
	ALan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 20:28 +0000, Thomas Gleixner wrote:
> plain text document attachment
> (mtd-remove-bkl-and-convert-to-unlocked-ioctl.patch)
> mtd_open() got lock/unlock kernel from the big BKL push down, but it
> never relied on the BKL serialization as get_mtd_device() takes care
> of serialization vs. device init/teardown.
> 
> mtd_ioctl() is safe w/o the BKL as well. The data which is copied from
> the mtd data structure is either set up during device initialization
> or statistics which have never been protected by the BKL against
> concurrent modification. The mtd functions which are called from
> various ioctl commands are safe as well.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/mtdchar.c |   30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)

[dedekind@eru l2-mtd-2.6.git]$ make -j8
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  SYMLINK include/asm -> include/asm-x86
  CALL    scripts/checksyscalls.sh
  CHK     include/linux/compile.h
  CC [M]  drivers/mtd/mtdchar.o
drivers/mtd/mtdchar.c: In function ‘mtd_compat_ioctl’:
drivers/mtd/mtdchar.c:865: warning: passing argument 1 of ‘mtd_ioctl’ from incompatible pointer type
drivers/mtd/mtdchar.c:444: note: expected ‘struct file *’ but argument is of type ‘struct inode *’
drivers/mtd/mtdchar.c:865: warning: passing argument 2 of ‘mtd_ioctl’ makes integer from pointer without a cast
drivers/mtd/mtdchar.c:444: note: expected ‘u_int’ but argument is of type ‘struct file *’
drivers/mtd/mtdchar.c:865: error: too many arguments to function ‘mtd_ioctl’

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
