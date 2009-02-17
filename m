Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZcdz-0006TB-29
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2009 02:58:41 +0000
Subject: RE: UBI memory leak after creating and removing volumes
From: Artem Bityutskiy <dedekind@infradead.org>
To: John.Smith@pace.com
In-Reply-To: <1234884259.17790.271.camel@localhost.localdomain>
References: <F21E92E7B38A1F4D9211341290F7569807EED247@salexc1.pace.internal>
	<1234884259.17790.271.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 17:24:51 +0200
Message-Id: <1234884291.17790.272.camel@localhost.localdomain>
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

On Tue, 2009-02-17 at 17:24 +0200, Artem Bityutskiy wrote:
> On Tue, 2009-02-17 at 14:33 +0000, John.Smith@pace.com wrote:
> > After 0, 1000 and 2000 iterations of a test of creating 2 UBI volumes,
> > then removing them, /proc/slab_allocators shows these three items
> > obviously increasing:
> > 
> > inode_cache: 327 alloc_inode+0x140/0x148         
> > inode_cache: 3329 alloc_inode+0x140/0x148        
> > inode_cache: 6329 alloc_inode+0x140/0x148        
> > (3 objects per iteration)
> > 
> > sysfs_dir_cache: 1402 sysfs_new_dirent+0x2c/0xa0 
> > sysfs_dir_cache: 15402 sysfs_new_dirent+0x2c/0xa0
> > sysfs_dir_cache: 29402 sysfs_new_dirent+0x2c/0xa0
> > (14 objects per iteration)
> > 
> > dentry_cache: 669 d_alloc+0x30/0x214             
> > dentry_cache: 3823 d_alloc+0x30/0x214            
> > dentry_cache: 6823 d_alloc+0x30/0x214            
> > (3 objects per iteration)
> 
> Hmm, may be this is related to sysfs? Every time you create or delete
> a volume UBIFS creates/deletes sysfs entries. May be some are forgotten,
s/UBIFS/UBI/

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
