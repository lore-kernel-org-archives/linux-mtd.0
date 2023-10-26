Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B482CC25B6B
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WTesvbSSv46QRfXwREj8+uaCI+xPRGadQGBVrT0KwIE=; b=LaX+jMci9SlTgM
	wTBuXGrMbhN+s4APSYYl3w7PCnxwCJGnYJXgh0M2ZaHbM70NRdXpxa7lFRs63pneikcJFWeltrr7X
	1NH/z9KIY37nBmykLyjMcfsaefHG2Z5tdTD/Rcvq+ZOndF4kNwiv3xBiWfgIM5uL1fZ8Qp0ApIc9j
	zum0x3s9BiIw7wyYN1YAz9le2Il+uzpW9b19WxsUcqUE/34DRePKMv1YdNofOsizFuabRgDl/7HMz
	Ztm02lnMJuL5GIJYUQUnxv4xd/gOfapaX5YmyJRaPortg7xn4q6bUgmAXJ+ZdiYo04xNpkAgDsoN4
	BoJuoUwAnmgNdIfhyoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DN-00EnNL-2l;
	Thu, 26 Oct 2023 15:24:05 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2DK-00EnKr-0U
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 15:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1698333831; x=1698938631; i=estl@gmx.net;
	bh=SWTSfYAJ6wjPq94D3WZ59HwtQ06vUm4Q2LB7f5lEL+M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Hq+oYA1A4I4B8RJ8Qblzlf7M8EW+HW5HaZJYlZpwbJaCqtciQeFBVJE1W0Aqyb0C
	 5sHj3gTP9t5S2aN8VbEs3mEZTu+Idom1bYp67ECkEYvyYQFqQzlWrl3Rr20RSYMY+
	 ztAqu82w77h9/J93Bi47rJD7u3jr/65W+Qwg0rNLrUchQUlL5K5/s6t1a/PM34jVt
	 f6d0O9+9Gm2NbsYo5BJPG6EYnimPDhnhuJr/hG6NLgsjb0girLZH5mgeChn6gxbq7
	 1i033FJIcwR6lendHroDPXFimOjhfQjifashQInhRtiBnDKbVWyd4jyTu+vAVIMmX
	 1zwr4joFgf3fbbSOFw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([77.246.119.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9Wys-1qskQV0yTU-005ZfM; Thu, 26 Oct 2023 17:23:51 +0200
From: Eberhard Stoll <estl@gmx.net>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Chuanhong Guo <gch981213@gmail.com>,
	Mario Kicherer <dev@kicherer.org>,
	Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: [PATCH 2/4] mtd: spinand: Add support for clock to rx delay setting
Date: Thu, 26 Oct 2023 17:23:03 +0200
Message-Id: <20231026152316.2729575-3-estl@gmx.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231026152316.2729575-1-estl@gmx.net>
References: <20231026152316.2729575-1-estl@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fEubDti3aDbWQ3NePpK//inzhLn2La+uc+hDR3Cl0ol3T/Mk1wb
 jcAB5EmgHOJKnIEq/zMCqNuV3qpoNPkzOyIJu5qanQGoY1ua/xiB2LMxI09pOZPEn0NTLWK
 p2hq59e4uLShkHDH0a1QW6WBV+RAcmIqE24zkuG4vdcIkqpXAlvXpTl8XFZvkLqPJSEuvoR
 ptA4GN6zN+ds26T6j3wtw==
UI-OutboundReport: notjunk:1;M01:P0:WecwLtkKLQc=;XuITYkWd5CcgSFoGdVhSqEemhnG
 boarAIRBxF0Wd3bgiAB7N7W3pBtkMxZ2YPxaa7wC3WKv8+VRFCtQxa2dEsJ6R/uKncQbRLhdP
 OFbFkVZeeZ3w/X7oqujToEvjvkBqQDj79H9EIVWPKR261xIjU3pY9j1BygVNH4yR+rJLrjcWx
 K1QbBy/NR+EBlvIK+oe+mGadp+oexIUyB0PObzjWw+PBGX97nWj5f1HLRhaoCcvreUpBAbE0i
 GbUq/g3f5OJFRnMv5Nt1ogj6GUnYE+H3Dx1bqHzguHQyQ+j6wR/sNTHmIcSjbcali5fFMSHXy
 1fA13a0OxpxvcSzDk0eSgft5rnipdEttQsZIwRKzP13bpEGnXfw8gurJEmr1jiGe+/NCA7ryE
 7wyjdsShI2c87RF7R9JXLS5S0FLpxtQZIr92D2vQxMfOUh3/DuZuD/GNXFebxWex5WzqBCHCM
 HoqWClOthAeNbkT5CktKkiequA3gCABhWIOekZiEW0AtwQhXLOkZR9wVPcniehIKpmOlpqWOI
 2HPBAtCe0Z777rtnXBIwPQr4Jd49vBA+WRBiFHjm6YEU6czpEDcJdWAuWaR9IBLZhTjPPtAvE
 PObjKOw9AzYASA2NgtXyTYsztCyQxdLJm9wwGazCkjs3Eb0iolFwcMqA6/gpSuUsWq/6GCWcS
 V91T+jP8+6E8+aBCVgPoBHlIRZVBXyNEKvsrCcu1uhRY3m3WyK5hsEkD8OPBFNAJ+iVc6rFQZ
 fjo4SVO72M9zW/1z1O6YCNnUztHUPf+hj0wAvEX+hnY9QtMG9LPoIkdgb80TfY63mxJiaYXFv
 P4OOucVbBIQqgI9DUORmDPQnwQaGhZTibtQ9MQX0bwBJWsoEBUywp9q7OD4JhOWTAGGp0PRjX
 WOyq4nIP4HuALfEhJ07q+5xF1nTp9255HpwFbX28Z2EDPGDwe2YBn7Iub4Bm2BpRJQhQf6pnS
 TiFwbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_082402_756533_868BD1D9 
X-CRM114-Status: GOOD (  10.87  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Add the configuration parameter to set the spi clock to receive
data delay parameter for SPI NAND devices.

This parameter is often referenced as tCLQV in SPI NAND device
data sheets.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 include/linux/mtd/spinand.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 393ff37f0d23..e546b0d1f76f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1113,6 +1113,8 @@ int spinand_match_and_init(struct spinand_device *spinand,
 					       info->op_variants.update_cache);
 		spinand->op_templates.update_cache = op;

+		spinand->spimem->spi->rx_sample_delay_ns = table[i].rx_sample_delay_ns;
+
 		return 0;
 	}

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 3e285c09d16d..fe34d5259c97 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -326,6 +326,7 @@ struct spinand_ondie_ecc_conf {
  * @model: model name
  * @devid: device ID
  * @flags: OR-ing of the SPINAND_XXX flags
+ * @rx_sample_delay_ns: clock to rx data delay timing (tCLQV)
  * @memorg: memory organization
  * @eccreq: ECC requirements
  * @eccinfo: on-die ECC info
@@ -343,6 +344,7 @@ struct spinand_info {
 	const char *model;
 	struct spinand_devid devid;
 	u32 flags;
+	u32 rx_sample_delay_ns;
 	struct nand_memory_organization memorg;
 	struct nand_ecc_props eccreq;
 	struct spinand_ecc_info eccinfo;
@@ -378,6 +380,9 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,

+#define SPINAND_RX_SAMPLE_DELAY(__delay)				\
+	.rx_sample_delay_ns = __delay,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
--
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
