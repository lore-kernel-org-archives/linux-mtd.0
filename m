Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF3EC25B6B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWJ3L7ftLPKTM6Si4DHeWEY2jaSkzBABA06U5AYBRSw=; b=Kfq2R22l+nerHn
	VnbEoHsa8kwEnRV7yYhTLzxELzUyYzJACk/s7369Y7SfdoHtQhomhm4f/1TIZlJGIwU6rhen8DOO3
	U9LNnXAsnjcPqa95vPyQbeMT+oCCVdsTuTq6Hl3zArAPxevWhBRwEYZAZ3b1RlPuchj8SWA8ndmu8
	vJ5aLlLiSsBOBb8Zm8okAQw99cVZDxRgYZegCmnM7LOLE4gNGkrg0bc5RcVW8xRpe0w1e9aaN69Nq
	fqk3LmHBCxssjLKN7cwvRgJIj3gStdUXQVyplj/qYotl77JXXzOXyKK3qXFAPbM7MwuvlHT3I/G+l
	CorRYsbTvIK3mdzfAUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhnR-00Cn0Q-0a;
	Wed, 25 Oct 2023 17:35:57 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhnN-00Cmzs-0w
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 17:35:56 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ba8eb7e581so1519597b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698255351; x=1698860151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDbcdoMstFhhq+PKrsKbBAuqeHsZ2DlCaDh6t2xfIQw=;
        b=RuaDxQElxhWrl9cvA6CSOhDrLpeGiIJAroY5HUaLKVF20qIy2PrzzYgYsO4wi2toyp
         x1xMbTFBmNdVvSP74Eq7wkfqVvaWrgHGiqNam4i6mAMAlaXoaVBP07tYFoZQHbVq0ecp
         X758zMvd6U4ZtuxTacRcUT5srXW4lkdn+G2LTmdmvWwvtMY2FFP4nRZ6t8EVc8v6fIYO
         IYJiPGxkbW3iWToZcK9ef3N25iWVKilAAHRi6EenKvKwgxC3FSzWWfY9RL6YX2CtY6IM
         AWzSptMuYVlvzL2KXqibmBtI3biJ8aLPendCx0QB79YMOo366jiguGS/S9MiV4VM2LeX
         Te2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698255351; x=1698860151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDbcdoMstFhhq+PKrsKbBAuqeHsZ2DlCaDh6t2xfIQw=;
        b=eN0FwPCg9a6190o10Hn6bzs/S/n6GbitYnlPZUbMSUpc3Z3Htw0IO1QNKRxddhVm58
         Sx+wvGHYKOggAhH99oWBHZz+uf07HuwKneRBACf+bOYdk495tb0E6bOlnswVfAhkvozi
         /P72m8h8ppx0BFKwFoqk+obLs4Rd1oUSmhUd+GzPTLb4VcJ2Eeu7aK6X/US9mHFv/Rq+
         S/bPfKuFSKc8mj8ZQZTuBQ/HTXNf9/fZph9kzJSv5aRJyENH3oJKJJOJyTEx0vXJiGTP
         M0wjqlCY5MFKskI2ZgvmhV5IwthbjDO5MU418WxZR8ReZhXTCY96H32okHtmCwYXdXEC
         Ep5g==
X-Gm-Message-State: AOJu0Yxvn74qVhzLYuvfVYfumBloQL0NOekWih1/dezDubV5ibl1eJbP
	Kysj/dcXoKg+iL000OauSAoZ7mktQX4vLNjjuEs=
X-Google-Smtp-Source: AGHT+IGEDXcjvdaLlm+Lm1MhX3ypxkb2BcfvKwP3hr+ZRjeyKB6A4brzFP6rL7JlK3KrmyM909jGUGbujDNLNef2CSI=
X-Received: by 2002:a05:6a21:6d89:b0:163:ab09:193e with SMTP id
 wl9-20020a056a216d8900b00163ab09193emr19555449pzb.1.1698255351428; Wed, 25
 Oct 2023 10:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org> <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
 <4e2de38da5a3e492eac522b9a68141c7@walle.cc> <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
 <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org> <CAOMZO5A0Oi1L20o_D9oT-mRXp-n8pAHkC1-AzhwvQ6jVB+UzxQ@mail.gmail.com>
In-Reply-To: <CAOMZO5A0Oi1L20o_D9oT-mRXp-n8pAHkC1-AzhwvQ6jVB+UzxQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Oct 2023 14:35:40 -0300
Message-ID: <CAOMZO5Ba8bo1zAt1-cSieWOKDWYpvSuOqp2RT5ZOGYLE8DHS0w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_103553_353980_51F7AA45 
X-CRM114-Status: GOOD (  18.02  )
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

