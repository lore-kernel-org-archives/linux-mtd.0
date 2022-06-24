Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF18C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jun 2022 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QB0784xiWxJ9tdCatpbyMLQYmfTRMMEEvEVjSQxdbiU=; b=aLWqI6SCutoFuH
	8Dv+L+PYGOHPoof94jzaRKIL77L1u4j3I+m9SXG7o1bMeBXWquxkfXXGEgvwtJOAosR9i1UFA4MJz
	MLIClEOSWl9kfvHZzoQ8KJ+mHvR9b7NUZvPKhmMPRtV2qFUwqD8ypuHWAwFtrZ03NVWVLJ04aeIrK
	LwicV1f/DtuoO1xWdXHXzqo46DSsRrCUKeIZuMVd72cfb6sn/TCpqcJyopxw9TW0NRMK/giqX1W1I
	pHzRnDOurRuuHuRb+CC7ExQsxFpVKvsTru6054jFjlSt3bQkgtVP7UuAga8UeSQTgyaxzWh7X7GVm
	OHSC56fqQs1bMtBV8PjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oUM-003Yg2-Ag; Fri, 24 Jun 2022 18:57:06 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4oUK-003Ye6-AO
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2022 18:57:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A988E240004;
	Fri, 24 Jun 2022 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656097019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MFjFw8tUgIphkJRLvt6Qfe1VN4FzK9kVzbslGMkNXCs=;
	b=bAev8iF2GfpDBRxcNW/X2Ge/FOimUvaaQWxtqtP3sW/uCcTzlyHjNtkigWUAnZbleOAfhq
	+Fy+BVELr+GaXVdnwtOFqm/q75XM5Tk6homp7X08QElRTwVX50x2yBy/4+Tgv/jyOxVEgt
	3JmFusW+lwm2O9Yf8wTCuWq0Xr4PZPTo3NHjYyEV02Hk4Y8aE+07w48/Yk4HgITTBzEHw1
	rfZ1TRlq+p4P1jsqTmsS/xwxulMNw6hIru56fUQ2gLa6DKtiayQn2D5AI/xtm32u88VvqQ
	KAZi24ZUYRqBGZW7oEIuOA4Fk8jJYcFHZbs7L0sVSTaYWC5JolP8CvyxTICzjQ==
Date: Fri, 24 Jun 2022 20:56:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v5.19-rc4
Message-ID: <20220624205656.63c4e2b1@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_115704_559329_42707492 
X-CRM114-Status: UNSURE (   7.76  )
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

Hello Linus,

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/mtd/fixes-for-5.19-rc4

for you to fetch changes up to 06781a5026350cde699d2d10c9914a25c1524f45:

  mtd: rawnand: gpmi: Fix setting busy timeout setting (2022-06-16 16:46:08 +0200)

----------------------------------------------------------------
NAND controller fix:
* gpmi: Fix busy timeout setting (wrong calculation)

NAND chip driver fix:
* Thoshiba: Revert the commit introducing support for a chip that might
  have been counterfeit

----------------------------------------------------------------
Christian Lamparter (1):
      Revert "mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00 NAND flash"

Sascha Hauer (1):
      mtd: rawnand: gpmi: Fix setting busy timeout setting

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/raw/nand_ids.c            | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
