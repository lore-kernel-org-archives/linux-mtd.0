Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5994BC001B0
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Aug 2023 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB7vx4Kl5lhSlmPZyy0xdg7khQRSE9edUn9RLUI2Utg=; b=s6YS0+dfCHobyp
	RkhH2eSODqyukN3BVanFTtOYhjPUejD7MSuwvVlL0s0enCyYGNmd+so4XRWzuNInxy7it4EdgY34u
	8rU4MhiLDXJRxXjIWuuRVjSknwOKJexfQE9GUKBXHaCAKuDQleOfdeBHpLeimgebnAvqOwZf9UrSP
	GAHsRIUKDqCu1oX7Lya/AsvRA2GTrTEEILmYrqbWNGbk9rLamRpvDTGoeO8eJu+94m0k3pFkEiP3k
	yMz5TQ9ZAl5OxU7Ane3hXsslesjYyxTQfkZ2edTegHkIrYfZcgBQ0v7nijxsNuYNPi8hxoTah+hJ9
	HRUiulmRFY0SHBDHpCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVaJh-00HXwz-2O;
	Mon, 14 Aug 2023 16:21:17 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVaJe-00HXwe-24
	for linux-mtd@lists.infradead.org;
	Mon, 14 Aug 2023 16:21:16 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-58c4f6115bdso4518447b3.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030072; x=1692634872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LQvPgG2h1/fLfnTL/EIPEHhur13Ow7MR7eEqaGIBCU=;
        b=BkN/2Jl6PPGnw6EzNJgU1oZ5jSlwZckXpJ9II7rd+6cRX6tcs9JIrpHLFRTujQqixt
         wHTVZFqhcGNPYkuBpevRy5e0jfV6KnilbnfExX//HBvf6fg4h9yXGraPCtS6dye5MFar
         3wL6GbcnKyrBIEZ1aDIaLCB0LuKB+3FNqcdRgNrR5HxvhDiHZURQIlSMfZYvibCe4iFU
         BTeTPKmkI6YQ4x6zHqkXi1HoJm3jrggysx3cddvybJgkrRxMVMgRnd1dMsyYi/m9rvAn
         F1TPzewl/1PZAc8E9Ymo9/IM7aOYghwQVYivjfCSo92uPiKuq0fHTLvhKl6MkVUyK2Rf
         HxZQ==
X-Gm-Message-State: AOJu0YwOrSJx8dDffu0bnCk8upT4wc9lI/ffltxPVXtprCk/dcGZ9JwZ
	OfvwTdjVb96r3Z+8AFmhyp5fua8ScF8mGA==
X-Google-Smtp-Source: AGHT+IGwQjN45QZdXCy7b3wkR/uTU0PwawTeoVXvnbBk/7XFezjfHGDful3z6RJ1MdP/vWXBjOtE/w==
X-Received: by 2002:a81:5c82:0:b0:584:6d71:f465 with SMTP id q124-20020a815c82000000b005846d71f465mr13029976ywb.12.1692030072276;
        Mon, 14 Aug 2023 09:21:12 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id x136-20020a0dd58e000000b0058c4e33b2d6sm248880ywd.90.2023.08.14.09.21.12
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 09:21:12 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so4628067276.0
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 09:21:12 -0700 (PDT)
X-Received: by 2002:a25:ae98:0:b0:d0f:926b:c734 with SMTP id
 b24-20020a25ae98000000b00d0f926bc734mr10259367ybj.61.1692030071857; Mon, 14
 Aug 2023 09:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wi4Yau-3Bsv2rXYmtXMTLaj3=Wyf4cdM6d89czFvkVsRQ@mail.gmail.com>
 <20230724122626.1701631-1-geert@linux-m68k.org> <88f83d73-781d-bdc-126-aa629cb368c@linux-m68k.org>
 <202307281551.D894AA39@keescook>
In-Reply-To: <202307281551.D894AA39@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2023 18:20:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRiacSxqDzYmakWAQB99kYvY0Bi9zALP9ZnC9Xs_xO5g@mail.gmail.com>
Message-ID: <CAMuHMdXRiacSxqDzYmakWAQB99kYvY0Bi9zALP9ZnC9Xs_xO5g@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.5-rc3
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_092114_685928_62C284D0 
X-CRM114-Status: GOOD (  19.70  )
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

