Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338B3EE49B0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MktZ+fOxR/vfxjqaoLQD5pyzs4z7w9DIEYvcPtjFwxw=; b=eW0Lm8TuiqmqyI
	9da6E9EiIMkttQIvLgXTaMv7AQdOY9IP0AjQaY2/C6Lr9kSAI5J8laS9brXiA02RbSTd7CCX2lSim
	hNJnFntBU/mRYISQX2dSOFX9GxmGd6a5GttZM2XkJgOTfSBJeKkkMsAJwl+KoOksauvKQdBQP6q+C
	myF9ZzXBH4yC2UgB/XLHqcsI9kZ57O5yLG0sonJ3+2QAxr1xlEBx7SqGvNRmvaapJxK4OT/T0Y2CD
	rm+4w46W8JxyFjC1ELOUcwFukbZyifyCBq+wfu1wLGpun3qTeOV6n0K+Hn0ZGNPrGHo859IYC4AYg
	v/OyvtkR574OFcM6JksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlZv-000OGn-1p;
	Wed, 23 Aug 2023 10:59:11 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYlZs-000OEE-1L
	for linux-mtd@lists.infradead.org;
	Wed, 23 Aug 2023 10:59:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B5B2C120009;
	Wed, 23 Aug 2023 13:58:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B5B2C120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692788339;
	bh=Jhlhui1u6bMKkD+jQX9ubOwaBqanSrcPAZGkwyaedVA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=l9vqnGDPIf9enBfApcY6Q4z3ebwBXMuV9Ag6KmVWaQUUgXPudmK6VBRy2ioA5CtER
	 EnVCZYJbju4bXGvHUO7fUBYPMe4aoTrn7rzVWBlHkJ/SCN9RNyZzvkg8VRW0U6ZmlY
	 rE+vFiMOB8lXHIqkf4FZeoX4nYY9qma/gWU3q1F3Jvhu+iIjvDc22aa1stOy/W1zsc
	 g88IUqd3iuJUvWlO8hgQQMycg3ZurEoOSj/ZCxEdW1QymCXu5P0aqgToFhfEPmeSUG
	 lzsBNFq6VmYRq1LOqsiBYEONxyxe6JMCxU/p+AkMAbRFeD6XvToG7OD1+F4v3zjcCB
	 DBgrXK9wW2fgA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 23 Aug 2023 13:58:59 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 23 Aug 2023 13:58:52 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, Johan Jonker <jbx6244@gmail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: remove 'nand_exit_status_op()' prototype
Date: Wed, 23 Aug 2023 13:52:31 +0300
Message-ID: <20230823105235.609069-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179398 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 04:58:00 #21681850
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_035908_816335_FD2533F9 
X-CRM114-Status: GOOD (  10.96  )
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

This function is exported and its prototype is already placed in
include/linux/mtd/rawnand.h.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/internals.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index e9932da18bdd..b7162ced9efa 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -106,7 +106,6 @@ int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
 			       int oob_required, int page);
 int nand_write_page_raw_notsupp(struct nand_chip *chip, const u8 *buf,
 				int oob_required, int page);
-int nand_exit_status_op(struct nand_chip *chip);
 int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 			    unsigned int len);
 void nand_decode_ext_id(struct nand_chip *chip);
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
