Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E35C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fK25cMijRsoFmedzb/7QqLbqv/RqZpzcr8ly3xv/44Y=; b=VoH4aho64BPgkE
	DZHANdAFPoGmMLdGe52npZyFvAlzjB/9+0cTZBbmnBhZFIN6TooVXxrQieHb9rff3mDcyTq9InWSG
	YrOB3NWBZs6myKh5r5h/A612wpPMM0TZFOqA42qseXq2RwoIBp7J7aMT7miwRr38iqxWzjnjwrI+G
	hWeY0mDpkBPUDzkDtYUYztt/8qJPxvaNcAuR/V+NpCQ4LOhwStOuIXhpYyc8eB0eZ/OztKaCRUvKO
	p27RZjQZvEXUCS435w2UC5uqL6Mploezyr3jwLBjw8rQ751HmVdM4mtQ8Sb2aYAZyrt6SOdO+kS+O
	3r7ec2QoddF8Y0owNXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzGD-00Fwru-0l; Tue, 01 Mar 2022 09:57:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzFR-00FwdE-5q; Tue, 01 Mar 2022 09:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646128608; x=1677664608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYD4Ydks7S4RUSwEQCJo3IkJGKlxd1z1rrnN1HALZEE=;
 b=gMpz9HdBgTeKk1uX9ULp4ZzlREsCwM1EvZ36SsCPFf3P2v6akUeNHpUk
 LL+FnRCVAPP9job22Mnr9Adp0Tl5lOk3KiNG0ZIvcgCBhRylDxPMP0UhK
 Po5piVSbabn2a6ZTbaXnw0+D2x0xepybIZhSZwuuMCKp+PM59RyCm8MPh
 3OS/2cr4rAutnpRKX9cXxyFLGEt/HXBt8G+NUdy88BOEI16tBW3DPim4W
 psP4ZuSVkpeZX/u5VacLam1D7RMn8kD2jvG9UgyHAemsrbcqhDX8a+PSd
 frEK52TfclFPpHfqlST8v0fHHU80Qe+diGE7E8WrQrLOLip+4YI5RrJN/ Q==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="87367837"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 02:56:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 02:56:48 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 1 Mar 2022 02:56:46 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: spi-nor: macronix: Use post_bfpt hook to fix
 quad_enable method for MX25L12835F
Date: Tue, 1 Mar 2022 11:56:40 +0200
Message-ID: <20220301095640.313852-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301095640.313852-1-tudor.ambarus@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_015649_307894_CBD4C9AA 
X-CRM114-Status: UNSURE (   9.15  )
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

MX25L12835F does not define BFPT[DWORD(15)], update the quad_enable method
in a post_bfpt hook.

Reported-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 3d0e34c9410c..20fab9814b80 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -37,6 +37,9 @@ static int mx25l12805d_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	nor->name = "mx25l12835f";
 
+	/* BFPT lacks information about the Quad Enable method, set it here. */
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+
 	return 0;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
