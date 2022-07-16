Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9213DC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfVBIuD7dXuJrYX41L0DNmSwE4f+OuIgsxZdLbeLjrM=; b=n8xJk/amfdoQp4KVugzog8etmL
	YW23xIX9kEqn2W8WneKv6h7LBGrRukDlIyfL3Gu0hbER0Hl/G7FYEhYvlhE5UpABUl4rVrtTrRrbN
	kmjXorPbGAeRkkvZF36psRu/IsifTgHqMLUUfbqpzLZpEvfcACB0lG6worPbbY+8VQllPcNHqCplO
	228iV6J7Ck2n4DwNOqrgp4oxzSLpvDB60t6ejqLrvdMg1WecF381tg+uqvOX/klNolepxYKKDVSEe
	Vf77ae0LWLrQ2BAnw66oYtgvZ/uIz9vethZadcF0W6bKL2jAMlAl+PxyYoMa2ZGb3saBixRTwhDAf
	0vCLtVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCe83-00Exn3-G4; Sat, 16 Jul 2022 09:30:27 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCe7s-00Exi0-4S; Sat, 16 Jul 2022 09:30:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 577BB22239;
	Sat, 16 Jul 2022 11:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657963814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=alWQWqJmW7ZADT7MYc2k0cPnPrjW8BlVpk1tN0F8YTw=;
	b=sS/BtGpoDtyTxY4EdLTptKbkjwAr0HDroLGkiJzisbXIXU+WH+OkV+4FDIt4WdFSJoO22g
	9E6mMeRLFw1DxTw5GQd1lkgHQcBzQdUL5cUV/ek0bJ6l+urZi/zXN/rmJuQnbIcSaNsrtT
	5J7MYCx0RTPCSOP+R/0DGqJgt2soMNQ=
MIME-Version: 1.0
Date: Sat, 16 Jul 2022 11:30:12 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-sunxi@lists.linux.dev, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
In-Reply-To: <20220716082027.GK17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
 <d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
 <20220714205529.GE17705@kitsune.suse.cz>
 <33abf7b84860049c4a22605578303ff2@walle.cc>
 <20220714220744.GF17705@kitsune.suse.cz>
 <20220715092017.2ftoyzm22i4amrbt@ti.com>
 <20220716082027.GK17705@kitsune.suse.cz>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c6955eed3a445f4b87920fe0d47e7230@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_023016_369962_996FD3FA 
X-CRM114-Status: GOOD (  15.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMi0wNy0xNiAxMDoyMCwgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOgoKPj4gU28gaWYg
RFQgc2F5cyB0aGVyZSBpc24ndCBhIGZsYXNoIG9uIGEgc3BlY2lmaWMgQ1Mgd2hlbiB0aGVyZSBp
cywgdGhlbgo+PiBEVCBzaG91bGQgYmUgZml4ZWQgdG8gZGVzY3JpYmUgdGhlIGZsYXNoLCBhbmQg
dGhlbiB3ZSBjYW4gcHJvYmUgaXQuIAo+PiBZb3UKPj4gYm90aCBzZWVtIHRvIGJlIHNheWluZyB0
aGUgc2FtZSB0aGluZyBoZXJlLCBhbmQgSSBhZ3JlZS4KPiAKPiBUaGUgZGlzYWdyZWVtZW50IGlz
IGFib3V0IHRoZSBzaXR1YXRpb24gd2hlbiB0aGVyZSBpcyBzb21ldGltZXMgYSBmbGFzaAo+IGNo
aXAuCgpOby4gVGhlIGRpc2FncmVlbWVudCBpcyB3aGF0IHNob3VsZCBoYXBwZW4gaWYgdGhlIERU
IHNheXMgdGhlcmUgaXMKYSBkZXZpY2UgYnV0IHRoZXJlIGlzbid0LiBXaGljaCByaWdodCBub3cg
aXMgYW4gZXJyb3IgYW5kIGl0IHNob3VsZApzdGF5IHRoYXQgd2F5LiBZb3VyIGhhcmR3YXJlIGRl
c2NyaXB0aW9uIHNheXMgdGhlcmUgaXMgYSBmbGFzaApidXQgaXQgY2Fubm90IGJlIHByb2JlZCwg
c28gaXQgaXMgYW4gZXJyb3IuIFdoYXQgYWJvdXQgYSBib2FyZAp3aGljaCBoYXMgYW4gYWN0dWFs
IGVycm9yIGFuZCB0aGUgZmxhc2ggaXNuJ3QgcmVzcG9uZGluZz8gWW91CnRyYWRlIG9uZSB1c2Ug
Y2FzZSBmb3IgYW5vdGhlci4KCkFsc28gSSd2ZSBsb29rZWQgYXQgdGhlIFBIWSBzdWJzeXN0ZW0g
YW5kIHRoZXJlLCBpZiBhIFBIWSBpcyBkZXNjcmliZWQKaW4gdGhlIERUIGJ1dCBpc24ndCB0aGVy
ZSwgdGhlIGZvbGxvd2luZyBlcnJvciB3aWxsIGJlIHByaW50ZWQ6CiAgIGRldl9lcnIoJm1kaW8t
PmRldiwgIk1ESU8gZGV2aWNlIGF0IGFkZHJlc3MgJWQgaXMgbWlzc2luZy5cbiIsIGFkZHIpOwoK
QW5kIHRoYXQgaXMgZm9yIGEgYnVzIHdoaWNoIGNhbiBldmVuIGJlIGF1dG9tYXRpY2FsbHkgYmUK
cHJvYmVkL2RldGVjdGVkLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
