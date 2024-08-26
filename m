Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FC5C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yn/h9rUSGjx0HnZ7XD6qfj/OyPtI/hJVO78PUgKsmsI=; b=tEY1jl1PbIE0Kc
	fk8TaAmXq6P1EenIQ2p2wh741JzTE8KpTbe9puhvA1pQDsqcX5MJdiZ2PD+jujA/3wtUsNQESU9oO
	BkvgHiFOlBM64LGSFp2tX3OyUqudrtD1FgNawsAuoQhybhuZYtmdhGkjsbNHmK5GQQozX+lPPb2wy
	HsNR9OG9juNwLU04en26ZfLYPYAfzA6Y8eUx/M8Fq/VhI7IG1n3GVtGl/ULUFhx6HjhdVv74iapoF
	bhid/qGJJCjlIkPvsUzXPA7HbGosrnZDkVPhul6lH2VWBiPi2hHKMo89+4UeX2rtUs10veiLM+uya
	GVh0etA6ayduztko3uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWln-00000006t1W-3TAV;
	Mon, 26 Aug 2024 10:16:19 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWjp-00000006sJR-0nqs
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:14:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE0FC1BF204;
	Mon, 26 Aug 2024 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724667255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hrRodTOLiCRGoBbOUH+ZC/zB2XKXh+KXE5qYqsiVzvo=;
	b=mKLP1jLSuUKGoU5dNUHJkhaK4K6FZq6amAGu7iYdlCTpZcCsz/L0f59lX4VTjMa6lAaxOr
	42xV0sja6WKqt8r8O0yoKgZxyzcXSO63mOy2AH3UWQKxGxlPB+xwHEJB45EFu7aRvKmap4
	Yj7FEMI/MPyzRASTDIkOR0PrPEP1HfSkloZEcFdf3SrUpIcDaTuxV9BkWEEwYBf2y53ou8
	KBdcGVsAiewgcQmmKeZrpLbORYpp48CXSdaq1dal5Eo2INn8QPFdl7YEcVcz2J15RE7/5a
	PvnpP+nhFoskhP5ON+r45ny1svbHkfh8l78XJL5+3gPvOX7ePuAmlQHoKrJ3ZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/9] mtd: spi-nand: Continuous read support
Date: Mon, 26 Aug 2024 12:14:03 +0200
Message-ID: <20240826101412.20644-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_031417_406412_67B8243C 
X-CRM114-Status: GOOD (  10.81  )
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

