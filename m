Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9eLy-0001CB-V6
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 17:59:55 +0000
Received: by mail-pa0-f42.google.com with SMTP id lf10so9415pab.15
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2014 10:59:33 -0700 (PDT)
Date: Tue, 22 Jul 2014 10:59:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [l2-mtd:master 25/29] drivers/mtd/nand/nand_timings.c:45:29:
 sparse: constant 250000000000 is so big it is long
Message-ID: <20140722175927.GB28323@ld-irv-0074>
References: <53cddd54.HZL7GYXhCV8fvSa4%fengguang.wu@intel.com>
 <20140722102813.060bc776@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140722102813.060bc776@bbrezillon>
Cc: linux-sparse@vger.kernel.org, kbuild test robot <fengguang.wu@intel.com>,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd, lkml, linux-sparse

On Tue, Jul 22, 2014 at 10:28:13AM +0200, Boris BREZILLON wrote:
> On Tue, 22 Jul 2014 11:41:08 +0800 kbuild test robot <fengguang.wu@intel.com> wrote:
> > tree:   git://git.infradead.org/users/dedekind/l2-mtd.git master
> > head:   e4e069347030ab0fea7304d06704fb3b64e5fe40
> > commit: 974647ea8a13021a91d558df61d598bcabf73439 [25/29] mtd: nand: add ONFI timing mode to nand_timings converter
> > reproduce: make C=1 CF=-D__CHECK_ENDIAN__
> > 
> > 
> > sparse warnings: (new ones prefixed by >>)
> > 
> > >> drivers/mtd/nand/nand_timings.c:45:29: sparse: constant 250000000000 is so big it is long
> > 
> > vim +45 drivers/mtd/nand/nand_timings.c
> > 
> >     29			.tCLS_min = 50000,
> >     30			.tCOH_min = 0,
> >     31			.tCS_min = 70000,
> >     32			.tDH_min = 20000,
> >     33			.tDS_min = 40000,
> >     34			.tFEAT_max = 1000000,
> >     35			.tIR_min = 10000,
> >     36			.tITC_max = 1000000,
> >     37			.tRC_min = 100000,
> >     38			.tREA_max = 40000,
> >     39			.tREH_min = 30000,
> >     40			.tRHOH_min = 0,
> >     41			.tRHW_min = 200000,
> >     42			.tRHZ_max = 200000,
> >     43			.tRLOH_min = 0,
> >     44			.tRP_min = 50000,
> >   > 45			.tRST_max = 250000000000,
> 
> Appending ULL to the numerical constant should fix this warning.
> 
> Do you want me to send a patch fixing this bug ?

No bug here, AFAICT. I noted already that, although this may appear to
overflow, it is in fact using standard behavior which says the constant
will be promoted to the proper type.

My comments:

  http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/252494.html

Looking at ISO draft N1124 (this is approximately C11, the first PDF I
had lying around), section 6.4.4.1 (statement 5):

  "The type of an integer constant is the first of the corresponding
  list in which its value can be represented."

So I think this is a sparse false positive. Notably, Fengguang's build
system also showed some complaints from an avr32 GCC toolchain. This is
also a bug.

Given that there are at least a few non-standards-compliant warnings out
there (and possibly real toolchain bugs, if they're giving these
warnings), perhaps it's prudent to patch this with a 'ULL' suffix, even
though I prefer not to work around bugs in tools in principle.

Brian
