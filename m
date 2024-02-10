Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E54C48260
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Feb 2024 21:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2D11TdAeGGwv3z0qzLSYI4TZHjXizq2EE6Y5mXr4RoQ=; b=IjOMQQXyaU2EfS
	rUG4om1DGUgrejhUQoNNOf3QpX9yKrdGt1Ln0bg5yPUK7JTvTi1Pi0fQ39uloaHRcOL+VK3aJHtsa
	NOr7Re0FmbbxML04T6VW+YbYvpSI/1W1hyKGx8kn+8eHUsDgvnJ7aIXaJT3njP6uyl1SZQpasuw8j
	ncNoFnAvrKjxc0Fxdbo7R8TxlJaR+5QDcARaxDD4GvwusImhgTwBvj9roJpuxzHehs3AELg76OMJD
	HwyUJEIawM9PPuW5aloyS1Pfuc7rQ/ucYQpIlPX6IV4wxIGmCNOY42sYDs/JpnzfGkOiD+H4QtDWZ
	5VVNQhxlO4GaDrhl368g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYvK1-0000000248H-3m9T;
	Sat, 10 Feb 2024 21:55:41 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYvJw-0000000245r-3k0i;
	Sat, 10 Feb 2024 21:55:39 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BF461100003;
	Sun, 11 Feb 2024 00:55:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BF461100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707602128;
	bh=xi31YeeyyS/qFrw1DkmjVjOshSdKKbDhOyJw6MvaMJY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ID/GQKVsNci/VPuG6OlDS1TawQiIkMl2MhlcFJi3FsFUkAHzQjapxSzWvBdqeKYNk
	 x9/nxqvI+m3gqaIluUH6YneQ4B07/QPZoDnziWMCoZ5N2X4cOFvoalvgxFmEB3QymO
	 znjpXcQprfDMJHpOTQhpzosa6FEE1NqT7F4b/BlqyKI/WxnF0VDkqDhkGcXc5yc/uC
	 66aNtPE4FvEr+IgCUUOaK+VIOFd7DhDM4+BsSV/Okrr+gWsMG85xiRNDK7AW9LDMrz
	 XtgrsqEY+Dn/I3bPQvbCtIf3TesjzvWrTV5iBZZBT7vhnfvY0Uhk1psFgVJJLLOPro
	 jEXeP9hdf1EHA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sun, 11 Feb 2024 00:55:28 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 11 Feb 2024 00:55:28 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
CC: <oxffffaa@gmail.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<avkrasnov@salutedevices.com>, <Stable@vger.kernel.org>
Subject: [PATCH v1] mtd: rawnand: meson: fix scrambling mode value in command macro
Date: Sun, 11 Feb 2024 00:45:51 +0300
Message-ID: <20240210214551.441610-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183344 [Feb 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/10 18:28:00 #23491490
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_135537_633537_0D082EEB 
X-CRM114-Status: GOOD (  13.42  )
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

Scrambling mode is enabled by value (1 << 19). NFC_CMD_SCRAMBLER_ENABLE
is already (1 << 19), so there is no need to shift it again in CMDRWGEN
macro.

Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: <Stable@vger.kernel.org>
Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index cdb58aca59c0..2a96a87cf79c 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -63,7 +63,7 @@
 #define CMDRWGEN(cmd_dir, ran, bch, short_mode, page_size, pages)	\
 	(								\
 		(cmd_dir)			|			\
-		((ran) << 19)			|			\
+		(ran)				|			\
 		((bch) << 14)			|			\
 		((short_mode) << 13)		|			\
 		(((page_size) & 0x7f) << 6)	|			\
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
