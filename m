Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D817FC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 06:54:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7375206E9
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 06:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRykpP6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7375206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1tFsaQt5bHo48up9uTieSYBuHGXipxQd0KK+s5dToSY=; b=CRykpP6kX4X9e1WLwTsA0zd79
	yAiPNYHQzDWN5bg3c0XGspXa1vsM1WO1BCTTDEuAo0KQ85OW7K0PZE7oja2JTq6ZTIxDmCkQ66/I9
	NqNh8i0R78juUxOf39+LKAZCEzL3ttI4pjEkY272RWlWR/ayLmDswX/iF6Ko4lSVWSQibIxi4lUTo
	g9Nd1KUXCT9xZprODoK0H3cyGw3MXh7iKVYifFNm56eELg9r8npHaumU8aIdBcsAtQLrBK5k7ohkK
	In2v0GFDzmeldBwRb+1aYDcpaDenyeRdOUoGoIB5p3xR79MozhswcTq3zJlhGVNlM6l/QTnxngL69
	c0kFgRdyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ULn-0003uK-Pl; Mon, 03 Aug 2020 06:53:35 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ULj-0003sm-P5
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 06:53:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0E2DCC0002;
 Mon,  3 Aug 2020 06:53:27 +0000 (UTC)
Date: Mon, 3 Aug 2020 08:53:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] bcm963xx_tag.h: fix duplicated word
Message-ID: <20200803085326.099e608d@xps13>
In-Reply-To: <847e3e46-2fc2-daea-67f3-3aaf0f2af4ac@gmail.com>
References: <d30c09a3-fe30-ddf1-3f21-00fc48b16443@infradead.org>
 <847e3e46-2fc2-daea-67f3-3aaf0f2af4ac@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_025331_980438_A4D57ADA 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, bcm-kernel-feedback-list@broadcom.com,
 LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gd3JvdGUgb24g
V2VkLCAxNSBKdWwgMjAyMAoxOTowNjozNiAtMDcwMDoKCj4gTGUgMjAyMC0wNy0xNSDDoCAxODoy
OCwgUmFuZHkgRHVubGFwIGEgw6ljcml0wqA6Cj4gPiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4KPiA+IAo+ID4gQ2hhbmdlIGRvdWJsZWQgd29yZCAiaXMiIHRvICJp
dCBpcyIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPgo+ID4gQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29t
Pgo+ID4gQ2M6IGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20KPiA+IENjOiBs
aW51eC1taXBzQHZnZXIua2VybmVsLm9yZyAgCj4gCj4gQWNrZWQtYnk6IEZsb3JpYW4gRmFpbmVs
bGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+IAo+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIG1l
cmdlZCB2aWEgbGludXgtbWlwcyBvciBsaW51eC1tdGQsIHNpbmNlIHdlCj4gaGF2ZSBjb25zdW1l
cnMgb2YgdGhpcyBoZWFkZXIgb24gYm90aCB0cmVlcy4KClNvcnJ5IGZvciB0aGUgZGVsYXksIEkg
d2FzIGF3YXkgdGhlIGxhc3Qgd2Vla3MuIEkgY2FuIHRha2UgaXQgdGhyb3VnaAp0aGUgTVREIHRy
ZWUgKG5leHQgcmVsZWFzZSBjeWNsZSkgb3IgbGV0IG1pcHMgZm9sa3MgdG8gZG8gaXQuIEl0J3MK
anVzdCBhIGNvbW1lbnQgY2hhbmdlLCBzbyBub3QgdGhhdCBpbXBhY3RpbmcuCgo+IAo+ID4gLS0t
Cj4gPiAgaW5jbHVkZS9saW51eC9iY205NjN4eF90YWcuaCB8ICAgIDIgKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gLS0tIGxpbnV4
LW5leHQtMjAyMDA3MTQub3JpZy9pbmNsdWRlL2xpbnV4L2JjbTk2M3h4X3RhZy5oCj4gPiArKysg
bGludXgtbmV4dC0yMDIwMDcxNC9pbmNsdWRlL2xpbnV4L2JjbTk2M3h4X3RhZy5oCj4gPiBAQCAt
ODQsNyArODQsNyBAQCBzdHJ1Y3QgYmNtX3RhZyB7Cj4gPiAgCWNoYXIgZmxhc2hfbGF5b3V0X3Zl
cltGTEFTSExBWU9VVFZFUl9MRU5dOwo+ID4gIAkvKiAxOTYtMTk5OiBrZXJuZWwrcm9vdGZzIENS
QzMyICovCj4gPiAgCV9fdTMyIGZza2VybmVsX2NyYzsKPiA+IC0JLyogMjAwLTIxNTogVW51c2Vk
IGV4Y2VwdCBvbiBBbGljZSBHYXRlIHdoZXJlIGlzIGlzIGluZm9ybWF0aW9uICovCj4gPiArCS8q
IDIwMC0yMTU6IFVudXNlZCBleGNlcHQgb24gQWxpY2UgR2F0ZSB3aGVyZSBpdCBpcyBpbmZvcm1h
dGlvbiAqLwo+ID4gIAljaGFyIGluZm9ybWF0aW9uMltUQUdJTkZPMl9MRU5dOwo+ID4gIAkvKiAy
MTYtMjE5OiBDUkMzMiBvZiBpbWFnZSBsZXNzIGltYWdldGFnIChrZXJuZWwgZm9yIEFsaWNlIEdh
dGUpICovCj4gPiAgCV9fdTMyIGltYWdlX2NyYzsKPiA+ICAgCj4gCj4gCgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
