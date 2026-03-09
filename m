Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CBEF371A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEw645dYGGVIWMhxpUVmJ8L+98o6MBgzYcsmdR/B+eg=; b=paUitxA8ct+g8s
	PDiYZyIO2YmIFIkHNayzNWdFAhsKFA3cx38+19XX6Qcsw9K/hYDF46fBsSFteAnPSrU8o2/IeS3Cg
	Y2Vmuuy/kfWbXeS5fJF9u+XEWzUQSNcSzpPNgok0IYnCoMaCqIBWdrYxPYINPqRSuVZFstSY1O9x2
	sk/NmDGDw3Oa0q3NGr+3w5XP3TfkRPpnFmNr5v+orzwJOTw9iE/srNnrMmPaN6qEEVOuXbPKMP+Mf
	UzOgQsimsXKSJyia+cA2bvC3azGoJrVNI3cJRnuudAhPsRs5eMppAH8G4ss4xXEXH1apUpUX5T9Wo
	Q/S6uXOuO+DIeZthqwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWBN-00000006tf2-3BFN;
	Mon, 09 Mar 2026 08:41:45 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWBI-00000006tds-05dD
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 08:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773045700; x=1804581700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JBpXZptTSUunAq5dyKc9na25R/vc1bFHXrI3d81DJiI=;
  b=cU93JOvwpqUivSwSw/Cw9znp1CfXu/D7b4zj8RCFfOTsbl3DC0bm10h1
   Iy+pbud7hy8EagIZ8LRhdnkmYSPjYvH0lD1OrlfpreTFs1MNEy3b6F1IS
   UjKmZt7MMCNWMhUyzae7kS3TzIdEWicBCgjWBTHGTk4VkDZrcPtfmiEq4
   dSXW7GpiU2UzwwAMWOoB1I07MjnUUJWKnYch/ApExtHHr+5Qxc/v4Jv8d
   Jo4YwFFIrG6wKo81AFld1UFlEQ5ckiCGz/qZA64E1ILVpqcILaAlhORia
   6Dgex/1Wcw67AxFW6or4VlH7lE/DWL8CFj1m+qhApYq2dj5tNqFes3il/
   w==;
X-CSE-ConnectionGUID: 0HxuqcL1SNyLWiOnoLOmHQ==
X-CSE-MsgGUID: 4RzQZHKaT26fAawPnv3gwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74141572"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74141572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 01:41:35 -0700
X-CSE-ConnectionGUID: QnlBDgkcTaOqYfPdIBMwrg==
X-CSE-MsgGUID: As52cKYSQV+Zc4xb5wE3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219661399"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2026 01:41:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzWB3-000000002pl-2K7j;
	Mon, 09 Mar 2026 08:41:25 +0000
Date: Mon, 9 Mar 2026 09:40:41 +0100
From: kernel test robot <lkp@intel.com>
To: Sungwoo Kim <iam@sung-woo.kim>, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Sungwoo Kim <iam@sung-woo.kim>,
	Chao Shi <cshi008@fiu.edu>, Weidong Zhu <weizhu@fiu.edu>,
	Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in
 nvme_setup_descriptor_pools()
Message-ID: <202603090911.0DdOwjTR-lkp@intel.com>
References: <20260309062840.2937858-2-iam@sung-woo.kim>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309062840.2937858-2-iam@sung-woo.kim>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_014140_074648_92159B41 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Sungwoo,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on device-mapper-dm/for-next linus/master v6.16-rc1 next-20260306]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-mq-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/20260309-143107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%40sung-woo.kim
patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260309/202603090911.0DdOwjTR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090911.0DdOwjTR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090911.0DdOwjTR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/block/mq/operations.rs:274:28
   |
   274 |         init_request: Some(Self::init_request_callback),
   |                       ---- ^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected fn pointer, found fn item
   |                       |
   |                       arguments to this enum variant are incorrect
   |
   = note: expected fn pointer `unsafe extern "C" fn(_, _, _, i32) -> _`
   found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {block::mq::operations::OperationsVTable::<T>::init_request_callback}`
   help: the type constructed contains `unsafe extern "C" fn(*mut bindings::blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {block::mq::operations::OperationsVTable::<T>::init_request_callback}` due to the type of the argument passed
   --> rust/kernel/block/mq/operations.rs:274:23
   |
   274 |         init_request: Some(Self::init_request_callback),
   |                       ^^^^^---------------------------^
   |                            |
   |                            this argument influences the type of `Some`
   note: tuple variant defined here
   --> /opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:597:5
   |
   597 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
   |     ^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
