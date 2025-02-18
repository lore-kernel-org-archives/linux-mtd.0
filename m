Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF50AC021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ojw4Ddx5+9GbRDKuYgfkJ68R0fc4qqxt0QwwD7vMGRw=; b=Jw/9LMsH8POEkr
	pm1EPaYJTNswyDKBES/Nnbd+qi38HHy2lgwuFy1syb5WQ0xYl6anbUpMFeAZTpK1F5pbK0OIuFf3g
	0k/dVgWWsF9rTqGN/sjakXH/8zgdbWc5FdWB48jf5uhsPw/GBqq6lOuhymtO3kpLQUInrpsSDgMba
	OG65JTqP/MR7F51GC5fHt6O8JlIEEsqaB9phsSXl1cvyJMoc90Pl1zTnS3XKpv3xTrUVU2U3Xi2X6
	NDc+uf6EcbarkqTV+Z3PGoOCGbBx9NVjClQla6kTzhFHTb/7Y5BFUj1ht2oGnfgL9lx3sUkIcaYsE
	bBaIo4OPxYWKvcr6DlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVes-0000000A5WW-2Fm8;
	Tue, 18 Feb 2025 22:01:38 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVeI-0000000A5Rp-3aXT
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 22:01:07 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54626a71b40so1979715e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 14:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739916060; x=1740520860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzLDOcX5UfZG9mHlbWI51BUQCiUENabdtuYdnLZAXzU=;
        b=ICRp4QhDDtQ1x4+tMVGAh4peZO+CO7OzVT2iQSztd2MDgXBBfSyPlCvs9zXU30uy0E
         mugSWuXnq3wX+lleS9KVc1Vhi9nohFjWIQwAIJsJ8dlCyMSrG5AtMTHTymSDccEKpVLc
         XIlcYw1UKjYVEVdjgCP3nQyENM0DaDFhdEaZmfPrq4T/VVoZvzjwNRcAKITqqGbIJ/s9
         1twArhqiY1SsODAvAabQ8QZWFP0yngUXzOvMz6ezRaVfTiaKNzRWxySBY1Okq3IvFy4h
         e6slfocb7CO8iKE4iPBT3x8lA5ipn3k/7nI24+9mosLRKEj8B+wdl1/RHJJ9Dj6dFQW+
         IrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739916060; x=1740520860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzLDOcX5UfZG9mHlbWI51BUQCiUENabdtuYdnLZAXzU=;
        b=YvcVaU7on0whYD1fDnp9rvwDv2wQnVM0lDeTXI8J+L2K7sBXU1KDBYljTKoRLaOxk+
         zFSKdq+BgYBjVAeqqjvzHnQ/79E+/joGL2HmHHDSWVN1UeOc1H+haIbFNJd42B7g68dr
         9e2bzlTRYuNo2WuFsmY2uoFuItwXpF3irUmGYgVSXsgPDD2ke8LVRK1ngGYOS04KPQF2
         M4XCFqgo/xTQ4CA29hyTcKPnqhFeobyPu2SUMawWFlBM3S4BQFbqo6wRg5S9aTcKCFfS
         ErI14QDJaARwH3M1puSgvKkOgmCvNWFMsiH1yoEAQslVY0QT/a6474Az4rJUR08WKeTZ
         PZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrUgP0B1cdreVSg+GRtkmYlGeg7OVj97JVEV/hg1RWbg+EAGGahvNN/PSmclSSefHsddYukLiMZbI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5EV552SOnmQ7ee9vOjL7vpKa5nP0WHfWCzmR6bxJ4lX6LYQKj
	Z143GoBuwy2Wm+3D1t3ua53aO97XGpA84YueCb4reYleYdhe9+vYh0yD6t98SEr9JLhDRx/wXJW
	ZR0AkENkDcMuMDlKP1ZI1lUmKxkqtNgVB
X-Gm-Gg: ASbGncumCSE8LPvp9dTGbL6o64nFM4W0XVRknjSNQdOgYr4CaxUgayug47QUl7HvzPU
	YVw1GFDMzTVZUJkHuejTdGSmydgjOBbmroaiEgfpwI2D0kBbrKA55UcrJFOqjUGHGHW+pvu3rsN
	mHPB+0JCezjEpoqPlZPU09yliQ8jkV
