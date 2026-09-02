Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C541C624DA
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJqQqkadtIgfukSYiTUPMBM3/W8GemABBoLbGP3lkuA=; b=zbE86TT9H6mdmw
	FWNm5WEQqt1csAuX7n8aCuoMvP/9+Aa8Mrl1D89FSavoasNJ66D+4VYJGJgxT/R8ag1tTs5huYOCf
	KgnZpED5pgkVn7eYVjl+Tu4OZiUyPk88ozPxPtrSktVp3b1cCqyO3bWAmtS7vGJCXlErONkkaJHWL
	FFAAttlGu1d+BC8lZ7WyDOq9JdGdvWq0heioVqFPGA6LSRIRZN1YpfNHpteBlU/5h01RxJ/dOAn/z
	EBt9s9TzcBlaqbd2rna8cY5x408ah/KtWABYusD2+8TEg23BgGzUyPSipVUI0LbsAL5VBa5dO5ne+
	1lt+9orsfMHmIlU5lIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKS-0000000FLiL-3vQs;
	Wed, 02 Sep 2026 17:00:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oKO-0000000FLV1-0Yg0;
	Wed, 02 Sep 2026 17:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RK3VZeAny8l+e7YMWKjNdyYoAhg+PxHxJxIcEjjuNEM=; b=cH7YwS5L0kyICEQqpiQO8mRhAv
	Gmn/rQJDMIA0GHBxeekpYuZknW1hhy8K/kVZCZLdd21jkDkrLrcrXd1cSUCWP89ckNq7pkGh7DYpE
	DRaRL28mjY/dpygZUqrYUV8C/10+EAE55UlzJOWRyQhfBEi/SVejqfqRQCwRq1o8Tni7s8Q7jwlvj
	tRcn/1KKLsB2KNL2/IEzs7sv96Up3IsrmjhMYxX5npaPAm9DfhE137m0mTIQShB76RP2B2IzUyp/U
	c6UVDtdhzFXWLIs5Fyoqiv2A1RicFTMcxKAgbxmn2dpuRAzGljW5Km2Ldye40YVE6NBXkfy2ryggI
	b+8PByIA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1oKI-0000000CEpf-3kYr;
	Wed, 02 Sep 2026 17:00:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 472C61A1976;
	Wed,  2 Sep 2026 17:00:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AB246053C;
	Wed,  2 Sep 2026 17:00:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19D7911C798E5;
	Wed,  2 Sep 2026 19:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368440; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RK3VZeAny8l+e7YMWKjNdyYoAhg+PxHxJxIcEjjuNEM=;
	b=HOYjCHTuHdZMagWc7UQ0MUUgBCt44+SNUH6+3rVVCSN2KH8ZRv2T+WscTqcB3ses2Yph7P
	XBDW0GlaeawhtpuIcY4lJcR36Mq5BmNSHKO0diSQ2JTsohp1h+KE+yAW2XEnIU16aU62ps
	EVkzs6SVODNYAO9w9TAYxvmUXXqIos2IvAqs0S2VXsmEAlgzMVkZsMnxEK75d8xcDp7cMg
	ubTds/hmNstSoMcECU2rA3i1JBNg+dqB8HsSr9485VLe9HK7nnDWL8pkjsXObzNaRCsGoB
	A2ME93eYu+ZYr1JAXhFpVSGkCeqhJPqNcIq3kCoX22PgpCe69Z/T+6cFap5JzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:31 +0200
Subject: [PATCH v4 17/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-17-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_180045_502404_71C4770D 
X-CRM114-Status: GOOD (  10.28  )
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

There is an ID collision between the JV and RV families. Both chips are
very similar in practice, it is mostly a matter of electrical
differences (mostly power consumption being lower).

As a significant difference, RV chips identify themselves as supporting
The new SFDP (rev F) field which forces an alternate write SR2 opcode
(0x31).

Since they share the IDs but not the names, we must hide the names using
a fixup.

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e51c050bacdf..90b106d53d02 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -618,6 +618,8 @@ static const struct spi_nor_fixup winbond_fixups[] = {
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x40, 0x22), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
+	{ .id = SNOR_ID(0xef, 0x70), .match = winbond_rv_match,
+	  .fixups = &winbond_nor_partname_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x21), .match = winbond_jv_match,
 	  .fixups = &winbond_nor_multi_die_fixups },
 	{ .id = SNOR_ID(0xef, 0x70, 0x22), .match = winbond_jv_match,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
