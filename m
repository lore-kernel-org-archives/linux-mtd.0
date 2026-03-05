Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1258DF47CCC
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MaTlWlhA3REd2yKXMr2Zuth3o4rPssmA0niP40dwJ/g=; b=V1kZkqZx91vfO6
	Gond1+hZis/KA0vfV/vmhf4NEp+Tajb7f4UOhqbSfva10xjdHsH8Sbyo3cSzT3PLWWSCWwCOiMUcS
	qDYzJlweRLSkFumYMu7AjnXma6HubiCnfP0fZnuXgjZccDONKybyRI8iUjFWpw9vtOq/7ZGO5Hogo
	FqfrwPhEx7YSO/Co0TghXZ5T/bczcOQz2IQdtceH9Asf8TKx6w08rBg9WOJtQhWNQdA1hxRT4kjJc
	1cXWEpfgKgWivJPKlphTtjAKekW8XTw8cJXPKpYv+tawQHNkPwJq5bIQ2KYPz10GKKq5jaUR8JARy
	MSg+wZMjSUVbYoEByIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFEh-00000002WqI-2W0W;
	Thu, 05 Mar 2026 20:23:55 +0000
Received: from mail-oi1-x261.google.com ([2607:f8b0:4864:20::261])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFEe-00000002Wpx-1nF8
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 20:23:53 +0000
Received: by mail-oi1-x261.google.com with SMTP id 5614622812f47-4648448e387so5627596b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 12:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772742230; x=1773347030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NxoGImTSCkhbC7LhqJ5kMri0RwIzFL7xOu7X7Ff1N4=;
        b=dLvvD7F9heSA5k1GmOC5RNW2Ve/eqY4LHue8or8Wbbyl+smz12zU/CDmu3KdaP5/cP
         +6EAdaZCNfsMlU2uQtPLPvRuZFLaScN6m+P3F2l5HfWNXmQZ941xz9RpNcQIpHj64QPg
         o+raRzA+7XAeLx+bahyet5z7VpklDRYLqL0wprm3+DSoIkl1uJuHG4iUk7hv9A5AT3Q8
         R6zjzROZcRmXGyMMrlqTh8XLIA4ywRLwv4SQsbXdo7HHR3+AxB5NcYyNQOxkWJjLEO9/
         D8DzTRG66ol9a0VmFkcBN/J9XKtAx4vja9X/MJy9NH4sfjavYNpV/uuKeFkXSyaqNt2s
         0u7A==
X-Forwarded-Encrypted: i=1; AJvYcCXH1iN0eSohdXmpOMcFHESjbBO/nr2QLEfUXEL+QlruTdTpikfhvUIVyl0CHzK/JbQS7sESutWdLT8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8e9YhMD5/gnK28Q7G4pkmd8BpN9ZSGsymOSkN2MAUUADpRDOE
	ii9ODe+N/IkapMmP1RkYvYJqiN4DZOErzFLnTKfQ7prhcntS6Zgjnbb2u7emCalrFNbciVsBc9C
	dXt3JXtMc3cYUe+MOc8bJhVxfOrzMdxr2f8yCVrjVqJR8TOC/U1/bsp4uuVuatSda4Uu3BNxUeJ
	qLwSK27wLGD1AGndvBBp9sDWQP67D0TsdhCg755sthn7Jbei/BZfsydyL53SZ5O7EN65UcnjFap
	tBCUnhf+nietKr/Yg==
