From: mark@lakeshoremicro.com (Mark Meade)
Date: Sat, 22 Mar 2003 19:39:03 -0500
Subject: UnitSizeFactor of != 1
In-Reply-To: <1048371172.1876.135.camel@ralph.plexio.private>
References: <1048371172.1876.135.camel@ralph.plexio.private>
Message-ID: <200303221933.19465.mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Saturday 22 March 2003 05:12 pm, Stephen Lee wrote:

> 1. Formatted the DOC with "dformat /win:D000 /s:doc524.exb". There were
> no apparent errors.
> 2. Rebooted under Redhat7.1 with a stock 2.4.20 kernel with the
> following kernel config settings:

<snip>

> NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
> NFTL_notify_add for DiskOnChip 2000
> NFTL_setup
> Sorry, we don't support UnitSizeFactor of != 1 yet.

<snip>

> My question is whether "dformat /win:D000 /s:doc524.exb" should have
> been sufficient to get DOC recognized correctly by the kernel or do I
> have to run ntfl_format? If ntfl_format is required, can I simply fdisk
> and format as a fat12 partition under linux?

Stephen,

With the 2.40.20 kernel, nftl_format is not required if you use the earlier 
version of the DiskOnChip DFORMAT utility (version 4.2).  This is still 
available at m-sys.com.

By default, dformat creates a fat12 partition that should be recognized under 
Linux.

Either way, if the nftl device is recognized, you should be able to run fdisk 
and format as fat12, ext2, etc.

Mark
