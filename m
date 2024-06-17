Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A56C2BBCA
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80Wgazs9sD3ZvSmre64iKNXGs5hAAq75benAieKS2pc=; b=wpN3oB9/uaiMJU
	FcnSnoiDclgF+Y52RN6+IHEc3c1pCGEjxArDxe16ObAooMv9lQSgql6fe4X3RDhz2hsDYuZIXukd7
	WllC9rXuYW6UGTjQ0yo/Muv8DYbgktVYEu99B158wI5dMQflJTgGZ9BpsnjcNTo0sIU6XXq8sHP28
	1bULTWHbl2BNvb8v4+kvy6OBgt7Ve4hsa+uxIfROZ59dPXa6zkfmufqqLEvRmNeRQ84spH9volMPq
	fH9XINxJchqTiO1oAzp+79P8aAnWUbsb+yUKbcmmcy2YUCqajVpSDms8U3woITIzf8vDerzfZMO44
	80yq1KAHkYUXiZDney0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCWG-0000000AsgL-0ACI;
	Mon, 17 Jun 2024 13:35:36 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCW8-0000000AsaP-3N4t
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 13:35:31 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 65F13100007;
	Mon, 17 Jun 2024 16:35:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 65F13100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718631322;
	bh=6/RL8IVZXxsdzvdm9UvKBkh1bDI5itnPbUoDhIDETh4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=gaPSf/+cuRtm7oF3DuCWDQfBXa7rxFiBrGu1l85VOZhzHH0ScMfuL4FEikFv3fcHw
	 tMTb4dW70EgkcQ5FBobWGQaH2i0jmQaX6e8CZyvIdWBgyISK0e6rZSFXrgArUlgClA
	 sQlFISL7D1f+2BW2Wg9/0Mk8cTAOIPZiaJJjArdPA6NkOwjWHcuMTLLmNfPWFUqFA4
	 KMVPQq+6GSXLaxpCMAFpPCdGVepbfIXkfA87U8uVg96c1PSNN/74FXxhTrTkzmRjzW
	 JReLwX7FiAZcS1ghc0auFpDvkXMW8hKwCMKUe5ZmvNNcoJj7SCrC4lTwUPtLokkHJB
	 F4f6gdinvp/iw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 17 Jun 2024 16:35:22 +0300 (MSK)
Received: from CAB-WSD-0004828.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 17 Jun 2024 16:35:21 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, Mark
 Brown <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, Md Sadre
 Alam <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 1/5] mtd: spinand: make spinand_{read,write}_page global
Date: Mon, 17 Jun 2024 16:34:53 +0300
Message-ID: <20240617133504.179705-2-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
References: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185966 [Jun 17 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/17 11:22:00 #25639124
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063529_238187_345E53A2 
X-CRM114-Status: GOOD (  13.75  )
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

Change these functions from static to global so that to use them later
in OTP operations. Since reading OTP pages is no different from reading
pages from the main area.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/core.c | 24 ++++++++++++++++++++----
 include/linux/mtd/spinand.h |  6 ++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfed..807c24b0c7c4f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -566,8 +566,16 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
 }
 
-static int spinand_read_page(struct spinand_device *spinand,
-			     const struct nand_page_io_req *req)
+/**
+ * spinand_read_page() - Read the page
+ * @spinand: the spinand device
+ * @req: the I/O request
+ *
+ * Return: 0 or a positive number of bitflips corrected on success.
+ * A negative error code otherwise.
+ */
+int spinand_read_page(struct spinand_device *spinand,
+		      const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
@@ -597,8 +605,16 @@ static int spinand_read_page(struct spinand_device *spinand,
 	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
-static int spinand_write_page(struct spinand_device *spinand,
-			      const struct nand_page_io_req *req)
+/**
+ * spinand_write_page() - Write the page
+ * @spinand: the spinand device
+ * @req: the I/O request
+ *
+ * Return: 0 or a positive number of bitflips corrected on success.
+ * A negative error code otherwise.
+ */
+int spinand_write_page(struct spinand_device *spinand,
+		       const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead604996..555846517faf6 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -519,4 +519,10 @@ int spinand_match_and_init(struct spinand_device *spinand,
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
+int spinand_read_page(struct spinand_device *spinand,
+		      const struct nand_page_io_req *req);
+
+int spinand_write_page(struct spinand_device *spinand,
+		       const struct nand_page_io_req *req);
+
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
