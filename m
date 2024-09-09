Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D8EECE57E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIwXFCD3ylYpuhVdTe1s21EC/FxuvlJC3cMx1+MoUDc=; b=eGxqmzqlKewDsR
	BaI33PbakIKuiKmN2XU7J8N3vqh5fXi948u6iIdmuzNHSzUWv3t+yXTSiCHlouD+2oIbqNJj4Mu/p
	6mAKa5E0fXu1qq5a9+O2rV+G79lNwPtN2nYZcwrxZaUVEte5WjYJmBsZX8dBc5dqCP7XPOikDDO+q
	U2EMwS+mJK1FvSq52q6OSzElLEtI0JhiNS3JX66SDp4U0bnNVdyeTkXZN6ThTTOwLCZ9M+Sn8W2XA
	McexLLbrRgsE+eI6jux01wgXKEV3DmkTexKWNhh1dM3L6oepK9vKICkl1dwKjQPZieg62IPDobOWN
	GknNQ/hKyKBp1BoSWNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZfP-000000014Bw-30zz;
	Mon, 09 Sep 2024 08:22:35 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZfM-0000000149S-3Rup
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 08:22:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso3116218a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725870151; x=1726474951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEQByQyfl9VluO8qkndWzBDGLo0rdEsiighFqw9cCSA=;
        b=gutlW216aB0Jz0F0LjAZ3i2IWTU7o+PPtCoOkPock2I462/Q4naQCkT6lIaAGcLJeZ
         Gzei23pXu5uCqoDWHgn/vBHC/kC4O8D7WKnR08tko4AS9Br/79lFtWXAvPeB7D1AY8g0
         BvqM+884+YwRFw7/FMO1muxZKnLeAIW+ACjJzsJRPqM4qm7mH+/rfupX4fbWBUs+WitW
         kOClzAvGtOvvzijVi2XvS9EfI0hJdu2ku0lNy2inMVki0fKoGVLQqHkcHsCICFlOjuRo
         CUt5oVYBLMztsTUMlSOF74rkTEOmgujT9ZIBw2BtGfHZ6dGfAHau3S+oKEtJiugxNLbY
         1U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870151; x=1726474951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEQByQyfl9VluO8qkndWzBDGLo0rdEsiighFqw9cCSA=;
        b=NOJRZqt0pvJEEUJPL5v4DswdzERq5/wuY92wgbLdzYOd7NJLIpfzy9N2l36dkR1MCJ
         V/yIO3IIeSfdskrBwpZ7h8LKnm/63y9vUsahVFaEtJWbGx3t4QR0nYVS+xdq+RLpgS/y
         544Hc+jOYTLEy6OvBSaQL/1uOC3K1F7kfSK1mNuQ8wMMsmOtx+kKFvEvSKRPic5xex9v
         j0waaiT3uy1q91+Eh7CdO9dcCVEPAwl0C/SE58dujXZ8YzdFPHS4KX1D/V2dBKhCKe5E
         WHhQ3KWdjG/HxaEIVffXtGwxO4ArJYsxKJBM/9bzoSbl+lBQ1Jap9wxrhFjIr+fQwdON
         hRkg==
X-Forwarded-Encrypted: i=1; AJvYcCVG4ArTA9UfiAKuQTUhaypNnoXfGkqGyTFmBdbA+iiBewIZFAmY1k7i6mAPG+08dQZ/HQCZvtw1Nw8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNugBLjQ1ZGNjJZAHzzyI0lV7z9/fz2v7GN5kZwJHYTCny1Bmk
	CgZ3vEJFqyGIqh1JW83RxZdCA6AATD22UpvRTJv8LHSxIdq5R33vOEI8Wpur0HzItXTeVlvIc3p
	ibvBySBfS0XknCsbH3p8Ur8zLuXNaWQ==
