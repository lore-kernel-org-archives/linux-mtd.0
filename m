Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1757Et-0004jG-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 16:50:55 +0100
From: elf@buici.com
Date: Tue, 7 May 2002 08:50:52 -0700
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Latest CVS and 2.2.x
Message-ID: <20020507155052.GA31070@buici.com>
References: <20020507152652.GA30979@buici.com> <20020507022357.GC17041@buici.com> <20020505002518.GA3665@buici.com> <10076.1020715656@redhat.com> <25429.1020783875@redhat.com> <27957.1020785387@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27957.1020785387@redhat.com>
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

On Tue, May 07, 2002 at 04:29:47PM +0100, David Woodhouse wrote:
> When building from the CVS tree itself, the makefiles should add the CVS 
> tree's include directory first on the include path, so it should work OK. 
> When building by copying the CVS code into your kernel tree, you should 
> copy the headers over so that should work too.
> 
> What did you do, and precisely what were the errors?

I sent this over the weekend to the list:

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

What I'm doing is unpacking the CVS tree, using the patch and patchin
as I described and then building from the kernel source tree as I
normally would.  This worked with the two year old version.
