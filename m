Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE3C83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtA80NPDJEHOyHl0ke+b6UsGQjWa1PjG+mGdbx+7nww=; b=2Zidww5liqW7bd
	f/1GuFDAUWbRu492YC42GoEzCUnIOFTiw3fxI227cMn6Vy+iTL6b0Ht7ndHXvM1zTdQHs/Zg//Bwv
	NkJlBbtOT1U94+4rdnZi8ocmG2zrQNYj4rvuflBc9VxJAUaf5seZnFfmsyXOBC52yGdwoQDO1A8zC
	aWDOYdn0urE8HD/TbwIsHLK7eoKMBNu0Qtgc0IRT0rWqGTtQ+3tSUxpcdH2uMG1VKI7kaIrFU+CZ5
	/7ZB7UCJc2ua9yWi/WBisvY/yJ5MHwHfwEX4w3ioDugDiXRWtwQrrIe+YtD2rRLVx85vRtWrKOxEO
	3aDjRv6nFN3npjFNxDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMok-00Djiv-1K;
	Wed, 30 Aug 2023 15:09:14 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMoi-00DjiS-0G
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 15:09:13 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58fc4d319d2so64958857b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2023 08:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408150; x=1694012950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k9P0qVTFYIfwM1/2tKE8Wk464EbVW1AN+obFoUzobM=;
        b=hV/qW2M/bGEFp9wCxcJ1VFUoPxsk/uG+6U7ZzlSmhIm7r7A1z3Xu7g2/gxY7GPgiB+
         lCyhEYUtaTUsQaQrPMZM+9ovGWB0x8jBUjR4y0JoUt+M7tzAOaMQy1XeM04vUc/SN/51
         pNc+LsqHWWL/k55PRafv6OASSqw13ZYfcRP6Zf24ROnz91ufIFB7Zi0vZM1KUYhxlqYY
         Q7Qdeq4CIMP15LzzsWI10r1Ist4lxAn086SY18IGXIfcb2qfhQSIDs/D9WCAuMRFqShA
         vjIbqY9w3XIu6sMVKIE89vaUnJRQoiq2wFnDjPqoq6a6B7HtEpjMKPqXJWywMbagD4Gy
         aAIg==
X-Gm-Message-State: AOJu0Yy9vY6eJWP/Wo9Ca/rIXcnx8AnS06pI9jg1/g48jUICen2/b8R9
	93SLlrUYrjYf6yzkG/5OlO/+NKLrVorhsQ==
X-Google-Smtp-Source: AGHT+IETTX0HnVvfYkda/H8nGEp3m/3VgBK4CyW+e29sK7DeFDuN9IDmBco/RKYLFzMhqZUucjQ7mw==
X-Received: by 2002:a81:8603:0:b0:583:d1fa:1fc4 with SMTP id w3-20020a818603000000b00583d1fa1fc4mr2552995ywf.26.1693408149780;
        Wed, 30 Aug 2023 08:09:09 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id r189-20020a0dcfc6000000b0058fb9863fe7sm3293155ywd.103.2023.08.30.08.09.09
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 08:09:09 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7b79a4899bso1575395276.2
        for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2023 08:09:09 -0700 (PDT)
X-Received: by 2002:a25:e74a:0:b0:d4e:3ffe:79d4 with SMTP id
 e71-20020a25e74a000000b00d4e3ffe79d4mr2035879ybh.61.1693408149175; Wed, 30
 Aug 2023 08:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Aug 2023 17:08:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
Message-ID: <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mark Brown <broonie@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, 
	linux-spi <linux-spi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_080912_117872_71823F80 
X-CRM114-Status: GOOD (  29.04  )
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

