Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7553CC04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 13:53:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4880D21479
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 13:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCw5rP/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4880D21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsQYQ7D+xjHl3Gniqfa3DnNpZBFOxuYSuVhk35ur8cA=; b=iCw5rP/yl7fJEk
	GxHaGuRdJGq2HxeIzdi7i7NSycCT/M9WDXMV8lV4UJEexq9daKl19sA7zf7dpIxV94GAo3YaE1iGe
	Z3y/veY0zT+N/A5sefzmB6XkXfkoR8a+2K8o+2FnhofIuxU/DIZw6Mn8GEm/kUuUyK01IrTPW4aSq
	rMecHcr7MFW0k3MvTsKRUrbJ+/UhQpEVAmF5zVaeZ0zwyejacF7ky9L/DObcltnAVsoayz1Qmc/Bz
	Rcwoy3JVrldyMUkW/drr23YjeDrFwi/5FcX1wsONDjJuyEiES0mcLojZzon8V5UetZx1Ze8OwLr1m
	eVVIPEJtW4y7X+Sst4pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP5yA-0004vl-0E; Fri, 10 May 2019 13:53:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP5y6-0004vE-Fd
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 13:53:48 +0000
X-Originating-IP: 90.88.28.253
Received: from xps13 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D5D0A240011;
 Fri, 10 May 2019 13:53:41 +0000 (UTC)
Date: Fri, 10 May 2019 15:53:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190510155340.1130487f@xps13>
In-Reply-To: <20190510153704.33de9568@windsurf.home>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510153704.33de9568@windsurf.home>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_065346_672860_8BDAA018 
X-CRM114-Status: GOOD (  15.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: computersforpeace@gmail.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Mason Yang <masonccyang@mxic.com.tw>,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiB3cm90ZSBvbiBGcmksIDEwIE1heQoyMDE5IDE1OjM3OjA0ICswMjAwOgoKPiBIZWxsbywKPiAK
PiBTb21lIHB1cmVseSBjb3NtZXRpYyBzdWdnZXN0aW9ucyBiZWxvdy4KPiAKPiBPbiBGcmksIDEw
IE1heSAyMDE5IDE1OjQxOjAyICswODAwCj4gTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5j
b20udHc+IHdyb3RlOgo+IAo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcHJfZXJyKCJzZXQgZmVhdHVy
ZSBmYWlsZWQgdG8gcmVhZCByZXRyeSBtb2RlZDolZFxuIiwgbW9kZSk7ICAgIAo+IAo+IEkgZG9u
J3Qga25vdyB3aGF0IGlzIHRoZSBwb2xpY3kgaW4gdGhlIE1URC9OQU5EIHN1YnN5c3RlbSwgYnV0
Cj4gc2hvdWxkbid0IHlvdSBiZSB1c2luZyBkZXZfZXJyKCkgaW5zdGVhZCBvZiBwcl9lcnIoKSBo
ZXJlIHRvIGhhdmUgYQo+IG5pY2UgcHJlZml4IGZvciB0aGUgbWVzc2FnZSA/Cj4gCj4gCQlkZXZf
ZXJyKCZuYW5kX3RvX210ZChjaGlwKS0+ZGV2LCAic2V0IGZlYXR1cmUgLi4iLCBtb2RlKTsKCklu
ZGVlZC4gWW91IGNhbiBldmVuIGRlcmVmZXJlbmNlIGFuIG10ZF9pbmZvIG9iamVjdCBmaXJzdCwg
dGhlbiB1c2UKbXRkLT5kZXYuCgo+IAo+ID4gK3N0YXRpYyB2b2lkIG1hY3Jvbml4X25hbmRfb25m
aV9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiArewo+ID4gKwlzdHJ1Y3QgbmFuZF9w
YXJhbWV0ZXJzICpwID0gJmNoaXAtPnBhcmFtZXRlcnM7Cj4gPiArCj4gPiArCWlmIChwLT5vbmZp
KSB7ICAKPiAKPiBDaGFuZ2UgdG86Cj4gCj4gCWlmICghcC0+b25maSkKPiAJCXJldHVybjsKPiAK
PiBUaGlzIHdheSB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gY2FuIHNhdmUgb25lIGxldmVsIG9m
IGluZGVudGF0aW9uLgo+IAo+ID4gKwkJc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXgg
Km14aWMgPQo+ID4gKwkJCQkodm9pZCAqKXAtPm9uZmktPnZlbmRvcjsKPiA+ICsKPiA+ICsJCWlm
IChteGljLT5yZWxpYWJpbGl0eV9mdW5jICYgTUFDUk9OSVhfUkVBRF9SRVRSWV9CSVQpIHsgIAo+
IAo+IENoYW5nZSB0bzoKPiAKPiAJaWYgKG14aWMtPnJlbGlhYmlsaXR5X2Z1bmMgJiBNQUNST05J
WF9SRUFEX1JFVFJZX0JJVCA9PSAwKQo+IAkJcmV0dXJuOwo+IAo+IEFuZCB0aGUgcmVzdCBvZiB0
aGUgZnVuY3Rpb24gY2FuIHNhdmUgb25lIGxldmVsIG9mIGluZGVudGF0aW9uLgo+IAo+ID4gKwkJ
CWNoaXAtPnJlYWRfcmV0cmllcyA9IE1BQ1JPTklYX1JFQURfUkVUUllfTU9ERSArIDE7Cj4gPiAr
CQkJY2hpcC0+c2V0dXBfcmVhZF9yZXRyeSA9Cj4gPiArCQkJCSBtYWNyb25peF9uYW5kX3NldHVw
X3JlYWRfcmV0cnk7Cj4gPiArCQkJaWYgKHAtPnN1cHBvcnRzX3NldF9nZXRfZmVhdHVyZXMpIHsK
PiA+ICsJCQkJc2V0X2JpdChPTkZJX0ZFQVRVUkVfQUREUl9SRUFEX1JFVFJZLAo+ID4gKwkJCQkJ
cC0+c2V0X2ZlYXR1cmVfbGlzdCk7Cj4gPiArCQkJCXNldF9iaXQoT05GSV9GRUFUVVJFX0FERFJf
UkVBRF9SRVRSWSwKPiA+ICsJCQkJCXAtPmdldF9mZWF0dXJlX2xpc3QpOwo+ID4gKwkJCX0gIAo+
IAo+IFdoaWNoIHdpbGwgcmVxdWlyZSBsZXNzIHdyYXBwaW5nIGluIHRob3NlIGxpbmVzIHRoYXQg
YXJlIGFscmVhZHkgYXQgdGhlCj4gdGhpcmQgaW5kZW50YXRpb24gbGV2ZWwuCj4gCj4gVG8gbWUs
IGl0IGlzIGFsc28gbW9yZSBsb2dpY2FsOiB3ZSBleGNsdWRlIHRoZSBjYXNlcyB3ZSBhcmUgbm90
Cj4gaW50ZXJlc3RlZCBpbiBhbmQgcmV0dXJuIGVhcmx5LCBhbmQgdGhlbiBpZiB3ZSBhcmUgc3Rp
bGwgaW4gdGhlIGNhc2Ugd2UKPiBhcmUgaW50ZXJlc3RlZCwgd2UgaGFuZGxlIGl0LgoKSSBkZWZp
bml0ZWx5IGFncmVlIHdpdGggdGhlc2UgY29zbWV0aWMgY2hhbmdlcy4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
