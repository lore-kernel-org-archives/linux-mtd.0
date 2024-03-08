Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200B4C5475B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Mar 2024 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zbLQfWuxJWk1ECQNkpd8xtchhC8qqXU4K2HLqquWzXY=; b=QtMnvHKqm2eeH3
	a/1ENpqiERVzUGa3qBOdQh4pA/4/pu4BD211w55gtWH2BlkdnUriri2Y/osgttBI8d9VjL/0a7ZYN
	cSLijuXAQb6w1h48Aky//KRvjV262XNWARHbP2+cVrU+GYW0BNDNqZFIkdi46BCgiI3dZ1Y5UKdK8
	PSlN4uoM7+tnQnaxmg8FpvCVOFojAv+76P4BDWY2ACJNB6e13WN7se0HD+eqlOPZfM2gPsuSRyd+r
	Lgt0RqVpGRub04lC1eT1xNoXqEOVimg3DmjO8QORtsipdLzSlRzoKhWw4m8XTpdJYJGo2yy5vFLiA
	sBsOJSGpCChiy7YhCDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUvx-00000008CPk-2iNJ;
	Fri, 08 Mar 2024 07:46:25 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUvu-00000008CMm-1SZy
	for linux-mtd@lists.infradead.org;
	Fri, 08 Mar 2024 07:46:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 02CDA40004;
	Fri,  8 Mar 2024 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709883977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rh/TMFw6/2TpSgFOITs518M418uS/FqGdKrbo+fGdeI=;
	b=Nc8xtVoVpS8MI7y8AubYuIQRHEo70NEsK0ci1FASAXmfJIaqYhzeni0fPfZeupKoo2WKTz
	GuAK4gcvX9oLICtDx3/QFK4ohzMFpTNjibclgWx61urSH8hoAcQXeM5cUpaBWpivaGXkw1
	Wtxmz5LwjAbHx5MNtEkHx5qFE66QR+3hkk30ERZ1vtNAnoQnqAv5AWhX5UHRAwVMbg01xG
	/jepdawxKCv/qU+4SxsJbDY4ljMLb868ya2RaI5OGwMYQy91G6b7jUHibzBMTg0UBiiwfh
	dOil7lSAcLdgWAPBeHUT/bmBvBYXL34iypOal/nYJqMLyDKGrORvpFP1rhvjIA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herver.codina@bootlin.com,
	christophercordahi@nanometrics.ca,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 1/1] mtd: rawnand: davinci: Add dummy read after sending command
Date: Fri,  8 Mar 2024 08:46:09 +0100
Message-ID: <20240308074609.9056-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_234622_583020_FAF32EDF 
X-CRM114-Status: GOOD (  20.06  )
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

Sometimes, writes fail because the tWB_max is not correctly observed
after sending PAGEPROG. It leads to the R/B pin to be read as in
the "ready" state right after sending the command, thus preventing the
normal tPROG delay to be actually observed. This happens because the
ndelay() that waits for tWB_max starts before the command reaches the
NAND chip.

Add a dummy read when a delay is requested at the end of the executed
instruction to make sure that the sent command is received by the NAND
before starting the short ndelay() (<1us but rounded up to 1us in
practice). This read is done on the control register area because
doing it on the Async Data area would change the NAND's RE pin state.
This is not perfect as the two areas are behind two different
devm_ioremap_resource() and could possibly be located on different
interconnects (I did not find more details). This means either the
additional latency due to the load operation is enough impacting, or it
has the expected behavior of ensuring the write has been received.

This has been tested on two platforms designed off of the
DAVINCI/OMAP-L138. The first uses a Toshiba NAND Flash (TC58NYG2S3EBAI5),
the other a Macronix one (MX30UF4G18AC).

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
nandtest utility sometimes fails because of write failures. It is likely
that these failures are due to a non respect of the tPROG delay
after sending PAGEPROG. I could not manage to fully prove this because
adding debugging to the code makes the failure disappear. As these
timings are really tiny, I can't measure them precisely.

 drivers/mtd/nand/raw/davinci_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index e75d81cf8c21..051deea768db 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -671,8 +671,11 @@ static int davinci_nand_exec_instr(struct davinci_nand_info *info,
 		break;
 	}
 
-	if (instr->delay_ns)
+	if (instr->delay_ns) {
+		/* Dummy read to be sure that command is sent before ndelay starts */
+		davinci_nand_readl(info, 0);
 		ndelay(instr->delay_ns);
+	}
 
 	return 0;
 }
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
