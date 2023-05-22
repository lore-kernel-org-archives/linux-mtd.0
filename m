Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D85CC7EE2A
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUvCAYAvmAb9PiAgHM38lZRBx2Q4rL3l0/c86Nml7DY=; b=p7E50tnjgzS5vv
	6Zn0RPkZETPDwuZ5sL9LD+ZcN9jLFDdYbqDksOLVArZJmrVZs6dUpcjbnY95Mn3a7sav5iFPVthf2
	TP3PIPCSrS/S3Vaz6HPSmHsloHs4kDWH2EjOzWRdqCDq/Ljoch+pnp5Ovp3YaSLPQtHHlD/zHZQTC
	lwoVBGV4hTczip9yHOTwoX8hCn9TniaEXPfaxOJJbtvqlmLCeC6Hjka+v83dq32td9rD8Qccx3cd0
	gmJ0VZfRml7vpk3HZ7HlKYE16g3ZbliI4uwm4B6VXRQfw0fZLuee+1kwtk+9toOZ8q+CdBgCC3CRI
	+XXndYZUdsjpuxtmx31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11k6-005rK9-0h;
	Mon, 22 May 2023 09:22:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11k2-005rIu-2L
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 09:22:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96fffe11714so75014866b.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 May 2023 02:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684747327; x=1687339327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWgSPwQBspND+l5FgxYrCxjRrLfV4tAi/ncxGD1tzmY=;
        b=FkHTI+fsiFLIfDjjZ5x1vzvdzg/Inx3IhlSoCyRzBEtiI70M5Nj+tA+uHH2VbWzUpL
         fskgMO/+VQoj9OTYF1PLxgBzIfdKclOsHauE2Zw81v2nIT7oW2PG8NC6tNJE0TQht1Xd
         yf8D413LRuH8vlGkP5ACgqTW18Yrebli52a3/XIfkAvYCAY/5ST6JOW5lDqZnI6UE423
         hSNEh12LVhDuP26ei7qxgD3UMcF82/amjXo+LbwF/3eW0VUpbfNNL+D4JrtFcDZIrWCo
         Dka81MifnVt59oqHEfppyf6i41K5blguutbWMCsUgJpSI0jGoiHe8QqgFG9cTha+bMXJ
         Z+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684747327; x=1687339327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWgSPwQBspND+l5FgxYrCxjRrLfV4tAi/ncxGD1tzmY=;
        b=J4U3/jms1sUWF/lGEuSTfQ8JcGUtXA055osBQnk1/8arnJmAYA9u5fKyssczcRPgMo
         pzqMN60ObY/enZ8OzX10RCowlX2gS6zXI02EY98+OP55kh82w6ytUG0SYG9K8pYF2s24
         chhPhUGTb30sgKJ9VqIEgxRiKHe+Jk7wyZH9T17GcEmZFYWQTQFXQQUT5FvuLGCPOvJv
         +NANvRO0bkOZxtMUqfCD2/e+zbYzV7t59Py8PoYMBRc1hDMlr+sP13362BXFsGH8fpD+
         Jka5bSQK9O8DKXPJNatV/CSrDmizv3am6tdf+QFGyqhqkRxrqKZlXs7bvvmHYF9iG8yD
         b6nw==
X-Gm-Message-State: AC+VfDya76qLco5vkhUGCqXPLVqnfn1W5Ef9MMlctibTMKpiUvlZyBS2
	G/Z0a14cm+BD+Z28EW0MtVS4CQ==
X-Google-Smtp-Source: ACHHUZ4llMsUm3mMQoEICKe9reTv0ubUpgf7y1rkTtZnCilVcgETeccWP3R23LSJ4AHV9kWAwFh8hw==
X-Received: by 2002:a17:907:1611:b0:966:37b2:7354 with SMTP id hb17-20020a170907161100b0096637b27354mr10227963ejc.31.1684747327487;
        Mon, 22 May 2023 02:22:07 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b009663cf5dc3bsm2892334ejb.53.2023.05.22.02.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 02:22:07 -0700 (PDT)
Message-ID: <0c8a54ae-7f32-2614-9717-a00fe561513e@linaro.org>
Date: Mon, 22 May 2023 10:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, todd.e.brandt@intel.com, vigneshr@ti.com,
 pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 bagasdotme@gmail.com, regressions@lists.linux.dev, joneslee@google.com,
 Todd Brandt <todd.e.brandt@linux.intel.com>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
 <20230522102953.2fdf2b02@xps-13>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230522102953.2fdf2b02@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_022210_765388_6DFB882A 
X-CRM114-Status: GOOD (  30.00  )
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

