Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7370C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFGzKdwuRDVwGWCE8nhHjxmN5VngYTyhYoQl111sPig=; b=s/uVs3FlVQA32G
	c3heE85PSybuWKWaGTlh/cZrg3UrgBfw4iEUyzIPB3YOkfQOqIft051UF6wtKLxTPKB3dDuzUwiwT
	p0jJsZyNvDvyGFKQBb4PcEg4ge00EyeowgmwTucSbgiPstYnck0Hqv4iWUfjyimju0PuXYOvFmTVN
	7JXzz7P9wb1t7LzDdIkzleh8J0QmfOBPM4Af9vKlVrWuiHI7DxrR8IQstFgszm0MNmwqaoAfsqcjG
	R0eP3X2UtJ91QuOzkopEXvsRaqfwHJKk73Lzq6XJIFL5ECazAVGVlt5J6UeZQUW2QADJnjkA59ytm
	dt0Q5A++0eqW+XOFUgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlVh-0080xQ-9n; Mon, 28 Mar 2022 09:18:01 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlVd-0080vV-DM
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 09:17:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0666F1C0005;
 Mon, 28 Mar 2022 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648459074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWBxqNYN1/i5Z3VsHnlh0Jm6BlLQtmRjEJI4j+sjYcs=;
 b=g8JyIV84vEGuFFaboY7J8zvni0pPG4sPf6Eu8Rpjmcf+t7TkWGUyhZwMKQ+gD5h4F9s/JJ
 pvHdG26VdEgDn0Rn1MaE2aITEUCzmt8R0XwTNVPPOgmPzCp/iBx5tjM9VT3BmlDmZcpRVL
 MFCsrwO9KhNcT6kw1egFuHwlebwS4XhOhlzNsdHS0ECC7QikvnMLOOAf7hMgomk7zWrPq9
 8eSeMriL74Q9IMjNBjHbPj+eDcl+b3vXrKqCISjTYcXiCHfayumj7rlOsDdxUNcM/yVaIy
 ye7sYx07yhtRs8VDGlBJoHlofbLWewM9dbrh6Lc2QMz4yPRxHwBREwjIt1WWfg==
Date: Mon, 28 Mar 2022 11:17:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: gpmi: Refactor bch geometry
 settings function
Message-ID: <20220328111751.011e3f3e@xps13>
In-Reply-To: <20220325211411.30714-1-han.xu@nxp.com>
References: <20220325211411.30714-1-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_021757_627497_8F6C1FFD 
X-CRM114-Status: GOOD (  11.72  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gRnJpLCAyNSBNYXIgMjAyMiAxNjoxNDox
MCAtMDUwMDoKCj4gVGhlIGNvZGUgY2hhbmdlIHJlZmFjdG9yIHRoZSBiY2ggZ2VvbWV0cnkgc2V0
dGluZyBmdW5jdGlvbiwgd2hpY2ggc3RpbGwKPiB1c2UgdGhlIGxlZ2FjeSBiY2ggc2V0dGluZyBh
cyBkZWZhdWx0IG9wdGlvbiwgd2hpbGUgdXNlciBtYXkgY2hvb3NlIHRvCj4gdXNlIGNoaXBzIHJl
cXVpcmVkIG1pbmltdW0gZWNjIHN0cmVuZ3RoIGJ5IERUIGZsYWcgImZzbCx1c2UtbWluaW11bS1l
Y2MiLgo+IEl0IGFsc28gaW1wcm92ZSB0aGUgZ3BtaV9jaGVja19lY2MgZnVuY3Rpb24gdG8gY2hl
Y2sgaWYgdGhlIHNlbGVjdGVkIGVjYwo+IHN0cmVuZ3RoIGlzIHN0cm9uZyBlbm91Z2guCgpUaGF0
IHNob3VsZCBiZSBhIGRlZGljYXRlZCBwYXRjaD8KCk90aGVyd2lzZSBsb29rcyBmaW5lLgoKPiAK
PiBUaGUgZHJpdmVyIHVzZXMgbGVnYWN5IGJjaCBnZW9tZXRyeSBzZXR0aW5ncyBieSBkZWZhdWx0
LCBpZiB0aGUgTkFORAo+IGNoaXBzIG9vYiBzaXplIGlzIGxlc3MgdGhhbiAxS0IuIFRoZSBsZWdh
Y3lfc2V0X2dlb21ldHJ5KCkgc2V0cyB0aGUgZGF0YQo+IGNodW5rIHNpemUoc3RlcF9zaXplKSBs
YXJnZXIgdGhhbiBvb2Igc2l6ZSB0byBtYWtlIHN1cmUgQkJNIGxvY2F0ZXMgaW4KPiBkYXRhIGNo
dW5rLCB0aGVuIHNldCB0aGUgbWF4aW11bSBlY2Mgc3Rlbmd0aCBvb2IgY2FuIGhvbGQuIEl0IGFs
d2F5cyB1c2UKPiB1bmJhbGFuY2VkIEVDQyBsYXlvdXQsIHdoaWNoIGVjYzAgd2lsbCBjb3ZlciBi
b3RoIG1ldGEgYW5kIGRhdGEwIGNodW5rLgo+IAo+IEZvciBhbGwgb3RoZXIgY2FzZXMsc2V0IHRo
ZSBiY2ggZ2VvbWV0cnkgYnkgY2hpcCByZXF1aXJlZCBzdHJlbmd0aCBhbmQKPiBzdGVwIHNpemUs
IHdoaWNoIHVzZXMgdGhlIG1pbmltdW0gZWNjIHN0cmVuZ3RoIGNoaXAgcmVxdWlyZWQuIEl0IGNh
biBiZQo+IGV4cGxpY2l0bHkgZW5hYmxlZCBieSBEVCBmbGFnICJmc2wsdXNlLW1pbmltdW0tZWNj
IiwgYnV0IG5lZWQgdG8gYmUKPiBlbi9kaXNhYmxlZCBpbiBib3RoIHUtYm9vdCBhbmQga2VybmVs
IGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGFuIFh1IDxoYW4ueHVAbnhw
LmNvbT4KPiBUZXN0ZWQtYnk6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KPiAKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
