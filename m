Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E24C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B78320671
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ftnOKUne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B78320671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmDv9G/KKE30eweGGGhNL8eUaCkg7fKlbRo/WI9ch6Y=; b=ftnOKUnesSFC6w
	+nVoYydyw3pQlC1H/F+TKqgrzMlp28Q78ox3QJj7aZwWKDBXzZWBBhUqE2owus9691wfTAZsOIs5b
	6bD7nPb3IyvBE3WpkTsLpY16RLFeTdOebnTkLM9obJ8081/1eLgV16sl7ifEttZpx0IALBlZQfCpn
	I/zGIukwmkVJPbLQUbnvTJ2q/FL+s77jcHdqnxOSU0DZ7WXTaOuHvTR51Btktiv+kQWyEnMzU2g8M
	SDIRZDEgnVjeuSAHFGbwaTBmAhWwq4ynGDy2T9ifdJF0m8kU0I8h3p3ImUaw8EZrG/DkgamHNtzjI
	rQqSzGaPbc+qn+Cn6LHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQOu-00043t-Lq; Wed, 20 May 2020 15:12:56 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQOr-00042p-G2
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 15:12:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0C1F0C000B;
 Wed, 20 May 2020 15:12:47 +0000 (UTC)
Date: Wed, 20 May 2020 17:12:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Add timings for Kioxia TH58NVG2S3HBAI4
Message-ID: <20200520171246.538823eb@xps13>
In-Reply-To: <20200520165022.1e241604@collabora.com>
References: <1589981533129.2663@axis.com> <20200520154343.2ce58cc6@xps13>
 <1589984216684.8771@axis.com> <20200520162936.6eb499fb@xps13>
 <1589985750394.77181@axis.com>
 <20200520165022.1e241604@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_081253_672815_81F47946 
