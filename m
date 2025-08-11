Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6232CA0EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNRPuGH5HAL6w1BRQUgrT35WkS85P3cOXIxR4BUQJHc=; b=W2C+mAzazJaU+g
	e1gu6bwHTH6+kO1PHmXv2VWSOl75WgLJsb/6ll/BfifDGza7keS+FR5sTv1TVK0+iMRRzduHQnPE1
	tf40p5T6tZpGHqDi/rQUg5Mw2wk71hr4I2RLdArH19Plq8/CXbjxZrwTP4sJAqmOcnHiOI1/x6J5v
	v4eFH6VU82C697O/W8+QrZUioO+yIEquBlbjpOjtN4XJOBQynbilxz3ituqvk82Yj3XKvPAUsrvMu
	fEsx80anIzcmbwpSKLELE782Q8XVeo6nl0JFn3lDAFYWng+jWIbFObI3699QLXqFM0I/t4iNLoJZL
	EFnHa8f4goIn37+JUpXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOEo-00000006uGQ-3fJu;
	Mon, 11 Aug 2025 08:50:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNkp-00000006pW9-2ZMl
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 08:19:40 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso5727379a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900378; x=1755505178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgbL89+jWcykg4VT77IwFJx/cFqzfg7ANmaGG3REd70=;
        b=fUUsrNWtZ7cVpdWMPECReoTgsrFLrDKT6x7CZPHPKo/TdvQ1KLcmrPFXKRGE0zP7UF
         GRDX1mROgNbjTnByTbjG37/zEV98JQnJzVZVMulHxboDj3SFyaTxlOG8kq0Vjw/z3PMU
         8O24Fn112QPaGlgC13XskuBwiN3btq1GmV0VUBjXXiEJRYfPWDiCjGE/NDHTnAqbEcW9
         WFcboTC1mZ1FkIlGq4CErM+JVz74McCOfxKdTDgLC48QWCY3lbJLp3QZRgSb2TtKyKe7
         Z2dEgqAA69dum/iPkzIKtdFNvthl+sIF40/lZyvPUm4lliCgwUBTi+wmKK/+HyHi1bcS
         h3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900378; x=1755505178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgbL89+jWcykg4VT77IwFJx/cFqzfg7ANmaGG3REd70=;
        b=ddCKVIx9KpmJw1LS/GSgP+DfLyVf87XcXZQuqdi/I5naLTLYmxb3cjLQQ7mm5lxP3F
         nszWMrWzLGWepSkuRAmF4RR8DBg7hMOKwU1ES+H+BLwCCGW3GZF3yKEiB5/gJ7vdLRPM
         p37fEZ8XQejjN4TWtJXrk5Q3iLxENGqowlMG+JwPvyUE/T4vclsp0Kw1CKkA+f0ugAaD
         ngeFHJGFJ/xixEETEvb/UdLWQjemnLaqu7Oqd9hqCwBEIpBKcJmjQX85IOW/Q8iXsm1h
         NTpWnphh1ffNV91s49BeECcvyupkqzoEephBuB9nLNGyIj79yEfDXRlOtwd1JGu6Br0P
         R3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+r72i4TfexzxnNKwZWzaQuUeJnK6VWR6KNqZMtzC+wo/qHNxbDDASSkKQAJPHAxV877w4MHV9VA4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJD4GeVWUnkn/Uuo7Y7eZfCvXCawGk+g2ROp5ARY2a2utvdck
	p8bZoHgp+piUjgOZmparAzZdyaXP5PnvVXuoXsK3lbpOpgmZqPVw5C7DkCS+6lajYg0KD+PMcrD
	0EPib1VAeu3ou6O7ik7THIWXTchcwtNM=
X-Gm-Gg: ASbGncsCo1QF7EKqzT2L2I9ldK+ec2XxdP8rrcktL9xGvM1iSiRcnxOx7Mum+ACHbEH
	5GO2MaxMqdL1KWPiDEetb3EI6m+Z8AGr5oAiDrhi6UPOBRCZ3SwhZB2vcT6JfJxeroIwM++dqGm
	xtXWVUFl7X17Q5P8GlAn3hoWfauG2XAMfZhEjCPHC/MNUqj75ZtlLqg6hFcdYIjo5xB+ywf6tS7
	Xsgat5s
