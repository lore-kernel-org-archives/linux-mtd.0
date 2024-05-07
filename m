Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3118EC10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 23:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eFZqqYWk+xQw03b3ecJvngerXjEENXz3kmzyHrkqb78=; b=nZEAj1zHNjgBsA
	MKghIWZTXCyAARVC2WoC1qpMqXFd0kTFrHFAdiYp8JVT58Co00juaGRsG8SN6HTLhm2vF/ahP/Mv0
	HJ/Y1IiLfcISAsySLfRzKfbBo68XLRfkAQzF7UY3SWtEpQMshpwEb+NpVNRbFkmkm1ZsruoQU/d0Z
	6FJKa9W4CF16eBPBYAx+gD7VnaQ/j5/y6vGL/HXu0+kkccAN/tuN2IeztVR7/zJPB+ka/vwCLlF37
	CWIFCtvddlJoQRh/oTxmZq41RLHl2SYlqfXUuxbFlxbSpJQAlHdKnHzXiI3T0tvJqOCdEu5eFT5Fd
	tw5ollgsdcDCMQ/Wj3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6i-0000000DFNW-005n;
	Tue, 07 May 2024 23:20:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4U6R-0000000DF8N-2Go8;
	Tue, 07 May 2024 23:20:10 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 99472120005;
	Wed,  8 May 2024 02:19:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 99472120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715123999;
	bh=FTEc3DcCrnODzUlI904uenRxffR/nTndkV7UF8lCKs0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MOaqecEa7KzpL1uHnPOVQMAfm++G+nohFnyBcWYFaRlh/G0AO9QWjk82Et1kkHApv
	 YDOkYJZt5Aar9dxZo5Cy2Hms33xkHc+AGcUS07i8C2OSlSQGZTiB8KaZtJUSzTqAnG
	 OP7pLGOXuyUQ8V9w/tThPVtkNlrt7QEDoOyC8izhFQzAodLGoiZjafSqOEXq98jBqd
	 R0zSh/eyDeuDttGiM+DeL9OoAXyWWIyJ/OxNWSfbvEaCbYwvkHHey23l5Sv1ktgK8P
	 2vy/Cz2tPB5M2HcbRB7gN+zCXH6TuwS+v+TtKXddyXVo+uzjmJJ4g14mGMg2FjlDwx
	 FvZ2+VVkv5mMA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 May 2024 02:19:59 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 8 May 2024 02:19:58 +0300
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: [PATCH v6 0/3] Meson: R/W support for pages used by boot ROM
Date: Wed, 8 May 2024 02:09:00 +0300
Message-ID: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185123 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 17:58:00 #25118681
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_162008_431358_80C3CA1F 
X-CRM114-Status: GOOD (  13.38  )
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

Amlogic's boot ROM code needs that some pages on NAND must be written
in special "short" ECC mode with scrambling enabled. Such pages:
1) Contain some metadata about hardware.
2) Located with some interval starting from 0 offset, until some
   specified offset. Interval and second offset are set in the
   device tree.

This patchset adds R/W support for such pages. To enable it we can setup
it in dts:

    nand-is-boot-medium;
    amlogic,boot-pages = <1024>;
    amlogic,boot-page-step = <128>;

It means that each 128th page in range 0 to 1024 pages will be accessed
in special mode ("short" ECC + scrambling). In practice this feature is
needed when we want to update first block of NAND - driver will enable
required mode by itself using value from device tree.

Changelog:
 v1 -> v2:
  * Rename 'meson,boot-page-XXX' -> 'amlogic,boot-page-XXX'.
  * Add words that 'amlogic,boot-page-step' is measured in pages.
  * Remove words that 'amlogic,boot-page-XXX' depends on 'nand-is-boot-medium'.
  * Make both 'amlogic,boot-page-XXX' depend on each other also, in
    addition to 'nand-is-boot-medium' dependency.
 v2 -> v3:
  * Add quotes to 0001 in dependencies. This fixes 'make dt_binding_check'
    warning.
 v3 -> v4:
  * Rename 'amlogic,boot-page-last' to 'amlogic,boot-pages'.
 v4 -> v5:
  * Update 'description' fields in bindings.
 v5 -> v6:
  * Split patch for meson_nand.c to 2 patches: first is refactoring of
    scrambling mode handling, another is support for special pages for
    boot ROM.
  * Update description and commit message in the bindings patch.

Arseniy Krasnov (3):
  dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
  mtd: rawnand: meson: refactor use of 'meson_nfc_cmd_access()'
  mtd: rawnand: meson: read/write access for boot ROM pages

 .../bindings/mtd/amlogic,meson-nand.yaml      | 18 ++++
 drivers/mtd/nand/raw/meson_nand.c             | 86 +++++++++++++------
 2 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