X-Gm-Gg: ATEYQzwTl2IdIQJHyR6UFDVfgo2tMj2zRpnneeq3J50wjQ6rc16Oro53V4NuUgcMgA3
	0u42s7VF82hDxxbD6pt4BgWyT82uwd72wH/PGM6HbkUPy5XsrvMhmIOgDzTd4mvu6Pgg4Af6Tz4
	IW4KL9a0lnoW+ME9w+miUntqiMzIFeZsS0IYv6k8lVVEx0lRfZZBAnSNd1U88RS89ZD5ahGAic+
	W94RSFkVTTEoMEXUTatrSnsWy61Fdz63yHjRLpe9useuUZfXj4beP0Xv+rVBV9VgT/iG2tFJnXA
	1JbTZscmf0fvmJ9L38pa0vxMh9uop8oSHVjaWy99D2n0zHhgQ1fhFIos2+OXwvdoi6Hhvb+2udV
	2c83f8RCvd5q336Z/NTEmoxd68NhkNXTGr1OguOwQNgXKughNbI9fM7fg1o2zE6GnFWXRdrcC57
	/p4acmRw9V/MKFPgCmaKxRLj9omxRNiaIkJsTCEQX/SQHP1zKwnECw0UK1
X-Received: by 2002:a05:6808:bc3:b0:45c:8f03:1e15 with SMTP id 5614622812f47-4651ad18c07mr3361020b6e.43.1772742230241;
        Thu, 05 Mar 2026 12:23:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4160cf6bf53sm3177205fac.3.2026.03.05.12.23.49
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 12:23:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12711ec96fbso3140904c88.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772742229; x=1773347029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1NxoGImTSCkhbC7LhqJ5kMri0RwIzFL7xOu7X7Ff1N4=;
        b=CcAjrkkA/PVtwCNk+A3oq9qp1LOCOiUejxi1D0D34FvOt6k395I25FPrIczTv6t81y
         OhvsOr2mpoOrxhLQIdE5J+AaChY4GQ2+taUE/OW2nqPYvVm/65tmNCJJJihmn3svFCjh
         ZNNzkjtzk1KmANqMJbtm4JvGnD4qtRmHbN24U=
X-Forwarded-Encrypted: i=1; AJvYcCVhI/WX6S1vqa+MFiZboTMhlHic5wDlSy6KXuW9UGu4bazJFbp6qdfiLlVmSA/t7e0dfszNGujCBe0=@lists.infradead.org
X-Received: by 2002:a05:7022:f89:b0:11b:9386:a3be with SMTP id a92af1059eb24-128b70eb57cmr3253395c88.41.1772742228862;
        Thu, 05 Mar 2026 12:23:48 -0800 (PST)
X-Received: by 2002:a05:7022:f89:b0:11b:9386:a3be with SMTP id a92af1059eb24-128b70eb57cmr3253376c88.41.1772742228238;
        Thu, 05 Mar 2026 12:23:48 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32863sm21066718c88.10.2026.03.05.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:23:47 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: computersforpeace@gmail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: florian.fainelli@broadcom.com,
	william.zhang@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH] mtd: rawnand: brcmnand: skip DMA during panic write
Date: Thu,  5 Mar 2026 15:21:57 -0500
Message-Id: <20260305202157.3571334-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_122352_609051_E513BE54 
X-CRM114-Status: GOOD (  13.32  )
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

When oops_panic_write is set, the driver disables interrupts and
switches to PIO polling mode but still falls through into the DMA
path. DMA cannot be used reliably in panic context, so make the
DMA path an else branch to ensure only PIO is used during panic
writes.

Fixes: c1ac2dc34b51 ("mtd: rawnand: brcmnand: When oops in progress use pio and interrupt polling")
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0427d76f45d0..5b9dadd5405e 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2350,14 +2350,12 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < ctrl->max_oob; i += 4)
 		oob_reg_write(ctrl, i, 0xffffffff);
 
-	if (mtd->oops_panic_write)
+	if (mtd->oops_panic_write) {
 		/* switch to interrupt polling and PIO mode */
 		disable_ctrl_irqs(ctrl);
-
-	if (use_dma(ctrl) && (has_edu(ctrl) || !oob) && flash_dma_buf_ok(buf)) {
+	} else if (use_dma(ctrl) && (has_edu(ctrl) || !oob) && flash_dma_buf_ok(buf)) {
 		if (ctrl->dma_trans(host, addr, (u32 *)buf, oob, mtd->writesize,
 				    CMD_PROGRAM_PAGE))
-
 			ret = -EIO;
 
 		goto out;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
