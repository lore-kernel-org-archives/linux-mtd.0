Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D2AC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpZSnHoN206dIqNtUnOwFD/4DqCWqiV13ZUkbDNU+Yg=; b=Kg0tmyQ0Apta6R
	H1/nr9VRWvHhcx+2fM1AhrZ9wFyTkKTFDEZkR/+/hA6YXDjCDwDmFgT5o6WlVm6tBZpqlypx9ppMo
	qs3M7vznGXJNhzS1XWbiE+37WNu4r49G91pFMdqdogxtAGd60dyOhGJFF6JojFjR3x6ht/IUkhRMd
	+hO/6dv66X0G2ubJfCw34PAxDLItjfYTi3ukKCdaRdn4cuVqi9h0papkyb73yqXtQKQh5rUQuWm3G
	8NGLYbl2rSVvQYlx1TMc9qj/PaM/yvk1oXNmgofbpvsMtLo7yAzZtBOhdeFHJhi5JWkgXwUT7YRi5
	TmNWpB6L7kPr0EYwIFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okIls-007PrX-Sf; Mon, 17 Oct 2022 05:34:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okIlq-007Pql-2c
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2022 05:34:39 +0000
Received: by mail-ed1-x533.google.com with SMTP id s2so14474162edd.2
        for <linux-mtd@lists.infradead.org>; Sun, 16 Oct 2022 22:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nxZ2yJuTGxUsaJJ5aBEvjie3E+9mTCVoOOAOdinIo8=;
        b=UwK+ndXgAfQg3d85p8fb7B6AczJBw9ck4ksLxJjIL3ocVQZGm9z07mDgzM4dfKaXlY
         8YknkDiHO4je6YCHPx/tXehgoJjp9Du+Iyl81s9C8LPi4CCszH/jLlu67QzTTeYAI1qt
         rSuNe019QGyP101UPlXDJhPY+Zp0cN8y7rjJ7lEvM78fJ1KHrvN69FW/jih9pQfpJMry
         NeJ/fu7Y1eh2lTUuHDwsTdKOHpzBIR9s5hNpHDnLannZliFi53zqimOMwNVaDMf3Axc3
         mRRkFJBeVgv8g3XnFImsuhuEmTdTMvGz+RqAP4nWCulVXQzr7tz3iBEUnj32M09zuGQk
         tlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3nxZ2yJuTGxUsaJJ5aBEvjie3E+9mTCVoOOAOdinIo8=;
        b=KnyeWpodRMwnPmd2mJI2PISBZtYUfHHQtQ1w5d3ii8jN5SSaLqYunm5sTDfhHMJ1tT
         YBLOBZgdlmseFJ5WhaW/fz0HwcaOWajHwx18crE2WP+TT+03eECZlRluaGC9O3200MBI
         Jkyy0xqizkKqT/6bJPVl29EyeUSWuhN7qH+IbtPLDxtrTUw83plEuuijR3wPjlM1CNGL
         pWZkzuOj6zr9lBFLNgCO+n/1BY2b6fdJgOnLUyMtiDTVXAKiCdrCN4m/1PUzuOGhV+z/
         SrH7Hk+sHIGWb6EIOro45vdePrfnL4mEY23PsNl/1CB2zZd7PbeyetHo3hu6aWRTOJWX
         p0Rg==
X-Gm-Message-State: ACrzQf1bSQ7MiAcyn6BkE8F4NFIEint8lRhcdVf1xvQYnv+oGJu86GUW
	wdRh4AnC/0AwGgQDYcqhZ+4=
X-Google-Smtp-Source: AMsMyM6MmVJuseIoX828D2It3iIKimfCHfyu7dzUhwtSk52usJrHKB7r8YG20uzWCaggnkbJvIifYw==
X-Received: by 2002:a05:6402:e9b:b0:454:351c:c222 with SMTP id h27-20020a0564020e9b00b00454351cc222mr8765798eda.216.1665984876134;
        Sun, 16 Oct 2022 22:34:36 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id g7-20020a170906348700b0074ae59d85a4sm5542089ejb.20.2022.10.16.22.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 22:34:35 -0700 (PDT)