SGkgS2VlcywKCk9uIFNhdCwgSnVsIDI5LCAyMDIzIGF0IDEyOjU34oCvQU0gS2VlcyBDb29rIDxr
ZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDAy
OjQzOjAyUE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIE1vbiwgMjQg
SnVsIDIwMjMsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gSkZZSSwgd2hlbiBjb21w
YXJpbmcgdjYuNS1yYzNbMV0gdG8gdjYuNS1yYzJbM10sIHRoZSBzdW1tYXJpZXMgYXJlOgo+ID4g
PiAgLSBidWlsZCBlcnJvcnM6ICs1Ly0wCj4gPgo+ID4gICArIC9raXNza2Ivc3JjL2luY2x1ZGUv
bGludXgvZm9ydGlmeS1zdHJpbmcuaDogZXJyb3I6IGNhbGwgdG8gJ19fd3JpdGVfb3ZlcmZsb3df
ZmllbGQnIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIHdhcm5pbmc6IGRldGVjdGVkIHdyaXRlIGJl
eW9uZCBzaXplIG9mIGZpZWxkICgxc3QgcGFyYW1ldGVyKTsgbWF5YmUgdXNlIHN0cnVjdF9ncm91
cCgpPyBbLVdlcnJvcj1hdHRyaWJ1dGUtd2FybmluZ106ICA9PiA1ODM6MjUsIDQ5MzoyNQo+ID4K
PiA+IG1pcHMtZ2NjMTMvbWlwcy1hbGxtb2Rjb25maWcKPiA+Cj4gPiBGdWxsIGNvbnRleHQ6Cj4g
Pgo+ID4gICAgIEluIGZ1bmN0aW9uICdmb3J0aWZ5X21lbXNldF9jaGsnLAo+ID4gICAgICAgaW5s
aW5lZCBmcm9tICdtZW1zZXRfaW8nIGF0IC9raXNza2Ivc3JjL2FyY2gvbWlwcy9pbmNsdWRlL2Fz
bS9pby5oOjQ4NjoyLAo+ID4gICAgICAgaW5saW5lZCBmcm9tICdidWlsZF9hdXRoX2ZyYW1lJyBh
dCAva2lzc2tiL3NyYy9kcml2ZXJzL25ldC93aXJlbGVzcy9sZWdhY3kvcmF5X2NzLmM6MjY5Nzoy
Ogo+ID4gICAgIC9raXNza2Ivc3JjL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaDo0OTM6
MjU6IGVycm9yOiBjYWxsIHRvICdfX3dyaXRlX292ZXJmbG93X2ZpZWxkJyBkZWNsYXJlZCB3aXRo
IGF0dHJpYnV0ZSB3YXJuaW5nOiBkZXRlY3RlZCB3cml0ZSBiZXlvbmQgc2l6ZSBvZiBmaWVsZCAo
MXN0IHBhcmFtZXRlcik7IG1heWJlIHVzZSBzdHJ1Y3RfZ3JvdXAoKT8gWy1XZXJyb3I9YXR0cmli
dXRlLXdhcm5pbmddCj4gPiAgICAgICA0OTMgfCAgICAgICAgICAgICAgICAgICAgICAgICBfX3dy
aXRlX292ZXJmbG93X2ZpZWxkKHBfc2l6ZV9maWVsZCwgc2l6ZSk7Cj4gPiAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4gPiAgICAgSW4gZnVuY3Rpb24gJ2ZvcnRpZnlfbWVtY3B5X2NoaycsCj4gPiAgICAg
ICBpbmxpbmVkIGZyb20gJ21lbWNweV90b2lvJyBhdCAva2lzc2tiL3NyYy9hcmNoL21pcHMvaW5j
bHVkZS9hc20vaW8uaDo0OTQ6MiwKPiA+ICAgICAgIGlubGluZWQgZnJvbSAndHJhbnNsYXRlX2Zy
YW1lJyBhdCAva2lzc2tiL3NyYy9kcml2ZXJzL25ldC93aXJlbGVzcy9sZWdhY3kvcmF5X2NzLmM6
OTU1OjMsCj4gPiAgICAgICBpbmxpbmVkIGZyb20gJ3JheV9od194bWl0LmNvbnN0cHJvcCcgYXQg
L2tpc3NrYi9zcmMvZHJpdmVycy9uZXQvd2lyZWxlc3MvbGVnYWN5L3JheV9jcy5jOjkxMjoxMjoK
PiA+ICAgICAva2lzc2tiL3NyYy9pbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6NTgzOjI1
OiBlcnJvcjogY2FsbCB0byAnX193cml0ZV9vdmVyZmxvd19maWVsZCcgZGVjbGFyZWQgd2l0aCBh
dHRyaWJ1dGUgd2FybmluZzogZGV0ZWN0ZWQgd3JpdGUgYmV5b25kIHNpemUgb2YgZmllbGQgKDFz
dCBwYXJhbWV0ZXIpOyBtYXliZSB1c2Ugc3RydWN0X2dyb3VwKCk/IFstV2Vycm9yPWF0dHJpYnV0
ZS13YXJuaW5nXQo+ID4gICAgICAgNTgzIHwgICAgICAgICAgICAgICAgICAgICAgICAgX193cml0
ZV9vdmVyZmxvd19maWVsZChwX3NpemVfZmllbGQsIHNpemUpOwo+ID4gICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+ID4KPiA+IFNpbmdsZS1lbGVtZW50IGZsZXhpYmxlIGFycmF5IGFidXNlIGluIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL2xlZ2FjeS9yYXljdGwuaDp0eF9tc2cudmFyCj4KPiBeXl5eCj4gaXMg
dGhpcyBsaW5lIGZyb20geW91IG9yIGlzIHRoZXJlIGEgdG9vbCBvdXRwdXR0aW5nIHRoaXM/IEJl
Y2F1c2UsIHllcywKCkl0IGlzIGEgbGluZSBmcm9tIG1lLgoKKHNob3VsZCBJIHRha2UgaXQgYXMg
YSBjb21wbGltZW50IHRoYXQgSSBzdGFydCBzb3VuZGluZyBsaWtlIGEgdG9vbD8gOy0pCgo+IHZl
cnkgdHJ1ZToKPgo+IHN0cnVjdCB0eF9tc2cgewo+ICAgICBzdHJ1Y3QgdGliX3N0cnVjdHVyZSB0
aWI7Cj4gICAgIHN0cnVjdCBwaHlfaGVhZGVyIHBoeTsKPiAgICAgc3RydWN0IG1hY19oZWFkZXIg
bWFjOwo+ICAgICBVQ0hBUiAgdmFyWzFdOwo+IH07Cj4KPiBJJ2xsIHNlbmQgYSBwYXRjaC4KClRo
YW5rcywgSSBub3RpY2VkIHlvdSB0b29rIGNhcmUgd2hpbGUgSSB3YXMgZW5qb3lpbmcgc3VtbWVy
IGhvbGlkYXlzIDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
