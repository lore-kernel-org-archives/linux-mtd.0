Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB86CA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI/7snbeLWw3mP5ts/cfLlH5KkgiRIy83M0J0Esf89E=; b=HhGPXk0E0uTOcC
	Lx+SWguqEU5z8ZaWxha/PYx5dk0Y0gWjpAnHayFgkX6towo09gHgIw+2D9OlkGBmdV3Tb9nCVuqsm
	fKqBDT9yXhuse92PZUxUdjm2JrI2VnKmA5lgeUP40/LQ+3i74SikY15IhOel4gS/ytguCsUVeHHEn
	YJeU58dVa9ZMg/k3MO9SnSO3uElBU9y034/bv48f+jXFhy+qTDVuixJUPyRk7BMoREn4JEoXmOhZ7
	nvv5BtwaBP3S59mESIIgbmOkct/SYDRCVV/ToyyiuK8vJhBf7muOlbzMdnU5lzECQwhXaVIetbHqD
	L1vS6KP11o5FW2waHp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszSl-0000000BVcQ-21EA;
	Mon, 01 Sep 2025 08:00:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyvs-0000000BQvh-0OAN;
	Mon, 01 Sep 2025 07:26:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF1ADC653FA;
	Mon,  1 Sep 2025 07:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DB7B60699;
	Mon,  1 Sep 2025 07:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 291E41C22DC76;
	Mon,  1 Sep 2025 09:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756711582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ImQL93cWU9txQnD2Z/VJCpp3Mddb+X9LqtZaBzfGqPs=;
	b=218vl8jrV5nS1OF9XPtgqctOBR4E5Wt9W4UG6OxZHv7VtXkQRBmbUVPaVY/3b1cPBl7ehQ
	J7kK4SYpusaEVXga/qqSB0wfgkzV9Xt8jKrBzVRabErX/7SV2YBYZ2q8FAQAJ1EigBut1s
	luu06JS21cW3gu2DjeH9Jet88Qx3zB/QM7V+5dZ6hNn1z9Do6W0Yo8wZ+ClFPoglbkXT/Q
	ii9Sl8lbZqdedK97AHAk6UzFxuoZPlr5m9YkYhiiBZ7lix/nt9QHMSrAohu3Sb+yskUiXh
	F2EpllC44LqrZxMO0GAq6p3Sc0xKPaXuSnNd4s7Rq7Zgg7yw6UbWFjtYS6PmLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,
  Russell King <linux@armlinux.org.uk>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
	(Krzysztof Kozlowski's message of "Sat, 30 Aug 2025 19:01:12 +0200")
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
	<20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 01 Sep 2025 09:26:01 +0200
Message-ID: <87qzwqr5va.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_002628_647740_701CAF13 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gS3J6eXN6dG9mLAoKT24gMzAvMDgvMjAyNSBhdCAxOTowMToxMiArMDIsIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE1U
RF9OQU5EX1MzQzI0MTAgZHJpdmVyIHdhcyByZW1vdmVkIGZyb20gdGhlIGtlcm5lbCwgc28gY2xl
YW51cAo+IGRlZmNvbmZpZyBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+Cj4gLS0tCj4KPiBJIHdp
bGwgdGFrZSBpdCB2aWEgU2Ftc3VuZyBTb0MuCgpPaywgSSdsbCB0YWtlIHRoZSBvdGhlciBwYXRj
aGVzIHRocm91Z2ggbXRkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