X-Google-Smtp-Source: AGHT+IF8gqpHKUggAz8mRHFtabGXF36B1xtlX4P+D1pU+orCN9564Rlc80C3nmmzBa8cGbzuEi0zdw4YMnyQiNETI6E=
X-Received: by 2002:a17:907:7f02:b0:ae0:ce59:5952 with SMTP id
 a640c23a62f3a-af9c65f16ecmr931142066b.60.1754900377495; Mon, 11 Aug 2025
 01:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org> <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
 <20250811-impetuous-civet-of-wind-febe58@kuoka>
In-Reply-To: <20250811-impetuous-civet-of-wind-febe58@kuoka>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 16:19:24 +0800
X-Gm-Features: Ac12FXyFB4EVt99-WdzeI01ERu2yfCN8TNLMEhiVAElN4xIXYzFbGw-dcmhbDQ0
Message-ID: <CAMpQs4J1ThxZqJupm68WmpQpkG2HtkRctk6zDmbszaHUyBm19g@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_011939_652008_3EAA492F 
X-CRM114-Status: GOOD (  16.93  )
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

SGkgS3J6eXN6dG9mOgoKT24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgNDoxM+KAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxMSwg
MjAyNSBhdCAwMzo0MjowOVBNICswODAwLCBCaW5iaW4gWmhvdSB3cm90ZToKPiA+IEhpIEtyenlz
enRvZjoKPiA+Cj4gPiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAzOjMy4oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gMTEvMDgv
MjAyNSAwODowMywgQmluYmluIFpob3Ugd3JvdGU6Cj4gPiA+ID4gQWRkIG5ldyBjb21wYXRpYmxl
IGZvciB0aGUgTG9vbmdzb24tMksgTkFORCBjb250cm9sbGVyIHVzZWQgZm9yCj4gPiA+ID4gTG9v
bmdzb24tMkswNTAwIFNvQy4KPiA+ID4gPgo+ID4gPiA+IEFja2VkLWJ5OiAiUm9iIEhlcnJpbmcg
KEFybSkiIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+Cj4gPiA+Cj4gPiA+IFdoeSBkbyB5b3UgYWRk
IHF1b3Rlcz8KPiA+Cj4gPiBFbW0uLi4KPiA+IFNvcnJ5LCBJIGRpZG4ndCBub3RpY2UgdGhhdC4K
PiA+IEkgcmVhY3F1aXJlZCB0aGUgVjEgcGF0Y2hzZXQgdXNpbmcg4oCcYjQgYW0geHh44oCdIHRv
IGF2b2lkIG1hbnVhbGx5Cj4gPiBhZGRpbmcgdGFncy4gSSBiZWxpZXZlIGl0IG1heSBiZSBjYXVz
ZWQgYnkgdGhlIGBiNGAgY29tbWFuZC4KPgo+IFRoZW4gYXJlbid0IHlvdSB1c2luZyBzb21lIG9s
ZCBiND8KPgo+IEkganVzdCBkaWQgaXQgYW5kIGxvb2s6Cj4KPiAgIFtQQVRDSCB2MSA1LzhdIGR0
LWJpbmRpbmdzOiBtdGQ6IGxvb25nc29uLGxzMWItbmFuZC1jb250cm9sbGVyOiBEb2N1bWVudCB0
aGUgTG9vbmdzb24tMkswNTAwIE5BTkQgY29udHJvbGxlcgo+ICAgICArIEFja2VkLWJ5OiBSb2Ig
SGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPiAo4pyTIERLSU0va2VybmVsLm9yZykKPiAg
ICAgKyBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzU4ODYzOWRlNTkxYWRhNDA4YmRh
ZWIwZDI3OWM1ZDYyYTRiNTNkNjEuMTc1MzE2NjA5Ni5naXQuemhvdWJpbmJpbkBsb29uZ3Nvbi5j
bgo+ICAgICArIFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KClRoYW5rcyBmb3IgeW91ciByZXBseSBhbmQgdGVzdGluZy4K
CkkgcmVjaGVja2VkIG15IGI0IHJlcG9zaXRvcnksIGFuZCBpdCBkb2VzIG5lZWQgdG8gYmUgdXBk
YXRlZC4gSXQgd2FzIG15IG1pc3Rha2UuCkkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lv
bi4KClRoYW5rcyBhZ2FpbiEKPgo+Cj4gTm8gcXVvdGVzIGluIGNvbW1pdCBtc2cgZWl0aGVyLgo+
Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgotLSAKVGhhbmtzLgpCaW5iaW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
