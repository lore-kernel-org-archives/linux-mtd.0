Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F728C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HiGLHIO288j0i3ZsdVjCFlS8UFX3hL0lkjIxNq0KM/k=; b=X046TzbqfCQpiU
	visNP6G1jZUG3OAVphd4czIsaY1I7s6+1paQzNwU6kT231ZChcEaSNU53OsD1Q8geQJTTll8/NNpR
	ussPShRL/fh93wJ8qTbNzpPgp+gR2Hqh8KQpn8yAcF3xsS2Pdaxp3gr9Xz1gomM5/OwmqNFCyYtNT
	PUiUxbuaUKfJbCGjeVgAS7AvEC+GnhoI2KrpI7KkFJNMarWhc1QbJUJvtOcNKdbtBZ057as/xOMSx
	3fP2HgHY7VhDrfxOLfKyzA7DmrjgN29pMCU5kBulIwJXLIrqjx+F9t97QxazuPijmNv2oOgNscfs8
	ZnYSVxc880ImXCYBR+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt51H-0037dF-44; Mon, 23 May 2022 10:10:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ot-002A7b-Qw
 for linux-mtd@bombadil.infradead.org; Mon, 23 May 2022 07:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=tloN7t7Um1VK0HgY5UzOFHkfXExj5u5VBpRfGhOZ348=; b=BWa3weK0eKMTpiI+U5WUFDg3+e
 g0iSdB8FNJDav3XmvcpBuvjBWfNhmL3UUKg3DntYEairIxbx4PI5CjgaX2RCAzMMOJ6m2iihtKx1N
 zNMG7mZ7tNOLLVk06EYmASVTpM003vwhDLNOiKtrYBNlOviZvOXqWPOUnZdB6qTFC8V1r3cOWS0Up
 nr5y4qOFDl0g8gMoVCjIiVSQA/P8oy8Wz+YeDwhtFhMpy7OZQiezHQgdm8khjMGxXZ2dNUQ4Kkd/8
 8O9Hh9X+t+QgwLOHZ3vcxp1DhvO9eJDsLO7LyqMVHaa2BtBeU7yuZpl2Moyh+wWofB3M88ghZNrwk
 MQr56ZqQ==;
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt152-000sVz-12
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 05:58:15 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D4E65C00CB;
 Mon, 23 May 2022 01:55:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 23 May 2022 01:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 tom-fitzhenry.me.uk; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1653285352; x=1653371752; bh=tl
 oN7t7Um1VK0HgY5UzOFHkfXExj5u5VBpRfGhOZ348=; b=hHhgo+IONCuziFq5ob
 vPxaIkjTOuBIWILEBP2ecx5SqxZC7tjPA/HsrTA9TbH7TlouR9KKLH0yoQ0vcHoT
 IvSLXqTIwVuZY6ldqdlB8VpHc3Hign96h0JZUdYyCv/7PTttFDYanmJv7uWnfr+R
 tfEoTWyr9MzQGPcmmZwQsBHPcmLB6BkaRmcWrcZZVs20/uEUrw0aB4mqg6k/tg0t
 rRM+tDcgYqNWAX4lTV7g/z8TxDjjdWLq6/I+FFg7zArT61+we6p1m1vmQABhPuXZ
 hb/bMcK348MysFP8aGpeCFP1DHTqiOGNPvEx8fPPwssfb23DwMt+j+Bs9FWd9t0d
 tyNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1653285352; x=1653371752; bh=tloN7t7Um1VK0HgY5UzOFHkfXExj5u5VBpR
 fGhOZ348=; b=DAs9ltRVIiyqAlrIMpLVyfm7p950SNcoShklX8mrKyOAZsY7HgQ
 ih9uTUt/fh5pdT1MxDA/ZcSQO0peYH0/AHZwxGROYslLuehdohZyb+MBCAH9l1SG
 ZOcJJHQAL6oFAi/ORqtXWrtDW0e6h1ydc075KBaSitNk60yvTWcj2C8AOntYxJS3
 SCn1pftbfGvfInBOegNKfrQ9IoGB1DLFRVtkyltVBLJToDGluRFNPkkuP7ozLXD3
 8q5jCCGkioAWdSAQMJRof7p4mQlCGZvFjY82h0OtWnbu7z5AEUcHmdCW1I/9pnxM
 OGECEHIXaCpiTLxTbSL35RxB6PVAP9JvndQ==
