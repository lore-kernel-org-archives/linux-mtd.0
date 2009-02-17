Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZS2j-0002EW-MT
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 15:39:32 +0000
Subject: RE: UBI memory leak after creating and removing volumes
From: Artem Bityutskiy <dedekind@infradead.org>
To: John.Smith@pace.com
In-Reply-To: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
References: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 17:39:19 +0200
Message-Id: <1234885159.17790.280.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-17 at 14:33 +0000, John.Smith@pace.com wrote:
> Artem Bityutskiy wrote:
> >
> > On Tue, 2009-02-17 at 12:01 +0000, John.Smith@pace.com wrote:
> > 
> > > Hello, 
> > 
> > > I am using a 2.6.18 Kernel, patched with MTD from Kernel 2.6.21, and
> > > UBI from the mainline kernel a few days later on 1 May 2007.  The
> > > whole is running on an embedded MIPS device.
> > >
> > > I have NAND, and UBI, and gluebi, and jffs2.  I use jffs2, mounted
> > > on an mtdblock device. Broadly, it all works.
> > > 
> > > I am experiencing a memory leak revealed in recent stress tests.
> The
> > > stress tests create and delete many UBI volumes, and are are broadly
> > > equivelent to the following:
> > 
> > Can you please enable /proc/slab_allocators - it tracks all allocators
> > and if we have a leak - it may point to the function which is guilty.
> > 
> > Recompile the kernel, and you will have a nice instrumentation to find
> > memory leak - the /proc/slab_allocators file. Please, play with this.
> 
> After 0, 1000 and 2000 iterations of a test of creating 2 UBI volumes,
> then removing them, /proc/slab_allocators shows these three items
> obviously increasing:
> 
> inode_cache: 327 alloc_inode+0x140/0x148         
> inode_cache: 3329 alloc_inode+0x140/0x148        
> inode_cache: 6329 alloc_inode+0x140/0x148        
> (3 objects per iteration)
> 
> sysfs_dir_cache: 1402 sysfs_new_dirent+0x2c/0xa0 
> sysfs_dir_cache: 15402 sysfs_new_dirent+0x2c/0xa0
> sysfs_dir_cache: 29402 sysfs_new_dirent+0x2c/0xa0
> (14 objects per iteration)
> 
> dentry_cache: 669 d_alloc+0x30/0x214             
> dentry_cache: 3823 d_alloc+0x30/0x214            
> dentry_cache: 6823 d_alloc+0x30/0x214            
> (3 objects per iteration)

Wait, may be these are just caches? Did you try to drop
caches? May be there is no leak and we just have inode/dentry
caches growing, probably because of udev?

Try echo 3 > /proc/sys/vm/drop_caches

(see Documentation/sysctl/vm.txt)
 
> This E-mail and any attachments hereto are strictly confidential and intended solely for the addressee. If you are not the intended addressee please notify the sender by return and delete the message. You must not disclose, forward or copy this E-mail or attachments to any third party without the prior consent of the sender. Pace plc is registered in England and Wales (Company no. 1672847) and our Registered Office is at Victoria Road, Saltaire, West Yorkshire, BD18 3LF, UK. Tel +44 (0) 1274 532000 Fax +44 (0) 1274 532010. <http://www.pace.com>
> Save where otherwise agreed in writing between you and Pace (i) all orders for goods and/or services placed by you are made pursuant to Pace's standard terms and conditions of sale which may have been provided to you, or in any event are available at http://www.pace.com/uktcsale.pdf (ii) all orders for goods and/or services placed by Pace are subject to Pace's standard terms and conditions of purchase which may have been provided to you, or in any event are available at http://www.pace.com/uktcpurch.pdf. All other inconsistent terms in any other documentation including without limitation any purchase order, reschedule instruction, order acknowledgement, delivery note or invoice are hereby excluded.

Would you please remove this disclaimer which makes no sense in the
public mailing list.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
