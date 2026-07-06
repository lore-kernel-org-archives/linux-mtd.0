Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DB5C43602
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42uFURJ8EtmPnuOX4BICtVwc6iBYQFYWQtzrfRuzYHM=; b=e6HDuxbSQHkatQ
	LzilRjRCPj4v5i1CBALLHY1Gg03YRVKF4gXXnqwIVx6uUqW5qCw+pU5/50OZdmhXufINzQIGePJLH
	NO2MPq4OMInEfQKmVKNneWKcBApKuIrHf/PvgJDzRnowKDyumkSRYGfI176ZHmgwu5LNvdu0V1aqe
	lpt2F76SxxeGZFfQWRgraIUtUAwipFFLqt/JTEwydtA/A5kDcTo6lZZdda+Z7zFsU/gz5l3DTyiLh
	aOhRNZTjQtoy/ng2DZ3JM5whV7n84UuqFKGVTnAvbBnqd3HODzKe4N5Z5i4P4J1yEEnimUTCEmwCW
	4uJdRz4Omv7agbXwSx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk7f-0000000CiXU-0blC;
	Mon, 06 Jul 2026 14:16:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk7b-0000000CiQw-3yFe
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:16:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A4F55C8EC7B;
	Mon,  6 Jul 2026 14:16:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 897CB601A2;
	Mon,  6 Jul 2026 14:16:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FFE911BB988C;
	Mon,  6 Jul 2026 16:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783347389; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mdP4MWzsmXpH1YpYiiTf9Hviww/mVOwpQ2Tgo3n5kSI=;
	b=hsDQ7zyYC0bCVGVwykLAHU281DFuoaPP9BP2lpohFMWWBdgM5j+g9BHvciB4+e+hWasK0x
	VzCs79YdK/6tPSU2JzB+LknVwIJ/w5Chuacc0YyX6kSgC18e/Ds45IKl0vcH172CHi4Z9s
	6uBAvofJZVgMo58MtFBbuaKGt2DFYdZ3vuhnOpG+KncVfmit31ag3Xl/41SmtPzzThHl3R
	C4YsXPKPw34mfrn4W7WTrzzqewQTxEe8BZX+QQEnUJe6EKq6fWgF3vuX8IQ89+DFqEOMIJ
	J03dKk5/t8bM0APEGPsXLt8oXqrqIovTITaLkoU9Oy+NozTh3i9B3E5ZReFY1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
In-Reply-To: <87zf04kz9s.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 06
	Jul 2026 15:45:19 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
	<178331904816.868671.4599503585231715805.b4-ty@bootlin.com>
	<DJRBBKVZJCK1.31E3LISI9XG5L@kernel.org> <87zf04kz9s.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:16:25 +0200
Message-ID: <87fr1wkxty.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_071632_213272_4317D6F1 
X-CRM114-Status: GOOD (  16.88  )
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

