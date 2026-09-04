Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B1EC624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCK5Aj1UcjP5IMfIp/MQkwLb0GVoHPrH1SWoxFKkrwA=; b=T96GvoDz8St3iQ
	EmYwL+WXJ2Nm6A127v8oJyTW0/lKOQnSSnEG+v+cu37SUad6toezlf2yZZdVf/1PE6ylSN7075a+B
	c5hVuj4bDChWTyjp+MTf/tTfo8lUwNPn7oYInejQX4tnfPrrdMsaoOE9XrZwGkRh2SVIyFBGKVLYm
	0Yb44qdV9pdkQyYcBgL40v1e0lpEEfsRl9dq1R/YIlyJlPlMExgqLWJRtoCIyTjGOzDAKDd70IJ8d
	T22SXHnxVpasPnZXIueL+gpIltWhDC5ts7rijZy0CEYiywzO1/WJogGrTNYvWaXR+70kafv5hlNlV
	KPKMSti56rpOTSnMdDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs7-00000002uDS-1YTn;
	Fri, 04 Sep 2026 17:38:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Xs6-00000002uBo-17rN
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hndf6CwZf6nS1IlGj0wnHD6ulaeGCFM5KFckNuUCVuw=; b=reAZmYmJFiA9EPq+elQIvbl6/W
	DD4XM0Qjdtlw3etq+0ULk7A4CjAujCsiSSAH/VD8PaY/CWmYWuiEnCGEMm3+xfzxS1QRfCNdPPrxC
	lYU8bnLymlwYkwZitWc64glJF4nCQDMW9qDdpwlI+mQRYN/T932kyJEVuYFgFuooXQKHJ9AFw6p7T
	xDnJ56ZvGNPz76h8NBs82SYHFGJrzNneLOel02nFEleTbpv/FJZW7rxJ8QlAljrtPuzTqpdW1l7QF
	cTB8dbWaBmqMNOM1x1U7LBAiI5KeXskw7gpcrmxxhVyUrIdcaak0rwLKM2+FteYU/s0n7gQ7h9q9Q
	wcOZOB5Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2Xs2-0000000EMAH-1e3g
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:38:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D5754E41520;
	Fri,  4 Sep 2026 17:38:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 314736057F;
	Fri,  4 Sep 2026 17:38:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E99C11C78767;
	Fri,  4 Sep 2026 19:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hndf6CwZf6nS1IlGj0wnHD6ulaeGCFM5KFckNuUCVuw=;
	b=jh5kpaIx11p1NK1l7kdsvZdSCcrxYsimt3irEFP/sAH1V1nf0V7i+f2ZRUXJEt+5llgIPT
	UKbQViDw0uDYHo6DJPtH8N8YTZ0e7HJvN6gQEOSikM26E8UsN40dVnw6ENjLbTfvc7t/G1
	AP1/3BzGthp1IWp1nTfOIWNrtXfVKxO8itxHoHPaSA1mURvZJHCB0G3WcQDCT7GXMupVdl
	hp+4739LkCYx4SYW5oYQzQUVwPl83h+OlCRJVM5VCEv37rC63pY+0sQtHHrO+BwGi45A3g
	nGDsRc4Apl6gq9tboDQuQoH+dC6bpN8Tg+AO0kYwtiskVQMfUGs+C0Br9KVBvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mehmet Fide <mehmet.fide@screeningeagle.com>
In-Reply-To: <20260901073907.2443698-1-mehmet.fide@gmail.com>
References: <20260901073907.2443698-1-mehmet.fide@gmail.com>
Subject: Re: [PATCH v3 0/2] mtd: rawnand: vf610_nfc: fix reads on chips
 with more than 64 bytes of OOB
Message-Id: <178854351111.1467647.6175697246102601569.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:38:31 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_183834_569787_A37FA027 
X-CRM114-Status: UNSURE (   7.08  )
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

T24gVHVlLCAwMSBTZXAgMjAyNiAwOTozOTowNSArMDIwMCwgTWVobWV0IEZpZGUgd3JvdGU6Cj4g
RnJvbTogTWVobWV0IEZpZGUgPG1laG1ldC5maWRlQHNjcmVlbmluZ2VhZ2xlLmNvbT4KPiAKPiBU
aGUgZHJpdmVyIG9ubHkgaW1wbGVtZW50cyB0aGUgNjQtYnl0ZSBPT0IgZm9ybWF0IHRoZSBjb250
cm9sbGVyCj4gdHJhbnNmZXJzLCBzbyBjaGlwcyB3aXRoIGEgbGFyZ2VyIE9PQiAodGhlIENvbGli
cmkgVkY2MSdzIE1YMzBMRjRHMjhBQwo+IGhhcyAxMTIgYnl0ZXMpIHN0b3BwZWQgd29ya2luZyB3
aGVuIG5hbmRkZXZfaW5pdCgpIGJlZ2FuIHJlc3RvcmluZwo+IG10ZC0+b29ic2l6ZSBhZnRlciAt
PmF0dGFjaF9jaGlwKCk6IHRoZSBwYXJpdHkgbW92ZWQgYW5kIGV2ZXJ5Cj4gRUNDLXByb3RlY3Rl
ZCByZWFkIGZhaWxlZCwgaW5jbHVkaW5nIHRoZSBCQlQgYW5kIGV2ZXJ5dGhpbmcgVUJJIG5lZWRz
Lgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMl0gbXRkOiBy
YXduYW5kOiB2ZjYxMF9uZmM6IGZpeCByZWFkcyBvbiBjaGlwcyB3aXRoIG1vcmUgdGhhbiA2NCBi
eXRlcyBvZiBPT0IKICAgICAgY29tbWl0OiAxNDAwZTg4MDIzZjQ1NTEwMzJkZjZhMzM5N2EzNzZk
Y2RmNjdmM2Q0ClsyLzJdIG10ZDogcmF3bmFuZDogdmY2MTBfbmZjOiBmaXggZmFsc2UgYml0Zmxp
cHMgb24gcmVhZHMgb2YgZXJhc2VkIHBhZ2VzCiAgICAgIGNvbW1pdDogOGQ0MGIxMjYxZTJjOTY3
MTczYjg4YzJmNWQxYzk3Y2ZlZWQxYTJlNQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