X-Google-Smtp-Source: AGHT+IGML/D1MIgs1YGLWvOaVA6MYQFn23lROBT43rj2X5ygBWRPiknmmT+ZUwXrrBaeIW24taAdh6UmxIhRwyC6wy0=
X-Received: by 2002:a17:90b:2707:b0:2d8:89ad:a67e with SMTP id
 98e67ed59e1d1-2dad4dde298mr11600582a91.1.1725870150876; Mon, 09 Sep 2024
 01:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240903013625.1658825-1-linchengming884@gmail.com>
 <20240903013625.1658825-3-linchengming884@gmail.com> <20240906170439.286e6c55@xps-13>
In-Reply-To: <20240906170439.286e6c55@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 9 Sep 2024 16:20:09 +0800
Message-ID: <CAAyq3SbOR2-_RGEk7dfgU1Lgu3mgKqdmUkmhGw3eS9cTroo27Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mtd: spinand: macronix: Flag parts needing
 explicit plane select
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_012232_920792_8AC3EE9E 
X-CRM114-Status: GOOD (  15.12  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQ55pyINuaXpSDpgLHkupQg5LiL5Y2IMTE6MDTlr6vpgZPvvJoKPgo+IEhpIENoZW5n
IE1pbmcsCj4KPiBsaW5jaGVuZ21pbmc4ODRAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgIDMgU2Vw
IDIwMjQgMDk6MzY6MjUgKzA4MDA6Cj4KPiA+IEZyb206IENoZW5nIE1pbmcgTGluIDxjaGVuZ21p
bmdsaW5AbXhpYy5jb20udHc+Cj4gPgo+ID4gTWFjcm9uaXggc2VyaWFsIE5BTkQgZmxhc2ggd2l0
aCBhIHR3by1wbGFuZSBzdHJ1Y3R1cmUgcmVxdWlyZXMKPiA+IGluc2VydGlvbiBvZiB0aGUgUGxh
bmUgU2VsZWN0IGJpdCBpbnRvIHRoZSBjb2x1bW4gYWRkcmVzcyBkdXJpbmcKPiA+IHRoZSB3cml0
ZV90b19jYWNoZSBvcGVyYXRpb24uCj4gPgo+ID4gQWRkaXRpb25hbGx5LCBmb3IgTVgzNXtVLEZ9
MkcxNEFDIGFuZCBNWDM1TEYyR0U0QUIsIGluc2VydGlvbiBvZgo+ID4gdGhlIFBsYW5lIFNlbGVj
dCBiaXQgaW50byB0aGUgY29sdW1uIGFkZHJlc3MgaXMgcmVxdWlyZWQgZHVyaW5nCj4gPiB0aGUg
cmVhZF9mcm9tX2NhY2hlIG9wZXJhdGlvbi4KPgo+IEkgdHJpZWQgdG8gYXBwbHkgdGhpcyBwYXRj
aCBidXQgaXQgY29uZmxpY3RzIHdpdGggdGhlIHNwaS1uYW5kCj4gY29udGludW91cyByZWFkIHNl
cmllcyBjaGFuZ2VzIGluIHRoZSBtYWNyb25peCBkcml2ZXIuIFdvdWxkIHlvdSBtaW5kCj4gcmVi
YXNpbmcgYW5kIGZpeGluZyB0aGUgY29uZmxpY3RzIChpdCdzIGp1c3QgaGFuZGxpbmcgY29ycmVj
dGx5IHRoZQo+IG5ldyBmbGFncyk/CgpTdXJlLCBJIHdpbGwgcmViYXNlIHRoZSBwYXRjaGVzIGFu
ZCByZXNvbHZlIHRoZSBjb25mbGljdHMuCgo+Cj4gSWYgeW91IGRvIHRoYXQgZWFybHkgbmV4dCB3
ZWVrIEknbGwgbWVyZ2UgdGhlbSByaWdodCBhd2F5IChwbGVhc2UKPiByZXNlbmQgdGhlIHR3byBw
YXRjaGVzKS4KPgo+IFRoYW5rcyBhbmQgc29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlIQo+IE1p
cXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
