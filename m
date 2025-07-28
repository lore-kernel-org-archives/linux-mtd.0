Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAEEC87FC9
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPIBXlxxcray1ytXmn3PlY1iZEAwlB8qijkat9FHLqo=; b=vPEEXCDHyyIVou
	ENV9zXK+e85ylBUcTxjGyujQ7+1kPGNg4oeM2VDOJ7MUtbIFrkmYO4rfFWOB/GAp+chrc7V63oL06
	D0PwvHr26YEOM+0HB2o5wnbLQIcEwFV/COGrqQOAvsIyOYlkZnWBaxenet1m77EKoodBVkgXAHh5l
	GgERrd4inVLsBopSoGlTEOHQwORISUs1NkGq2e+bLSvruiylFv5+BJucx8VjQ/gH/AgeZNrs244+Y
	fIfaDToWky3n56kHJBVcZkYWNwq0hWC7NVir32N8fZpxdlwDTtIdPh3VPaSXsG22IIkBsLOPQ96t6
	wwFiHo1K7DdShlkt9KEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM18-0000000ELh7-3f42;
	Mon, 28 Jul 2025 11:27:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv3-0000000ECXe-1IgM
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V6TPmirTYIktwxRKxnrYUmhptFTRZmeACOdvV8UNk4Y=; b=BOYV0nd4kRkyCUX5I2EjNebQQh
	vrFO5w49r3TE7eTFH5DKbzH1bpFPUOymtGMIg4ojOBq31eiOKMWqCkjUO99ycsMDQqfzDcx4q8DUw
	8sm1Y0k2IG0AxtQo+H8TLQPddMmffV8l+dBDwg6KTpnAppcmUHoomYMyM7P7Co5NheablLwZhHFge
	tp5V4Yv4RpHbF4wHZUsF2rWC6XX1xhkr1O805lp0Xya8/PDGoPa5hA2qogy2EWIQEiagMRPQXBqtL
	I/6ihNZbQNBrHMcuWz13CkrOTXc4g5AAFSqJOUa0wt/jMt6Y0AKdUpfNCEWGO6umlUMogJQGVuN0o
	zbZ6Zdgw==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKur-0000000CQx3-416u
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81BB643210;
	Mon, 28 Jul 2025 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6TPmirTYIktwxRKxnrYUmhptFTRZmeACOdvV8UNk4Y=;
	b=WkAdMxskiHHZ9qvPIIAl6RvLyzX0LBS3aXgj+A6Wwup/bVUSbZNDHqfonn6j1/6ufo4vlA
	lG7czmoqk4H0Zuuh1XvMdjrS3Z5xcEH6Q8JeqvEHsc3S+80LBFYIl2z68OlrBZ1pVM/10b
	vx//0oNgq6BI/19Bp1YZGZynZPuJikpAf6ZMtkmC34H8rSYl1+HdLsxnumoSiAGCxykrk7
	Agin4Nh+a2Y3i3C9rd1kwf03sD6ziDBUIg+5eczAB/37QJR7ptp1o+PQzXGSC8HQISORCF
	X8Mk4EiYpjX92AE80fFE5Bp34qjPJX4yfBDMKEFMnvMKvbDOGDsGhd6uD3KMaQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, gigadevice2025@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250630034931.7962-1-gigadevice2025@gmail.com>
References: <20250630034931.7962-1-gigadevice2025@gmail.com>
Subject: Re: [PATCH] mtd:spinand:gigadevice:Add support for GD5F1GM9 chips
Message-Id: <175369782348.102528.16697706993689245449.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehgihhgrgguvghvihgtvgdvtddvheesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111714_056862_EAF42D2D 
X-CRM114-Status: UNSURE (   5.10  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCAzMCBKdW4gMjAyNSAxMTo0OTozMSArMDgwMCwgZ2lnYWRldmljZTIwMjVAZ21haWwu
Y29tIHdyb3RlOgo+IC0gR0Q1RjFHTTlVRXh4RyAoSUQ6Yzg5MTAxIDMuM1YpCj4gLSBHRDVGMUdN
OVJFeHhHIChJRDpjODgxMDEgMS44VikKPiAKPiBCb3RoIGRldmljZSBmZWF0dXJlOgo+ICAgLSAx
R2IgZGVuc2l0eSAoMTAyNCBibG9ja3MpCj4gICAtIDIwNDgtYnl0ZSBwYWdlIHNpemUgd2l0aCAx
MjgtYnl0ZSBPT0IKPiAgIC0gOC1iaXQgRUNDIHJlcXVpcmVtZW50IHBlciA1MTIgYnl0ZXMKPiAg
IC0gUXVhZCBJL08gUmVhZCBzdXBwb3J0IChvcGNvZGUgRUJIKQo+ICAgLSB0UFJPRyDiiaQgMzAw
dXMgdHlwaWNhbCBwYWdlIHByb2dyYW0gdGltZQo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQv
bmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOnNwaW5hbmQ6Z2lnYWRldmljZTpBZGQgc3VwcG9ydCBm
b3IgR0Q1RjFHTTkgY2hpcHMKICAgICAgKG5vIGNvbW1pdCBpbmZvKQoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
