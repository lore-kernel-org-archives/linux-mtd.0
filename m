Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9737CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED9B60F58
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ED9B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoIHMpOoL/0xO3JHWAeIDwm8fCoEuRIfoPPMaaIkKxs=; b=QTwxDJtbDdhUFh
	qPhpCQDFk4kx+yyhK0A+LI6KYUMLUi1yTTLB0qwpAppNBMA7HA72T5u80if8N63C8MotonBvIkBxT
	9wWlcGYS1cMa8ndmafaWANVyh5is4+e0GryvcgKSh/JU708qZ497QjQTtQdtkNK+WYkNkJAEnxPdV
	W5lJC21Rt/dR4BqScC0qkoCoVLY90+kp2JccAB1VZWcgyqfXUFq1aPYsCB3YfG3HjbmxXoriW4Xq6
	yC6p2Ru1jngWVFsESnCzPmOKQF4nqdwZVSRzwokBjc1bP54PWnvmTT131OkeaJGVN8cXFnrqGo3X0
	R4LhtiNGfbtgqqJtjjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkPsX-001uCf-Nt; Tue, 09 Nov 2021 12:05:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkPsR-001u8w-3T; Tue, 09 Nov 2021 12:05:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AB427C0008;
 Tue,  9 Nov 2021 12:05:19 +0000 (UTC)
Date: Tue, 9 Nov 2021 13:05:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v3 5/5] mtd: spinand: skip set/get oob data bytes when
 interleaved case
Message-ID: <20211109130518.70db0d5d@xps13>
In-Reply-To: <20211022024021.14665-6-xiangsheng.hou@mediatek.com>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-6-xiangsheng.hou@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_040523_308647_FBD199A1 
X-CRM114-Status: GOOD (  22.68  )
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