SGkgVHVkb3IsCgpPbiBXZWQsIE9jdCAyNSwgMjAyMyBhdCA4OjU24oCvQU0gRmFiaW8gRXN0ZXZh
bSA8ZmVzdGV2YW1AZ21haWwuY29tPiB3cm90ZToKCj4gSW4gdGhlIG1lYW50aW1lLCBjb3VsZCB5
b3UgcGxlYXNlIGNvbnNpZGVyIHRoZSB2MiBwcm9wb3NhbD8KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1tdGQvMjAyMzEwMjQxMzU4MjYuMjcyOTA4OC0xLWZlc3RldmFtQGdtYWlsLmNv
bS9ULyN1Cj4KPiBtdDI1cXUwMWcgaXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBhbHJlYWR5IHN1cHBv
cnRlZCBtdDI1cXUwMmcuCj4KPiBJbiB2MiwgdGhlIC5zaXplIGFuZCAubm9fc2ZkcF9mbGFnIGZp
ZWxkcyB3ZXJlIHJlbW92ZWQsIHdoaWNoIGlzIGFuCj4gaW1wcm92ZW1lbnQgb3ZlciBtdDI1cXUw
MmcuCj4KPiBPbmx5IE5PX0NISVBfRVJBU0Ugc3RpbGwgbmVlZHMgdG8gYmUgcGFzc2VkLCBidXQg
dGhhdCBjYW4gYmUgcmVtb3ZlZAo+IGxhdGVyIHdoZW4gdGhlCj4gbXQyNXF1MDFnX3Bvc3Rfc2Zk
cF9maXh1cCgpIGlzIGltcGxlbWVudGVkLgo+Cj4gRG9lcyB0aGlzIHNvdW5kIHJlYXNvbmFibGU/
CgpJIGhhdmUgYWxzbyB0cmllZCBhZGRpbmcgYSBtdDI1cXUwMWdfcG9zdF9zZmRwX2ZpeHVwKCku
CgpUaGUgY2hhbmdlcyBiZWxvdyBzaG91bGQgYmUgc3BsaXQgaW50byAzIGRpZmZlcmVudCBwYXRj
aGVzLCBidXQganVzdAp3YW50ZWQgdG8gc2hhcmUgdGhlbSB3aXRoIHlvdSBmb3IgZmVlZGJhY2su
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwppbmRleCAxYzQ0M2ZlNTY4Y2YuLmY4NWVhNTc1MzRiYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKQEAgLTI4NTAsNyArMjg1MCw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9mbGFn
cyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQogICAgICAgICAgICAgICAgICAgICAgICBub3ItPmZsYWdz
IHw9IFNOT1JfRl9IQVNfU1JfQlAzX0JJVDY7CiAgICAgICAgfQoKLSAgICAgICBpZiAoZmxhZ3Mg
JiBOT19DSElQX0VSQVNFKQorICAgICAgIGlmIChmbGFncyAmIE5PX0NISVBfRVJBU0UgfHwgbm9y
LT5wYXJhbXMtPm5fZGljZSA+IDEpCiAgICAgICAgICAgICAgICBub3ItPmZsYWdzIHw9IFNOT1Jf
Rl9OT19PUF9DSElQX0VSQVNFOwoKICAgICAgICBpZiAoZmxhZ3MgJiBTUElfTk9SX1JXVyAmJiBu
b3ItPnBhcmFtcy0+bl9iYW5rcyA+IDEgJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1u
b3IvbWljcm9uLXN0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCmluZGV4IDg5
MjA1NDdjMTJiZi4uMjFmZWY0MzlkNWYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9y
L21pY3Jvbi1zdC5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMKQEAgLTE5
Miw2ICsxOTIsMjAgQEAgc3RhdGljIHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBtdDI1cXU1MTJhX2Zp
eHVwcyA9IHsKICAgICAgICAucG9zdF9iZnB0ID0gbXQyNXF1NTEyYV9wb3N0X2JmcHRfZml4dXAs
CiB9OwoKK3N0YXRpYyBpbnQgbXQyNXF1MDFnX3Bvc3Rfc2ZkcF9maXh1cChzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQoreworICAgICAgIHN0cnVjdCBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlciAqcGFyYW1z
ID0gbm9yLT5wYXJhbXM7CisKKyAgICAgICAvKiBNVDI1UVUwMUcgZG9lcyBub3QgZGVmaW5lIHRo
ZSBTQ0NSIGVudHJ5LCBzbyBwYXNzIG5fZGljZQptYW51YWxseS4gICovCisgICAgICAgcGFyYW1z
LT5uX2RpY2UgPSAyOworCisgICAgICAgcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgbXQyNXF1MDFnX2ZpeHVwcyA9IHsKKyAgICAgICAucG9zdF9zZmRwID0gbXQy
NXF1MDFnX3Bvc3Rfc2ZkcF9maXh1cCwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hf
aW5mbyBzdF9ub3JfcGFydHNbXSA9IHsKICAgICAgICB7CiAgICAgICAgICAgICAgICAubmFtZSA9
ICJtMjVwMDUtbm9uamVkZWMiLApAQCAtNDI5LDYgKzQ0MywxMSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8gc3Rfbm9yX3BhcnRzW10gPSB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICBTUElfTk9SX0JQM19TUl9CSVQ2LAogICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBT
RUNUXzRLIHwgU1BJX05PUl9RVUFEX1JFQUQsCiAgICAgICAgICAgICAgICAubWZyX2ZsYWdzID0g
VVNFX0ZTUiwKKyAgICAgICB9LCB7CisgICAgICAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4MjAs
IDB4YmIsIDB4MjEsIDB4MTAsIDB4NDQsIDB4MDApLAorICAgICAgICAgICAgICAgLm5hbWUgPSAi
bXQyNXF1MDFnIiwKKyAgICAgICAgICAgICAgIC5tZnJfZmxhZ3MgPSBVU0VfRlNSLAorICAgICAg
ICAgICAgICAgLmZpeHVwcyA9ICZtdDI1cXUwMWdfZml4dXBzCiAgICAgICAgfSwgewogICAgICAg
ICAgICAgICAgLmlkID0gU05PUl9JRCgweDIwLCAweGJiLCAweDIxKSwKICAgICAgICAgICAgICAg
IC5uYW1lID0gIm4yNXEwMGEiLAoKUGxlYXNlIGxldCBtZSBrbm93IHdoYXQgaXMgeW91ciBwcmVm
ZXJlbmNlLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
