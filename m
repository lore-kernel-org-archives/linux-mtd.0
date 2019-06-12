Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6685FC31E46
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009952082C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ruiZLQJw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jlVfevWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 009952082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qoMRl1GBFUoBmwz2K0EWPv7n205v8BC6LbqfY7N9+aY=; b=rui
	ZLQJwrmx7A/baEn6eADxV17g1CkHQkpc3e+U2NsmpGABYGNILiE4dkeD4KYELKv6tTAAJXW1rnhJQ
	ZDrV4+UUOc9V9qDAWu8olZmQ5yjXfHOfVO+Xkuhnb5AfsviETG0SGwIwz7Tjw6DKh8g7Ap3piEuC+
	TYMq1qLEBDX4of2onOo/5YAr0yuvuLg9sPHNhesraBTA0ZAMJhIet1Q/ZUXPVNir5F4lA9p/pmD8f
	6n+PulUspNJDO3g4GYdz0KXpFiVdIelVwuvjH5kUDyhbDWhn2LGSNfoS+6K7GNvKrdfXSWYtSLjQK
	nbLQ9b+JZDU0vynnvQMzCQSXQQNa1yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb0oO-0000aA-U6; Wed, 12 Jun 2019 10:49:00 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0oK-0000Y9-B6
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 10:48:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id c14so205974plo.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2019 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=6OgmzXKxvgHJ1sM8mE9nEpUkTFx5pfDiK3sCa407yTI=;
 b=jlVfevWxi9+GHeQZP8m+0MbI5NR4vR+IREfTBAOj2OboeNZDVA4nxenqfLYyOKDq5F
 JeoDtJu+hrSbOEFMQjWeesrzt5vBQ2csZv990giHqN3wpTPlHjduFKCLaGqEo8UCvTq8
 QQ7BxZbf+VXSquO1Xf9dh7nIJOAfiqSIi9DLfs9NGZ9D4/hJqRJxu8m6c/wLj/vF9XKD
 5VUC8mr+iHQw6992UHBtbED8NAPFiGe1jSC42MO1sNDuIvzZXfvXGpCxvWzUQCditt4i
 iHCfvWNV63siJnF4yzudfhPzyY2Uzssec2ZOvS8HmBmgQLTZN1VVUPsYlZv9FnG1IhnS
 EImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6OgmzXKxvgHJ1sM8mE9nEpUkTFx5pfDiK3sCa407yTI=;
 b=Qj/Ydtis1JLCdimm6MVpXFT3NbSLHyyx/AOlgW59BvEaFA8lEB0Wg1XK3/eTJJc9i8
 Zj5wkUc0z2/JRHgvh+UwB+aWsAox+FdyZ2hvjkKleGBbnnHryWPmb9vnCaNIHrHa4AKj
 9czgWutKpYc6ArA9vYhheLgzazhUfWDbD8i0yvWDlmrA8C9ajUEcYDZpgOjRmZgKGibK
 0nfM0GPKg+S8av/4R6YzgfUQuUPoJ5T9yhv0ostDCEJtF79XM51vfgwqVZcrvSluA0mk
 1mIcOhMYXda8Q3WCZFBAKR0EHbb9BuQw0cFYF+zGNf3SA5sXZnWNiGQXPsRUfW1K+RvQ
 ia3A==
X-Gm-Message-State: APjAAAXzE3+tqq623IiajDsJOgDyEAMO6eVVopppzAFtHIswszKXyWzG
 B1maJRiKoTn6oqea3fMKPGzQ9g==
X-Google-Smtp-Source: APXvYqyRNQn4HyUUaAoD5W3dTl5pCJH+6plRQxAR5F5uu/22Q/Cjtya5G0BA+cILNrTl2XlFiIPJDw==
X-Received: by 2002:a17:902:a513:: with SMTP id
 s19mr27330778plq.25.1560336535093; 
 Wed, 12 Jun 2019 03:48:55 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id y22sm12241561pfm.70.2019.06.12.03.48.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Jun 2019 03:48:54 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] mtd: spi-nor: add support for is25wp256 spi-nor flash
Date: Wed, 12 Jun 2019 16:17:53 +0530
Message-Id: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_034856_394391_A97952F6 
X-CRM114-Status: GOOD (  11.60  )
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
Cc: wesley@sifive.com, palmer@sifive.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch set is tested on HiFive Unleashed A00 board and is based on mainline
kernel v5.2-rc1. Its intended to add support for 32 MB spi-nor flash
mounted on the board. Memory Device supports 4/32/ and 64 KB sectors size.
The device id table is updated accordingly.

Flash parameter table for ISSI device is set to use macronix_quad_enable
procedure to set the QE (quad-enable) bit of Status register.

A unilaterlay block unlocking scheme is added in patch 2.

These patches are based on original work done by Wesley Terpstra and/or Palmer Dabbelt:
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and flash utils (v1.5.2):
1. mtd_debug  	:Options available are : erase/read/write.
2. flashcp	:Single utility that erases flash, writes a file to flash and verifies the data back.
3. flash_unlock: Unlock flash memory blocks.Arguments: are offset and number of blocks.
3. flash_lock: 	 Lock flash memory blocks. Arguments: are offset and number of blocks. 

Unlock scheme clears the protection bits of all blocks in the Status register.

Lock scheme:
A basic implementation based on stm_lock scheme and is validated for different number of blocks passed
to flash_lock. ISSI devices have Top/Bottom area selection in "function register" which is OTP memory.
 

Revision history:

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


Sagar Shrikant Kadam (3):
  mtd: spi-nor: add support for is25wp256
  mtd: spi-nor: add support to unlock flash device
  mtd: spi-nor: add locking support for is25xxxxx device

 drivers/mtd/spi-nor/spi-nor.c | 348 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   7 +
 2 files changed, 304 insertions(+), 51 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
