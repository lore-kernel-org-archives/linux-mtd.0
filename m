Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C51E606A320
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 02:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SJjn9/7T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=EQFBP1KB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BuNjfBHjPhNrpf5R3pQqOIyycNubsQnUlzzg4OKpNuk=; b=SJjn9/7TfeWA/w9evn/a6Ee1T+
	7gsyhZbfETTD+BAwf0DVSLuUzk8OX4YD1aZD84qJqvL29PEkFeCmj+mcPu4XQiMc6ZTdoxlUtxF0A
	saSFJ7xgoMOe8clIKJrjyOK5csBg4eqYVMio37MAVdePF4FkgSmyOeK3fsT3xmtosbCStghYipu9A
	qB3qZuibVg5KDYv5UM85oMazC9hSDX5INJQaB5mrWq6Z38pXgb5DZCTA/+BmGhhjuMNjeBw8A/b5b
	xDax3JdmFwXOX9onMxMefL4PlSArqqogR2tZvI26zEUZUJco3lZthUPKWSPr5eNbDqsTrV/LWCrt0
	85xfQcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEuD-0000000H6r2-0mYN;
	Mon, 09 Nov 2026 02:14:45 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEuA-0000000H6qh-1pNO
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 02:14:43 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3282db206d3so900181eec.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 18:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794190481; x=1794795281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+h57vEeYMsDL7q4YjW7EJHuQlkp7BLgFsx7/CAjkpU=;
        b=EQFBP1KBgjr5KTEW1ZbWOMB0/aC3/kVGhXkyea6v2EU7k4wZSXfv3MVEWJ8NPI5liS
         RPkYU2YxVOvx9ev0H0wQvNHNMILrmXkWf2YVtYMwzefa01c/tXq+swUM42/L3P3xIqq4
         FFL9/pT25EecLWCSRj768vRnet3JioqNjxUTSMZrRBk5cOQEXJPcgmM3vJqrOGt7MjRE
         NELAQpY0vGTGmViu6OdgfLDGst5Vct18xz+8rNr2yL9NwovD8f9DUmy3yx+QFJSFv15+
         OSpvGE55asjS94cZPs55WAY4ijJKO0rZrfsAx7pLIngNH4Gai2M1bTQ1T0bsaqMLFWGO
         y33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190481; x=1794795281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+h57vEeYMsDL7q4YjW7EJHuQlkp7BLgFsx7/CAjkpU=;
        b=FyQx1oOfn0eFRioDrmdtk7lAukC05BOxIEJbRjDHx7CTSbqxhDF/aeNzFYr0ctqJxa
         O1v2aRfwAx2EEGra9Y3NeGKKRwXrjL6OHwSoK/oO3so4Of+izgWfNtaDxle9AECZ/qBT
         m4A20XOrVRHRotVBV72tpbkiSg1dUPd1f0Z12kKvj4uw+3WPfqLUUb/d2nPlhaGuIYpQ
         m9mK0ldpzRqgVnRzr8WwCAYVhvIEcP5to7AmtneacDJdr3UF72L2rLCCA5XF+19vt5rr
         yHkPw3kzx0nPiPkE+tqGgTwFo9CppUI0HANJCHztliqqx9uHkVW2tVFQLYWwqXFoDx4G
         IVvw==
X-Gm-Message-State: APuU4Z9FHsHaNXFXmsoc7qlkupV5O4gxK3gNcav+zwx5OTmTldu1hAAn
	sPNIoQ4emm61RFP8SzFJjv1IXyG+FAskLTieAB3tVkqDF4UT4PgvbLtnIrAmgRBPPw==
X-Gm-Gg: AYBFou0p3h40/fSg2mb+85YytQsVNuykH7ECxufkCbkIIbseapJgNYQw3iyhEsGxTXe
	BUYOo9+p+XyB4Y38QtNPVOKc3xt8wU/zLkJkO6ocd2iw1Mp1Ym81pl6UsGlNBjm7PyHKArkaYCY
	+ndqapWiQMUMjPHSZOG/zeTAKa4KA2dMrTaoX8Sk6tvpCnvVPLFvV7wYmk1Bge7BFzMaGxVPVX/
	0SwE1ecZyIFJ+5d/QTiZvQQeEinIH9qGZaAin6PffwIBI/WG5E9PWONmaBpaXMMviAFETY+dRyk
	N0glOXzRLX79uG9Av+pUhUCu74eBdsjoVb27mJaSB1v6yhJAxJ5rt4ULWUGU6cm2akoXQgRsHEx
	rHtZdleww4wRqZpIR9CQdTNQFFWsaxtV7z2lYvesfBCRT3DnCqLu/n+qouXOdGzhbsYsEe1ODhz
	ZYD/OSdYK+VsE7MNuPcj320/piFaawSau2PsvxDJuQcJz6AYpxPFE73Ud6S2eMPsWntdpWjtR8t
	20QxM271f+IvQYBrWXE3bGrIIwE7fllo7+ye/sMd/52OdgJQllOoe4/qHN6uanku9Liockev4A3
	S1snjZ4oyW+Uu+n+AjPSSeJZwG7WZiAGWPU+yU+jA/oq+cxheEE7fD2pmQWiQZg3
X-Received: by 2002:a05:7301:6492:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-372568fffe1mr5590031eec.19.1794190480709;
        Sun, 08 Nov 2026 18:14:40 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm9392155eec.29.2026.11.08.18.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:14:40 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH v3] mtd: spi-nor: gigadevice: Add support for GigaDevice GD25B512
Date: Mon,  9 Nov 2026 02:14:35 +0000
Message-ID: <20261109021435.904625-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_181442_589199_2529F086 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.

The chip exposes valid JESD216B SFDP tables including 4-byte address
instruction tables, from which geometry and opcodes are discovered.
Status register locking is enabled. Status register block protection is
enabled using 4 BP bits (BP0-BP3) to cover the full 64 MiB address range.
Read, write, and erase functionality across the full memory array have been
tested on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
v2:
 - Drop .fixup_flags per modern SFDP discovery conventions.
v3:
 - Add SPI_NOR_4BIT_BP flag to .flags.

 drivers/mtd/spi-nor/gigadevice.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 6a2e6ebda148..113db85f7bd2 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -64,6 +64,9 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		.id = SNOR_ID(0xc8, 0x40, 0x19),
 		.name = "gd25q256",
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
+	}, {
+		.id = SNOR_ID(0xc8, 0x47, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 	}, {
 		.id = SNOR_ID(0xc8, 0x60, 0x16),
 		.name = "gd25lq32",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
