Return-Path: <SRS0=GuhJ=7W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06932C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 14:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97032078D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2020 14:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwlpJyOI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C97032078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GbDkX9sDPpMFLT6ZmAz1GV9v+103RLN7QqiAqKQSlU=; b=kwlpJyOIgQe+Ci
	VUbhIOJqG4BEWYNI2hsaOs7h9jmDmvNg7cHr9u6JPIfWbpepFRwd6GL1UkLW8mI45T+AIa44l6o/H
	EMYEWSee9UMnM/XhWeS4SKLJ61xoMl5F4QLcOls2M87QMYpsKJhRbiQKSg51Y4MHRlr71M4cpT1K7
	pcWH4q3HKZet6UNSptMh/BYYVDBroWHrso/OqzmFW8kwwqZ1TGAgSzYybUTpDtIJdOgXJ16j7YsB9
	cKl3mXcT914fcID7kj6WazsPHhmPH1qc5dcgHZSKzYvRwdV5Y4NhNKt/CXSbUdzjuLU+UQj/w6f/7
	KGh/rh64tZyFODKLRjaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jierC-0006TX-9K; Tue, 09 Jun 2020 14:04:02 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jier9-0006T7-2O
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2020 14:04:00 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D2DD120003;
 Tue,  9 Jun 2020 14:03:53 +0000 (UTC)
Date: Tue, 9 Jun 2020 16:03:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V2 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
Message-ID: <20200609160352.60cbad80@xps13>
In-Reply-To: <1591701056-3944-3-git-send-email-sivaprak@codeaurora.org>
References: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
 <1591701056-3944-3-git-send-email-sivaprak@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_070359_245757_951DED5D 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: peter.ujfalusi@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBUdWUsICA5IEp1bgoyMDIwIDE2OjQwOjU2ICswNTMwOgoKPiBCQU0g
bW9kZSBpcyBzZXQgYnkgd3JpdGluZyBCQU1fTU9ERV9FTiBiaXQgb24gTkFORF9DVFJMIHJlZ2lz
dGVyLgo+IE5BTkRfQ1RSTCBpcyBhbiBvcGVyYXRpb25hbCByZWdpc3RlciBhbmQgaW4gQkFNIG1v
ZGUgb3BlcmF0aW9uYWwKPiByZWdpc3RlcnMgYXJlIHJlYWQgb25seS4KPiAKPiBTbywgYmVmb3Jl
IHdyaXRpbmcgaW50byBOQU5EX0NUUkwgcmVnaXN0ZXIgY2hlY2sgaWYgQkFNIG1vZGUgaXMgYWxy
ZWFkeQo+IGVuYWJsZWQgYnkgYm9vdGxvYWRlciwgYW5kIHNldCBCQU0gbW9kZSBvbmx5IGlmIGl0
IGlzIG5vdCBzZXQgYWxyZWFkeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaXZhcHJha2FzaCBNdXJ1
Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMgfCA5ICsrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+
IGluZGV4IGUwYWZhMmMuLjc3NDAwNTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gQEAgLTI3NzksNyArMjc3OSwxNCBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfc2V0dXAoc3Ry
dWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYykKPiAgCS8qIGVuYWJsZSBBRE0gb3IgQkFN
IERNQSAqLwo+ICAJaWYgKG5hbmRjLT5wcm9wcy0+aXNfYmFtKSB7Cj4gIAkJbmFuZF9jdHJsID0g
bmFuZGNfcmVhZChuYW5kYywgTkFORF9DVFJMKTsKPiAtCQluYW5kY193cml0ZShuYW5kYywgTkFO
RF9DVFJMLCBuYW5kX2N0cmwgfCBCQU1fTU9ERV9FTik7Cj4gKwkJLyogTkFORF9DVFJMIGlzIGFu
IG9wZXJhdGlvbmFsIHJlZ2lzdGVycywgYW5kIENQVQo+ICsJCSAqIGFjY2VzcyB0byBvcGVyYXRp
b25hbCByZWdpc3RlcnMgYXJlIHJlYWQgb25seQo+ICsJCSAqIGluIEJBTSBtb2RlLiBTbyB1cGRh
dGUgdGhlIE5BTkRfQ1RSTCByZWdpc3Rlcgo+ICsJCSAqIG9ubHkgaWYgaXQgaXMgbm90IGluIEJB
TSBtb2RlLiBJbiBtb3N0IGNhc2VzIEJBTQo+ICsJCSAqIG1vZGUgd2lsbCBiZSBlbmFibGVkIGlu
IGJvb3Rsb2FkZXIKPiArCQkgKi8KPiArCQlpZiAoIShuYW5kX2N0cmwgfCBCQU1fTU9ERV9FTikp
Cj4gKwkJCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0NUUkwsIG5hbmRfY3RybCB8IEJBTV9NT0RF
X0VOKTsKPiAgCX0gZWxzZSB7Cj4gIAkJbmFuZGNfd3JpdGUobmFuZGMsIE5BTkRfRkxBU0hfQ0hJ
UF9TRUxFQ1QsIERNX0VOKTsKPiAgCX0KCkRvZXMgdGhpcyBjdXJyZW50bHkgcHJvZHVjZXMgYW4g
aXNzdWUgYXQgcnVudGltZT8KCklmIHllcywgeW91IHNob3VsZCBoYXZlIGEgRml4ZXMvQ0M6IHN0
YWJsZSBwYWlyIG9mIHRhZ3MuCgpBbHNvLCB3aGF0IGlzIEJBTSBtb2RlPyBQbGVhc2UgdGVsbCB1
cyBpbiB0aGUgY29tbWl0IGxvZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
