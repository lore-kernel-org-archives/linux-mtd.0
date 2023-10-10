Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DFFCD68E4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Oct 2023 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zITl6uvWICwwIs4Qb2t/0EbnmdVpWbfEzl+PEbzT/hA=; b=Vz3
	LNyPRnYS0v/rNQqmGkjXXDEIOc8kWbtOdKJEOpRKEHXcyg9lXbsp4Gu34GpUh2RGHZiERcKj6sXnk
	bB1i1IaxTCar/Cc54JyEN2C2gw6M9PUuTuqWB/IFIQjmF9ccRvsuQBe6wf2h5tw1F2c8mP3k3Jgmh
	fHymiTWF88yWoaZsy+1dXKGDhfNDILExIoVALEMZIMpwDuWY7BdriIPQ65VRZ7spKtTqNzLIBwXE6
	x9ctnmumgfilQ3qGeTdqRjLmxI23Tqi3rxlbLd1ItHqQoiGVDifyvSrtAPCriKPdOX1l9UwW23WiQ
	IWvw2eD7tTgX6lfyLTGqCXYTdHVKUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2lb-00C9KP-2a;
	Tue, 10 Oct 2023 02:46:39 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2lY-00C9Iq-0I
	for linux-mtd@lists.infradead.org;
	Tue, 10 Oct 2023 02:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1696905960; x=1697510760; i=dregan@mail.com;
 bh=DNMOlZ7oUikNT3ulMiEDM6mF9jRFj6PFg+JtLK0heS4=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=hiVkl7IgN/oY20W4OxNcdViEI9Z8HuMk0b4D9BtshyFSgBQI7Zy6jrsHT0h9hSoaKfRduZVZheG
 lsVDgOYEpRN/CVhuhsAShY2vBlt8CHKrgNo5GGCBCVsA3vDPwmFUA78Da7j4WOgFFOeOe/eMKp66C
 mh3TQ1tmY4JEHkcbvZQkDWkYFIqxsi2GpwOx1CqFRTsMB5wroh0A4sUBgVFXPC6LND1lyJJTffAeq
 g3dbIpW5IwVu2hxpafy6dAi4AQoVF0vBqUYuLBtSfZcEhw6dK5sIAqNcPJcdU2/HCwDcU1U5I/aTD
 Qf30jEYlNVsF7PLfu24IuzHsaYaXGrez+EFg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa01.server.lan [10.76.45.2]) (via HTTP); Tue, 10 Oct 2023
 04:46:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-003579bf-615b-47b8-b1a9-f0d37f650f45-1696905960546@3c-app-mailcom-lxa01>
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
Subject: [PATCH 1/3] mtd: rawnand: Add destructive operation
Date: Tue, 10 Oct 2023 04:46:00 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:trm6hrX9P39LJUr3Vsk6GccP8SSdKruyT1iyLkyih4gJ9Gjzh2InIRG6vCcQWrdfD26pA
 426FttqH3FOeYCZeLYvTOfLdYQ7Ajb9buJ9IYQemi4+/aZiW2HHOKXXZvWSg6IneVg2OPtPhrTSW
 jgRwWj/hJhNRZt9+lo5M4mnfPD/VAli4+iJnD7LZYyuJCuiqXeRBwaTn3NNgEO/V1wtIyGAP3OTJ
 E2rS/dDYnYRbQVecrZfmzMdS9RtQP8SVE+UvbnFEQkA6vQ2u+FzocBHcRtUSn10MMgTe6nNe9z2T
 XA=
