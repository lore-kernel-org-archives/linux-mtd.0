Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A23CC6B2D
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/Ew8gB/RYoKgMqRNkO2qtJ60SaX3dKqBoL973bNnAE=; b=VHCTssWadRxmn4
	Akk2yNOhAdBrCpd+3mBv3kCF1KatjIsTcgi9EIe79wiM9EuHpEVVJ8pw+NAt6Lxx/LQi5BuuA/LIB
	nF56oDucx9U9StAliCk4DD23RYO7a/LLJ/v6HyXTLOiVdC7/Z1HII3pIgmBzV4DqD8JSRWpYnYOGf
	nNxJ6HI0HoTiMrQ4stZcgWNN1q7AHvU1YZ9S+1H9GO45fPqzDDM5NruwoQUwaO1VOpOz7iKZ1X81d
	yb2LZu23otOJkrfO7bKHhusG72Ee/+SGcY+YHf3q/yZRHdjU16Qpj6xpS60C8rKOnC+V5ZHp9W0Dx
	6LzWXTqtYnQVilOQBxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMv-0000000GZ4P-3Vy1;
	Thu, 15 Oct 2026 01:34:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMi-0000000GYYC-29et
	for linux-mtd@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=; b=VbtIuhN7QxKEEkBVF4Heq1KF5n
	sZ4Q9RtklQYFBoIfH4Q/fNQlTUQ6JSwv8GAasSDjth8LK8SIlZK9dAh7bPJZv9EwWQoHUP2Eb+u6g
	o9XuRp46yf8L0hUSMSR0QYel+lUaqjG6N2BLBU6bsigkl+6/1anhbFDwkZ+XD6v28ZqZpqt+hlgJ9
	sjcIDxX1Rb2RWblquUQWMlCC2/KS0B2PdjwbkOw50YNvHaqYj4Qat4ixWUhb3staP3PalUyUMr0Jh
	rptmTbetuESZ+G7JeSqP+rO/g+YoRkgZRCDqyvvlzrVR2PXfZIh8XG5yHCDkIaFsnYBsoLWNpMAB1
	VXxZofoQ==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMd-0000000HLZZ-45l6
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:38 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6faddda49e7so1595426eaf.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028074; x=1792632874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=cvCOjdc2UlADouEsj8F+wV1ftYl0HY6dqiVmqeXTwQzzzkJRNfMssIDpDK+4SzOImv
         1cT618E/uMgqUIGZgiB3k8txBXyVB90Drk2iaOW1LDvgB1r9Jb6JxaFCqlZIeEQSZqId
         ewq3R8nE48hhd0hIy6LyGiDBRR0Ja2Hs631uvAzJB8UY0WjZfIprfxuog0ezMyZQfVRR
         oczdJYxvv1+Da1+hMJSsD6EnQSHzQjPvviS1N5WbSLQvRPDf94aAZQrondqVqhgBXFuj
         tkISLhCDCHcXX6qH5zi7bQBP/cXo/mbuNDt0x+JgdVoqxuGVv+6NfmIawu2YWYEemAa+
         bHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028074; x=1792632874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=vYpKmtB5thdrdxl+OkXvgPMhHJxrRwU+RC/CBjlninwu/e+LdFCFj1KvsOP3Vi8j9r
         xM95igENT4PBEoVuzLlEpm9JPPn8njwYducSTXPRW48vs02PUkcU2vcBjJTAQA/IrrcU
         0qOtnD3+7/ERyMY5s2/HNGB+0+wo33k+TX69WyzBFqoGI+J8Lu3hxZJS1pggary2KFM8
         YqHzLYPSRNNN4jnxF1LrITGptXzBY38y0I6eXsji4GIecoGM1fRWnYKhkxHqhLIM9MWz
         EJrtFEqn0dXeGVUzPPEsjd/xm/HbSLrDmtxrz4TmbeDEQPIAHjfjn5R2x0tu0exmXRwu
         +O9w==
X-Forwarded-Encrypted: i=1; AKwUvByJTij7nmaZzSbW6CMqhhgCnHaRws2vtoov6ekGXQ/vYSyke0kG63mcOQ+Moe3/ZoA/D+x2g5KdDEk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLV3VoZd4rtxxQ+8anR/hMx2xTomwOuAezHTAfVcBpuVb7pzO4i
	akN34Gwwz1yEm3hIY8EYg7OT2UKH02PfwFt/spetOyyk3bl98VWLz0j0
X-Gm-Gg: AYBFou2WCZuULy0CTHAnoeFa54Iapi9SXAy3lSctZo4p6J9+1QOLAWdtGZx/L/1LXZV
	NTpsACB6tYBJcwAjbNIhz7xJbkwk3Rmvd/alr1hDOizx30UjT9gvIBEJdX4WvLaX6OFykU4OdgW
	apZJR/5ub7l4WVLZY3tSVLBtfTOOpWk7dhO+UBuvfQFAw/NL5qj5pDzcj9ejSxt2FeHL46QD7PJ
	0fxR+NffZIt0sT+cOK1PTHdhTrLqVzMDZyzpbwEWMjr42WLoSPF3I9UDWlX+QKRvkculaekNqUn
	DdoJjaPMbbsr60if1G0FHMy/aAmwKemjN1/Vfo/35QIpKMxvMfBiBmidj8m39zudqWs3IfRxSqe
	DAdcCA8AEpDoQ/XJaVmcxzm9hculIXy1dBVP03mkK2kN7BLTaoA7p/OHHxhNTbt/+McXCXymTl/
	t6sUdUIqWAREoqlGkZZ4uh0veGF9ZY/Le4OSNFoKCgzGjub4RacaYWudYtcMjt7qOozbeAj7BAd
	M+BAjVcYHtFU+zawMy1X1kaJ0eXni9iuOzKaWh4v+wPwjOLNyK7lPjmN4HA5ziBfzT18UbZF3Xg
	PR4NcR0VUxqkQpgN+oI7DD7DYIIMs7+0b9ZkaT93jl5Msl2K9heIP6SEe+us4qgwubxAcrCMfZs
	AmwWFoAbJqebbFuhTeNf/
X-Received: by 2002:a05:6820:81c6:b0:6de:1071:8b18 with SMTP id 006d021491bc7-6ef107958eamr11840974eaf.75.1792028073754;
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:59 -0600
Subject: [PATCH v7 12/16] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-12-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_023436_480247_730CC2F9 
X-CRM114-Status: GOOD (  15.95  )
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
index 8d83882592de..74fdca27ba10 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1612,7 +1612,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
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
