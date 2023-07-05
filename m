Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE70DC001DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5dnjh54gmp7DSYJYuF9co4n9EU5EhgVdws7upFOOuc=; b=uvVB7kbIyU2pZP
	fzWAlZs0x/tNetQyBJ5aordxZgWW2vQnzvzGfSHWvYmNptrzPExSAjBdkoynS/cFEDfKnT5bjvBh4
	ns2PXx9SoHsd3S68mFekRGETaaN3bnZrdOKl+1r09pQ85ANihYFQ6ZXAKj6WEna3fOhWv82BUYGtm
	M3g5rYoaQRnXnD9xab7Wo5kMiG0NM7vHik2sZCSRJVEPQPDDphEGfKhxVrZrT0nCG6/3CBTl9IE2U
	wde46hv7xgkqUGz1BMXyMAuU7K5LaxBHZuAP6Ln+HVtVChe3da64Exdo4nTqJRxKncpBqaZ1ZYtUv
	XWyzBP9KeQaO7IiVF7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH050-00FeEy-1C;
	Wed, 05 Jul 2023 10:49:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH04v-00FeAV-0p;
	Wed, 05 Jul 2023 10:49:46 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4FB6510007C;
	Wed,  5 Jul 2023 13:49:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4FB6510007C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688554181;
	bh=hwuIkah7tdQ/ux/daGas/Or4t38i1CesFllcRMgtpB4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=LCrgUoQkNEiOr6e6O1dwXK1JjmVaO0lqpozfIRWVjYdzZjuDFjwINjJOW7U4tSTxr
	 5achdhqLr7WTN53PaZaRGSrURCLG+azXunoyo8/Ipjnqf0ijKu2/hV4vAU/VyRtS/Y
	 n3ltxFK5DGvoyr8rr7tOK+gjsW7gIVUEbrBWnzyobUCNcO6N3lGrEfPdZm3I1kfzEr
	 /RZ0yHEQmvcb8+1ogLDukXiniiR849nckVw48Aq9thifA5oV4K8jrNlhlTb3QZMvpo
	 DAUNy0xZEq51KS97dyvKR0T3570mwlVs2GWoZlJN0ln5N6Y1rMMVjS7UVUjpsdjWVO
	 VZwrJfRdovaAw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 13:49:41 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 13:49:38 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, JaimeLiao
	<jaimeliao.tw@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?=
	<kernel@kempniu.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, ChenXiaoSong
	<chenxiaosong2@huawei.com>, Adam Borowski <kilobyte@angband.pl>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] mtd: rawnand: export 'nand_exit_status_op()'
Date: Wed, 5 Jul 2023 13:43:57 +0300
Message-ID: <20230705104403.696680-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230705104403.696680-1-AVKrasnov@sberdevices.ru>
References: <20230705104403.696680-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178443 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 05:28:00 #21565829
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_034945_643269_61E1F4E0 
X-CRM114-Status: GOOD (  11.53  )
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

Export this function to work in pair with 'nand_status_op()' which is
already exported.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a6af521832aa..d4b55155aeae 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1885,6 +1885,7 @@ int nand_exit_status_op(struct nand_chip *chip)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(nand_exit_status_op);
 
 /**
  * nand_erase_op - Do an erase operation
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5159d692f9ce..90a141ba2a5a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1540,6 +1540,7 @@ int nand_reset_op(struct nand_chip *chip);
 int nand_readid_op(struct nand_chip *chip, u8 addr, void *buf,
 		   unsigned int len);
 int nand_status_op(struct nand_chip *chip, u8 *status);
+int nand_exit_status_op(struct nand_chip *chip);
 int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock);
 int nand_read_page_op(struct nand_chip *chip, unsigned int page,
 		      unsigned int offset_in_page, void *buf, unsigned int len);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
