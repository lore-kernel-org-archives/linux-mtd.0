Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4F4C7EE2C
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 23:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfHMsQW8uBlW34ssiz+tZQTxbpdlVfPUxh/IeLOAgSE=; b=0eDcE7qhbq9fbR
	1OyOFgWV+Hgbgjte1XslDCNC89R0NTssh5GCtNmMc8k+Aw/ntX72pjbA/dU2oUSucv9Yy7C2vEaRE
	Y7qUn7zteQR2EH+YMdnUwYlwzZxPid22x4EZ9cAhHiDgELCQKAGGJkVbFc2COPZhxHOuJ2RLzK93U
	CYjuSiMyODgoIhC0197hj5rLDW6WyVF+0VXorK7vxHYNdB5EA69N1WrieN+ayLLbambkGO9bpVoV+
	QMKjGR8hFdN0a2Xf1rucbTi1NgzUvFeCy/LG7zrtSJDPGzR0yiksXfJihciQQiT8Aut+56K7bySFo
	E/FTIEUV5EFll3UJCp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Jem-00H8nn-2o;
	Mon, 05 Jun 2023 23:30:36 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Jej-00H8md-27
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jun 2023 23:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686007833; x=1717543833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQ/YmNHaOqxHB3zFE5Dw/U8hbSjvEZuD9JaXPGLULFQ=;
  b=fjiEdZa+BtXKJ8VDe+bFOsm3UJY7LUWVWEctdy0eXkjmm0VVkI/bI9Mi
   XFXJZbR6wx8Uv8x/RnL929IuOfVuSmGMF2wToQ+bVDi49dNMoKJc2kLo0
   o33kMX0IubkCMZyCTHUM2VmMvDASEpMeWGni4TGQUrsCHaO04X4f5GItl
   AW31Xxq+481UoAyps9Oc/2qp+O7vJRlLF2/vP1SoQq2+bvOrRIIeWY/C0
   DNzWotzaLN70Fz60Vk/RLKwZz/Zt+XcMhUVEe/81apCf79pnlXICxE/7m
   ifIZWMC2/rFWQ2Xgwsu7Og8TLjql/Y3ttHaM0NixGbj8EUMxYL6aNNLdD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359826345"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="359826345"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738531797"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738531797"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 16:30:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Jeg-0004Xx-1a;
	Mon, 05 Jun 2023 23:30:30 +0000
Date: Tue, 6 Jun 2023 07:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Message-ID: <202306060727.jUL92Co4-lkp@intel.com>
References: <20230605165029.2908304-5-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605165029.2908304-5-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_163033_759992_652650CF 
X-CRM114-Status: GOOD (  12.44  )
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
config: i386-randconfig-i001-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060727.jUL92Co4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060727.jUL92Co4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/file.c:905:15: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int err = 0, i, blen;
                        ^
   1 warning generated.


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
