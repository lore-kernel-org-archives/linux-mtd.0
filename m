Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8A8C7EE25
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 04:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ef0JZSYOysqPhiAmPW5rCyB9InUlZVwVMulI7hP/8SQ=; b=FTtmKHEjKW+2AX
	O4nTIh6USS5rdoroPIJ0YzdNfgZ/l4WIOC0qrA5Tbpn0xQpyoUOoTlG9wbWHSk2WgLBxTfXlhg43Z
	YeehwhBwwyhlWmRvzRP27RrysKLtMKnMBMektnqpj8bGu7TSEdcbX0gNPHZ01Ho9AI8FKOhzzyWaG
	nkbCABs5m161LzI+Vj2dOTL4wP7cW/pFEexQ3WXdHNGbNmd9AIFI1PrK92LtKKh3ygqkUEQu7cGda
	DFI39yXLOKfWv0uVmketfhal507dQ2GfXen5k2ilM7FHNATVcpAy5KgLCoufQ2m993NLr555ca0sh
	dV2aA+NPlDDOEdfLUUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q77dd-0085KE-1L;
	Thu, 08 Jun 2023 04:52:45 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q77dX-0085HN-0P;
	Thu, 08 Jun 2023 04:52:41 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 53A345FD72;
	Thu,  8 Jun 2023 07:52:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686199956;
	bh=W+pJcKNPyHeJx9yigTrLfyd5QNmlHZFEYc5/9qUZfOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OTfyvL5QuDbycRwAQXq0zp98Rg+v0Z9G8gghcP6uPGkpNwJxm/m356XZAVj9SL+UT
	 9RmZhzMjDsXzYiTjgQ5zPScl/CHzwm07pl9BCp2XB/+2R70jg8h29x35Xb7nAMMr5n
	 QcE+b9+rSlRixHLSH0zLqgia9rH2dBpCWkIni2s+WAL6FiWjqHS7OMyCdbjKIXpKD5
	 jPoISB4FEe46xUe76nzLvdUbpG0+OsY3V+7Tr0k274QxX37WFfOBJx+fupa02KBUkS
	 zXpG6lvqw6xQMXcKLCD7WTVlRntSFCW4Z0sDI6pWzinxSaN85cInj//EDbZ4WsMjgF
	 oM1LU3oTVI6hQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  8 Jun 2023 07:52:35 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Meson NAND: waiting w/o wired ready/busy pin
Date: Thu, 8 Jun 2023 07:47:26 +0300
Message-ID: <20230608044728.1328506-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 00:23:00 #21457426
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_215239_501187_A810AAB5 
X-CRM114-Status: GOOD (  13.62  )
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

Main thing that this patchset adds is support for waiting for command
completion when there is no wired ready/busy pin. This is implemented
by using Meson specific command which operates without wired pin, but
supports interrupt driven waiting (default way for waiting without
hardware pin is 'nand_soft_waitrdy()' which uses software loop instead
of interrupt). To select which mode to use during driver initialization,
common NAND controller property is used - 'nand-rb'. It is described in
'nand-controller.yaml'. But for Meson, its description was missed in
'amlogic,meson-nand.yaml', so this patchset also adds support for it.

Patch for bindings was tested with dt_binding_check and dtbs_check.

Links:
 v1 (as two separate patches):
  https://lore.kernel.org/linux-mtd/20230606193507.35024-1-AVKrasnov@sberdevices.ru/
  https://lore.kernel.org/linux-mtd/20230607073015.1280085-1-AVKrasnov@sberdevices.ru/

 v2 (tagged as v1, but consider it as v2):
  https://lore.kernel.org/linux-mtd/20230607145026.2899547-1-AVKrasnov@sberdevices.ru/

Changelog:
 v1 -> v2:
  * Two separate patches:
    For bindings: https://lore.kernel.org/linux-mtd/20230606193507.35024-1-AVKrasnov@sberdevices.ru/
    For driver: https://lore.kernel.org/linux-mtd/20230607073015.1280085-1-AVKrasnov@sberdevices.ru/
    Now fixed/updated and combined to this patchset with v1 version.
  
  * In binding patch:
    * Invalid type of 'nand-rb' is fixed, it was 'bool', now it is 'uint32 array' as required. Also
      new declaration of 'nand-rb' contains several restrictions like number of elements and min/max
      value of elements.
    * Location of 'nand-rb' is moved from the controller object to the chip object as required.
  
  * In driver patch:
    * Update comment which describes when it is needed to send NAND_CMD_READ0 to
      leave command waiting loop.
    * Change type of 'no_rb_pin' to 'bool' as in v1. Now it is just a flag which selects
      mode to wait for command completion.

 v2 -> v3:
  * In binding patch:
    * 'minimum' property is dropped, because 'nand-rb' is unsigned.

  * In driver patch:
    * Logic of 'no_rb_pin' parsing is reworked a little bit. For example to return error
      code from 'of_property_read_u32()'.

Arseniy Krasnov (2):
  dt-bindings: nand: meson: Fix 'nand-rb' property
  mtd: rawnand: meson: waiting w/o wired ready/busy pin

 .../bindings/mtd/amlogic,meson-nand.yaml      |  6 ++
 drivers/mtd/nand/raw/meson_nand.c             | 77 ++++++++++++++++++-
 2 files changed, 79 insertions(+), 4 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
