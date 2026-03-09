Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A1AF41807
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4+fp4QSBb7o0znw+8p87fetwJOB71Ri64L3ioPErrA=; b=JVI8nCWbqLFG1s
	eulrdRsi+xfmbJqMw/7kAyiTkLz57D1ovgW0fJqaoEkVF+s+YyQS9f5J5/d2xaH92o6ojFMH+3C5/
	LLEVZrWGWumH5P/KYuoinkwn+XlP2FXAoAw2X/DhsluThqrhM/skf0UcghWI8MyQgYUzY58CV24vt
	YsMR+dbkWDxB9mz9qCmBvBW+FuqkMMSulc104866sxxF5K+Yw58hj9tYEBr3RdZRJJYdeKNoK6oFy
	cMdZEJrqDV25GcnrLHq2WK6DOC2z/xPGPSNLHKmyrKoDfzlK3Fil3TCDM7OrIV4NsjztTPpI3arMn
	/NmaYFdDdeCVZRSrCAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcno-00000007dc6-0wVI;
	Mon, 09 Mar 2026 15:45:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcnl-00000007dZ9-2z5l
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773071149; x=1804607149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCt8TwEoX6RUjX3Ol5H8E1fQFJJiWpMnctAnEqxheAo=;
  b=edJBmpFB3843wYo/2cNgVuKvHoj+CWbWtnMLkJdlDHM6ZmTWI2nOQOpx
   3BIx4R+kmH3N3wKQ3DzSN1ePCQ/fv+dGwclb/c6txXNKzqYIjyJdg9kjO
   EZ+mBR83OzSddwCGoM8fVZTJ+OHVu3xEkBTyUkicaiPA5VE0wY0yEOR0a
   e9ZRJw5WxQyEpX7hC4WgqSsTIuWnOoAbvp62sd1buEM4qG/rLMVsrw5z5
   ljwTpjrSeSvzPe7arKf4m2zlV/46cVq/Su3z5117BNoBtkjt3RRWSiw85
   Z/+BXZIkGHW4pCe6oF94ChY3JzVxVdfGhjNKJP/ud7NcCq+yzHGlz5VlX
   Q==;
X-CSE-ConnectionGUID: 9HGDkY2dQGCb12xHabE90g==
X-CSE-MsgGUID: hlSmugQhSnmW9dGNGaQY3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84425209"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84425209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 08:45:45 -0700
X-CSE-ConnectionGUID: OMDR4XcbRTSxWzhtRo1HIw==
X-CSE-MsgGUID: rFUv7x1wQnqy+hBWujFnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218939094"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Mar 2026 08:45:38 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzcnV-000000000Rw-12zd;
	Mon, 09 Mar 2026 15:45:33 +0000
Date: Mon, 9 Mar 2026 23:44:44 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sungwoo Kim <iam@sung-woo.kim>, Chao Shi <cshi008@fiu.edu>,
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in
 nvme_setup_descriptor_pools()
Message-ID: <202603092305.jcWVkoXK-lkp@intel.com>
References: <20260309062840.2937858-2-iam@sung-woo.kim>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309062840.2937858-2-iam@sung-woo.kim>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_084549_801350_C353E3EB 
X-CRM114-Status: GOOD (  13.10  )
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
[also build test ERROR on device-mapper-dm/for-next linus/master v7.0-rc3 next-20260306]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sungwoo-Kim/blk-mq-nvme-Fix-general-protection-fault-in-nvme_setup_descriptor_pools/20260309-143107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260309062840.2937858-2-iam%40sung-woo.kim
patch subject: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
config: x86_64-randconfig-074-20260309 (https://download.01.org/0day-ci/archive/20260309/202603092305.jcWVkoXK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603092305.jcWVkoXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603092305.jcWVkoXK-lkp@intel.com/

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
   found fn item `unsafe extern "C" fn(_, _, _, u32) -> _ {OperationsVTable::<T>::init_request_callback}`
   help: the type constructed contains `unsafe extern "C" fn(*mut blk_mq_tag_set, *mut bindings::request, u32, u32) -> i32 {OperationsVTable::<T>::init_request_callback}` due to the type of the argument passed
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
