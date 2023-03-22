Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92940C6FD1C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=6m3GLjRDLXyfSvFzqqW5czVTu6s3/s4xfEbT7qjPP9E=; b=y1+nrygaxftXty
	KjjYdS4fFCu4YuicccjYBpOUVWAxUyE6K5ARzvtnzdzH5OCktn/CEav3rIy3I+knGtbR/FxR5fsrg
	Hay3gahGl/C0hWoihBpMLbL64tzhUBb4I9p2R0uEhRd0q/2NgbmgmW+bBreswQkFVNbW+F6kyNZOh
	3ElKewRmrMqISXejX6eDrOTDm+4mgmrLzUlxpievOvUyJ4MSqP16flV5NuOlmiNRVcsPpN6krICLo
	EL/Qx5aj3znxd34dKI7+TDhDxUNeLtWBnW3Nup9xS4X1wBUOocf/2Xu9nsB/hjb5aqtZUkWu2cdqP
	eZhi3WpH1GbBJPcyhsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0Nf-00GVU9-0B;
	Wed, 22 Mar 2023 15:28:03 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf0Nb-00GVT5-0t
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 15:28:01 +0000
Received: by mail-ed1-x534.google.com with SMTP id h8so74499341ede.8
        for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2023 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679498875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HJ47atBnDcevMrGRcw1g+2ViQEBHvjetn66KKty8N7E=;
        b=LwbUNHS1XYorMeez09Zc//CbWWBSxXuTpmYLAUEZj5y9HUyyrCYvzXUOOdLEACmXFM
         fz629nuIjPa0/S+NcZ8KYfCAtyBpQ7P+nlDNI3TgDFekCP+92JRHvnGggXhhmCcz9T1z
         +fadNuuYB1qnstpnSH3lNCZwFgfpl8CuLztxNP4ErR4uCs0517wG+fNnadFXWl+CigPf
         gEjlo+aQY6p84Ybu3XmKpCQcxdyGmw3asPvCgKy7jFDDxvdZd6SpSNjeCdR8HE3OkJAP
         y55QAA/ThlCEgHJp5+VP/d3b9Y5PaBky3aOfFmURVYZNMm1Hq4Th1oqjBn+uqaQ7LMVS
         hTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679498875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJ47atBnDcevMrGRcw1g+2ViQEBHvjetn66KKty8N7E=;
        b=DKKavfu8PArBatFEinZ1Fa7HCaRSOMx3Epc9sUzecZtTlfqQ1MYXCiKhxUnlVTMr+3
         LPdErTvEr4XSUZ2Ewa1TvJ3tZ9YLdonb1nu2oCcT2YJdROqB9qSiJ2aM5tGxqJ8gPg8f
         GekGKfo+4Jhk8xXSuN4GatMMiDhlHAbUi6UWL2Fik+5pOLlPBz/NdSWhrnUuKLXI4/yw
         GmntM2sORe4SPS5Ylq8uUifYNXzyjFsT/SMdzQllrY6pRM/+3DsNaogPvK2D7k+Sdlvc
         jSbnNgmexMfH630x6BzCojXdFPtImGvIRyw9VboQEGuq+dzOQLHbOU3+U3qBDBIolLCm
         FAAA==
X-Gm-Message-State: AO0yUKUrE6/uO31+ljnk7WF4yckj/3Ub2of5RQ2Oirkuv0MSahNvKFtR
	giNgX7ty7AOgNPu69cUq3sE=
X-Google-Smtp-Source: AK7set8qHxg2ktsv1HU9aTuEOsFLJZ3a4ePGvfomsEXyX5Nr+0ZfBHecAVx51iq390gUmprcop2YUQ==
X-Received: by 2002:a17:906:7d43:b0:92b:e1ff:be4e with SMTP id l3-20020a1709067d4300b0092be1ffbe4emr6898733ejp.1.1679498874793;
        Wed, 22 Mar 2023 08:27:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id lj24-20020a170906f9d800b00932ba722482sm6494166ejb.149.2023.03.22.08.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 08:27:54 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:27:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, ye.xingchen@zte.com.cn,
	miquel.raynal@bootlin.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: =?iso-8859-1?Q?f?=
 =?iso-8859-1?Q?smc=3A_use=A0devm=5Fplatform=5Fioremap=5Fresource=5Fbyname?=
 =?iso-8859-1?B?KCk=?=
Message-ID: <e0254438-9683-4d47-8c4d-a27f2b356f83@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202303211954042531445@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_082759_362270_27960D68 
X-CRM114-Status: GOOD (  11.29  )
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

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-=
cn/mtd-rawnand-fsmc-use-devm_platform_ioremap_resource_byname/20230321-1955=
47
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/=
next
patch link:    https://lore.kernel.org/r/202303211954042531445%40zte.com.cn
patch subject: [PATCH] mtd: rawnand: fsmc: use=A0devm_platform_ioremap_reso=
urce_byname()
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/arch=
ive/20230322/202303222207.HGERupOc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222207.HGERupOc-lkp@intel.com/

