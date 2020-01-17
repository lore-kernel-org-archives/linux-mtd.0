Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C773C33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B382082F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjhPeE/T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="CwU3+cHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B382082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AR9HhA7cNZIduwaypReQ1hJG8841WIIKvsQv8lPByhQ=; b=XjhPeE/T+IfAnv
	Lby8kJNqqUjcB9VD4HRSE1Uo3TXfgy+sNElKWcTFiZIt5leFW39+ZM7+nVTK+OucpZF3aZiIikx2X
	crIFKlv4BRuj/UiqZOMKXzXqaNLAJIPk9LRLl+se6rz6h6AdK7QB9ywh8JYnLdO7muiFQACfcOIhx
	ziGZp0QDDtDZcwk+aN1uhLmfDIHzD6ZwFe80dEqwOh2cUKuGUCS37IoNh3MC/b4MxBdE7YohIzExI
	c1bxJWOS5MRCETc01D3MFih8DoWshwC85EGpO2ZZjB8CHhsP8DCdgqeikmCkuYSS4tuW957TWCz1x
	VCOE3ktv5rCcgBBorzwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXso-0002ET-1j; Fri, 17 Jan 2020 20:06:18 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXsH-0001oK-3A
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 20:05:55 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id 0CC92AB518;
 Fri, 17 Jan 2020 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1579291489; bh=o6RcffWea1Gwpv70mI5JVEaFXbGMFEGYH8Sdo82hkqA=;
 h=From:To:Cc:Subject:Date;
 b=CwU3+cHZO+nj672zWHANU63vkD/2mOE8kjGg2X18kpCByGTQ8wzp627Kx4jU+QkUe
 VLd/3z2Upw9EfznOlC3C+F5XKcjyg5219jv7l1vaxU5mDUmeBsA2CBH4p+KrcaTz0E
 dNG5JC6CuC013YbkHFNdVv5hJsDITMF/OfpnkKLSxqUcYBOCurDfSxIusgjSR2AkbH
 lwAGWKFPV+jZClyBj5qoe5z/zUYkJ0GeYkgtOkF9Whr5DNdgatsW1ZTIcIBVyUMV5N
 JyXZKdi4mhJ+B4f/pxCkzzNjWM6KFr8we/7BMMo89Jv69nBZ2jRiJpXa7w+GsdTzvS
 1JG4TYMvOay+g==
From: Esben Haabendal <esben@geanix.com>
To: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] mtd: rawnand: gpmi: Suspend/resume fixes
Date: Fri, 17 Jan 2020 21:05:35 +0100
Message-Id: <20200117200537.9279-1-esben@geanix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_120546_012357_74C2D4F1 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This fixes a couple of suspend/resume problems in gpmi-nand driver,
introduced in 5.3 with the implementation of exec_op for gpmi-nand driver.

Changes since v1:
  - Fixed bug in gpmi_init() causing runtime pm becoming disabled
  - Added Fixes tags and cc to stable
  - Rebased to v5.5-rc6

Esben Haabendal (2):
  mtd: rawnand: gpmi: Fix suspend/resume problem
  mtd: rawnand: gpmi: Restore nfc timing setup after suspend/resume

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
