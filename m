Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B9CEDD8F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dSgWoRYE5zvo2SuR6z4W1fmsB81qYWukm5SPuw5A4l8=; b=P+NOpSkDpLxsEo
	iH0DWIWxjdF9X061yMBPchVxYO+w7W7jWIUhtq/ZgZkJe0VsseUSLOjPKAfF/IGexPBe1dypMaS4h
	49/WUrt16Gem9RtwpHtI1IJFQABoXTX9grwa74Kx4n0FyZT5RdL4MSAf0xPKR3VxxrhKb0rHNtPuj
	1cnkRok3Mkap1AYtKSaHu2g9dXMsMdf3IaT7+f2o3TmaU02PVA2AqLY7PJwniQo1vyrapXx8J40x5
	znGxKgO5F56Ouo3oZow1hl2Xcevut+EtAr1+JH8kX6ICoBRrWZgq/iWr+kkl4P4Drv8YqPr2wRNwB
	ybF73tvrrtXBaCdM1CkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8s-00000009HkS-3c4X;
	Wed, 09 Oct 2024 12:50:14 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8m-00000009HeV-2w2d
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:50:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2B1A1C0005;
	Wed,  9 Oct 2024 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728478204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=53bk8xeLQLZ0BS+DlMlO8EAnixamXZJw6i8ma6pX2yY=;
	b=AgFFpuv3R+tBMZJnaVnV3agfDpWluG8wsieXFivLxBGqd7oDnJ+Wmfb4lyk1kgxLImMvpK
	JgiMHSNl0AiO3ZIb3n7kx5tGOjLPUvnQvFIiWyo73VDWwfdLD5fXO+vakgf6/TeKyRKFLX
	oH1VojpC0xTNq+FiuQ3m7/i3fueXcz7KckDrdO3rEa/d6ODgItobUwL76+JoEbu6m/ut1H
	cP908sDYO7/FmvOauSKdTmNjxJU+/t86GGH7UQga+gwAem/c5LBpo35oBr9CYXXujNDnhC
	M3/t7Jok1oq53B9+tmKKYAal50HBpHJIS7FtqUuAn3uYXUup8BzhTdX4pd7xDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] mtd: spinand: winbond: Fix chip descriptions
Date: Wed,  9 Oct 2024 14:49:58 +0200
Message-ID: <20241009125002.191109-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055009_220847_13652594 
X-CRM114-Status: UNSURE (   7.03  )
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

Commit 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
is surprisingly wrong, as 4 out of the 5 chip descriptions are
incorrect. Any bitflip on these devices will lead to a kernel WARN() and
jffs2 (or any use of the OOB area) is totally broken for half of the chips.

First two patches are real fixes, the two last patches are just improvements.

Miquel Raynal (4):
  mtd: spi-nand: winbond: Fix 512GW and 02JW OOB layout
  mtd: spi-nand: winbond: Fix 512GW, 01GW, 01JW and 02JW ECC information
  mtd: spi-nand: winbond: Ignore the last ID characters
  mtd: spi-nand: winbond: Sort the devices

 drivers/mtd/nand/spi/winbond.c | 114 +++++++++++++++++----------------
 1 file changed, 59 insertions(+), 55 deletions(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
