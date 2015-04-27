Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmruB-0002GB-5q
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 22:53:36 +0000
Received: by pdbnk13 with SMTP id nk13so143396746pdb.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2015 15:53:12 -0700 (PDT)
Date: Mon, 27 Apr 2015 15:53:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
Message-ID: <20150427225307.GC32500@ld-irv-0074>
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427223630.GA11721@bshelton-desktop> <553EBB4A.1040905@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553EBB4A.1040905@nod.at>
Cc: Ben Shelton <ben.shelton@ni.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 punnaiah.choudary.kalluri@xilinx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 12:42:18AM +0200, Richard Weinberger wrote:
> Am 28.04.2015 um 00:36 schrieb Ben Shelton:
> >>> When I build this without CONFIG_MTD_NAND_ECC_ON_DIE enabled, I get the
> >>> following warning here:
> >>>
> >>> In file included from drivers/mtd/nand/nand_base.c:46:0:
> >>> include/linux/mtd/nand_ondie.h: In function 'nand_read_subpage_on_die':
> >>> include/linux/mtd/nand_ondie.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
> >>> include/linux/mtd/nand_ondie.h: In function 'nand_read_page_on_die':
> >>> include/linux/mtd/nand_ondie.h:34:1: warning: no return statement in function returning non-void [-Wreturn-type]
> >>>
> >>> Perhaps return an error code here, even though you'll never get past the BUG()?
> >>
> >> What gcc is this?
> >> gcc 4.8 here does not warn, I thought it is smart enough that this function does never
> >> return. Can it be that your .config has CONFIG_BUG=n?
> >> Anyway, this functions clearly needs a return statement. :)
> > 
> > gcc 4.7.2, and you are correct that I had CONFIG_BUG off.  :)
> 
> Yeah, just noticed that BUG() with CONFIG_BUG=n does not have
> a nonreturn attribute. So, gcc cannot know...

But it's an obvious infinite loop... all of my toolchains (4.2, 4.5,
4.6, 4.8) are able to compile this without complaining (gcc -Wall):

int test() { do { } while (1); }

Not sure if 4.7 is unique.

But hey, others are doing this, so why not join the crowd. e.g.:

include/asm-generic/pgtable.h-567-#ifndef __HAVE_ARCH_PMD_WRITE
include/asm-generic/pgtable.h-568-static inline int pmd_write(pmd_t pmd)
include/asm-generic/pgtable.h-569-{
include/asm-generic/pgtable.h:570:      BUG();
include/asm-generic/pgtable.h-571-      return 0;
include/asm-generic/pgtable.h-572-}
include/asm-generic/pgtable.h-573-#endif /* __HAVE_ARCH_PMD_WRITE */
