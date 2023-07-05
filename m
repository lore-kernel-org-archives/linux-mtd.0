Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C38EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=htH5qU2f76zhx5I9NFaM5yny0QFTuWIbIlW9E3DIcCo=; b=AiRPJgqu3cFgyb
	Aph0c9i6nfPF9OpDPpCUda4KHcQjQXxMHWyaHBTmyE2BGv0y72qc0vrc4Y5+7YhqdenbvtstrZPiL
	rulS8STzxKDR5qfQFF/RUCCzFQ4SvWIcgzMIFj1bAUrGca2ciexVAOpUhHqORLLzm+SYHgkNzAb/L
	UPenb96tlqPA/2zrU/iwRxt7jHDarB5zzJYZQFD8Vn2kHXU56HIE83K9GVbPSCOXw4eshH5ZiU6wt
	It5glRoN+Ub79yjWaQ26mnOXgcACCv9qHwuf+vSddhZLei900o0Louf/Kg5LCZ70sRVUr9ORG8Oa5
	G7LSKfb66ZmKjLjg+1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwSY-00Exmx-0t;
	Wed, 05 Jul 2023 06:57:54 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwSS-00ExlT-2J;
	Wed, 05 Jul 2023 06:57:51 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D1A89100073;
	Wed,  5 Jul 2023 09:57:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D1A89100073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688540262;
	bh=o0WT1/mR0NlnDuo4W0bZ0/ygxHFHAYruyxfCphFZ/FQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WY2vH1AiLSkMKvS/MpKftpD/7i+36kLRXlQ1/Z/vF5CZbA++zzyLnGFlZ3kvxwbMW
	 Y4BZ0PDI1HlyRMCpqMTVqVZg6pcwNZwqEQ5R+L8XDgTcmKCtxFG1MmoqUVBQCuQ+sh
	 THYj5ykiYVzWXMbjdKL0JX0dDdsaBioMs4mQ8FiXi/l/aY1KjeTh4XfiLjKH29dmNE
	 5iKgyVMvDP1r3ezzDMZpbIyI1CZoQhaEvxEjEH58ZZi9fc4ELUm7olLi373qkXn0gs
	 v9/ZRjAw82s2W6RZz+9PstpAYf/EJosVXNke3yl0Mv4pj95TjX5Xmq/8xVxW7zblwY
	 6Rd9UymFaJGxA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 09:57:42 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 09:57:41 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <Stable@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: fix OOB available bytes for ECC
Date: Wed, 5 Jul 2023 09:52:10 +0300
Message-ID: <20230705065211.293500-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178437 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 01:35:00 #21564271
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_235749_465944_572A0FD2 
X-CRM114-Status: GOOD (  12.66  )
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

It is incorrect to calculate number of OOB bytes for ECC engine using
some "already known" ECC step size (1024 bytes here). Number of such
bytes for ECC engine must be whole OOB except 2 bytes for bad block
marker, while proper ECC step size and strength will be selected by
ECC logic.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 369e81356240..c7213f03a773 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1301,7 +1301,6 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	struct meson_nfc_nand_chip *meson_chip = to_meson_nand(nand);
 	struct mtd_info *mtd = nand_to_mtd(nand);
-	int nsectors = mtd->writesize / 1024;
 	int raw_writesize;
 	int ret;
 
@@ -1327,7 +1326,7 @@ static int meson_nand_attach_chip(struct nand_chip *nand)
 	nand->options |= NAND_NO_SUBPAGE_WRITE;
 
 	ret = nand_ecc_choose_conf(nand, nfc->data->ecc_caps,
-				   mtd->oobsize - 2 * nsectors);
+				   mtd->oobsize - 2);
 	if (ret) {
 		dev_err(nfc->dev, "failed to ECC init\n");
 		return -EINVAL;
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
