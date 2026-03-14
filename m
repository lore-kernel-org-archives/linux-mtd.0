Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5BD105F79E
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2026 08:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKmJM78unasP2WwIxoIUWJ3djAdB787rt5jTPXFyTBE=; b=eA/EW6tyOGq3GS
	wBG+mIKociJtV9VfpMd0Xx6YPxqdtYwiGvyZPZp9lJQus1i1fyfqv4nfDqUQnDYUH6ra7m5P7GPDC
	DON76PAzHdbZSXYNoktDe/U2eyAHpNRb6p9mCMcPLfxoZZ7wA2StJSoe6jJl5vHmOGBW2t+iM2+pn
	+119qlPg8/4I5WX6Fl6oiWjgFc5WGW3iZ4Ccu/ZbTLkz8hMoIoMwbx4TXjCfOis9Q81mxHilQS3sf
	1n2VskITDNVrilDkH8VlGvLzu6yLnzeFN+Xm193uSu0ASVb5MgX5kSoIiZFx4wgV4oOGVSaqloPdv
	X6OoAFsIxygBr4Z5r6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0T-00000001buI-3ETf;
	Sat, 14 Mar 2026 08:05:57 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1K0R-00000001bts-1ZnT
	for linux-mtd@lists.infradead.org;
	Sat, 14 Mar 2026 08:05:56 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a126b79512so2778578e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 14 Mar 2026 01:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475552; x=1774080352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3EWWpaovkuLWLz+sEJkJgXI3eScPJ1f3CVwzfTX0zg=;
        b=E18EIYs8xr7ZcSrt+UFVeRk70IZsWsIA8fMcImQkz5sv1mSLGhnD2XzIV2eMNjGZsr
         TvYDSSrjAnxCL2Akn6TsY7Lz87Eb4xBucQUSEGm6bNtQ6ecFmnWF5M5016XPn6YsM3v5
         +AcJEELU7LxwqRcKJYF7AIxYF1+TWameN/1jEkEskozEU7xCuLaqVSfXYfbL8rs3xa2w
         t8M7zDJIi7cikXscdNQW31Lmg9VAI6wqGP9sHWPeulw/BZRK1Kg7xVHIeiLdNsoShnQH
         mKeaPXvxznfAnygn6pSjEKroROC2ab3wz+Yx4VblqjF2qmpz58XE2Zc29r9pLh8kbvCg
         EbFw==
X-Forwarded-Encrypted: i=1; AJvYcCX+AbJzavZmNsM78cN5ZMVHriB+8MJHYZnvvX0CTRSplBk8/rCBckJNJPZjB80IVgTTChXUOL0Majk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWqMP9WdkeszXR2Xjy+UH2vrQ8J731hvxJKNW9QkDnibFXz59R
	GyTAOpzXIJhJf7cfgf0uPWYUt3amArzoKB+IZdh26XLhlG498qBeSZAdGXDgbb7x
X-Gm-Gg: ATEYQzzq1gF5WZ/i4KjuVFXeP/cGH5FifVKIdmHnbnnfdt855emk+x1KDkEDSbcgTZ9
	i4aKJqx0+HvJBR1nOX89OQ6QMsBh/h0N9ry3H1nXxs1GvsjZ+FRCuzWSdaoQ+J8CVbSZBGpx3jY
	EnUKxp/yEmMtfDTg5ni+Ep4OG8x8qufcwTg0+jjqCdXcGZxNmlztiGMXzq09arTn9XhdSGqXTkT
	IGs5WwUAqlFsfiM+BRu2/gO6UIlhHpidntX7SVYBVrSAPETnZSn2iGALaXYn5Y2fN5vNX57D9uL
	F2naiHMjJ0KSAWMbQdIWmkOWeWWnv0YdtsyTVHWh8b4ziaSv/EK05MrP+XHsa+DMur1hptpvzQ1
	ggLUGQOcLuYojbI7GJ3VX4J24A7pLiLr5hnVV9L+x0rVWDSGoHA8s5XVi6ZwbkPjCoqOoKjwcRu
	+MWkZeHzhUSnK9L4MUlRrL92gxUTuN37hwGymp/mmFtFVmDNlxRrjp5Jo=
X-Received: by 2002:a05:6512:1451:20b0:5a1:44b6:51fc with SMTP id 2adb3069b0e04-5a162afb679mr1690334e87.21.1773475552258;
        Sat, 14 Mar 2026 01:05:52 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33da9sm2015345e87.19.2026.03.14.01.05.50
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 01:05:51 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so23074141fa.0
        for <linux-mtd@lists.infradead.org>; Sat, 14 Mar 2026 01:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQPTtlkKBsQ4Sx7yLRIAg+s3EIcAKrEajwewcbFerHIKjW8Xv5jEFNb6h5mC+BE+Tny4uWEpGG/iA=@lists.infradead.org
X-Received: by 2002:a2e:be87:0:b0:38a:6acb:eb13 with SMTP id
 38308e7fff4ca-38a8969872fmr19535261fa.11.1773475550494; Sat, 14 Mar 2026
 01:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260305100137.2558423-1-richard.genoud@bootlin.com> <20260305100137.2558423-2-richard.genoud@bootlin.com>
In-Reply-To: <20260305100137.2558423-2-richard.genoud@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 14 Mar 2026 16:05:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
X-Gm-Features: AaiRm50SXV4USJv7ufJ5S1CHMI-l-YGJ1ASLNXxXfC-UNKPRkpq29G52tlurn4k
Message-ID: <CAGb2v64DAuSEoFKTcdUeBjj7D8b5BiMbzo+M1xnx_A7fia5rgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>, 
	Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_010555_658157_00A35FEC 
X-CRM114-Status: UNSURE (   8.04  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCA2OjAy4oCvUE0gUmljaGFyZCBHZW5vdWQKPHJpY2hhcmQu
Z2Vub3VkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFRoZSBhdmFpbGFibGUgbGVuZ3RoIGlzIHJl
YWxseSBVU0VSX0RBVEFfTEVOIC0gMiBpbnN0ZWFkIG9mIGp1c3QgMiAodGhlCj4gdXNlciBkYXRh
IGxlbmd0aCBtaW51cyB0aGUgQkJNIGxlbmd0aCkKPiBVU0VSX0RBVEFfTEVOIGJlaW5nIDQsIHRo
YXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgbm93LCBidXQgaWYKPiBVU0VSX0RBVEFfTEVOIGNo
YW5nZXMsIGl0IHdpbGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFy
ZC5nZW5vdWRAYm9vdGxpbi5jb20+CgpSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtl
cm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
