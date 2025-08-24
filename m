Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E0CA0EFC
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbjA2gjpIJlZCO7eKZqppsIlqxVN/2qnFs06bSXe18o=; b=HvSZWFGgTOlWIm
	T4aR2QSycWO37g67KUg0brY0G6yi9pwuFk1Frb0C5Hj9GqwG0Z6C6rWBRk6mO2jZZJ4TWNgGk4Psz
	MHS/NRlv9c8sjA8MsQqkG3+7sCteESwVT8IrlxzAiHxkP8CCUUdDFzH0VWSbDfRrlFBt0ZbpARASR
	Hgdd4eLyH3KaPt+A0c3UEqkh3areZWWtyoK9QmhfiHD+OgiNpUayKh31yQasu6GLc3YbqEKoESvi1
	2YPicOZo3JDxD8bNW7wtF3aW+tWFndTFqwxG9tnLcUQedZuOxLLormHVgixduv+680n/D4gF3pQPz
	0WfFAMvVS7kpL3lCCycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCcd-00000006IAJ-0ODO;
	Sun, 24 Aug 2025 15:27:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCcZ-00000006I92-1VBQ
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 15:27:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5AE1C6B391;
	Sun, 24 Aug 2025 15:26:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 895B6605F1;
	Sun, 24 Aug 2025 15:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 408F11C22C53D;
	Sun, 24 Aug 2025 17:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756049216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W37avhcOHPEOuToxYLINfB6zYTm39to0zmX0Je7/jPg=;
	b=th1hQciUjmRNbv6BLnof91Y+bfzBVGqM5CSdEEtcq2ZOgLFK3zycmKvAYKHUAFtJf45ale
	n3VDtvOzQJc+R9Hxt/awwsYepOXPBNFF+pGW1CZK9MNF38dqaCkG5jALOhC1LMlsqrLk+P
	lY+3KDFH8/975O03IlsyD3bW/CvOLKO26AThr8eq+ikNiL2GeLe7bVDbN0Ypbg431digiT
	e1ik5t2R/6MPJ43QlfrwhCv98hKr7zDqEXF8uR/tPasK4GHDo8EyyQ3JstFfA1VzLjx+KJ
	SAKuBILUzO5wsYqAG+Yrb3GURZGS9lkEFjfWnTr35wuKoYFeng9T4NeMPAqtdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,  Huacai Chen
 <chenhuacai@loongson.cn>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Keguang Zhang <keguang.zhang@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 5/7] mtd: rawnand: loongson: Add Loongson-2K0500 NAND
 controller support
In-Reply-To: <589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 21 Aug 2025 14:39:19 +0800")
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
	<589b4dfab9c1edd95fa05cba80ec58ea9ca099da.1755757841.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:26:29 +0200
Message-ID: <87ms7olp0a.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_082703_922209_EC65B1D2 
X-CRM114-Status: GOOD (  10.06  )
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

