Return-Path: <SRS0=mMzh=XN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85568C4CEC9
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 16:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564D921907
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Sep 2019 16:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9dGeevz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iq0ETXiL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564D921907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=crNEDemyw4EjLMIqMhUe8XypRtC+yGug7Gbqmd3rc9c=; b=a9d
	GeevzQt8wIgdgFkMOj+DwarhhdrfcPNKxK2g9AkpvHkLVI+W/DiRnBLnOdQYz0q5VTkvLuQi2q2q+
	NMY3iZAmCMUHfGbDpHumaNYth2BNSP/VWGjzH15x02i9IpNd0jdqGddAjFYDPJNeFnD6Z6AJ/NGYp
	O1sRpDZWc4Ka4xbJurkF7TYz40ORZ3ZSchj+vDlNBfqexDslN6gUCEJu0d3spXKooWOYn+O1Lq3xw
	eQw53ufF5m6ZpVzvgBn4DThvNjUCzWfnRq03SgPAQOpKCAFwTxdoE1YCr2D1EhnUr+61SJzXfp0J7
	bWqoxeWqeAiBiu5QSH4jhsMULxRXHXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAcPX-0007N9-2t; Wed, 18 Sep 2019 16:02:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAcPI-000736-2Y
 for linux-mtd@lists.infradead.org; Wed, 18 Sep 2019 16:02:19 +0000
Received: by mail-pf1-x443.google.com with SMTP id q5so236300pfg.13
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2019 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=O0JULxyEuBt2bswXbV1mUisUvjzYzJbnFnOiO1qK1jE=;
 b=iq0ETXiLVRgUSKQ6Z1wMvovQZ4EZ4pTFUSJJTilQGGk0fWZYfeaGUmL1tchviOrQY6
 6nsEA19QfBMlY3GpuFu2vFKzBVIevRyRnU0IaK3yq+qxJAK3wWgv3dvVny8/P342+0Af
 kLYsVDv/Hn8+6fnOL5RPdidVRurCwMBl2dcfvO2GjvG/9Y+/TEZChc8qh/ARhfFFGhFi
 TIDXcR9egAnheBcAr5KRfFipY2rnr4SpyU8Tbbqh4Z6KjRKrQ4R8O/7zweNaJpY27PdP
 cSEwhjN9temzqC1UFH9foSUR12cv+81JEU6s2m9RiAmUjGwOTn5qk6EhXtsL2DVDkQjD
 ZY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O0JULxyEuBt2bswXbV1mUisUvjzYzJbnFnOiO1qK1jE=;
 b=dhDLowsXW5hOfC0YUAK8E/9iuE3d2+Gb4/4MvA1hMnxaIBufd/OHBIuUyaZ99X6DJ8
 udsOmRLncoaSClsEtjEfTQId4MGczPu4cjyl1ZGOLPIKJE7IyNXPLJt6TLEKH95cC6R2
 166TWfDNyVJiG75lcF2cGhB5yi5EFl1ov8HN97fkXhb2OgYYi/lHQIobqySZQmwd1nB3
 ldnyYguYuJHa/yXY72I2UBqa2cAT5AiM2qwtfmXL98UUCcO2B1ExJLEddWNEZ2cHchEd
 AHF7lZmcuIAFCpwQlXk93DoRySb7VR9clWJN8lt5nrOFD97f/SIZm6N9XpMNCCOrm+Qq
 OxOw==
X-Gm-Message-State: APjAAAWaYU2UP123XKnbQmeBfpx2mztkoTz9nrAw/0WvSVcS9P370ftg
 h0YhcSiw9cuXGitdlJfEzQa2Xw==
X-Google-Smtp-Source: APXvYqxijAc8QHbhEzCSfCLDeLG8JsdVIvOc0MS1Md26rXzG+YeKiRSsZhQytHD/3ElWAx2AhYI+fw==
X-Received: by 2002:a17:90a:8a02:: with SMTP id
 w2mr4601632pjn.131.1568822534950; 
 Wed, 18 Sep 2019 09:02:14 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id g12sm9872379pfb.97.2019.09.18.09.02.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 18 Sep 2019 09:02:14 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v9 0/2] mtd: spi-nor: add support for is25wp256 spi-nor flash
Date: Wed, 18 Sep 2019 21:31:43 +0530
Message-Id: <1568822505-19297-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_090216_131166_94C1E953 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch series adds basic support for 32MiB spi-nor is25wp256 present on HiFive
Unleashed A00 board. The flash device gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
from BFPT table for address width, whereas the flash can support 4 byte
address width, so the address width is configured by using the post bfpt
fixup hook as done for is25lp256 device in
commit cf580a924005 ("mtd: spi-nor: fix nor->addr_width when its value
configured from SFDP does not match the actual width")

Patches are based on original work done by Wesley Terpstra and/or
Palmer Dabbelt:
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and
flash utils (v1.5.2):
1. mtd_debug  	: Options available are : erase/read/write.
2. flashcp	: Single utility that erases flash, writes a file to flash and verifies the data back.

The changes are available under branch dev/sagark/spi-nor-v9 at
https://github.com/sagsifive/riscv-linux-hifive 

Revision history:
V8<->V9:
-Rebased this series to mainline v5.3-rc8
-Corrected number of sectors in the spi nor id table for is25wp256 device as suggested in the review.
-The lock/unlock scheme in the V8 version of this series needs to have a more generic approach.
 These protection scheme patches are not included in this series, will submit those separately.

V7<->V8:
-Rebased this series on mainline v5.3-rc4.
-Removed remaining func_reg reference from issi_lock as updating OTP region was dropped as part of V6.
-Updated Reviewed-By tags to 1st and 2nd patch.

V6<->V7:
-Incorporated review comments from Vignesh.
-Used post bfpt fixup hook as suggested by Vignesh.
-Introduce SPI_NOR_HAS_BP3 to identify whether the flash has 4th bit protect bit.
-Prefix generic flash access functions with spi_nor_xxxx.

V5<->V6:
-Incorporated review comments from Vignesh.
-Set addr width based on device size and if SPI_NOR_4B_OPCODES is set.
-Added 4th block protect identifier (SPI_NOR_HAS_BP3) to flash_info structure 
-Changed flash_info: flag from u16 to u32 to accommodate SPI_NOR_HAS_BP3
-Prefix newly added function with spi_nor_xxx.
-Dropped write_fr function, as updating OTP bit's present in function register doesn't seem to be a good idea.
-Set lock/unlock schemes based on whether the ISSI device has locking support and  BP3 bit present.

V4<->V5:
-Rebased to linux version v5.2-rc1.
-Updated heading of this cover letter with sub-system, instead of just plain "add support for is25wp256..."

V3<->V4:
-Extracted comman code and renamed few stm functions so that it can be reused for issi lock implementation.
-Added function's to read and write FR register, for selecting Top/Bottom area.

V2<->V3:
-Rebased patch to mainline v5.1 from earlier v5.1-rc5.
-Updated commit messages, and cover letter with reference to git URL and author information.
-Deferred flash_lock mechanism and can go as separate patch. 

V1<-> V2:
-Incorporated changes suggested by reviewers regarding patch/cover letter versioning, references of patch.
-Updated cover letter with description for flash operations verified with these changes.
-Add support for unlocking is25xxxxxx device.
-Add support for locking is25xxxxxx device.

v1:
-Add support for is25wp256 device.

Sagar Shrikant Kadam (2):
  mtd: spi-nor: add support for is25wp256
  mtd: spi-nor: fix nor->addr_width for is25wp256

 drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
