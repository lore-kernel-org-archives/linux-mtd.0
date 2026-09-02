Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E8C61DD6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtYVsz+ZGL/uApaRvi8IbugzaExxBCBPH0H+YC23J7k=; b=avfQnEQT8ZfNav
	XffP8/B1yfTyZNfTKgHfjdG6KPe5C/le/cGd34u+GdTBQ2SMBXP3fvpwsrr2/+V/DgsYZdoEwdqIN
	l3RyXskng1w2Cb+zNdfThhz+lZxZShRiapIFx7pkna1j5SggO83heB51cetRvxj5uQ69WviMQUbrc
	F51mhLIh3CHk4supryhjSeBk/FTkwMt5qr6YlsjH9tK9s9Xz6vHS354qbnKrW2OanCN/jbhsA+LIu
	AbO98wT7sGrBPT0bZMEi14yNVGd9LUzIJKWWoiy21AnMOv7+/TCk5pNIok5xRFYE0HS33B8U/w6ot
	7nOkwtO5Z3lSsWCDVJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oK0-0000000FKtI-0gOH;
	Wed, 02 Sep 2026 17:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJy-0000000FKqr-2SU5
	for linux-mtd@bombadil.infradead.org;
	Wed, 02 Sep 2026 17:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IWMiLXP2vfrqRyQznAWNKhIoOiuG2w/T2zoaxLRzsUw=; b=LMLbk/AQVL6+yorldqx/1RJExy
	F3CRTTgbo5cfUwkk8vD6w++RPNaStXMYNkDD0h+zN1zjgry2ROgpQ4vvPzmEvPJMeZTwON2CrUpD8
	q4u344VZc69bAtpzowEGyxXldqTPSlZKw7b4fywuV8QmdX6+z9WN1RACpos3EDWJEJ5ZL/LTZcp6Y
	uBvuflIcqTh9Ve+5qM4UyHE5gWeHfZjzaVy9qgAla8+pNtQI/hvzw8TnkS0alrRMl4en9LX7yqL9E
	l4qnsfTFdYCJcsQTnfg+SODQNG/254zJsrfin9wcqcrreu2aIEAy19F1f9Ps3TEBn0axnOJ2Z5YeB
	mX+QA6bA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1oJt-0000000CEfv-3r2c
	for linux-mtd@lists.infradead.org;
	Wed, 02 Sep 2026 17:00:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BD891A1977;
	Wed,  2 Sep 2026 17:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FE826053C;
	Wed,  2 Sep 2026 17:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98AD511C795A7;
	Wed,  2 Sep 2026 19:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IWMiLXP2vfrqRyQznAWNKhIoOiuG2w/T2zoaxLRzsUw=;
	b=GCvglVqfIAwaR67asJsY+OmbUnBoAqpWJc81t/t4E/VrtNfCCsAV1TV+LUflrKZG5GWcWa
	951tYos2WtXf79FVQxap7kD9M5PMSn0yV5zQ0MkT7RVLwiXoiGE6bWR4MxEZf1IyYof6he
	P8zJvV3n5vlewV9sfh9DQ+mhfAwVef4nldUJNYcOrNZcWJlNCin3tWrNFyyJn6dk19vury
	eJzf7ROmjd4MJQS9nH2ZcLXcoz8rjYK1hUeYeHu1n/kXlqJhYA6cVdPs+HG9urxQjEhmce
	7GCk6snYu4up7o5iqJSvTqp5W/AqnYIaMkKrG26vy6vLeOYmbot7bUpMyGXz9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:22 +0200
Subject: [PATCH v4 08/25] mtd: spi-nor: Move the SFDP header structure to a
 C header
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-8-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_180018_040273_FE092566 
X-CRM114-Status: GOOD (  11.42  )
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

The sfdp_header structure is currently defined in sfdp.c, whereas the
sfdp_parameter_header structure is defined in sfdp.h. In order to ease
the reuse of this structure outside of the sfdp.c file, move this
structure to the sfdp C header (.h).

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 11 -----------
 drivers/mtd/spi-nor/sfdp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 87b2d0a0e9f4..c40099a27cb5 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -34,17 +34,6 @@
 
 #define SFDP_SIGNATURE		0x50444653U
 
-struct sfdp_header {
-	u32		signature; /* Ox50444653U <=> "SFDP" */
-	u8		minor;
-	u8		major;
-	u8		nph; /* 0-base number of parameter headers */
-	u8		unused;
-
-	/* Basic Flash Parameter Table. */
-	struct sfdp_parameter_header	bfpt_header;
-};
-
 /* Fast Read settings. */
 struct sfdp_bfpt_read {
 	/* The Fast Read x-y-z hardware capability in params->hwcaps.mask. */
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index e8ed814c6530..2cbe22246c5e 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -149,4 +149,15 @@ struct sfdp_parameter_header {
 	u8		id_msb;
 };
 
+struct sfdp_header {
+	u32		signature; /* Ox50444653U <=> "SFDP" */
+	u8		minor;
+	u8		major;
+	u8		nph; /* 0-base number of parameter headers */
+	u8		unused;
+
+	/* Basic Flash Parameter Table. */
+	struct sfdp_parameter_header	bfpt_header;
+};
+
 #endif /* __LINUX_MTD_SFDP_H */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
