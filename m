Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F84AC77B75
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 03:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9kkM4Rb6Sqww69BF6I6JvuBsLURzIOlL+TVmKcMgdM=; b=vuQVgCQyUO10Nq
	+wns5FW873Sq8CE4kZk5GVTF5PWsOqgXljQrxRjgtzxcrtlKFNIg8GNFBDqBgCAe5hJakZAYV3TgZ
	TeAUJf0LbfeZl5cuSt43rUulTXUSDxxw++FEmz/jKFqAtVjLR8Rt82A5nESpckNvUDcNz4Wbr8Yp/
	QRWPbfbT9aA+2wgVJpnbuV1FGBVHkIIOAP3GNbIs7UkP5MvS2+x7IijognGZ1dl7NiL1lbbY+j+Q5
	Tcd1HqpnUxGc9TqpDHRvt4ThLf/F5giSyiLt6jK3HJSyn6O8MRQuyUq2HLyRn7KXSoLrX6Nwf568G
	sO/XPKRPV1YSIRe8kuKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKcp-006vW3-2N;
	Thu, 20 Apr 2023 03:06:23 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKck-006vVU-2P
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 03:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681959977; x=1713495977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vrqpja8Z1hSqrZRC7tQPIr/La29qW5DFqZCbyUZi4Kk=;
  b=f5EbLBArDfNQHBagH96q5JVnHOtxGsKe+I9WTMlzM8J2b2ewa+UZQoKK
   2Gqe4+FhKPKANpG//k9ZNXEEOQiytiMfbFlg0UJ/msHWMhGVfJomLh73I
   zDFkoE2pPuFftkOYXbg9jyKGTI2XX3nI+g9D6JY+y56Q64TPb0EdjEzei
   PoFZ7cEHmu2gB9VNnmQAPNSNlAAVZndHQZuw2/nxv5XfYCPY2KFcLxbfl
   gUI4nsOTc8iUXT192w2DFpn4qOJdsqP4usoeDhgNyagaS/BMVOrqVX16p
   LIPFv2kT0vJP/Th44jK/HAI4pohXLVrPUsT8KOGloOQ8bQjXOI4mIp3w6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431896674"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="431896674"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760978836"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="760978836"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 20:06:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppKcf-000fPU-0A;
	Thu, 20 Apr 2023 03:06:13 +0000
Date: Thu, 20 Apr 2023 11:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, mani@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_srichara@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH V2] mtd: rawnand: qcom: Implement exec_op()
Message-ID: <202304201013.6bradWxp-lkp@intel.com>
References: <20230419093617.27134-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419093617.27134-1-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_200618_839626_4E23E681 
X-CRM114-Status: GOOD (  13.45  )
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

Hi Md,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.3-rc7 next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/mtd-rawnand-qcom-Implement-exec_op/20230419-173849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/20230419093617.27134-1-quic_mdalam%40quicinc.com
patch subject: [PATCH V2] mtd: rawnand: qcom: Implement exec_op()
config: s390-randconfig-r034-20230418 (https://download.01.org/0day-ci/archive/20230420/202304201013.6bradWxp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a2d1599a63e93bde90166287021663cfc13c91b2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Md-Sadre-Alam/mtd-rawnand-qcom-Implement-exec_op/20230419-173849
        git checkout a2d1599a63e93bde90166287021663cfc13c91b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201013.6bradWxp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/nand/raw/qcom_nandc.c:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/mtd/nand/raw/qcom_nandc.c:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/mtd/nand/raw/qcom_nandc.c:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/qcom_nandc.c:2617:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/mtd/nand/raw/qcom_nandc.c:2617:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   13 warnings generated.


vim +2617 drivers/mtd/nand/raw/qcom_nandc.c

  2587	
  2588	static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
  2589				       struct qcom_op *q_op)
  2590	{
  2591		int ret = 0;
  2592	
  2593		switch (cmd) {
  2594		case NAND_CMD_RESET:
  2595			ret = OP_RESET_DEVICE;
  2596			break;
  2597		case NAND_CMD_READID:
  2598			ret = OP_FETCH_ID;
  2599			break;
  2600		case NAND_CMD_PARAM:
  2601			if (nandc->props->qpic_v2)
  2602				ret = OP_PAGE_READ_ONFI_READ;
  2603			else
  2604				ret = OP_PAGE_READ;
  2605			break;
  2606		case NAND_CMD_ERASE1:
  2607		case NAND_CMD_ERASE2:
  2608			ret = OP_BLOCK_ERASE;
  2609			break;
  2610		case NAND_CMD_STATUS:
  2611			ret = OP_CHECK_STATUS;
  2612			break;
  2613		case NAND_CMD_PAGEPROG:
  2614			ret = OP_PROGRAM_PAGE;
  2615			q_op->flag = NAND_CMD_PAGEPROG;
  2616			nandc->exec_opwrite = true;
> 2617		default:
  2618			break;
  2619		}
  2620	
  2621		return ret;
  2622	}
  2623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
