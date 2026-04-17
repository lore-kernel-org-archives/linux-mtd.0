Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD0F8E4A5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 04:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wr9wIWY26mhWUtt/S7FwtoDlvKAy2KYHJ0Pgih2z/lU=; b=ew3n+98GrlhDzW
	4FVo7AmXOow5HBTyPzCc23ffEbCdyNapLmdo7Oc5xrxhMAp2AgaVXG72UNTK+RCoCTQIMUvU6H64M
	GOeNxECA5YqpB9LnKdE+ePK/4vxluESST1zfQ9uotlsscZUkb2OWH9Lv7d4smdEd4vh3rY7LRbtBS
	VO3Jb8XNqHmInZyiw3c3ZGfInLfvwcPILw3hYCjW25WxETD5lz8CgNvtMpXA/41/eszW9Ou0QW/T9
	Q9b/g5+geHZN0wxMhywwg3PcNCOTdjbqGAMgPClssOnYUcRKOURjmO7VqlhwMIcTowU0XmFLO1oxg
	Xq0OLX9lW/UO+AeKDmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaX3-00000003PFg-11EB;
	Fri, 17 Apr 2026 04:10:17 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaX1-00000003PF8-0tva
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 04:10:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2aae146b604so1485455ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 21:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399014; x=1777003814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98m2sdL1pCMyEhLzfr61EEjsneVRiFvAHpBj+Kg/WNg=;
        b=hcRMjNfiWQoibOSQHchEixcgotXAS/NIf2+y39w/QJMyO+pCEDEmy+SXmmbwpvyt+e
         vHxRkgktD08Ogi7Ktv5TjEFktmccCp/9s6Lkx2GHn+UwT0je8NEARnAWQ4XgrWN4e+uu
         iO/ZKRN+IBTu8K/R+bnuXVjxV2mGtbyAfdUxaUrFdJBxqnXa0O+gsPMYyeHi64wAMsBY
         +aLVYAWF3oZAWqwh+PTPFDOcnRLs3MbpW8kbTPOZLkLq1SCmNEMBd2uVSyAOayJEl5b8
         r5jb3qM12e8PBMtIEcZYlUILjSPTaC/+SyfIp6ZfHxlwoQazdbUBHFZ+KO/06NVvfhyg
         1irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399014; x=1777003814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98m2sdL1pCMyEhLzfr61EEjsneVRiFvAHpBj+Kg/WNg=;
        b=lU41WznNpVFiihOEkJK//VnQEJrqDtDREgJFn9h5byoNfpty0kYOs5PmJKFdbxpDhh
         9qo/J40zEUMiyxpbxZnNzc/kp9/MTN/Qs3abkYj7kx4+d0jOMiW1p8DcAeB4ZNMi12SR
         NUAvLMREtyNJ2clnniZJ8YtiDOCBciAuxjlfSA+ygV4L1p34CnniLKNks6hGB/3ky0Rv
         5NuTBpV9jPzc9MHj/V17BDHjcvWsjZ4rvDXYQyAaYZEfLaayQLuyI9tZVxYEV8qKN3PV
         sx9b5mEkPPFyePvth8x0/C/9iUZ6LUnKZ4CZjjRTxGjeKp+0/bVYCQRDAPPlaOErXbLj
         AVqg==
X-Gm-Message-State: AOJu0YzMQUkWOtCBG7LHAJ9mrViG9HqzFnwGB+u15Dr0a2+Ll9BX5loz
	P4C07IybLKPKLaGOVvpzBFoqyAfJ7+ccvoiyuqK+rdeQZjh2XiCvYSpk
X-Gm-Gg: AeBDiesLl866J3YJprSXX3WUC8bQ/EzOjpt1bVbadFn1KO1aWlW9oLFpin0MEQakzQw
	Koc/noQVMqIZfk2ii7zaiZwWAAD3pKeqIw+9+6pOPPc1qRTSKJzBl2tzoY9UtoTGEmwraNFNJai
	10DdgUiJ7QKCuz23KUifeCb8nJMtJhV+kyZsfWPI44O5RM11fwX9EeQwvPEUjofDV3S7JefyfBJ
	+5Ib+nyf94b3iQSkdOPzc14bNH7ZzuvUfRuxyEJ0t3yZa41j7FY3cy4b9I3csstRSvKwokzub6o
	w9WhDcL+YLTOctYDsRadDoOYXMx12Q9QYW28boLK7gDXwEWogVNS6vAMK9boM6onpErYxT+mIfs
	dse32jjPKsH7BD1JBzn7AvW59LrhFNPlkXMnRn1jU/6pZV+CNJd/mvy4DP2rfu//nd1Uq2EEiU+
	C++1W7ul63DKt51Ej+X0hp7ThbDm0JJgTS9VbKsc1s9FV7T6KMi+NY0mgQkJtDUplQCsXr/3Zgc
	ahL9NrQZqK9hxsayliDoAh8j7sFyg==
X-Received: by 2002:a17:903:1ac8:b0:2b2:5503:1ba0 with SMTP id d9443c01a7336-2b5f9e78a4dmr12777645ad.5.1776399014365;
        Thu, 16 Apr 2026 21:10:14 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab288aesm4505305ad.65.2026.04.16.21.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:10:13 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Date: Fri, 17 Apr 2026 13:09:37 +0900
Subject: [PATCH 2/2] mtd: spi-nor: spansion: add die erase support in
 s28hx-t
MIME-Version: 1.0
Message-Id: <20260417-die-erase-fix-v1-2-4f93ca586c2e@infineon.com>
References: <20260417-die-erase-fix-v1-0-4f93ca586c2e@infineon.com>
In-Reply-To: <20260417-die-erase-fix-v1-0-4f93ca586c2e@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776399001; l=746;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=fJ3XJdKAMzgKAP1CSAH85n0sw5JeoeSHoGHGEGt2Q7M=;
 b=MFJk9ZMZAFnFHqjwyQjElB8xBT45ADbfVlcvqIDfrc1NnByKCZXvr9Yk4g2LrylM2PSMv3kLP
 tfgYoHx8jQfDCItm1L62Z1cP3Q/BNLsEkT75TxxQf8ky/jI6fTrhGvu
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_211015_268325_FDEC7CBE 
X-CRM114-Status: UNSURE (   9.67  )
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

S28Hx-T family has multi-die devices that support die erase opcode.
Update die erase opcode when the device is multi-die.

Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b6023076903a..65227d989de1 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -762,6 +762,9 @@ static int s28hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
+	if (params->n_dice > 1)
+		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+
 	return 0;
 }
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
