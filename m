Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61C1C433FF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 08:35:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8569229F5
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 08:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JSGXezLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TXULpA8n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8569229F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U62AmwBoGE2mNR4S+FoW7p0iBQh+SxB8tGJmczUqg0M=; b=JSGXezLavru6+D
	y1JZDsQ7pgpIQcf9GeOalKhnx67m3UXnZ4viXc5p6Dn7fps11sPRNnPPL3pAyykOuhXtk9sHvfp7e
	ixC5fe8eN3jFEqwq2kEo01uVL0g67z7au8/4q26HSjMvTSzsYh//5ogoPZ2Q2NMy0I/BdgNn7FMua
	aqBdfcUiGDVZgpURsHhEKng+pX0Go2E7noWsa00mBZK934FTXMgv7gR5UXD7K7lwzk5tVImi7wfbq
	5q3jDdl61Kngdsru+rdJbkRf3MU5NFUcvaTzrYbfQSRYaIP1SHtdo7NTi71oxWFNLy6tObmu65EX8
	njeob1ME2bqPJt13Q6dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvHPn-0002wD-2X; Wed, 07 Aug 2019 08:35:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvHPg-0002q4-4z
 for linux-mtd@bombadil.infradead.org; Wed, 07 Aug 2019 08:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ozt01mklj3wcISVQpkVqkOX5hYbFwMLIZrU2bNqEeg=; b=TXULpA8n74Ogex6jyNBXcmxwv6
 2ubiRmWeyWWKBI91mUnUL0r2+fYHPxmGj6YmfPHNjMGYJMuE26o2n1CYxtjGi5ghCADUArZVIBkPy
 yOTCKJAYJ/xJMM51VYra/Mvf5NaShJArsDsmeLqahWoIhdnA5V1ICtt4StkSChRcO3yY/3QAtTkCM
 /O+DWjBYIImGs+B1TWHG1Y9IQIi+zIa/sAD2MsCP0ycY/322XkWzL4RTLmMWsB1x6qf2p1diqkX/Z
 M0GBhdF76w7WxbHiFrr9mONZYzgaOgDrZA8ew1JZs5X6NlqbVHbRBAfo/MMfGVp3bvMC9gPsPNeA4
 XJ9mvV3g==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvHPs-0004Uk-Jp
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 08:35:30 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1263A1BF205;
 Wed,  7 Aug 2019 08:34:37 +0000 (UTC)
