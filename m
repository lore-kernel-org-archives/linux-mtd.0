Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A2FCCF2C4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc4CujfpkEbQU4Q6lbfArZqIQCpGqMvB/9pBWso6f74=; b=zsBPH3nUNFmaMd
	nVNcd2fqsaeFIDJ2FQRT2dLuvhpDE2VNq7y6S7TQe6oYrU//AH2srSzHPzrW8p434BLoGQywbAmPZ
	bx7F4Z+QQ0emcWTqc3GZt+mWO6R1TTx3t1WCyCAqNPkJdERLBq5E5R2g0ajI9uLyHypx0c8EFIFML
	6JIq9+b7XWdPzfeOdhPLC22CViwRKYxgUTPcQfAjjERkqjdKLw9JNZTIuj5/5wsHBf3nwGWiE2/s+
	sn8IzM9Mnl6u0k17IIFiOoHvGCpo+ykgAPx/1KKUlnw00CchXPxuvhgbNNIAjipEB8XCO/Pqk5QGM
	2S7KqLGHl0UJpwQrcPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMs-000000059en-0Ifz;
	Sat, 17 Oct 2026 19:46:58 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMV-000000059A6-2QO5
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:37 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-4b28d7c729fso502773b6e.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266395; x=1792871195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=GV9cga+7FveFgjIBuO4DzdZmu6/jNznVMfRKs/BjBB37IxsUb3kEu8W//ahdEodJb0
         XYS+E9oJegDp8ixHwu/Y3dzGithDv9HzL19HE8rKeaVc2D/HxtG/TwQG5Flm6o3pnkRs
         Npdfq+3nC75Hl0GlQfj+RAyHdQwITEHncieoQ+5XMt6aSv/d5HjNVGLFkWcPp+L5pUAc
         QR6GHcmmstUrkqKR4zvQGDXok8tO2O2RtklOWywUhTUSvQPbxgojG6w11YTH7p2qgqya
         o9dGTT5IkcY6cTq46hyut4bdsqHvo9+P3KiCPM91O3QmlUo9Oj4wG2l1G+R17VdWpNmo
         lQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266395; x=1792871195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=OvwdZ+1kNdrpkRwXkee4mh6RqQFDYkmBVWfvOTEO4aviRe7nEfCQPi/jHvIn7vcvrd
         Kbn/Ox3dLFdB/ETn6POdLBij/XVq7W9df6JcjfiQ0GCePks0UynmYJB0xqvG4/x2Aqtg
         qzgXhnGWcVNJ+jhkJFVS4Umsvdv4OSh8RB4ihqYlPK7BJ+bGA99/Vmrk6neYJ3bTuaHG
         GvJ9LwpZVJtuxNjXS7C1p+3U7eq3Ea1JDpUAmvzAAvSPiP5DQCmTfdAYzCGEyQsJMTkW
         xQGaFHVjpCv94bVfrxcwFE4rxs9Eeph/Fkwt4Ttm1JYRuZoNgy7hpyOl7yq5+XlyP7ad
         m/tQ==
X-Forwarded-Encrypted: i=1; AKwUvByTqLSi719zNneoD62+AaHPeYP4/TeCkXcOahbZFUDc1Qmgd21P5w1CPnIakzC/zxM/KKhUq6zW8WQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYII4EYXQduLhlMDXStU21Xp8ELT1WNqc4TUTf98MQoc7QXEyG/t
	IlS6JSVNlV6s+jVQajdMOK20dWy3OJiW8fbXUuxHLqzXRdQZQHNUKi8O
X-Gm-Gg: AYBFou0iRYagV5SnQh4qdVOqCILQ/Xe1uzuISanVF9bXkyaJ/+GjGXbGgZ0cZcGRSfF
	NrqqHQNr3ovsxS6KGU68xseLn5QAbsddO+dbYcM1XegFKvAPsxAnc/OPS+ioxgJ1dXN79QGPiDE
	wHk+2acYz1upEUF2kHmTs5aKuduhhxJjR68rBkG8+YTV5r2gMX/DtUIplJOWfSimiPDer7FdC4V
	1mPWfDHsjLfpa2fXYO3v4PrYVD3LkhRah1IPZd+0mgmRT1dWYrI8ujkzB5TEnU9i3KTQ1ATrrYl
	EiOLJelEXWVrWfn/G02n5koIJh4MH7odlYJ/oKnE6Dp7E72fl4S3DjQIXctwXBZE3e2LctYPs0G
	UjJHlFlmYlNjYUNPdSn+Kj+4LTH33axDYvyQXXxDGu9zKCSTw1SQeVqh5I19AZPzGgTTvyWO2vP
	akdrFpFzC5J09JZpo5rvdvawFImwIPdvLiBHZRwY6WpNEsluMBRscsyIjMg4lbD2AKmu+W55pjc
	Lm+hB3Rvjvzi4dXBsjbQg78nAa0DMQWAWpsPWoU0CPvLnFjABmd/TICUoekfV4VqO52bkGlfykj
	qeLU09Fab7ze3h+2rI4gB3J/VtJGkoskLQoo3ESUSVynN96960/LMqyiSMddeGhzEX3QYSPu7jB
	mD3gOiIhPrGGO8yyeKPSM
X-Received: by 2002:a05:6808:238a:b0:4c3:9892:96c3 with SMTP id 5614622812f47-53ccb300dfamr2614650b6e.22.1792266394712;
        Sat, 17 Oct 2026 12:46:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:05 -0600
Subject: [PATCH v9 10/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-10-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124636_193815_52B25051 
X-CRM114-Status: GOOD (  13.73  )
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b79a20158cd4..f00f9a8ff66b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1848,15 +1848,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