CgpPbiA1LzIyLzIzIDA5OjI5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFR1ZG9yLAoKSGks
IE1pcXVlbCwKCj4gCj4gdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIFRodSwgMTgg
TWF5IDIwMjMgMDg6NTQ6NDAgKzAwMDA6Cj4gCj4+IFdlIGZhaWxlZCB0byBpbml0aWFsaXplIG5f
YmFua3MgZm9yIHNwaS1ub3ItZ2VuZXJpYyBmbGFzaGVzLCB3aGljaAo+PiBjYXVzZWQgYSBkZXZp
ZGUgYnkgemVybyB3aGVuIGNvbXB1dGluZyB0aGUgYmFua19zaXplLgo+Pgo+PiBCeSBkZWZhdWx0
IHdlIGNvbnNpZGVyIHRoYXQgYWxsIGNoaXBzIGhhdmUgYSBzaW5nbGUgYmFuay4gSW5pdGlhbGl6
ZQo+PiB0aGUgZGVmYXVsdCBudW1iZXIgb2YgYmFua3MgZm9yIHNwaS1ub3ItZ2VuZXJpYyBmbGFz
aGVzLiBFdmVuIGlmIHRoZQo+PiBidWcgaXMgZml4ZWQgd2l0aCB0aGlzIHNpbXBsZSBpbml0aWFs
aXphdGlvbiwgY2hlY2sgdGhlIG5fYmFua3MgdmFsdWUKPj4gYmVmb3JlIGRpdmlkaW5nIHNvIHRo
YXQgd2UgbWFrZSBzdXJlIHRoaXMga2luZCBvZiBidWcgd29uJ3Qgb2NjdXIgYWdhaW4KPj4gaWYg
c29tZSBvdGhlciBzdHJ1Y3QgaW5zdGFuY2UgaXMgY3JlYXRlZCB1bmluaXRpYWxpemVkLgo+Pgo+
PiBTdWdnZXN0ZWQtYnk6IFRvZGQgQnJhbmR0IDx0b2RkLmUuYnJhbmR0QGxpbnV4LmludGVsLmNv
bT4KPj4gUmVwb3J0ZWQtYnk6IFRvZGQgQnJhbmR0IDx0b2RkLmUuYnJhbmR0QGxpbnV4LmludGVs
LmNvbT4KPj4gQ2xvc2VzOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dp
P2lkPTIxNzQ0OAo+PiBGaXhlczogOWQ2YzVkNjRmMDI4ICgibXRkOiBzcGktbm9yOiBJbnRyb2R1
Y2UgdGhlIGNvbmNlcHQgb2YgYmFuayIpCj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIzMDUxNjIyNTEwOC4yOTE5NC0xLXRvZGQuZS5icmFuZHRAaW50ZWwuY29tLwo+PiBT
aWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+
IC0tLQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA1ICsrKystCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
Cj4+IGluZGV4IDBiYjBhZDE0YTJmYy4uNWYyOWZhYzg2NjlhIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+PiBAQCAtMjAxOCw2ICsyMDE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX21h
bnVmYWN0dXJlciAqbWFudWZhY3R1cmVyc1tdID0gewo+PiAgCj4+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3BpX25vcl9nZW5lcmljX2ZsYXNoID0gewo+PiAgCS5uYW1lID0gInNw
aS1ub3ItZ2VuZXJpYyIsCj4+ICsJLm5fYmFua3MgPSAxLAo+IAo+IEkgZGVmaW5pdGVseSBtaXNz
ZWQgdGhhdCBzdHJ1Y3R1cmUuCj4gCj4+ICAJLyoKPj4gIAkgKiBKRVNEMjE2IHJldiBBIGRvZXNu
J3Qgc3BlY2lmeSB0aGUgcGFnZSBzaXplLCB0aGVyZWZvcmUgd2UgbmVlZCBhCj4+ICAJICogc2Fu
ZSBkZWZhdWx0Lgo+PiBAQCAtMjkyMSw3ICsyOTIyLDggQEAgc3RhdGljIHZvaWQgc3BpX25vcl9s
YXRlX2luaXRfcGFyYW1zKHN0cnVjdCBzcGlfbm9yICpub3IpCj4+ICAJaWYgKG5vci0+ZmxhZ3Mg
JiBTTk9SX0ZfSEFTX0xPQ0sgJiYgIW5vci0+cGFyYW1zLT5sb2NraW5nX29wcykKPj4gIAkJc3Bp
X25vcl9pbml0X2RlZmF1bHRfbG9ja2luZ19vcHMobm9yKTsKPj4gIAo+PiAtCW5vci0+cGFyYW1z
LT5iYW5rX3NpemUgPSBkaXY2NF91NjQobm9yLT5wYXJhbXMtPnNpemUsIG5vci0+aW5mby0+bl9i
YW5rcyk7Cj4+ICsJaWYgKG5vci0+aW5mby0+bl9iYW5rcyA+IDEpCj4+ICsJCXBhcmFtcy0+YmFu
a19zaXplID0gZGl2NjRfdTY0KHBhcmFtcy0+c2l6ZSwgbm9yLT5pbmZvLT5uX2JhbmtzKTsKPiAK
PiBJJ20gZmluZSB3aXRoIHRoZSBjaGVjayBhcyBpdCBpcyB3cml0dGVuIGJlY2F1c2UgaXQgYWxz
byBsb29rIGxpa2UgYW4KPiBvcHRpbWl6YXRpb24sIGJ1dCBiYW5rX3NpemUgc2hvdWxkIG5ldmVy
IGJlIDAgb3RoZXJ3aXNlIGl0J3MgYSByZWFsIGJ1ZwoKYmFua19zaXplIHdhcyBpbnRyb2R1Y2Vk
IGp1c3QgZm9yIGNoaXBzIGZlYXR1cmluZyBzZXZlcmFsIGJhbmtzLCBidXQgd2UKbWFkZSB0aGlz
IGZpZWxkIG1hbmRhdG9yeSBmb3IgYWxsIGZsYXNoZXMsIHJlZ2FyZGxlc3Mgb2YgdGhlaXIgdHlw
ZS4gSQpmaW5kIHRoaXMgcmVzdHJpY3Rpb24gdW5uZWNlc3NhcnksIGJlY2F1c2Ugd2UgY2FuIGRp
ZmZlcmVudGlhdGUgdGhlIFJXVwpmbGFzaGVzIGJ5IGNoZWNraW5nIHRoZSBTTk9SX0ZfUldXIGZs
YWcuIFNvIHRoZSBhbHRlcm5hdGl2ZSB0byB0aGlzCnBhdGNoIGlzIHRvIHJlbW92ZSB0aGUgbl9i
YW5rcyByZXN0cmljdGlvbiBhbmQgc2V0IGl0IGp1c3QgZm9yIHRoZSBSV1cKZmxhc2hlcy4gSSB0
aGluayBJIHByZWZlciB0aGlzLCBidXQga2VlcCBpbiBtaW5kIHRoYXQgSSBuZXZlciByZWFkIGEg
UldXCmZsYXNoJ3MgZGF0YXNoZWV0LCBub3QgcHVibGljbHkgYXZhaWxhYmxlLCBzbyB0aGUgZGVj
aXNpb24gaXMgaW4geW91cgpjb3VydC4gSGFwcHkgdG8gbWFrZSBhIHBhdGNoLgoKPiB0aGF0IG11
c3QgYmUgY2F0Y2ggYW5kIGZpeGVkLiBXZSBkbyBub3Qgd2FudCB1bmluaXRpYWxpemVkIGJhbmtf
c2l6ZSdzLj4KPj4gIH0KPj4gIAo+PiAgLyoqCj4+IEBAIC0yOTg3LDYgKzI5ODksNyBAQCBzdGF0
aWMgdm9pZCBzcGlfbm9yX2luaXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IHNwaV9ub3IgKm5vcikK
Pj4gIAkvKiBTZXQgU1BJIE5PUiBzaXplcy4gKi8KPj4gIAlwYXJhbXMtPndyaXRlc2l6ZSA9IDE7
Cj4+ICAJcGFyYW1zLT5zaXplID0gKHU2NClpbmZvLT5zZWN0b3Jfc2l6ZSAqIGluZm8tPm5fc2Vj
dG9yczsKPj4gKwlwYXJhbXMtPmJhbmtfc2l6ZSA9IHBhcmFtcy0+c2l6ZTsKPj4gIAlwYXJhbXMt
PnBhZ2Vfc2l6ZSA9IGluZm8tPnBhZ2Vfc2l6ZTsKPiAKPiBXZSBhY3R1YWxseSBkaXNjYXJkZWQg
dGhhdCBsaW5lIGluIGEgcHJldmlvdXMgZGlzY3Vzc2lvbjoKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1tdGQvMjAyMzAzMzExOTQ2MjAuODM5ODk5LTEtbWlxdWVsLnJheW5hbEBib290
bGluLmNvbS9ULyNtY2I0ZjkwZjdjYTQ4ZmZlM2Q5ODM4YjJhYzZmNzRlNDQ0NjBjNTFiZAo+IAo+
IEknbSBmaW5lIHRvIHJlLWFkZCBpdCB0aG91Z2gsIGl0IGRvZXMgbm90IGh1cnQuCgp3ZSB3b3Vs
ZCBnZXQgcmlkIG9mIHRoaXMgaW5pdCBhcyB3ZWxsIHdpdGggbXkgc3VnZ2VzdGlvbi4KCktlZXAg
aW4gbWluZCB0aGF0IHRoZSBidWcgd2FzIGludHJvZHVjZWQgaW4gNi40LCBzbyB3ZSdsbCBoYXZl
IHRvIGZpeAp0aGlzIGZhc3QsIGxldCdzIGNvbWUgdG8gYW4gYWdyZWVtZW50LgoKQ2hlZXJzLAp0
YQo+IAo+PiAgCj4+ICAJaWYgKCEoaW5mby0+ZmxhZ3MgJiBTUElfTk9SX05PX0ZSKSkgewo+IAo+
IFJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+
IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
