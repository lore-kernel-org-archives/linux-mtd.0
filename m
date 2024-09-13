Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D659EFC616B
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Sep 2024 18:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJKqqez0IZxt13gXnUmkiGyoukk81vQZ8jygSnDGPr0=; b=CoVoQVvYyTZefa
	bPRBV1jHJl8P6uJ6mPd6THzD5FQOG2o+gdQzgUDYsIfU6bYEI3y2PqRpvUh6adbs/obCcSEukOZ/6
	0qZsJU/cdmk05QDlvJf4zCMG8G/f1yVOzr0zvsuxC/xwhFGJn8Djgm6t4s7A0Ii/Ua+qpNlF7l2A3
	goJgXGPymd+zJBCl3KERqOLfZfhD57iQ/iB25kc2QFWvvZTfvndNVNXUAcBwckoQh3MFWSTTWUMM0
	m38UMTFDclTTxa6dst52WQAQbDYPf5xWJ8fJNosYqbjxs5SKokguJI5dVFoggtQCbyisSYOJ7Uq/J
	b25SekhBvbWg+Qodf3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAbn-0000000GkHZ-0bhx;
	Fri, 13 Sep 2024 18:01:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAZo-0000000GjpL-45YX
	for linux-mtd@lists.infradead.org;
	Fri, 13 Sep 2024 17:59:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4F33240005;
	Fri, 13 Sep 2024 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726250359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFG8BCFWfH/QO4TIWeCHHhFJzw0irc53KyutK0wDaow=;
	b=MrRRoUAMI5qeaxc+X65tjT1dugvFFiEJ4WlRlbb0Gb1X5jY6dhmHahgj77Cm8bkhZOEPB1
	0MpwHtDvmtC+JpFLWR6ICjy2LmLmj3HwAlH93J9FhdhDZfQJzRr/a4Hse5lFDeQqBDqbY3
	zialINq0z/RGqZA9tlQoWRighbJr9jHV3mOI5en1QK8TVfNONZ5gKZjkCsJEmh3oyV44dK
	Q52Stx077vi6dcQPMMvfa6STXPLAzRIERbQlAqXwGsfQ/Fw54NOdfcurQCzOt86/vXXv94
	frLgHzIaz9Bu5D6zDvg1DB1OnUqOf/t//JvkyWtF2bAQz2SXcHMQuhYfe/RLnQ==
Date: Fri, 13 Sep 2024 19:59:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
 <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.12
Message-ID: <20240913195915.4bd2a88c@xps-13>
In-Reply-To: <mafs0bk0tf9na.fsf@kernel.org>
References: <mafs0bk0tf9na.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_105925_466627_ADD8ABE4 
X-CRM114-Status: GOOD (  10.18  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFRodSwgMTIgU2VwIDIw
MjQgMTI6Mjg6NTcgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBIZXJlIGFyZSB0aGUgU1BJIE5P
UiBjaGFuZ2VzIGZvciB2Ni4xMi4gSSB1c3VhbGx5IGJhc2UgbXkgYnJhbmNoIG9uIHRvcAo+IG9m
IC1yYzEsIGJ1dCB0aGlzIHRpbWUgYXJvdW5kIGl0IHNlZW1zIEkgZGlkIGl0IGEgZmV3IGNvbW1p
dHMgYWZ0ZXIKPiB2Ni4xMS1yYzEuIFByb2JhYmx5IGp1c3QgZGlkbid0IG5vdGljZSB0b3J2YWxk
cy9tYXN0ZXIgaGFkIG1vdmVkLiBTaG91bGQKPiBtYWtlIG5vIGRpZmZlcmVuY2UgaW4gcHJhY3Rp
Y2UgYW55d2F5LgoKSSBkb24ndCB0aGluayBJIGNhbiBtZXJnZSB5b3VyIHRhZyB3aXRob3V0IHRo
ZSA0IG1pbm1heCBwYXRjaGVzLCB3aGljaAptZWFucyB0aGV5IHdpbGwgYXBwZWFyIGluIG15IGZp
bmFsIG1lcmdlIHJlcXVlc3QgdG8gTGludXMsIHVubGVzcyBJCmV4cGxpY2l0bHkgZG9uJ3QgdXNl
IGFuIC1yYyBhcyBhIGJhc2UsIGJ1dCB0aGlzIG11c3QgYmUganVzdGlmaWVkIEkKYmVsaWV2ZS4g
Q2FuIHlvdSBwbGVhc2UgZml4IHRoZSBicmFuY2ggYW5kIHJlZ2VuZXJhdGUgdGhlIHRhZz8gSSBk
b24ndAptaW5kIHBlcnNvbmFsbHkgaWYgeW91IGZvcmNlIHB1c2gsIGlmIGl0IG1ha2VzIHRoZSBo
aXN0b3J5IG1vcmUgY2xlYXIuCgpUaGFua3MhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
