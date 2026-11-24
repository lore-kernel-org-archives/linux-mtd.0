Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C6606A333
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aW/yffMD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bJYtdM0n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7M0dm4U99B9K/mKk9k93SKEjk/2iYqnKPiuRaSFgxE4=; b=aW/yffMDAq4rvCYa3geZfAkw8X
	fOo7mW6w1i+Qerr+6sPWZ0NE9oC0RCAfoXgpIWiWkWxsQMHNs51osHUOIvPD658Pch6dJo/R+7Lzh
	G2VJZXSrHTK3TxagbY4FsyOq0zDzqq6H1lZo5wQq9cGWUYau8hV8SIDehlhNZv2/bhqHhrvH/zv5g
	ehRMg5sAXZ1AcEqp0hWSZcZZZ8M91JQwdhbeibjT979kAw99zXyr5UO6DP4mVA0Nb9k9f/1rcqbxX
	GjfnsGD/IG5Z7jHxQ4WldeefXrBkzVk87SozpMWmiOCiluFooSWyIz7Nb6Dg1CNQp0nTOlyQaM67n
	2JMra2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnjB-00000006DP1-1RFh;
	Tue, 24 Nov 2026 10:26:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnj5-00000006DOU-3qJJ
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 10:26:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A79E4E41755;
	Tue, 24 Nov 2026 10:26:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F05F601E1;
	Tue, 24 Nov 2026 10:26:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFA1411E69B4F;
	Tue, 24 Nov 2026 11:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795515968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UoCrI4A7Hlf20jxhBPJOheOwVhrEFPq+18YbW/SpkGs=;
	b=bJYtdM0nd0zscJzwMib6gs+d/tH1oQ4iS0FdZefiInpKNrIBCF9Kr3j1ZrTLB44Yw4v2Iz
	y3R9sA8etT7hAVTffx/md6s9HhwcTr+zXTirk+pP6RrmvCC3TmZ3FOyqbfoab5LoxutBk2
	ObUnzIcjjzvQVhJvcnegg+7tFG10ZAd8BWewOKiCIJ/R1EBuvVAm4h5V/mu5ABcE9aTJRf
	fxB/QzDLuQ4gHFXHadLXeF/R0roEZgq5w/zOtTV8m1aOWcO73HQVeDA/DtTc4alo4tonzh
	DpqpO2gjb5vRTPTA7nyDYphvh5RVeuFQlVvCjRdn800y9sUKsAb/J5sHn7TDNA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  praneeth@ti.com,  u-kumar1@ti.com,
  p-mantena@ti.com,  a-dutta@ti.com,  s-k6@ti.com,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/11] mtd/spi-mem: Enable DQS control
In-Reply-To: <164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk> (Mark
	Brown's message of "Fri, 20 Nov 2026 17:51:41 +0000")
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
	<164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 11:26:04 +0100
Message-ID: <875wxmttj7.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_022616_158102_5F2516ED 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAvMTEvMjAyNiBhdCAxNzo1MTo0MSBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgTm92IDIwLCAyMDI2IGF0IDA2OjE0OjI2UE0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4KPj4gVGhpcyBzZXJpZXMgYXBwbGllcyBvbiB0b3Agb2Yg
djcuNC1yYzIgYW5kIFNhbnRob3NoJ3MgUEhZIHR1bmluZyBzZXJpZXMuCj4KPiBQbGVhc2UgZG9u
J3Qgc2VuZCBwYXRjaGVzIHRoYXQgZGVwZW5kIG9uIG90aGVyIGluIGZsaWdodCBzZXJpZXNlcywg
aXQKPiBqdXN0IG1ha2VzIHRoaW5ncyBtdWNoIGhhcmRlciB0byBtYW5hZ2UuCgpJIHVuZGVyc3Rh
bmQsIGp1c3Qgd2FudGVkIHRvIGxldCBTYW50aG9zaCBldC4gYWwuIGtub3cgYWJvdXQgdGhpcwpw
dWJsaWNseS4KCldoYXQgaXMgeW91ciBwbGFuIHdpdGggU2FudGhvc2gncyBzZXJpZXM/IElmIGhp
cyBzZXJpZXMgd2lsbCBtYWtlIGl0CnRoaXMgcm91bmQgSSB3aWxsIHJlc3BpbiBvbmNlIGFwcGxp
ZWQuIE90aGVyd2lzZSBJIGNhbiBqdXN0IHJlc3BpbiB0aGUKaW5kZXBlbmRlbnQgc3BpLW1lbSBi
aXRzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
