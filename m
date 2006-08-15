Received: from colibri.its.uu.se ([130.238.4.154])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GD6bc-0005Uj-ET
	for linux-mtd@lists.infradead.org; Tue, 15 Aug 2006 22:37:49 +0100
Date: Tue, 15 Aug 2006 23:34:49 +0200
To: Katey Yu <katey.Yu@ositech.com>
Subject: Re: write-protected
Message-ID: <20060815213449.GG3622@Update.UU.SE>
References: <007020085773234AAACE3B66E13C18E8D71D08@MAILSRVR.ositech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <007020085773234AAACE3B66E13C18E8D71D08@MAILSRVR.ositech.com>
From: samuel@Update.UU.SE (Samuel ]slund)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Katey,

If I read that right you should be able to write to all partitions 
_except_ the fourth (mtd3 / mtdblock3) .

HTH
//Samuel

On Tue, Aug 15, 2006 at 04:08:47PM -0400, Katey Yu wrote:
> Hi Samuel,
> 
> This is mtd partition.
> static struct mtd_partition partition_info[]= {
> 
> 	{
> 		name: "bootloader",
> ///dev/mtdblock0
> 		size: 64 * 1024,
> 		offset: 0,
> //		mask_flags: MTD_WRITEABLE
> 		mask_flags: 0 
> 	},
> 	{
> 		name: "kernel",                         ///dev/mtdblock1
> 
> 		size: 640 * 1024,
> 		offset: MTDPART_OFS_APPEND,
> //		mask_flags: MTD_WRITEABLE
> 		mask_flags: 0
> 	},
> 	{
> 		name: "filesystem",                     ///dev/mtdblock2
> 		size: 1300 * 1024,
> 		offset: MTDPART_OFS_APPEND,
> //		mask_flags: MTD_WRITEABLE
> 		mask_flags: 0
> 	},
> 	{
> 		name: "config",
> ////dev/mtdblock3      
> 		size: 16 * 1024,
> 		offset: MTDPART_OFS_APPEND,
> //		offset: 0x4000,
> 		mask_flags: MTD_WRITEABLE
> //		mask_flags: 0
> 	}
> 	{
> 		name: "complete flash",
> ///dev/mtdblock4
> 		size: 2048 * 1024,
> 		offset: 0,
> 		mask_flags: 0
> //		mask_flags: MTD_WRITEABLE
> 	}
> };
> 
> Katey
> -----Original Message-----
> From: Samuel ]slund [mailto:samuel@Update.UU.SE] 
> Sent: Tuesday, August 15, 2006 11:37 AM
> To: Katey Yu
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: write-protected
> 
> On Mon, Aug 14, 2006 at 04:44:01PM -0400, Katey Yu wrote:
> > Hello,
> > 
> > When I mount /dev/mtdblock3 in flash I get  block " block device
> > /dev/mtdblock3 is write-protected, mounting read-only". I should get
> > mtdblock_open?
> > 
> > Could somebody tell me what's wrong?
> > 
> >  
> > 
> >  
> > 
> > mount -t jffs2  /dev/mtdblock3 /var/tmp
> > 
> > mount: block device /dev/mtdblock3 is write-protected, mounting
> > read-only
> 
> You do not give very much information about your system...
> Ok, assuming you have set up the block device correctly.
> 
> I had a similar problem that boiled down to that the driver
> from the manufacturer hardcoded the partition to be read-only.
> 
> in my case the apropriate file was:
> linux/arch/arm/mach-ks8695/ks8695_mm.c
> 
> The partition had been set read-only by adding:
>   .mask_flags = MTD_WRITABLE
> 
> to the partition struct.
> 
> HTH
> //Samuel
> 
> 
> 
