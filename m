Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F902C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 15:37:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A37260FEA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 15:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A37260FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xvTYE4gqBC1t5ROzhp7G3MKoNUuqSEhNddKj5tEJtlU=; b=qx5fq1Ssep8iNSY5BZRh/tGFk
	brN6MxafqszCDysOjIYROLeUjAz1NvSLQ0eh3N+tQnQ/WWddiH8Qdm/WiquUBh6yN69FMtymRMlE7
	3zxDn082sUn/iOpPi2nsqs61pzIaT48SchX+QpKtcEMclq4S3DzJ+KTj+ycsZn0M6vp+/cbxtwpxW
	+okfdF40JHbc3+AJpSvrFHP9BUn27610u7z5aAYe7u+6hI0r2Mt00cqG1RjsILvAqjR77vdYMPR9R
	7/JuXR7k4QayXEgVb2g7apPcGf/gQ5Vf23hktni9buXZcIHDi6KSU3vRx11SKJmYlvWxuz7zl2HHJ
	zM9A9I0BQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVwk-00ACLB-5z; Mon, 19 Apr 2021 15:36:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVwh-00ACKz-Lj
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 15:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=ANoLq1gBC0Qo38dgbPRUqXhGyNJv1l6uDpsxPwXQVWc=; b=fOhQrAT+ZE+0RIxSs9+3fVUPV4
 jpTqz+9oONPHnsbWOKOJiBcMWEIOayL4G3WPGkocL42GHo6/8iUojqsNe6XOplIomlZNnmfvzIQTN
 cvui3UE3iq+1XPck4+qGfMyocvoZoApt4RFn/3jUESo1vGjdd6FVy7uJ6+wtU6OYlzoF67iva8A5S
 A48JCYJFGAHEQfbkVmsPAcCpI5wrlrknyITA5biEggpFlKEPbixo/qpx/+fwCqVrGDT3v5y41Onon
 /kGCQ8Kb912esYup3b4DSxZrbAYEA/J0rWXDu5jB2e/6th2e0I+VyUa536O1daPUvNBf6EWG9x67Y
 NPGuX2UQ==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVwc-00BUag-0k
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 15:36:18 +0000
X-Originating-IP: 92.184.110.210
Received: from xps13 (pop.92-184-110-210.mobile.abo.orange.fr [92.184.110.210])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EDEC3C0012;
 Mon, 19 Apr 2021 15:36:09 +0000 (UTC)
Date: Mon, 19 Apr 2021 17:36:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan =?UTF-8?B?UmllZG3DvGxsZXI=?= <S.Riedmueller@phytec.de>
Cc: "festevam@gmail.com" <festevam@gmail.com>,
 "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: imx27: No space left to write bad block table
Message-ID: <20210419173608.434f4b8d@xps13>
In-Reply-To: <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_083614_355318_D3F6B492 
X-CRM114-Status: GOOD (  35.86  )
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

