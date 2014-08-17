Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIveU-0001sb-SM
 for linux-mtd@lists.infradead.org; Sun, 17 Aug 2014 08:17:23 +0000
Date: Sun, 17 Aug 2014 10:16:59 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: struct nand_sdr_timings kernel-doc
Message-ID: <20140817101659.55176635@bbrezillon>
In-Reply-To: <53EF9C23.1050006@infradead.org>
References: <53EF9C23.1050006@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Randy,

On Sat, 16 Aug 2014 11:00:03 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> Current DocBook complains as follows:
> 
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tALH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tADL_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tALS_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tAR_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCEA_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCEH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCHZ_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCLH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCLR_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCLS_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCOH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tCS_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tDH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tDS_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tFEAT_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tIR_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tITC_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRC_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tREA_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tREH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRHOH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRHW_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRHZ_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRLOH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRP_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRR_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tRST_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWB_max'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWC_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWH_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWHR_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWP_min'
> Warning(..//include/linux/mtd/nand.h:999): No description found for parameter 'tWW_min'
> 
> 
> Please eliminate all of those warnings by:
> a. adding kernel-doc notation for each struct field; or
> b. changing the beginning /** to /*; or

If you don't mind I'll go for this solution.
Brian, is that okay for you ?

> c. add /* private */ before the first struct member so that each struct item
>    does not need to be described; or
> d. some other way that suits you.
> 

Best Regards,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
