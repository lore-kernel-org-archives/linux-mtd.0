Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255FFC43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtghguWNGLk+56f33G3NmYE7x4UkwadBLfKhwJzWA7o=; b=ZGU5xM49lsDGNk
	nHzyqmUpCl2fa60umS+hq9nIbBI7yVRHjB8szqdMfvMqgf/9FD0VYvT0gO2r5jcXqNmRskYlAxnjx
	cLk3P/bmTndsmlJynQh/++NFnOhVYMD+TjQFBs0odIwkQG36vrSsztIBaMepLnWOPKmBc3pqVAMsR
	1bNKetnTMyQLjJ+FKlE/bAwD19trQ04fPulgk5zlvMLDYvT9f4XzmNpgRM/yYibdgEXf33VMHMr6C
	NgFj2RCMizMmhGYMg/vXTHrSlXTJbyToBrOAvvQCYdscCqNNPWYakyLq6wj8OClOBU73Ioga8DP5E
	Gzh0IvFHcTie5RRzYQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kgL-0044LO-Ah; Mon, 13 Jun 2022 14:04:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kg4-00449Z-0Y; Mon, 13 Jun 2022 14:04:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 732A81BF204;
	Mon, 13 Jun 2022 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655129056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgP4W2WcGLch0G1Z/a9d2JFCittPWMEM8INjyTTlF+o=;
	b=RHeR1FQ/oaGkFKglO95swbvRFaOAhB3zVTr+Iu4qezNsX0NWdqd7VE7g+YxKY7iFNIVvpD
	MRpE2qdYhxKxv4prc6X1uYby+AmIMIrmMKOW5nDMKrbDKLpjCe34ppD9oFa07wgsvyE3DY
	EohfY0giovrsbV8ylO/1gDQjesMK33L6IoOhYAVGPb6Ei/9+SDN7Gl5sAqQ406fyQ5FcbH
	TjZcAVfd5btd9c2VyMjB3W2zfTCFIfEiC47EM29IDqY0fopU4MX4Bp+YwiRGWOH3cYXBTi
	a6JfGmL63vnILBbjFDpLHbGSBRhUAqJf0GRIE95tXyPs5qDjFuE4VPDITSQZhw==
Date: Mon, 13 Jun 2022 16:04:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tom Rini
 <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] mtd: allow getting MTD device associated with a
 specific DT node
