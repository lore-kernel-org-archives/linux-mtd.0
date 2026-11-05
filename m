Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FFA606A32C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XK4fUkV5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c+WVPKii;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wx5f4ulu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ak7FPWOlkyZBsWScc7IkUOmf2MBRW0qLuLPINhrdEYE=; b=XK4fUkV5eBerer8pHh4inPV3rG
	wuNe/XqxDLYiqDPkdSFYpAFMKStN18ENibr3eS9j09NeAEHgNj5O9bCOF301gfEvcrmoyBeiPAW3U
	vvxuDqKj29nFOiX8qSMuqJr79R/rhtLYPjBDCiMRs9BX+sH8OIqaaD6Mb77OpRw8Yo6a4jgcmYruN
	pHPYQQTYV0tmjL+ljDdt4V7vH3cHhoTmjRF3U70am1u/pR3ku74ELHJdOYenK6kBAIndnQd8z221y
	yvo7dIAEkYEnE6RX576TWcPIVZ8Xa9eiDjGuMiGrxXpiZ5QffK1NbeSCMEWQVQK7UxWDSuk5DAH3R
	VKcVcrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fQ-0000000AExv-21wH;
	Thu, 05 Nov 2026 18:58:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d2-0000000ADXE-1hy4
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=; b=c+WVPKiilTTqCSyPW/8roCcL05
	YNx5XyVt48WrHPE6CR+/QmLNqrpO7LO/096oNbBshz8vlnuhDncVpLaI8/OmF2Jpqxfew1jRz4SQH
	wBtE4aQ8ggJ3CWMPZmyHo1vOwXgqCw+MwKP1j5iYKhkPxj5tH+2m9Qj3tWljT8dYS2UZ5noN2SI/2
	tApfnQvyBMWEtFPCUGl9N4EbYtmf4jmb6Zod6wsudZS1q1IouBXbVzFIqATEkkt9P54NOweDTRfIC
	8bVFE7wBhgzFO3YsAb58o2bpc0Lzn9hAV8Y/iiptxeGxYA3bzH0APkfVoCuLaUQFnBVh7NPDiE9fV
	QxBMLXjQ==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cz-00000003R3V-39CX
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:03 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b1afdf5196so932884eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904960; x=1794509760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=wx5f4uluR5D6MegIA3iZWUgPeQ41xvWlnMB2loJ7Z5NVnOBac7+XfoS/DZQgeug3ID
         T6Y4Hv1Kx1LePoNIPMoRAEzraNOz9uQONmvD6MdqoC1t6h0j4GjVXOyWFaDsWnQkKa7P
         utWMOtQLhUKA6VN3zivt2JRaBMjBeYuQ0L6rDSK2IQMikn3ADLsynpLIbLSuSOv/o8U5
         IpmS5jijoYeBsEPtVKMmT1GLBwXlW+V3d+5z26mAMI0V8hZsXxLjDZMNJ6rJkPIR7Gla
         byEAileb6MEsaacL8FYh1XS25wH2vjUPIbw5+e5BOOMIcS40jDEMP61/WoNGjG0y1yKg
         ECKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904960; x=1794509760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=uHsDJDoYZxjtUdQItvcd5c72RWZZpQc+pUA59DPP6c4JuoTQP4Sm5wowoblRoAh/cY
         YyHpvxmRywLHn0C5XvWbANz0qOw3V+JW6XdMV6fYNvJvLWVuQLREJ/HkYKCu8KAkO3US
         oOj8NTH1/ZZ3TqQpOz/eBwo8nefQNfumyD+ItbUNebepg/25xUoezF/uTeVtUMIXCHl9
         YCUYbI39hiyTKkAsMf13Xx4Th91w4UtFRreSMhx4mLFcOgk5dWPKDmDkHlt6EpT8m7Xk
         6c2oE+zeYV9aUkygrybbuGdZ9DyhqyAJc4cq98ocLJgvU+LUXd10eSIu9EvbcnR6Cp+c
         h6Bg==
X-Forwarded-Encrypted: i=1; AKwUvBypUNFsHQOIzA8lf7xwlkrPsLpmqGFNpueXSOucmUS2rNAp7YZtmrq3Li/25eAVyLPki6vwOlAF7/c=@lists.infradead.org
X-Gm-Message-State: APuU4Z8cLhoncH5zFRH+ccWISkG867b0NDqTuKeKxpkkJTChsL0EE13P
	hTsGu0Vbse3Imic6yjbcLfihpaKpU/1aFsq9Dum3jE1dlk+xtbxvfszu
X-Gm-Gg: AYBFou0JGb5Lya29VV7b9V7oeSTpt+3+gDGEBAvBJWdtWdoasG1ma1EDldH00XEaXNq
	JdrZe6yiO0GnoVpzsa1lGGkhgLf7DGPoWP8zXgL8gcVq3WkvAF8ck81SNfHjcy1iGrZb2cRCEgI
	Vsg2e1T7yWBcpSTzX8vXJ3fWnLy56U4PvhnDadtMXOj0tcaWQl5yRY8OrczIZMI8TfO835TBqxm
	UlthTPM0pYp+Ag+EXJQT4CghNYr4qW/pNcuaOglKzNv9J4SsakaC7pyQxYoNYrbVDC3faCyy5LX
	0iWJsfHNdXUV5bZZ+nVlrvf1NnC+o/rFiZr2+7x3NY+mQeaM0npgjXUP9yj0v4HqI67zfw+6g5D
	uLYfSCiAW8PFMwUglsT14EN+9voAhn66Sb4E9NUTQJuXvySeIknTt0SyonFkJJSekdskVI0rO+N
	+wqcKVCNMtPmeGhHe0hTlDp/Kk6nRICIiHZfZ2zvGJ+lC3PLmfuwinhoiSux5rVNfwBozpKrwhK
	1rMlg7mkiMtUs59EQ5F//So/74a2kGrBQ4vKyuRhZVmqlgLTzM3RjZCc6Qbhiw4fS0N7vi9dhTd
	2PuahYk9ODk7KmzoxrxXuQDN/6GYWxjcOmMLBI1gGUa01Knc3DRrS0XDKRptBoNsix3uu+gtr9I
	RTk4JrrjsarCKDJLYRmGVc7qWskwW7ZdgN2xaBu/rR6sh7LDuzvMWbeFLxNVMueXL49HzxXnq4L
	oYK2AwS6wyjB3SiLIcKvP+YBvvCFDZWULus4oflcVUGfEwr46kloI9
X-Received: by 2002:a05:6820:160f:b0:70b:9b1f:e8a2 with SMTP id 006d021491bc7-716e73de95bmr322359eaf.3.1793904960035;
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:34 -0700
Subject: [PATCH v10 18/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-18-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185601_678018_5416DF6D 
X-CRM114-Status: GOOD (  13.82  )
X-Spam-Score: 0.1 (/)
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

sunxi_nand_chips_init() scans every child of the controller node,
including those marked disabled or reserved. Neither the chip setup nor
the NAND scan path checks availability, so these children are still
probed and registered. If an unavailable child describes an absent chip,
its scan failure can also prevent the other chips from being used.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 636a04f49418..3de9ed6795fe 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2771,7 +2771,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
