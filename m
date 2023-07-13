Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C8C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K3fSYxGp1Iet60hW+2yfJ7NHG82jn6rQRtHIJOwF7EY=; b=ym3tOMZa47S1w9TiBgOJB7sLTH
	eAP0v/qNncmwxWOQgt893Zdh5Byvj3fCcaYmd9GwUMwOGeX3Hgna4rOxJA9EXooJrQhEUOrDwgdUO
	OQNbbVE2uWDmQWJ3uoXNt6iDVsvB7zwT3lDrH1cMmpyPOcKnYn/qrZZzF1caYchRAGjsG11t9DvYH
	DZDCaizQr+fC6wEwRrYel0cTAThCLBqLZ+0Gmk5XhrzH8bVFPbL9fGDMV7CoJ0b0X+uIW+Aq5oGsS
	sXzSVLcN1nJ1DNKPnYQN691et076tZK9CM7YqsA3BT6fU0ctJ8tM3FaA5qAgstdDrqOHTB32lMj9V
	GAhuCRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJy4M-003inG-1n;
	Thu, 13 Jul 2023 15:17:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJy4I-003iim-06;
	Thu, 13 Jul 2023 15:17:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1A12B62F290F;
	Thu, 13 Jul 2023 17:17:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id On-fwFvgGn7i; Thu, 13 Jul 2023 17:17:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 515CD62F2916;
	Thu, 13 Jul 2023 17:17:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wjzgm6220rwR; Thu, 13 Jul 2023 17:17:15 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2B91F62F290F;
	Thu, 13 Jul 2023 17:17:15 +0200 (CEST)
Date: Thu, 13 Jul 2023 17:17:15 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Johan Jonker <jbx6244@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	heiko@sntech.de, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-rockchip@lists.infradead.org, 
	yifeng zhao <yifeng.zhao@rock-chips.com>
Message-ID: <1618382560.2326931.1689261435022.JavaMail.zimbra@nod.at>
In-Reply-To: <20230712154142.3c49d782@xps-13>
References: <0047fc52-bc45-a768-8bdd-c0f12cddc17e@gmail.com> <457c1da7-61dc-2a56-4f86-47413795138c@gmail.com> <20230704171348.5eee98f7@xps-13> <3af40582-d350-8eac-8639-10c285964c49@gmail.com> <20230712154142.3c49d782@xps-13>
Subject: Re: [PATCH v3 3/3] mtd: rawnand: rockchip-nand-controller: add
 skipbbt option
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: rockchip-nand-controller: add skipbbt option
Thread-Index: ROgfjDoY10Wn2JoZkeBFpS1VV4xmgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_081722_218462_BB7EC497 
X-CRM114-Status: GOOD (  10.10  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IAo+PiA+IEZvciB0aGUgYm9vdCBJIHRo
aW5rIEkgcHJvcG9zZWQgYSBEVCBwcm9wZXJ0eS4gSSBkb24ndCByZW1lbWJlciBob3cgZmFyCj4+
ID4gdGhlIGRpc2N1c3Npb24gd2VudC4KPj4gCj4+IElzIHRoZXJlIGEgd2ViIGxpbmsgb2YgdGhh
dCBkaXNjdXNzaW9uPwo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIz
MDYwOTEwNDQyNi4zOTAxZGY1NEB4cHMtMTMvCj4gCj4gTWF5YmUgdGhlIHRlcm0gIkRUIHByb3Bl
cnR5IiBkaWQgbm90IGFwcGVhciBidXQgdGhhdCdzIHdoYXQgSSBoYWQgaW4KPiBtaW5kIDotKSBJ
IGRvbid0IGtub3cgaWYgaXQgbXVzdCBiZSBhIGNoaXAgb3IgYSBwYXJ0aXRpb24gcHJvcGVydHku
Cj4gCj4gUmljaGFyZCwgaGVyZSBpcyB3aGVyZSBJIHdvdWxkIGxpa2UgeW91ciBmZWVkYmFjaywg
SSBhbSBraW5kIG9mIG9wcG9zZWQKPiB0byBhICJza2lwX2JidCIgbW9kdWxlIHBhcmFtZXRlci4g
SXQncyBub3QgYSBzdHJvbmcgb3BpbmlvbiwgaWYgeW91Cj4gdGhpbmsgaXQncyBmaW5lIEknbSBv
cGVuLgo+IAo+IEkgd291bGQgcmF0aGVyIHByZWZlciBhIERUIHByb3BlcnR5IHdoaWNoIHNheXMg
ImRvIG5vdCB1c2UgdGhlCj4gc3RhbmRhcmQgcGF0dGVybiIuCgpZZXMsIHBsZWFzZSBubyBuZXcg
bW9kdWxlIHBhcmFtZXRlcnMuIEEgbW9kdWxlIHBhcmFtZXRlciBzaG91bGQgb25seSBhZmZlY3QK
dGhlIGJlaGF2aW9yIG9mIHRoZSBkcml2ZXIgaXRzZWxmIChlLmcuIGRlYnVnIG1vZGUpIGJ1dCBu
b3QgYmUgZGV2aWNlIHNwZWNpZmljLgpXZSBtYWRlIHRoaXMgbWlzdGFrZSBpbiB0aGUgcGFzdCB0
b28gb2Z0ZW4uIDotKApBIHNpbmdsZSBkcml2ZXIgY2FuIHNlcnZlIG1vcmUgZGV2aWNlcy4gVGhl
cmVmb3JlIElNSE8gY29udHJvbGxpbmcgdGhpcyB2aWEgRFQKbWFrZXMgcGVyZmVjdGx5IHNlbnNl
LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
