Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3121C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6UgQqbevyppm4TpmxTqJYzOSyhLq1AoXN9NKIdVzUM=; b=gJePdFgFeJ243v
	66+wZkO4n+5LD8R+hstFDpiXZglouhqFKdMxHEKIJGM47RKgyV21XT29xpPR6hyHVuWyjqHqW9rWj
	RRYBwcWMs3ud2KFC/BtYl/0A1GWbJcKDCurAkAfGhGtt/p9rbkBcEQoHoQvgtIoqcwP65hCR9JpDY
	M36V+EIkX/UQhsyX+cs3yf3lxQWZ7J46vm2RQ12CnxvyFE8KnTO0ylTKNEOoRe2dTzsgG1OnFVVBu
	JDLpXmxEXghyQeVKvC5vSGfLivB3cpMeBqfJjkfKEnFAY09HT43CM9n8GmVvOG/Hd9FR+sr1ZeFah
	7d6YbLiZ/waXzsJmxPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptloA-000hCE-0G;
	Tue, 02 May 2023 08:56:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptlo7-000h9C-1F
	for linux-mtd@lists.infradead.org;
	Tue, 02 May 2023 08:56:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 653221BF20A;
	Tue,  2 May 2023 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683017777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yYMO2eRjKJezt7V6DtgSnO4VtgFucVPh4V4lmWI6gKI=;
	b=l01eOZ26NmPcL2Amymi1uox97esn8qtSh0AcDVTZvO16UozsG8VrK2od/aGJDxdugkwWL4
	IlxFBy2iAO8n4cNkBIOwGk8pLsyUb2IDe8houx/nErqxMxAnB/mWPQxXSRQOFitWIBrRT2
	MOtmMVljKWs0VvWwJclcYgEWr0qt6wzobeCTkrmL6jDgUTPKhAm8DcmSHN6VPmLBcJ3mrD
	SSVuhhaRWJZlgP5ppWR3VkhmV/UsxDcdzC30kvcQtOJGvt5ogqQCh31aCnPA6GYqGXRMrZ
	uQyF7kEeIbxk6sMzExSE4sNFOjZxkAZ8i4NBC0423kLuuyDLPqgbVuMPuaWHvQ==
Date: Tue, 2 May 2023 10:56:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <haver@vnet.ibm.com>,
 <s.hauer@pengutronix.de>, <yhao016@ucr.edu>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ubi: Refuse attaching if mtd's erasesize is 0
Message-ID: <20230502105614.7e849263@xps-13>
In-Reply-To: <20230423111041.684297-1-chengzhihao1@huawei.com>
References: <20230423111041.684297-1-chengzhihao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_015623_596495_8DF8895D 
X-CRM114-Status: GOOD (  14.73  )
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

SGVsbG8sCgpjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbSB3cm90ZSBvbiBTdW4sIDIzIEFwciAyMDIz
IDE5OjEwOjQxICswODAwOgoKPiBUaGVyZSBleGlzdHMgbXRkIGRldmljZXMgd2l0aCB6ZXJvIGVy
YXNlc2l6ZSwgd2hpY2ggd2lsbCB0cmlnZ2VyIGEKPiBkaXZpZGUtYnktemVybyBleGNlcHRpb24g
d2hpbGUgYXR0YWNoaW5nIHViaSBkZXZpY2UuCj4gRml4IGl0IGJ5IHJlZnVzaW5nIGF0dGFjaGlu
ZyBpZiBtdGQncyBlcmFzZXNpemUgaXMgMC4KPiAKPiBGaXhlczogODAxYzEzNWNlNzNkICgiVUJJ
OiBVbnNvcnRlZCBCbG9jayBJbWFnZXMiKQoKSU1ITywgdGhpcyBzaG91bGQgYmUgYmFja3BvcnRl
ZCB0byBrZWVwIHRoZSB2dWxuZXJhYmxlIGFyZWEgYXMKc21hbGwgYXMgcG9zc2libGUsIHNvOgoK
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCj4gUmVwb3J0ZWQtYnk6IFl1IEhhbyA8eWhhbzAx
NkB1Y3IuZWR1Pgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvOTc3MzQ3NTQz
LjIyNjg4OC4xNjgyMDExOTk5NDY4LkphdmFNYWlsLnppbWJyYUBub2QuYXQvVC8KPiBTaWduZWQt
b2ZmLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKUmV2aWV3ZWQt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IC0tLQo+ICBk
cml2ZXJzL210ZC91YmkvYnVpbGQuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIv
ZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCA2YTJkMWVmOGQ0M2MuLjY5ZTkyYzMxYWNl
MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMv
bXRkL3ViaS9idWlsZC5jCj4gQEAgLTg5Niw2ICs4OTYsMTMgQEAgaW50IHViaV9hdHRhY2hfbXRk
X2RldihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHViaV9udW0sCj4gIAkJcmV0dXJuIC1FSU5W
QUw7Cj4gIAl9Cj4gIAo+ICsJLyogVUJJIGNhbm5vdCB3b3JrIG9uIGZsYXNoZXMgd2l0aCB6ZXJv
IGVyYXNlc2l6ZS4gKi8KPiArCWlmICghbXRkLT5lcmFzZXNpemUpIHsKPiArCQlwcl9lcnIoInVi
aTogcmVmdXNlIGF0dGFjaGluZyBtdGQlZCAtIHplcm8gZXJhc2VzaXplIGZsYXNoIGlzIG5vdCBz
dXBwb3J0ZWRcbiIsCj4gKwkJCW10ZC0+aW5kZXgpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJ
fQo+ICsKPiAgCWlmICh1YmlfbnVtID09IFVCSV9ERVZfTlVNX0FVVE8pIHsKPiAgCQkvKiBTZWFy
Y2ggZm9yIGFuIGVtcHR5IHNsb3QgaW4gdGhlIEB1YmlfZGV2aWNlcyBhcnJheSAqLwo+ICAJCWZv
ciAodWJpX251bSA9IDA7IHViaV9udW0gPCBVQklfTUFYX0RFVklDRVM7IHViaV9udW0rKykKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
