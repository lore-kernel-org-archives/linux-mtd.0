Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B30C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2A4u2g4zUUcYbSObA2H8EUeB7rMpWr9ITEhsYbNxGw=; b=DumQO0p7AoXydv
	Fq/M6Jxa+1P4WzlGyYPjEfBqYE+CMq7yy0QBQxvvJXa/YiBRYe+JlcC5nHe1rYfvoo25zOaFdEk2I
	EJHz+BLHQ81sTLJQ7JHQex31WwcIZYy+Huntr5XYdXChKWjCGDF4mwLF2LPsnUBB69vvhZWmhi3GL
	6PZaAP0Lp/Bj2lsddFy7HlC8f4ZqG7VlvgMANKSkEVvEdl+YNz1MeVwt44hRD8X9xBZnpUEC1WdTy
	7RZUuFQl90FvVZCODvFghs/LTkUmf8OfE23/LQ+XgayDhMLgNFE9SDP7EKMIbBFCgbIuPSYhOuKme
	sYN4zYIcyGgsU7pRWG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGiR-00FjPx-Bo; Wed, 02 Feb 2022 14:34:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGiM-00FjNN-80
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 14:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6861C61866;
 Wed,  2 Feb 2022 14:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8769AC004E1;
 Wed,  2 Feb 2022 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812468;
 bh=tBSLmTgNltnp/arCgoQp01wQjzbT8MRLJMndYCPwJG8=;
 h=From:To:Cc:Subject:Date:From;
 b=mnYlRLgadawzS+FreJTw4FPeeXTxhtkLB7TLMrckbbgG+ilpwHzotIJ58fSHG9p+0
 3wAYdJ/trB/LyR/klJgWZUAkwhswTJ61MmFlUOp+G0bsIzoMQXPYTkZZvpc6JvMNM5
 DPlpU4bgaLOje8szb7yOu1FILiXKj0zKvZntgogwNfFCqDnNEWrdj6R/dA8AqnF62U
 YJHdYuSwicGBkeqiWHc/zPwOA1uOrVhYQ6xtAkBnrwRPBHA5sQtsFLIIpD73OAyo7M
 Q6JnHEQAKIqj4aGNh5mtp/f5B11OH0ZpASIJX5wBzNpHDXSM+qNowBx9fwHmXE8uhZ
 YYOjVypNY3aqw==
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] mtd: Ensure DT compatibles have SPI device IDs
Date: Wed,  2 Feb 2022 14:34:01 +0000
Message-Id: <20220202143404.16070-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; h=from:subject;
 bh=tBSLmTgNltnp/arCgoQp01wQjzbT8MRLJMndYCPwJG8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+pZYXVIOhK/i6pcUsTZJvS1uJQHJLEF57alubMTj
 bi68Ue2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqWWAAKCRAk1otyXVSH0NHeB/
 0e83+uTMB87EBVZ/I5rMM8wwH/dBX6gWlRFsrM314rgOg5ffanY59S3ACzdJT/nQrq5JSgEfrG9O/b
 q9CXpKOdhL1/jm07hPnTOPTEimsVuSO/obd97qj9tB5V+deN7ia+pLjg8rNSrGxgyrJy2gbq8RQTTG
 64pECKVxMVUdYQdHUUuadGMqyhUB6EUV66D8wk1Rf0v8/6BDRn1KdzPb/eJNsZCs+t87Vy8CPXZrrP
 TOJMAz5xhkbsE3vAqPU5vNY1xwtR9xDziMUUaX0DXs7Y1zaE1pH0Q4NvXdGbwViesA65UuzGnTev4I
 YonN9e5P4kHmyYf2GcCgk0fWoILNZ/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_063430_372118_8EA5F2ED 
X-CRM114-Status: UNSURE (   9.92  )
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so this series
adds SPI IDs where they aren't provided for a given modalias.

v2:
 - Rebase onto v5.17-rc1

Mark Brown (3):
  mtd: dataflash: Add SPI ID table
  mtd: mchp23k256: Add SPI ID table
  mtd: mchp48l640: Add SPI ID table

 drivers/mtd/devices/mchp23k256.c    | 14 ++++++++++++++
 drivers/mtd/devices/mchp48l640.c    | 10 ++++++++++
 drivers/mtd/devices/mtd_dataflash.c |  8 ++++++++
 3 files changed, 32 insertions(+)


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
