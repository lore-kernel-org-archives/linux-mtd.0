Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F7AC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jul 2026 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OzNBftDt0Xs9ZNcjT4/bXBqn+afRLU84wFs1GGt8+s=; b=Y399N2AsmHyWEg
	PXkAf0GXca6ODaas8VcOLgDhGQMNjm1RHiIsADJB5qMof53tucpaV4uhY+gXOa1AXxuy3Cas9xh6c
	WTqahkCKol7x7QnMNwvBB6qvVWoDmArhLyq0YTn9R1K8Jok+Dj6EyOrZCB/aEZKvN222SnJlEYVjT
	gWzRiLaVnbZIXxWshjC81eBEJMRUMk4ygw5hlrYtdOW7WF/WqGjDkOWJ+kadAEmxF+cwzNhOtk7/R
	MgrNsgYmvh2KpQ5FMll7NNECvhm2DC1mPSyyaZz/IxddbBRgkjGj1qGMCMGJpENkWZuydN38Mpe77
	Zmf34S+p50/9BXAtul9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwbe-00000003iq6-2Mfl;
	Thu, 09 Jul 2026 21:48:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwba-00000003ipz-2QAh
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jul 2026 21:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 102CC44046
	for <linux-mtd@lists.infradead.org>; Thu,  9 Jul 2026 21:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F2A1F00AC4
	for <linux-mtd@lists.infradead.org>; Thu,  9 Jul 2026 21:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783633705;
	bh=TSwvbr/Jelw6UpvbFFiYWu/jPh3uNqSrRLawIqCIhKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y6uSA/rxD8VTRC35MwZC+L9Xhws/ZXvbFF1dL2GZk/4478nQeuovmSEpwYQMqPS28
	 DU6v3Ig3IdBv71VHzrfYQuciuTvbnc7Pu0p5LpTQSVNlFjAgCLY418taVmykzq/6BB
	 pWtdtqTEAEwxSSEG7FCINEK8YSmOyl9xjLkLi4RRDosvZOPbt4OT/vnb3XUQymGxxS
	 oXygfv4F2NZibckymSDQTmmxyM0PCxbh4HxBa5If4sfUBVmgYvtSSVVeg0U51B+NgF
	 C1MfbwnNebk5PgFqtM9jMvnNU+LakRJfKQePPIBUgp4vtBeSGLgFxOYaUAbdINnDbK
	 knb1jmcADbRog==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015b2d792so227488e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jul 2026 14:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpyeqyj9BrjenzReskx5aoQ8Qv5Z+mEffTWdszW7ZQdyloV6GkcxLCyu6zMUEe4gcwFMHtPddLbY1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKK2ETfrawKc4PjP/au3C/jCEhYWH9lIbqbH3i1sTKe6kkpggw
	1qvd1f7IkHXme49Eoy9MMtTjY9/K2bLATe/t+uQ875lsrmGTO55k+USINWJ1euoAH8YZ5HALLHl
	PSdgq/ol+LXfbsmXEtsVwO5xIuBTvLrg=
X-Received: by 2002:a05:6512:318c:b0:5b0:1ace:3bc7 with SMTP id
 2adb3069b0e04-5b01ace3dffmr580054e87.31.1783633704667; Thu, 09 Jul 2026
 14:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260708014906.1463-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 23:48:11 +0200
X-Gmail-Original-Message-ID: <CAD++jL=APPmdAg1y6igZ5qxihUAMkjvRUZ26gmCBGdoA-N5edg@mail.gmail.com>
X-Gm-Features: AUfX_mzze3LGN8VuT0AKhPa0bBlZvUodRHQlRxCB10Wpn3l9wDY7boYKzGK9nS0
Message-ID: <CAD++jL=APPmdAg1y6igZ5qxihUAMkjvRUZ26gmCBGdoA-N5edg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] mtd: afs: validate v2 image info bounds
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Liviu Dudau <liviu.dudau@arm.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

