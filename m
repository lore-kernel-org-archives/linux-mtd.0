Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF44E784AC
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNJzGmVq2jtQSYdOAkcIyqj8w4aXN4oaZ6vXWxOYa6A=; b=nld1gjVAaQkOuX
	zt7b004yPE8QTeWDVp+3zss/py12TPZuGlNYI1QwZq1v0tcIhTmucEVHNT6bT0jzYWotqZKx6WE4z
	1uAJ27FjfNRMYDMoRVMLafarmBZa/YzOWcuEnwdLnbj0kbVNokdSGZm2v+hgcrhMICiV2aFrtQZ7w
	valqmjR/YMZhFEWTgGL46vbLRl0BPKNq7NnGWJA88OYOqB99BhJmChbMqRlzlX8Hxd+x6GeBJ/oKH
	kKC3torSjMYhOPSKUx4EWmU1JNYnfPzLE5JgLXr1ASwB8yNfRgVHIlwB/C43z+4t4mP3HvLoDespX
	Jqjns1jr8tIGVCQWguSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHma-00Cgbi-2m;
	Mon, 02 Oct 2023 12:12:16 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHmX-00Cgam-25
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 12:12:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47CCDE0003;
	Mon,  2 Oct 2023 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696248729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhprkMPkS6qsImRy6W6yD41h8GmwyEwpRYEXzX0JD58=;
	b=GHF5gaegWFK5T/2iN2ILLf9N1xBfeyfNCSEEHRiceuS/wDMVym86qm63nqG7UxapsRlupt
	0h/ZmTwLleXaR4nJ1WWKkceRluLSysXP/j1TBMKvogEExebtyWsCd5gdIydxildd94wL/f
	eZ4bGe0r/ODfrj2aHH3H3Huxu6hUqyqIk7L8VI8L+9Hupg/QxWhoAPkcWxqTKqf/3Pe04H
	BCDLe00nKz46B2ypo/5xBzQOmZlv8C4ifukd9AhCBs663FVl0VwSPplloVQRKp9D2acP8Q
	PViOmfUCNURrycr5RvkwJ53TZ4kqrETQaLeMIL5nY7yuyglu1LeX0p361I7nzw==
Date: Mon, 2 Oct 2023 14:12:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@mail.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com
Subject: Re: [PATCH] mtd: rawnand: brcmnand: Initial exec_op implementation
Message-ID: <20231002141204.167a9cc6@xps-13>
In-Reply-To: <trinity-ad65aa5d-e930-4f11-ac86-e18f90f5092c-1696016842791@3c-app-mailcom-lxa02>
References: <trinity-bb7db9f1-d34d-4fe2-bed3-814d3a63476a-1694571881792@3c-app-mailcom-lxa03>
	<20230922162424.4a7b27ec@xps-13>
	<trinity-ad65aa5d-e930-4f11-ac86-e18f90f5092c-1696016842791@3c-app-mailcom-lxa02>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051213_818487_D34FD215 
X-CRM114-Status: GOOD (  24.33  )
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

SGkgRGF2aWQsCgo+ID4gPiArCj4gPiA+ICsJZm9yIChpID0gMDsgaSA8IHN1Ym9wLT5uaW5zdHJz
OyBpKyspIHsKPiA+ID4gKwkJaW5zdHIgPSAmc3Vib3AtPmluc3Ryc1tpXTsKPiA+ID4gKwo+ID4g
PiArCQlpZiAoKGluc3RyLT50eXBlID09IE5BTkRfT1BfQ01EX0lOU1RSKSAmJgo+ID4gPiArCQkJ
KGluc3RyLT5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9TVEFUVVMpKQo+ID4gPiArCQkJc3Rh
dHVzID0gMTsKPiA+ID4gKwkJZWxzZSBpZiAoc3RhdHVzICYmIChpbnN0ci0+dHlwZSA9PSBOQU5E
X09QX0RBVEFfSU5fSU5TVFIpKSB7Cj4gPiA+ICsJCQkvKgo+ID4gPiArCQkJICogbmVlZCB0byBm
YWtlIHRoZSBuYW5kIGRldmljZSB3cml0ZSBwcm90ZWN0IGJlY2F1c2UgbmFuZF9iYXNlIGRvZXMg
YQo+ID4gPiArCQkJICogbmFuZF9jaGVja193cCB3aGljaCBjYWxscyBuYW5kX3N0YXR1c19vcCBO
QU5EX0NNRF9TVEFUVVMgd2hpY2ggY2hlY2tzCj4gPiA+ICsJCQkgKiB0aGF0IHRoZSBuYW5kIGlz
IG5vdCB3cml0ZSBwcm90ZWN0ZWQgYmVmb3JlIGFuIG9wZXJhdGlvbiBzdGFydHMuCj4gPiA+ICsJ
CQkgKiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgaXMgaXQncyBkb25lIG91dHNpZGUgZXhlY19vcCBz
byB0aGUgbmFuZCBpcwo+ID4gPiArCQkJICogd3JpdGUgcHJvdGVjdGVkIGFuZCB0aGlzIGNoZWNr
IHdpbGwgZmFpbCB1bnRpbCB0aGUgd3JpdGUgb3IgZXJhc2UKPiA+ID4gKwkJCSAqIG9yIHdyaXRl
IGJhY2sgb3BlcmF0aW9uIGFjdHVhbGx5IGhhcHBlbnMgd2hlcmUgd2UgdHVybiBvZmYgd3AuCj4g
PiA+ICsJCQkgKi8gIAo+ID4gCj4gPiBJZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgY29y
ZSBpdCBuZWVkcyB0byBiZSBoYW5kbGVkIGluIHRoZSBjb3JlLAo+ID4gbm90IHdvcmthcm91bmRl
ZCBoZXJlLiBUaGUgd2hvbGUgbG9naWMgd2l0aCB0aGUgc3RhdHVzIHByb3BlcnR5IHNlZW1zCj4g
PiByZWFsbHkgd3JvbmcuCj4gPiAgIAo+IAo+IEknbSB0cnlpbmcgdG8gY2hhbmdlIG91ciBjdXJy
ZW50IGNvZGUgZnVuY3Rpb25hbGl0eSBhcyBsaXR0bGUgYXMKPiBwb3NzaWJsZSBieSBoYXZpbmcg
dGhpcyBmdW5jdGlvbiBpbiB0aGUgc2FtZSB3YXkgYXMgaXQgYWx3YXlzIGhhcwo+IGFuZCBJIGRv
IG5vdCB3YW50IHRvIG1ha2UgY2hhbmdlcyB0b28gbXVjaCBvdXRzaWRlIHRoZSBzY29wZQo+IG9m
IHRoaXMgZXhlY19vcCBjaGFuZ2UuCgpJIHVuZGVyc3RhbmQsIGFuZCB0aGlzIGlzIHByb2JhYmx5
IHRoZSBiZXN0IGZpcnN0IGFwcHJvYWNoLCBidXQgaWYKdGhlcmUgaXMgcmVhbGx5IGFuIGlzc3Vl
IGhlcmUgd2l0aCB0aGUgYmVoYXZpb3Igb2YgdGhlIGNvcmUgKG9yIG9uZSBvZgppdHMgaGVscGVy
cykgd2UgbmVlZCB0byBmaXggaXQgcHJvcGVybHkgcmF0aGVyIHRoYW4gd29ya2Fyb3VuZGluZyBp
dC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
