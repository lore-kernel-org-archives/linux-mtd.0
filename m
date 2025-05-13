Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A689C3ABC3
	for <linux-mtd@archiver.kernel.org>; Tue, 13 May 2025 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iAnMJwzDAbz4dsJqCxpcIkWbfbwrc/02h/BsxHqJ4M=; b=OCBSF38fwu79wt
	enenkd1NBaM9LaI2yp71ZSsdZwwTb70aQi6VSkdzH33Sq7gGfoMljfTZ6K6KVFKikin+Y0+juO1WM
	3NBOu1j/VtSuDdEAlVk0AdQ6HPwRriQkEtAE+wv1m46k4nAGsLIaj0yF6FhRMleo+rO9S9biF+y2y
	EjPwh6iHAXQSlcFaeqlOcY8nJpylW6DxQjyD9KD1b61KKuFbPlETMZl8E1iwJ7UgRueaHiLjVPw8M
	HjHR3HYZkMgDhovCiyiIhNB3j4Gv+M07lyyih7nHpL8dwii8fBKrDAaVprnHaajCfeBeXdZpVLWrw
	SFK8BNFMWMZSdoL7IDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuvW-0000000DK27-0Xy9;
	Tue, 13 May 2025 19:04:30 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuPz-0000000DFBb-17Yp
	for linux-mtd@lists.infradead.org;
	Tue, 13 May 2025 18:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747161115; x=1778697115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rJBPnA8TGJX13YRuwqtzueA/mnw6MbJxj6hqdWnIYwM=;
  b=gvALXJtcFT+SvWrBwreSHB4Uwm+23a0T8Ard4R0egCH3KKGAWLeYlO+x
   HHEuxmLA0CM9kXgs5xQ8sb7zUaNzaDtwIbZNQbHzwNL+x+QnN7sB5jGKv
   9LMOz/+jAzaYSg8LR4kdNte9JwijAA7d/FHtysbKuPKs881odrUi/ttm0
   Q3FP8KzT/nm5SJ8R6Mw079qemP10V/qhMrgeOf31AtXqyH8NEpDpCkvkw
   hlZQ6j7qTXYIvNM9tJrLsG/jFCxfko7wM684VFDws00mki5Oifs2qwX3f
   E5nwLB1U4nLhjyJOA7ITU69OvZZuBQiJCQNQUi4yeWj3V5HwPnSc4YisP
   A==;
X-CSE-ConnectionGUID: 2yKTXjONRSmau47XMd5m7A==
X-CSE-MsgGUID: n/pDYU/qRNGYmKfP9lni9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66576695"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="66576695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:31:51 -0700
X-CSE-ConnectionGUID: soHmn7MdRkaAicAsiKNdeQ==
X-CSE-MsgGUID: zayVSekKTGOUlzo1T/zQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="141831324"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2025 11:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEuPq-000GJH-0W;
	Tue, 13 May 2025 18:31:46 +0000
Date: Wed, 14 May 2025 02:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	dregan@broadcom.com, florian.fainelli@broadcom.com,
	computersforpeace@gmail.com, kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
	dgcbueu@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
Message-ID: <202505140147.koX7Q1tn-lkp@intel.com>
References: <20250513061052.547392-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513061052.547392-1-noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_113155_353854_9AE509C0 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi =C1lvaro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on linus/master v6.15-rc6 next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lvaro-Fern-ndez-Roja=
s/mtd-rawnand-brcmnand-remove-unused-parameters/20250513-141316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/=
next
patch link:    https://lore.kernel.org/r/20250513061052.547392-1-noltari%40=
gmail.com
patch subject: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
config: arc-randconfig-002-20250514 (https://download.01.org/0day-ci/archiv=
e/20250514/202505140147.koX7Q1tn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250514/202505140147.koX7Q1tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140147.koX7Q1tn-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/nand/raw/brcmnand/brcmnand.c: In function 'brcmnand_read_pag=
e':
>> drivers/mtd/nand/raw/brcmnand/brcmnand.c:2233:31: warning: unused variab=
le 'host' [-Wunused-variable]
    2233 |         struct brcmnand_host *host =3D nand_get_controller_data(=
chip);
         |                               ^~~~
   drivers/mtd/nand/raw/brcmnand/brcmnand.c: In function 'brcmnand_write_pa=
ge':
   drivers/mtd/nand/raw/brcmnand/brcmnand.c:2359:31: warning: unused variab=
le 'host' [-Wunused-variable]
    2359 |         struct brcmnand_host *host =3D nand_get_controller_data(=
chip);
         |                               ^~~~


vim +/host +2233 drivers/mtd/nand/raw/brcmnand/brcmnand.c

27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2228  =

b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon    =
    2018-09-06  2229  static int brcmnand_read_page(struct nand_chip *chip,=
 uint8_t *buf,
b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon    =
    2018-09-06  2230  			      int oob_required, int page)
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2231  {
b976168757f7f4 drivers/mtd/nand/raw/brcmnand/brcmnand.c Boris Brezillon    =
    2018-09-06  2232  	struct mtd_info *mtd =3D nand_to_mtd(chip);
d699ed250c0738 drivers/mtd/nand/brcmnand/brcmnand.c     Boris Brezillon    =
    2015-12-10 @2233  	struct brcmnand_host *host =3D nand_get_controller_d=
ata(chip);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2234  	u8 *oob =3D oob_required ? (u8 *)chip->oob_poi : NUL=
L;
3c8260ce766342 drivers/mtd/nand/raw/brcmnand/brcmnand.c David Regan        =
    2023-11-24  2235  	u64 addr =3D (u64)page << chip->page_shift;
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2236  =

898f67d076dde5 drivers/mtd/nand/raw/brcmnand/brcmnand.c =C1lvaro Fern=E1nde=
z Rojas 2025-05-13  2237  	return brcmnand_read(mtd, chip, addr, mtd->write=
size >> FC_SHIFT,
898f67d076dde5 drivers/mtd/nand/raw/brcmnand/brcmnand.c =C1lvaro Fern=E1nde=
z Rojas 2025-05-13  2238  			     (u32 *)buf, oob);
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2239  }
27c5b17cd1b105 drivers/mtd/nand/brcmnand/brcmnand.c     Brian Norris       =
    2015-03-06  2240  =


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
