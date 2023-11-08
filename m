Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCCAC0018C
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 15:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+I5oy/ZsgMAfGjYAJL8jatdL/SOSrsMXgtAlulcVY4=; b=b2IO2d7uPNBY11
	XvNEdRvqKa4IzyItt6qzMo+vE6UwglwLPDy+dW/KlucMFA/lVKJ9Lf3f1MwW08/IL1ZbaYSkVRQkH
	MVWotMSB/gwhEKgUNuOBz0fmB4J7lIPbPwMVXdOfnw2sr7sDonVIVdq1RQmh90GJc4kyvHQGN1YBT
	3GtoNesgGrzcdTiwCy2LXfC2eUpuTJAv+cl+p/quYh9CNg5/sxKIG7a2Qzb1nonfINb+9nUX+zRJP
	ZtvsefulR3S1CHm/rcqhZQLCQPUO6iWgyP6oN5NT6TraY7w559FXQVX3vyrZZ4GtiXABT646oKNQI
	voklwLrDSkAf1MKMVn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kvW-004Ee6-2s;
	Wed, 08 Nov 2023 15:57:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kvT-004Ed1-1x;
	Wed, 08 Nov 2023 15:57:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81AB82000B;
	Wed,  8 Nov 2023 15:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699459022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lHXBl5GzOkQJlYFz/o6gC1KSlh7snY9Q9gjR1xg7Qs=;
	b=hQzaRRNp09CxA/nhsZ+lZnrN1/d1UWND2RnguWmH1pn3bicGDogWWuurNxT3IlMz1Hr3CW
	B26QZJue/gDXbX+BspQiFxTT/iQdByTemeKyPJI4KbViOCIh97zJcpcnVDzlunLgx58jGj
	+RMHf30vcncC5ul883ElnnfCM75CwbkQJpBGTvn4yP+wc3Z/0HlNPvKO9JT4NsoBrM+8dI
	aSmjjp4QMdyIB1SrQll+WJzG0xuPuH9Jx+Is8zuCBxRT9RX+u77kjMpHaG7Q75wn9rwJDL
	ghI3tyiVGukSaVDo9cd78GD7jN/rxQap8g2vRbDV5dc8VPRAi18SYGYqkWPd1g==
Date: Wed, 8 Nov 2023 16:56:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik
 <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ben Dooks
 <ben.dooks@codethink.co.uk>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/6] mtd: rawnand: gpio: Support standard nand width
Message-ID: <20231108165659.2465ed7c@xps-13>
In-Reply-To: <20231108-fix-mips-nand-v1-5-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
	<20231108-fix-mips-nand-v1-5-5fc5586d04de@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_075707_785352_AC52DF7E 
X-CRM114-Status: GOOD (  19.71  )
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

SGkgTGludXMsCgpsaW51cy53YWxsZWlqQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAwOCBOb3Yg
MjAyMyAxNTozMzo1MyArMDEwMDoKCj4gVGhlIHN0YW5kYXJkIHByb3BlcnR5IGZvciBkZXNjcmli
aW5nIHRoZSBiYW5kIHdpZHRoIG9mIGEgTkFORAo+IG1lbW9yeSBpcyAibmFuZC1idXMtd2lkdGgi
IG5vdCAiYmFuay13aWR0aCIuIFRoZSBuZXcgYmluZGluZ3MKPiBzdXBwb3J0IGJvdGggc28gbWFr
ZSBMaW51eCBjaGVjayBib3RoIGluIHByaW9yaXR5IG9yZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZ3Bpby5jIHwgMTAgKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2dwaW8uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYwo+IGluZGV4
IDU1NTMxMDFjNzA5Yy4uZDViZDI0NWIwYzBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwaW8uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwaW8uYwo+IEBAIC0x
ODMsNyArMTgzLDE1IEBAIHN0YXRpYyBpbnQgZ3Bpb19uYW5kX2dldF9jb25maWcoc3RydWN0IGRl
dmljZSAqZGV2LAo+ICB7Cj4gIAl1MzIgdmFsOwo+ICAKPiAtCWlmICghZGV2aWNlX3Byb3BlcnR5
X3JlYWRfdTMyKGRldiwgImJhbmstd2lkdGgiLCAmdmFsKSkgewo+ICsJLyogVGhlIHByZWZlcnJl
ZCBiaW5kaW5nIHRha2VzIHByZWNlZGVuY2UgKi8KPiArCWlmICghZGV2aWNlX3Byb3BlcnR5X3Jl
YWRfdTMyKGRldiwgIm5hbmQtYnVzLXdpZHRoIiwgJnZhbCkpIHsKPiArCQlpZiAodmFsID09IDE2
KSB7Cj4gKwkJCWNoaXAtPm9wdGlvbnMgfD0gTkFORF9CVVNXSURUSF8xNjsKPiArCQl9IGVsc2Ug
aWYgKHZhbCAhPSA4KSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiaW52YWxpZCBuYW5kLWJ1cy13aWR0
aCAldVxuIiwgdmFsKTsKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsJfSBlbHNlIGlm
ICghZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImJhbmstd2lkdGgiLCAmdmFsKSkgewo+
ICAJCWlmICh2YWwgPT0gMikgewo+ICAJCQljaGlwLT5vcHRpb25zIHw9IE5BTkRfQlVTV0lEVEhf
MTY7Cj4gIAkJfSBlbHNlIGlmICh2YWwgIT0gMSkgewo+IAoKSSdtIG5vdCBzdXJlIHRoaXMgaXMg
YWN0dWFsbHkgbmVlZGVkLiBJIGJlbGlldmUgb2ZfZ2V0X25hbmRfYnVzX3dpZHRoCmlzIGFscmVh
ZHkgY2FsbGVkIChuYW5kX3NjYW5faWRlbnQgLT4gcmF3bmFuZF9kdF9pbml0KSBhbmQgd2lsbCBz
ZXQgdGhlCk5BTkRfQlVTV0lEVEhfMTYgZmxhZyBhdXRvbWF0aWNhbGx5LiBTbyB0aGUgYWJvdmUg
J2lmJyBpcyBhbHJlYWR5IGEKZmFsbGJhY2suIE1heWJlIHlvdSBjYW4gYWRkIGEgY29tbWVudCBp
ZiB5b3Ugd2FudCB0byBtYWtlIHRoaXMgbW9yZQpleHBsaWNpdCB0aGF0IHRoZSByZWFsIHByb3Bl
cnR5IGlzIG5hbmQtYnVzLXdpZHRoIGFuZCB0aGUgcHJvcGVydHkKcGFyc2VkIGluIHRoZSBkcml2
ZXIgaXMgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgb25seT8KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
