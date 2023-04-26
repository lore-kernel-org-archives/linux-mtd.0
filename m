Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C79C7618E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eV1fZiNColXA3b/Jln8BHE7+ixI9sXUOSkFg6HQC0MU=; b=TmlVHt7hhyJ2j2
	n8wT0zas6mPr7QsKuauH3SdcMW+1IesQlqQcBweMMxzANS5Rhd2jQ50rw8+EyWAi9YapMYtpq1bAS
	IoCIHIkO+t3rLUbZeNphHupi5Ps3AOuZ4C8Kwd8mut7lWUUvmfDztDQzjJz3q2mbb/RdwB62a8145
	Dx/MJ60ptpHie6aJiT28fZiR4+3hfbWsfdD5TSP/TycJCzpfkL//LO3Rg0NKU0o9nregFOdfam20k
	T8L2kBfJoThJ3o2bW3k8dCzSXFoJFSPjqkBUSSRQedGPjMfYvLy2WjW2O/MJvoKyDIys8wLHsiXUF
	+eQjsR5icAji5S9ISuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZm8-0033m0-19;
	Wed, 26 Apr 2023 07:41:16 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZm3-0033js-2P;
	Wed, 26 Apr 2023 07:41:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D3ADB5FD6E;
	Wed, 26 Apr 2023 10:41:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682494868;
	bh=kH/83HIe7gsu4U9b3IuFMWDR2wI8ee/0EC6PkeDFzmU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SUngLhDqkuszemhCr2x9A+KNk8qzjMksyz4wnTJcvasJ0eJyXTyERFugEJOKXvECM
	 cpBJEZ4mvjO5vk9A41bVxBD9sDPaDBeiR9TY4xDFUQp5jkdTiKY07+wopi/Xh+v3AS
	 EAoCWRZEL09NC36XGx7DQjq7/uPdgfUqzELyX/pz+68nvONqgBthCDn2+Ko0u42QhP
	 9NLfUHCW17wFGaZ2fnIjeA0DcyUAmP1iKttZah9f2pvtsx+j7I1gNdVzNtVH/kw1sS
	 fEF7Wml4jSk1JvOVaxjoJ4YkKu1GEhS9dRt3KBZUui51kaawg5JfnhBYUU+9MqtoF4
	 9cAdd3hDDyCaA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 26 Apr 2023 10:41:07 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/5] refactoring and fix for Meson NAND
Date: Wed, 26 Apr 2023 10:36:26 +0300
Message-ID: <20230426073632.3905682-1-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/26 04:45:00 #21166225
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_004112_133977_3DED1C9B 
X-CRM114-Status: GOOD (  13.47  )
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

Hello,

this patchset does several things:

1) It fixes unstable behaviour of Meson driver, for example random ECC
   errors during reads. It is done by changing command sequence to access
   NAND controller. Source of this update is old vendor's driver.

2) It changes OOB layout by moving it out of ECC area. Current OOB data
   is 4 bytes (2 x 2 user bytes) under ECC engine. Here is how OOB looks
   in the current implementation:

   [ 2B user bytes ][     14B ECC codes    ]
   [ 2B user bytes ][     14B ECC codes    ]
   [ 16B unused area, not protected by ECC ]
   [ 16B unused area, not protected by ECC ]

   All 4 user bytes are protected by ECC. This patch changes OOB layout
   in this way:

   [ 2B unused area ][    14B ECC codes    ]
   [ 2B unused area ][    14B ECC codes    ]
   [  16B OOB area, not protected by ECC   ]
   [  16B OOB area, not protected by ECC   ]

   Now OOB is 32 bytes instead of 4 bytes and not protected by ECC.
   Origin of this layout comes from problem with JFFS2. It uses OOB for
   cleanmarkers. Each cleanmarker is 4 bytes and written by JFFS2 driver.
   We have two ways to write this data to OOB (e.g. user bytes):

   1) ECC mode. In this case it will be ECC covered user bytes, e.g.
      writing this bytes will update ECC codes. Problem fires, when
      JFFS2 tries to write this page later - this write makes controller
      to update ECC codes again, but it is impossible to do it correctly,
      because we can't update bits from 0 to 1 (only from 1 to 0).

   2) Raw mode. In this case ECC codes won't be updated. But later, it
      will be impossible to read this page in ECC mode, because we have
      some user bytes, but ECC codes are missed.

   So let's move OOB out of ECC area. In this case we can read/write OOB
   separately in raw mode and at the same time work with data in ECC
   mode. JFFS2 is happy now. User bytes are untouched - all of them
   are ignored during non-OOB access.

   Also this patch changes size of OOB data during read. Now whole OOB
   is read (including unused user bytes, ECC codes and OOB data itself).

   I've tested this with mount/unmount/read/write cases for JFFS2 and
   nanddump/nandwrite utlities on AXG family (A113X SoC).

3) Renames device tree node's name for chip selection from "reg" to
   "cs". See commit message.

4) Checks buffer length on accesses to NAND controller.

5) Removes useless bitwise OR with zeroes.

Link to v1:
https://lore.kernel.org/linux-mtd/20230412061700.1492474-1-AVKrasnov@sberdevices.ru/

Arseniy Krasnov (5):
  mtd: rawnand: meson: fix NAND access for read/write
  mtd: rawnand: meson: move OOB to non-protected ECC area
  mtd: rawnand: meson: check buffer length
  mtd: rawnand: meson: remove unneeded bitwise OR with zeroes
  mtd: rawnand: meson: rename node for chip select

 drivers/mtd/nand/raw/meson_nand.c | 406 +++++++++++++++++++++++++-----
 1 file changed, 347 insertions(+), 59 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
