Return-Path: <SRS0=MuW7=32=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEA1C35247
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDD821927
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2020 20:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnT9et7p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvHjQ6F0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDD821927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q9yNB++OlkWVKaL0Egf+09P7eDhFGdv9loqpvCjmWOY=; b=jnT9et7pOqn6VsI1lYhf9Ozd2G
	WCQf7sV8yavEqFfC3WY7HJ/+7RAbk8qUdycipJNCISfQEiXD0LpocdoPp46vueO1YyhDzJjwnoYpH
	qmP2C6AGgKM9QTLOJFToTJUPaBcFsErMNVF9arWRQ70d7IbBVmd7orl97NNgziAaUxJQmCNIEY8pQ
	v97bExGJmAuJDQ6b1ICpeLHcS3YXvY8cD0iQ7pJTuRL6nV90VitWh/9Kly+o/qu4gqI2ukDYOcREA
	oFehirjoWryNFQ3pMnksjkzDrRT3qWSY4ldpPEFsm8uWp9k8TXgY/kYfrZbSNCx+ObbfklEhg3DU6
	iWlEdOKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izniJ-0000Qx-7x; Thu, 06 Feb 2020 20:25:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iznhX-0006vL-Os
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2020 20:24:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id g1so229304wmh.4
 for <linux-mtd@lists.infradead.org>; Thu, 06 Feb 2020 12:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y1/vJoGTEz84eAnDtx72Ndu+MPAZCnA9yhw+teLVXo0=;
 b=dvHjQ6F0W51wq8W5czfthpMZ1OOWrPNrp5Sxlg31PPtN5sZZ5mjIZ6CJJq/QCdHS+N
 GevcgPNDocAYx3cth54wnX6JdqqDZvzoYE4UY40KZVZGsLUqOkkZBTK40dohqBosbt98
 wRdAOi4FtQrh8Mqu6W4vF1RFfAXsF7hkT8mfpIpTkjTb5LWsKETgmq6B1kzxmUb6OcYa
 dc+ZuP4D9xPYPQAb1C2yGZ1ujWkaiqMGEbkNROXqXFLnqYcB+i7Xb8rC7fwdfKxwhm9j
 UQEGVw0X45ZDnGU7K2+PSD3FJ4pw7JoqoTM+c6GRit0uasA4yWLyHHjnHfFVMPw0z5xi
 n2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y1/vJoGTEz84eAnDtx72Ndu+MPAZCnA9yhw+teLVXo0=;
 b=bxiXc+g11YUJg1Vc1c4O3SHZTeOGjEl/KFmtF4lB7ufuV7zXTbU2diEO31Ie+Bo8Op
 vsupWWwRfNEsO53QmGnH6AqzOk2h7gFIisWQfh6TU8LSYGN/kpxZKmUEggyo2dm0ghT3
 V4xV8IHWMIZT8mhR9lj4xa7W3bfhQ4LUwQ7UGGdYur8Dmx+LCuoPiMDpLtXPQs281uRp
 asMER3IjliRI6Uir9T5xiuLAY/yyCZMPqD5e02/d5NMPuB8qrOZQkP2KWr6j64lw4ru7
 HRCy3jOd+rVNZdyniWrebq/rdeFkVodCuY59UjvAfIY+ttCZbL+wj3HBK54m+wtg6Otr
 fLaQ==
X-Gm-Message-State: APjAAAXrWKTEr6O7WXZVjXwzIIjg9LZw+4UGc4DOIhqOv7LVVGJnEIc6
 Lp1watMeCi/pAJeUzjdI9kE=
X-Google-Smtp-Source: APXvYqx/cxgYne1/eULS2VXuvJcJGurz2A26EKeyBvr3kFw/2Sd/AUf/7GtI4bYoUZi+tIE8evOTog==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr6254021wmb.38.1581020678504; 
 Thu, 06 Feb 2020 12:24:38 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id c13sm539929wrx.9.2020.02.06.12.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:24:37 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] mtd: spinand: micron: Add M70A series Micron SPI NAND
 devices
Date: Thu,  6 Feb 2020 21:22:05 +0100
Message-Id: <20200206202206.14770-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206202206.14770-1-sshivamurthy@micron.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_122439_840181_62DC2B99 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for M70A series Micron SPI NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index a8e947609cd9..3d3734afc35e 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -133,6 +133,26 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 1.8V */
+	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
