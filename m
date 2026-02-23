Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2184AE98DEA
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 05:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ7UlolWD30fHMUzmYvSOeIS3AoTaqU4RQQQ16gpAsE=; b=r4nL7WwR01uDDQ
	W50SeS/a9WNJfU0YMRICjDHq/BKBVVZX8UJzimpSHmliUyTJXSPnmWu1xCFKxz+n6YkcR+SQIfs7i
	xkJMr5yoW+SBArdNPAipfBim7P8akZVq4Ho4g0B2ZrtT1dyALz/ikvSkNl4ZJ33Aw4IIz/w5Yaped
	BIMHcRfWovs9Es5YL3mhqwj5sOyHHD7FAgdsXeYjQoew1yCxqLIeYXaDK1Og5Oa361N+TaaSttbjE
	qEDU23O54i5tAneDkjA+Nrk7hyyIGHUunf4/IDrkAtXvkJLOaNsitVIxsuP+OLg+t4w9potqGmIcx
	s4UtimB5FYUByrpb8dow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOsD-0000000HGO7-24Iu;
	Mon, 23 Feb 2026 05:52:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuOsA-0000000HGNl-3GSp
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 05:52:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aaf43014d0so27433405ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2026 21:52:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771825965; cv=none;
        d=google.com; s=arc-20240605;
        b=Vhym9vJluXbobhHKmKxgpVtQ6UEDbCeHCurkaq3Hy6tG7Y5NRLPqAgBYL2TSnRn9kf
         xEetYTS1mjBFY9PQSSAzBGOyqesgtlHk6lNYiZZjbZ4OL6D1fCd3gfKkSZNDlPeuXdwQ
         /2ZddASRUjR22JhVytU4EhGs1hT4Mf//SNrkmS+hTih2t/By6+6ZWpj2ciLJXE+vn5EB
         A5HqkxZmsM63pZ5c9G6sNpkCLxLJE7sWTwiqlBJXqz42Aq8/5+1ThPEfenICA4zQtq4R
         DtiY7slvChk0swJerIcp1ezyAHLrbTu1VbFCNXMgqYo9GXtSs7DfR2esQpBqAraQhBB/
         zKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xSGeqRFklk/MvK7e1hN4iXhpzOGomKRb6H/+7BRNAV0=;
        fh=/otea2M0zUNUqYpXfBkvpKhN/pGmKW+2QKdbRIkMgIU=;
        b=LBY36gqD8+1J32UpZKXhAohj26hq8hcsRIJxsQQUj/7I/u66iGZePrm2E1POapedNT
         gu/1I+VXRDEBllMCKryV/6fXlGG059pBgP0/ijKkZwKq5Gba/P0do95l+/UbVRTG4uHd
         qDXI1aBjMilGaP/C/OSLp/YVmtOviP1I3ibfby7Rj+/zQ1f56k7eb1RpUbrP4pjRKtzd
         dAiuUCh7BHicmfO3jwF6bhB+Y4INcQHNnUNjYk8E6aB96dGD8TdXdoeMv7dEbIksW/Eb
         wEzF1s/IykPK+/mzGgZqQIJ7LESmM7DuSlZlL8Dz0yymPqMd7Vxqs1bxP+0ck/+VS6Nv
         Knag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771825965; x=1772430765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSGeqRFklk/MvK7e1hN4iXhpzOGomKRb6H/+7BRNAV0=;
        b=KQXCeHVjJP3hCmtB0j98uenfQomdGfWkUjj4VqG+vbgakMnJfT2bG7xu3K0qcJ1kzc
         VzKIf6OYUQNuwsHNomw1ArN7mZUo/RfpKgMvPoZ0e/+BB4USgN5V0BDOiw/B5cvi7eX5
         Ykt1jty9PNGGx7ZGw9RaQmLIUygYsWA+Zka0IG2qCxRD2W96XvOJm3mbKkjG+IdHyN0y
         JkFux5RjfSuCy0jGaY9cn2z30QLLXvRatNqJCqVhAtqARJBNtpTYqQHIxW6VuZ1eXDmh
         a2b6RtYN27iLMhlyelVH7Fw25GQYwEx42ij19jnBhsD9ZDps9wYx9Q2YQmywdZU1oPzP
         A7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771825965; x=1772430765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSGeqRFklk/MvK7e1hN4iXhpzOGomKRb6H/+7BRNAV0=;
        b=UWfsA312JHATg+VzbwkJ2xY1ZZSQNWFHaGmfWw/vz9yBlTqVos0mWa8CikxHl5nMhW
         GvvjKggmtME8m4Q3ru+b9dY1DwPBsQ0cDOdLsiIrxbTN1OzRpsfUYmOcKcj3YrTCqAW2
         UD1/8R1xElgb7rygpatJcUj2jGzDmReni/GIQqD4p8949vbBZl5QIri6Bh7yyJGZjXi0
         j8IE1yE58dS8/D1zcCgBfAtC+5FB2cvpakwWFB6JpHB8MwFJJMDbbN4B9MH1MFYU/WOK
         l6J1FoCP7Z/VB22YqfbL5S0mZgpA5tWt/fFJ9mReSi/Oncw9S03xjXN9ZwfuWo8mmCpR
         zDfw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHCrCYSZYeIiRBFUvzy5G3GUrZ8ME8xemXmxxQjS6NjGBwYHk2Euzj9UPoY9XDnW07SnS5rtW/mc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLuHXzT5P/PztZKu9CMGp5yTCD8JKklan1YaoORoUgrUDX2Jvh
	egHMG0R7Us/8loIOccbk+7XhpRSSSMqUbZCnzxMxsjORNwwTfQELMxRqs89E7v/ocGUsW1DLyiu
	bi7kZ9zPCaU1EzLI2iuBC+eqLUXn2gU0=