SGkgQmluYmluLAoKPiArI2RlZmluZSBMT09OR1NPTl9OQU5EXzY0QklUX0RNQQkJQklUKDApCj4g
Kwo+ICAjZGVmaW5lIEJJVFNfUEVSX1dPUkQJCQkoNCAqIEJJVFNfUEVSX0JZVEUpCj4gIAo+ICBz
dHJ1Y3QgbG9vbmdzb25fbmFuZF9ob3N0Owo+IEBAIC04Myw2ICsxMDQsNyBAQCBzdHJ1Y3QgbG9v
bmdzb25fbmFuZF9kYXRhIHsKPiAgCXVuc2lnbmVkIGludCBob2xkX2N5Y2xlOwo+ICAJdW5zaWdu
ZWQgaW50IHdhaXRfY3ljbGU7Cj4gIAl1bnNpZ25lZCBpbnQgbmFuZF9jczsKPiArCXVuc2lnbmVk
IGludCBmbGFnczsKCkNhbiB3ZSB0dXJuIHRoaXMgaW50byBhIGJvb2xlYW4gaW5zdGVhZCBhbmQg
Z2l2ZSBpdCBhIERNQSByZWxhdGVkIG5hbWU/CkknbSBub3Qgc3VyZSB0aGUgbGlzdCBvZiBmbGFn
cyB3aWxsIGV4dGVuZCByYXBpZGx5Li4uCgo+ICAJdm9pZCAoKnNldF9hZGRyKShzdHJ1Y3QgbG9v
bmdzb25fbmFuZF9ob3N0ICpob3N0LCBzdHJ1Y3QgbG9vbmdzb25fbmFuZF9vcCAqb3ApOwo+ICB9
Owo+ICAKPiBAQCAtNzQ1LDcgKzc2Nyw3IEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fbmFuZF9jb250
cm9sbGVyX2luaXQoc3RydWN0IGxvb25nc29uX25hbmRfaG9zdCAqaG9zdCkKPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldiA9IGhvc3QtPmRldjsKPiAgCXN0cnVjdCBkbWFfY2hhbiAqY2hhbjsKPiAgCXN0
cnVjdCBkbWFfc2xhdmVfY29uZmlnIGNmZyA9IHt9Owo+IC0JaW50IHJldDsKPiArCWludCByZXQs
IHZhbDsKPiAgCj4gIAlob3N0LT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oZGV2LCBo
b3N0LT5yZWdfYmFzZSwgJmxvb25nc29uX25hbmRfcmVnbWFwX2NvbmZpZyk7Cj4gIAlpZiAoSVNf
RVJSKGhvc3QtPnJlZ21hcCkpCj4gQEAgLTc1NSw2ICs3NzcsOSBAQCBzdGF0aWMgaW50IGxvb25n
c29uX25hbmRfY29udHJvbGxlcl9pbml0KHN0cnVjdCBsb29uZ3Nvbl9uYW5kX2hvc3QgKmhvc3Qp
Cj4gIAkJcmVnbWFwX3VwZGF0ZV9iaXRzKGhvc3QtPnJlZ21hcCwgTE9PTkdTT05fTkFORF9QQVJB
TSwgaG9zdC0+ZGF0YS0+aWRfY3ljbGVfZmllbGQsCj4gIAkJCQkgICBob3N0LT5kYXRhLT5tYXhf
aWRfY3ljbGUgPDwgX19mZnMoaG9zdC0+ZGF0YS0+aWRfY3ljbGVfZmllbGQpKTsKPiAgCj4gKwlp
ZiAoaG9zdC0+ZGF0YS0+ZmxhZ3MgJiBMT09OR1NPTl9OQU5EXzY0QklUX0RNQSkKPiArCQlkbWFf
c2V0X21hc2tfYW5kX2NvaGVyZW50KGRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gKwo+ICAJY2hh
biA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAicnh0eCIpOwo+ICAJaWYgKElTX0VSUihjaGFuKSkK
PiAgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoY2hhbiksICJmYWlsZWQgdG8g
cmVxdWVzdCBETUEgY2hhbm5lbFxuIik7Cj4gQEAgLTc3MCw3ICs3OTUsMTQgQEAgc3RhdGljIGlu
dCBsb29uZ3Nvbl9uYW5kX2NvbnRyb2xsZXJfaW5pdChzdHJ1Y3QgbG9vbmdzb25fbmFuZF9ob3N0
ICpob3N0KQo+ICAKPiAgCWluaXRfY29tcGxldGlvbigmaG9zdC0+ZG1hX2NvbXBsZXRlKTsKPiAg
Cj4gLQlyZXR1cm4gMDsKPiArCXZhbCA9IEZJRUxEX1BSRVAoTE9PTkdTT05fTkFORF9NQVBfQ1Mx
X1NFTCwgTE9PTkdTT05fTkFORF9DU19TRUwxKQo+ICsJICAgIHwgRklFTERfUFJFUChMT09OR1NP
Tl9OQU5EX01BUF9SRFkxX1NFTCwgTE9PTkdTT05fTkFORF9DU19SRFkxKQo+ICsJICAgIHwgRklF
TERfUFJFUChMT09OR1NPTl9OQU5EX01BUF9DUzJfU0VMLCBMT09OR1NPTl9OQU5EX0NTX1NFTDIp
Cj4gKwkgICAgfCBGSUVMRF9QUkVQKExPT05HU09OX05BTkRfTUFQX1JEWTJfU0VMLCBMT09OR1NP
Tl9OQU5EX0NTX1JEWTIpCj4gKwkgICAgfCBGSUVMRF9QUkVQKExPT05HU09OX05BTkRfTUFQX0NT
M19TRUwsIExPT05HU09OX05BTkRfQ1NfU0VMMykKPiArCSAgICB8IEZJRUxEX1BSRVAoTE9PTkdT
T05fTkFORF9NQVBfUkRZM19TRUwsIExPT05HU09OX05BTkRfQ1NfUkRZMyk7CgpKdXN0IGEgbml0
IGFib3V0IHRoZSBzdHlsZSwgJ3wnIHNob3VsZCBiZSBsYXN0IGNoYXJhY3RlciBvbiB0aGUgcHJl
dmlvdXMKbGluZS4KCk90aGVyd2lzZSB0aGUgcmVzdCBsZ3RtLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
