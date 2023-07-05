Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0350AEB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ah/IVo++LQxyPHHAFkEFzYhcxfMBb7RlgQ+YBsV3gXU=; b=gJ2uXsEvJOHHkD
	gHJLF228NhKsD0iNDVITgfzo1P5abscuGQ4X23mRCOTL5ZhqWwWGU9j3YK9NfGp9S3jZOg24fiIBb
	PNY9tij0qLkzAxjU+3Ek/T/XYHmG2FOzrOouC1hx14N+bAF4TM2cLEJrswud6nL/3SOMQTTnnYKuK
	+OxCYpTN+BoZxYjNCry9+HgkBFeyPN1vj51ruwETQFVAMxThhP6TwWs0vt0sJoGEuIw7y6YS/jHsl
	XCRb/jbzziD3xY8/K8FtLOyLRmJzJ/h/itCOY70xwg3v87WLOj4BROx7khhKE5AltqOOlpAWXHG2e
	dAfm30RD4b0mePK7qfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH04y-00FeDo-1m;
	Wed, 05 Jul 2023 10:49:48 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH04t-00Fe9X-26;
	Wed, 05 Jul 2023 10:49:46 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B484A120061;
	Wed,  5 Jul 2023 13:49:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B484A120061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688554175;
	bh=R99U9ZeCFnUhxosYR742hW48fCGlup+4oiuVH5a34TU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=f/Kt7s0MLJ8wm5jz5SIu+fq0XAOa9AjzSUvxVJkht5Z+rPZCp1fsLoj11FH6+dAlI
	 L3Y42u90dUGCW25q33urS2EmnaXe64mpMaBnoBaSx/AXbUDJB0KHunpXl47ScVaR0h
	 Op2JbzSVIZs570B7Di5kkwhcM5iA2CXxPv/hCye7c78p6Ck+034u3JjalWocY3F6cD
	 l/F7GN9Y4evyoW5Lq3Dlrm8YuwdzqstnBK+FV7WMN1QjC2I8LlIGXcPAxuMzf07JU5
	 rCvC7i7DG/suhGZi1XbZHo4ffhrxtAikTJ9GGkvxbaVc8Xtpb1LWJqmXbkqIyT9jHx
	 vk0AvTNFSOR9Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 13:49:35 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 13:49:32 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Arseniy
 Krasnov <AVKrasnov@sberdevices.ru>, Adam Borowski <kilobyte@angband.pl>,
	JaimeLiao <jaimeliao.tw@gmail.com>, ChenXiaoSong <chenxiaosong2@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] use NAND core API for Meson controller
Date: Wed, 5 Jul 2023 13:43:56 +0300
Message-ID: <20230705104403.696680-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178444 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 05:28:00 #21565829
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_034944_420098_C70189F2 
X-CRM114-Status: GOOD (  11.25  )
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

During waiting for command completion this driver sends NAND_CMD_STATUS
and then NAND_CMD_READ0 to leave status checking mode. Instead of direct
accesses to the registers of the controller to send these commands, this
patchset uses currently implemented and exported NAND API for the same
purposes. First patch is preparation: we need to export function 
'nand_exit_status_op()' for modules. Second patch uses these functions
in the Meson driver.

Arseniy Krasnov (2):
  mtd: rawnand: export 'nand_exit_status_op()'
  mtd: rawnand: meson: use NAND core API to check status

 drivers/mtd/nand/raw/meson_nand.c | 26 ++++++++++++--------------
 drivers/mtd/nand/raw/nand_base.c  |  1 +
 include/linux/mtd/rawnand.h       |  1 +
 3 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
