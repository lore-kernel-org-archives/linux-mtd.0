Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1B6C3DA6E
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 12:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggX12xIYtJBIJt7ZxkYjEgxGWNuwVk4yl1+8ZliR4R4=; b=rdhu1eNl/VBbfF
	jcpYetQRXttdZ0MuUKYSbGw+393HLeYZDLp1euZblMbR7doKE9zckoy0uTin8ZMM5LD8s/6TOmwIi
	w85+yYaNXkzKEp8m8sV6vLMb//x46b5Y75L8pL36NdS9sYEthR1l1ts8h8vw0w9aMC8CRN+cYyNcc
	HGS9Xb5+mkitrJdLkoQJDudyNFLKtOUyfjSGArbQMDToF4r1YybtHUisJBH9bx2pgdXkEQriVnIT8
	bq6Y0mz+H22XDFh2v9H+N1szbXSQxB0ecMFRRjAvic+SZ54T2jk4ahPN45SozzhV63mwA3U8KYod2
	I2nOQC4+/RCRk7pjJgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqA3-007mKr-1M;
	Sun, 17 Dec 2023 12:22:23 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEq9z-007mJh-1a
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 12:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702815739; x=1734351739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3VPDevcHr+8gDV3iqHESEh3dFF+a8DIUxapocq9Arvo=;
  b=I205a+iQVFx1gzcyIV97rA8ZSSUKLMIUOixCd4ySLj2JL0b4Qllf5nvA
   dYcs928Hsat1ZDNa+LVTJuWaJSHNtLG2Gc9l6K4qhat0W8odG8LBcvmeU
   OFROe2KkFFqbrB7DCHAwdvzZlSq9je5/7UULDXEDwyi55EAwL+5tNRrsQ
   jmUs1VK4q0DcIuBAK+eVw1AUN4Cay/nzVmfb3qToV7NJxMAF2OsiFYhmX
   n2v9t0qThntX/1vgMC0b54qM5R23puTX+6QX9u4RGK2DQaSVwjExUPeEq
   SWTA9hOyWD8cXUnOKdx3/EVj6z5kU9tOBeSgazTaAXKVDslO9W/K7bG9e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2239073"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2239073"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 04:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768539606"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="768539606"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Dec 2023 04:22:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEq9m-00031t-1a;
	Sun, 17 Dec 2023 12:22:06 +0000
Date: Sun, 17 Dec 2023 20:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: add basic bindings for UBI
Message-ID: <202312172000.EiNsnuy9-lkp@intel.com>
References: <a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_042219_729926_41B96ABF 
X-CRM114-Status: GOOD (  11.48  )
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

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/mtd/next]
[also build test WARNING on mtd/mtd/fixes robh/for-next linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-mtd-add-basic-bindings-for-UBI/20231217-081328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel%40makrotopia.org
patch subject: [PATCH v5 1/7] dt-bindings: mtd: add basic bindings for UBI
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231217/202312172000.EiNsnuy9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172000.EiNsnuy9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

vim +18 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml

     8	
     9	description: |
    10	  This binding describes a single UBI volume. Volumes can be matches either
    11	  by their ID or their name, or both.
    12	
    13	maintainers:
    14	  - Daniel Golle <daniel@makrotopia.org>
    15	
    16	properties:
    17	  volid:
  > 18	    $ref: "/schemas/types.yaml#/definitions/uint32"
    19	    description:
    20	      Match UBI volume ID
    21	
    22	  volname:
    23	    $ref: "/schemas/types.yaml#/definitions/string"
    24	    description:
    25	      Match UBI volume ID
    26	
    27	anyOf:
    28	  - required:
  > 29	    - volid
    30	
    31	  - required:
    32	    - volname
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
