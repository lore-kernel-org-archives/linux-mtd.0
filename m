Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998CBC77B73
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYlvMLTocTZ5HcOCJUY/8ObYAuUb7mtoQZpB7zmItRU=; b=gIuAUf9mSg6xbX
	4xtu9LMRyDuy5oxc4bjt0i33HBkpXVeowOK8FIoGx3sEOKKiguieQepMz9BGgmvtRHql4drzqKVX9
	80GVk3BU2U0ywGzkSMezCUZFWYGU1/+wk6Y+luiBU3PGf6KYcd/ui8hD9qErd8mWF3XsGgMaYs/+2
	CG5+ZH5DbM/xt7r+saVwRGAo1hxoMgl0ole9FBCHwc7fZ4jUmEGo/5kE46qcZgEA39suy82RSoIqR
	8HGzlviaZYqPKyrhjhExAYHrFE30GITcBNYpykf5DFtL3mvgmdKh076acU54jI4i1+w8EOFN6YYhV
	Yi0l6FUNviu6rXJviehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6FsV-00GYW6-08;
	Mon, 05 Jun 2023 19:28:31 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6FsS-00GYVO-1d
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 19:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685993308; x=1717529308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+E/ryB6l8eVa08SLESYHnQdAnmgDaNrC9EP5jVhlhcQ=;
  b=hkFmlskp8IcOMVqEcgDoQrNTvaVqYAW+Vr49LgwWnp2LFKlpFmOK86L5
   rRitU2vHb2gz+h4lJnmYZgq6y5ojvzMgVjZaIL0m3PfOBKM6AHEnItnra
   XISfxhiMycrBdpcydqYz0LPdvlb+1Glfrz7ZVVb3iTWeUq2vkG9+VjRt9
   ZGUlWH8w+RHeHP7OZvFk/ZkDy/PCLM/ENghm2BUBgiacYMPE7OYHZqnAO
   fg2PmS+XASyFKDSDe7KfeJmdUw2+v3bSvkX5UIHg2EZdrnoUxkgOR9iLk
   wFD2PK9IkmeefpZ3erU9aDBLeLAuDv7NZwHUZQLecnSbpSiraJn7wDFj7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422288302"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="422288302"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 12:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="1038887603"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="1038887603"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2023 12:28:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6FsK-0004O9-2d;
	Mon, 05 Jun 2023 19:28:20 +0000
Date: Tue, 6 Jun 2023 03:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Message-ID: <202306060302.sCFYZsJ5-lkp@intel.com>
References: <20230605165029.2908304-5-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605165029.2908304-5-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_122828_620278_9552B341 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rw-ubifs/next]
[also build test WARNING on linus/master v6.4-rc5 next-20230605]
[cannot apply to rw-ubifs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/ubifs-Convert-from-writepage-to-writepages/20230606-005309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
patch link:    https://lore.kernel.org/r/20230605165029.2908304-5-willy%40infradead.org
patch subject: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230606/202306060302.sCFYZsJ5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4f6ac0962f61cc07c95177f78cf1f3b03e79d822
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/ubifs-Convert-from-writepage-to-writepages/20230606-005309
        git checkout 4f6ac0962f61cc07c95177f78cf1f3b03e79d822
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060302.sCFYZsJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ubifs/file.c: In function 'do_writepage':
>> fs/ubifs/file.c:905:22: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     905 |         int err = 0, i, blen;
         |                      ^


vim +/i +905 fs/ubifs/file.c

1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  902  
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  903) static int do_writepage(struct folio *folio, size_t len)
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  904  {
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14 @905  	int err = 0, i, blen;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  906  	unsigned int block;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  907  	void *addr;
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  908) 	size_t offset = 0;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  909  	union ubifs_key key;
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  910) 	struct inode *inode = folio->mapping->host;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  911  	struct ubifs_info *c = inode->i_sb->s_fs_info;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  912  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