Date: Wed, 7 Aug 2019 10:34:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 1/8] mtd: nand: move ONFI related functions to onfi.h
Message-ID: <20190807103437.36abb59b@xps13>
In-Reply-To: <20190722055621.23526-2-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-2-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_093528_683557_FE18FE82 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpzaGl2YS5saW51eHdvcmtzQGdtYWlsLmNvbSB3cm90ZSBvbiBNb24sIDIyIEp1
bCAyMDE5IDA3OjU2OjE0ICswMjAwOgoKPiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBUaGVzZSBmdW5jdGlvbnMgd2lsbCBiZSB1c2VkIGJ5
IGJvdGggcmF3IE5BTkQgYW5kIFNQSSBOQU5ELCB3aGljaAo+IHN1cHBvcnRzIE9ORkkgbGlrZSBz
dGFuZGFyZHMuCgpUaGlzIGlzIG5vdCBleGFjdGx5IHdoYXQgeW91IGRvLiBXaHkgbm90OgoKbXRk
OiBuYW5kOiBleHBvcnQgT05GSSByZWxhdGVkIGZ1bmN0aW9ucyB0byBvbmZpLmgKClRoZXNlIGZ1
bmN0aW9ucyBjYW4gYmUgdXNlZCBieSBhbGwgZmxhdm9ycyBvZiBOQU5EIGNoaXBzIChyYXcsIFNQ
SSkKd2hpY2ggbWF5IGFsbCBmb2xsb3cgT05GSSBzdGFuZGFyZHMuIEV4cG9ydCB0aGUgcmVsYXRl
ZCBmdW5jdGlvbnMgaW4KdGhlIG9uZmkuaCBnZW5lcmljIGZpbGUuCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFNoaXZhbXVydGh5IFNoYXN0cmkgPHNzaGl2YW11cnRoeUBtaWNyb24uY29tPgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlcm5hbHMuaCB8IDEgLQo+ICBpbmNsdWRlL2xpbnV4
L210ZC9vbmZpLmggICAgICAgICB8IDkgKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2ludGVybmFscy5oIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZXJuYWxzLmgK
PiBpbmRleCBjYmE2ZmU3ZGQ4YzQuLmVkMzIzMDg3ZDg4NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9pbnRlcm5hbHMuaAo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2lu
dGVybmFscy5oCj4gQEAgLTE0MCw3ICsxNDAsNiBAQCB2b2lkIG5hbmRfbGVnYWN5X2FkanVzdF9j
bWRmdW5jKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApOwo+ICBpbnQgbmFuZF9sZWdhY3lfY2hlY2tf
aG9va3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCk7Cj4gIAo+ICAvKiBPTkZJIGZ1bmN0aW9ucyAq
Lwo+IC11MTYgb25maV9jcmMxNih1MTYgY3JjLCB1OCBjb25zdCAqcCwgc2l6ZV90IGxlbik7Cj4g
IGludCBuYW5kX29uZmlfZGV0ZWN0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApOwo+ICAKPiAgLyog
SkVERUMgZnVuY3Rpb25zICovCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL29uZmku
aCBiL2luY2x1ZGUvbGludXgvbXRkL29uZmkuaAo+IGluZGV4IDMzOWFjNzk4NTY4ZS4uMmM4YTA1
YTAyYmIwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL29uZmkuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbXRkL29uZmkuaAo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpZm5kZWYgX19M
SU5VWF9NVERfT05GSV9ICj4gICNkZWZpbmUgX19MSU5VWF9NVERfT05GSV9ICj4gIAo+ICsjaW5j
bHVkZSA8bGludXgvbXRkL25hbmQuaD4KClRoaXMgc2hvdWxkIGJlIHJlbW92ZWQsIG9yIGF0IGxl
YXN0IG5vdCBhZGRlZCBhdCB0aGlzIG1vbWVudC4KCj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+ICAKPiAgLyogT05GSSB2ZXJzaW9uIGJpdHMgKi8KPiBAQCAtMTc1LDQgKzE3NiwxMiBAQCBz
dHJ1Y3Qgb25maV9wYXJhbXMgewo+ICAJdTggdmVuZG9yWzg4XTsKPiAgfTsKPiAgCj4gKy8qIE9O
RkkgZnVuY3Rpb25zICovCj4gK3UxNiBvbmZpX2NyYzE2KHUxNiBjcmMsIHU4IGNvbnN0ICpwLCBz
aXplX3QgbGVuKTsKPiArdm9pZCBuYW5kX2JpdF93aXNlX21ham9yaXR5KGNvbnN0IHZvaWQgKipz
cmNidWZzLAo+ICsJCQkgICAgdW5zaWduZWQgaW50IG5zcmNidWZzLAo+ICsJCQkgICAgdm9pZCAq
ZHN0YnVmLAo+ICsJCQkgICAgdW5zaWduZWQgaW50IGJ1ZnNpemUpOwoKRG9uJ3QgZXhwb3J0IHRo
aXMgZnVuY3Rpb24gd2hpbGUgeW91IGRvbid0IHVzZSBpdCBmcm9tIGVsc2V3aGVyZS4KCj4gK3Zv
aWQgc2FuaXRpemVfc3RyaW5nKHU4ICpzLCBzaXplX3QgbGVuKTsKClRoaXMgb25lIGlzIHVzZWQg
YnkgamVkZWMgY29kZSBhbmQgaGFzIG5vIG9uZmktcmVsYXRlZCBsb2dpYywgc28geW91Cm1heSB3
YW50IHRvIGV4cG9ydCBpdCAob25seSB3aGVuIHlvdSB3aWxsIHVzZSBpdCkgaW4gYW5vdGhlciBo
ZWFkZXIKbGlrZSBsaW51eC9tdGQvbmFuZC5oCgo+ICsKPiAgI2VuZGlmIC8qIF9fTElOVVhfTVRE
X09ORklfSCAqLwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
