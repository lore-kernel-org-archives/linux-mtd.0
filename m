Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE651C77B73
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Apr 2023 20:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lZtey9p/pmY+yh+f5GIaI1GGYhKlh6iJRSywGKJk/LA=; b=OcSr529/I2IzEntSfQiNSLzE+3
	hIoFN7JoEZxOND41a/uWz84q2Dd5NoxPMqhJQm7MC1UdYHBurn/hPtrA1GQDhnLPgVU8B756qYzFz
	walndcgQN9qRENFZKMp4KhjfEnPV7PH/ao51PQj53Djf2wPP5xRf7hY38L7dBwuLI5yWyL/yJceZE
	LUotTNW1YaMC9XgV8HbXWtEaJ+UiwqEia4ZsM4S4zDcRwyuZwb8rsiR+SbWjkaTul/HsjRUrpgkEy
	SMLQk1eZkv+8iqd53wYGt/RWIjwvt3mTwdilrCfmvoJOa3vHiI2peEa8n3CDxHW0UGdMU95Y9eviG
	liXbqOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppb1c-008xe2-1j;
	Thu, 20 Apr 2023 20:37:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppb1Z-008xdZ-1U
	for linux-mtd@lists.infradead.org;
	Thu, 20 Apr 2023 20:37:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 29B8F63CC190;
	Thu, 20 Apr 2023 22:36:57 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NbvsokkF7ZlM; Thu, 20 Apr 2023 22:36:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0B8976418F2B;
	Thu, 20 Apr 2023 22:36:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DRD9jo1tEAsD; Thu, 20 Apr 2023 22:36:55 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E189363CC190;
	Thu, 20 Apr 2023 22:36:55 +0200 (CEST)
Date: Thu, 20 Apr 2023 22:36:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Yu Hao <yhao016@ucr.edu>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
In-Reply-To: <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com> <687864524.118195.1681799447034.JavaMail.zimbra@nod.at> <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com> <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com> <977347543.226888.1682011999468.JavaMail.zimbra@nod.at> <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: f8YvMDTSYLQx33FOZb2oMatq86v3fQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_133701_657207_7F8DD5C7 
X-CRM114-Status: UNSURE (   5.08  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBDYW4geW91IHBsZWFzZSBzaGFyZSB0
aGUgcWVtdSBjb21tYW5kIGxpbmU/Cj4gcWVtdS1zeXN0ZW0teDg2XzY0IC1tIDJHIC1zbXAgMiAt
a2VybmVsCj4gL2hvbWUvdGVzdC9Xb3Jrc3BhY2UvU3l6R2VuL2xpbnV4LWRpc3Ryby9saW51eC02
LjItZGVidWcvYXJjaC94ODYvYm9vdC9iekltYWdlCj4gLWFwcGVuZCDigJxjb25zb2xlPXR0eVMw
IHJvb3Q9L2Rldi9zZGEgbmV0LmlmbmFtZXM9MOKAnSAtaGRhCj4gL2hvbWUvdGVzdC9Xb3Jrc3Bh
Y2UvU3l6R2VuL2xpbnV4LWRpc3Ryby9pbWFnZS9zdHJldGNoLmltZyAtY2hhcmRldgo+IHNvY2tl
dCxpZD1TT0NLU1laLHNlcnZlcj1vbixub3dhaXQsaG9zdD1sb2NhbGhvc3QscG9ydD01NDY0MCAt
bW9uCj4gY2hhcmRldj1TT0NLU1laLG1vZGU9Y29udHJvbCAtZGV2aWNlIHZpcnRpby1ybmctcGNp
IC1kZXZpY2UKPiBlMTAwMCxuZXRkZXY9bmV0MCAtbmV0ZGV2Cj4gdXNlcixpZD1uZXQwLHJlc3Ry
aWN0PW9uLGhvc3Rmd2Q9dGNwOjEyNy4wLjAuMToxMTc2MC06MjIgLWRpc3BsYXkgbm9uZQo+IC1z
ZXJpYWwgc3RkaW8gLWNwdSBob3N0LG1pZ3JhdGFibGU9b2ZmIC1uby1yZWJvb3QgLW5hbWUgVk0g
LXNuYXBzaG90Cj4gLWVuYWJsZS1rdm0KPiAKPj4gV2l0aGluIExpbnV4IHlvdSBjYW4gcXVlcnkg
L3Byb2MvbXRkIG9yIC9zeXMvY2xhc3MvbXRkLwo+PiB0byBnZXQgaW5mb3MgYWJvdXQgdGhlIE1U
RCBpbiBxdWVzdGlvbi4KPj4KPiAKPiBUaGFua3MgZm9yIHRoZSBoaW50cy4gV2UgZmluZCB0aGF0
IHRoaXMgaXMgYSDigJxtdGRyYW0gdGVzdCBkZXZpY2XigJ0uCj4gCj4gcm9vdEBzeXprYWxsZXI6
fiMgY2F0IC9wcm9jL210ZAo+IGRldjogICAgc2l6ZSAgIGVyYXNlc2l6ZSAgbmFtZQo+IG10ZDA6
IDAwMDIwMDAwIDAwMDAxMDAwIOKAnG10ZHJhbSB0ZXN0IGRldmljZeKAnQoKSG1tLCBtdGRyYW0g
c2hvdWxkIGJlIGZpbmUsIGVyYXNlc2l6ZSBpcyBub3QgemVyby4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
