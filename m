Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E07CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chwp40oJE0MibbrK6jpnlh/9/jmj6bVvp+Glwu9h0B0=; b=wz6NeNtxldF/9G
	3TAj3YNujR+zHu89V2vzm4x30ztaC5eKmw77mu0fdjrbYPM7OxyoiNVgO5JXV4twSk1U2TQT5jJmL
	XctgWEkRPtZbcNKLj9RKQpr2syPD12GZPMU1almWegw2nwFKMNdDnKWZArBjD5SrWRVZfdX1I5cdc
	hCt0jYo9kQcMUwE2DqsXoRdLPDDeKoRVjP5eazcoOS5kOpcs/399no/hgxVqDG1CjEvdaspLcx7wb
	JFSfTlGQNQPyTA3oEuM54MfwYg7bPtkJPwsSVpBRxb2DDs2NDE1uNJj1qg7qymKY06qZozm+berM1
	QFTdWvDFHZN6oT2j8d5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5Wg-00EdcP-12;
	Wed, 18 Oct 2023 12:19:50 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5Wc-00EdbH-0H;
	Wed, 18 Oct 2023 12:19:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598F2240006;
	Wed, 18 Oct 2023 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697631582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8WY2iRcdIwbz7ogy/kuNLacpb70m77vmQIMF2N7DmQ=;
	b=LiByQyqWzx7CezxKGdiPA8KO7SRIglhL6/+dTiS4jjq4s2vMDpIF/cR6FjbAcBMStzUUb5
	CIjCR2GkpLhcO+nYeUSUvMJVMWH/6Lbgd/uaCAWD28Nu7gKQd+te9xOew5pBytbJray2op
	U8jlGLFGJbBMZ+XEkvvwu9IjuJj4aeKH7knSknW4VwdCcUlrlyj5+veOWYlLKBhW0FCnHP
	hbS2ggoq3h2sgWKyGjqzRFlOEmPGOfVDYgJ54F2AUIu/Lujx2DfAyIsUerVGsEdqkujh7q
	eQV/C7b6Bt7+WEZdy2MrbuPsAlTL82fKrOaeT1lZvfM/xCnanRaGoXodbuVQVA==
Date: Wed, 18 Oct 2023 14:19:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>
Cc: <liang.yang@amlogic.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: meson: check return value of
 devm_kasprintf()
Message-ID: <20231018141936.42b5ec6b@xps-13>
In-Reply-To: <20231018092047.314860-1-yiyang13@huawei.com>
References: <20231018092047.314860-1-yiyang13@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_051946_427054_43217CFA 
X-CRM114-Status: GOOD (  14.39  )
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

SGkgWWksCgp5aXlhbmcxM0BodWF3ZWkuY29tIHdyb3RlIG9uIFdlZCwgMTggT2N0IDIwMjMgMDk6
MjA6NDcgKzAwMDA6Cgo+IFRoZSBkZXZtX2thc3ByaW50ZigpIHJldHVybnMgYSBwb2ludGVyIHRv
IGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBtZW1vcnkuCj4gdGhhdCB3aWxsIHJldHVybiBOVUxMIHdo
ZW4gYWxsb2NhdGUgZmFpbGVkLgoKTWF5IEkgcHJvcG9zZSByZXdvcmRpbmcgb2YgdGhlIGNvbW1p
dCBsb2c/CiIKZGV2bV9rYXNwcmludGYoKSByZXR1cm5zIGEgcG9pbnRlciB0byBkeW5hbWljYWxs
eSBhbGxvY2F0ZWQgbWVtb3J5CndoaWNoIGNhbiBiZSBOVUxMIHVwb24gZmFpbHVyZS4gRW5zdXJl
IHRoZSBhbGxvY2F0aW9uIHdhcyBzdWNjZXNzZnVsIGJ5CmNoZWNraW5nIHRoZSBwb2ludGVyIHZh
bGlkaXR5LgoiCgo+IEZpeCBpdCBieSBjaGVjayByZXR1cm4gdmFsdWUgb2YgZGV2bV9rYXNwcmlu
dGYoKS4KPiAKPiBGaXhlczogMWU0ZDNiYTY2ODg4ICgibXRkOiByYXduYW5kOiBtZXNvbjogZml4
IHRoZSBjbG9jayIpCj4gU2lnbmVkLW9mZi1ieTogWWkgWWFuZyA8eWl5YW5nMTNAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIHwgNSArKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYwo+IGluZGV4IDM3OGYyOGNlNmE3NC4uMmM2YWU3ODFiYjBjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L21lc29uX25hbmQuYwo+IEBAIC0xMTM0LDYgKzExMzQsMTEgQEAgc3RhdGljIGludCBt
ZXNvbl9uZmNfY2xrX2luaXQoc3RydWN0IG1lc29uX25mYyAqbmZjKQo+ICAJaW5pdC5uYW1lID0g
ZGV2bV9rYXNwcmludGYobmZjLT5kZXYsCj4gIAkJCQkgICBHRlBfS0VSTkVMLCAiJXMjZGl2IiwK
PiAgCQkJCSAgIGRldl9uYW1lKG5mYy0+ZGV2KSk7Cj4gKwlpZiAoaW5pdC5uYW1lKSB7Cj4gKwkJ
ZGV2X2VycihuZmMtPmRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBpbml0Lm5hbWVcbiIpOwoKTm8g
bmVlZCBmb3IgZXJyb3IgbWVzc2FnZXMgdXBvbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlcy4K
Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwl9Cj4gKwo+ICAJaW5pdC5vcHMgPSAmY2xrX2Rpdmlk
ZXJfb3BzOwo+ICAJbmZjX2RpdmlkZXJfcGFyZW50X2RhdGFbMF0uZndfbmFtZSA9ICJkZXZpY2Ui
Owo+ICAJaW5pdC5wYXJlbnRfZGF0YSA9IG5mY19kaXZpZGVyX3BhcmVudF9kYXRhOwoKVGhlc2Ug
Y29tbWVudHMgYXJlIGFsc28gYXBwbGljYWJsZSB0byB5b3VyIHR3byBvdGhlciBwYXRjaGVzLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
