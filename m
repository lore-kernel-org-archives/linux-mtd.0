Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52DCC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848EC60C4D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 848EC60C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p5fyNei6gOPwdhyF66TMt7ruaJlfr6zKcQfJBmy7omk=; b=t8l6pVmdn9STeF
	IefxhHpa3r2OmmnhMrvJnZ3n7nmmlsv0L4gc1qC4DqKjvcQYf1/d4FzeFwtpjLAbfO7LXd7abC8ma
	ohEajOdmbu7KZ0VRjyo0ce1sfNc6Oy/D6FGUBgL3JgzzyeFhV+xA8jNwiUTZnRNCFYLmabX9kKwi8
	vzNzjEmDD6JqhCASJpWqp48RUXPhGeHGf/MgI4RTmYcWIAUYVlTpspG4z+6TUko5aF5rdbZj7KASW
	vPglbR1yhMCvlzBtZHW9I3cxKZ6UW+fxoI74XUgi1GTf7EZYziY+qyz3nPRpRVAuJ9j46EhZjqwWq
	m4zKNeBWefdfqxiGV5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maB6r-00BfZn-7w; Tue, 12 Oct 2021 06:17:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maB6l-00BfYb-6M
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 06:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634019471; x=1665555471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YpFcZBAr+S3nQ054+3YBdSJLgE6Lh4TGi48Xh5Pas+I=;
 b=iv2a/SUNqpDHp70+k0jaTa0VNNibA5MV7ka4aAuGPvt3MJbInuSJd2j4
 1pakUbeQEgrXGOBYhfHfDUGwENuF8Ax9dNMxPEi4ezP5m46xM9mcQm+AV
 crNNL8kdpNoanPwTAtdaHMzMupyYgXeR9LC5qR9rYBkfmx9wdUWArhTJS
 mA8vqX1K/En2B7BW0WgfV8O//ueySbV4Fv86gLRWZh0pdwrtlmUUgb64T
 Xy9ar6aGZAd7OpNvOsnRJn9IbDfQDo2ZfQ5vWbVZ8RT9HuLu6Un+C3/9p
 o+P9p7fCqpX4GrY7u4Jgfc8B/jz/A2+hUuQXC+TGzUzklxOJ6ppzo5qAf A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984096"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:17:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:17:45 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634019465; x=1665555465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YpFcZBAr+S3nQ054+3YBdSJLgE6Lh4TGi48Xh5Pas+I=;
 b=GC4vQp5fIftm/llfBYmJM/aZaYfpmCbAmCWUeqnq+8OGw6tZmjDNBC/q
 5nMzIX3+0wzrVJzShrJ0NxRSm2JcpBuBm9fKSYa2zARVoZBb8t7JSlLMk
 89mQvaEGmVeyOy+wB7QdiQ5BLqzHMdJl6WfWmhy9BPMX8sl8aeLCjaA0R
 Yns8PahskYcYelgV+/uUvvbgaAgqbfZXcBQMGiLrR2P/YuF59Co/5JxYm
 ol3KQv3BEagp8RZZTIvQIzFzkM8WsEi+iGyGP6luGWEyMl7aELK8aSgQN
 FQE9z1t5Mf3XpJxwFKumcmwy+F9vOBn8SMF2ECaH5HPY7wJ7Y2GpCKD2p A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19984095"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:17:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4AE7F280065;
 Tue, 12 Oct 2021 08:17:45 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add output-driver-strength
 property
Date: Tue, 12 Oct 2021 08:17:03 +0200
Message-Id: <20211012061704.284214-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_231751_593936_F857F74F 
X-CRM114-Status: GOOD (  13.49  )
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

This property is for optimizing output voltage impedance and is
specific to each board. It overwrites the default set by the flash
device. Various flash devices support different impedances.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Updated the property description and the commit message accordingly

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index ed590d7c6e37..4c3c506a8853 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -72,6 +72,14 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
+  output-driver-strength:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Output driver strength in ohms which optimizes the impedance at Vcc/2
+      output voltage. This property overwrites the default set by the flash
+      device. This is board specific and should be determined by the
+      manufacturer. Various flash devices support different impedances.
+
   label: true
 
   partitions:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
