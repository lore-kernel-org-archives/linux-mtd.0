Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC757C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE122067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FSzsuKLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE122067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLL54EsOnZgxTOUY0EF3d6/Knt/Nfeq7DrEvf4bkSVw=; b=FSzsuKLON87fLb
	Cj/1qyTxE3B70UMjTKgo5+FzUt4dzOYznnPSgdFfUV136ooloK5nRYX7aSJaNgkObVNmdT4kU9qis
	jSbdTAadb//sYwgdXEvuinTyWkTWZ2La4TW0w9MIbYWjMjm1M2H1jSlluHkuiixhp4WEfG5Aizkg6
	SPQn3X7Ep/yGLTDqBhspOj7XwvmOyINCecg81N9LA8Xp+9u4kjF1F80MHQ54AB8VxqhfqdDxfCK5d
	MVmMRnEl7GaigagBNpik+V9CWXWP4xQQihmzbAWMriZSQJGfwy6A5Afjy6aw2OIGPKTw5BKtACBES
	8TQwUnHF0uKuGg0unFNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipa2v-0005oj-FE; Thu, 09 Jan 2020 15:48:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipa2s-0005oI-An
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:48:28 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E2B82C0013;
 Thu,  9 Jan 2020 15:48:22 +0000 (UTC)
Date: Thu, 9 Jan 2020 16:48:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 1/1] mtd: spinand: Add support for new Micron SPI NAND
 devices
Message-ID: <20200109164821.0e5f0796@xps13>
In-Reply-To: <20191209064223.10003-2-sshivamurthy@micron.com>
References: <20191209064223.10003-1-sshivamurthy@micron.com>
 <20191209064223.10003-2-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_074826_511495_26474D06 
X-CRM114-Status: GOOD (  13.09  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sICA5IERl
YyAyMDE5IDA3OjQyOjIzICswMTAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBBZGQgZGV2aWNlIHRhYmxlIGZvciBuZXcgTWljcm9u
IFNQSSBOQU5EIGRldmljZXMuIFdoaWxlIGF0IGl0LCBhZGQKPiBzdXBwb3J0IHRvIHRoZSBtdWx0
aS1kaWUgc2VsZWN0aW9uLiBBbHNvLCBnZW5lcmFsaXplIHRoZSBPT0IgbGF5b3V0Cj4gc3RydWN0
dXJlIGFuZCBmdW5jdGlvbiBuYW1lcy4KClNvcnJ5IGZvciB0aGUgZGVsYXkuIEkgYW0gZmluZSB3
aXRoIHRoaXMgcGF0Y2ggbW9zdGx5LCBidXQgY291bGQgd2UKc3BsaXQgaXQgcGxlYXNlPwoKTy8g
RGlzYWJsZSBjb250aW51b3VzIHJlYWQgZmVhdHVyZSAob25lIHR5cG8sIHNlZSBiZWxvdykuIEkg
dGhpbmsgdGhpcwptaWdodCBiZSBjb25zaWRlcmVkIGFzIGEgZml4LgoKMS8gR2VuZXJhbGl6ZSB0
aGUgT09CIGxheW91dCBzdHJ1Y3R1cmUgYW5kIGZ1bmN0aW9uIG5hbWVzLgoyLyBBZGQgc3VwcG9y
dCBmb3IgYWxsIHRoZSBwYXJ0cy4KMy8gQWRkIG11bHRpLWRpZSBzdXBwb3J0IChvbmUgY29tbWVu
dCBiZWxvdyBhYm91dCB0aGF0KS4KCkFzIGEgZ2VuZXJhbCBydWxlIG9mIHRodW1iLCBzbWFsbCBw
YXRjaGVzLCBkb2luZyBvbmUgbG9naWMgY2hhbmdlIGFyZQptdWNoIGVhc2llciBhbmQgcXVpY2sg
dG8gcmV2aWV3IGFuZCBhY2NlcHQuCgoKPiArc3RhdGljIGludCBtaWNyb25fc2VsZWN0X3Rhcmdl
dChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gKwkJCQl1bnNpZ25lZCBpbnQgdGFy
Z2V0KQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSU5BTkRfU0VUX0ZFQVRVUkVf
T1AoMHhkMCwKPiArCQkJCQkJICAgICAgc3BpbmFuZC0+c2NyYXRjaGJ1Zik7Cj4gKwo+ICsJaWYg
KHRhcmdldCA9PSAxKQo+ICsJCSpzcGluYW5kLT5zY3JhdGNoYnVmID0gMHg0MDsKClBsZWFzZSBk
ZWZpbmUgMHg0MCBhbmQgZXhwbGFpbiBjbGVhcmx5IHdpdGggYSBjb21tZW50IHRoYXQgdGhpcyBp
cwptdWx0aS1kaWUgc2VsZWN0aW9uLgoKPiArCj4gKwlyZXR1cm4gc3BpX21lbV9leGVjX29wKHNw
aW5hbmQtPnNwaW1lbSwgJm9wKTsKPiArfQo+ICsKClsuLi5dCgo+ICtzdGF0aWMgaW50IG1pY3Jv
bl9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+ICt7Cj4gKwkv
Kgo+ICsJICogTTcwQSBzZXJpZXMgZGV2aWNlIGVuYWJsZXMgQ29udGludW9zIFJlYWQgZmVhdHVy
ZSBvbiBQb3dlci11cCwKPiArCSAqIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgaGVyZS4gTWFraW5n
IHRoaXMgQklUIGRpc2FibGUgd2lsbCBhdm9pZAo+ICsJICogYW55IHBvc3NpYmxlIGZhaWx1cmUu
CgpXaGF0IGFib3V0OgoKICAgICAgICAgICBNNzBBIGRldmljZSBzZXJpZXMgZW5hYmxlIENvbnRp
bnVvdXMgUmVhZCBmZWF0dXJlIGF0CiAgICAgICAgICAgcG93ZXItdXAsIHdoaWNoIGlzIG5vdCBz
dXBwb3J0ZWQuIERpc2FibGUgdGhpcyBiaXQgdG8KCSAgIGF2b2lkIGFueSBwb3NzaWJsZSBmYWls
dXJlLgoKPiArCSAqLwo+ICsJcmV0dXJuIHNwaW5hbmRfdXBkX2NmZyhzcGluYW5kLCBDRkdfUVVB
RF9FTkFCTEUsIDApOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFu
dWZhY3R1cmVyX29wcyBtaWNyb25fc3BpbmFuZF9tYW51Zl9vcHMgPSB7Cj4gIAkuZGV0ZWN0ID0g
bWljcm9uX3NwaW5hbmRfZGV0ZWN0LAo+ICsJLmluaXQgPSBtaWNyb25fc3BpbmFuZF9pbml0LAo+
ICB9Owo+ICAKPiAgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyIG1pY3Jvbl9zcGlu
YW5kX21hbnVmYWN0dXJlciA9IHsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
