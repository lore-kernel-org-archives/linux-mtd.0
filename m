Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FFDCCD18E
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJS4DNbClfKV+pEs/hNSdMEe9++HzAHj3s+d0wzRbQ4=; b=ZaUffMWInc9seB
	lga+H3p3cROgpAi5KQAJKN8vNgxgMb1qy4LQsJ/w5+Zfayws00y7a3AJCUutSElsD2qq0raWijFsu
	KmmkH/Te0iH21NpnFZF7nRVAIxZ24+wuDgAMF+CMusenJx6AYQParBKgxIQxUn7ywtW3BgQPqI/Q9
	lbo1Jh4mYif1GdpbYtINYJmaQOJHyt89yhk4YTe69PeVJZ5N8rECe5rrU3Sm9BzzB94vf2IdR8r0j
	YJiCKuO+O6HhYEIhDLPzBfOrN+6RsZTgGBdQQy+0z/4FQQ55AM+noAl2rnrJB+D0khQXZk6SpEuiv
	53hdWBrHSgjUgtFtPBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KyE-0000000DmiM-0FmF;
	Mon, 13 Oct 2025 16:00:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KyC-0000000Dmhi-45gY
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Oct 2025 16:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=; b=VXnuG+uEOGxEzZSu9ZN/+OSsRG
	+8Rjn0l4QH9pbdhuWT3RY334dXUjSTkfQBj7Vy1Dgk/6bVRbpSh7jSITgfEHgW9NkVtnC8s3c3wju
	2aygmlfle2p+XeKa5YyUTwL23pSPvH122Ek0rL8OkSwFIRMl7KoKhqkEHXAsnDtL0RCAnSukO3aBF
	LU/9sv62TL0oh1b7HKw1QWmMhcvdtkadlaF5WjdqM5YxcezDwNbKnB2xJS9Zy+iHRCldf3EeQdPG0
	5qJlXvJioJxggiK7hhFAYvguLDWLXWmjjcNTX33gvwg78XGlYCnJpxosC71iJbeG7lYd08pAjEKh+
	LqKumJsQ==;
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ky7-00000004Rm8-3dKg
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 16:00:18 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-367874aeeacso46544351fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Oct 2025 09:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371211; x=1760976011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+UssLPOno9XWeKCQGJZY3GRGKSjKPPao4Ev4zfFKhM8=;
        b=tVka18ffzrsrYYhr4Rb9pgEDZa3NGA8jlPsO+EL6/xJycqPd+5BwN0zGzPY6eUGL3T
         mI2U0bhvO6Ok0u69cBH1XS0HxLbqmgn/UJVgldFyhbiTzpEFE+0fPYneLyuVSVMSQFVB
         1b6DkI823zlrE2UWy/IEwhct/SHb7hCqY+Ebq6mh8Agf5RMVcFKL23sSrldJd7I/EDZk
         t0EhiMgxl2Lz7ab0Qi7cMtKcrpxXBumhAnZX+6QFF7yClcB4s4TLfuVY9NWrXvauqwYM
         Rrb81+ASr7zaCi8HZw0fwCOX/KyJHLV4aVgxCQqHWPM/JqXrQk1LV0df8I7lNSCJSrC3
         Tr4A==
X-Forwarded-Encrypted: i=1; AJvYcCXMH5rakUxPvTZ8w7eXH7pUDlLo6g/ch4lUVlZaKFDbdqXU8JmIsMWlXi2+IIzRkeGMhtluE2MEYec=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz35lIsVUzQulAX4tDBw/auszjETTO/SNT80/5cpnX/chuBKqod
	hlGvP3B2pGeEPDRtljHkEJziScJzqNz3o8lKC6g7GrRYtWn5RhWwm3VjVvwZ6XVt
X-Gm-Gg: ASbGnctxk8vKHLrLiZiAAbC5zPeAfxyJSWozXHQh6ca2ugy4NgKedDTU2n4ovMC/cQp
	XlzlnThenk0YIqE1B0M2bf0uTixc4o0UJ3OQK8fDBnreYy8eQoL2znk2GpK/9V+YPZy4H2Da+CX
	U53tj0IIyWtWY0UATEGpeVjMiy/bl2Ijl2/SknQunmylh/xoGBepG51yzSMNoxz9PK58DS1xsdj
	Elo9KzEyT3Dtz4u3ro6AxjCrbkOO7MzUcXN1Ap47vAlj8EfptIT8UnE5b5uhuGPdu++iKsDqdvt
	XCEDIsO1zIeLmudr7ZXMDMNc39MBVAzvD1qGZWg5AhLZNs/FPiE7IAfoUpTCEvOw8qQOImB3Dto
	IMwg9u4w329RJ7db2qSNHQLbyOd3elie/G2JZj1Sgpiq4XdX0d0Xh0J/k1DLIV79nFpyfJvRVVg
	==
X-Google-Smtp-Source: AGHT+IF+SJUJOJXLgwb6yMHjVj8+/QeJWQAjmbwaDJZS0hMbw1pU2duFYlN902XLiWLlxtSrz5L8Pw==
X-Received: by 2002:a2e:bc14:0:b0:36e:f1ae:d4bc with SMTP id 38308e7fff4ca-37609d78cd1mr48064541fa.14.1760371210973;
        Mon, 13 Oct 2025 09:00:10 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762eb6a963sm31676211fa.57.2025.10.13.09.00.10
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:00:10 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3612c38b902so39456791fa.2
        for <linux-mtd@lists.infradead.org>; Mon, 13 Oct 2025 09:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8CD7tQgXNvmPwjtJ6PtVKUUMCCrxFLJb0leIyxjE7kHGzLY+9N41johH3ydZHm+759vwzt6NLapg=@lists.infradead.org
X-Received: by 2002:a05:6512:3e0e:b0:55f:71ad:590f with SMTP id
 2adb3069b0e04-5906daea8f6mr6270458e87.53.1760370875744; Mon, 13 Oct 2025
 08:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251013152645.1119308-1-richard.genoud@bootlin.com> <20251013152645.1119308-3-richard.genoud@bootlin.com>
In-Reply-To: <20251013152645.1119308-3-richard.genoud@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 13 Oct 2025 23:54:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
X-Gm-Features: AS18NWDKdIBd1rTcxTVsXd-_vXNa-9kC6YbGbqd54hyWKYs7fg_lZoQPdbhPU9g
Message-ID: <CAGb2v66nojdOfU5oDOCTDummqpcXYuu5665MKJRee2-QfhS36A@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] mtd: rawnand: sunxi: move ECC strenghts in sunxi_nfc_caps
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_170016_265550_033B9AF4 
X-CRM114-Status: UNSURE (   8.99  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTE6MjfigK9QTSBSaWNoYXJkIEdlbm91ZAo8cmljaGFy
ZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSDYvSDYxNiBoYXMgbW9yZSBFQ0Mgc3Ry
ZW5naHRzIHRoYW4gQTEwL0EyMy4KPgo+IE1vdmUgdGhlIEVDQyBzdHJlbmdodHMgYXJyYXkgdG8g
c3VueGlfbmZjX2NhcHMgdG8gbWFrZSBpdCByZWFkeSBmb3IKPiBINi9INjE2IHN1cHBvcnQuCj4K
PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3Vk
IDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkg
PHdlbnNAY3NpZS5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
