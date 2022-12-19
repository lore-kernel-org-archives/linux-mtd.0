Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E8CC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Dec 2022 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tAnB1KEUJ9pXRweq+Dmemxk5Jr/CjuYM+fXyHLw8vs=; b=cY/Q5OLkLKKdyW
	yUWqC2MQ0oxM65aZsx6hwWmVFMc3NDpfp9zkImk1KpH61HbHpkVoq10W+KMWNgM5SSXrCLH0/GMQ7
	NhLPk4KZJGqn+tTgm0tYUlADYD5ZsjEqvWC3EwSjxdfRdgOJAzxXSn9jiNGRFViK/9tc5LXGQ/ZM9
	Jaxa/fuODkYUYaYsdurX/RO/cac+YNZjf/5jUSwVPx2gf4ELvSdA1kJWgErKuX6dbr50x+pcWwfaV
	7pCzaYDOlCaxLA+lvBDdbmzI67kZf7hJHOP9xbjIY9QjNziiMOITyN1rDo6JhfYuy5uy3HdU0xwih
	9YOG3mojYotBrlAxcdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JFu-00GG6r-O2; Mon, 19 Dec 2022 16:44:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7HpM-00FDJG-L7
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2022 15:13:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d7so9289348pll.9
        for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2022 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AXVvNqpaKog0+KoAAgFUzZQUXXp78Pzo7uIDvg6rlJ4=;
        b=J64xI24z4FcdI0Ztr8D4bUf2q4sD4l6AJnBJNQ8rBvS8Ixlg4tGZkWme7m5Sy68j4T
         pM1QwgCTwACTKC8fX7rN1in9CecRGSG4enPoy47rcIdG5VaPXeI5icRMc2ef5zPh7kCt
         1luO6xcrWkPIMpIiAylObPP9T6FJoBnthcLRlNpN5c+OQAhr7rm160EvZ2TMtCliDYTY
         ry+kp3wBVjhvlXYm63uXz7uUXYOWkPv+usQ9fceTc0mvgQw33nRjbkRg5KXyx2jhcY7B
         /FTwyrNmksqBH+gAXGoD86Z/dL9tKii6bvjDQBI3r7cuyeUcekM1D4WROrRyBfqrkdwm
         ne4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXVvNqpaKog0+KoAAgFUzZQUXXp78Pzo7uIDvg6rlJ4=;
        b=tGaDBVIe/KBtXBlVzrquRviz3X7NK2Z9TboeZo/CVqSUtF+VWnT30VUcMh+wb5jrcO
         dG1Qx8drCdlTyCNxptQ34kcH8DPHfRP8aRDoOHcli4xqjihg1pUvJlD6Pi3+jMZyk4sn
         acfbRMftNJyrXrwuD0YAYPhMrrkpwBED+Ic/0zb1xkfmHc2V72U4yJmq+xRI9TGF6ed7
         ebZBooLFoIGHjnPfvPpBQY2yDGK8jpF9KQCaUAT3lgz8W5HIUjVawr51oaNRcdN9bXCN
         6lSYnTrpH5qA3k9mNfBIlYO4jwhya2Z7hweAC+YVafADAfqdp4RnGpanvzkV6nGkDuSv
         joQg==
X-Gm-Message-State: ANoB5plG9gg5ejfvGtfCEMWZmm7gH5TIU1XDTvp5bOkrAVRLWyzHCTxi
	3qyrykQUXuqFfulHVGe01R0=
X-Google-Smtp-Source: AA0mqf5SdKgy2/AFn3qxKx6jplH4Dg71faboz2VgI2JNAGtTefVoc4ita7xmyI9S9Ri+30z7u1mukw==
X-Received: by 2002:a17:90b:3c0d:b0:219:10dd:a389 with SMTP id pb13-20020a17090b3c0d00b0021910dda389mr41039164pjb.31.1671462777584;
        Mon, 19 Dec 2022 07:12:57 -0800 (PST)
Received: from [192.168.122.100] (36-2-101-155.tokyo.ap.gmo-isp.jp. [36.2.101.155])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090a66c400b001f94d25bfabsm9257936pjl.28.2022.12.19.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 07:12:56 -0800 (PST)
Message-ID: <d68c9137-f485-e0a0-dfc3-c72c26d0433a@gmail.com>
Date: Tue, 20 Dec 2022 00:12:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
From: Tokunori Ikegami <ikegami.t@gmail.com>
Subject: Re: [PATCH] mtd: cfi: allow building spi-intel standalone
To: Arnd Bergmann <arnd@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221215163950.649791-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20221215163950.649791-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_071316_756791_35CEC995 
X-CRM114-Status: GOOD (  20.97  )
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