SGkgUGVuZ3BlbmcsCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBXZWQsIEp1bCA4LCAyMDI2
IGF0IDM6NDnigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5nQGlzY2FzLmFjLmNuPiB3cm90ZToK
Cj4gVGhlIEFGUyB2MiBwYXJzZXIgdXNlcyBmb290ZXJbOF0gdG8gbG9jYXRlIHRoZSBpbWFnZSBp
bmZvcm1hdGlvbiBibG9jawo+IGluc2lkZSB0aGUgY3VycmVudCBlcmFzZSBibG9jaywgdGhlbiB1
c2VzIHRoZSBpbWFnZSBpbmZvcm1hdGlvbgo+IHJlZ2lvbl9jb3VudCB0byB3YWxrIGVudHJpZXMg
ZnJvbSBhIGZpeGVkIGxvY2FsIGFycmF5LiBUaGUgZm9vdGVyIG9mZnNldAo+IGFuZCByZWdpb24g
Y291bnQgY29tZSBmcm9tIGZsYXNoIGNvbnRlbnRzIGFuZCBhcmUgbm90IGNoZWNrZWQgYWdhaW5z
dCB0aGUKPiBlcmFzZSBibG9jayBvciB0aGUgbG9jYWwgaW1hZ2UtaW5mbyBhcnJheSBiZWZvcmUg
dXNlLgo+Cj4gUmVqZWN0IHYyIGVudHJpZXMgd2hvc2UgaW1hZ2UgaW5mb3JtYXRpb24gb2Zmc2V0
IHdvdWxkIHVuZGVyZmxvdyB0aGUKPiBlcmFzZSBibG9jayBjYWxjdWxhdGlvbiwgYW5kIHJlamVj
dCByZWdpb24gY291bnRzIHRoYXQgY2Fubm90IGZpdCBpbiB0aGUKPiBsb2NhbCBpbWFnZS1pbmZv
IGFycmF5IGJlZm9yZSB3YWxraW5nIHJlZ2lvbiBlbnRyaWVzLgo+Cj4gRml4ZXM6IGI3Y2Y1ZTI4
MzBiYiAoIm10ZDogYWZzOiBhZGQgdjIgcGFydGl0aW9uIHBhcnNpbmciKQo+IENjOiBzdGFibGVA
dmdlci5rZXJuZWwub3JnCgpJIGRvbid0IGtub3cgaWYgdGhpcyBpcyBzdGFibGUgbWF0ZXJpYWwu
IE5vLW9uZSBpcyBydW5uaW5nIGludG8gYW55CnJlZ3Jlc3Npb25zLCBJIHRoaW5rIHRoaXMgd2Fz
IGRpc2NvdmVyZWQgYnkgY29kZSBhbmFseXNpcyBhbmQKaXMgbW9zdGx5IHRoZW9yZXRpY2FsIHBy
b2JsZW1zLgoKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBlbmdwZW5nQGlzY2FzLmFj
LmNuPgoKPiArICAgICAgIGlmIChtdGQtPmVyYXNlc2l6ZSA8IHNpemVvZihmb290ZXIpKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKCllvdSBhcmUgYXdhcmUgdGhhdCBubyBzeXN0
ZW0gaGFzIGFuIGVyYXNlIGJsb2NrIHNpemUgbGVzcyB0aGFuCjY0S0IgaW4gcHJhY3RpY2UsIGFu
ZCBzaXplb2YoZm9vdGVyKSBpcyA0OCBieXRlcz8KVGhpcyBpcyB3aHkgSSBzYXkgdGhpcyBraW5k
IG9mICJidWdzIiBhcmUgcHJldHR5CnRoZW9yZXRpY2FsLgoKPiAgICAgICAgIG5hbWUgPSAoY2hh
ciAqKSAmZm9vdGVyWzBdOwo+ICAgICAgICAgdmVyc2lvbiA9IGZvb3Rlcls5XTsKPiArICAgICAg
IGlmIChmb290ZXJbOF0gPiBtdGQtPmVyYXNlc2l6ZSAtIHNpemVvZihmb290ZXIpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKClRoZSBzYW1lIHRoZW9yZXRpY2FsIHRoaW5nIGhl
cmUuIGZvb3Rlcls4XSBpcyAwLi4yNTUgYnV0CmVyYXNlc2l6ZSBpcyBhdCBsZWFzdCA2NTUzNSBh
bmQgc2l6ZW9mKGZvb3RlcikgaXMgNDggYnl0ZXMuCgpJbiBlc3NlbmNlIHRoaXMgY29kZSB0cmFu
c2xhdGVzIHRvOgoKaXMgc29tZXRoaW5nIGJldHdlZW4gMCBhbmQgMjU1IG1vcmUgdGhhbiA2NTUz
NSAob3IgbW9yZSkgLSA0OD8KClRoZSBjb21waWxlciB3aWxsIG9mIGNvdXJzZSBqdXN0IG9wdGlt
aXplIHRoaXMgb3V0LCBidXQgSSdtIGp1c3QKcG9pbnRpbmcgaXQgb3V0LgoKSSB1bmRlcnN0YW5k
IHRoaXMga2luZCBvZiBmaXhlcyBhcmUgYWVzdGhldGljYWxseSBwbGVhc2luZwpidXQgdGhleSBh
cmUgbm90IGJ1Z3MuIE1vcmUgbGlrZSBvcm5hbWVudHMgZm9yIGNvZGVycy4KCj4gQEAgLTI3OCw2
ICsyODMsOCBAQCBzdGF0aWMgaW50IGFmc19wYXJzZV92Ml9wYXJ0aXRpb24oc3RydWN0IG10ZF9p
bmZvICptdGQsCj4gICAgICAgICBlbnRyeXBvaW50ID0gaW1naW5mb1twYWRdOwo+ICAgICAgICAg
YXR0cmlidXRlcyA9IGltZ2luZm9bcGFkKzFdOwo+ICAgICAgICAgcmVnaW9uX2NvdW50ID0gaW1n
aW5mb1twYWQrMl07Cj4gKyAgICAgICBpZiAocmVnaW9uX2NvdW50ID4gKEFSUkFZX1NJWkUoaW1n
aW5mbykgLSBwYWQgLSAzKSAvIDQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoK
VGhpcyBpcyB2YWxpZCBzYW5pdGl6YXRpb24gb2YgcmVnaW9uX2NvdW50IGhvd2V2ZXIhCgpBY2tl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
