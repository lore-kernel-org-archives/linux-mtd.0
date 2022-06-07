Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BFFC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 06:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nWt2BC74T95gQF/+vFMh6ZPLsnJ8i8ciqh1Gxq5NmQ=; b=vLJb6xnOEeOtFV
	y8Q5ThDbSDN99wNQ9905cwQAN4jJ/+YFgfhF++4+d86nxxy2M8Jka83OdwVZVB6cjAloN6hsn1/4o
	09YBcI7kTW21zIPesqqaIsif2gKompSme/zWFAlbvfZoSo/qFwcOB2Gum2ptL9JufRqr+MqbHeNeO
	OZDk+McJXtY8YYrA2CFVLb1phmlQ6TzMewbXSWJXPQn7LGhhwZh6t+RJddybmvkkipq5hyLcZ5M0+
	i4dD6DMqr4Rk+sjGVB7d5bL3jY5mxD08JnP1W+7q+PCXDTJaLWsozlvpyWEfyhRdr64EVu22JbPCV
	h4ehHQt22S6q4VqAZnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySTU-004xXP-Cg; Tue, 07 Jun 2022 06:13:56 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nySTQ-004xTr-Fi
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 06:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654582432; x=1686118432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pViZck3K1Rq0vF4B9iREn005L3q1DYrrwNaeY+v9f0c=;
  b=WH2PtcOU8CDhMxpWtKLdXVQI9fU7HSSFMUffl7d/O5+1CKU3xeVRx2LP
   u8//J6iso4o8ntIXzSi616Qjd/Dd0Ck1mGyVxDKnHzzpVwOjWVNXkjl0b
   lTu8lj5mzsTIieyKIzVxu+CJVNZ0UlalUKcwOG7cdHSQnJWTf/rMPTWWp
   o60XTpJbo6HTHB2lnt49bLlhIrqppt0oEFGjwPJOyICmtklQqKUiCGlJl
   JRibW6rXXOgnXtpScxgZ7FCiP0NYyKdVaXr+7N98JzFulq2JEQ72bn1Cs
   Yij7tRtNZBAdjqx20R3q+roo40Pb2Qx3oj9Hxj5UXtQwuyVHFsTm0CjzE
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275483830"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="275483830"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 23:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="614746862"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jun 2022 23:13:44 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nySTI-000DQ5-17;
	Tue, 07 Jun 2022 06:13:44 +0000
Date: Tue, 7 Jun 2022 14:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org
Cc: kbuild-all@lists.01.org,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 14/20] hugetlb: Convert to migrate_folio
Message-ID: <202206071414.41wGG8fp-lkp@intel.com>
References: <20220606204050.2625949-15-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606204050.2625949-15-willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_231352_576375_3408B44A 
X-CRM114-Status: GOOD (  13.76  )
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

Hi "Matthew,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc1 next-20220607]
[cannot apply to jaegeuk-f2fs/dev-test trondmy-nfs/linux-next kdave/for-next xfs-linux/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f2906aa863381afb0015a9eb7fefad885d4e5a56
config: ia64-randconfig-r015-20220605 (https://download.01.org/0day-ci/archive/20220607/202206071414.41wGG8fp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b038962c9c8c2ab77c71dfba24356ce24bd7a242
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220607-044509
        git checkout b038962c9c8c2ab77c71dfba24356ce24bd7a242
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash fs/hugetlbfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/hugetlbfs/inode.c: In function 'hugetlbfs_migrate_folio':
>> fs/hugetlbfs/inode.c:990:17: error: implicit declaration of function 'folio_migrate_copy' [-Werror=implicit-function-declaration]
     990 |                 folio_migrate_copy(dst, src);
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/hugetlbfs/inode.c:992:17: error: implicit declaration of function 'folio_migrate_flags'; did you mean 'folio_mapping_flags'? [-Werror=implicit-function-declaration]
     992 |                 folio_migrate_flags(dst, src);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 folio_mapping_flags
   cc1: some warnings being treated as errors


vim +/folio_migrate_copy +990 fs/hugetlbfs/inode.c

   972	
   973	static int hugetlbfs_migrate_folio(struct address_space *mapping,
   974					struct folio *dst, struct folio *src,
   975					enum migrate_mode mode)
   976	{
   977		int rc;
   978	
   979		rc = migrate_huge_page_move_mapping(mapping, dst, src);
   980		if (rc != MIGRATEPAGE_SUCCESS)
   981			return rc;
   982	
   983		if (hugetlb_page_subpool(&src->page)) {
   984			hugetlb_set_page_subpool(&dst->page,
   985						hugetlb_page_subpool(&src->page));
   986			hugetlb_set_page_subpool(&src->page, NULL);
   987		}
   988	
   989		if (mode != MIGRATE_SYNC_NO_COPY)
 > 990			folio_migrate_copy(dst, src);
   991		else
 > 992			folio_migrate_flags(dst, src);
   993	
   994		return MIGRATEPAGE_SUCCESS;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
