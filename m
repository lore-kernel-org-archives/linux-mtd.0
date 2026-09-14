Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCF4C88E72
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqAsC/zLdsvUNgCv0mbUFA6QyImxCRJjoCuNQtxN8E=; b=D/meHoHnDaFWvJ
	92pxPjcI+bSxCg/LBnJsh2r1qZS1ZgjJ7FHDntePVHEiInjYRZZLz6KA5A/6sVqU3Vr7OcMz8SpwY
	dGWdQ7gOEH4PaWsca+3/nHC86r4D/9UZr/jBmM0yy2M6/HlJ4w6gdP/evi7J92+LgXjblwFBTKFJi
	UBO1pJOIRjgFIi++dqhMj0SUCD1mDWk9/z9A8vHjnZROm63W4+2wf5E4F0YwnF1xTBdjz3Cw2eV+X
	Yst9lphkceOu76eyaGbH4ekyaF1OXwRQJd+RaMM/NYRmyucTsfFfPrRATOc2/+krizVZxayHeiDyQ
	bHMd6+/d63/G6HgahwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hJd-1LTD;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DxS-00000004h7s-3ByG
	for linux-mtd@bombadil.infradead.org;
	Mon, 14 Sep 2026 21:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=; b=dWNwRvouRhmjcah3QR55hZ6FkE
	tqnFi7KY5DQ7zZyWi5ydpeUyZmYzTB707cHlap3tEdRZdOnCdL9MNgtyDKwCd2PtDndhQspawX67T
	uZfi/NzNndkYQ3KTVsr7gNLoqZ139gpLty95Zd05bfOGIrFyVZgHnggf4vgt47aYxnK2d05i7aTiH
	2HrnZ2/SMT6cDmEX7TFyyXDggNg+nVj5OJSQDRfN9Lr1AqzE6uxa5o46Fhcl2kdie0k/72apS5DWY
	hTo1yz5npUQnM+uComtbngPkpSkoOtb+JR8ZiTDkrWpuhXLNOQl2etaWVV9zCJKJfQRkMBlwkOwEA
	v20IdKRg==;
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DwQ-000000061hL-1pbx
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:11:15 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2ffee6so1024443b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420212; x=1790025012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=IvTatltVOCLMWaO1uZtpfX8PMvc8tg8EGklCzszblo1Kjj1MO8uZa82eq43SVfcGLL
         VnYIS+PY1fy5kHLoZO0Watb6076qYT7Vt0B4MyZ+zsL60pHoZAK/mnp4dHaDcV9huqXS
         jRMKSLQDp1IjKR36tejRBcN92gkmucgQv4NP3x4OPxEmmqojqcjK0IqLzDUtONItSsWl
         1rEKZ5Pg++KWmLgI+4/Qxvvp1PO7nUuu8ou4VhbsgqVrapMwzt5A6D8Uv/OlAW75vIKE
         8jZY5Rzzo1pQOpgZayvYMvE6rZN97S4dF30vzzy2S7fijb+MVFEa45LywyLu83jYx+1h
         jl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420212; x=1790025012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=TDSDSjzYaRUA+kbPER9vjGr67MN9rXkoV7cqoHQ20Kn8SxSM5eku+TSCY1UKJ5iSFI
         byaEL0l3WVIndFRcVRXqrTMQ1dWJ0HCGsfv6ylFLDj9OrP+5gO7FJ3jfQybBKXMicSuI
         FC2I+TJx84csQCik9XLQgpV1pSGtWsKDWq5NwgagVvF4lbf6kO1x7TE1hlXxUJsYgF8U
         dxwrh7ZCQfRwgwbNHiJuph5RFKIXG85aT5cN0kzjmanL6+YHGxvEkHbbrMGGv+JGoFEI
         4y9SMliX+MEnDXndDDD3voCHgs/L65sAtXdD1fTBpTzrFMDLKmMf9JBNePebKD084W5/
         6bXQ==
X-Gm-Message-State: AFuF++mPkG8pmnij3LIrgymJl2xto0eruTI3qFVizG4fX+EZ4rTTCfdO
	4yUBCVlm6HVf2JuIlbm0yRwNrE43cRUJcfn20vC/geUgX0Crs/aOgzHQ
X-Gm-Gg: AYBFou3vwYWGeb6Pf2iYJvPGQauPKYsYoEDfoUvE1Vxzeod0ymOo3K9vz7oi6nT4cMx
	pYAJnptAoJ2QVsag82B/bNmW0wFawvTOwzyknHg0AXb+9vnJInTzyn+aIHnlkZ5kLjBQP3ARqUC
	0YnZh6nlwx72Z0CSB5qhzchycYZrZlMtLjj3RRMjkD+BUN+/wiJzjYODRoCd5bxh8OumclXXb+R
	yRbZjL2HzsdIYPkiTf8SjqSWo9a0h2uhqz/HaVWEy0uljS2Jgk585W+oWCy3qH6zfjRIhc3nPSF
	eGIET3p8SqUKIdHa5U3RBOTlNaqbbFPmEh32Mi61wCU2kej9PjDLfa6eVT2/+kYlL6Oz3CoMf/n
	XMfwdnakQmWS5FDfkMdp+ntwq1GFh0jKlGZkc/vRw8L6obGh/yoWGtdBb96xR46yfjEYnlmmL10
	9MnLN/4x3hSBjCeeZt3CTNYJEgGnJnXXeFLeFOVc5griBW6s+wP02BGENXmpXDHYHaIJcskUBwN
	BrsdEyO0IgaDUWRMx6o6wRcq1507/XmuzDbR3MQhLI6oE+LfZGDIfTcklw0RijSENl2iD+BWwUC
	0qTETws0fNPXGxG7vzDCDnqIHsikrgBw6KvehKDlUUIbHc+s7LkR5v8K2ftFYj7LifiLyvwm+Q9
	4GjKf7eephyHExuhd1BNf9kocxB7R
X-Received: by 2002:a05:6820:1609:b0:6b9:4557:2722 with SMTP id 006d021491bc7-6c53f252fa7mr2388952eaf.3.1789420211667;
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:58 -0600
Subject: [PATCH v6 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-12-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_221026_066078_6C71C47D 
X-CRM114-Status: GOOD (  12.26  )
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

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