T24gMDYvMDcvMjAyNiBhdCAxNTo0NToxOSArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+IE9uIDA2LzA3LzIwMjYgYXQgMDk6
MzM6MzggKzAyLCAiTWljaGFlbCBXYWxsZSIgPG13YWxsZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
PiBPbiBNb24gSnVsIDYsIDIwMjYgYXQgODoyNCBBTSBDRVNULCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+Pj4gT24gTW9uLCAwMSBKdW4gMjAyNiAxNDo1Mjo0MiArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPj4+PiBUcnkgdG8gc2ltcGxpZnkgdGhlIGZsYXNoIGluaXRpYWxpemF0aW9uIGFuZCBn
ZXQgcmlkIG9mIHRoZSBsZWdhY3kKPj4+PiBoYW5kbGluZy4gQXMgZGVmYXVsdCwgYWxsIHRoZSBm
bGFncyBvZiB0aGUgaW4ta2VybmVsIGRhdGFiYXNlIGFyZQo+Pj4+IHRha2VuIGFuZCBhbWVuZGVk
IHdpdGggdGhlIFNGRFAgZGF0YS4KPj4+PiAKPj4+PiBUaGlzIG1pZ2h0IGhhdmUgdGhlIGNvbnNl
cXVlbmNlIHRoYXQgYWxsIHRoZSBmbGFzaGVzIG5vdyBnZXQgYQo+Pj4+IFJEU0ZQRCBvcGNvZGUg
d2hpY2ggbWlnaHQgYmUgYW4gdW5rbm93biBvcGNvZGUuIEJ1dCB0aGF0IHdhcyBhbHJlYWR5Cj4+
Pj4gdGhlIGNhc2UgZm9yIGFueSBmbGFzaGVzIHdoaWNoIHdlcmUgdW5rbm93biB0byB0aGUgbGlu
dXgga2VybmVsLiBTbwo+Pj4+IGZhciwgdGhlcmUgd2FzIG5vdCBhIHNpbmdsZSBjb21wbGFpbnQu
Cj4+Pj4gCj4+Pj4gWy4uLl0KPj4+Cj4+PiBBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQo+
Pj4KPj4+IFsxLzNdIG10ZDogc3BpLW5vcjogc3BhbnNpb246IHMyNWZsMjU2czA6IHJlbW92ZSBT
S0lQX1NGRFAgZmxhZwo+Pj4gICAgICAgKG5vIGNvbW1pdCBpbmZvKQo+Pj4gWzIvM10gbXRkOiBz
cGktbm9yOiBkb24ndCBjbGVhciB0aGUgU05PUl9GXzRCX09QQ09ERVMgZmxhZyBvbiBmYWlsdXJl
Cj4+PiAgICAgICAobm8gY29tbWl0IGluZm8pCj4+PiBbMy8zXSBtdGQ6IHNwaS1ub3I6IHJld29y
ayBmbGFzaCBwYXJhbWV0ZXIgaW5pdGlhbGl6YXRpb24KPj4+ICAgICAgIChubyBjb21taXQgaW5m
bykKPj4+Cj4+PiBQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0
IGFuZCB3aWxsIGJlCj4+PiBwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJv
Ym90IGNvbXBsYWlucyBieSB0aGVuKS4KPj4KPj4gRGlkIHlvdSBzZWUsIHRoYXQgdGhlcmUgd2Fz
IGEgdjEgb2YgdGhpcyBzZXJpZXM/IFRoZXJlIHdhc24ndCBtYW55Cj4+IGNoYW5nZXMgZm9yIHRo
ZXNlIHRocmVlIHBhdGNoZXMuIEp1c3Qgd2hhdCBUdWRvciBtZW50aW9uZWQgdGhhdCB0aGUKPj4g
dW5zdXBwb3J0ZWQgUkRTRkRQIG9wY29kZSBzaG91bGQgYmUgbWVudGlvbmVkIGluIHRoZSBjb21t
aXQgbWVzc2FnZSwKPj4gdG9vLgo+Pgo+PiBBcGFydCBmcm9tIHRoYXQsIHRoZSBzZXJpZXMgbm93
IGluY2x1ZGVzIGZpeGVzIHRoYXQgU2FzaGlrbyBmb3VuZCwKPj4gdGhhdCBpcywgdGhlIHJvbGxi
YWNrIGluIGNhc2Ugb2YgYSBmYWlsZWQgU0ZEUCBwYXJzaW5nIGlzIGJyb2tlbi4gSQo+PiBjYW4g
YWxzbyByZWJhc2UgdGhhdCBvbiB0b3Agb2YgdGhlc2UgdGhyZWUgcGF0Y2hlcy4KPgo+IFNvcnJ5
LCBJIGFjdHVhbGx5IGFwcGxpZWQgaXQgbGFzdCBGcmlkYXkgYW5kIHB1c2hlZCBvbmx5IHRoaXMg
bW9ybmluZy4gSQo+IHdpbGwgZHJvcCB0aGUgcGF0Y2hlcyBhbmQgYXBwbHkgdjEuCgpBY3R1YWxs
eSwgbm8uCgpJIGRpZCBhcHBseSBpdCB0byBhIGxvY2FsIGJyYW5jaCBmb3IgdGVzdGluZywgYW5k
IEkgZm9yZ290IGFib3V0IGI0CnBpY2tpbmcgaXQgdXAuIFNvIHRoZXNlIHBhdGNoZXMgbmV2ZXIg
cmVhY2hlZCBsaW51eC1tdGQgKGhlbmNlIHRoZSAibm8KY29tbWl0IiBsaW5lcyBiZWxvdyBlYWNo
IGNvbW1pdCkuCgpUaGVyZSBhcmUgdHdvIHdheXMgZm9yd2FyZDoKLSBXZSBjb25zaWRlciB0aGUg
d2hvbGUgc2VyaWVzIGZvciBtdGQvZml4ZXMgKHdoaWNoIEkgd2lsbCBsaWtlbHkgc2VuZAogIG5l
eHQgd2VlaykgYW5kIEkgdGFrZSB2MS4KLSBXZSBrZWVwIHRoZSBzZXJpZXMgZm9yIHNwaS1ub3Iv
bmV4dCBhbmQgSSBsZXQgc29tZW9uZSBlbHNlIGFwcGx5IGl0CiAgdGhlcmUuCgpUaGFua3MsCk1p
cXXDqGwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
