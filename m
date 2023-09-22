Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E940AE6FE58
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9nynzBXkS9zIXL6P6mJPpzXvc1PSS71uVnT7xkkOAo=; b=EuXVTPp/JuLlQn
	Pi1Un3Adi7CmtUxZ+HV6TdJvRmTqLE2bcr5af4IGn2CET9iOLt1D7TlElq5W49TG9hriX9eiKb3/7
	5dzZyW4u/DtFoJOHnp982ow90UpdBKKwO0Zl5IUFe5jcC1RRGlOkt8T+ezO4GcRgnnnRbsGvd9B+X
	zfx7YLVrxNTkmb/jwNGniUuqAc20KK5bdIq+14M3wepGfAyiS7cfYMUESn8H4ThjO4zJhw7PqPEZz
	3cjN/W1Jwi/Q5mZl5tXyLEr9jDoxoSnKTL0O402aZBzsyaK2Ro4J6fT4o9x1Xs4n5EJLSBMdvzVDN
	U/Hyw2Dm0/IbqqwRhThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiaQ-009MXQ-1A;
	Fri, 22 Sep 2023 16:00:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiaM-009MVE-2a
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 16:00:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04CBACE238A
	for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 16:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3805BC433C8
	for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695398452;
	bh=xhaA32OBzVOM6nAoPy+gaX1FXQZKalbztmjU2PzXFPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ggzP0E0DGs0mibxseVl52HMOQX0aJ/KNk9DKc7+M5mWQt6G8GwUN+N8OLddQSnP00
	 mikR3nt6qzuamVj4tB1KHTzXqXbEsUT/Nz515Nxo3qSeT7fKjiTlGV+kk0HNmJFUtn
	 h+W4eEBKX5fqYVPKRizLnCPkmHHPyQtJQ6xKkd3wWuC0bCTDOy3b6JN+vOBXl9CaNg
	 2YV/3iwkjSnGvmL+BVVAwuWLJK5K/irp+IYCF9eS/5Y5q1UI8irQKKjxh5S5z6MQ0k
	 MYor0XI3CmqlTXmq/gGMHA+94sJ8DMPEG3JOhP7KuaKERhhij7Qm1mRu96NSNFR2EC
	 Q1uK6f7ijoBtw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50437c618b4so1616944e87.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 09:00:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy8vaMY7P4+F7hDFqDzPG4G0fAt5V9Fj+ap7kMijIIa5LBrJoQA
	MZhbwxMNLUxFbFAf5mQ2e+VDs6gGRwtxHrxQ6g==
X-Google-Smtp-Source: AGHT+IEEE/JvcGeQD4KCzLIPPO9coF/0Kd1GNltvU5JvL5xNpex4YSVmnWqzCk9JmegTSZU7ZxtuJs2nrUqxTkVlYi8=
X-Received: by 2002:ac2:5041:0:b0:503:2623:7cfc with SMTP id
 a1-20020ac25041000000b0050326237cfcmr6407321lfm.34.1695398450443; Fri, 22 Sep
 2023 09:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
In-Reply-To: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Sep 2023 11:00:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
Message-ID: <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_090055_217371_A8FDDA54 
X-CRM114-Status: GOOD (  12.05  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMTo0NeKAr1BNIFNpbW9uIEdsYXNzIDxzamdAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IEJpbm1hblsxXSBpcyBhIHRvb2wgZm9yIGNyZWF0aW5nIGZpcm13
YXJlIGltYWdlcy4gSXQgYWxsb3dzIHlvdSB0bwo+IGNvbWJpbmUgdmFyaW91cyBiaW5hcmllcyBh
bmQgcGxhY2UgdGhlbSBpbiBhbiBvdXRwdXQgZmlsZS4KPgo+IEJpbm1hbiB1c2VzIGEgRFQgc2No
ZW1hIHRvIGRlc2NyaWJlIGFuIGltYWdlLCBpbiBlbm91Z2ggZGV0YWlsIHRoYXQKPiBpdCBjYW4g
YmUgYXV0b21hdGljYWxseSBidWlsdCBmcm9tIGNvbXBvbmVudCBwYXJ0cywgZGlzYXNzZW1ibGVk
LAo+IHJlcGxhY2VkLCBsaXN0ZWQsIGV0Yy4KPgo+IEltYWdlcyBhcmUgdHlwaWNhbGx5IHN0b3Jl
ZCBpbiBmbGFzaCwgd2hpY2ggaXMgd2h5IHRoaXMgYmluZGluZyBpcwo+IHRhcmdldGVkIGF0IG10
ZC4gUHJldmlvdXMgZGlzY3Vzc2lvbiBpcyBhdCBbMl0gWzNdLgo+Cj4gWzFdIGh0dHBzOi8vdS1i
b290LnJlYWR0aGVkb2NzLmlvL2VuL3N0YWJsZS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwK
PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdS1ib290LzIwMjMwODIxMTgwMjIwLjI3MjQw
ODAtMy1zamdAY2hyb21pdW0ub3JnLwo+IFszXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9kZXZpY2V0cmVlL21zZzYyNjE0OS5odG1sCgpZb3UgbWlzc2VkOgoKaHR0cHM6Ly9naXRodWIu
Y29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzExMAoKd2hlcmUgSSBzYWlkOiBXZSBj
ZXJ0YWlubHkgc2hvdWxkbid0IGR1cGxpY2F0ZSB0aGUgZXhpc3RpbmcgcGFydGl0aW9ucwpiaW5k
aW5ncy4gV2hhdCdzIG1pc3NpbmcgZnJvbSB0aGVtIChJIGFzc3VtZSB3ZSdyZSBtb3N0bHkgdGFs
a2luZwphYm91dCAiZml4ZWQtcGFydGl0aW9ucyIgd2hpY2ggaGFzIGJlZW4gYXJvdW5kIGZvcmV2
ZXIgSSB0aGluayAoYmVmb3JlCm1lKSk/CgpUbyByZXBlYXQsIHVubGVzcyB0aGVyZSBpcyBzb21l
IHJlYXNvbiBiaW5tYW4gcGFydGl0aW9ucyBjb25mbGljdCB3aXRoCmZpeGVkLXBhcnRpdGlvbnMs
IHlvdSBuZWVkIHRvIHN0YXJ0IHRoZXJlIGFuZCBleHRlbmQgaXQuIEZyb20gd2hhdCdzCnBvc3Rl
ZCBoZXJlLCBpdCBuZWl0aGVyIGNvbmZsaWN0cyBub3IgbmVlZHMgZXh0ZW5kaW5nLgoKSSBkaWQg
YSBiaXQgbW9yZSByZXNlYXJjaC4gImZpeGVkLXBhcnRpdGlvbnMiIGFzIGEgY29tcGF0aWJsZSBo
YXMKIm9ubHkiIGJlZW4gYXJvdW5kIHNpbmNlIDIwMTUuIFByaW9yIHRvIHRoYXQsIGl0IHdhcyBp
bXBsaWNpdCB3aXRoCmp1c3QgcGFydGl0aW9uIG5vZGVzIHdpdGggYWRkcmVzc2VzIChpLmUuIHJl
ZykgYW5kIHRoYXQgZGF0ZXMgYmFjayB0bwoyMDA3LiBMb29rcyBsaWtlIHUtYm9vdCBvbmx5IHN1
cHBvcnRzIHRoZSBuZXdlciBmb3JtIGFuZCBzaW5jZSAyMDIxLgoKUm9iCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
