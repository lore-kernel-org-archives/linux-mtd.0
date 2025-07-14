Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF40C83F17
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jul 2025 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=CdKGHgAmu2T59ppJ3eTc3tLwhQ0T0830TTt6oVgDzko=; b=XXgc5/XnOzQThG
	xHpubdS/JkjtOAfrWF52gk16n5q2peO41y3SJMz4shA4k4qk/Sz+p3DL4cXYMFajOJZvVNyUeSKX8
	XAHgmI4UiI7RZMGr7gXbHzgSCaUV/2S+6rXKsWXV/qBkr35ged+vqaNsTcdi7anP9//EKQcdERjg7
	rzhmaFt5BjSMefpOujIJpEB6Vr195Ga8EgKpqf9LvjVGybi4WVClTOZGbu15OyCfWLeHX+oUoiyOI
	9TgPj2tyVcfOonNzgSEPR20KGh6kl5CsIRr+U9urxIwHQ++VmMA++HhBi/G1qftpZe+fyT1Huaztk
	SoNlpYhkpCKsMs6ivVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOsF-000000038qU-1PsN;
	Mon, 14 Jul 2025 19:30:03 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOsB-000000038ps-3vws
	for linux-mtd@lists.infradead.org;
	Mon, 14 Jul 2025 19:30:01 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2f3dab2a2a9so2633696fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2025 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521399; x=1753126199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=uwN/15XhPwL+DrFAq5Px/RZJtvea7Y0GBUgJvVDkygnIJyHHeC19sFtSue92UE2QLj
         uGwQluaTM2PKVE3hZb9J28uLXJD020u52kIs/N1+psKsNb+HoXwkk7x43QjFC8/xAaZH
         jP3nRPAiiMI5kePSeJO9l6BGZkZXN4A3cGb9ZZbF5Gr5Sg+0+aYClzUuvovaNGifE2gQ
         FLiv5hfwiQSB+mMq3UIGyyx+nhyfRYQfdrWT8lR+Mp3PDyO3pLGaPO1tmSQoK1CCC4Dp
         gpBwA8hbNGXN4rDGSnnmq26a0LJ5b8eBr3f5ZmHHVad9p5eEKiikZn3RrtD2zkQ2HcPQ
         o5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521399; x=1753126199;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=MSEKyJUXsNt2FDzF+7twGXJAQNMX1x0kuHKBrw8d7Q6F9VbnRPjD6htrAVHztZeecZ
         GcgHwHxCvNNaVyfO5zDBc6iA3cqqDaEKDTccq7Mu+ReC8GssAkPy+gCgCEJt7UNy8Tku
         HRKz6jKX9fvKKDs9h5NZ+XxzzelO9EtoSBmv9NTJeXYEOq/8/x4DtCSIsLJZHCcGhIXQ
         h5PGgMoFQnO5YZu04309Jng0IwC+JqEAUJ1qUGjILnox+aLeNoxhLTt4Yrc3Cy9EMS5H
         YuAxhK/FNQgpEW0DNfTal0qiR9sk3ysS0kqk3bkywL1pDlvc4qN0dzFToMadcQXOMlqD
         jPHA==
X-Forwarded-Encrypted: i=1; AJvYcCWUUOmr+ur4puDkjh9acqDkDxFkj4saUGnY7HxFsP7OA7nGeuBAmB49+ZrL1PJQGWJkLCx2bTcxcDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuhzzHpqh6u3kU99d/DgBlzZzcS2c0eJp7yN7yKPBEEahsoY0U
	JkR7SMLTgVjyPCTgqA/TF8L5/ixNMqi/B/0f4UXW5mPz2b1W9WFMU7B3m1jqFxizuzE=
X-Gm-Gg: ASbGncuenrTd54tzTrvA+gn7IZtm8u/IsNaFr8ySecpcX+BQ/1jm8AhYuFWHT0mAQ0c
	KDKxUFdH/jRr07VHaKr1RwTmnfxiuV/LaMIs4oyKILhto6gYlftKUdQIQZiPYDd9LlZG4PixPR/
	AFk8Pi7OEfIDSWZ0qPHWs89Eo65ufbenFiZ53EiEOyoKTs+c0jnS/8JwLQnqy/++L8A1R9N5KZA
	zMW8SYIcXYZyxweYHMpgB5GrQ7116TAjXBl/9Kz4hDDRz6J89nen/KypbnQ/4m/L1iMtPYU2jQG
	jdZXL82/e1auVH9A0O41VTeQrbANFLBKVxBdwf6waLLZ/d5Nh1nltR2cl4R9o3QVvNf68HzlQg0
	b1N5OKvr2JSYj9wTMsywKPWqsWrL8B0mKxrUb8yPp
X-Google-Smtp-Source: AGHT+IGcqvFf04VyN5VwO5vDsILubomPqyNpRQlsi0uJ6i+fQzutbyHm2vZrUuvCt3pRKpj82Fk+9g==
X-Received: by 2002:a05:6871:d804:20b0:2ef:eddd:690d with SMTP id 586e51a60fabf-2ff26913aa7mr6688707fac.24.1752521398832;
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11686ad2sm1991198fac.28.2025.07.14.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:29:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, khairul.anuar.romli@altera.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Message-ID: <2bf9baaa-e66a-40ba-96b3-44b2e5e78550@suswa.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_123000_006368_E05730E8 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/khairul-anuar-romli-altera-com/mtd-spi-nor-core-Prevent-oops-during-driver-removal-with-active-read-or-write-operations/20250709-103107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
config: i386-randconfig-141-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110922.btkgvYrn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507110922.btkgvYrn-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev' (see line 3213)
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev->driver' (see line 3213)

vim +/dev +3216 drivers/mtd/spi-nor/core.c

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3202  static int spi_nor_get_device(struct mtd_info *mtd)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3203  {
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3204  	struct mtd_info *master = mtd_get_master(mtd);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3205  	struct spi_nor *nor = mtd_to_spi_nor(master);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3206  	struct device *dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3207  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3208  	if (nor->spimem)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3209  		dev = nor->spimem->spi->controller->dev.parent;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3210  	else
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3211  		dev = nor->dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3212  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01 @3213  	if (!try_module_get(dev->driver->owner))
                                                                                                    ^^^^^^^^^^^^^^^^^^
Dereference

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3214  		return -ENODEV;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3215  
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09 @3216  	if (!dev && !dev->driver && !dev->driver->owner)
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These checks are done too late.  Also missing module put.


240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3217  		return -EINVAL;
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3218  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3219  	return 0;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
