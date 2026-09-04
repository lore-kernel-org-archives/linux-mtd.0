Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABAFC624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgqe7wgkVygL6RkqZFOXYH9vF38AhH0u7hFiYGHdiFo=; b=tQhaek4KdxB5yC
	KpNT7h3Y34+4qv4FjmfDQH1bhMwy3RQxVJ6qRZQwoNI6lEjfWZC62Fo+dabbJB1ISXagUHnqz+CgE
	UIt2f3eZMebN39m2v8EbfM1ZJGpcaVc3QqmDE8abtpycM12PBHLdRiueBqtuMzp7o1DCxgVeBSH0L
	KXe2WYCV5EsHv3zVK7TUZ9IIWh9i/sasKyZwSbiuW48mHm4zc7kGn9qpwwABWmvPwpIqCheQODZ3z
	qRqelUNgdroOWtVNFeibcNsmiWiN5re3ApzenWdLqtEai1BSppBwFbfiOJ1HH12Un14a2uJ9g7JTn
	1x8yS17OWr1QStzArMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WpC-00000002k6l-2pqN;
	Fri, 04 Sep 2026 16:31:34 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wp9-00000002k4U-10Pu
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 16:31:33 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-96723c7151eso370614241.2
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 09:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788539490; cv=none;
        d=google.com; s=arc-20260327;
        b=c/hhQt0NwryfTMSlJudQ3TJaW2zOrh84cyTiLxFsBOKIGfuFh+Ec0UCM24ja9c/GS2
         JlfAUk5jzg/7ktKJGKr37Fzj+7rOWMPj1iNvCh6gHeBDMnL91HF8bzgOk4eEttDIdPD0
         MKb4fwFHnQs3nOED2jpjwIQKvQfh1ZKvi290bW3WoghQckmKuuJSlQnRTD404G68aSL7
         28jIwKOKEEXvCtpfOV42opfKKgDDKRvu6oo4vmnqwp9A/bg0GT40GtLtMEMl+PEnn2aA
         kgCpr2YNAGwMoobEf0jrMC21tGsKDhYPECdYKPdIX6shiJj1xLIrMFxSl6KYceUVgekP
         jogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        fh=rPY8onpmPlXDRnUY1CXdJ0M3A66jbc2TnkRAGqf+AfQ=;
        b=iJzVS9FRx43b/nL6Aztnnfk51daePIl0V0qVyBgqH+m8vYNUI27xy7JDNCC7/Nh6oT
         5sGQR8u/u7JijOdUiybxWWmY3vuvMTrnfkL9KOQjuaiv+KQmpcvKtIQlBxS84jMo/3bg
         KtSGNIJTfHopo5YOV6LWbpPk/rcgk1WGmv/DE3e5RkZbp/EyTCJnvRLmRymI2XdSGldA
         2aLfi9paVpZNnSdJ5RCYdzVTzTdZIUEMtR/IEvtUqBUOVF6ZlrXzKcjQyhi6/WcrRmOn
         DTNy7vacdAheWcE5vfJItwzASoWC2qhUVl/m1EFgwOfo/2DHqFlUUxT9aYi1v6WstD82
         TH8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539490; x=1789144290; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=QiLDnnZD9/CQehw45szf+NQNIBJGZ2IIjiwUVo2PsB1NZBladNw/WQQYTv9ulasmt2
         sVqey8Sn2zi8KgNIaCbhYo1QGewVgHkRH8YhbaynuZE3h/m+9ltSQVf6MDERlysrSeT7
         wc8YxcS2+y6HR+Re0AeqrnQBscOZ6XUwkbV8rhfPPpYIRLmni+axxu7NmVCMHcHwVkzz
         WedMDQZqYCt81JCl5+v/5frSmKlnCnFYuTp2ozJncgVtfHQ7bZewmHM2VZmd/ANt/MtF
         XKbw6miGLQyqL52LLXzsgSSBQ3l/eomgAPHWEivjI/Ty78qxDmmJo7uJxqB3GZfMWQb5
         hOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539490; x=1789144290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3NKF4O2iR0V+5SNrnuau4g2PH1qtrH1bTsv5NR4P9c=;
        b=iHPVprhb2R3OFf2D+u/Sn+3Rbc3ZDotB0N0qKCMfX2VTZlundVKvEJCjGVFrFzDQaG
         8QchqhfVTtUiJmZBXS4DyU5jGH29ZdqfHDU9mudVoBy3jFEdIcO/u0IR6m4bt9oJBwjX
         HOMZwrpzsArjUGllQ5dNvyD6hF3pfXR3gasTJE/A3CDnQ7HA/2dTRkJfQQ/WwyCdsg8W
         WbzyHG/CqrWeaIDSdNZIALycE0DW+6oFdGV1oOiKpCJO7MtmmR+pAPm5TcOamT/bsLju
         5P2N9tf7yyk7HWi9fcLMvDNpNJVXImpcAJDH45mA6OJEyhFt9klGcc/ril8lOJ6zfpY2
         z0fw==