Message-ID: <a0cf3ec8-3e27-e8b0-cc0b-e8aefe97842d@gmail.com>
Date: Mon, 17 Oct 2022 07:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] mtd: parsers: trx: Rewrite partition parsing
To: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
References: <20221016104017.2695989-1-linus.walleij@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221016104017.2695989-1-linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_223438_142350_AB430A64 
X-CRM114-Status: GOOD (  31.28  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTYuMTAuMjAyMiAxMjo0MCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBUaGUgVFJYIHBhcnNl
ciBoYXMgbmV2ZXIgYmVlbiBmdWxseSBpbXBsZW1lbnRlZCwgdGhlIGNvbW1pdCBzcGxpdHRpbmcK
PiBpdCBvdXQgb2YgdGhlIGJjbTQ3eHggcGFyc2VyIHNheXMgIlRoZXJlIGlzIHN0aWxsIHNvbWUg
cGxhY2UgZm9yCj4gaW1wcm92ZW1lbnQiLgo+IAo+IEhlcmUgYXJlIHNvbWUgaW1wcm92ZW1lbnRz
Ogo+IAo+IDEuIEZpcnN0IHBhcnRpdGlvbiBpbmNsdWRlcyBUUlggaGVhZGVyIG9mZnNldDoKPiAK
PiBUaGUgcGFyc2VyIGNhbiBjdXJyZW50bHkgcHJvZHVjZSBvdXRwdXQgbGlrZSB0aGlzOgo+IDB4
MDAwMDAwMDAwMDFjLTB4MDAwMDAwMjgwMDAwIDogImxpbnV4Igo+IG10ZDogcGFydGl0aW9uICJs
aW51eCIgZG9lc24ndCBzdGFydCBvbiBhbiBlcmFzZS93cml0ZSBibG9jawo+IGJvdW5kYXJ5IC0t
IGZvcmNlIHJlYWQtb25seQo+IAo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgVFJYIGhlYWRlciBpcyBu
b3QgaW5jbHVkZWQgaW50byB0aGUKPiBwYXJ0aXRpb24sIHdoaWxlIGl0IHNob3VsZCBiZTogdGhl
IHZlbmRvciBjb2RlIGRvZXMgdGhpcywKPiBhbmQgd2hlbiByZXBsYWNpbmcgdGhlIGtlcm5lbCBp
biBmbGFzaCB3ZSBjZXJ0YWlubHkgd2FudAo+IHRvIHdyaXRlIGl0IGFsb25nIHdpdGggYSBuZXcg
VFJYIHRhZyBhcyB3ZWxsLiBSaWdodCBub3cKPiB3ZSBjYW5ub3QgcmVwbGFjZSBpdCBmcm9tIHdp
dGhpbiBMaW51eCBkdWUgdG8gdGhpcwo+IGxpbWl0YXRpb24uCgpZb3UncmUgdHJ5aW5nIHRvIHdv
cmthcm91bmQgbXRkIHdyaXRlIGxpbWl0YXRpb24gYnkgaGFja2luZyBtdGQKcGFydGl0aW9uLiBU
UlggaGVhZGVyIGlzIE5PVCBhIHBhcnQgb2Yga2VybmVsIGltYWdlLiBJdCBzaG91bGQgbm90IGJl
CnBhcnQgb2YgdGhlICJsaW51eCIgTVREIHBhcnRpdGlvbi4KCklmIHlvdSByZWFsbHkgd2FudCB0
aGF0IGNvdmVyZWQgeW91IGNhbiBhZGQgcGFydGl0aW9uIGZvciBpdCBsaWtlCjB4MDAwMDAwMDAw
MDAwLTB4MDAwMDAwMDAwMDFjIDogImhlYWRlciIKYnV0IEkgc2VlIGxpdHRsZSBwb2ludCBpbiB0
aGF0LgoKCj4gMi4gU2NhbiBmb3Igc2V2ZXJhbCBUUlggaGVhZGVycwo+IAo+IEN1cnJlbnRseSBv
bmx5IHRoZSBmaXJzdCBmbGFzaCBibG9jayBpcyBzY2FubmVkIGZvciBhIFRSWAo+IGhlYWRlciwg
YnV0IHNldmVyYWwgZmxhc2hlcyBoYXZlIG11bHRpcGxlIFRSWCBoZWFkZXJzCj4gZWFjaCB3aXRo
IHVwIHRvIDMgcGFydGl0aW9ucy4KClRoYXQncyBiZWNhdXNlIGl0J3MgYSBUUlggcGFyc2VyLiBJ
dCdzIG1lYW50IHRvIHBhcnNlIFRSWCBjb250YWluZXIuCkp1c3QgdGhhdC4KCldlIGNhbid0IGhh
dmUgVFJYIHBhcnNlciBoYW5kbGUgYWxsIHBvc3NpYmxlIGNhc2VzIG9mIGl0cyB1c2FnZS4gVGhl
eQpkZXBlbmQgb24gdmVuZG9yIHNvbHV0aW9ucyBhbmQgd291bGQganVzdCBibG9hdCBUUlggY29k
ZS4KCkxldCdzIGtlZXAgdGhpbmdzIHNpbXBsZS4gTGV0IFRSWCBwYXJzZXIganVzdCBwYXJzZSBU
UlguIFVzZSBhbm90aGVyCnBhcnNlciB0byBkZWFsIHdpdGggeW91ciBzcGVjaWZpYyBmbGFzaCBz
cGFjZSBsYXlvdXQuCgoKPiAzLiBEZXRlcm1pbmUgZXh0ZW50cyBvZiB0aGUgZGF0YSAocm9vdGZz
KSBwYXJ0aXRpb24uCj4gCj4gV2hpbGUgc3RpbGwgYSBiaXQgaGFja3kgKGp1c3Qgc2Nhbm5pbmcg
Zm9yd2FyZCBmb3IgVUJJCj4gbWFnaWMpIHdlIGNoZWNrIHdoZXJlIHRoZSByb290ZnMgdm9sdW1l
IGFjdHVhbGx5IGVuZHMsCj4gYW5kIGRvIG5vdCBhc3N1bWUgaXQgZmlsbHMgdGhlIHJlc3Qgb2Yg
dGhlIGZsYXNoIG1lbW9yeS4KPiAKPiA0LiBBZGQgZnJlZSBzcGFjZSBhcyBhIHNlcGFyYXRlIHBh
cnRpdGlvbi4KPiAKPiBCZWZvcmUgdGhpcyBJIGNvdWxkIG5vdCBtb3VudCBteSBVQkkgcm9vdGZz
IGJlY2F1c2UKPiB0aGUgcm9vdGZzIGdldHMgdG9vIGJpZzogYWxsIHJlbWFpbmluZyBzcGFjZSB3
aWxsIHB1dAo+IGludG8gdGhlIHNlY29uZCBkZXRlY3RlZCBwYXJ0aXRpb24gc28gdGhlIFVCSSBw
YXJ0aXRpb24KPiBoYXMgdGhlIHdyb25nIHNpemUgYW5kIHdpbGwgbm90IGF0dGFjaC4gQWZ0ZXIg
dGhpcyBwYXRjaAo+IGl0IG1vdW50cyBqdXN0IGZpbmUuCj4gCj4gVmVuZG9yIGNvZGUgcGFydGl0
aW9uIGRldGVjdGlvbiAoRC1MaW5rIERXTC04NjEwQVApOgo+IAo+IENyZWF0aW5nIDUgTVREIHBh
cnRpdGlvbnMgb24gImJyY21uYW5kIjoKPiAweDAwMDAwMDAwMDAwMC0weDAwMDAwMjgwMDAwMCA6
ICJsaW51eCIKPiAweDAwMDAwMDI4MDAwMC0weDAwMDAwMjgwMDAwMCA6ICJyb290ZnMiCj4gMHgw
MDAwMDI4MDAwMDAtMHgwMDAwMDUwMDAwMDAgOiAibGludXgyIgo+IDB4MDAwMDAyYTgwMDAwLTB4
MDAwMDA1MDAwMDAwIDogInJvb3RmczIiCj4gMHgwMDAwMDUwMDAwMDAtMHgwMDAwMDgwMDAwMDAg
OiAiamZmczIiCj4gCj4gQmVmb3JlIHRoaXMgcGF0Y2g6Cj4gCj4gQ3JlYXRpbmcgMiBNVEQgcGFy
dGl0aW9ucyBvbiAiYnJjbW5hbmQuMCI6Cj4gMHgwMDAwMDAwMDAwMWMtMHgwMDAwMDAyODAwMDAg
OiAibGludXgiCj4gbXRkOiBwYXJ0aXRpb24gImxpbnV4IiBkb2Vzbid0IHN0YXJ0IG9uIGFuIGVy
YXNlL3dyaXRlCj4gICAgYmxvY2sgYm91bmRhcnkgLS0gZm9yY2UgcmVhZC1vbmx5Cj4gMHgwMDAw
MDAyODAwMDAtMHgwMDAwMDgwMDAwMDAgOiAidWJpIgo+IAo+IEFmdGVyIHRoaXMgcGF0Y2g6Cj4g
Cj4gNSB0cnggcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGJyY21uYW5kLjAKPiBDcmVh
dGluZyA1IE1URCBwYXJ0aXRpb25zIG9uICJicmNtbmFuZC4wIjoKPiAweDAwMDAwMDAwMDAwMC0w
eDAwMDAwMDI4MDAwMCA6ICJsaW51eCIKPiAweDAwMDAwMDI4MDAwMC0weDAwMDAwMjgwMDAwMCA6
ICJ1YmkiCj4gMHgwMDAwMDI4MDAwMDAtMHgwMDAwMDJhODAwMDAgOiAibGludXgyIgo+IDB4MDAw
MDAyYTgwMDAwLTB4MDAwMDA1MDAwMDAwIDogInViaTIiCj4gMHgwMDAwMDUwMDAwMDAtMHgwMDAw
MDgwMDAwMDAgOiAiZnJlZSIKClRoaXMgcHJvdmVzIHlvdSdyZSBqdXN0IHRyeWluZyB0byBibG9h
dCBUUlggcGFyc2VyIHdpdGggdmVuZG9yIHNwZWNpZmljCmZsYXNoIHNwYWNlIGxheW91dC4gVGhp
cyBwYXJzZXIgU0hPVUxEIE5PVCBjYXJlIGFib3V0IGV4dHJhIHBhcnRpdGlvbnMKb3IgZnJlZSBz
cGFjZXMgdXNlZCBvdXQgb2YgYWN0dWFsIFRSWC4KCgo+IENjOiBSYWZhxYIgTWnFgmVja2kgPHph
amVjNUBnbWFpbC5jb20+Cj4gQ2M6IEhhdWtlIE1laHJ0ZW5zIDxoYXVrZUBoYXVrZS1tLmRlPgo+
IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
ClNvIHRoaXMgaXMgcmVhbGx5IGEgTk8gZnJvbSBtZS4KCkkgZXh0cmFjZWQgVFJYIHBhcnNlciBm
cm9tIGJjbTQ3eHhwYXJ0IHRvIG1ha2UgaXQgZ2VuZXJpYyAmIHJldXNhYmxlLgpJdCBzZWVtcyB0
byB3b3JrcyB3ZWxsIHRvIG1lLiBTZWUgQXN1cyBSVC1BQzg4VSwgUGhpY29tbSBLMyBhbmQgVFAt
TGluawpBcmNoZXIgcm91dGVycyAoRFRTIGZpbGVzKS4KCldlIGhhdmUgc3VwcG9ydCBmb3Igc3Vi
cGFydGl0aW9ucyBpbiBNVEQgc28gdGhhdCdzIGEgd2F5IHRvIGdvLgoKU28gcGxlYXNlIGp1c3Qg
dXNlL3dyaXRlIGEgcHJvcGVyIHBhcnNlciBmb3IgeW91ciBkZXZpY2UgZmxhc2ggc3BhY2UuCk1h
a2UgaXQgcmVnaXN0ZXIgImZpcm13YXJlIiAob3Igc2ltaWxhcikgTVREIHBhcnRpdGlvbiBmb3Ig
YWN0dWFsIFRSWApjb250ZW50LiBUaGVuIGxldCBUUlggcGFyc2VyIGRvIGl0cyBqb2IuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
