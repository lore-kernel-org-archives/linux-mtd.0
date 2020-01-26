Return-Path: <SRS0=Qh2W=3P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82F0C2D0DB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2020 18:31:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A96F206F0
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2020 18:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o0YNytJF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A96F206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OOHIvmC+r0Okg4w3+H5/IYmzpC8k/04fqp1hLo7cHQ=; b=o0YNytJF4cYmT5
	1MTOa6UNsTDh3eO6Uo9w674mDo84wGW5Xbhfh4a5/SGynYYzVmT0dx3STeG+jrZq0ZouH27Wh4TFq
	Cji0Lp9+sbQcyQoAi0/agkv53372lcRnkNJwop6hVcKn9TnoAcWC1yiADux575ANdg/uR2QaL3ohv
	Ma+a0DCOvJHC91NdrCGyli8XSCN1osX6o9eO1npiUKJbVv6/SKDaZYohbfCIj77JvCt3z1CvLs4tG
	XTDwSFaQUlp6SOGDgVDB+yjU1AtEwgvrN5Xy1XPy171hNNgIyheKy3Dt1R5J4BtF9CJxG77WDwm+G
	dIpbanRATQ7xdOXZOJhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ivmgF-0005ha-Ou; Sun, 26 Jan 2020 18:30:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivmg5-0005Zv-2A
 for linux-mtd@lists.infradead.org; Sun, 26 Jan 2020 18:30:34 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jan 2020 10:30:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,366,1574150400"; d="scan'208";a="246214021"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 26 Jan 2020 10:30:29 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ivmg0-000EPW-GT; Mon, 27 Jan 2020 02:30:28 +0800
