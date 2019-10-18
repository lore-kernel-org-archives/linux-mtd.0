Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81394CA9EA9
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 18:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E04E20869
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 18:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oL645sFl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzSwJdSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E04E20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63vqcPU5V2wbOZ3dg7tTJDTAE5shfPsp/r7O73jhMF0=; b=oL645sFlO/1E7D
	9/H+WoizA0+G8KpEMETiFQWytpxMgfKcYhgpHiysBpQWOn+C/khu0lcl4TR2luVsZqCzQYo/VXK6x
	W7Bcm1VpCYUltdk8kiffvdTl8FeaR7Wz6i0NThRLcXfr+A3GPJ1ttUvdNw66u12EPrbw0iXBdTArx
	oMxHDa49LHhO4wyJEMwk5i8hmO+BS7DlJFZM8bv9eda+IQgN6rUEQJfcEk/8aOiAFbTQTCzV4darn
	qYevtu6DdqMKuGHoqcSbSA4+zhsE4fZjwWoXUgO98ljI9bf3Fqup567w447zJDtsa37qu3TPu6165
	jzEyF3+aterydV/4Zb8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLX6O-0001gG-If; Fri, 18 Oct 2019 18:35:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLX6K-0001fi-Lu
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2019 18:35:50 +0000
Received: by mail-wr1-x443.google.com with SMTP id l10so6863287wrb.2
 for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2019 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kzOxNxVRX1SmQHuvJ1treZltNyYijexf2ck9J3jXKY8=;
 b=UzSwJdSHGIGnMOL6in+EbhaqHjudWKwi1NoXNc6Uge3Dz+yb1bVaLT75noRv8dYHuV
 ambS0/SltyEdVI84pa4PETyzZPBjm0QQeoohLUkpMbeUPDsW09cyefdSo3jhGiRdQFjh
 LAEoSm3ko6X6szew313BbYAZTgKoPXf05eBXT4V6315zT8oeA4siuvoM8Fcw9gTHYMuB
 lGI/ld+ycFiFQilNyDoK2BP/TnSDSiKKchL6SYYkSO/wC0GyF9CeqRJ2rHSxcbbfnNqi
 ZM8nMiBXw96ozZGOoQvZfrqOOJUhOAEeoHrPbXl4IJloKUCXGUusZ+lnVNnKYNPTMY89
 EcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kzOxNxVRX1SmQHuvJ1treZltNyYijexf2ck9J3jXKY8=;
 b=i9eafbSMtclo08UqFz0rTFSS+KFSJfgUzsQb79PzTQ/ZJLn+YnAKnvIvWI1VWmFyoC
 wN4/NeyVGX3dOXfqdW2uE7aqHFDFcy+HxSOTc1mFNB/39aocqKz7X+xXB6++g4NNgfr9
 8HGWh+znE3FrPi/PoIjEu2hRnKzWg7FfSbg7tahMNTBnqE4adBJpMh/83HtxxNUgMmGV
 PzPElQq7gKNDCji7oqO3qGCibeJ7yNRwqUnzvO0Hi+bD2740bjQaqW+Va1oqxhziKKzz
 NuLKp3tfB+iU708gUsJ62rNDdA4fmB7XBXGZeInIktMsDg5TI4Ws/MA7l0Z+Fu6cO7dj
 HuUA==
X-Gm-Message-State: APjAAAV6Iva7M2UeksGTK+cGEz0uc5rqSbUe3J+Nff6qRscdd67LEv5F
 MHa7HqB2mbL7IrFtIzd34njRKWUoh2vOUqWX9ZQK3g==
X-Google-Smtp-Source: APXvYqxgG14kjuTvpv6QghuU/6AEcoV0jY0g70gj1cgl2Yr04sPjTVuLXuZMnzd6TF8thZsV6Aj7jvraefEXiSU/vGY=
X-Received: by 2002:adf:db42:: with SMTP id f2mr9736231wrj.287.1571423747128; 
 Fri, 18 Oct 2019 11:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191017142229.3853-1-miquel.raynal@bootlin.com>
In-Reply-To: <20191017142229.3853-1-miquel.raynal@bootlin.com>
From: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 18 Oct 2019 11:35:36 -0700
Message-ID: <CAN8TOE8mNf1VhoRLiiE6bjrVmDUHCwvPNaHuvDw71cxa9OhSYw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mtd/ubi/ubifs: Remove inactive maintainers
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_113548_747394_431CBCAB 
X-CRM114-Status: GOOD (  13.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgNzoyMiBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IERlc3BpdGUgdGhlaXIgc3Vic3RhbnRpYWwgcGVy
c29uYWwgaW52ZXN0bWVudCBpbiB0aGUgTVREL1VCSS9VQklGUyBhCj4gZmV3IHllYXJzIGJhY2ss
IERhdmlkLCBCcmlhbiwgQXJ0ZW0gYW5kIEFkcmlhbiBhcmUgbm90IGFjdGl2ZWx5Cj4gbWFpbnRh
aW5pbmcgdGhlIHN1YnN5c3RlbSBhbnltb3JlLiBXZSB3YXJtbHkgc2FsdXRlIHRoZW0gZm9yIGFs
bCB0aGUKPiB3b3JrIHRoZXkgaGF2ZSBhY2hpZXZlZCBhbmQgd2lsbCBvZiBjb3Vyc2Ugc3RpbGwg
d2VsY29tZSB0aGVpcgo+IHBhcnRpY2lwYXRpb24gYW5kIHJldmlld3MuCj4KPiBUaGF0IHNhaWQs
IE1hcmVrIHJldGlyZWQgaGltc2VsZiBhIGZldyB3ZWVrcyBhZ28gcXVvdGluZyBIYXJhbGQgWzFd
Ogo+Cj4gICAgICAgICBJdCBtYXR0ZXJzIHdobyBoYXMgd2hpY2ggdGl0bGUgYW5kIHdoZW4uIFNo
b3VsZCBzb21lYm9keSBub3QKPiAgICAgICAgIGJlIGFuIGFjdGl2ZSBtYWludGFpbmVyLCBtYWtl
IHN1cmUgaGUncyBub3QgbGlzdGVkIGFzIHN1Y2guCj4KPiBGb3IgdGhpcyBzYW1lIHJlYXNvbiwg
bGV04oCZcyB0cmltIHRoZSBtYWludGFpbmVycyBsaXN0IHdpdGggdGhlCj4gYWN0dWFsbHkgYWN0
aXZlIG9uZXMgb3ZlciB0aGUgcGFzdCB0d28geWVhcnMuCj4KPiBbMV0gaHR0cDovL2xhZm9yZ2Uu
Z251bW9ua3Mub3JnL2Jsb2cvMjAxODAzMDctbWNoYXJkeS1ncGwvCj4KPiBDYzogRGF2aWQgV29v
ZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgo+IENjOiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVy
c2ZvcnBlYWNlQGdtYWlsLmNvbT4KPiBDYzogQXJ0ZW0gQml0eXV0c2tpeSA8ZGVkZWtpbmQxQGdt
YWlsLmNvbT4KPiBDYzogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4g
Q2M6IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBnbWFpbC5jb20+Cj4gQ2M6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNv
bT4KPiBDYzogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpJ
J3ZlIGJlZW4gbWVhbmluZyB0byBkbyB0aGlzIGZvciBhIHdoaWxlLCBzbyB0aGFua3MuCgpBY2tl
ZC1ieTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
