Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVNtb-0003Di-LS
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 21:10:37 +0000
Date: Wed, 20 Jun 2018 05:09:26 +0800
From: kbuild test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kbuild-all@01.org, David Woodhouse <dwmw2@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] jffs2: use unsigned 32-bit timstamps consistently
Message-ID: <201806200530.EiSnqUgV%fengguang.wu@intel.com>
References: <20180619155925.4107498-2-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619155925.4107498-2-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.18-rc1 next-20180619]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/jffs2-use-64-bit-intermediate-timestamps/20180620-015800
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
>> fs/jffs2/dir.c:263:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:230:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:403:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:546:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:591:24: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:715:22: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
   fs/jffs2/dir.c:800:15: sparse: expression using sizeof(void)
--
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
>> fs/jffs2/fs.c:115:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:116:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:117:21: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   fs/jffs2/fs.c:476:45: sparse: expression using sizeof(void)
   include/linux/slab.h:631:13: sparse: undefined identifier '__builtin_mul_overflow'
   include/linux/slab.h:631:13: sparse: call with no type!

vim +263 fs/jffs2/dir.c

^1da177e Linus Torvalds      2005-04-16  241  
^1da177e Linus Torvalds      2005-04-16  242  
^1da177e Linus Torvalds      2005-04-16  243  static int jffs2_link (struct dentry *old_dentry, struct inode *dir_i, struct dentry *dentry)
^1da177e Linus Torvalds      2005-04-16  244  {
fc64005c Al Viro             2016-04-10  245  	struct jffs2_sb_info *c = JFFS2_SB_INFO(old_dentry->d_sb);
2b0143b5 David Howells       2015-03-17  246  	struct jffs2_inode_info *f = JFFS2_INODE_INFO(d_inode(old_dentry));
^1da177e Linus Torvalds      2005-04-16  247  	struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
^1da177e Linus Torvalds      2005-04-16  248  	int ret;
^1da177e Linus Torvalds      2005-04-16  249  	uint8_t type;
3a69e0cd Artem B. Bityutskiy 2005-08-17  250  	uint32_t now;
^1da177e Linus Torvalds      2005-04-16  251  
^1da177e Linus Torvalds      2005-04-16  252  	/* Don't let people make hard links to bad inodes. */
^1da177e Linus Torvalds      2005-04-16  253  	if (!f->inocache)
^1da177e Linus Torvalds      2005-04-16  254  		return -EIO;
^1da177e Linus Torvalds      2005-04-16  255  
e36cb0b8 David Howells       2015-01-29  256  	if (d_is_dir(old_dentry))
^1da177e Linus Torvalds      2005-04-16  257  		return -EPERM;
^1da177e Linus Torvalds      2005-04-16  258  
^1da177e Linus Torvalds      2005-04-16  259  	/* XXX: This is ugly */
2b0143b5 David Howells       2015-03-17  260  	type = (d_inode(old_dentry)->i_mode & S_IFMT) >> 12;
^1da177e Linus Torvalds      2005-04-16  261  	if (!type) type = DT_REG;
^1da177e Linus Torvalds      2005-04-16  262  
a7cab044 Arnd Bergmann       2018-06-19 @263  	now = JFFS2_NOW();
3a69e0cd Artem B. Bityutskiy 2005-08-17  264  	ret = jffs2_do_link(c, dir_f, f->inocache->ino, type, dentry->d_name.name, dentry->d_name.len, now);
^1da177e Linus Torvalds      2005-04-16  265  
^1da177e Linus Torvalds      2005-04-16  266  	if (!ret) {
ced22070 David Woodhouse     2008-04-22  267  		mutex_lock(&f->sem);
2b0143b5 David Howells       2015-03-17  268  		set_nlink(d_inode(old_dentry), ++f->inocache->pino_nlink);
ced22070 David Woodhouse     2008-04-22  269  		mutex_unlock(&f->sem);
2b0143b5 David Howells       2015-03-17  270  		d_instantiate(dentry, d_inode(old_dentry));
a7cab044 Arnd Bergmann       2018-06-19  271  		dir_i->i_mtime = dir_i->i_ctime = ITIME(now);
2b0143b5 David Howells       2015-03-17  272  		ihold(d_inode(old_dentry));
^1da177e Linus Torvalds      2005-04-16  273  	}
^1da177e Linus Torvalds      2005-04-16  274  	return ret;
^1da177e Linus Torvalds      2005-04-16  275  }
^1da177e Linus Torvalds      2005-04-16  276  

:::::: The code at line 263 was first introduced by commit
:::::: a7cab044350466ac53107fa859f1f2cbc4d5112b jffs2: use 64-bit intermediate timestamps

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