X-Gm-Gg: ATEYQzwzpzNGODtu3apaAG0lm3WrvVsa9IWbEQlrm0iqmNh51roWf1yd5OfXY6L52Q0
	WDyDwyw/H2rFBs0CgdshH+JQ4W6iuVPpApGn9ZXunVoT0v2BBHzgUSYVh9BWkzQ7u6YF6Ba7SQV
	uK9t5yUt1/ywMbP0JwUpOH2qtEK725XzDizF/iKIi49RfBYKAe5vL3HTm8PE2iFyyoBfrT/G1Xz
	VczSNssB6F69Je35BXfhZIh4WTot0kj08mtkDL6wLB3FS9jmf0tg/w6dufMnUm8HNFcZSuS0cH/
	oD72RiU=
X-Received: by 2002:a17:903:41cb:b0:2aa:f989:dc7a with SMTP id
 d9443c01a7336-2ad744e0ad2mr67836265ad.33.1771825965373; Sun, 22 Feb 2026
 21:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20260211100553.907585-1-linchengming884@gmail.com>
 <20260211100553.907585-4-linchengming884@gmail.com> <87ldgyxmc0.fsf@bootlin.com>
In-Reply-To: <87ldgyxmc0.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 23 Feb 2026 13:50:52 +0800
X-Gm-Features: AaiRm50ulwUFVMf2L8O97KHc-TX8lwE2t_SY0KHEc9Bc59iLoXmY9A-s5dhON0U
Message-ID: <CAAyq3SbpnJZ2LEi4MY=ZOs+aEVBoSCivO3O3yKa9DN=KgqrbwA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] mtd: spi-nand: macronix: Enable randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, Tianling Shen <cnsztl@gmail.com>, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_215246_851448_91019C77 
X-CRM114-Status: GOOD (  24.06  )
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
IDIwMjblubQy5pyIMTLml6XpgLHlm5sg5LiL5Y2INjo1NeWvq+mBk++8mgo+Cj4gT24gMTEvMDIv
MjAyNiBhdCAxODowNTo1MyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21h
aWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBt
eGljLmNvbS50dz4KPiA+Cj4gPiBJbXBsZW1lbnQgdGhlICdzZXRfcmFuZG9taXplcicgY2FsbGJh
Y2sgZm9yIE1hY3Jvbml4IFNQSSBOQU5EIGNoaXBzLgo+ID4gVGhlIHJhbmRvbWl6ZXIgaXMgZW5h
YmxlZCBieSBzZXR0aW5nIGJpdCAxIG9mIHRoZSBDb25maWd1cmF0aW9uIFJlZ2lzdGVyCj4gPiAo
YWRkcmVzcyAweDEwKS4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGZv
bGxvd2luZyBjaGlwczoKPiA+ICAgLSBNWDM1TEZ4RzI0QUQgc2VyaWVzCj4gPiAgIC0gTVgzNVVG
eEcyNEFEIHNlcmllcwo+ID4KPiA+IFdoZW4gdGhlIHJhbmRvbWl6ZXIgaXMgZW5hYmxlZCwgZGF0
YSBpcyBzY3JhbWJsZWQgaW50ZXJuYWxseSBkdXJpbmcKPiA+IHByb2dyYW0gb3BlcmF0aW9ucyBh
bmQgYXV0b21hdGljYWxseSBkZXNjcmFtYmxlZCBkdXJpbmcgcmVhZCBvcGVyYXRpb25zLgo+ID4g
VGhpcyBoZWxwcyByZWR1Y2UgYml0IGVycm9ycyBjYXVzZWQgYnkgcHJvZ3JhbSBkaXN0dXJiYW5j
ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14
aWMuY29tLnR3Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyB8
IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21h
Y3Jvbml4LmMKPiA+IGluZGV4IGVkZjYzYjk5OTZjZi4uM2E5YWIxNDY0MjZiIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+ID4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvbWFjcm9uaXguYwo+ID4gQEAgLTE0LDYgKzE0LDggQEAKPiA+ICAjZGVmaW5l
IE1BQ1JPTklYX0VDQ1NSX0JGX0xBU1RfUEFHRShlY2NzcikgRklFTERfR0VUKEdFTk1BU0soMywg
MCksIGVjY3NyKQo+ID4gICNkZWZpbmUgTUFDUk9OSVhfRUNDU1JfQkZfQUNDVU1VTEFURURfUEFH
RVMoZWNjc3IpIEZJRUxEX0dFVChHRU5NQVNLKDcsIDQpLCBlY2NzcikKPiA+ICAjZGVmaW5lIE1B
Q1JPTklYX0NGR19DT05UX1JFQUQgICAgICAgICBCSVQoMikKPiA+ICsjZGVmaW5lIE1BQ1JPTklY
X0NGR19SQU5ET01JWkVSX0VOICAgICBCSVQoMSkKPiA+ICsjZGVmaW5lIE1BQ1JPTklYX0ZFQVRV
UkVfQUREUl9SQU5ET01JWkVSIDB4MTAKPiA+ICAjZGVmaW5lIE1BQ1JPTklYX0ZFQVRVUkVfQURE
Ul9SRUFEX1JFVFJZIDB4NzAKPiA+ICAjZGVmaW5lIE1BQ1JPTklYX05VTV9SRUFEX1JFVFJZX01P
REVTIDUKPiA+Cj4gPiBAQCAtMTQ2LDcgKzE0OCw3IEBAIHN0YXRpYyBpbnQgbWFjcm9uaXhfc2V0
X2NvbnRfcmVhZChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsIGJvb2wgZW5hYmxlKQo+
ID4gICAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb3RoZXJ3
aXNlLgo+ID4gICAqLwo+ID4gIHN0YXRpYyBpbnQgbWFjcm9uaXhfc2V0X3JlYWRfcmV0cnkoc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCByZXRyeV9tb2RlKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJldHJ5X21vZGUpCj4KPiBUaGlz
IGlzIHVucmVsYXRlZCwgaXQgc2hvdWxkIGJlIGluIGFuIG90aGVyIGNvbW1pdC4KPgo+ID4gIHsK
PiA+ICAgICAgIHN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJTkFORF9TRVRfRkVBVFVSRV8xU18x
U18xU19PUChNQUNST05JWF9GRUFUVVJFX0FERFJfUkVBRF9SRVRSWSwKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGluYW5k
LT5zY3JhdGNoYnVmKTsKPiA+IEBAIC0xNTUsNiArMTU3LDE4IEBAIHN0YXRpYyBpbnQgbWFjcm9u
aXhfc2V0X3JlYWRfcmV0cnkoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4gICAg
ICAgcmV0dXJuIHNwaV9tZW1fZXhlY19vcChzcGluYW5kLT5zcGltZW0sICZvcCk7Cj4gPiAgfQo+
ID4KPiA+ICtzdGF0aWMgaW50IG1hY3Jvbml4X3NldF9yYW5kb21pemVyKHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCwgYm9vbCBlbmFibGUpCj4gPiArewo+ID4gKyAgICAgaW50IHJldDsK
PiA+ICsKPiA+ICsgICAgIHJldCA9IHNwaW5hbmRfd3JpdGVfcmVnX29wKHNwaW5hbmQsIE1BQ1JP
TklYX0ZFQVRVUkVfQUREUl9SQU5ET01JWkVSLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZW5hYmxlID8gTUFDUk9OSVhfQ0ZHX1JBTkRPTUlaRVJfRU4gOgo+ID4gMCk7Cj4K
PiBZb3UgY2FuIGRpcmVjdGx5IHJldHVybi4gU2FtZSBpbiB0aGUgY29yZSBCVFcuCgpTdXJlLCBJ
IHdpbGwgZml4IGl0IGFuZCBzZW5kIHY2LgoKPgo+IE90aGVyd2lzZSB3aXRoIHRoaXMgYW5kIHRo
ZSBiaW5kaW5nIGRvY3VtZW50IGZpeGVkLCBsb29rcyBvay4KPgo+IFRoYW5rcywKPiBNaXF1w6hs
CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
