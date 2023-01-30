Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81C9C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD8SloFystyTsbyb7cchkIL2bpEyLqzLilynvF4IJ48=; b=nbXhIQ9SQIZ/jg
	XD7PfDKyat0NGc3NDNwJmlavfLSLLitWokyy7u9q0hFeQdv7XUeHugRvPrjtPnV48nLFveA321/rb
	gUPbE+6MTTwaKKSExsuozYEG2USeDx6FeOmxsbj1PMOfz8QA/KbcdKU68b2VKMeabxsWqz0Y87QpX
	dtmub4kWOOmcLam8XlPBrCwPpBwrnEqv6M8+ew0mV8gns0sdxdd+dFxJL/vWlR+EccgJirG25O683
	FBwWr0KYfO4BAwSZ6/UmH7MlDjXBL43uvZcZ49LqmUTadDBi0ys+cRYPBMsh4QmvE+0TGXie2x9fo
	VWhi8Yi73Wp1nic62W8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXRW-004KLE-OL; Mon, 30 Jan 2023 16:55:42 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXQf-004KB3-HA; Mon, 30 Jan 2023 16:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675097689; x=1706633689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F1ULbSw1MBsHWcGX+HC4GSetpggTnGdsHsr0Ru7tKp4=;
  b=nMFM730HXecM27ePAg7HgnpjmmqH848cWoLL8E+o93W8UeaK0NV7Oz0C
   g2vfT9DT479Vp/b/YAYwlTIzO/Mu+fxgzUqg7o9nMVm5EEQ1cRDFPDhcg
   VvWWJdSccW6HlDVmmnOZOqwPyehP5sbWsl/xD0XPWAnWffpHVdw3IN6bo
   m10vvtV2ttoWzSD86BOOizVkvGHf6xn8QWqatCHBjzS69fjmq5tOGlhWo
   ipJU+xuOp4nYaWv6QOigam+mHVj2ItD1NCUIp4ikr3QgZIbvf+7PwBex2
   7iS/tzaekwFexfjRPdttHdCRG8dmleXXQKmb5G9Gqefs2rnLqcJwdEkD1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329715481"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="329715481"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 08:29:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="772570775"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="772570775"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2023 08:29:08 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMX1o-0003kE-0N;
	Mon, 30 Jan 2023 16:29:08 +0000
Date: Tue, 31 Jan 2023 00:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chuanhong Guo <gch981213@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com
Subject: Re: [RESEND PATCH v5 07/10] dt-bindings: mtd: Split ECC engine with
 rawnand controller
Message-ID: <202301310056.ZF1Yst4B-lkp@intel.com>
References: <20230130030656.12127-8-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130030656.12127-8-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_085449_650597_C52148BA 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Xiangsheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next mtd/mtd/next mtd/mtd/fixes linus/master v6.2-rc6 next-20230130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiangsheng-Hou/spi-mtk-snfi-Change-default-page-format-to-setup-default-setting/20230130-111021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230130030656.12127-8-xiangsheng.hou%40mediatek.com
patch subject: [RESEND PATCH v5 07/10] dt-bindings: mtd: Split ECC engine with rawnand controller
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/f3a5f8d573b8be1d7a10224f0e10a699d9a0ea09
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiangsheng-Hou/spi-mtk-snfi-Change-default-page-format-to-setup-default-setting/20230130-111021
        git checkout f3a5f8d573b8be1d7a10224f0e10a699d9a0ea09
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/mtk-nand.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