SGkgQmlqdSwKCkNDIGh5cGVyYnVzLCBzcGkKCk9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDQ6NTji
gK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOgo+IEN1cnJl
bnRseSwgUlovRzJMLWFsaWtlIFNvQ3MgdXNlIDIgZGlmZmVyZW50IFNQSSBzZXJpYWwgZmxhc2gg
bWVtb3JpZXMKPiAgMSkgQVQyNVFMMTI4QSAgZW1iZWRkZWQgaW4gUlove0cyVUwsRml2ZX0gU01B
UkMgRVZLcwo+ICAyKSBNVDI1UVU1MTJBQiBlbWJlZGRlZCBpbiBSWi97RzJMLEcyTEMsVjJMfSBT
TUFSQyBFVktzCj4KPiBBcyBwZXIgc2VjdGlvbiA4LjE0IG9uIHRoZSBBVDI1UUwxMjhBIGhhcmR3
YXJlIG1hbnVhbCwKPiBJTzEuLklPMyBtdXN0IGJlIHNldCB0byBIaS1aIHN0YXRlIGZvciB0aGlz
IGZsYXNoIGZvciBmYXN0IHJlYWQgcXVhZCBJTy4KPiBTbmlwcGV0IGZyb20gSFcgbWFudWFsIHNl
Y3Rpb24gOC4xNDoKPiBUaGUgdXBwZXIgbmliYmxlIG9mIHRoZSBNb2RlKE03LTQpIGNvbnRyb2xz
IHRoZSBsZW5ndGggb2YgdGhlIG5leHQgRkFTVAo+IFJlYWQgUXVhZCBJTyBpbnN0cnVjdGlvbiB0
aHJvdWdoIHRoZSBpbmNsdXNpb24gb3IgZXhjbHVzaW9uIG9mIHRoZSBmaXJzdAo+IGJ5dGUgaW5z
dHJ1Y3Rpb24gY29kZS4gVGhlIGxvd2VyIG5pYmJsZSBiaXRzIG9mIHRoZSBNb2RlKE0zLTApIGFy
ZSBkb24ndAo+IGNhcmUuIEhvd2V2ZXIsIHRoZSBJTyBwaW5zIG11c3QgYmUgaGlnaC1pbXBlZGFu
Y2UgYmVmb3JlIHRoZSBmYWxsaW5nIGVkZ2UKPiBvZiB0aGUgZmlyc3QgZGF0YSBvdXQgY2xvY2su
Cj4KPiBBcyBwZXIgdGhlIEZpZ3VyZSAyMDogUVVBRCBJTlBVVC9PVVRQVVQgRkFTVCBSRUFEIG9u
IE1UMjVRVTUxMkFCIG1lbnRpb25zCj4gSU8xLi5JTzIgdG8gYmUgaW4gSGktWiBzdGF0ZSBhbmQg
SU8zIGluICcxJyBzdGF0ZQo+Cj4gQWRkIGEgdmFyaWFibGUgaW8zX2Z2IHRvIHN0cnVjdCBycGNp
Zl9wcml2IGFuZCBjaGVjayB0aGUgY2hpbGQKPiBub2RlIGNvbXBhdGlibGUgdmFsdWUgdG8gZGV0
ZWN0IG1pY3JvbiBmbGFzaCBhbmQgc2V0IElPMS4uSU8zIHN0YXRlcwo+IGJhc2VkIG9uIGZsYXNo
IHR5cGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpJIGd1ZXNzIHRoaXMgaXNzdWUgaXMgbm90
IHVuaXF1ZSB0byBSZW5lc2FzIHBsYXRmb3Jtcy4uLgoKPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9y
ZW5lc2FzLXJwYy1pZi5jCj4gKysrIGIvZHJpdmVycy9tZW1vcnkvcmVuZXNhcy1ycGMtaWYuYwo+
IEBAIC0xODksNiArMTg5LDcgQEAgc3RydWN0IHJwY2lmX3ByaXYgewo+ICAgICAgICAgdTMyIGVu
YWJsZTsgICAgICAgICAgICAgLyogRFJFTlIgb3IgU01FTlIgKi8KPiAgICAgICAgIHUzMiBkdW1t
eTsgICAgICAgICAgICAgIC8qIERSRE1DUiBvciBTTURNQ1IgKi8KPiAgICAgICAgIHUzMiBkZHI7
ICAgICAgICAgICAgICAgIC8qIERSRFJFTlIgb3IgU01EUkVOUiAqLwo+ICsgICAgICAgdTMyIGlv
M19mdjsKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHJwY2lmX2luZm8gcnBjaWZfaW5m
b19yOGE3Nzk2ID0gewo+IEBAIC0zNjcsNyArMzY4LDggQEAgaW50IHJwY2lmX2h3X2luaXQoc3Ry
dWN0IGRldmljZSAqZGV2LCBib29sIGh5cGVyZmxhc2gpCj4gICAgICAgICAgICAgICAgIHJlZ21h
cF91cGRhdGVfYml0cyhycGMtPnJlZ21hcCwgUlBDSUZfQ01OQ1IsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSUENJRl9DTU5DUl9NT0lJTygzKSB8IFJQQ0lGX0NNTkNSX0lP
RlYoMykgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlBDSUZfQ01OQ1Jf
QlNaKDMpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlBDSUZfQ01OQ1Jf
TU9JSU8oMSkgfCBSUENJRl9DTU5DUl9JT0ZWKDIpIHwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFJQQ0lGX0NNTkNSX01PSUlPKDEpIHwgUlBDSUZfQ01OQ1JfSU8wRlYoMikg
fAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUlBDSUZfQ01OQ1JfSU8yRlYo
MykgfCBycGMtPmlvM19mdiB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBS
UENJRl9DTU5DUl9CU1ooaHlwZXJmbGFzaCA/IDEgOiAwKSk7Cj4gICAgICAgICBlbHNlCj4gICAg
ICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhycGMtPnJlZ21hcCwgUlBDSUZfQ01OQ1Is
Cj4gQEAgLTc3NCw2ICs3NzYsMTIgQEAgc3RhdGljIGludCBycGNpZl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAg
ICAgfQo+Cj4gKyAgICAgICBpZiAocnBjLT5pbmZvLT50eXBlID09IFJQQ0lGX1JaX0cyTCAmJgoK
V291bGRuJ3QgdGhpcyBhcHBseSB0byBub24tUlovRzJMIHN5c3RlbXMsIHRvbz8KCj4gKyAgICAg
ICAgICAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZmxhc2gsICJtaWNyb24sbXQyNXF1NTEyYSIp
KQo+ICsgICAgICAgICAgICAgICBycGMtPmlvM19mdiA9IFJQQ0lGX0NNTkNSX0lPM0ZWKDEpOwo+
ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBycGMtPmlvM19mdiA9IFJQQ0lGX0NNTkNS
X0lPM0ZWKDMpOwo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
