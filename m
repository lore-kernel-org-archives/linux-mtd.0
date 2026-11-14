Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D661C606A33D
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sCJk802+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rGO7KtyP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vyj6QTLs5jMyioY0xT4neofuc78RAB0AeAIWpvHiwrw=; b=sCJk802+7bPvSurupTQ5ICPH+d
	S0L5Llfhi1yuNfDROOO8G6RxPnkaZnWq0xJDzAjwWN4SW6eG285AtVxyxdvmesFqEu+/cLy+rJsAm
	J9vazYbaED5w66ZrOAJ9Me3K4EmX8ceisl42nIHI77ohe8Kr10XBwXVf57l/W6owNPfY0BQeBByHl
	LaqWkWPNRfGdTtEIgpoCbhFGt9A/Jon+2+fFlzcxPfHo3Nvjxxeybj1MssG2TALKIKCN1gwsGm1fM
	lIhmekg62YKop5Nmtl7cpcXxtXqzVJRHtyxOVVBFprH4STzyerHHhh9l/UrURiLMTc7i2emaT+5Yx
	MVzj1T8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIp-0000000Gf5e-2Kn9;
	Sat, 14 Nov 2026 19:20:43 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSJIk-0000000Gf4K-3YBC
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 19:20:42 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-91f0272ce61so32302916d6.2
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 11:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684037; x=1795288837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=rGO7KtyPVi7yzf1twWgbry+SjSronEIIOw3h7ZMMiG2y7PA5cSBZ+u/yykK/kO8YU3
         STOJxQB8nfh1feVCPltXvXKjVdmZ9v+lbkvzrR8nJpJnk30xL6QC/0eNNpCAQOwwnS3q
         YW9R2ne2tJ1h9oBtUubrqwWoNkGgzxTUCF7f0ugOMst024xogtzcICIwTey26PLBUvgl
         PVmP+XMv0TvEVfrR2io7zHzUa/U0CbB7GH5rxOcoRDxbnsXDnOPQ1AMzMogxeu5YkWyu
         ZwG8KhZWXQZ39PF4sDTIb3lFwHjmJ5aDMsO1gX1E7kVCY/B+UxbQ9wohA7om0FKBtIgt
         CbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684037; x=1795288837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQjf08pQarr4TMcmCq6Pk+sjEXtu6RANKHLEtOhYUik=;
        b=g+ejRxPYrE7gtaKdgI1om9E/TA4WbQgXPJ0wlW74qfJncTaN4BraUR7ahh6Bc7QIfo
         JnFwjQ0bW53H1rv5F9BvAdjE5SKAK7Y4+ZLbjwMwFLk0XQ9AGooa10Ipqsu06MqpqIKR
         Mw9B0kPCMCj0p4hD9W005c+wuvvGfP+OqNO7i0lbTSd2fq75pBU6xD5buvykECPL/RZd
         59xxSCOv4v2+RtzP/A/23JXV/vmyF5aCy04h4O+QmfVI0izmcqXJ8KyiDGqzRmG6E3rQ
         1TfRyRglB6Alebc81hZDUngOifmLjlAP/hfU29uri2TTvaBHn+uiOq/Y4KtduvY+F+0N
         Ibog==
X-Forwarded-Encrypted: i=1; AL+hErFkOqQZa68tlm4JFFgCzOgidYHR6MrMlgIxm4EljNokWeFnnBiFjbGFsYi/Ow/lqoCs2gjA4J5tKZo=@lists.infradead.org
X-Gm-Message-State: APuU4Z+uTYQhOo75sG2RR1t/M6/xoNvlm1UQPu13x8v6YTqev+yCJKEX
	hq2Rg77pRFhHrQiTTC3SnCFz4FniLIKQquKruo76aSQCz+IQtqCEeGDy
X-Gm-Gg: AYBFou0gtGmMKttUuzTcolvWT6SVg826/jJLMAoPmOWuMy869SuFm+jMsrL7p/SnVGv
	Sw1Cl7CaxUn9YT9EyAq6VP5KXPAf+8LZ1NY5Nx2ICMTOfvUI9OEDQzAC89jrU6fD/36zS7yjR3m
	24dYBb5x+q07fmjz8ld8X2brnx3Fv9SUCvSth+JXCTNWgPNaN24ICg3vCZuAp0AmbTc76Id9axo
	0rDlSvx1xc44F2xgVdkOYl+dNHhV2uo5u0iIMXc/z+mHATuWH3vW2Zj8cf9uPBU1TqHkC+1L6lC
	pzJAgLMHlw8T+795RPLHUh8p74HQGqNzdhbQO8xK5U5FRQ8bjPitPoR1znobBKY+HpLMCCIP/7m
	OkTo1JkYldtMM6BL1dTDednNzm8aLizJc/V6B7Q1j0UsgWsLVXeNtJx+Y9xds5J/AKcW6sYXGT3
	9eO4Za0KuZxi13V7T6ZPNy9eEVBp3PkpVIgNZ10psZr6RFkAWR/vRIzmntjN4uZMoMhtYFiDq+G
	p6pjAI9mhsxZnNLMODTugZ+yuk9bf1QtbAyHuJYW0s3LXxqruCB4h9mrCpsiz+KsQmPG2Gg0j6Q
	EBLdL36INBAKE1VssRqUj+pja+SlTbnHTFk=
X-Received: by 2002:a05:6214:3913:b0:91c:50af:f6ad with SMTP id 6a1803df08f44-91f24262a8amr97318066d6.50.1794684037579;
        Sat, 14 Nov 2026 11:20:37 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:37 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 1/3] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Sat, 14 Nov 2026 20:20:29 +0100
Message-ID: <20261114192031.959376-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_112038_912795_51F37EE2 
X-CRM114-Status: GOOD (  12.12  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The ECC page write transfers the page and the spare area from the
controller SRAM, but only the page data is copied there: the conversion
to ->exec_op() dropped the vf610_nfc_write_buf() call that copied
chip->oob_poi. Every written page gets the leftovers of the previous
transfer as its OOB, and OOB data given by the caller is lost.

Copy chip->oob_poi into the SRAM buffer as well. The NAND core fills it
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 6ab3c440eac7..acc9ff282083 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -637,6 +637,8 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
