Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7295BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F5DFfnXOTDe8qGP3B6vNbxgZ2P9MqvN6/Oier9dXnfs=; b=Yij48aurS4F4Yo
	sk0DWkfWsDLX62iLOECIAeCQ/AMy+ryydmrJvE1R1nIAyd3fv7Q9qpCalnSo9qqEDY7MFJrdgfzaZ
	fJf5BIJ4zCHEH92v4efY+AUiQKcK1tcn3T4GXjrhGgPf9pdOVPIhfFNclUUr4uf6ZsqmwUP6S50rZ
	feSP2fQaHSpfmNpg2QOs7Wqs61hDnL9EHmvJ20HBrSNoKd/4KUmnbar4wuexE0UowAzvZyiggEdLG
	6VCr7dG+Vx1moXaDZ181DNmHWFD+7YyBs6xGkjMqzpBLxwcCrf7yXZ7DlJCjBiYh40JKztfKedO8p
	7DrLEWzmgLFBzb4CfK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRE9s-000LMC-RR; Mon, 07 Mar 2022 14:16:21 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRE9o-000LJM-B6
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1646662576;
 x=1678198576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ICzA0DrdXMhOKFRda00jGMuRSZtr/qRb9e8msUmDl9E=;
 b=UbfC2HPhIqEpmO/mEGwy7jNk7gL9mJqsoQljxVQuLFZ42ExZL2ANS3Gn
 H6YAYTDmHSL74/wWcJdgkjy5BwlCjEi6OkzFXi737IH2iBHOpGxaSh8Sq
 M4YYjGJMYr4tLASLyI46rKbZO7izjTfYI9SAxXrUprr77Y9Vi84pYwptR
 TstRQtxoT0IYGSKSWIKzpwciS18UVftZbEee0w21uWHc2xXgUMMK/cFTm
 7DtPQRla1CQnykiBsDfANbikrjLtzYfozYxkk/UxQ5Mdn/pz2ggT+Kzzh
 y4WJTajWUuyJRTcuff0zz6HPl/BGYlK75Xpf1GqBcgyFCjbGHqRNDIyGP g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <frowand.list@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <robh+dt@kernel.org>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 0/4] mtd: phram improvements
Date: Mon, 7 Mar 2022 15:15:45 +0100
Message-ID: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_061616_887532_E976B67F 
X-CRM114-Status: UNSURE (   8.38  )
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

The phram driver in the MTD subsystem can be used to allow the kernel to use an
MTD or (via mtdblock) a block device in RAM (with the contents loaded by a
bootloader for example).  This series has some improvements to make it more
usable by adding device tree support and to significantly improve its
performance by using cached mappings when possible.

Vincent Whitchurch (4):
  mtd: core: Check devicetree alias for index
  dt-bindings: reserved-memory: Add phram
  mtd: phram: Allow probing via reserved-memory
  mtd: phram: Allow cached mappings

 .../bindings/reserved-memory/phram.yaml       | 45 +++++++++++
 drivers/mtd/devices/phram.c                   | 78 +++++++++++++++++--
 drivers/mtd/mtdcore.c                         | 11 ++-
 drivers/of/platform.c                         |  1 +
 4 files changed, 127 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
