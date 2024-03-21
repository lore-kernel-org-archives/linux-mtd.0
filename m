Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B0FC54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2AEyXT6sPBQe58Ii1NmdFvT7HJMbdBjUpP0CnQwCl4=; b=odeh2Oij003ShW
	h7ty/4yTs+VjwG1vpOqLsP/3vDa9gr0qjN2Ji8jBcWoUFWHC/wAgN+0O0h29KPFwU5qqruTjd0xbr
	Ym68DMwksgBvRZcblUMIqS1gOWVvN+dICx5ZQE3TLW/GsonD1WrQRyW2wALEmNi50L5RdavhoeUta
	gBVV9sHhRzZCb9X1PccUUPnI8YYWKL5wKrJiXPClc1DjaGvaC1zAU8Vxyek3fS+dwd4okzP5jcynv
	1ZvzIntgUpTzK0XKDIAE6CgV3vUZrzgibaN+26hRgCt47ks0RoEq6/oG8DIOy9nHIEivdNuuRcGKd
	rdpKe83wFR+xO53JZ3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnFjP-00000002eHi-2NbQ;
	Thu, 21 Mar 2024 10:33:07 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnFjK-00000002eGR-2lLY
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 10:33:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CD3A20011;
	Thu, 21 Mar 2024 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711017178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsgJgtM80y8zcZyOXFGzCleStLkUBxOtrcW1tHKq1gc=;
	b=dlIcq+v3fizKnPeaA0kQitG/JgzXMJFdLMAD7QAu1EKxz+DWSEMqtZjf2z1jeyXakioAWx
	JUPTnbYVxnTMJ0d2vKYOGEuooEKou3UVIFwTTaR/4oY/RZ/JUBJFPuUZHG34rnBjS6O87e
	aI5egh1vEAGDy1hEdDzLGPoN7UTa2HHkuXQJv9hcucmT9aR8EA1wBajbp0P3I8SfE95Fl7
	CjEOdsyoj8vij8jOcJw8KnbQ4l9JDSL0l5ZqB4Ku10MQ4wyu8rM6aeAfadtlkBSaVqY5FG
	K3q5N4ANRhmQVRw1/1VVUhPkRs193dI1a0M9g45k53uot/G9drB29mzWUTDXMg==
