Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92491C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=haG7dPBTQ2aXqq7PcPW9KuU3J4YMJeRHzjZbwvxc43E=; b=ZzfJ1DM1AGtpEh
	MnAZhIA0LaEznMia6S4rELM7VQ0KQeAlFaSwvSTMfkTv5DcSrFQGttqdf0WM5frKjZiXCVNKJS5Ok
	P70J02xn4yn1L6vgz96LYxA5v4fuwAa0950nUX8qrqedOwRwThnVZPmaY07P2qnuyRpF0cnD0xU16
	Ccqh5ObqxKfMyo9siAe8YCpvX2/Dxlykfmoc7m4rYbZrxB76lPK1a19HL+GGXPLqcq+mHKdjfDAEn
	e9cebrpki1OfG1YungeUx2BBwQbp2/NTOPKxIkx+UJiDdjIu0XtrDn3CUfPHhpwCgrf3AZ07q+2Rn
	W8tzq0fiOnzuSnXfj/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTrF-001vop-01;
	Wed, 12 Apr 2023 06:21:29 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTr8-001vk5-0D;
	Wed, 12 Apr 2023 06:21:24 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id BB8835FD5E;
	Wed, 12 Apr 2023 09:21:15 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681280475;
	bh=u85shc8UtLxBHDVt6LzqD5rR/vx0d1Zu3hb1jox2KPc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jRSzYcXtKAvpDdJFuPpzbd8quTvf5jXkyOWPvx1u93IurGQB4HnicCsooLM0kZKc4
	 utC1J8GcsiXtZZi24znZEpaLhCPH07V7fuDNNANb5e1IFYOOUrMjj5wcZZvx2UsHAW
	 dWhI061Mh8CNUOfYmKNl0RbydZjA57gZT7EEKOtPfpV80KlWRLUPVObF3yCxnK82Px
	 qwUWEozm3UKqV8bfOFP/vj7J2ntIniH7ClHTe9AKi39EGo/xfZTd0/+9HrLV08ZHdf
	 mwATFrWEJ+56S7OILJbhHyhBeuSig/vLiin6WxtIATRAqNx7HaqYO0zri3HHeLyam+
	 6PTSAQNhewUmQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 09:21:13 +0300 (MSK)
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
Subject: [PATCH v1 0/5] refactoring and fix for Meson NAND
Date: Wed, 12 Apr 2023 09:16:54 +0300
Message-ID: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
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
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_232122_629946_3D923A2D 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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

this patchset adds one fix and several refactoring patches. First patch
is the most important - it fixes unstable behaviour of Meson driver, for
example random ECC errors during reads. I've tested this with mount/
unmount/read/write cases for JFFS2 and nanddump/nandwrite utlities on
AXG family (A113X SoC). Source of this update is old vendor's driver.

Other patches are refactoring and extra checks, not critical for this
driver's reliability.

Arseniy Krasnov (5):
  mtd: rawnand: meson: fix NAND access for read/write
  mtd: rawnand: meson: replace GENMASK() macro with define
  mtd: rawnand: meson: check buffer length
  mtd: rawnand: meson: clear OOB buffer before read
  mtd: rawnand: meson: remove unneeded bitwise OR with zeroes

 drivers/mtd/nand/raw/meson_nand.c | 147 ++++++++++++++++++++++++++----
 1 file changed, 127 insertions(+), 20 deletions(-)

-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
