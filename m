Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B13C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B2E222E8
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 14:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dlC0HKQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B2E222E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cRPKjfwYUpo56DSPkluFYerQLnjaOVgO3iFB13Mnmj4=; b=dlC0HKQ+9sAZoXnWayQqgesnB
	eyEKecxn8lGKuqrnb9iwYppcMcWhjMbs7XfTiX3cL0TjEhyQws4pjfycmxrlvOdSe5idYHLyrv5cg
	/NbzDmw7GDe7599xbadVyUKrYWzWKh8dhl1mhF7us9fl/BQJbbWYG8WGduKlXcTeL9lv5XT7Lz2zA
	DGa/2NkpvXqxGIvv9g5V89GduEgqKPAturBrlQJL4oKtHQLaQEoOcsBncqYDvt4+5DxrVPOkt9ZMo
	BZNM3/aUCaDqNAQP5kAt8JfqP/tmrGVSNHNpXQoiyUB/MC6x/5hmlxPsdtrnoTn0IDTBwJc2ifAx6
	9LJZghDng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGkKm-0006JX-Jz; Fri, 11 Sep 2020 14:47:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGkKe-0006Gu-5y
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 14:47:21 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKU-0006Pv-NW; Fri, 11 Sep 2020 16:47:10 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1kGkKP-0006nd-40; Fri, 11 Sep 2020 16:47:05 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sergei.shtylyov@cogentembedded.com,
 boris.brezillon@collabora.com, michael@walle.cc, j.neuschaefer@gmx.net
Subject: [PATCH 2/3] mtd: spi-nor: sst: add missing write_enable
Date: Fri, 11 Sep 2020 16:47:02 +0200
Message-Id: <20200911144703.25409-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911144703.25409-1-m.felsch@pengutronix.de>
References: <20200911144703.25409-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_104720_263531_ED17841C 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According the datasheet [1] the WEL is automatically reset after the
Byte-Program instruction completion. So if we program the device with
byte-size set to 32 and starting from an odd address only the first and
the last byte is written. Fix this by (re-)anble the write support for
the first SPINOR_OP_AAI_WP sequence.

[1] http://ww1.microchip.com/downloads/en/DeviceDoc/20005044C.pdf;
    "4.3.2 WRITE ENABLE LATCH (WEL)"

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/spi-nor/sst.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index e0af6d25d573..644252e27a2a 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -79,6 +79,13 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* Write out most of the data here. */
 	for (; actual < len - 1; actual += 2) {
+		/* Enable write support if odd address was written before */
+		if (actual == 1) {
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				goto out;
+		}
+
 		nor->program_opcode = SPINOR_OP_AAI_WP;
 
 		/* write two bytes. */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