Date: Thu, 21 Mar 2024 11:32:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: limit OTP NVMEM Cell parse to non Nand devices
Message-ID: <20240321113256.7e66ac0f@xps-13>
In-Reply-To: <20240321095522.12755-1-ansuelsmth@gmail.com>
References: <20240321095522.12755-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_033303_009683_AF82239E 
X-CRM114-Status: GOOD (  16.34  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gVGh1LCAyMSBNYXIg
MjAyNCAxMDo1NToxMyArMDEwMDoKCj4gTVREIE9UUCBsb2dpYyBpcyB2ZXJ5IGZyYWdpbGUgYW5k
IGNhbiBiZSBwcm9ibGVtYXRpYyB3aXRoIHNvbWUgc3BlY2lmaWMKPiBraW5kIG9mIGRldmljZXMu
Cj4gCj4gTlZNRU0gYWNyb3NzIHRoZSB5ZWFycyBoYWQgdmFyaW91cyBpdGVyYXRpb24gb24gaG93
IENlbGxzIGNvdWxkIGJlCj4gZGVjbGFyZWQgaW4gRFQgYW5kIE1URCBPVFAgcHJvYmFibHkgd2Fz
IGxlZnQgYmVoaW5kIGFuZAo+IGFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgd2FzIGVuYWJsZWQg
d2l0aG91dCB0aGlua2luZyBvZiB0aGUgY29uc2VxdWVuY2VzLgo+IAo+IFRoYXQgb3B0aW9uIGVu
YWJsZXMgTlZNRU0gdG8gc2NhbiB0aGUgcHJvdmlkZWQgb2Zfbm9kZSBhbmQgdHJlYXQgZWFjaAo+
IGNoaWxkIGFzIGEgTlZNRU0gQ2VsbCwgdGhpcyB3YXMgdG8gc3VwcG9ydCBsZWdhY3kgTlZNRU0g
aW1wbGVtZW50YXRpb24KPiBhbmQgZG9uJ3QgY2F1c2UgcmVncmVzc2lvbi4KPiAKPiBUaGlzIGlz
IHByb2JsZW1hdGljIGlmIHdlIGhhdmUgZGV2aWNlcyBsaWtlIE5hbmQgd2hlcmUgdGhlIE9UUCBp
cwo+IHRyaWdnZXJlZCBieSBzZXR0aW5nIGEgc3BlY2lhbCBtb2RlIGluIHRoZSBmbGFzaC4gSW4g
dGhpcyBjb250ZXh0IHJlYWwKPiBwYXJ0aXRpb25zIGRlY2xhcmVkIGluIHRoZSBOYW5kIG5vZGUg
YXJlIHJlZ2lzdGVyZWQgYXMgT1RQIENlbGxzIGFuZAo+IHRoaXMgY2F1c2UgcHJvYmUgZmFpbCB3
aXRoIC1FSU5WQUwgZXJyb3IuCj4gCj4gVGhpcyB3YXMgbmV2ZXIgbm90aWNlIGR1ZSB0byB0aGUg
ZmFjdCB0aGF0IHRpbGwgbm93LCBubyBOYW5kIHN1cHBvcnRlZAo+IHRoZSBPVFAgZmVhdHVyZS4g
V2l0aCBjb21taXQgZTg3MTYxMzIxYTQwICgibXRkOiByYXduYW5kOiBtYWNyb25peDogT1RQCj4g
YWNjZXNzIGZvciBNWDMwTEZ4RzE4QUMiKSB0aGlzIGNoYW5nZWQgYW5kIGNvaW5jaWRlbnRhbGx5
IHRoaXMgTmFuZCBpcwo+IHVzZWQgb24gYW4gRnJpdHpCb3ggNzUzMCBzdXBwb3J0ZWQgb24gT3Bl
bldydC4KPiAKPiBBbHRlcm5hdGl2ZSBhbmQgbW9yZSByb2J1c3Qgd2F5IHRvIGRlY2xhcmUgT1RQ
IENlbGxzIGFyZSBhbHJlYWR5Cj4gcHJvc3NpYmxlIGJ5IHVzaW5nIHRoZSBmaXhlZC1sYXlvdXQg
bm9kZSBvciBieSBkZWNsYXJpbmcgYSBjaGlsZCBub2RlCj4gd2l0aCB0aGUgY29tcGF0aWJsZSBz
ZXQgdG8gIm90cC11c2VyIiBvciAib3RwLWZhY3RvcnkiLgo+IAo+IFRvIGZpeCB0aGlzIGFuZCBs
aW1pdCBhbnkgcmVncmVzc2lvbiB3aXRoIG90aGVyIE1URCB0aGF0IG1ha2VzIHVzZSBvZgo+IGRl
Y2xhcmluZyBPVFAgYXMgZGlyZWN0IGNoaWxkIG9mIHRoZSBkZXYgbm9kZSwgZGlzYWJsZQo+IGFk
ZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgaWYgd2UgaGF2ZSBhIG5vZGUgY2FsbGVkIG5hbmQgc2lu
Y2UgaXQncyB0aGUKPiBzdGFuZGFyZCBwcm9wZXJ0eSBuYW1lIHRvIGlkZW50aWZ5IE5hbmQgZGV2
aWNlcyBhdHRhY2hlZCB0byBhIE5hbmQKPiBDb250cm9sbGVyLgoKWW91IGZvcmdvdCB0byB1cGRh
dGUgdGhlIGNvbW1pdCBsb2cgOi0pCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
