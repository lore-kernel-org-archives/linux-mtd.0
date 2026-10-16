Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7787CCA46D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twCJ49xNhrDw7Mx4GJaLLOOvOtXEHhykAwIhJF/B8gE=; b=J9kY1RBhw/HRAL
	U5++hJ1efAzZYMJK7efhXBKsMjxWQ4Dc0Fa/xgFSYjdpL7u51TdnW12jipXwAapGUjhYvppPLQF7z
	oaPkMmQzJczMyvkXmWGq0XFHKn/vyQpa53oW+nsIpKRHSrVVd/YMrd6qH1rcEzksV46lyi8KTDe8P
	ey/KeX/iBghiRcKnFvEov2+4MklNEV0DcwhPHW+X3pQ4AGX6/PmB5oikzyVcnClMeKLAe+Ebq0VHY
	Wb0/fhv+LZtKyGnwL0KtuQitxs23SLlQHYx7t7GBoYOv099F4//1c+oB8gyTX+WS1Uco+j2U9Uwyn
	n2KRO2YMHs8Ne/MJEriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtS-00000001t4k-2qmy;
	Fri, 16 Oct 2026 03:46:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtH-00000001sh8-34b5
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=; b=N91SbyOM8T7BrqcPXCNcpWYQV6
	9ap3RlfYtySv6pBgTZ7F8I5evFQAVVPntgJ/cZ/K7LwwLZUs9q5Bu9coWQ/qYt/wjLsJfxOkDe8lP
	VVKIkg356gLhoxSd++2zblAkgRs/mILT/Ff0zzctW5wMdYRkhOK53zDojMcb1/dndxoow0fC/nPNg
	grXCwBTiUzmE/RygoyGUxLua8tyQkAnfwn0bS5sMqmLrPsEBxsUgK6JcUp7DHNGp+8vNI/R77ppkC
	hdAWsXUAetBBgq7TY1DxY4KNkSBAqaE59ZvcyOcDSqxhVJ5L1OnhvYDmzs5D674lXZQevjyifF96o
	pBIFhJNQ==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtD-00000001486-3fDC
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:54 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-823545ce223so2086474a34.2
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122350; x=1792727150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=Cj4bZ1O6gnQaJYDhc6O3x7FA8qzF2e+OEQm7kaB+xi16pYS/G57NKaoMLpyWB0WYhW
         cbgiYPX/1pspuHmTeVwhQv/+IlD8I67CU7GBrq+BHZuqca3NYZm1SV+O4dty9jXv5VSi
         yZs3cRJ/kq6xmjmXkfrcMLtguwq36wOkkFkc48X01M1P6jdzvuYv98W3TpcUIy/MrDHN
         LMUvel2eF36Nh73KDWqsfFxOpg58TUS9I41uHFR9dqyAiWH4gLDgcXSGQHr+oVRPH8v1
         iVZE0d8u+Sge3wPO6ZV9oIeTxB4LJrb+DdtnrJZuikSCpS79+C/38jzEVWcqVFoTfzMc
         E2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122350; x=1792727150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=H8OlCEoDMDIaxEkTbvDlGw0bc/gzsGiIZ4b+Qpm19kZrKijStTa+GroO2+qQHJcpZM
         07lerMJmcSPZSwN8QwyIh0n2ZphKhrsFH203KooiE+MydNxsfTB7ey2XHw5Ww0bCskQ1
         oaed6tbGdqVMMJ8S3ZsOXmsg4DkcIIzz2meyHvbuU3S0aF8ZiM6HTmYLEmEeCfKqZfW+
         p6sGAJ7VHl+lKB1Seb6KzwRtaWA6z4BlvINvUgJPiIOVvEluVUhpzixRBoR6WmKMcmHD
         OPMZoEVvUpUhvJVcn+IaAtsC0CFN3srqgC9RE0ncf5tq8F1JMkfy0VmfpLitlUWrsvPt
         2gZg==
X-Forwarded-Encrypted: i=1; AKwUvByTyhPmbCTeKswbeMjSbudkjU9POn0v+me/sTx0RwZl9VJDjhFP9e2at65yzO2ayOWF5Sb6CEeMthM=@lists.infradead.org
X-Gm-Message-State: AFq9FYJAhudGP3LzpY9j+GrnNf71sTNRulopNE0ZZM06rR3trBsvYS9N
	DPpTr+D+riz23LAk3Q723MnS6Roahow5BXEVO/7VyjyBUBEalRg8y+VJ
X-Gm-Gg: AYBFou0gvIDL/YTy3aR1xaq+WOiJNyhKUbNoTecWugCdQ7CVLgIhSC/mM3pap9I2fXM
	oKKNy4p43aqUH/byj8ibbR3/E5Z+SM86cEa+ysKazb2SvDJLX9nOpOTnNb1DX5k294T26o1C3LF
	m7HELdWMlMuKQany4fKgGqnq/FZMoNp0A+8ZZgX4uK6/SyRSKorb9x45/LlBveCw4s8kCVdmiHl
	gTEKntIWFa8LMXiikwnx7ltOC+lRA5HdcN+2JtkPzNL0BCoig+vd3uBHmV8y6NdRJVJH7WCMgLp
	/BgiaHtdp2gV7ZR19gDMx7+1TfXgrZobL5tXnrdliyzt5un+GxE1E2b5gRUD06TLD9qGoC8paZx
	NR+7nVpbAB4nf/2AG5gaSipUepSuIPQrCYrz76nHJwvkftCgS3Vt62AppQ04BDUeYd7iwDMxCv8
	rAv9pOjF8yRKGuvHzLi2KmcI0H7KkwYSd3w1JFbh+h9Xp57Gxn/awKmdsVoGdy5szhbWQjasn0j
	YeS8i/Euh+TpPNmwcvLXoyZv86CUdHlgbmhO91aRf0nIquuhMNP/XxANef5FBe2f+F7tc2h+yE5
	K2w+0H7W61aoAp+VsBNrj9MneNcXiUg1gmW+Dpo05j4eHtMLWuRTfR10ak1/+Yy1eNXircxRQ+2
	bZHOwXLQtEz1p5vjEeuq8dg==
X-Received: by 2002:a05:6830:640d:b0:804:ca33:4aff with SMTP id 46e09a7af769-83094e783f6mr19887903a34.9.1792122350229;
        Thu, 15 Oct 2026 20:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:28 -0600
Subject: [PATCH v8 13/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-13-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044552_374404_2B9558F0 
X-CRM114-Status: GOOD (  15.87  )
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 105374e93b37..dfb2a64c6b50 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1620,7 +1620,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