X-ME-Sender: <xms:5yGLYvFYabU4aR4D94t52DS_TBypD7yQfUMV6BLEf90QodWemmJExg>
 <xme:5yGLYsWA5Sc5Wu8P6QKRIxtWL-g54zMMbJAe8hOMlR-JqJdCgqTTX7t03a49xJvYa
 T5B-7YeMA3CPSvtkA>
X-ME-Received: <xmr:5yGLYhIqZbF4K2i9oZQjvMfIQZgfgAMEQ3g187AgItWwLCC1z3oWjBsU9Zwg7tViaQHm83seJq-o8C2v2YrGF1stUNPDtx2LCbs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieelgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhomhcuhfhi
 thiihhgvnhhrhicuoehtohhmsehtohhmqdhfihhtiihhvghnrhihrdhmvgdruhhkqeenuc
 ggtffrrghtthgvrhhnpeetieffveegleeiffegleeiffejueeuudejtddvvdehudffueeh
 ueffueelffeuffenucffohhmrghinhepghhighgruggvvhhitggvrdgtohhmpdhpihhnvg
 eigedrohhrghdpghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohhmsehtohhmqdhfih
 htiihhvghnrhihrdhmvgdruhhk
X-ME-Proxy: <xmx:5yGLYtGBWhVc2HemBFKKZeorRXEd1iVfZEfWi0818XyZJYaDZHvlTw>
 <xmx:5yGLYlXQGo-8G6DJoD_JNLYYjqB6CfuPK4tEqoOJGEvZULO9NOKISA>
 <xmx:5yGLYoOu2Upd8pOpz7zMI64qeDTZE9nsSaY1O6OLBuf9BXu1SEeOHw>
 <xmx:6CGLYut-MSj4Kipw9j9GxGwLKiMAIA-mv7dTWfjKfCrX4K5crBHFaA>
Feedback-ID: iefc945ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 May 2022 01:55:48 -0400 (EDT)
From: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Martijn Braam <martijn@brixit.nl>, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: gigadevice: add support for gd25lq128e
Date: Mon, 23 May 2022 15:55:40 +1000
Message-Id: <20220523055541.724422-1-tom@tom-fitzhenry.me.uk>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_065813_143647_1CBA2817 
X-CRM114-Status: UNSURE (   9.82  )
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

The GD25LQ128EWIGR[0] reports an JEDEC id with a different vendor,
otherwise it seems to fit neatly in the gigadevice list.

Tested to work on the Pine64 PinePhone Pro[1].

Attribution: initial version was written by
Martijn Braam <martijn@brixit.nl> for the Pine64 vendor kernel[2].

Also in use in vendor u-boot builds[3].

0. https://www.gigadevice.com/flash-memory/gd25lq128e/
1. https://wiki.pine64.org/wiki/PinePhone_Pro
2. https://gitlab.com/pine64-org/linux/-/merge_requests/29
3. https://github.com/Tow-Boot/Tow-Boot/blob/b94838dfb8971cdeb841d3922051aaa8e108b085/boards/pine64-pinephonePro/0001-mtd-spi-nor-ids-Add-GigaDevice-GD25LQ128E-entry.patch

Signed-off-by: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
---
 drivers/mtd/spi-nor/gigadevice.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 33895002eeea..871c9dee11dc 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -56,6 +56,10 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "gd25lq128e", INFO(0x257018, 0, 64 * 1024, 256)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256)
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.36.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
