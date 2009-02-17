Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZRrx-0000T7-BA
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 15:28:24 +0000
Subject: RE: UBI memory leak after creating and removing volumes
From: Artem Bityutskiy <dedekind@infradead.org>
To: John.Smith@pace.com
In-Reply-To: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
References: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 17:24:19 +0200
Message-Id: <1234884259.17790.271.camel@localhost.localdomain>
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

Hmm, may be this is related to sysfs? Every time you create or delete
a volume UBIFS creates/deletes sysfs entries. May be some are forgotten,
or it messes up kobject refcounting, so the kobjects are never released.

> I don't know how to track these things down fully. But I 
> believe they relate to the elevator queue.

Hmm? Sorry, did not realize how elevator may be involved into
UBI volume creation/deletion. You mean when we create a volume,
userspace udev is called, and creates device node on your host
FS, which involves elevators? You can try disabling udev then.

Anyway, too late, I have to go home ow.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