X-Google-Smtp-Source: AGHT+IFn1Mdn3fNSf5Cl/tN4AZyRuDpSVSOitg6yY9UPpQQ9NlUW1VAqOZGm0655DbUInaewRTsGRsQlo/NQ2kaH8dM=
X-Received: by 2002:a05:6512:4001:b0:545:f70:8aa7 with SMTP id
 2adb3069b0e04-5452fe80834mr5826087e87.32.1739916060191; Tue, 18 Feb 2025
 14:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20250218001512.1862030-1-festevam@gmail.com> <20250218001512.1862030-4-festevam@gmail.com>
 <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com> <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>
 <546dee0d-ce9c-48fb-bf79-72349760cb62@gmail.com>
In-Reply-To: <546dee0d-ce9c-48fb-bf79-72349760cb62@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Feb 2025 19:00:48 -0300
X-Gm-Features: AWEUYZlHfZFTaJvJu9je7yrwUEwe0BJdpzFDLQPcT0hk7PmU1mVtXZpuuGSEBAU
Message-ID: <CAOMZO5CzRoajiW86j5-9edCh7a8fU16EBrJ7_x2SmtTb46=CuA@mail.gmail.com>
Subject: Re: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and backtrace
To: Khem Raj <raj.khem@gmail.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, david.oberhollenzer@sigma-star.at, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_140102_914784_D8FFAC46 
X-CRM114-Status: UNSURE (   8.42  )
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

SGkgS2hlbSwKCk9uIFR1ZSwgRmViIDE4LCAyMDI1IGF0IDE6MjHigK9QTSBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPiB3cm90ZToKCj4gbWF5YmUgY2hlY2sgZm9yIGJhY2t0cmFjZSBmdW5j
dGlvbiBpbiBsaWJjIGZpcnN0IGFuZCBpZiBub3QgZm91bmQgdGhlbgo+IHRyeSBsaWJleGVjaW5m
byBjaGVjay4KCkkgaW1wbGVtZW50ZWQgeW91ciBzdWdnZXN0aW9uIGxpa2UgdGhpczoKCi0tLSBh
L2NvbmZpZ3VyZS5hYworKysgYi9jb25maWd1cmUuYWMKQEAgLTIzOCw2ICsyMzgsMTcgQEAgaWYg
dGVzdCAieCRuZWVkX2Ntb2NrYSIgPSAieHllcyI7IHRoZW4KICBQS0dfQ0hFQ0tfTU9EVUxFUyhD
TU9DS0EsIFtjbW9ja2FdLCBbXSwgW2Ntb2NrYV9taXNzaW5nPSJ5ZXMiXSkKIGZpCgorQUNfQ0hF
Q0tfRlVOQyhbYmFja3RyYWNlXSwgW2hhdmVfYmFja3RyYWNlPXllc10sIFtoYXZlX2JhY2t0cmFj
ZT1ub10pCisKK2lmIHRlc3QgIngkaGF2ZV9iYWNrdHJhY2UiID0gInhubyI7IHRoZW4KKyAgICBB
Q19DSEVDS19MSUIoW2V4ZWNpbmZvXSwgW2JhY2t0cmFjZV0sCisgICAgICAgIFtMSUJTPSIkTElC
UyAtbGV4ZWNpbmZvIgorICAgICAgICAgQUNfREVGSU5FKFtIQVZFX0JBQ0tUUkFDRV0sIFsxXSwg
W2JhY2t0cmFjZSBpcyBhdmFpbGFibGUgdmlhCmxpYmV4ZWNpbmZvXSldLAorICAgICAgICBbQUNf
TVNHX1dBUk4oW2JhY2t0cmFjZSBzdXBwb3J0IG5vdCBmb3VuZF0pXSkKK2Vsc2UKKyAgICBBQ19E
RUZJTkUoW0hBVkVfQkFDS1RSQUNFXSwgWzFdLCBbYmFja3RyYWNlIGlzIGF2YWlsYWJsZSB2aWEg
bGliY10pCitmaQorCiBBQ19DSEVDS19IRUFERVJTKFtleGVjaW5mby5oXSkKCkFuZCB0ZXN0ZWQg
aW4gdHdvIGNhc2VzOgoKV2l0aCBnbGliYzoKY2hlY2tpbmcgZm9yIGJhY2t0cmFjZS4uLiB5ZXMK
CldpdGggbXVzbDoKY2hlY2tpbmcgZm9yIGJhY2t0cmFjZS4uLiBubwpjaGVja2luZyBmb3IgYmFj
a3RyYWNlIGluIC1sZXhlY2luZm8uLi4geWVzCgpEb2VzIHRoaXMgbG9vayBnb29kPwoKVGhhbmtz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