X-CRM114-Status: GOOD (  19.36  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rickard X Andersson <Rickard.Andersson@axis.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBXZWQsIDIwIE1heQoyMDIwIDE2OjUwOjIyICswMjAwOgoKPiBPbiBXZWQsIDIw
IE1heSAyMDIwIDE0OjQyOjMxICswMDAwCj4gUmlja2FyZCBYIEFuZGVyc3NvbiA8Umlja2FyZC5B
bmRlcnNzb25AYXhpcy5jb20+IHdyb3RlOgo+IAo+ID4gPiA+IElmIEkgdW5kZXJzdGFuZCB5b3Ug
Y29ycmVjdGx5IHlvdSB3YW50IG1lIHRvIHVzZSBvbmZpX2ZpbmRfZXF1aXZhbGVudF9zZHJfbW9k
ZSBpbiBvcmRlciB0byBmaW5kIHRoZSBjb3JyZXNwb25kaW5nIG9uZmkgbW9kZS4gVGhlbiB5b3Ug
d2FudCBtZSB0byB1c2Ugb25maV9maWxsX2RhdGFfaW50ZXJmYWNlIGFuZCBsb29wIHRvd2FyZHMg
bW9kZSAwIGNoZWNraW5nIHdoaWNoIG1vZGUgdGhlIGNvbnRyb2xsZXIgYWNjZXB0cz8gSSBqdXN0
IHRob3VnaHQgaXQgd2FzIGEgIm1lc3N5IiB0byBkdXBsaWNhdGUgdGhpcyBjb2RlIGluIGFsbCB2
ZW5kb3IgZHJpdmVycy4KPiA+ID4gPiBPciBkbyB5b3UgbWVhbiB0aGF0IEkgc2hvdWxkIGp1c3Qg
dXNlIG9uZmlfZmluZF9lcXVpdmFsZW50X3Nkcl9tb2RlIHRvIHNldCAuInRpbWluZ3MubW9kZSIg
YW5kIGxldCBuYW5kX2Jhc2UgdG8gZG8gdGhlIGxvb3BpbmcgaW4gY2FzZSBlcnJvciBpcyByZXR1
cm5lZCBmcm9tIHRoNThudmcyczNoYmFpNF9jaG9vc2VfZGF0YV9pbnRlcmZhY2UgKGkuZSBzcGVj
aWFsaXplZCB0aW1pbmdzIG5vdCBhY2NlcHRlZCBieSB0aGUgY29udHJvbGxlcikuICAgIAo+ID4g
Pgo+ID4gPiBTb3JyeSBmb3IgdGhlIG1pc3VuZGVyc3RhbmRpbmcuIFdoYXQgSSB0aGluayB5b3Ug
c2hvdWxkIHRyeSBpczoKPiA+ID4gMS8gY2FsbCBvbmZpX2ZpbmRfZXF1aXZhbGVudF9zZHJfbW9k
ZSgpIHRvIHNldCB0aGUgdGltaW5ncy5tb2RlIGZpZWxkLgo+ID4gPiAyLyBjYWxsIG5hbmRfY29u
dHJvbGxlcl9zdXBwb3J0c19kYXRhX2ludGVyZmFjZSgpCj4gPiA+IDMvIGlmIHRoZSBjb250cm9s
bGVyIHN1cHBvcnRzIHRoZSB0aW1pbmdzLCBzZXQKPiA+ID4gY2hpcC0+ZGVmYXVsdF90aW1pbmdf
bW9kZSBhY2NvcmRpbmdseSBhbmQgcmV0dXJuIDAuICAKPiAKPiBXaHkgZG8gd2UgaGF2ZSB0byBz
ZXQgdGhlIGRlZmF1bHRfdGltaW5nX21vZGUgZmllbGQ/IENhbid0IHdlIGp1c3Qgc2V0Cj4gdGlt
aW5ncy5tb2RlIGRpcmVjdGx5Pwo+IAo+ID4gPiA0LyBpZiB0aGUgY29udHJvbGxlciBkb2VzIG5v
dCBzdXBwb3J0IHRoZSB0aW1pbmdzLCB5b3UgbWF5IHdhbnQgdG8KPiA+ID4gcHJvcG9zZSBvdGhl
ciBzdGFuZGFyZCB0aW1pbmdzIHRvIHRlc3QgYnkgc2V0dGluZwo+ID4gPiBjaGlwLT5kZWZhdWx0
X3RpbWluZ19tb2RlIGFueXdheSBidXQgcmV0dXJuaW5nIGFuIGVycm9yIHdoaWNoIG1lYW5zCj4g
PiA+ICJiZXN0IGludGVyZmFjZSBoYXMgbm90IGJlZW4gZm91bmQgeWV0IiBzbyB0aGUgcmVzdCBv
ZiB0aGUKPiA+ID4gY2hvb3NlX2RhdGFfaW50ZXJmYWNlKCkgaGVscGVyIHdpbGwgdHJ5IHRoZSBy
ZW1haW5pbmcgT05GSSBtb2Rlcwo+ID4gPiBhdXRvbWF0aWNhbGx5IChmYWxsYmFja3MgdG8gMCBh
bnl3YXkpLiAgCj4gCj4gQWdhaW4sIEkgZG9uJ3Qgc2VlIHdoeSBzZXR0aW5nIGNoaXAtPmRlZmF1
bHRfdGltaW5nX21vZGUgaXMgbmVlZGVkIGhlcmUsCj4gYW5kIEknbSBub3Qgc3VyZSB0cnlpbmcg
cmVtYWluaW5nIE9ORkkgbW9kZXMgaXMgdXNlZnVsLCBJIGd1ZXNzIHdlIGNhbgo+IGp1c3QgZmFs
bCBiYWNrIG9uIG1vZGUgMCBpbiB0aGF0IGNhc2UuCgpJdCBpcyBuZWVkZWQgYmVjYXVzZSBvZiB0
aGUgbG9naWMgaW4gbmFuZF9yZXNldCgpIHdoaWNoIGRvZXMgbm90IGFwcGx5CnRoZSBkYXRhIGlu
dGVyZmFjZSBhZnRlciBhIHJlc2V0IGlmIHRoaXMgZmllbGQgaXMgbnVsbC4KCk90aGVyd2lzZSBJ
IGFsc28gd29uZGVyZWQgaWYgZmFsbGluZyBiYWNrIHRvIHJlZ3VsYXIgT05GSSBtb2RlIHdhcwp1
c2VmdWwuIElmIHRoaXMgaXMgbm90LCB3ZSBjYW4ganVzdCByZXR1cm4gYWZ0ZXIgdGhlIGNhbGwg
dG8KY2hpcC0+b3BzLmNob29zZV9kYXRhX2ludGVyZmFjZSgpLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