New smatch warnings:
drivers/mtd/nand/raw/fsmc_nand.c:1048 fsmc_nand_probe() error: potentially =
dereferencing uninitialized 'res'.

vim +/res +1048 drivers/mtd/nand/raw/fsmc_nand.c

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1021  static int __init fsmc_nand_probe(struct platform_d=
evice *pdev)
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1022  {
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1023  	struct fsmc_nand_data *host;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1024  	struct mtd_info *mtd;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1025  	struct nand_chip *nand;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1026  	struct resource *res;
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1027  	void __iomem *base;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1028  	dma_cap_mask_t mask;
4ad916bca7c372 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1029  	int ret =3D 0;
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1030  	u32 pid;
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1031  	int i;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1032  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1033  	/* Allocate memory for the device structure (and z=
ero it) */
82b9dbe2e0f687 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1034  	host =3D devm_kzalloc(&pdev->dev, sizeof(*host), G=
FP_KERNEL);
d9a21ae8e5f3fe drivers/mtd/nand/fsmc_nand.c     Jingoo Han                 =
      2013-12-26  1035  	if (!host)
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1036  		return -ENOMEM;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1037  =

a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1038  	nand =3D &host->nand;
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1039  =

a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1040  	ret =3D fsmc_nand_probe_config_dt(pdev, host, nand=
);
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1041  	if (ret)
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1042  		return ret;
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1043  =

21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                =
      2023-03-21  1044  	host->data_va =3D devm_platform_ioremap_resource_b=
yname(pdev, "nand_data");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1045  	if (IS_ERR(host->data_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1046  		return PTR_ERR(host->data_va);
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1047  =

6d7b42a447f92e drivers/mtd/nand/fsmc_nand.c     Jean-Christophe PLAGNIOL-VI=
LLARD 2012-10-04 @1048  	host->data_pa =3D (dma_addr_t)res->start;

"res" is never initialized.  Part of the commit missing?

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1049  =

21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                =
      2023-03-21  1050  	host->addr_va =3D devm_platform_ioremap_resource_b=
yname(pdev, "nand_addr");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1051  	if (IS_ERR(host->addr_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1052  		return PTR_ERR(host->addr_va);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1053  =

21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                =
      2023-03-21  1054  	host->cmd_va =3D devm_platform_ioremap_resource_by=
name(pdev, "nand_cmd");
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1055  	if (IS_ERR(host->cmd_va))
b0de774c6334dc drivers/mtd/nand/fsmc_nand.c     Thierry Reding             =
      2013-01-21  1056  		return PTR_ERR(host->cmd_va);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1057  =

21cf7720019aa3 drivers/mtd/nand/raw/fsmc_nand.c Ye Xingchen                =
      2023-03-21  1058  	base =3D devm_platform_ioremap_resource_byname(pde=
v, "fsmc_regs");
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1059  	if (IS_ERR(base))
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1060  		return PTR_ERR(base);
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1061  =

4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1062  	host->regs_va =3D base + FSMC_NOR_REG_SIZE +
4df6ed4f0ac9a1 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1063  		(host->bank * FSMC_NAND_BANK_SZ);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1064  =

fb8ed2ca432443 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1065  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1066  	if (IS_ERR(host->clk)) {
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1067  		dev_err(&pdev->dev, "failed to fetch block clock\=
n");
82b9dbe2e0f687 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1068  		return PTR_ERR(host->clk);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1069  	}
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1070  =

e25da1c07dfb31 drivers/mtd/nand/fsmc_nand.c     Viresh Kumar               =
      2012-04-17  1071  	ret =3D clk_prepare_enable(host->clk);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1072  	if (ret)
fb8ed2ca432443 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1073  		return ret;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1074  =

593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1075  	/*
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1076  	 * This device ID is actually a common AMBA ID as =
used on the
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1077  	 * AMBA PrimeCell bus. However it is not a PrimeCe=
ll.
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1078  	 */
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1079  	for (pid =3D 0, i =3D 0; i < 4; i++)
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1080  		pid |=3D (readl(base + resource_size(res) - 0x20 =
+ 4 * i) &
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1081  			255) << (i * 8);
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1082  =

593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1083  	host->pid =3D pid;
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1084  =

fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1085  	dev_info(&pdev->dev,
fc43f45ed563f5 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1086  		 "FSMC device partno %03x, manufacturer %02x, rev=
ision %02x, config %02x\n",
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1087  		 AMBA_PART_BITS(pid), AMBA_MANF_BITS(pid),
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1088  		 AMBA_REV_BITS(pid), AMBA_CONFIG_BITS(pid));
593cd8711221c9 drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-11-29  1089  =

712c4add032771 drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1090  	host->dev =3D &pdev->dev;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1091  =

4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1092  	if (host->mode =3D=3D USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1093  		init_completion(&host->dma_access_complete);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1094  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1095  	/* Link all private pointers */
bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon            =
      2015-12-10  1096  	mtd =3D nand_to_mtd(&host->nand);
a1b1e1d5bdfe79 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1097  	nand_set_flash_node(nand, pdev->dev.of_node);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1098  =

bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon            =
      2015-12-10  1099  	mtd->dev.parent =3D &pdev->dev;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1100  =

467e6e7be2e26f drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1101  	nand->badblockbits =3D 7;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1102  =

4da712e702941d drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-02-16  1103  	if (host->mode =3D=3D USE_DMA_ACCESS) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1104  		dma_cap_zero(mask);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1105  		dma_cap_set(DMA_MEMCPY, mask);
feb1e57ee58350 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1106  		host->read_dma_chan =3D dma_request_channel(mask,=
 filter, NULL);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1107  		if (!host->read_dma_chan) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1108  			dev_err(&pdev->dev, "Unable to get read dma chan=
nel\n");
e7a97528e3c787 drivers/mtd/nand/raw/fsmc_nand.c Dan Carpenter              =
      2021-02-15  1109  			ret =3D -ENODEV;
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1110  			goto disable_clk;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1111  		}
feb1e57ee58350 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1112  		host->write_dma_chan =3D dma_request_channel(mask=
, filter, NULL);
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1113  		if (!host->write_dma_chan) {
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1114  			dev_err(&pdev->dev, "Unable to get write dma cha=
nnel\n");
e7a97528e3c787 drivers/mtd/nand/raw/fsmc_nand.c Dan Carpenter              =
      2021-02-15  1115  			ret =3D -ENODEV;
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1116  			goto release_dma_read_chan;
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1117  		}
604e75444fa82c drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1118  	}
604e75444fa82c drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1119  =

7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-11  1120  	if (host->dev_timings) {
6335b509b2b6fb drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-04-29  1121  		fsmc_nand_setup(host, host->dev_timings);
7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-11  1122  		nand->options |=3D NAND_KEEP_TIMINGS;
7a08dbaedd365f drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-11  1123  	}
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1124  =

ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1125  	nand_controller_init(&host->base);
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1126  	host->base.ops =3D &fsmc_nand_controller_ops;
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1127  	nand->controller =3D &host->base;
ad71148c1804c3 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-11-20  1128  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1129  	/*
25985edcedea63 drivers/mtd/nand/fsmc_nand.c     Lucas De Marchi            =
      2011-03-30  1130  	 * Scan to find existence of the device
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1131  	 */
00ad378f304a09 drivers/mtd/nand/raw/fsmc_nand.c Boris Brezillon            =
      2018-09-06  1132  	ret =3D nand_scan(nand, 1);
ad5678ec40764c drivers/mtd/nand/fsmc_nand.c     Masahiro Yamada            =
      2016-11-04  1133  	if (ret)
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1134  		goto release_dma_write_chan;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1135  =

bdf3a555015260 drivers/mtd/nand/fsmc_nand.c     Boris Brezillon            =
      2015-12-10  1136  	mtd->name =3D "nand";
ede29a020ec3b4 drivers/mtd/nand/fsmc_nand.c     Thomas Petazzoni           =
      2017-03-21  1137  	ret =3D mtd_device_register(mtd, NULL, 0);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1138  	if (ret)
682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1139  		goto cleanup_nand;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1140  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1141  	platform_set_drvdata(pdev, host);
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1142  	dev_info(&pdev->dev, "FSMC NAND driver registratio=
n successful\n");
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1143  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1144  	return 0;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1145  =

682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1146  cleanup_nand:
682cae27b1da05 drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1147  	nand_cleanup(nand);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1148  release_dma_write_chan:
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1149  	if (host->mode =3D=3D USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1150  		dma_release_channel(host->write_dma_chan);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1151  release_dma_read_chan:
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1152  	if (host->mode =3D=3D USE_DMA_ACCESS)
4774fb0a48aacf drivers/mtd/nand/fsmc_nand.c     Vipin Kumar                =
      2012-03-14  1153  		dma_release_channel(host->read_dma_chan);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1154  disable_clk:
ab3ab7b654ae69 drivers/mtd/nand/raw/fsmc_nand.c Linus Walleij              =
      2019-01-26  1155  	fsmc_nand_disable(host);
e25da1c07dfb31 drivers/mtd/nand/fsmc_nand.c     Viresh Kumar               =
      2012-04-17  1156  	clk_disable_unprepare(host->clk);
43fab011e93fea drivers/mtd/nand/raw/fsmc_nand.c Miquel Raynal              =
      2018-04-21  1157  =

6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1158  	return ret;
6c009ab89a212b drivers/mtd/nand/fsmc_nand.c     Linus Walleij              =
      2010-09-13  1159  }

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
