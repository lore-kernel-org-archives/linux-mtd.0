Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 174OUw-0001sS-00
	for <linux-mtd@lists.infradead.org>; Sun, 05 May 2002 17:04:30 +0100
From: elf@buici.com
Date: Sun, 5 May 2002 09:04:27 -0700
To: linux-mtd@lists.infradead.org
Subject: Building from CVS for 2.2.x
Message-ID: <20020505160427.GA9927@buici.com>
References: <20020505002518.GA3665@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020505002518.GA3665@buici.com>
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

It appears that at least one of the include references in the CVS code
(mtd-snapshot-20020504) is not compatible with the 2.2.x kernel
series.

I'm building the kernel from a directory in my /home.  The kernel
running on the development system is 2.4.x.  I unpacked a stock 2.2.17
kernel, patched it with mtd-2.2.17.patch, and then ran patchin.sh.  I
I checked the links and found them proper and intact.

The first problem was that the spinlock types were defined twice
incompatibly.  In compactmac.h, the inclusion of linux/spinlock.h at
line 362 pulls the file from /usr/include instead of the linux source
tree version.  Changing this include to asm/spinlock.h eliminated the
problem, though I'm not confident that this is the right way to fix
it.

Then, the pci.c driver in mtd/maps failed to build, but for a reason I
couldn't deduce.  The compiler complains that the ioremap_noncache
symbol is missing.  

What might I be missing?  Is there another kernel patch?
