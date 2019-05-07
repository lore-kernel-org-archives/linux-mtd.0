Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D8C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311902087F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vno+/bEF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LcspjzYT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311902087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=45Y+iqCVgJTYeTyxZDEv1KHPuEBka1ZBBNYgQjfAtus=; b=Vno+/bEFAMihAv
	NRWTPqmdgAlM9kWROytoz6+803NEX3d/53MOKhTXU0XLCLWTOEut2sCYTYiQ9c2zNyboKH9glO28C
	1nFeHhD1ZmxJMdjSBedTBWamrt8uxy7oJuFeBfUfWF5+CISgPrjN1iTpdi5n68PuyLvKM8nSG6fTo
	MnYpVHyjiqUpEh+a+v2kM+1R5fRme+z/pSX04uU7ysZWQG0pyljQ+8inOi3/aBLtg3vfbZXwEj/1G
	D7IzPczj4K0BJe/2CWWIwAC6KYJ2z8/f0NrD0dZnCIFLipCjFKJ9xM0eD31VYMcgKT0kDrnMNUD+W
	kM6lpR6jV8h/U866j4zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2Il-0003zk-ES; Tue, 07 May 2019 15:46:43 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2Ii-0003yW-7P
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 15:46:41 +0000
Received: by mail-pl1-x644.google.com with SMTP id a5so3442825pls.12
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:to:cc:subject:date:message-id;
 bh=AyxScH4NIE4sDe1p/0kXATnx4Yd1gHetw4ugG+CXftg=;
 b=LcspjzYTpm18fBxDLtdVlOSLYgih/UOIl8y2xm86Shd54JuFLAbjRuZJsh7/UJROFW
 TtPG3dZCOLd3NNoEul47o9myIkAwvByEQcLu1SVAeEFQ3dYwmEQe2TjcZkXAt8F96qzm
 m1bi5u09yD15mF9UitMHo4z+MNjDAqwkwSCXkNMppq2snlQsOkVdmKMDPENoU43mV7+L
 RzfwzYC8qqQM7ryF6MyV/7SwGQIPHoB/YzUQMpD8PmNZ4S8CadI+FEHvI2Sbv59AL5vH
 C1i10OgAXmZLSd450lkDBFZGCG8h/znBvgvuZLKNKvyS6oFP0RmLcCe3dPQ26CPTyW9W
 x7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AyxScH4NIE4sDe1p/0kXATnx4Yd1gHetw4ugG+CXftg=;
 b=blXn+IA8ONyScParWfjjpvE0PzwnmYQFt3bP1mWXWaIyvgHyHtzO1GXq420anAkcs1
 tcuE3je9TFnykS+tPBLd2uAE+FJm6ETxq/9nNZM19nCQ8Qg0GCT0DbZP0L/kEFroiKPU
 XLceE6PMysn4LogohPO2BPMUm/kT3mB+ZPZCd27Ag8fwaoYVnbKmXnxSu1fGytXVf8Yd
 XocdEtbrdayZ6L8VV4a6QLC6CeWx5x0tKuSk5p/R8J6WqMQpF1sC1lfc4epuLKifbn75
 VNYOvsEssb0jVAFiySEdsZS5Xol7WV+Fp0m9gn/GE0ob6WH1NxiwEI6fXO2ug8dbeBw7
 9wjw==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAUPz47qGNYzyU9d0UlDxphb3AKHp1X+7dTuMgjxyL9P1HlY6v0H
 3Lq2P7wbhsrYRrWsA/3Fdg2IIo9Vdd0p7/AAcGpFuOXGYqicKiaF0PuEpmKo9C32ISDSqlP5mkB
 mfNAw7NvtcENTvp//cpo=
X-Google-Smtp-Source: APXvYqxkIWDXrclgUoj+jqcoyhO6CLT/D3zJ0ThibTrmWBC8R5Y1pe8PKcAAb/jfMzxK3ee5u+CN2w==
X-Received: by 2002:a17:902:29c9:: with SMTP id
 h67mr41070276plb.114.1557243998932; 
 Tue, 07 May 2019 08:46:38 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id 5sm15482096pfs.17.2019.05.07.08.46.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 08:46:38 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 v3 0/3] add support for is25wp256 spi-nor device.
Date: Tue,  7 May 2019 21:16:00 +0530
Message-Id: <1557243963-14140-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_084640_306171_8DB689B3 
X-CRM114-Status: GOOD (  11.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch set is tested on HiFive Unleashed board and is based on mainline
kernel v5.1. Its intended to add support for 32 MB spi-nor flash
mounted on the board. Memory Device supports 4/32/and 64 KB sectors size.
The device id table is updated accordingly.

Flash parameter table for ISSI device is set to use macronix_quad_enable
procedure to set the QE (quad-enable) bit of Status register.

A unilaterlay block unlocking scheme is added in patch 2.

These patches are based on original work done by Wesley Terpstra and/or Palmer Dabbelt:
https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b

Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and flash utils (v1.5.2):
1. mtd_debug  	:Options available are : erase/read/write.
2. flashcp	:Single utility that erases flash, writes a file to flash and verifies the data back.
3. flash_unlock: Unlock flash memory blocks.
3. flash_lock: 	 Lock flash memory blocks. 

Unlock scheme clears the protection bits of all blocks in the Status register.

Lock scheme:
It is a basic implementation similar to stm_lock scheme and is validated for different number of blocks passed
to flash_lock.

Revision history:

V2<->V3:
-Rebased patch to mainline v5.1 from earlier v5.1-rc5
-Updated commit messages, and cover letter with reference to git URL and author information.
-Deferred flash_lock mechanism and can go as separate patch. 

V1<-> V2:
-Incorporated changes suggested by reviewers regarding patch/cover letter versioning, references of patch.
-Updated cover letter with description for flash operations verified with these changes.
-Add support for unlocking is25xxxxxx device
-Add support for locking is25xxxxxx device.

v1:
-Add support for is25wp256 device.


Sagar Shrikant Kadam (3):
  mtd: spi-nor: add support for is25wp256
  mtd: spi-nor: add support to unlock flash device.
  mtd: spi-nor: add locking support for is25xxxxx device

 drivers/mtd/spi-nor/spi-nor.c | 110 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |   2 +
 2 files changed, 111 insertions(+), 1 deletion(-)

-- 
1.9.1


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
