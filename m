Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09CC00A8F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LifvlwUX5c5+nB/KSoyG6bYDha+ieSCStuWhmNKCCjc=; b=TZ+8mSiyO+j3zW
	w7HLUum9PHaMnccoRExKdeVivJe0fGnaxdhNCv3w0r4v0G/MlLRUnuErGDbBY1IZNh1dk01cxDSq4
	L72tHnVlz39px1oCxWaTu5mSZ0JcPYv/lufr9hv1kt8huAMkcffH7nksGpDvL3LZEnXR4bSIx4Ft2
	K9YKXZ+hiHsb0DfPkmfoh1/C6urjEfeoZOO0H2uXQvn1F79FxDMQiSl2Ho8Ap8GlL/50JUAPi5giX
	RTBQYXYoBe6UdX+Rc23Z0Kgrc4X8ZSWL7thn8iN+ao/130/eN2JhaY1FIxH6xYn2ixn56h15FpK43
	vObk3LYf+v09IKGO8x4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFp0-009fc7-1p;
	Tue, 24 Oct 2023 11:43:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFox-009fba-2O
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 11:43:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cacbd54b05so2380305ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698147817; x=1698752617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx/FCldLFiiaeJnC0uoMeKKuwzNwxvBDqi25FJeHmxw=;
        b=Hm+4s2xwudouzSZrUXZd3orURX6qsgoWedfZ3TkzEQaPA+HnnY+ofgFr/IHoHgJX6a
         vroTQ8A/f5BohtveSfawU0A35pBmS6BMd0QlLSSkR6AKMJqRX+rpnukG16QnVKIYHwvk
         6z/7NbpktDE1BzWkyYd6lVgXkPgZn5nRodJYSJIwVeq6n/2Xc+dgoQ9e65Ig4Mt8TZhE
         dDGXCO3A2gHsi6UkFTC8YyEkYL5yYRLe/vmCIhD+9dcAoFE8KI+RnB42L0XmHl3nJFlv
         lPo8TTBrzObmhj9IWa82dVl5LLttKYsuJodJsXpdL7Mk3ZIhYYJn8MoRgh9H7MObi/IF
         gYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698147817; x=1698752617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx/FCldLFiiaeJnC0uoMeKKuwzNwxvBDqi25FJeHmxw=;
        b=UJUVxCKw7FSxYGi/6SPtVe8sJCZa3zB/zYHOokOk1MSs1DkDBX+3D3k0AMDTdBHwoW
         pniqu5Kfn2wq0Reubfesn2Sm6uFyBpLC/u4tHKMImhXSV6dTdoL5aKHjLW2zHBgcTzCi
         ZQSgXq6ObpWrA5Cb4rZWkVqLNbyu3GvTdbSkWxCQiMPhrUEHNslC3cZomgEb+MS8MtLJ
         MF1IHa/39L+6NDVcTU64GM9nXiOGDCPHVjoSun87kPwXUAIDLiN1is2f4RazwTa31UcA
         eVjF7J8qYC9U3IAqNTtxDAxCHfO8ah0R26uAjwyLGHemeLVaCNwW9VNoVkk0rjvdIrNO
         jLiw==
X-Gm-Message-State: AOJu0Yx7jE0P9nZ7yzbommzy96gbV/ck/raZewYJ/ccly46p6jpOXvTT
	b5Aw7WcHtnMvdM6RESZqB/YraZ7SrazPjNsbH7o=
X-Google-Smtp-Source: AGHT+IGIxjGzSdAHMt0+AORPjLkT6DWenbXxyBcSsOXV9ivZ7425k1PbnwZ3o7yi351eYLM8POHHFLVvEVrSGwCH6eY=
X-Received: by 2002:a17:903:647:b0:1ca:858d:5bef with SMTP id
 kh7-20020a170903064700b001ca858d5befmr11090255plb.4.1698147816729; Tue, 24
 Oct 2023 04:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
In-Reply-To: <6183891066787b6c24df11e0d601ed26@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Oct 2023 08:43:24 -0300
Message-ID: <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_044339_775586_3C56E9CA 
X-CRM114-Status: GOOD (  15.33  )
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

