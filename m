Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DFEC61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EychIJ/63D20S/uQcDZvneTDsAe42x5f7Sg5SgLeQuw=; b=Kc8tWJq0cdSFK7lMdoxJjvaquM
	DMd/ZYNZsvWE4w9DWQSBRi0HAnAOkrYEDI+D3CJZKIqQlZKw3PLUrdga1bJzYx3sI8gHbWR5DHVb/
	izfxngb3vuBExB6sDrXl98T7JfQZE7AgFC1Qbyat5izr6/ksxpRp/nPE1lJHQ4fl6GAWDgAT92l9B
	X5vj5qugH/uTcUGhIbTzEPNMenkmnKUBxgB9EoMMUC8fxBlsd9gJCf0ti/spRPuNmH1qzm/2LR8wE
	LOYs5xpBOVzrCc3BMAEtDcxLgRtkjyqnrwBeYCR9fcciAOv+4V66Xj5E57mBxyRxtKv3nCOghHneA
	aAecs86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRy3R-002mtS-N6; Tue, 14 Feb 2023 16:21:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRy3O-002mqx-RP
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 16:21:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9D494642ECB2;
	Tue, 14 Feb 2023 17:21:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oBhXB59KN0Js; Tue, 14 Feb 2023 17:21:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4AC93642ECD2;
	Tue, 14 Feb 2023 17:21:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g0ffR7oKKqVt; Tue, 14 Feb 2023 17:21:08 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2C24A642ECB2;
	Tue, 14 Feb 2023 17:21:08 +0100 (CET)
Date: Tue, 14 Feb 2023 17:21:07 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <290910672.129444.1676391667993.JavaMail.zimbra@nod.at>
In-Reply-To: <Y+uztjxDdtFy6MJ4@makrotopia.org>
References: <cover.1671737443.git.daniel@makrotopia.org> <Y+uztjxDdtFy6MJ4@makrotopia.org>
Subject: Re: [PATCH 0/2] ubi: wire up parent device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: wire up parent device
Thread-Index: gBfXjFgR7YDPiBgMRLukfCC3XAUgvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_082115_086778_64847AEC 
X-CRM114-Status: UNSURE (   9.03  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEkndmUgb25seSByZWNlbnRseSBub3Rp
Y2VkIHRoYXQgdGhpcyBzZXJpZXMgaXMgbWFya2VkIGFzICdBY2NlcHRlZCcgaW4KPiBwYXRjaHdv
cmsuIEhvd2V2ZXIsIEkgZmFpbCB0byBmaW5kIHRoZSBjb21taXRzIGluIGFueSBwdWJsaWMgbGlu
dXgKPiB0cmVlLCBub3IgaGFzIHBhdGNod29yayBzZW50IHRoZSB1c3VhbCBub3RpZmljYXRpb24g
ZW1haWwgaW5mb3JtaW5nIG1lCj4gYWJvdXQgaXQgYmVpbmcgYWNjZXB0ZWQuCj4gCj4gQ2FuIGl0
IGJlIHRoYXQgaXQgaGFzIHNsaXBwZWQgdW5kZXIgdGhlIHRhYmxlIChvciBldmVuIHRoZSBjYXJw
ZXQpCj4gc29tZWhvdz8KPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55dGhp
bmcgd3Jvbmcgd2l0aCB0aGlzIHNlcmllcyBhbmQvb3IKPiBpZiBJIHNob3VsZCByZS1zdWJtaXQg
aXQsIG9yIGlmIEkgc2hhbGwganVzdCB3YWl0IGZvciBpdCB0byBzdXJmYWNlIGluCj4gbGludXgt
bXRkIG9yIGxpbnV4LW5leHQuCgpUaGUgcGF0Y2hlcyBhcmUgaW4gbGludXgtdWJpZnMgI25leHQg
YW5kIGluIGxpbnV4LW5leHQgaXRzZWxmLgpTZWU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9pZD0wNWI4
NzczY2EzMzI1M2VhNTYyYmUxNDVjZjMxNDViMDVlZjE5Zjg2CgpTbywgYWxsIGdvb2QuIDotKQog
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