Date: Mon, 27 Jan 2020 02:30:00 +0800
From: kbuild test robot <lkp@intel.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 8/8] ubifs: Add quota support
Message-ID: <202001270202.ewwgFh1r%lkp@intel.com>
References: <20200124131323.23885-9-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124131323.23885-9-s.hauer@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200126_103033_147293_0865EF2B 
X-CRM114-Status: GOOD (  16.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, kbuild-all@lists.01.org,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha,

I love your patch! Perhaps something to improve:

[auto build test WARNING on ext3/for_next]
[also build test WARNING on linus/master v5.5-rc7]
[cannot apply to rw-ubifs/next next-20200122]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/Add-quota-support-to-UBIFS/20200125-175919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-153-g47b6dfef-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/ubifs/super.c:154:43: sparse: sparse: incorrect type in argument 2 (different base types)
>> fs/ubifs/super.c:154:43: sparse:    expected long long [usertype] bytes
>> fs/ubifs/super.c:154:43: sparse:    got restricted __le64 [usertype] size
--
>> fs/ubifs/tnc.c:603:5: sparse: sparse: symbol 'tnc_next' was not declared. Should it be static?
   fs/ubifs/tnc.c:2870:35: sparse: sparse: Using plain integer as NULL pointer

Please review and possibly fold the followup patch.

vim +154 fs/ubifs/super.c

    88	
    89	struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
    90	{
    91		int err;
    92		union ubifs_key key;
    93		struct ubifs_ino_node *ino;
    94		struct ubifs_info *c = sb->s_fs_info;
    95		struct inode *inode;
    96		struct ubifs_inode *ui;
    97	
    98		dbg_gen("inode %lu", inum);
    99	
   100		inode = iget_locked(sb, inum);
   101		if (!inode)
   102			return ERR_PTR(-ENOMEM);
   103		if (!(inode->i_state & I_NEW))
   104			return inode;
   105		ui = ubifs_inode(inode);
   106	
   107		ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
   108		if (!ino) {
   109			err = -ENOMEM;
   110			goto out;
   111		}
   112	
   113		ino_key_init(c, &key, inode->i_ino);
   114	
   115		err = ubifs_tnc_lookup(c, &key, ino);
   116		if (err)
   117			goto out_ino;
   118	
   119		inode->i_flags |= S_NOCMTIME;
   120	
   121		if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
   122			inode->i_flags |= S_NOATIME;
   123	
   124		set_nlink(inode, le32_to_cpu(ino->nlink));
   125		i_uid_write(inode, le32_to_cpu(ino->uid));
   126		i_gid_write(inode, le32_to_cpu(ino->gid));
   127		inode->i_atime.tv_sec  = (int64_t)le64_to_cpu(ino->atime_sec);
   128		inode->i_atime.tv_nsec = le32_to_cpu(ino->atime_nsec);
   129		inode->i_mtime.tv_sec  = (int64_t)le64_to_cpu(ino->mtime_sec);
   130		inode->i_mtime.tv_nsec = le32_to_cpu(ino->mtime_nsec);
   131		inode->i_ctime.tv_sec  = (int64_t)le64_to_cpu(ino->ctime_sec);
   132		inode->i_ctime.tv_nsec = le32_to_cpu(ino->ctime_nsec);
   133		inode->i_mode = le32_to_cpu(ino->mode);
   134		inode->i_size = le64_to_cpu(ino->size);
   135	
   136		ui->data_len    = le32_to_cpu(ino->data_len);
   137		ui->flags       = le32_to_cpu(ino->flags);
   138		ui->compr_type  = le16_to_cpu(ino->compr_type);
   139		ui->creat_sqnum = le64_to_cpu(ino->creat_sqnum);
   140		ui->xattr_cnt   = le32_to_cpu(ino->xattr_cnt);
   141		ui->xattr_size  = le32_to_cpu(ino->xattr_size);
   142		ui->xattr_names = le32_to_cpu(ino->xattr_names);
   143		ui->synced_i_size = ui->ui_size = inode->i_size;
   144		ui->projid = make_kprojid(&init_user_ns, le32_to_cpu(ino->projid));
   145	
   146		ui->xattr = (ui->flags & UBIFS_XATTR_FL) ? 1 : 0;
   147	
   148		err = validate_inode(c, inode);
   149		if (err)
   150			goto out_invalid;
   151	
   152		switch (inode->i_mode & S_IFMT) {
   153		case S_IFREG:
 > 154			inode_set_bytes(inode, ino->size);
   155			inode->i_mapping->a_ops = &ubifs_file_address_operations;
   156			inode->i_op = &ubifs_file_inode_operations;
   157			inode->i_fop = &ubifs_file_operations;
   158			if (ui->xattr) {
   159				ui->data = kmalloc(ui->data_len + 1, GFP_NOFS);
   160				if (!ui->data) {
   161					err = -ENOMEM;
   162					goto out_ino;
   163				}
   164				memcpy(ui->data, ino->data, ui->data_len);
   165				((char *)ui->data)[ui->data_len] = '\0';
   166			} else if (ui->data_len != 0) {
   167				err = 10;
   168				goto out_invalid;
   169			}
   170			break;
   171		case S_IFDIR:
   172			inode->i_op  = &ubifs_dir_inode_operations;
   173			inode->i_fop = &ubifs_dir_operations;
   174			if (ui->data_len != 0) {
   175				err = 11;
   176				goto out_invalid;
   177			}
   178			break;
   179		case S_IFLNK:
   180			inode->i_op = &ubifs_symlink_inode_operations;
   181			if (ui->data_len <= 0 || ui->data_len > UBIFS_MAX_INO_DATA) {
   182				err = 12;
   183				goto out_invalid;
   184			}
   185			ui->data = kmalloc(ui->data_len + 1, GFP_NOFS);
   186			if (!ui->data) {
   187				err = -ENOMEM;
   188				goto out_ino;
   189			}
   190			memcpy(ui->data, ino->data, ui->data_len);
   191			((char *)ui->data)[ui->data_len] = '\0';
   192			break;
   193		case S_IFBLK:
   194		case S_IFCHR:
   195		{
   196			dev_t rdev;
   197			union ubifs_dev_desc *dev;
   198	
   199			ui->data = kmalloc(sizeof(union ubifs_dev_desc), GFP_NOFS);
   200			if (!ui->data) {
   201				err = -ENOMEM;
   202				goto out_ino;
   203			}
   204	
   205			dev = (union ubifs_dev_desc *)ino->data;
   206			if (ui->data_len == sizeof(dev->new))
   207				rdev = new_decode_dev(le32_to_cpu(dev->new));
   208			else if (ui->data_len == sizeof(dev->huge))
   209				rdev = huge_decode_dev(le64_to_cpu(dev->huge));
   210			else {
   211				err = 13;
   212				goto out_invalid;
   213			}
   214			memcpy(ui->data, ino->data, ui->data_len);
   215			inode->i_op = &ubifs_file_inode_operations;
   216			init_special_inode(inode, inode->i_mode, rdev);
   217			break;
   218		}
   219		case S_IFSOCK:
   220		case S_IFIFO:
   221			inode->i_op = &ubifs_file_inode_operations;
   222			init_special_inode(inode, inode->i_mode, 0);
   223			if (ui->data_len != 0) {
   224				err = 14;
   225				goto out_invalid;
   226			}
   227			break;
   228		default:
   229			err = 15;
   230			goto out_invalid;
   231		}
   232	
   233		kfree(ino);
   234		ubifs_set_inode_flags(inode);
   235		unlock_new_inode(inode);
   236		return inode;
   237	
   238	out_invalid:
   239		ubifs_err(c, "inode %lu validation failed, error %d", inode->i_ino, err);
   240		ubifs_dump_node(c, ino);
   241		ubifs_dump_inode(c, inode);
   242		err = -EINVAL;
   243	out_ino:
   244		kfree(ino);
   245	out:
   246		ubifs_err(c, "failed to read inode %lu, error %d", inode->i_ino, err);
   247		iget_failed(inode);
   248		return ERR_PTR(err);
   249	}
   250	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
