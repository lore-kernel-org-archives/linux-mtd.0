Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9785CAC59B
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Sep 2025 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJFF2pkCTV1m6/WpvRnMb0gWAdk9onkWHekENICoFPo=; b=xVITyGfQao0bcB
	iu8T8+5oboNAxxIX1K4pgJIPRX5Mw804dgxBDOVQZx9qrBeC6SxaZQB9n8meESOMRBZLd8TvQ4gv+
	cqGM5EF9TZPfqvyicejpuVVt/FyP0nEQNah3hhM9mmFhrXgYcKExb0qEv4IBpAopZu77RPTYeLkTM
	wFgVU9cUCo+kSKWaLSzFFdDxURdvaP0tx9LZSGyJZDYb02kE+imIvF475uJJNyQjkZcDLCkdkJqPP
	Q6knyFSBBrEw9RzMbBJm7RspDceq02QrCzFNNNSk8M1u07fZVxec3Vdap+oTYAS9gm9HQwR82DC6k
	CVRmu1qamNbbf+7claQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyakH-00000008npP-27y2;
	Tue, 16 Sep 2025 18:49:41 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyakF-00000008noN-0jfB
	for linux-mtd@lists.infradead.org;
	Tue, 16 Sep 2025 18:49:40 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-352e19bd72fso32259511fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2025 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758048577; x=1758653377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8hUNIcLNhEAjmbVQOmRE723/QAzc6hWPOqxBb/zUjE=;
        b=NNQs0sdZcmCmZcV61fMEVChWnWZYu954P0HN/y0mKI58GN2p94+4iH0zYRjEcsWoTS
         97zZlLBsk+NT1YnA4R0YrIpfQig5VBuyhLfkHafBUkE3YUjqHu/1eIZdgV3A0LdnFju+
         M5QBbnXbqLgiCcs8UqOBylay1RZG/0j9GUg9qcckewNzDdowcVhN7dbtAH9JiU5FXDFE
         Z30B3oZDWwwDicj0RgfJElqFE/96ai++daBtqfANu0SHSHKszZryoZrsROlvfr1RkT/+
         FvjLxgHRm2sycE5h72aA8SItzT6+6/Q7ApwbgwIaIXRWzxv/6s6yd3QkiUWqKQey2Fag
         IVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758048577; x=1758653377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8hUNIcLNhEAjmbVQOmRE723/QAzc6hWPOqxBb/zUjE=;
        b=QP6vulPDF8DX6y4CpcqoIHt+aAqqIKZSyujRJDBWs8Zf/5MtHfVEQCpNKDRWnYSxeZ
         zm1XE/dA+mopdDDiONEQtgWFClDuC5j9CbXz7fcNUA0DsFwJCxkSHZ6EsjqIiKI8abVM
         mD/pTB8lfgL04bSQq6GeMcS0vuTtxNZLzm0sLV+2yirhQe3yMz+2AU6VauVpTx+IXuOe
         ncmY5VbbP7tdN1cwKCWcAF0yrOBlPEgastw7Q7JGng+ItfA2jOV8S5x4S9Rpmm0aYFev
         AmVqbsd7QNZt1LQzoVCKnhDKP7QnaczMkSLNBSbaiYRyYoBajk6w9QzjQPlj5QSOKNIn
         p69Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcRXvcibuWX/QJBgNDW522okQnE3ZJodtvNqUW7lxb/2PxS+h3tXhfwLMe13CT+dTSRbnZK0p6KaE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8eaq3hZER10+APPAtLZwt08RmlVOBIs1JL2geLkdV33k7IaEB
	eG+WAOb8vuay564GXSI/hCKpzTFHIWU/4vtztqAMpH+JjNRQVJ4qHy0EOT0mmrY8QLNjlb4dDWZ
	cx2oBVUEEXHLRli95rLFtNw6GIQplicCGbPd77FFDbA==
X-Gm-Gg: ASbGncuVWNY3ZoQT6wQVCpFE03C8q82Y6R/xsVAYb0GJAzLAhGLbx0GYyNyzC69Aqwa
	Dzj/IjCRVVWyM+TSS8ObZJSNyhxBjfB78485l6aC2PGbSbPlmPs8YWURmkfbV7aVfMvdwr3TTE/
	xjBVMqyR4ko/nrV71gGTR896jAINohTQPoDYP6uyumkg7fRo4G85wlLdjQi+kqXLcUJyvrJYhUL
	I1MwbpngrEEWGzNxg==
