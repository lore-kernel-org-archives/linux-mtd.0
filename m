Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D187FC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:01:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25FE20661
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTrFIT6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25FE20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZv2fOyokquN3f+xm582ZIu9+fj0PKEEj6z7hRi27S8=; b=dTrFIT6NK+Abqb
	ukXsfmdJ7B5b/dv7gDxF7Zl2fgQTfVsFaNiIiH7KLc3WtGo9ZWw4ESvburXO0WvSFB7QriItI9Ylg
	X1Lm6DijqB1fQaf7HQC5Wyu4REYdHcN/PANd4z8+D15918pldm/pD4aWJRz7j4/AwbsMgf8ApOsaZ
	yPR4EkluSgcqEtX8LhZTNg9ilyjYY+64EFIG6NNNWukdCLCR7Mxi2UFkadAA0qaySI/NaFtQjtCXV
	9rVxEPEiBdvWHg63JZu0Vpb/0/dfHT3FKE9oGab/NJ4Ocy5B5fnJEM7diG3ztgUT2nHwUcY/TkEhV
	QZuJDCZqqYKCRhRL0pOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbBo-0005cc-R1; Thu, 09 Jan 2020 17:01:44 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbBl-0005cG-91
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:01:43 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E5541240004;
 Thu,  9 Jan 2020 17:01:29 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:01:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: Add support Macronix deep power
 down mode
Message-ID: <20200109180128.0f3e7b99@xps13>
In-Reply-To: <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
References: <1572256527-5074-1-git-send-email-masonccyang@mxic.com.tw>
 <1572256527-5074-5-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_090141_589376_77C70BEF 