X-Forwarded-Encrypted: i=1; AKwUvBy6bfocBxaoWPopjWOubWghxKprFAy726sDf/S/v6rd4xVpq+VJwFUCN/jz8PsBIdQtdE2hMvCRifY=@lists.infradead.org
X-Gm-Message-State: AFuF++nmWmNKFyWh+HtT6kPX/np2fAXi8DZrvx6VqEUQADrTnykbvpvD
	oMbI3YNgjvmIXK2IE+KfYOuVaBJTFVOqcjeSFqWVJwLuZ7llgh9WqpbK6jijg4yvddoWhCA7OUg
	Zyq8t4iBD0sGe7NMS9jmmyqw1IaHPmIw=
X-Gm-Gg: AYBFou21nXe2ICOHSdnhsIIjeX+x/HSqakuQ7KPfuJucJeCSFnEXVKbw6Ad4nNiXw8P
	ZJ2mKlC7rsXTCDyVwqA25ietcBGEjCfOB0sJ5rRxJjly+LvoohmnrqmVlNYq18DkzNjjzSqmk4s
	Oc0mNtGbfVGWcY3JsuU59ESK4Nnm9CQ8qgoFmHIh1Xms//Zn1+jPrgPheoGYv+s0vMEEiOnMa0K
	hJI2jm+bmCslN8oAi4FeBJqbzBp+b8yTQMktFXw0dykpOzKoTQ0o4/YBuIEDjTNjDx3fzcvPax1
	7Ox/7ijUmdBjo4FPtEGtOVOPjpgvsi18fIRkb5SuT4kyPVIt/MEJBZ2rDcho65MSY6DNYMtk1oO
	csivraMxKXej/Tawrmc6431g1jwI0VGMY/HBgn9upI7vwzh6Y+UBk3y1Mljj9VE7CvDKqaWqiGH
	4dVkgKF+JYXOf+MfGwbmGo6ByuSvh/wi85vg4MAk2vbaXykt0P6Q==
X-Received: by 2002:a05:6102:5e86:b0:78a:8a0:7116 with SMTP id
 ada2fe7eead31-78a4a6f61c1mr2282968137.6.1788539489982; Fri, 04 Sep 2026
 09:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
 <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
 <87se3p13jy.fsf@bootlin.com> <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
 <878q5h11gu.fsf@bootlin.com>
