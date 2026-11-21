Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A8606A68F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G/NUhi9J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmWemP69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tyKYNxQ4/MWFnvz8dax892Gy33NlDTr/3Yve45Fdxgg=; b=G/NUhi9JaQUFgxhXv0cNlfIMdP
	noFpqvpcaC61d/PKeToiiSi1FrgVUE3dDOGzZHEJzHxjwxW+XqNg+ZQwd/gpZQM2qXg/W0A4pz5uk
	ogwyO+KXO4NCP7meSmtCup348PMyMS2iaQ5LJUFsR19ialmjpVUp28K801RSXHv8rQLLPk7LWd1Wi
	y8EGasIQ4NWj7eUI7Fy8io+itmbnVWd+aAvDP67YR/lPmx58iaeaVHbyYXauoivX2Jcq3Tbpb1T08
	rxx4YrrzGikgKP5FCwy6y2qJB789jGs2cPmWfqQbbIiyqUUXwh1YEGq9gXQUeFrpCEhGYfAxjzHnB
	APdOPLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZeR-0000000GaKz-0kYO;
	Sat, 21 Nov 2026 01:12:23 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdG-0000000GZIY-36ww
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:18 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-862b98b2e47so603943a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223470; x=1795828270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=JmWemP697EYReM+wYnx1KTsefIX/dHAcoUF026WGNCigp83ILzSyK3zluiIUUHeXrV
         TnwWbvFkqA3AkeLaNUHZBM2UNOO0064gkB3hqchw1QtGEnJ7TLZgr/b4GgLRYwlzQ2Td
         qA+inqvss5BNRgb8SI28udFDKKxOqHvZubqVxmFLUf7iGEWrsU91Mn0akc7Ywavk4nQQ
         swn1GzYumMb8PST8gJGgSlFplj074v7CJVZ01w1VGF/FRgJl1CGumRlZ8ktUvuk4GFLX
         ZiMLpA6UMkQ4yucyoTscHMQWvskvtdSr+hyau5hobuXs1otGeUWXV1q1wtO/VtBh/AEJ
         hboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223470; x=1795828270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T83jSZtlzKtrASqdJI86cD7q3EhrQGMc7SvJoDp9Zl0=;
        b=fL76U3vT+3mmY0Jy61+t+Jsb4pCIITEkdmOMOVTWlWNwWGN5RnPFTsNhs5+XAvvq0G
         qdXW9MVTxnnATfhisPl9HWsmkj/4TvzgJesSLLoh2Eixo96qlMThc74xn9jAM1hRSqiE
         3r+otcavLnJTI89RvJubpOTnFnFg3Tu2xyR0hNJIP7UpkWYW6XSt+IhNJEbl1qErtdBq
         ZSuIwWEKNxT5In/SVXIJavON5kWXpAJ3MZToNMnnKnDvuYzZ5gmw3Pbn7zecQqVDe8g1
         iwt0h+ZKaZ2Jv/36kGD2GDQGqMS2Ub9OydtqgyNbNSYlTou9GRoQTf6dqWh2+Cad80lx
         TpYw==
X-Forwarded-Encrypted: i=1; AL+hErGIf3yvXIGSsluqPDViBYzeEq2vtCtAwOeEXk9ulOzwN781K3dQjpyedtzfd1Ly0Uate7xrwKDXr84=@lists.infradead.org
X-Gm-Message-State: APuU4Z+7dgGqfBRLZqktngSzNSbunhGVgToabGw6crUKmgMu2CzFGA0N
	0H+5/4e56BpJ1OYGLNWLIH9qQ+qPi66tGQ0kIJYIA2XJRq+iU9REVj8y
X-Gm-Gg: AYBFou0t8065Wiu5OhriEbV9biGMsnO9hqOCRsje1/J4TwXNZqj3+pPyjuk7ym+yM2q
	xbnKsLgckQK1ozu6tTFOTPabDxq8ZzI1EJvzR+3+xB0Ywufez1R5WFVwJY3/exlKbjBFUZd78of
	RxP5wWhgezwatsAzIXSsYe3Gl38o8e5scLf7hLkdHRvqjgc7Lzt5eI5hm1L6+LE/G5IyKEcsc/9
	MEG5N3feJRDDGi4Ask5pGooDi5XnZHIXR+Ol+q7e3VrJueyjg4SLhM1erTAidQG4zH3QV/oSFxH
	8/T/XR5/hVIk+25DsdggdhJdIceKUEWgwIiYUnFWywsDPc5GMgZdmU3kMlUMj1pcYxFmek4mNcp
	W+7RDbHdUooMTJR13GTySNZW2WiTuq3NfoBTvqC0jRVZ35aGsN00kMDXISyvJLrbmCNPFincO5o
	fUKS4/giCL7Cc9sJ6RqtP/47Zwzz8/f86mIMZzCBlG5KLhn8MMxaJA8bh3s02r3l7pWA0Rb1FKN
	oM6DWRmx3JbV4ro9JXDjsb9VurEvgaaPHYaRW4TrmhCGAtw5d7zVhj8Q5tXxWszPQoc4vzWhtE4
	9ZNf8McnT+ZEWDOArD9zgqIDrVewQ8skoDEDcGXNprnmGpFRvk6lAPgb4VZgDC9UPoWfHZa3d8r
	Ag9e/4YXWN/Ylo/X7SfSymo3AUVgjcLI3s52Lp/qNha7IK4xztWemwdNi+sbnliS9feGAwvLSX2
	ODg96fDXe94IYpDhmRo2wCfhhjNPmdmd3GDoMLOAQwSPR20C16YmRL
X-Received: by 2002:a05:6808:19a7:b0:55c:844:98b3 with SMTP id 5614622812f47-57a0bb53de5mr6320056b6e.50.1795223469671;
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:33 -0700
Subject: [PATCH v11 10/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-10-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171110_820333_7CEC5C2B 
X-CRM114-Status: GOOD (  15.17  )
X-Spam-Score: -1.9 (-)
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A DMA read with scrambling enabled can report success but return zeros
for an all-ones ECC step, or all ones for an all-zero step. Requested
OOB can also be filled with the wrong pattern.

The controller reports a pattern-found bit and a pattern-ID bit for
each hardware slot. The driver tests the current slot's pattern-found
bit but uses slot zero's ID to choose between zero and 0xff. PIO only
uses slot zero. DMA can report several slots in one transfer, and
their patterns need not match.

Use the pattern-ID bit for the same slot as the pattern-found bit.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 76f60fde7a86..43c0796d953a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1086,7 +1086,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