Message-ID: <20220613160411.48b07515@xps-13>
In-Reply-To: <20220611204651.19947-1-zajec5@gmail.com>
References: <20220611204651.19947-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_070424_768542_4A66BCC0 
X-CRM114-Status: GOOD (  20.57  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBTYXQsIDExIEp1biAyMDIyIDIy
OjQ2OjUwICswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gTVREIHN1YnN5c3RlbSBBUEkgYWxsb3dzIGludGVyYWN0aW5nIHdpdGggTVREIGRldmlj
ZXMgKGUuZy4gcmVhZGluZywKPiB3cml0aW5nLCBoYW5kbGluZyBiYWQgYmxvY2tzKS4gU28gZmFy
IGEgcmFuZG9tIGRyaXZlciBjb3VsZCBnZXQgTVRECj4gZGV2aWNlIG9ubHkgYnkgaXRzIG5hbWUg
KGdldF9tdGRfZGV2aWNlX25tKCkpLiBUaGlzIGNoYW5nZSBhbGxvd3MKPiBnZXR0aW5nIHRoZW0g
YWxzbyBieSBhIERUIG5vZGUuCj4gCj4gVGhpcyBBUEkgaXMgcmVxdWlyZWQgZm9yIGRyaXZlcnMg
aGFuZGxpbmcgRFQgZGVmaW5lZCBNVEQgcGFydGl0aW9ucyBpbiBhCj4gc3BlY2lmaWMgd2F5IChl
LmcuIFUtQm9vdCAoc3ViKXBhcnRpdGlvbiB3aXRoIGVudmlyb25tZW50IHZhcmlhYmxlcykuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0t
LQo+IFYzOiBGaXJzdCBpbnRyb2R1Y3Rpb24gb2Ygb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSgp
Cj4gCj4gbXRkIG1haW50YWluZXJzOiBwbGVhc2UgbGV0IGtub3cgaG93IHdvdWxkIHlvdSBsaWtl
IHRoaXMgcGF0Y2gKPiBwcm9jZXNzZWQuIFdvdWxkIHRoYXQgYmUgT0sgZm9yIHlvdSB0byBSZXZp
ZXcvQWNrIGl0IGFuZCBsZXQgaXQgZ28KPiB0aHJvdWdoIE5WTUVNIHRyZWU/CgpZZXMKCj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUu
YyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDllYjA2ODBkYjMxMi4uN2RjMjE0Mjcx
Yzg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL210ZGNvcmUuYwo+IEBAIC0xMTU0LDYgKzExNTQsMzQgQEAgaW50IF9fZ2V0X210ZF9kZXZp
Y2Uoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwoX19nZXRf
bXRkX2RldmljZSk7Cj4gIAo+ICsvKioKPiArICogb2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSAt
IG9idGFpbiBhbiBNVEQgZGV2aWNlIGFzc29jaWF0ZWQgd2l0aCBhIGdpdmVuIG5vZGUKPiArICoK
PiArICogQG5wOiBkZXZpY2UgdHJlZSBub2RlCj4gKyAqLwo+ICtzdHJ1Y3QgbXRkX2luZm8gKm9m
X2dldF9tdGRfZGV2aWNlX2J5X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpucCkKClNoYWxsIHdl
IHRyeSB0byB1c2UgYSBtb3JlIG9mLWFnbm9zdGljIHN5bnRheCBvciBpcyBpdCB0b28gY29tcGxl
eCBoZXJlPwoKPiArewo+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBOVUxMOwo+ICsJc3RydWN0
IG10ZF9pbmZvICp0bXA7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCW11dGV4X2xvY2soJm10ZF90YWJs
ZV9tdXRleCk7Cj4gKwo+ICsJZXJyID0gLUVOT0RFVjsKPiArCW10ZF9mb3JfZWFjaF9kZXZpY2Uo
dG1wKSB7Cj4gKwkJaWYgKG10ZF9nZXRfb2Zfbm9kZSh0bXApID09IG5wKSB7Cj4gKwkJCW10ZCA9
IHRtcDsKPiArCQkJZXJyID0gX19nZXRfbXRkX2RldmljZShtdGQpOwo+ICsJCQlicmVhazsKPiAr
CQl9Cj4gKwl9Cj4gKwo+ICsJbXV0ZXhfdW5sb2NrKCZtdGRfdGFibGVfbXV0ZXgpOwo+ICsKPiAr
CXJldHVybiBlcnIgPyBFUlJfUFRSKGVycikgOiBtdGQ7Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9H
UEwob2ZfZ2V0X210ZF9kZXZpY2VfYnlfbm9kZSk7Cj4gKwo+ICAvKioKPiAgICoJZ2V0X210ZF9k
ZXZpY2Vfbm0gLSBvYnRhaW4gYSB2YWxpZGF0ZWQgaGFuZGxlIGZvciBhbiBNVEQgZGV2aWNlIGJ5
Cj4gICAqCWRldmljZSBuYW1lCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL210ZC5o
IGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgKPiBpbmRleCA5NTVhZWUxNGIwZjcuLjZmYzg0MWNl
ZWYzMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbXRkL210ZC5oCj4gQEAgLTY3Nyw2ICs2NzcsNyBAQCBleHRlcm4gaW50IG10ZF9k
ZXZpY2VfdW5yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm1hc3Rlcik7Cj4gIGV4dGVybiBzdHJ1
Y3QgbXRkX2luZm8gKmdldF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgbnVt
KTsKPiAgZXh0ZXJuIGludCBfX2dldF9tdGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsK
PiAgZXh0ZXJuIHZvaWQgX19wdXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cj4g
K2V4dGVybiBzdHJ1Y3QgbXRkX2luZm8gKm9mX2dldF9tdGRfZGV2aWNlX2J5X25vZGUoc3RydWN0
IGRldmljZV9ub2RlICpucCk7Cj4gIGV4dGVybiBzdHJ1Y3QgbXRkX2luZm8gKmdldF9tdGRfZGV2
aWNlX25tKGNvbnN0IGNoYXIgKm5hbWUpOwo+ICBleHRlcm4gdm9pZCBwdXRfbXRkX2RldmljZShz
dHJ1Y3QgbXRkX2luZm8gKm10ZCk7Cj4gIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
