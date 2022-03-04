Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cchj+kW0TmE04LeTVY7SpzQJ+2F+4Iaq+pfe7NdKlDc=; b=C/BJxPG8KdDxdd
	EKNTb3/1b5DAVK3+stVCfBu8guEv1yO+9YBqm00zDBRV4KI+OuMkeKVS7bh2aT6NkqnqOnTp6trG9
	SRN1PVSeNAeU7qwZxam/YSsFm4ugJJnE6KCs9CXeTiQZd+fzgaDb7hc8BqHT/RN2DbqnH3HAQuF2D
	Ke97WQQcoiYgzKBGHR0IGxGKm1TUGZCA9RyswGcuvaHkf5bg7qyDKmm0MxKYbZTmiud+eXb+HfzlG
	j+PbGDwmjZOrGXgDxUMUUEU7GqYADDnjYon5LPHfCFygaArNYOnkUhPCR8iw/JPDav8X8yTaxwB8Z
	xlHwsXYcu849fQlO7QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQD1v-00BgqT-Qe; Fri, 04 Mar 2022 18:51:55 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQD1s-00BgpR-GW
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 18:51:54 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1D1E722175;
 Fri,  4 Mar 2022 19:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646419909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=U/LuT+rONVQX6VgKjgRIoVDXdEdfsqzHnymPhpyq4D4=;
 b=p0ydG4ZHJrTNCFyMchvneiY8zMwWkmVxx/Crv8uDPltk8wA868yjn3+C+ogMxsPWIqyZlX
 3WGQ5xnDiiHt6H6+nYQVbXNm6V6n/J9FEb8/fnnusNo32FOXZdXZF8SH/aWKi4MJLQeFi3
 oou8fMQmz8o7w/t8FNtIYMTAGlzP2sc=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 heiko.thiery@gmail.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't specify it
Date: Fri,  4 Mar 2022 19:51:37 +0100
Message-Id: <20220304185137.3376011-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_105152_731053_89BEDC53 
X-CRM114-Status: GOOD (  17.91  )
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

While the first version of JESD216 specify the opcode for 4 bit I/O
accesses, it lacks information on how to actually enable this mode.

For now, the one set in spi_nor_init_default_params() will be used.
But this one is likely wrong for some flashes, in particular the
Macronix MX25L12835F. Thus we need to clear the enable method when
parsing the SFDP. Flashes with such an SFDP revision will have to use a
flash (and SFDP revision) specific fixup.

This might break quad I/O for some flashes which relied on the
spi_nor_sr2_bit1_quad_enable() that was formerly set. If your bisect
turns up this commit, you'll probably have to set the proper
quad_enable method in a post_bfpt() fixup for your flash.

Signed-off-by: Michael Walle <michael@walle.cc>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
---
changes since RFC:
 - reworded commit message
 - added comment about post_bfpt hook

Tudor, I'm not sure what you meant with
  Maybe you can update the commit message and explain why would some
  flashes fail to enable quad mode, similar to what I did.

It doesn't work because the wrong method is chosen? ;)

 drivers/mtd/spi-nor/sfdp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a5211543d30d..6bba9b601846 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -549,6 +549,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	map->uniform_erase_type = map->uniform_region.offset &
 				  SNOR_ERASE_TYPE_MASK;
 
+	/*
+	 * The first JESD216 revision doesn't specify a method to enable
+	 * quad mode. spi_nor_init_default_params() will set a legacy
+	 * default method to enable quad mode. We have to disable it
+	 * again.
+	 * Flashes with this JESD216 revision need to set the quad_enable
+	 * method in their post_bfpt() fixup if they want to use quad I/O.
+	 */
+	params->quad_enable = NULL;
+
 	/* Stop here if not JESD216 rev A or later. */
 	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
 		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
@@ -562,7 +572,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	/* Quad Enable Requirements. */
 	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
 	case BFPT_DWORD15_QER_NONE:
-		params->quad_enable = NULL;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
