Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158BECAAD2
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Aug 2022 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP5fYXoZY+quWCM+09pr0aD1x8C9IPHuZp7I4oWVTX8=; b=XogV8zoZboIqAK8AzjEtg9upOI
	jZOxK3h5vTPRlL2xFNsRqBiDuol/+GhUqt5f+ANRRaC9xbtXyW/+dWYGjn55e0ZjWRoPLrBbO+tss
	ZVx0gzLciCB0v0IK2VMv14WyCqW5bnAuN6/6OFcQ3E1BK7Q52FHzomk/7pD8fHuGOpLoHU3Ue21dg
	kbRMRTGd5Ed6Nug8eM0Kiat5rlI8ORs8QD5FD4LtoCPuL4MdXgXz8SG/cB90oMDkQ6C5qz6Te/ygP
	WC3l1sPGIeYMOlVLSRNMZvSfcJKlu5FywM/0o+PmNBO3C/Ojn8GNVdQYF2CEOzbYpNGUxdV/1ejXK
	fJoFvrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJUV-00HaWD-OR; Sun, 28 Aug 2022 14:42:23 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJUH-00HaP7-NC; Sun, 28 Aug 2022 14:42:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CD1F022D1;
	Sun, 28 Aug 2022 16:42:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661697727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqBAZqXYDvhzoXmHe6e4y35S0OHJDpcUa6j95Hgzs9U=;
	b=oAEZbSk6W/fng85Hmx1hfGvezRZQdnn/W3FvzlQ1CJ2nHzZPXUo68i0K45RNp0KULGblgk
	ZR+kaPBLcDmrgh6MrCqQqzAnUeWsC49R9qT656pA3ziBKJgi5TIBPTMOkdR6QI3gVUJ+pa
	UxxMaMCRXX9RByGYCZADVFuyhd95Jqvks509r6OfaC1teRW0pFDxdEk/EP9xb6R1ddtmEq
	NLANKNnVcXLW4s1v80eTAUSWYUwySN71KTQgl3j4aJ6LOHqw3rv17qPtCdc5bkB6ArM6M5
	pjSok52jP0J63L+38jWEvwCvxbH8QOGp/zequszdEmfw8cDMatcwyWyzr5wlrg==
MIME-Version: 1.0
Date: Sun, 28 Aug 2022 16:42:07 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [RFC PATCH v1 12/14] nvmem: layouts: rewrite the u-boot-env
 driver as a NVMEM layout
In-Reply-To: <f830543b-9b66-5785-60f8-27ea05d49eee@milecki.pl>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-13-michael@walle.cc>
 <f830543b-9b66-5785-60f8-27ea05d49eee@milecki.pl>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3b8a14fe018973dc5450192cce6851e2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_074209_948657_65B2EB88 
X-CRM114-Status: GOOD (  12.66  )
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

QW0gMjAyMi0wOC0yOCAxNjowNCwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gT24gMjUuMDgu
MjAyMiAyMzo0NCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gSW5zdGVhZCBvZiBoYXJkY29kaW5n
IHRoZSB1bmRlcmx5aW5nIGFjY2VzcyBtZXRob2QgbXRkX3JlYWQoKSBhbmQKPj4gZHVwbGljYXRp
bmcgYWxsIHRoZSBlcnJvciBoYW5kbGluZywgcmV3cml0ZSB0aGUgZHJpdmVyIGFzIGEgbnZtZW0K
Pj4gbGF5b3V0IHdoaWNoIGp1c3QgdXNlcyBudm1lbV9kZXZpY2VfcmVhZCgpIGFuZCB0aHVzIHdv
cmtzIHdpdGggYW55Cj4+IE5WTUVNIGRldmljZS4KPj4gCj4+IEJ1dCBiZWNhdXNlIHRoaXMgaXMg
bm93IG5vdCBhIGRldmljZSBhbnltb3JlLCB0aGUgY29tcGF0aWJsZSBzdHJpbmcKPj4gd2lsbCBo
YXZlIHRvIGJlIGNoYW5nZWQgc28gdGhlIGRldmljZSB3aWxsIHN0aWxsIGJlIHByb2JlZDoKPj4g
ICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QsZW52IjsKPj4gdG8KPj4gICAgY29tcGF0aWJsZSA9ICJ1
LWJvb3QsZW52IiwgIm52bWVtLWNlbGxzIjsKPj4gCj4+ICJudm1lbS1jZWxscyIgd2lsbCB0ZWxs
IHRoZSBtdGQgbGF5ZXIgdG8gcmVnaXN0ZXIgYSBudm1lbV9kZXZpY2UoKS4KPj4gInUtYm9vdCxl
bnYiIHdpbGwgdGVsbCB0aGUgTlZNRU0gdGhhdCBpdCBzaG91bGQgYXBwbHkgdGhlIHUtYm9vdAo+
PiBlbnZpcm9ubWVudCBsYXlvdXQgdG8gdGhlIE5WTUVNIGRldmljZS4KPiAKPiBUaGF0J3MgZmlz
aHkgYnV0IG1heWJlIHdlIGNhbiBpZ25vcmUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBhdAo+IHBv
aW50LgoKQXMgbWVudGlvbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIsIHRoaXMgaXMgd2h5IHRoaXMg
aXMgYW4gUkZDLiBJCmRpZG4ndCBzZWUgYW55IHVzZXJzIGluIHRoZSBkZXZpY2UgdHJlZSwgbm9y
IGNhbiBJIHNlZSBob3cgdGhpcwp3b3VsZCBoYXZlIGJlZW4gdXNlZCBhbnl3YXksIGJlY2F1c2Ug
eW91IGNhbm5vdCBmaW5kIGEgY2VsbCBieQppdHMgZGV2aWNlIHRyZWUgbm9kZSwgYmVjYXVzZSBu
b25lIGlzIHJlZ2lzdGVyZWQuIFNvIG1heWJlIHdlCmNhbiBzdGlsbCBjaGFuZ2UgdGhlIGNvbXBh
dGlibGUgc3RyaW5nLgoKLW1pY2hhZWwKCj4gU3RpbGwgeW91IG5lZWQgdG8gdXBkYXRlIERUIGJp
bmRpbmcuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
