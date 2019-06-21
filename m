Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3DDC43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815002070B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtIvjFd1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HmyRHspE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815002070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VZlGZMIu6rUn03e91gjfROVEZK5d61VlNuEGmC9TmaA=; b=BtI
	vjFd1P1z/c3K8DvzxQJ0APX9th+KmtPnlrvbITMau9ctZKJGq7JtOsPE7uHXY+li8Mm/pRVpNVAB7
	IGAIVUnOWOhx+YeuZvWTv+rTNUT8TeVCkS3sYgu1zaxX0Du1Dj2NqXzPjO9AV6aTy12sZTkg5/iih
	A6BEJHe7kv97GaOivECRg2oAdF/h7HoyKEyYEvSoKrSwJQWdF6YOE0l8qutX9KS9Z68cBdtYeAoWc
	7v8lGacXgmoN/aIL2GwfZeLOG5gHxNu7mMd1bz5KYcPEzKpjLBkcRlmhRejhdEAi12SlfLV4l4PDg
	M5oomyUFJfeNN2YRFV3nUhVfFyVr7Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heN6p-0000jn-3w; Fri, 21 Jun 2019 17:13:55 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heN6m-0000iK-0H
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 17:13:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id q10so3924773pff.9
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=cAVJVLYMlpM1X+6nsKRtAyIYN/69csfPCrR5GNpvyWk=;
 b=HmyRHspEmnFmc6bYH0mcIxtmVoCG4E/7Na+MHf887uUTVRbj1E9lKP6pWZweKUsg1X
 WplLECJZQLyYro69Uj75TjacZgzrM52CBI3qhH77U0uG51rrLdr7q44xdGHBu3pzlsGk
 4b1nY+FsXWQciU7loQQ5Dvozx2E3/mxv0AHWcTgtCzc0NSIxGwC9aMahSRfgKSKZcYGx
 LVd9WfCKrPZddURlTfj7CTFbkwxJeHPznvbmvKYYolx7DhVjkT0D3IoV29AEORev7LUE
 QxuU+mVXs/feV22t2F5gVjGZ5Fvt5E5a+EMD0L+N+yiiWoBy36VHYxW4is3TKW7C04HT
 irXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cAVJVLYMlpM1X+6nsKRtAyIYN/69csfPCrR5GNpvyWk=;
 b=KtywKy0MCv1VEkcGw0N3eCshIIpCTHJF1dx5m4W9fIli7Mjq+/EJyvB9whUQ7tTc9/
 gj0Rqd8Mls0+E5Nvx0W4rBCnAVQCVkS4PAxlwirzbgo02v2FeOu0mZPT9LmzbYBBtzOp
 s89P1VU4olcUgBEcmF1fCnHzBYYchNgP+h/UFYyGTSYHniCjl+Dv44CciPRU96CUVZkb
 BMhVplqbBvG9wOv2c21YVoNAScR+wPr2ALHlw7qvA1PkDHZrRuRoHWzMoDFWZQ0lmRr+
 PfXhauKlETbq7iDIjHYj/iKjhUP8ueovwAMINRjrZtamnwnscV++9Xw+Un9aYscSvkOy
 cX4w==
X-Gm-Message-State: APjAAAWWnLSVg/nNpHwMt+2V7kIIpieUDMGZfeNbSSorn9rrL2Cn40ey
 iNmIFlXdSggOSE3EqAnZMwOzPA==
X-Google-Smtp-Source: APXvYqzPHD9SouhFBvVoB7Ko52w+lG58OoHxYUuvUiO43hMwqmb/kI3RrEjuhpsiBOQvpaZ5fzJy6Q==
X-Received: by 2002:a63:5202:: with SMTP id g2mr19423642pgb.386.1561137231320; 
 Fri, 21 Jun 2019 10:13:51 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t5sm3496190pgh.46.2019.06.21.10.13.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 10:13:50 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v6 0/3] mtd: spi-nor: add support for is25wp256 spi-nor flash
Date: Fri, 21 Jun 2019 22:43:28 +0530
Message-Id: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_101352_111098_5F456316 
X-CRM114-Status: GOOD (  12.95  )
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

The patch set is tested on HiFive Unleashed A00 board and is based on
mainline kernel v5.2-rc1. Its intended to add support for 32 MB spi-nor
flash mounted on the board. Memory Device supports 4/32/ and 64 KB sectors
size. The device id table is updated accordingly.

Flash parameter table for ISSI device is set to use macronix_quad_enable
procedure to set the QE (quad-enable) bit of Status register.

A unilaterlay block unlocking scheme is added in patch 2.

These patches are based on original work done by Wesley Terpstra and/or
Palmer Dabbelt:
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and flash utils (v1.5.2):
1. mtd_debug  	:Options available are : erase/read/write.
2. flashcp	:Single utility that erases flash, writes a file to flash and verifies the data back.
3. flash_unlock: Unlock flash memory blocks.Arguments: are offset and number of blocks.
3. flash_lock: 	 Lock flash memory blocks. Arguments: are offset and number of blocks. 

Unlock scheme clears the protection bits of all blocks in the Status register.

Lock scheme:
A basic implementation based on stm_lock scheme and is validated for different number of blocks passed
to flash_lock. ISSI devices have top/bottom area selection in "function register" which is OTP memory.

The changes along with other relevant patches are available under 
branch dev/sagark/spi-nor_v5.2-rc1 at:
https://github.com/sagsifive/riscv-linux-hifive 
 

Revision history:
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


Sagar Shrikant Kadam (3):
  mtd: spi-nor: add support for is25wp256
  mtd: spi-nor: add support to unlock flash device
  mtd: spi-nor: add locking support for is25xxxxx device

 drivers/mtd/spi-nor/spi-nor.c | 342 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   8 +
 2 files changed, 294 insertions(+), 56 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
