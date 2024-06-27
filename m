Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB207C3064D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Kmaho9cgkpU6+WO+zH/FR/s0U4RfNJi3UjTGMv1O/M=; b=FjcCPluu8snSPZ
	YBy96dQS3Ziy1+8K5pNlSj+BnbBZZTZi3zXv50d1aTEypJ4M4vWAdoRqYvVl/ZhdLAH4p1Kx0LNrW
	6c/AMiXQd4Wj91oVo9inESn96vUuOcdsz/KFYM8B3/3ZSFvk49UbeGQjJ3lFcwX1dW1hVr2/8WCF4
	eS9rJw0yl89nXv0l9A71Ts0aHitOhgPm9qBylBjSNc5pm6ya8dZmQnRf11pyugJu8P7sFer0Ib2d/
	JLKk8PGQLvsx+CZGgktIoVVkDrjJywz8ivjoiUUNIuZKLdeMmUI0KR4E432sZVSCk8PtkpPd2Tgrq
	cdlH9lMbDq1sQdgo1d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrd2-0000000Ayiw-1IS3;
	Thu, 27 Jun 2024 16:05:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrcx-0000000Ayee-3J9t
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 16:05:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16C8F1C000B;
	Thu, 27 Jun 2024 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719504337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtm6RuQJK7HKXMqLOw3rQerxE/QDxsxWMgh9vmm6n3k=;
	b=ZVO1kRfEaJlPja4FjGy+YaxVv2IN7F8Z6Yo36vhnWUVJEcpQW89uhnRI2AiEd4zu6Dzkrt
	4AOF/EonhspOx/8+7FDoPuX0AhK6z2jfAQV3vkFbHp5ZKuGYfsGcDGOtL41FV3L1Fula25
	iQ6VE6z+ovdSuEcKmx8jkQJR8wlN9GxgVYRWZ62TLiXztV2DIpFsu85NzrnTIKq2iJFNSi
	JydmPPqNjM6ptGPKi2eY+YZVmdareA92mFavAF5YIZwsu/DJqRhHGoXdR2cK2xjn67k2Q6
	S8fZiaf1tJdbb9f7QYlqD5d1pQ22a+qsIIhemVKHj3B6mNbTs6dKxy/YZRGARw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Thu, 27 Jun 2024 18:05:28 +0200
Subject: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC support
MIME-Version: 1.0
Message-Id: <20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
In-Reply-To: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719504334; l=968;
 i=jeanmichel.hautbois@yoseli.org; s=20240608; h=from:subject:message-id;
 bh=7MQUtBtmxwtqSjwHgGQHzsi6UX1cWt9yIlLizuWjabU=;
 b=r2PAnoXwjNQlDMjnfDZiZz4dyFqRDwOrUTG3Glt35IMJoP78EndtTyrT7IvPZX8LH2hPKhM0L
 9jolZSxpmurBQeDAEmH7t6FHruD54qiX1tgjkzAD70B1BvdQpnwzjdU
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=oMZuYhJzT0j5MI73RlNUVYaA8VdWpFR/Sao0JKz1D2I=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_090540_059192_B5A84DA2 
X-CRM114-Status: UNSURE (   8.92  )
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

Add a few definitions, as the base address for the NFC for the M5441x.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/include/asm/m5441xsim.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..d4ee1eab7c4a 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -99,6 +99,7 @@
 #define MCFINT2_PIT1		14
 #define MCFINT2_PIT2		15
 #define MCFINT2_PIT3		16
+#define MCFINT2_NFC		25
 #define MCFINT2_RTC		26
 
 /*
@@ -333,4 +334,10 @@
 #define MCF_IRQ_BOFF1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_BOFF)
 #define MCF_IRQ_ERR1		(MCFINT1_VECBASE + MCFINT1_FLEXCAN1_ERR)
 
+/*
+ * Flash module
+ */
+#define MCF_NFC_BASE		0xfc0fc000
+#define MCF_NFC_SIZE		(0xfc0fff3b - 0xfc0fc000)
+#define MCF_NFC_ISR		(MCFINT2_VECBASE + MCFINT2_NFC)
 #endif /* m5441xsim_h */

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