X-CRM114-Status: GOOD (  20.65  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
TW9uLCAyOCBPY3QgMjAxOSAxNzo1NToyNworMDgwMDoKCj4gTWFjcm9uaXggQUQgc2VyaWVzIHN1
cHBvcnQgZGVlcCBwb3dlciBkb3duIG1vZGUgZm9yIGEgbWluaW11bQo+IHBvd2VyIGNvbnN1bXB0
aW9uIHN0YXRlLgo+IAo+IFBhdGNoIG5hbmRfc3VzcGVuZCgpICYgbmFuZF9yZXN1bWUoKSBieSBN
YWNyb25peCBzcGVjaWZpYwo+IGRlZXAgcG93ZXIgZG93biBtb2RlIGNvbW1hbmQgYW5kIGV4aXQg
aXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25jY3lhbmdAbXhpYy5jb20u
dHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyB8IDcyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNzAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9t
YWNyb25peC5jCj4gaW5kZXggMTM5MjliZi4uMzA5OGJjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21hY3Jvbml4LmMKPiBAQCAtMTUsNiArMTUsOCBAQAo+ICAjZGVmaW5lIE1YSUNfQkxP
Q0tfUFJPVEVDVElPTl9BTExfTE9DSyAweDM4Cj4gICNkZWZpbmUgTVhJQ19CTE9DS19QUk9URUNU
SU9OX0FMTF9VTkxPQ0sgMHgwCj4gIAo+ICsjZGVmaW5lIE5BTkRfQ01EX1BPV0VSX0RPV04gMHhC
OQoKSSBzdXBwb3NlIHRoaXMgdmFsdWUgaXMgTWFjcm9uaXggc3BlY2lmaWMsIGFuZCBoZW5jZSBz
aG91bGQgaGF2ZSBhCk1BQ1JPTklYXyBvciBNWElDXyBwcmVmaXggaW5zdGVhZCBvZiBOQU5EXy4K
Cj4gKwo+ICBzdHJ1Y3QgbmFuZF9vbmZpX3ZlbmRvcl9tYWNyb25peCB7Cj4gIAl1OCByZXNlcnZl
ZDsKPiAgCXU4IHJlbGlhYmlsaXR5X2Z1bmM7Cj4gQEAgLTEzNywxMyArMTM5LDY2IEBAIHN0YXRp
YyBpbnQgbXhpY19uYW5kX3VubG9jayhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2Zz
LCB1aW50NjRfdCBsZW4pCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICtpbnQgbmFuZF9wb3dl
cl9kb3duX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+
ICsJaWYgKG5hbmRfaGFzX2V4ZWNfb3AoY2hpcCkpIHsKPiArCQlzdHJ1Y3QgbmFuZF9vcF9pbnN0
ciBpbnN0cnNbXSA9IHsKPiArCQkJTkFORF9PUF9DTUQoTkFORF9DTURfUE9XRVJfRE9XTiwgMCks
Cj4gKwkJfTsKPiArCj4gKwkJc3RydWN0IG5hbmRfb3BlcmF0aW9uIG9wID0gTkFORF9PUEVSQVRJ
T04oY2hpcC0+Y3VyX2NzLCBpbnN0cnMpOwo+ICsKPiArCQlyZXQgPSBuYW5kX2V4ZWNfb3AoY2hp
cCwgJm9wKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gcmV0Owo+ICsKPiArCX0gZWxzZSB7
Cj4gKwkJY2hpcC0+bGVnYWN5LmNtZGZ1bmMoY2hpcCwgTkFORF9DTURfUE9XRVJfRE9XTiwgLTEs
IC0xKTsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGludCBteGlj
X25hbmRfc3VzcGVuZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt7Cj4gKwlpbnQgcmV0Owo+
ICsKPiArCW5hbmRfc2VsZWN0X3RhcmdldChjaGlwLCAwKTsKPiArCXJldCA9IG5hbmRfcG93ZXJf
ZG93bl9vcChjaGlwKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXByX2VycigiJXMgY2FsbGVkIGZv
ciBjaGlwIGludG8gc3VzcGVuZCBmYWlsZWRcbiIsIF9fZnVuY19fKTsKCldoYXQgYWJvdXQgc29t
ZXRoaW5nIG1vcmUgc3BlY2lmaWM/CgogICAgICAgIlN1c3BlbmRpbmcgTVhJQyBOQU5EIGNoaXAg
ZmFpbGVkICglKVxuIiwgcmV0Cgo+ICsJbmFuZF9kZXNlbGVjdF90YXJnZXQoY2hpcCk7Cj4gKwo+
ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXhpY19uYW5kX3Jlc3VtZShz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICt7Cj4gKwkvKgo+ICsJICogVG9nZ2xlICNDUyBwaW4g
dG8gcmVzdW1lIE5BTkQgZGV2aWNlIGFuZCBkb24ndCBjYXJlCj4gKwkgKiBvZiB0aGUgb3RoZXJz
IENMRSwgI1dFLCAjUkUgcGlucyBzdGF0dXMuCj4gKwkgKiBIZXJlIHNlbmRpbmcgcG93ZXIgZG93
biBjb21tYW5kIHRvIHRvZ2dsZSAjQ1MgbGluZS4KClRoZSBmaXJzdCBzZW50ZW5jZSBzZWVtcyBy
aWdodCwgdGhlIHNlY29uZCBjb3VsZCBiZSB1cGdyYWRlZDoKCiAgICAgICAgICAgVGhlIHB1cnBv
c2Ugb2YgZG9pbmcgYSBwb3dlciBkb3duIG9wZXJhdGlvbiBpcyBqdXN0IHRvCiAgICAgICAgICAg
ZW5zdXJlIHNvbWUgYnl0ZXMgd2lsbCBiZSBzZW50IG92ZXIgdGhlIE5BTkQgYnVzIHNvIHRoYXQg
I0NTCiAgICAgICAgICAgZ2V0cyB0b2dnbGVkIGJlY2F1c2UgdGhpcyBpcyB3aHkgdGhlIGNoaXAg
aXMgd29rZW4gdXAuCgkgICBUaGUgY29udGVudCBvZiB0aGUgYnl0ZXMgc2VudCBvbiB0aGUgTkFO
RCBidXMgYXJlIG5vdAoJICAgcmVsZXZhbnQgYXQgdGhpcyB0aW1lLiBTZW5kaW5nIGJ5dGVzIG9u
IHRoZSBidXMgaXMgbWFuZGF0b3J5CgkgICBmb3IgYSBsb3Qgb2YgTkFORCBjb250cm9sbGVycyBv
dGhlcndpc2UgdGhleSBhcmUgbm90IGFibGUgdG8KCSAgIGp1c3QgYXNzZXJ0L2RlLWFzc2VydCAj
Q1MuCgo+ICsJICovCj4gKwluYW5kX3NlbGVjdF90YXJnZXQoY2hpcCwgMCk7Cj4gKwluYW5kX3Bv
d2VyX2Rvd25fb3AoY2hpcCk7CgpBcmUgeW91IHN1cmUgc2VuZGluZyBhIHBvd2VyX2Rvd25fb3Ag
d2lsbCBub3QgYmUgaW50ZXJwcmV0ZWQgYnkgdGhlCmNoaXA/CgpJIHdvdWxkIGV4cGVjdCBhIHNs
ZWVwaW5nIGRlbGF5IGhlcmUsIGV2ZW4gc21hbGwuCgo+ICsJbmFuZF9kZXNlbGVjdF90YXJnZXQo
Y2hpcCk7Cj4gK30KPiArCj4gIC8qCj4gLSAqIE1hY3Jvbml4IE5BTkQgQUMgc2VyaWVzIHN1cHBv
cnQgQmxvY2sgUHJvdGVjdGlvbiBieSBTRVRfRkVBVFVSRVMKPiArICogTWFjcm9uaXggTkFORCBB
QyAmIEFEIHNlcmllcyBzdXBwb3J0IEJsb2NrIFByb3RlY3Rpb24gYnkgU0VUX0ZFQVRVUkVTCj4g
ICAqIHRvIGxvY2svdW5sb2NrIGJsb2Nrcy4KPiAgICovCj4gIHN0YXRpYyBpbnQgbWFjcm9uaXhf
bmFuZF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIHsKPiAtCWJvb2wgYmxvY2twcm90
ZWN0ZWQgPSBmYWxzZTsKPiArCXVuc2lnbmVkIGludCBpOwo+ICsJYm9vbCBibG9ja3Byb3RlY3Rl
ZCA9IGZhbHNlLCBwb3dlcmRvd24gPSBmYWxzZTsKPiArCXN0YXRpYyBjb25zdCBjaGFyICogY29u
c3QgcG93ZXJfZG93bl9kZXZbXSA9IHsKPiArCQkiTVgzMExGMUcyOEFEIiwKPiArCQkiTVgzMExG
MkcyOEFEIiwKPiArCQkiTVgzMExGNEcyOEFEIiwKPiArCX07Cj4gIAo+ICAJaWYgKG5hbmRfaXNf
c2xjKGNoaXApKQo+ICAJCWNoaXAtPm9wdGlvbnMgfD0gTkFORF9CQk1fRklSU1RQQUdFIHwgTkFO
RF9CQk1fU0VDT05EUEFHRTsKPiBAQCAtMTUzLDYgKzIwOCwxNCBAQCBzdGF0aWMgaW50IG1hY3Jv
bml4X25hbmRfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ICAKPiAgCW1hY3Jvbml4X25h
bmRfb25maV9pbml0KGNoaXApOwo+ICAKPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBv
d2VyX2Rvd25fZGV2KTsgaSsrKSB7Cj4gKwkJaWYgKCFzdHJjbXAocG93ZXJfZG93bl9kZXZbaV0s
IGNoaXAtPnBhcmFtZXRlcnMubW9kZWwpKSB7Cj4gKwkJCWJsb2NrcHJvdGVjdGVkID0gdHJ1ZTsK
PiArCQkJcG93ZXJkb3duID0gdHJ1ZTsKPiArCQkJYnJlYWs7Cj4gKwkJfQo+ICsJfQo+ICsKPiAg
CWlmIChibG9ja3Byb3RlY3RlZCkgewo+ICAJCWJpdG1hcF9zZXQoY2hpcC0+cGFyYW1ldGVycy5z
ZXRfZmVhdHVyZV9saXN0LAo+ICAJCQkgICBPTkZJX0ZFQVRVUkVfQUREUl9NWElDX1BST1RFQ1RJ
T04sIDEpOwo+IEBAIC0xNjMsNiArMjI2LDExIEBAIHN0YXRpYyBpbnQgbWFjcm9uaXhfbmFuZF9p
bml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIAkJY2hpcC0+X3VubG9jayA9IG14aWNfbmFu
ZF91bmxvY2s7Cj4gIAl9Cj4gIAo+ICsJaWYgKHBvd2VyZG93bikgewo+ICsJCWNoaXAtPl9zdXNw
ZW5kID0gbXhpY19uYW5kX3N1c3BlbmQ7Cj4gKwkJY2hpcC0+X3Jlc3VtZSA9IG14aWNfbmFuZF9y
ZXN1bWU7Cj4gKwl9CgpTZWUgbXkgY29tbWVudCBvbiBwYXRjaCAyLgoKPiArCj4gIAlyZXR1cm4g
MDsKPiAgfQo+ICAKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