SGVsbG8sCgpBZnRlciB0aGUgcmF3IE5BTkQgc2VyaWVzLCBoZXJlIGlzIGFuIGVxdWl2YWxlbnQg
c2VyaWVzIGJyaW5naW5nCmNvbnRpbnVvdXMvc2VxdWVudGlhbCByZWFkIHN1cHBvcnQgdG8gc3Bp
LW5hbmQuIFRoZSBnb2FsIGlzIHRvIG9wdGltaXplCnRoZSByZWFkcyB3aGVuIHNldmVyYWwgY29u
c2VjdXRpdmUgcGFnZXMgYXJlIHJlYWQuIE1vcmUgZXhwbGFuYXRpb25zCmFib3V0IHRoZSAicGh5
c2ljcyIgaW4gdGhlIHBhdGNoIDQgYWRkaW5nIGNvbnRpbnVvdXMgcmVhZCB0byB0aGUgY29yZS4K
ClRoZSBmZWF0dXJlIHN0b3BzIGF0IHRoZSBibG9jayBib3VuZGFyeSBmb3IgdHdvIHJlYXNvbnM6
Ciogc29tZSB2ZW5kb3JzIGRpZCBub3QgaW1wbGVtZW50IG1vcmUKKiBOQU5EcyBhcmUgYWNjZXNz
ZWQgdGhyb3VnaCBVQkkgdGhlc2UgZGF5cywgYW5kIHRoZXJlIGlzIGFic29sdXRlbHkgbm8KZ3Vh
cmFudGVlIChxdWl0ZSB0aGUgb3Bwb3NpdGUpIHR3byBjb25zZWN1dGl2ZSBMRUJzIHdpbGwgZW5k
LXVwIGludG8gdHdvCmNvbnNlY3V0aXZlIFBFQnMuCgpUaGUgZmVhdHVyZSB3YXMgdGVzdGVkIHVz
aW5nIE1hY3Jvbml4IE5BTkRzLCBhbmQgdGh1cyB0aGUgdmVuZG9yIGRyaXZlcgppcyB1cGRhdGVk
IHRvIGV4cG9zZSB0aGlzIG5ldyBmZWF0dXJlLgoKQmVuY2htYXJrcyBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBsYXN0IGNvbW1pdCwgYnV0IHRoZSBvdmVyYWxsIHRoZSBzcGVlZApnYWlucyBhcmUgaW1w
cmVzc2l2ZTogdXAgdG8gNDUlIHdoZW4gcmVhZGluZyBhIGJsb2NrIGluIDEtMS00IG1vZGUsCndo
ZXJlIGEgc3Vic3RhbnRpYWwgdGltZSBpcyBsb3N0IHdhaXRpbmcgZm9yIHRoZSBjaGlwIHRvIGJl
IHJlYWR5LgoKTW9kaWZpZWQgdXNlcnNwYWNlIHRvb2xzIGFyZSBhbHNvIGF2YWlsYWJsZSBmb3Ig
dGVzdGluZzoKKiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNDA4MjYwOTQ2
MjkuMTkwNjUtMS1taXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tL1QvI3QKKiBodHRwczovL2dpdGh1
Yi5jb20vbWlxdWVscmF5bmFsL210ZC11dGlscyBicmFuY2g6IGNvbnQtcmVhZAoKQ2hlZXJzLApN
aXF1w6hsCgpDaGFuZ2VzIGluIHYyOgoqIEEgUmV2aWV3ZWQtYnkgZnJvbSBQcmF0eXVzaC4KKiBE
cm9wcGVkIHRoZSBzdGF0aWMga2V5IG9wdGltaXphdGlvbiBhbmQgdHVybmVkIHRoZSBsb2dpYyBw
ZXItY2hpcAogIGluc3RlYWQgb2YgZ2xvYmFsLiAKCk1pcXVlbCBSYXluYWwgKDkpOgogIG10ZDog
bmFuZDogUmVuYW1lIHRoZSBOQU5EIElPIGl0ZXJhdGlvbiBoZWxwZXIKICBtdGQ6IG5hbmQ6IElu
dHJvZHVjZSBhIGJsb2NrIGl0ZXJhdG9yCiAgbXRkOiBzcGktbmFuZDogSXNvbGF0ZSB0aGUgTVRE
IHJlYWQgbG9naWMgaW4gYSBoZWxwZXIKICBtdGQ6IHNwaS1uYW5kOiBBZGQgY29udGludW91cyBy
ZWFkIHN1cHBvcnQKICBtdGQ6IHNwaS1uYW5kOiBFeHBvc2Ugc3BpbmFuZF93cml0ZV9yZWdfb3Ao
KQogIG10ZDogc3BpLW5hbmQ6IG1hY3Jvbml4OiBGaXggaGVscGVyIG5hbWUKICBtdGQ6IHNwaS1u
YW5kOiBtYWNyb25peDogRXh0cmFjdCB0aGUgYml0ZmxpcCByZXRyaWV2YWwgbG9naWMKICBtdGQ6
IHNwaS1uYW5kOiBtYWNyb25peDogQWRkIGEgcG9zc2libGUgYml0ZmxpcCBzdGF0dXMgZmxhZwog
IG10ZDogc3BpLW5hbmQ6IG1hY3Jvbml4OiBDb250aW51b3VzIHJlYWQgc3VwcG9ydAoKIGRyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYyAgICAgfCAyMTYgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KIGRyaXZlcnMvbXRkL25hbmQvc3BpL21hY3Jvbml4LmMgfCAxMjIgKysrKysrKysr
KysrKy0tLS0tCiBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLmggICAgICAgIHwgIDkwICsrKysrKysr
KysrLS0KIGluY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCAgICAgfCAgMTcgKysrCiA0IGZpbGVz
IGNoYW5nZWQsIDM4NSBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCi0tIAoyLjQzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