SGkgTWljaGFlbCBhbmQgVHVkb3IsCgpPbiBUdWUsIE9jdCAyNCwgMjAyMyBhdCA2OjI24oCvQU0g
TWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz4gd3JvdGU6Cgo+ID4gKyAgICAgICAgICAg
ICAuaWQgPSBTTk9SX0lEKDB4MjAsIDB4YmIsIDB4MjEsIDB4MTAsIDB4NDQsIDB4MDApLAo+ID4g
KyAgICAgICAgICAgICAubmFtZSA9ICJtdDI1cXUwMWciLAo+ID4gKyAgICAgICAgICAgICAuc2l6
ZSA9IFNaXzEyOE0sCj4KPiBOb3QgbmVlZGVkLCBwYXJzZWQgYnkgU0ZEUC4KPgo+ID4gKyAgICAg
ICAgICAgICAuZmxhZ3MgPSBOT19DSElQX0VSQVNFLAo+Cj4gSXMgaXQgZmFpciB0byBhc3N1bWUg
dGhhdCB0aGlzIGlzIHRoZSB1c3VhbCBjYXNlIGZvciBtdWx0aSBkaWUgY2hpcHM/Cj4gU2VlIGFs
c28sCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL2NvdmVyLjE2ODA4NDk0MjUu
Z2l0LlRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20vCj4KPiBTbyAiaWYgbl9kaWNlID4gMSIg
d2lsbCBpbXBsaWNpdGx5IGJlIE5PX0NISVBfRVJBU0UuIG5fZGljZSBzaG91bGQgYmUKPiBwYXJz
ZWQgZnJvbSBTRkRQLgo+Cj4gPiArICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80
SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsCj4KPiAubm9fc2ZkcF9m
bGFncyBhcmUgbGVnYWN5IGFuZCBzaG91bGRuJ3QgYmUgdXNlZCB3aXRoIG5ldyBmbGFzaGVzLgoK
SSB0cmllZCB5b3VyIHN1Z2dlc3Rpb24gYW5kIHRlc3RlZCB3aXRoIHRoZSBjaGFuZ2UgYmVsb3c6
CgotLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCisrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWljcm9uLXN0LmMKQEAgLTQyOSw2ICs0MjksMTAgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBmbGFzaF9pbmZvIHN0X25vcl9wYXJ0c1tdID0gewogICAgICAgICAgICAgICAgICAgICAg
ICAgU1BJX05PUl9CUDNfU1JfQklUNiwKICAgICAgICAgICAgICAgIC5ub19zZmRwX2ZsYWdzID0g
U0VDVF80SyB8IFNQSV9OT1JfUVVBRF9SRUFELAogICAgICAgICAgICAgICAgLm1mcl9mbGFncyA9
IFVTRV9GU1IsCisgICAgICAgfSwgeworICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweDIw
LCAweGJiLCAweDIxLCAweDEwLCAweDQ0LCAweDAwKSwKKyAgICAgICAgICAgICAgIC5uYW1lID0g
Im10MjVxdTAxZyIsCisgICAgICAgICAgICAgICAubWZyX2ZsYWdzID0gVVNFX0ZTUiwKICAgICAg
ICB9LCB7CiAgICAgICAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4MjAsIDB4YmIsIDB4MjEpLAog
ICAgICAgICAgICAgICAgLm5hbWUgPSAibjI1cTAwYSIsCgp+IyBoZXhkdW1wIC1DIC1uMTYgL2Rl
di9tdGQwCjAwMDAwMDAwICAwMSAwMiAwMyAwNCAwNSBmZiBmZiBmZiAgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAowMDAwMDAxMAp+IyBmbGFzaF9lcmFzZSAvZGV2
L210ZDAgMCAwCkVyYXNpbmcgMTMxMDcyIEtpYnl0ZSBAIDAgLS0gMTAwICUgY29tcGxldGUKClRo
ZSBmbGFzaF9lcmFzZSBvcGVyYXRpb24gY29tcGxldGVzIGltbWVkaWF0ZWx5LCBidXQgYWZ0ZXIg
Y2hlY2tpbmcgdGhlIGNvbnRlbnQKb2YgdGhlIGZsYXNoLCBJIG5vdGljZWQgdGhhdCB0aGUgb3Jp
Z2luYWwgY29udGVudCBpcyBzdGlsbCB0aGVyZToKCn4jIGhleGR1bXAgLUMgLW4xNiAvZGV2L210
ZDAKMDAwMDAwMDAgIDAxIDAyIDAzIDA0IDA1IGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58CjAwMDAwMDEwCgpXaXRoIHRoZSBvcmlnaW5hbCBwYXRj
aCwgdGhlIGVyYXNlIG9wZXJhdGlvbiB0b29rIGFib3V0IDIgbWludXRlcyB0bwpjb21wbGV0ZSBh
bmQgdGhlIGVyYXNlIHN1Y2NlZWRlZC4KCkJlbG93IGFyZSB0aGUgcmVxdWVzdGVkIGR1bXBzLCB0
aGFua3MuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zLgoK
fiMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC8zMDgwMDAwMC5idXMvMzBiYjAwMDAu
c3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9qZWRlY19pZAoyMGJiMjExMDQ0MDAK
fiMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC8zMDgwMDAwMC5idXMvMzBiYjAwMDAu
c3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9tYW51ZmFjdHVyZXIKc3QKfiMgY2F0
IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2NAMC8zMDgwMDAwMC5idXMvMzBiYjAwMDAuc3BpL3Nw
aV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9wYXJ0bmFtZQptdDI1cXUwMWcKfiMgeHhkIC1w
ICAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jQDAvMzA4MDAwMDAuYnVzLzMwYmIwMDAwLnNwaS9z
cGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Ivc2ZkcAo1MzQ2NDQ1MDA2MDEwMWZmMDAwNjAx
MTAzMDAwMDBmZjg0MDAwMTAyODAwMDAwZmZmZmZmZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGZiZmZmZmZmZmYzZjI5ZWIyNzZiCjI3M2IyN2JiZmZmZmZm
ZmZmZmZmMjdiYmZmZmYyOWViMGMyMDEwZDgwZjUyMDAwMDI0NGE5OTAwOGI4ZQowM2UxYWMwMTI3
Mzg3YTc1N2E3NWZiYmRkNTVjNGEwZjgyZmY4MWJkM2QzNmZmZmZmZmZmZmZmZmZmZmYKZmZmZmZm
ZmZmZmZmZmZmZmZmZTdmZmZmMjFkY2ZmZmYKfiMgbWQ1c3VtICAvc3lzL2RldmljZXMvcGxhdGZv
cm0vc29jQDAvMzA4MDAwMDAuYnVzLzMwYmIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4w
L3NwaS1ub3Ivc2ZkcAo5ZDI4ZDFiMTFkZThiMTViYTkxNTI2NDQyMTlkOWE3OAovc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jQDAvMzA4MDAwMDAuYnVzLzMwYmIwMDAwLnNwaS9zcGlfbWFzdGVyL3Nw
aTAvc3BpMC4wL3NwaS1ub3Ivc2ZkcAp+IwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