UI-OutboundReport: notjunk:1;M01:P0:+/Wgof06lQk=;rvSIkMaACs2zqVnEcVdnm3JZCFZ
 ubJ7ihs5WfZ+4FkAbj4P5+0efZXnKmXTmaJXYAabgOh3Jjb5w0ZuiieqqeVS8Y0tgAsicIkqZ
 g5+qovWRUkxs/+lauvbrzoQXXaTmXo6yZCkKGQ/Y3fTjvqghd86mfMZ+LeUwys2HcYsFv/WzZ
 L4hjrAfdSFH2QJXE0GDc4bWxLBcRxXheujL9nSATbC1nJsLGaHqlv7z8jshhNt+DGUOgtEZH0
 sUamZj7gILAbSj37NcsilVG4JYHh2RWEqtOjqnlnJHRlmeJ2O2cbEhrESgjp5prpk60IvLSv/
 hGEB8JusoFMzyw28cbIs3iEhbU2NRm+RHIJfsqaFuCyr3CIbJa/O2Qwf+MaG7BVxcHl7oxHjV
 cLAwXPkb/9Wiejp+TXU9QCwFOBwwfitpKbfwooWFd9Gb8BZsrRPSxLInM74fZLXvFMrZbgfMx
 hvucSX7KF7loOqvDT3QHTu8t+lVn6NnMWpiVxL42e1qYjdGy4SpJ+VgRELVnJj9ohf6ZuKITC
 t0sxhO2P3LH5e9FXqzPMMMtiM+L/qousBq7xE1YvuSQvueO225yO+Rg04ML/UyY7Zd/9Hx3Sk
 CphoqSQCa2LsiR6gKeqMNPxQQ8m3x4pD+r40clxddrDzH6nb9Bd9SoJzy6CFTa1Xv/aYLgsMW
 soSLoUTbtvahalYDdbRH6FD3IKs3Pd60PETLJAPDCET8wysQmBG53mQc1WG82ERVBhzgpS/0C
 AGcaAYkKBUDo0THf1GJYEatuPm0kXn4ch0fqThiYIDi006bs1GUeGCEeMfnalB4mddLHXJAEw
 3UAGruMtndsXslha6J9bi+zsH5p22lkQMpVhXF8t7vpiM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_194636_379088_9038E303 
X-CRM114-Status: UNSURE (   8.88  )
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

Erase and program operations need the write protect (wp) pin to be
de-asserted to take effect. Add the concept of destructive
operation and pass the information to exec_op() so controllers know
when they should de-assert this pin without having to decode
the command opcode. Based on changes proposed by Boris Brezillon.

https://github.com/bbrezillon/linux/commit/e612e1f2c69a33ac5f2c91d13669f0f172d58717

Signed-off-by: David Regan <dregan@mail.com>

---
 drivers/mtd/nand/raw/nand_base.c | 6 ++++--
 include/linux/mtd/rawnand.h      | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d4b55155aeae..47cc2c35153b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1494,7 +1494,8 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 			    NAND_COMMON_TIMING_NS(conf, tWB_max)),
 		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tPROG_max), 0),
 	};
-	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+	struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
+							      instrs);
 	int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);

 	if (naddrs < 0)
@@ -1917,7 +1918,8 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tBERS_max),
 					 0),
 		};
-		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
+								      instrs);

 		if (chip->options & NAND_ROW_ADDR_3)
 			instrs[1].ctx.addr.naddrs++;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90a141ba2a5a..31aceda8616c 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1008,6 +1008,7 @@ struct nand_op_parser {
  */
 struct nand_operation {
 	unsigned int cs;
+	bool deassert_wp;
 	const struct nand_op_instr *instrs;
 	unsigned int ninstrs;
 };
@@ -1019,6 +1020,14 @@ struct nand_operation {
 		.ninstrs = ARRAY_SIZE(_instrs),			\
 	}

+#define NAND_DESTRUCTIVE_OPERATION(_cs, _instrs)		\
+	{							\
+		.cs = _cs,					\
+		.deassert_wp = true,				\
+		.instrs = _instrs,				\
+		.ninstrs = ARRAY_SIZE(_instrs),			\
+	}
+
 int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_op_parser *parser,
 			   const struct nand_operation *op, bool check_only);
--
2.37.3



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