SGkgU3RlZmFuLAoKPiA+IEludGVyZXN0aW5nLiBNYXliZSBJIG92ZXJsb29rZWQgdGhlIGJlbG93
IGNvbW1pdCB3aGVuIGFwcGx5aW5nLiBJbmRlZWQsCj4gPiBCQlQgbWF5IGJlIGNvbnNpZGVyZWQg
YXMgYmFkIGJsb2Nrcywgc28gSSB3b25kZXIgaWYgdGhlIGJlbG93IGNoYW5nZSBpcwo+ID4gdmFs
aWQgbm93Li4uCj4gPiAKPiA+IEd1aWxsYXVtZSwgd291bGQgeW91IGhhdmUgYSB3YXkgdG8gcmV2
ZXJ0IHRoaXMgcGF0Y2ggb24gdG9wIG9mCj4gPiBsaW51eC1uZXh0PyBTdGVmYW4sIHdvdWxkIHlv
dSBtaW5kIGdpdmluZyBtb3JlIGRldGFpbHMgb24gdGhlIHRlc3RpbmcKPiA+IHByb2NlZHVyZT8g
IAo+IAo+IEkgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiBhbiBpLk1YIDYgYnkgc2ltdWxhdGluZyB0d28g
YmFkIEJCVCBibG9ja3MgYnkgc2ltcGx5Cj4gcmV0dXJuaW5nIC1FSU8gaW4gbmFuZF9lcmFzZV9u
YW5kIHdoZW4gdGhlIGJsb2NrIHRvIGJlIGVyYXNlZCBpcyBvbmUgb2YgdGhlCj4gZmlyc3QgdHdv
IEJCVCBibG9ja3MuCj4gCj4gSSBoYXZlIHNlZW4gdGhpcyBvbmNlIG9uIGEgY3VzdG9tZXIgYm9h
cmQgYnV0IHdlcmUgbm90IGFibGUgdG8gcmVwcm9kdWNlIGl0Cj4gYW55bW9yZSwgdGh1cyB0aGUg
c2ltdWxhdGlvbiBvZiB0aGUgdHdvIGJhZCBibG9ja3MuCj4gCj4gV2l0aG91dCB0aGUgcGF0Y2gg
YmVsb3cgbmV3IHZlcnNpb25zIG9mIHRoZSBCQlQgY2FuIG5vIGxvbmdlciBiZSB3cml0dGVuIHRv
Cj4gdGhlIGZpcnN0IHR3byBibG9ja3MgcmVzZXJ2ZWQgZm9yIHRoZSBCQlQgYnV0IHRoZXkgYXJl
IHN0aWxsIGV2YWx1YXRlZCB0byByZWFkCj4gdGhlIEJCVCBmcm9tIGR1cmluZyBib290IGR1ZSB0
aGUgbGFjayBvZiBhIHRlc3QgaWYgdGhlc2UgYmxvY2tzIGFyZSBiYWQuIFNvCj4gY2hhbmdlcyB0
byB0aGUgQkJUIGFmdGVyIHRoZXNlIHR3byBibG9ja3MgdHVybiBiYWQgYXJlIG9ubHkga2VwdCBh
bmQgdXNlZAo+IHVudGlsIHRoZSBuZXh0IHJlYm9vdCB3aGVyZSBhZ2FpbiB0aGUgb2xkIHZlcnNp
b24gb2YgdGhlIHR3byB3b3JuIGJsb2NrcyBpcwo+IHVzZWQgYXMgYSBiYXNpcy4KPiAKPiBJIHRy
aWVkIHRvIHVzZSB0aGUgc2FtZSBtZWNoYW5pc20gdGhhdCBpcyB1c2VkIHRvIGlkZW50aWZ5IGJh
ZCBibG9ja3MgZHVyaW5nIGEKPiBzY2FuIGZvciBiYWQgYmxvY2tzLiBCdXQgbWF5YmUgSSBtaXNz
ZWQgc29tZXRoaW5nIHRoZXJlPyBPciB3ZXJlIG15Cj4gYXNzdW1wdGlvbnMgd3JvbmcgaW4gdGhl
IGZpcnN0IHBsYWNlPwoKSG9uZXN0bHkgSSBkb24ndCBrbm93IHdoYXQgaXMgd3JvbmcgZXhhY3Rs
eSBpbiB0aGlzIHBhdGNoLgoKV2Ugd2lsbCByZXZlcnQgdGhlIGNvbW1pdCBhcyBpdCBjbGVhcmx5
IGJyZWFrcyBzb21ldGhpbmcgZnVuZGFtZW50YWwKYW5kIHRoZSBtZXJnZSB3aW5kb3cgaXMgdG9v
IGNsb3NlIHRvIGFkb3B0IGEgaGFja2lzaCBhdHRpdHVkZS4KCkkgd291bGQgcHJvcG9zZSB0aGUg
Zm9sbG93aW5nIHRlc3RzIHdpdGggeW91ciBib2FyZDoKLSBIYWNrIHRoZSBjb3JlIHRvIGFsbG93
IHlvdXJzZWxmIHRvIGFjY2VzcyBiYWQgYmxvY2tzIGZyb20gdXNlcnNwYWNlCiAgZm9yIHRlc3Rp
bmcgcHVycG9zZXMuCi0gV2l0aCB0aGUgYmVsb3cgY29tbWl0LCB5b3Ugc2hvdWxkIGhhdmUgdGhl
IHNhbWUgYmVoYXZpb3IgdGhhbgogIHJlcG9ydGVkIGJ5IEZhYmlvLgotIFJldmVydCB0aGUgY29t
bWl0LgotIE1hbnVhbGx5IGNoYW5nZSB0aGUgYmFkIGJsb2NrIG1hcmtlcnMgKG5hbmRkdW1wLCBm
bGFzaF9lcmFzZSwKICBuYW5kd3JpdGUpIHRvIGRlY2xhcmUgdGhlIHR3byB0YWJsZXMgYmFkLiBS
ZWJvb3QgYW5kIG9ic2VydmUgaWYgdGhlcmUKICBhcmUgYW55IGlzc3Vlcy4gWW91IGNhbiB0cnkg
dG8gd29yayBmcm9tIHRoZXJlLgoKPiA+IC0tLTg8LS0tCj4gPiAKPiA+IGNvbW1pdCBiZDljOWZl
MmFkMDQ1NDY5NDBmNGE5OTc5ZDY3OWU2MmNhZTZhYTUxCj4gPiBBdXRob3I6IFN0ZWZhbiBSaWVk
bXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMuZGU+Cj4gPiBEYXRlOiAgIFRodSBNYXIgMjUg
MTE6MjM6MzcgMjAyMSArMDEwMAo+ID4gCj4gPiAgICAgbXRkOiByYXduYW5kOiBiYnQ6IFNraXAg
YmFkIGJsb2NrcyB3aGVuIHNlYXJjaGluZyBmb3IgdGhlIEJCVCBpbiBOQU5ECj4gPiAgICAgCj4g
PiAgICAgVGhlIGJsb2NrcyBjb250YWluaW5nIHRoZSBiYWQgYmxvY2sgdGFibGUgY2FuIGJlY29t
ZSBiYWQgYXMgd2VsbC4gU28KPiA+ICAgICBtYWtlIHN1cmUgdG8gc2tpcCBhbnkgYmxvY2tzIHRo
YXQgYXJlIG1hcmtlZCBiYWQgd2hlbiBzZWFyY2hpbmcgZm9yIHRoZQo+ID4gICAgIGJhZCBibG9j
ayB0YWJsZS4KPiA+ICAgICAKPiA+ICAgICBPdGhlcndpc2UgaW4gdmVyeSByYXJlIGNhc2VzIHdo
ZXJlIHR3byBCQlQgYmxvY2tzIHdlYXIgb3V0IGl0IG1pZ2h0Cj4gPiAgICAgaGFwcGVuIHRoYXQg
YW4gb2Jzb2xldGUgQkJUIGlzIHVzZWQgaW5zdGVhZCBvZiBhIG5ld2VyIGF2YWlsYWJsZQo+ID4g
ICAgIHZlcnNpb24uCj4gPiAgICAgCj4gPiAgICAgU2lnbmVkLW9mZi1ieTogU3RlZmFuIFJpZWRt
dWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4KPiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gICAgIExpbms6IAo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjEwMzI1MTAyMzM3LjQ4MTE3
Mi0xLXMucmllZG11ZWxsZXJAcGh5dGVjLmRlCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX2JidC5jCj4gPiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
YmJ0LmMKPiA+IGluZGV4IGRjZWQzMmExMjZkOS4uNmUyNWE1Y2U1YmE5IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZF9iYnQuYwo+ID4gQEAgLTUyNSw2ICs1MjUsNyBAQCBzdGF0aWMgaW50IHNl
YXJjaF9iYnQoc3RydWN0IG5hbmRfY2hpcCAqdGhpcywgdWludDhfdAo+ID4gKmJ1ZiwKPiA+ICB7
Cj4gPiAgICAgICAgIHU2NCB0YXJnZXRzaXplID0gbmFuZGRldl90YXJnZXRfc2l6ZSgmdGhpcy0+
YmFzZSk7Cj4gPiAgICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQodGhp
cyk7Cj4gPiArICAgICAgIHN0cnVjdCBuYW5kX2JidF9kZXNjciAqYmQgPSB0aGlzLT5iYWRibG9j
a19wYXR0ZXJuOwo+ID4gICAgICAgICBpbnQgaSwgY2hpcHM7Cj4gPiAgICAgICAgIGludCBzdGFy
dGJsb2NrLCBibG9jaywgZGlyOwo+ID4gICAgICAgICBpbnQgc2NhbmxlbiA9IG10ZC0+d3JpdGVz
aXplICsgbXRkLT5vb2JzaXplOwo+ID4gQEAgLTU2MCw2ICs1NjEsMTAgQEAgc3RhdGljIGludCBz
ZWFyY2hfYmJ0KHN0cnVjdCBuYW5kX2NoaXAgKnRoaXMsIHVpbnQ4X3QKPiA+ICpidWYsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgYWN0YmxvY2sgPSBzdGFydGJsb2NrICsgZGlyICog
YmxvY2s7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBsb2ZmX3Qgb2ZmcyA9IChsb2ZmX3Qp
YWN0YmxvY2sgPDwgdGhpcy0gIAo+ID4gPmJidF9lcmFzZV9zaGlmdDsgIAo+ID4gIAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgLyogQ2hlY2sgaWYgYmxvY2sgaXMgbWFya2VkIGJhZCAqLwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNjYW5fYmxvY2tfZmFzdCh0aGlzLCBiZCwg
b2ZmcywgYnVmKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4gPiArCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBSZWFkIGZpcnN0IHBhZ2UgKi8K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNjYW5fcmVhZCh0aGlzLCBidWYsIG9mZnMsIG10
ZC0+d3JpdGVzaXplLCB0ZCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNoZWNr
X3BhdHRlcm4oYnVmLCBzY2FubGVuLCBtdGQtPndyaXRlc2l6ZSwKPiA+IHRkKSkgewo+ID4gCj4g
PiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