SGkgWGlhbmdzaGVuZywKCkhhcyB3ZSBkaXNjdXNzZWQgYSB3aGlsZSBhZ286CgoJLi4uaXQgaXMg
cG9zc2libGUgdGhhdCBJIGRpZCBub3QgdGVzdCB3aXRoIE1URF9PUFNfQVVUT19PT0IKCXJlY2Vu
dGx5IGFuZCBpbmRlZWQgdGhlIEVDQyBieXRlcyB3aWxsIG1pc3NpbmcgaW4gdGhpcyBjYXNlLiBJ
bgoJdGhlIHdyaXRlIHBhdGgsIG1heWJlIHRoZSAtPnByZXBhcmVfaW8gaG9va3Mgc2hvdWxkIHNw
cmVhZCB0aGUKCXVzZXIgZGF0YSBmb2xsb3dpbmcgcmVxLT5tb2RlIGluIHJlcS5vb2JidWYgYmVm
b3JlIGNvbXB1dGluZwoJdGhlIGNvZGVzLiBTaW1pbGFyIGxvZ2ljIHNob3VsZCBiZSBhcHBsaWVk
IHRvIHRoZSByZWFkIHBhdGguCgpDYW4geW91IHBsZWFzZSBhZGQgYSBwYXRjaCBmb3IgdGhpcyBz
aXR1YXRpb24gaW4geW91ciBuZXh0IGl0ZXJhdGlvbj8KSXQgZG9lcyBub3QgbG9vayBsaWtlIHRo
aXMgc2l0dWF0aW9uIGhhcyBiZWVuIGhhbmRsZWQuCgp4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5j
b20gd3JvdGUgb24gRnJpLCAyMiBPY3QgMjAyMSAxMDo0MDoyMSArMDgwMDoKCj4gRm9yIHN5bmRy
b21lIGxheW91dCwgRUNDL2ZyZWUgYnl0ZSBpbiBvb2IgbGF5b3V0IGFuZCBtYWluCj4gZGF0YSBh
cmUgaW50ZXJsZWF2ZWQuIEZvciB0aGlzIGNhc2UsIGl0IGlzIGJldHRlciB0byBzZXQvZ2V0Cj4g
b29iIGRhdGEgYnl0ZXMgaW4gRUNDIGVuZ2luZS4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgbGFz
dCBzZW50ZW5jZQoKPiAKPiBGb3IgTVRLIEVDQyBlbmdpbmUsIGFsdGhvdWdoIGl0IGNhbiBhdXRv
IHBsYWNlIGRhdGEgYXMgc2VjdG9yICsKPiBvb2IgZnJlZSArIG9vYiBlY2MgZm9yIG9uZSBwYWdl
IGluIHBpcGVsaW5lZC4gSG93ZXZlciwgdGhlIGJhZAo+IG1hcmsgd2lsbCBiZSBub3QgZml0IHdp
dGggbmFuZCBzcGVjLiBUaGVyZWZvcmUsIHRoZXJlIGhhdmUgYmFkCj4gbWFyayBzd2FwIG9wZXJh
dGlvbiBpbiBlY2MgZW5naW5lLgo+IAo+IEJ1dCwgdGhlIHN3YXAgb3BlYXRpb24oYmV0d2VlbiBi
Ym0gMHhmZiB3aXRoIDFieXRlIG1haW4gZGF0YSkgd2lsbAo+IGxlYWQgdG8gbW9yZSBvbmUgYnl0
ZSB0aGFuIG9vYmF2YWlsYWJsZS4KClNvcnJ5IGJ1dCBhZ2FpbiwgSSBkb24ndCB1bmRlcnN0YW5k
IHdoYXQgeW91IG1lYW4uCgo+IFNldCBvb2IgZGF0YWJ5dGVzIGFmdGVyCj4gYmFkIG1hcmsgc3dh
cCB3aWxsIGxlYWQgdG8gbG9zdCBvbmUgb29iIGZyZWUgYnl0ZS4KCldlIGRvbid0IGNhcmUgYWJv
dXQgZnJlZSBPT0IgYnl0ZXMgcmVhbGx5LgoKPiAKPiBUaGVyZWZvcmUsIGp1c3QgdHJ5IHRvIG1v
ZGlmeSB0aGUgc3BpIG5hbmQgZnJhbWV3b3JrIGZvciByZXZpZXcuCj4gQW5kIHRoaXMgbWF5IGJl
IGNvbW1vbiBmb3IgdGhlIGludGVybGVhdmVkIGNhc2UuCgpJIGRvbid0IGdldCBob3cgZmFsbGlu
ZyBiYWNrIHRvIGEgbWVtY3B5IHdpbGwgc29sdmUgeW91ciBwcm9ibGVtPyBDYW4KeW91IHBsZWFz
ZSBwcm92aWRlIGFuIGFuc2NpaSBmaWd1cmUgb3Igc29tZXRoaW5nIG1vcmUgdmlzdWFsIHRvIGxl
dCB1cwp1bmRlcnN0YW5kPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZ3NoZW5nIEhvdSA8eGlh
bmdzaGVuZy5ob3VAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9j
b3JlLmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCAyYzg2ODVmMWYyZmEuLjMyYTQ3
MDc5ODJjNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtNDAxLDcgKzQwMSw4IEBAIHN0YXRp
YyBpbnQgc3BpbmFuZF9yZWFkX2Zyb21fY2FjaGVfb3Aoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpz
cGluYW5kLAo+ICAJCSAgICAgICByZXEtPmRhdGFsZW4pOwo+ICAKPiAgCWlmIChyZXEtPm9vYmxl
bikgewo+IC0JCWlmIChyZXEtPm1vZGUgPT0gTVREX09QU19BVVRPX09PQikKPiArCQlpZiAocmVx
LT5tb2RlID09IE1URF9PUFNfQVVUT19PT0IgJiYKPiArCQkJbmFuZC0+ZWNjLnVzZXJfY29uZi5w
bGFjZW1lbnQgIT0gTkFORF9FQ0NfUExBQ0VNRU5UX0lOVEVSTEVBVkVEKQo+ICAJCQltdGRfb29i
bGF5b3V0X2dldF9kYXRhYnl0ZXMobXRkLCByZXEtPm9vYmJ1Zi5pbiwKPiAgCQkJCQkJICAgIHNw
aW5hbmQtPm9vYmJ1ZiwKPiAgCQkJCQkJICAgIHJlcS0+b29ib2ZmcywKPiBAQCAtNDQyLDcgKzQ0
Myw4IEBAIHN0YXRpYyBpbnQgc3BpbmFuZF93cml0ZV90b19jYWNoZV9vcChzdHJ1Y3Qgc3BpbmFu
ZF9kZXZpY2UgKnNwaW5hbmQsCj4gIAkJICAgICAgIHJlcS0+ZGF0YWxlbik7Cj4gIAo+ICAJaWYg
KHJlcS0+b29ibGVuKSB7Cj4gLQkJaWYgKHJlcS0+bW9kZSA9PSBNVERfT1BTX0FVVE9fT09CKQo+
ICsJCWlmIChyZXEtPm1vZGUgPT0gTVREX09QU19BVVRPX09PQiAmJgo+ICsJCQluYW5kLT5lY2Mu
dXNlcl9jb25mLnBsYWNlbWVudCAhPSBOQU5EX0VDQ19QTEFDRU1FTlRfSU5URVJMRUFWRUQpCj4g
IAkJCW10ZF9vb2JsYXlvdXRfc2V0X2RhdGFieXRlcyhtdGQsIHJlcS0+b29iYnVmLm91dCwKPiAg
CQkJCQkJICAgIHNwaW5hbmQtPm9vYmJ1ZiwKPiAgCQkJCQkJICAgIHJlcS0+b29ib2ZmcywKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
