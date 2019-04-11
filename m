Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95842C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EEB2084D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uUh3Kcpc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EEB2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rx4c2ELa7yYlOnRdVeWiE6pskPH0QxMy9pjeUNrU8H0=; b=uUh3KcpcVs4Oii
	1CvGfCpqgVVhLP2/sAk5O/NBvaQfMOSfXZsjyxvfSDJx6zcO7YMVLNNUqv0lO3+iJQTeCMyw3pMLY
	dguXCw9rWpzD6CFT4OsuOMnZN+Tjy8kKW2jkNIi3fmv0XtosohYB4Pbt5u2MWxeGYrw0mOLN/HbF6
	lcWPnEfQf1ktQfJiiEC+lrWnmq95D/Lr5NjIau4PCUfqo0XRuOqVYC/UK+dfg6NBZC8KsN/rC5D5n
	9oMgkDTMcxR/K/J+O0SwWOPRz7WOASWpOA1EekgtNJOm8rXZmdXKT59zlx0OWa65dS6tAqj8/jWet
	81ALk0+EyXcp5jVRb4vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhtt-0000su-Om; Thu, 11 Apr 2019 22:10:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhtm-0000mQ-1y; Thu, 11 Apr 2019 22:10:23 +0000
X-Originating-IP: 81.185.166.150
Received: from xps13 (150.166.185.81.rev.sfr.net [81.185.166.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5F6C924000B;
 Thu, 11 Apr 2019 22:10:11 +0000 (UTC)
Date: Fri, 12 Apr 2019 00:10:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2] mtd: rawnand: mark expected switch fall-throughs
Message-ID: <20190412001009.2db358b7@xps13>
In-Reply-To: <ce33f949-48c8-b32a-028e-ee68afc08e8f@embeddedor.com>
References: <20190128181520.GA25887@embeddedor> <20190205135521.622f82c2@xps13>
 <ce33f949-48c8-b32a-028e-ee68afc08e8f@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_151022_248582_0DACA0FC 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gVGh1LCAxMSBBcHIKMjAxOSAxMzozMDozMSAtMDUwMDoKCj4gSGkgTWlxdWVs
LAo+IAo+IE9uIDIvNS8xOSA2OjU1IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IFsuLl0KPiA+
PiBAQCAtMzI4MCwxMiArMzI4MCwxNCBAQCBzdGF0aWMgdm9pZCBvbmVuYW5kX2NoZWNrX2ZlYXR1
cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4+ICAJCQlpZiAoKHRoaXMtPnZlcnNpb25faWQg
JiAweGYpID09IDB4ZSkKPiA+PiAgCQkJCXRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfTk9Q
XzE7Cj4gPj4gIAkJfQo+ID4+ICsJCS8qIGZhbGwgdGhyb3VnaCAqLwo+ID4+ICAKPiA+PiAgCWNh
c2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4gPj4gIAkJLyogMkdiIEREUCBkb2VzIG5v
dCBoYXZlIDIgcGxhbmUgKi8KPiA+PiAgCQlpZiAoIU9ORU5BTkRfSVNfRERQKHRoaXMpKQo+ID4+
ICAJCQl0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPiA+PiAgCQl0aGlzLT5v
cHRpb25zIHw9IE9ORU5BTkRfSEFTX1VOTE9DS19BTEw7Cj4gPj4gKwkJLyogZmFsbCB0aHJvdWdo
ICovICAKPiA+IAo+ID4gVGhpcyBsb29rcyBzdHJhbmdlLgo+ID4gCj4gPiBJbiBPTkVOQU5EX0RF
VklDRV9ERU5TSVRZXzJHYjoKPiA+IE9ORU5BTkRfSEFTX1VOTE9DS19BTEwgaXMgc2V0IHVuY29u
ZGl0aW9uYWxseS4KPiA+IAo+ID4gQnV0IHRoZW4sIHVuZGVyIE9ORU5BTkRfREVWSUNFX0RFTlNJ
VFlfMUdiLCB0aGUgc2FtZSBvcHRpb24gaXMgc2V0IG9ubHkKPiA+IGlmIHByb2Nlc3MgaXMgZXZh
bHVhdGVkIHRvIHRydWUuCj4gPiAKPiA+IFNhbWUgcHJvYmxlbSB3aXRoIE9ORU5BTkRfSEFTXzJQ
TEFORToKPiA+IC0gaXQgaXMgc2V0IGluIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfNEdiIG9ubHkg
aWYgT05FTkFORF9JU19ERFAoKQo+ID4gLSBpdCBpcyB1bnNldCBpbiBPTkVOQU5EX0RFVklDRV9E
RU5TSVRZXzJHYiBvbmx5IGlmICFPTkVOQU5EX0lTX0REUCgpCj4gPiAKPiA+IE1heWJlIHRoaXMg
cG9ydGlvbiBzaG91bGQgYmUgcmV3b3JrZWQgYmVjYXVzZSBJIGFtIHVuc3VyZSBpZiB0aGlzIGlz
IGEKPiA+IG1pc3NpbmcgZmFsbCB0aHJvdWdoIG9yIGEgYnVnLgo+ID4gICAKPiAKPiBJIHdvbmRl
ciBpZiB5b3UgaGFkIHRoZSBjaGFuY2UgdG8gdGFrZSBhIGxvb2sgaW50byB0aGlzIHBpZWNlIG9m
IGNvZGUuCj4gCj4gVGhhbmtzCj4gLS0KPiBHdXN0YXZvCgpXaGF0IGRvIHlvdSBtZWFuPwoKClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