X-Google-Smtp-Source: AGHT+IFWMB9ShdcYx8fMWtU8U+XlPFLnlPvnZn6DzK46kDUBhr9E6r4BDz2ZVs43BnlSb4Ka4zWE3fiiN85aWZ8NypA=
X-Received: by 2002:a05:651c:25c5:10b0:351:10a7:c6d6 with SMTP id
 38308e7fff4ca-3513e31948bmr41599921fa.24.1758048576899; Tue, 16 Sep 2025
 11:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250914-fsmc-v1-1-6d86d8b48552@linaro.org> <87h5x27ned.fsf@bootlin.com>
In-Reply-To: <87h5x27ned.fsf@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Sep 2025 20:49:25 +0200
X-Gm-Features: AS18NWB8pXt8VlFK5JOJNRIBh51k88hkdes-XzTgU1xJ1txcw9ztLK9uIVVJE6w
Message-ID: <CACRpkdb-BxHb_xiyLf8Gx8PNTQ5nZEd8geJwb+PH+pd+SKpubQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: fsmc: Default to autodetect buswidth
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_114939_231219_85349A1D 
X-CRM114-Status: GOOD (  17.21  )
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

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgMTE6MzPigK9BTSBNaXF1ZWwgUmF5bmFsCjxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiBPbiAxNC8wOS8yMDI1IGF0IDAwOjM1OjM3ICsw
MiwgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKCj4gPiBJ
IGRvbid0IGtub3cgd2hlcmUgb3IgaG93IHRoaXMgaGFwcGVuZWQsIEkgdGhpbmsgc29tZSBjaGFu
Z2UKPiA+IGluIHRoZSBuYW5kIGNvcmUuCj4KPiBJIGhhZCBhIGxvb2sgYW5kIGhvbm5lc3RseSBj
b3VsZCBub3QgZmluZCB3aGVyZSB3ZSBicm9rZSB0aGlzLiBDb3VsZCBpdAo+IGJlIHBvc3NpYmxl
IHRoYXQgaXQgbmV2ZXIgd29ya2VkIHdpdGggRFQgcHJvYmluZyBhbmQgb25seSB3aXRoIHBsYXRm
b3JtCj4gZGF0YT8gQW55IGlkZWEgb2Ygd2hhdCB3YXMgdGhlIHByZXZpb3VzbHkgd29ya2luZyBi
YXNlPwoKSSB0ZXN0ZWQgb2xkIGtlcm5lbHMgYmFjayB0byA0LjIwIGFuZCBpdCBkaWRuJ3Qgd29y
ay4KUHJvYmFibHkgaXQgbmV2ZXIgd29ya2VkPwoKSSB0cmllZCB0byByZWNvbXBpbGUgc29tZXRo
aW5nIGZ1cnRoZXIgYmFjayBidXQgSSBkb24ndApoYXZlIHRoZSByZXF1aXJlZCBvbGQgdG9vbGNo
YWlucyBhcm91bmQgOlAKCj4gQW55aG93LCB0aGlzIGlzIGp1c3QgY3VyaW9zaXR5LCBwYXRjaCBp
cyByZWxldmFudCAoanVzdCBhIGxpdHRsZSBuaXQKPiBiZWxvdz8pLgo+ID4gKyAgICAgICAgICAg
ICB9Owo+Cj4gICAgICAgICAgICAgICAgICBeCj4gVGhlcmUgaXMgYSBzcHVyaW91cyAnOycgaGVy
ZSwgbm8/CgpGaXhlZCBpbiB2MiwgYWxzbyBtYWRlIGEgbW9yZSBlbGFib3JhdGUgaGFuZGxpbmcg
aWYgc29tZW9uZQp3b3VsZCBleHBsaWNpdGx5IHNldCB0aGUgd2lkdGggdG8gMi4KCkkgdGhpbmsg
dGhlIFNQRUFyIHRoYXQgaXMgdGhlIHByaW1hcnkgdXNlciBhbHdheXMgc2V0cyB0aGUgd2lkdGgK
dG8gMiBzbyB0aGV5IG5ldmVyIHNhdyB0aGlzIGJ1Zy4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
