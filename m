Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A57CD68E4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 02:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VhoBy5uJl+uhRYwp4CXmOzloaR+3ANxUiTV+ZUswMCg=; b=cz2
	1hFsqOx1LMs3PS7snSPtlU1PlVrKxzCyrETYXScehdSK5iqoDuxyR5ODCkQtDqD4+agRPTPrFID8u
	hbonavzWvIMfHLBvUwlIzI2fwRPDDMQhekwfmukzAs8d4m6kqVkqy0RNMb4ko5HVzn0jrT8w2lqwW
	cStREFlGEtDaWjOGpFDniiUcNkB2m7W1eITb+ElwdhUnuCBw8ThYlT0jhTmNBxEfFbpRrC5cNvTf3
	OLB3QmJWE8FVmehRw0Mjq3PBVDxV/R6zxABiRbEHo6tQfsrYs/lKLQtsZvjsO/HA23y3Cb+/cbtSM
	LzYXwPtIcvTh4h30+GWXx5bpYE7p4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2mu-00C9Uc-1J;
	Tue, 10 Oct 2023 02:48:00 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2mr-00C9Ts-2p
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 02:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1696906059; x=1697510859; i=dregan@mail.com;
 bh=k7OqscskxPrOo4+D54irAaRmzQ2jaPkCPJPV67w8ubQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=jvQPhBPUumwuib/AqS8Hi3W+DBwRamQ3yZsHaiGW/xwaDgxKzNzWStxPeUccRq2g1cPskebYvas
 iiwGwak5J+MgIuS6UnLePNICqrtZBYo37qbKAtClOKOF+WdNSupXPA3gmmIe/oGOE05fKrFb1+vtQ
 xSeAkStRrEVlQNiOtE0DUZ8qr5YZt8Km4DCIxMO2VRZSwFNgBRQ7udLxdUuBdbiir3E4Asyx0Pnem
 XR5/WpqGf2S8O9of05uDkLI18rQAnqOxGMYsNA5kVLEtB68pOBydMk6HAtD3HDdA3x8v5XE6xaHAr
 5+PEEQr+Dp6JYsG3e2fSxXi8y30WvVumF9Sg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa01.server.lan [10.76.45.2]) (via HTTP); Tue, 10 Oct 2023
 04:47:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-a3c12bff-7281-45c4-a849-bd5ffbfcf2b4-1696906059694@3c-app-mailcom-lxa01>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, dregan@mail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: [PATCH 2/3] mtd: rawnand: NAND controller write protect
Date: Tue, 10 Oct 2023 04:47:39 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:msmnoa+Epd1H0xSJZWc4Swr3TK28VeQIWDmRo6RQqJ7sWT0OjaE1/SlnZhNtjEmF48u3F
 jgiMveJcxtSVJv/di2kTmueBk0BuXEhBf6I4YCIU3hk3qX9FCEhrGWWxLFuqzRXenN9NB6XBJI3n
 9E3Njr/uCtcmZpiXjeewRwucYc3VRqFcqkF07KTvt/wx7ujF/w3uFkBq+fN640ZqhU1AgIcQdNyk
 WRdyBUjtpsMWqPkar6FwarV3KaYbySqTlrbXYFrpoUqp5L0V2OT99AaIYrwD/X1U81AHkJSmamcL
 +8=
UI-OutboundReport: notjunk:1;M01:P0:v6RCWC3oYbY=;mNCIm4raBVCls1i07tPwFs9VMJb
 +x9zh0bd3oXbM0+iomXbR1YLbchfy+GwaA9RnXL41yWHgkDyDbUAKrbJx2Ahi+HXytQS67hdJ
 ewY5KjHhMY54a6pDOiTZHq5UiOlYP+sdALz3RxTeq/1SCpH2le+Jn7S2JJHpBHUuHlRcR4FuL
 8/y3F5bdkyn8Flz91BNsg6FmQRWhlHWfttZvqOS4LK+ZW2dnE2rYX3wx8VE5aNGAYYMlmOCNb
 o14qyF4g7uUcvCtVVI5DcZY1shr0asMrjs8D3IJN/ExNmE6fUAeZyaPVy6sUPklMoc0juNlzF
 EzvhLoaD9V2fGef90RuNdOsRTasKso8O7vhXtntO5HThxuLBHjerJp98g8eqEmSD1G4tWdyJ3
 wblcT3o8dizMgctWT+m8v/bxQC9zfWek7zyMWYdvwIByUhbqSYSN00cU52tcsMgCe5P0VctvP
 dmA7UJjI/ZFoDE9ale+BmZyyuKg7Yfzbtd6HJyoMnMEi5oNf/yw9xeuxJ7TVfTPe44R6mrqtB
 en0gzcGMphK8GLjIvwQuY5j2jAAZpupD1GOWKDNKB/2f6kWFGrGhONzCxbDu9iu19qVsTes+f
 A9x0XgjSK1TjKQYGm29GpCedqlcsXnuYiJMzSvF7taNNrj2KqGYn46uZP7v8RTbUShoE2Fec6
 RbjFhRwP/t4OM5hHuVU5LNhm13MOV1AgsSyrryglJrvXFwIgWLGqJB9h8mczwWDwzytIc1N5I
 5DhxEqBjvL0BpR6khI69rTWJlMqVsS6NN9h6UHuVIfsNQGQzC5691kEq2DxrYw6rxPAD/S5/U
 9lGAAz6iqmynp3ZvtgJzs1Lg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_194757_985631_1D15982B 
X-CRM114-Status: UNSURE (   9.26  )
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

Allow NAND controller to be responsible for write protect pin
handling during fast path and exec_op destructive operation
when controller_wp flag is set.

Signed-off-by: David Regan <dregan@mail.com>

---
 drivers/mtd/nand/raw/nand_base.c | 4 ++++
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 47cc2c35153b..38ed0ced5b8e 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -367,6 +367,10 @@ static int nand_check_wp(struct nand_chip *chip)
 	if (chip->options & NAND_BROKEN_XD)
 		return 0;

+	/* controller responsible for NAND write protect */
+	if (chip->controller->controller_wp)
+		return 0;
+
 	/* Check the WP bit */
 	ret = nand_status_op(chip, &status);
 	if (ret)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 31aceda8616c..f03b9d7f48b8 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1111,6 +1111,7 @@ struct nand_controller_ops {
  *			the bus without restarting an entire read operation nor
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
+ * @controller_wp:	controller responsible for NAND write protect.
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1119,6 +1120,7 @@ struct nand_controller {
 		unsigned int data_only_read: 1;
 		unsigned int cont_read: 1;
 	} supported_op;
+	bool controller_wp;
 };

 static inline void nand_controller_init(struct nand_controller *nfc)
--
2.37.3



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