Ck9uIDIwMjIvMTIvMTYgMTozOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJl
cmdtYW5uPGFybmRAYXJuZGIuZGU+Cj4KPiBXaGVuIE1URCBvciBNVERfQ0ZJX0dFT01FVFJZIGlz
IGRpc2FibGVkLCB0aGUgc3BpLWludGVsIGRyaXZlcgo+IGZhaWxzIHRvIGJ1aWxkLCBhcyBpdCBp
bmNsdWRlcyB0aGUgc2hhcmVkIENGSSBoZWFkZXI6ClRoZSBoZWFkZXIgZmlsZSBsaW51eC9tdGQv
Y2ZpLmggaXMgaW5jbHVkZWQgYnkgdGhlIGhlYWQgZmlsZSAKbGludXgvbXRkL3NwaS1ub3IuaCBz
byBzZWVtcyB0aGUgd2FybmluZyBjYXVzZWQuCklzIGl0IHJlYWxseSBuZWNlc3NhcnkgdG8gaW5j
dWx1ZGUgbGludXgvbXRkL2NmaS5oIGZyb20gbGludXgvbXRkL3NwaS1ub3IuaD8KKEl0IHNlZW1z
IHRoYXQgaXQgY2FuIGJlIHJlc29sdmVkIHRoZSBpc3N1ZSBieSByZW1vdmluZyB0aGUgaW5jbHVk
aW5nIApjZmkuaCBmcm9tIHNwaS1ub3IuaCBpZiB1bm5lY2Vzc2FyeS4pCj4KPiBpbmNsdWRlL2xp
bnV4L210ZC9jZmkuaDo2MjoyOiBlcnJvcjogI3dhcm5pbmcgTm8gQ09ORklHX01URF9DRklfSXgg
c2VsZWN0ZWQuIE5vIE5PUiBjaGlwIHN1cHBvcnQgY2FuIHdvcmsuIFstV2Vycm9yPWNwcF0KPiAg
ICAgNjIgfCAjd2FybmluZyBObyBDT05GSUdfTVREX0NGSV9JeCBzZWxlY3RlZC4gTm8gTk9SIGNo
aXAgc3VwcG9ydCBjYW4gd29yay4KPgo+IFVzZSBhbiAjaWZkZWYgaGVyZSB0byBndWFyZCB0aGUg
c2V0dGluZ3Mgc28gdGhlIGhlYWRlciBjYW4gYmUgaW5jbHVkZWQKPiBpbiBhbGwgY29uZmlndXJh
dGlvbnMuCj4KPiBGaXhlczogZTIzZTVhMDVkMWZkICgibXRkOiBzcGktbm9yOiBpbnRlbC1zcGk6
IENvbnZlcnQgdG8gU1BJIE1FTSIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubjxhcm5k
QGFybmRiLmRlPgo+IC0tLQo+ICAgaW5jbHVkZS9saW51eC9tdGQvY2ZpLmggfCAzICsrLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL2NmaS5oIGIvaW5jbHVkZS9saW51eC9tdGQvY2ZpLmgK
PiBpbmRleCBkODhiYjU2YzE4ZTIuLjBlODdiNmUyZmFhZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2xpbnV4L210ZC9jZmkuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXRkL2NmaS5oCj4gQEAgLTE1
LDYgKzE1LDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9tdGQvY2ZpX2VuZGlhbi5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L210ZC94aXAuaD4KPiAgIAo+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfTVRE
KQoKSXMgaXQgZW5vdWdoIHRvIGNoZWNrIG9ubHkgQ09ORklHX01URCBoZXJlIGFzIG5vdCBuZWNl
c3NhcnkgdG8gY2hlY2sgaWYgCk1URF9DRklfR0VPTUVUUlkgYWxzbz8KQnkgdGhlIHdheSBpdCBz
ZWVtcyBhbHNvIHRoYXQgaXQgaXMgbmVlZGVkIHRvIHVzZSAjaWZkZWYgb25seSBmb3IgdGhlIApj
ZmlfaW50ZXJsZWF2ZSB3YXJuaW5nIGNoZWNraW5nIGFzIGJlbG93LgoKI2lmIElTX0VOQUJMRUQo
Q09ORklHX01URCkgJiYgSVNfRU5BQkxFRChDT05GSUdfTVREX0NGSV9HRU9NRVRSWSkKI2lmbmRl
ZiBjZmlfaW50ZXJsZWF2ZQojd2FybmluZyBObyBDT05GSUdfTVREX0NGSV9JeCBzZWxlY3RlZC4g
Tm8gTk9SIGNoaXAgc3VwcG9ydCBjYW4gd29yay4Kc3RhdGljIGlubGluZSBpbnQgY2ZpX2ludGVy
bGVhdmUodm9pZCAqY2ZpKQp7CiDCoMKgIMKgQlVHKCk7CiDCoMKgIMKgcmV0dXJuIDA7Cn0KI2Vu
ZGlmIC8qIGNmaV9pbnRlcmxlYXZlICovCiNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19NVEQp
ICYmIElTX0VOQUJMRUQoQ09ORklHX01URF9DRklfR0VPTUVUUlkpICovCgpOb3RlOiBUaGUgY2Zp
X2ludGVybGVhdmUgd2FybmluZyBjaGVja2luZyB3YXMgaW1wbGVtZW50ZWQgYnkgdGhlIApmb2xs
b3dpbmcgY29tbWl0LgogwqAgMjQxNjUxZDA0ZDY3ICgiW01URF0gRml4IENGSSBidWlsZCBlcnJv
ciB3aGVuIG5vIG1hcCB3aWR0aCBvciAKaW50ZXJsZWF2ZSBzdXBwb3J0ZWQiKQoKPiAgICNpZmRl
ZiBDT05GSUdfTVREX0NGSV9JMQo+ICAgI2RlZmluZSBjZmlfaW50ZXJsZWF2ZShjZmkpIDEKPiAg
ICNkZWZpbmUgY2ZpX2ludGVybGVhdmVfaXNfMShjZmkpIChjZmlfaW50ZXJsZWF2ZShjZmkpID09
IDEpCj4gQEAgLTg4LDcgKzg5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgY2ZpX2ludGVybGVhdmVf
c3VwcG9ydGVkKGludCBpKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAl9Cj4gICB9Cj4gLQo+ICsjZW5k
aWYKPiAgIAo+ICAgLyogTkI6IHRoZXNlIHZhbHVlcyBtdXN0IHJlcHJlc2VudHMgdGhlIG51bWJl
ciBvZiBieXRlcyBuZWVkZWQgdG8gbWVldCB0aGUKPiAgICAqICAgICBkZXZpY2UgdHlwZSAoeDgs
IHgxNiwgeDMyKS4gIEVnLiBhIDMyIGJpdCBkZXZpY2UgaXMgNCB4IDggYnl0ZXMuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
