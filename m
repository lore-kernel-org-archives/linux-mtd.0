Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559CE7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYG5K5I6mJHrL/z9RyQW1GoLnWg4K1rKfn7VcmWYpsE=; b=kutCT+Nuh9Z5qW
	6i/xhIDylitKK9omff0TI7fGCYojX7Dr2XcdIur0vwmMNyAwS4+y65mqubfNDWxIJLFC1efe9+gTI
	6eI8iUXO1LlJ3U1srHDaakosWi5835FEF/C32a1ghhnRkOiDJGkmjuYSe+P2oOryVr0UnhYWsTuwp
	tCyt//L9u60Ms1wUqoQQFGvWL803uHrC0MxWyrnk6rLj42TtrLHHGE7qi+ZXvyiHsp5EeHne0m2Bn
	WnYfz8aeEL8yLYhA0Vj1hJlnaqdt6lCpeWRqYTCbIRkkL4EWwGKPpVjwxNOeCwZb42mfKl0iY8rJL
	RK2oyPUvI2euaNRTi3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM45b-00000003cHF-1JAX;
	Fri, 13 Dec 2024 11:44:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM45X-00000003cFw-44js
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 11:44:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4CADFF805;
	Fri, 13 Dec 2024 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734090245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7mATUIHkG8NZSamVn7nrNU4ZayJvQcaDK2lYNCVC+A=;
	b=ObR9UpkqoJddCg8QgXMN+prY1i85V/9FhmuXW31mQvqUSgrFM4kILE/bK9hcze6JrOxlDT
	U2WFnFNpAH/RHnKNVRJkm9FJDZMQF2gdbSm0pDyJnDH//es/bpmsG6XPHQMSjn81sadCvn
	kmHuFbca+zaweyOmhCwDAiLlcCHqgvSIpk6Yfn5Z7OOLfoqAWdLTK/BRufmSkSExqghzjn
	QxtFNMfmcZYJgLzz84ukBfO+kHpNRbloTBBYHLRuj1Fe7tCIj5rRBLjrGrNjpcKCXpPCbu
	3Y26TDBmwSk37J3b6cvxE8ZLIEN1o5QRjWU75mFeHR5Bk97pUCY+ANieMoAsgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 04/24] spi: amlogic-spifc-a1: Support per spi-mem
 operation frequency switches
In-Reply-To: <9e942bdd-6ade-40a7-ae4a-104ed288a09f@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:42:31 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-5-miquel.raynal@bootlin.com>
	<9e942bdd-6ade-40a7-ae4a-104ed288a09f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 12:44:02 +0100
Message-ID: <87o71fn6yl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034408_141829_E6208B59 
X-CRM114-Status: GOOD (  11.99  )
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

SGkgVHVkb3IsCgpPbiAxMS8xMS8yMDI0IGF0IDEzOjQyOjMxIEdNVCwgVHVkb3IgQW1iYXJ1cyA8
dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTAvMjUvMjQgNToxNCBQTSwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gRXZlcnkgLT5leGVjX29wKCkgY2FsbCBjb3JyZWN0bHkg
Y29uZmlndXJlcyB0aGUgc3BpIGJ1cyBzcGVlZCB0byB0aGUKPj4gbWF4aW11bSBhbGxvd2VkIGZy
ZXF1ZW5jeSBmb3IgdGhlIG1lbW9yeSB1c2luZyB0aGUgY29uc3RhbnQgc3BpIGRlZmF1bHQKPj4g
cGFyYW1ldGVyLiBTaW5jZSB3ZSBjYW4gbm93IGhhdmUgcGVyLW9wZXJhdGlvbiBjb25zdHJhaW50
cywgbGV0J3MgdXNlCj4+IHRoZSB2YWx1ZSB0aGF0IGNvbWVzIGZyb20gdGhlIHNwaS1tZW0gb3Bl
cmF0aW9uIHN0cnVjdHVyZSBpbnN0ZWFkLiBJbgo+PiBjYXNlIHRoZXJlIGlzIG5vIHNwZWNpZmlj
IGxpbWl0YXRpb24gZm9yIHRoaXMgb3BlcmF0aW9uLCB0aGUgZGVmYXVsdCBzcGkKPj4gZGV2aWNl
IHZhbHVlIHdpbGwgYmUgZ2l2ZW4gYW55d2F5Lgo+PiAKPj4gVGhlIHBlci1vcGVyYXRpb24gZnJl
cXVlbmN5IGNhcGFiaWxpdHkgaXMgdGh1cyBhZHZlcnRpc2VkIHRvIHRoZSBzcGktbWVtCj4+IGNv
cmUuCj4KPiBJIHNlZSB0aGUgZHJpdmVyIHNldHMgY3RybC0+bWluX3NwZWVkX2h6ID0gU1BJRkNf
QTFfTUlOX0haOwo+Cj4gRG8geW91IHdhbnQgdG8gaW50cm9kdWNlIGEgc3RydWN0IHNwaV9jb250
cm9sbGVyX21lbV9vcHMuc3VwcG9ydHNfb3AgYW5kCj4gY2hlY2sgdGhhdCB0aGUgc3BpbWVtIG9w
IGZyZXEgaXMgbm90IGJlbG93IHRoZSBjb250cm9sbGVyJ3MgbWluaW11bSBmcmVxPwoKSSB3YXMg
YWJvdXQgdG8gZG8gdGhhdCBidXQgSSB0aGluayB3ZSBjYW4gZG8gYmV0dGVyLiBJIGFtIGFscmVh
ZHkgdHVuaW5nCnRoZSBtYXggZnJlcXVlbmN5IGRlcGVuZGluZyBvbiB0aGUgb3AuIEkgY2FuIGp1
c3QgY2hlY2sgaW4gdGhlIGRlZmF1bHQKc3VwcG9ydHNfb3AgaG9vayB0aGF0IHRoZSBvcGVyYXRp
b24gbWF4IGZyZXF1ZW5jeSBpcyBub3QgYmVsb3cgdGhlCmNvbnRyb2xsZXIncyBtaW5pbXVtLiBT
byBhbGwgZHJpdmVycyB3aXRoIHRoaXMga2luZCBvZiBsaW1pdGF0aW9uIHdpbGwKYmUgY292ZXJl
ZC4KClRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