In-Reply-To: <878q5h11gu.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Sep 2026 12:31:19 -0400
X-Gm-Features: AcwNN1V5YDZSFNMjnzJoP1G8O-i3NIxVjKyBABCYlVfSDwIJgBSeFv9BnhDuMNw
Message-ID: <CADvTj4o4Rwcmy7ByuBcpcPkcXctvgB8Tuda2_7UV1v=vx7JwRw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_093131_295370_BF5F162D 
X-CRM114-Status: GOOD (  28.94  )
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

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA5OjI34oCvQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNC8wOS8yMDI2IGF0IDExOjE3OjQ2IC0w
NCwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBPbiBGcmksIFNlcCA0LCAyMDI2IGF0IDg6NDLigK9BTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDEwLzA4LzIwMjYgYXQgMTc6
MDQ6NTAgLTA2LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPj4KPiA+PiA+IFRoZSBjb250cm9sbGVyIHJhbmRvbWl6ZXIgY292ZXJzIHRoZSBiYWQg
YmxvY2sgbWFya2VyIGFsb25nIHdpdGggdGhlCj4gPj4gPiByZXN0IG9mIHRoZSBPT0IgZGF0YS4g
VGhlIGRyaXZlciBjdXJyZW50bHkgY29tcGVuc2F0ZXMgdGhlIG1hcmtlciBieXRlcwo+ID4+ID4g
YmVmb3JlIHdyaXRlcyBhbmQgYWZ0ZXIgcmVhZHMgc28gdGhhdCB0aGV5IHJlbWFpbiBwbGFpbiBv
biBmbGFzaC4KPiA+PiA+Cj4gPj4gPiBBbGx3aW5uZXIgTkFORCBmaXJtd2FyZSBpbnN0ZWFkIHN0
b3JlcyB0aGUgbWFya2VyIHRocm91Z2ggdGhlCj4gPj4gPiByYW5kb21pemVyLiBNZWRpYSB1c2lu
ZyB0aGF0IGZvcm1hdCBhcHBlYXJzIHRvIGNvbnRhaW4gYmFkIGJsb2NrcyB1bmxlc3MKPiA+PiA+
IHRoZSByYW5kb21pemVyIGlzIGVuYWJsZWQgd2hpbGUgcmVhZGluZyB0aGUgbWFya2VyLgo+ID4+
ID4KPiA+PiA+IEhvbm9yIHRoZSBhbGx3aW5uZXIscmFuZG9taXplZC1vb2IgcHJvcGVydHkgYnkg
dW5jb25kaXRpb25hbGx5IGVuYWJsaW5nCj4gPj4gPiBwYWdlIHNjcmFtYmxpbmcgYW5kIGxlYXZp
bmcgdGhlIG1hcmtlciBpbiB0aGUgcmFuZG9taXplciBkYXRhIHN0cmVhbS4KPiA+PiA+IEtlZXAg
dGhlIGV4aXN0aW5nIHBsYWluIG1hcmtlciBiZWhhdmlvciB3aGVuIHRoZSBwcm9wZXJ0eSBpcyBh
YnNlbnQuCj4gPj4gPiBUaGlzIGNoYW5nZXMgbWFya2VyIGhhbmRsaW5nIG9uIGFsbCBzdXBwb3J0
ZWQgY29udHJvbGxlcnM7IHRoZSBINi9INjE2Cj4gPj4gPiBwcm90ZWN0ZWQgdXNlci1kYXRhIHBs
YWNlbWVudCBpcyBoYW5kbGVkIHNlcGFyYXRlbHkuCj4gPj4KPiA+PiBCdXQgSSB0aGluayB0aGUg
cmVhc29uIHdoeSB0aGlzIGhhcyBuZXZlciBiZWVuIGRvbmUgaXMgYmVjYXVzZSBpdCBqdXN0Cj4g
Pj4gYnJlYWtzIHJhdyBhY2Nlc3NlcywgaW5jbHVkaW5nIHRoZSBCQlQgcmVhZHMuIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcwo+ID4+IGhhbmRsZWQsIGlzIGl0Pwo+ID4KPiA+IEZyb20gbXkgdW5kZXJz
dGFuZGluZyByYXcgYWNjZXNzIGJ5cGFzc2VzIHJhbmRvbWl6YXRpb24gZW50aXJlbHkuCj4KPiB5
ZXMsIHNvIHRoZSBpbXBsZW1lbnRhdGlvbiB5b3UgcHJvcG9zZSBpcyBpbnZhbGlkLCByYXcgcmVh
ZHMgc2hhbGwKPiBzaG93IHRoZSBCQk0uIEFuZCBhbHNvLCB3aGVuIGFjY2Vzc2luZyBhIEJCVCwg
aXQgaXMgbWFkZSBpbiByYXcgbW9kZSwKPiB3aXRob3V0IHJhbmRvbWl6YXRpb24sIGFuZCBoZW5j
ZSB0b3RhbGx5IGZhaWwuIFRoaXMgY2Fubm90IGZseSEKCkkgbWF5IGJlIG1pc3VuZGVyc3RhbmRp
bmcgd2hpY2ggcmF3IGFuZCBCQlQgYWNjZXNzIHBhdGhzIGFyZSBhdCBpc3N1ZSwKc28gSSB3b3Vs
ZCBsaWtlIHRvIGNsYXJpZnkgdGhlIGV4cGVjdGVkIHNlbWFudGljcy4KClRoZSBhbGx3aW5uZXIs
cmFuZG9taXplZC1vb2IgcHJvcGVydHkgZG9lcyBub3QgYWx0ZXIgdGhlIHBlci1vcGVyYXRpb24K
cnVsZSBjb250cm9sbGluZyB0aGUgcmFuZG9taXplci4gTVREX09QU19SQVcgc3RpbGwgbGVhdmVz
IHRoZSByYW5kb21pemVyCmRpc2FibGVkLCB3aGlsZSBub3JtYWwgRUNDIG9wZXJhdGlvbnMgZW5h
YmxlIGl0LiBUaGUgcHJvcGVydHkgZG9lcyBzZXQKTkFORF9ORUVEX1NDUkFNQkxJTkcsIGVuc3Vy
aW5nIHRoYXQgbm9ybWFsIGFjY2Vzc2VzIHVzZSB0aGUgcmFuZG9taXplcgp3aGVuIHRoZSBOQU5E
IGRvZXMgbm90IGFscmVhZHkgc2V0IHRoYXQgZmxhZy4KClRoZSBwcm9wZXJ0eSBpbnN0ZWFkIHNl
bGVjdHMgdGhlIEFsbHdpbm5lciBmaXJtd2FyZSdzIHBoeXNpY2FsCm5vcm1hbC1wYWdlIE9PQiBy
ZXByZXNlbnRhdGlvbi4gSXQgbGVhdmVzIHRoZSBCQk0gaW4gdGhlIHJhbmRvbWl6ZXIgZGF0YQpz
dHJlYW0gYW5kLCBvbiBINi9INjE2LCBzZWxlY3RzIHRoZSBmaXJtd2FyZSdzIHByb3RlY3RlZC11
c2VyLWRhdGEKcGxhY2VtZW50LiBJdCBkb2VzIG5vdCBjaGFuZ2UgdGhlIHJhbmRvbWl6ZXIgYWxn
b3JpdGhtIG9yIHNlZWRzLCBub3IKZG9lcyBpdCBlbmFibGUgdGhlIHJhbmRvbWl6ZXIgZHVyaW5n
IHJhdyBhY2Nlc3Nlcy4KCldpdGggTkFORF9ORUVEX1NDUkFNQkxJTkcgc2V0LCBJIHVuZGVyc3Rh
bmQgdGhlIGN1cnJlbnQgbWFpbmxpbmUgc3VueGkKYmVoYXZpb3IgYXMgZm9sbG93czoKCm9wcy5t
b2RlICAgZmQgbW9kZSAgRUNDICByYW5kICBtYWluIGRhdGEgICAgICAgT09CIHdpdGggLW8gICAg
ICBuYW5kZHVtcAotLS0tLS0tLS0gIC0tLS0tLS0gIC0tLSAgLS0tLSAgLS0tLS0tLS0tLS0tLS0g
IC0tLS0tLS0tLS0tLS0tLSAgLS0tLS0tLS0KUExBQ0VfT09CICBOT1JNQUwgICBvbiAgIG9uICAg
IGNvcnJlY3RlZCBhbmQgICBkZS1yYW5kb21pemVkICAgIC1vCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGUtcmFuZG9taXplZCAgIGxvZ2ljYWwgT09CClBMQUNFX09PQiAgUkFXICAg
ICAgb24gICBvbiAgICBjb3JyZWN0ZWQgYW5kICAgZGUtcmFuZG9taXplZCAgICB1bmF2YWlsYWJs
ZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlLXJhbmRvbWl6ZWQgICBsb2dpY2Fs
IE9PQgpSQVcgICAgICAgIE5PUk1BTCAgIG9mZiAgb2ZmICAgcGh5c2ljYWwgYnl0ZXMgIHBoeXNp
Y2FsIE9PQiAgICAgdW5hdmFpbGFibGUKUkFXICAgICAgICBSQVcgICAgICBvZmYgIG9mZiAgIHBo
eXNpY2FsIGJ5dGVzICBwaHlzaWNhbCBPT0IgICAgIC1uIC1vCgpPT0IgZGF0YSBpcyByZXR1cm5l
ZCBvbmx5IHdoZW4gdGhlIGNhbGxlciBzdXBwbGllcyBhbiBPT0IgYnVmZmVyLiBGb3IKbmFuZGR1
bXAsIHRoaXMgaXMgc2VsZWN0ZWQgYnkgLW8uIEZvciBNRU1SRUFEL01FTVdSSVRFLCBvcHMubW9k
ZQpvdmVycmlkZXMgdGhlIGZpbGUgbW9kZS4gU3RvY2sgbmFuZGR1bXAgZXhwb3NlcyBvbmx5IHRo
ZSB0d28gZGlhZ29uYWwKY2FzZXM6CgpuYW5kZHVtcCAtLWJiPWR1bXBiYWQgLW8gL2Rldi9tdGRY
Cm5hbmRkdW1wIC1uIC0tYmI9ZHVtcGJhZCAtbyAvZGV2L210ZFgKClRoZSBmaXJzdCB1c2VzIHRo
ZSBub3JtYWwgRUNDL3JhbmRvbWl6ZXIgcGF0aCBhbmQgcmV0dXJucyBjb3JyZWN0ZWQsCmRlLXJh
bmRvbWl6ZWQgbWFpbiBkYXRhIGZvbGxvd2VkIGJ5IGRlLXJhbmRvbWl6ZWQgT09CLiBUaGUgc2Vj
b25kIHNldHMKTVREX0ZJTEVfTU9ERV9SQVcgYW5kIHJlYWNoZXMgdGhlIHJhdyBjYWxsYmFja3Mg
d2l0aCBib3RoIEVDQyBhbmQgdGhlCnJhbmRvbWl6ZXIgZGlzYWJsZWQsIHJldHVybmluZyB0aGUg
cGh5c2ljYWwgbWFpbiBhbmQgT09CIGJ5dGVzLgoKSW4gY3VycmVudCBtYWlubGluZSwgdGhhdCBw
aHlzaWNhbCBPT0IgY29udGFpbnMgYSBwbGFpbiBCQk0gYmVjYXVzZSB0aGUKbm9ybWFsIHdyaXRl
IHBhdGggY29tcGVuc2F0ZXMgdGhlIG1hcmtlciBiZWZvcmUgaGFyZHdhcmUgcmFuZG9taXphdGlv
bi4KVGhlIG5vcm1hbCByZWFkIHBhdGggcmV2ZXJzZXMgdGhhdCBjb21wZW5zYXRpb24uIFdpdGgK
YWxsd2lubmVyLHJhbmRvbWl6ZWQtb29iLCB0aGUgY29tcGVuc2F0aW9uIGlzIG9taXR0ZWQsIHNv
IGEgcmF3IHJlYWQKcmVtYWlucyBwaHlzaWNhbCBidXQgcmV0dXJucyB0aGUgQkJNIGluIGl0cyBy
YW5kb21pemVkIG9uLWZsYXNoIGZvcm0uCkEgbm9ybWFsIHJlYWQgcmV0dXJucyB0aGUgbG9naWNh
bCBCQk0gd2l0aCBlaXRoZXIgcmVwcmVzZW50YXRpb24uCgpJIGRvIG5vdCBzZWUgdGhlIGN1cnJl
bnQgQkJUIGFjY2VzcyBwYXRocyBzZWxlY3RpbmcgTVREX09QU19SQVc6CgotIG5hbmRfYmxvY2tf
YmFkKCkgY2FsbHMgY2hpcC0+ZWNjLnJlYWRfb29iKCk7Ci0gc2Nhbl9ibG9ja19mYXN0KCkgYW5k
IHNjYW5fcmVhZF9vb2IoKSB1c2UgTVREX09QU19QTEFDRV9PT0I7IGFuZAotIHJlYWRfYmJ0KCkg
dXNlcyBhbiBvcmRpbmFyeSBtdGRfcmVhZCgpLgoKRm9yIHN1bnhpLCBlY2MucmVhZF9vb2IgY2Fs
bHMgZWNjLnJlYWRfcGFnZSwgd2hpY2ggZW5hYmxlcyBib3RoIEVDQyBhbmQKdGhlIHJhbmRvbWl6
ZXIgd2hlbiBOQU5EX05FRURfU0NSQU1CTElORyBpcyBzZXQuIFRoZSBpbnRlcm5hbCBCQk0gYW5k
CkJCVCBwYXRocyB0aGVyZWZvcmUgYXBwZWFyIHRvIHJlY2VpdmUgdGhlIGRlY29kZWQgbWFya2Vy
IHJhdGhlciB0aGFuCnRoZSBwaHlzaWNhbCByYW5kb21pemVkIGJ5dGVzLgoKQ291bGQgeW91IGNs
YXJpZnkgd2hpY2ggQkJUIHBhdGggcGVyZm9ybXMgYW4gTVREX09QU19SQVcgYWNjZXNzLCBvcgp3
aGV0aGVyIEkgYW0gb3Zlcmxvb2tpbmcgYW5vdGhlciBwYXRoPwoKQWxzbywgd2hlbiB5b3Ugc2F5
IHRoYXQgcmF3IHJlYWRzIG11c3Qgc2hvdyB0aGUgQkJNLCBkb2VzIHRoYXQgbWVhbiB0aGUKQkJN
IG11c3QgYWx3YXlzIGJlIHN0b3JlZCBwbGFpbiBvbiBmbGFzaCwgb3IgbWF5IHRoZSByYXcgaW50
ZXJmYWNlCm5vcm1hbGl6ZSBqdXN0IHRoZSBCQk0gd2hpbGUgb3RoZXJ3aXNlIHJldHVybmluZyBw
aHlzaWNhbCBkYXRhPyBJZiByYXcKYWNjZXNzIG11c3QgcmVtYWluIGVudGlyZWx5IHBoeXNpY2Fs
IGFuZCB0aGUgQkJNIG11c3Qgc2ltdWx0YW5lb3VzbHkgYmUKZGlyZWN0bHkgcmVjb2duaXphYmxl
LCBkb2VzIHRoYXQgbWVhbiB0aGUgQWxsd2lubmVyIGZpcm13YXJlJ3MKcmFuZG9taXplZC1CQk0g
cmVwcmVzZW50YXRpb24gY2Fubm90IGJlIHN1cHBvcnRlZCB0aHJvdWdoIHRoZSBleGlzdGluZwpy
YXcgTkFORCBpbnRlcmZhY2U/Cgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
