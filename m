Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5456AC27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4qG9ovNgAk542UlmdtlLTJvRAF+SfAWOynhsC7OociY=; b=R3FqY7ACw6dPlxSeSQH/2Cbn0X
	GitLnUA72OOjPDIg/juq1lWjGP5cB5BATGtiMwK5wUeOTOTonMI4OdbowOwM9ltdhiHjjJIKCjL6t
	MC7RypN1CqdYXnnXkAH8V/zsCokf+WyGfKMiwtePTFXl3jFaMaktAWsYfY5OFkwBLVXt0WGVC7D5b
	ZXTLnOS98nyfD3kI1E+mYhlD63mzVIhL4r9aK3Rbc77eu9KrZbt7Bgic04JtSj+V3je/Dcfmi4rE2
	4qLb777Ntr+K3aCkfHsx82uIe8YQS682y2BRqAgDviXvNyTw8GWMHUoGAIZpJLO3i88oB/RdLkP0E
	dYE7PYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHTT-0000000CGAM-03XA;
	Mon, 17 Jun 2024 18:53:03 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHTO-0000000CG8N-1xpc
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 18:53:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 729576195FC1;
	Mon, 17 Jun 2024 20:52:56 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id p5T_CLvWV-4B; Mon, 17 Jun 2024 20:52:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B32216195FC9;
	Mon, 17 Jun 2024 20:52:55 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IVEfxcUz4X1Q; Mon, 17 Jun 2024 20:52:55 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8F4166195FC1;
	Mon, 17 Jun 2024 20:52:55 +0200 (CEST)
Date: Mon, 17 Jun 2024 20:52:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>, 
	daniel@makrotopia.org
Message-ID: <136290141.252319.1718650375432.JavaMail.zimbra@nod.at>
In-Reply-To: <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com> <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com> <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com> <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com> <303502000.252057.1718647746641.JavaMail.zimbra@nod.at> <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com> <296007365.252185.1718649153090.JavaMail.zimbra@nod.at> <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: rDTq+bzWquJWh3BCcONeC8Jg3XzswQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_115258_832123_932E7F47 
X-CRM114-Status: GOOD (  18.95  )
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

W0NDJ2luZyBEYW5pZWxdCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAi
R2FnYW4gU2lkaHUiIDxicm9seUBtYWMuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9k
LmF0Pgo+IENDOiAiWmhhb0xvbmcgV2FuZyIgPHdhbmd6aGFvbG9uZzFAaHVhd2VpLmNvbT4sICJj
aGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJkcGVydnVzaGluIgo+IDxk
cGVydnVzaGluQGVtYmVkZGVkYWxsZXkuY29tPiwgImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgtbXRkIgo+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJW
aWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwKPiAieWFuZ2Vya3VuIiA8eWFu
Z2Vya3VuQGh1YXdlaS5jb20+LCAieWkgemhhbmciIDx5aS56aGFuZ0BodWF3ZWkuY29tPgo+IEdl
c2VuZGV0OiBNb250YWcsIDE3LiBKdW5pIDIwMjQgMjA6NDY6MTAKPiBCZXRyZWZmOiBSZTogW1BB
VENIIHYyXSB1Ymk6IGdsdWViaTogRml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBjYXVzZWQg
YnkgZnRsIG5vdGlmaWVyCgo+PiBPbiBKdW4gMTcsIDIwMjQsIGF0IDEyOjMyIFBNLCBSaWNoYXJk
IFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPj4gCj4+IC0tLS0tIFVyc3Byw7xu
Z2xpY2hlIE1haWwgLS0tLS0KPj4+IFZvbjogIkdhZ2FuIFNpZGh1IiA8YnJvbHlAbWFjLmNvbT4K
Pj4+PiBBRkFJQ1QsIHRoaXMgbG9nIGxpbmUgaXMgbm90IHBhcnQgb2YgdGhlIG1haW5saW5lIGtl
cm5lbC4KPj4+IAo+Pj4gdGhpcyBpcyBtYWlubGluZS4gaXTigJlzIGp1c3Qgbm90IDYueC4gaXTi
gJlzIDQuMTQuCj4+IAo+PiBJJ3ZlIGRvdWJsZSBjaGVja2VkIGFuZCBkaXNhZ3JlZS4KPj4gVGhp
cyBsaW5lIGNvbWVzIGZyb206Cj4+IGh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53cnQv
b3BlbndydC5naXQ7YT1ibG9iO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy00LjE0LzQ4
MC1tdGQtc2V0LXJvb3Rmcy10by1iZS1yb290LWRldi5wYXRjaDtoPTZjZGRhZjAxYjc1Y2I1OGNm
YjM3N2Y1NjhmMmMzNzVhZjg3ZTJmMWI7aGI9YzNiZDEzMjFkZTFlMGQ4MTRmNWNmYzRmNDk0ZjZi
MmZiMWY1MTMzYgo+IAo+IG5vIGkga25vdyB0aGF0LCB0aGF04oCZcyB0aGUgcGF0Y2ggaSBzaG93
ZWQgeW91LiBpIG1lYW50IHRoZSByZXN0IG9mIGl0IGlzCj4gbWFpbmxpbmUuIHRoZSBwYXRjaCBv
YnZpb3VzbHkgaXMgbm90Lgo+PiAKPj4gSW4gcmVjZW50IE9wZW5XUlQga2VybmVscyBJIHNlZToK
Pj4gaHR0cHM6Ly9naXQub3BlbndydC5vcmcvP3A9b3BlbndydC9vcGVud3J0LmdpdDthPWJsb2I7
Zj10YXJnZXQvbGludXgvZ2VuZXJpYy9wZW5kaW5nLTUuMTUvNDkzLXViaS1zZXQtUk9PVF9ERVYt
dG8tdWJpYmxvY2stcm9vdGZzLWlmLXVuc2V0LnBhdGNoO2g9MjY2YTYzMzFjMmFjYzBmN2MxN2Q5
YWM3MmY1NDY1OWQzMWI1NjI0OTtoYj1IRUFECj4+IAo+PiBMb29rcyBsaWtlIGluIHJlY2VudCB2
ZXJzaW9ucyB0aGUgcGF0Y2ggaW4gcXVlc3Rpb24gZG9lcyAqbm90KiBjYXVzZSBhCj4+IHJlZ3Jl
c3Npb24uCj4gCj4gdGhhdCBwYXRjaCBpcyBhbHNvIGFwcGxpZWQgaW4gbXkgdmVyc2lvbiBhcyB3
ZWxsLCBzbyBpIGRvbuKAmXQgc2VlIGhvdyB0aGlzIGF2b2lkcwo+IHRoZSByZWdyZXNzaW9uLgo+
IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJz
L210ZC9tdGRjb3JlLmMjTDc3NAo+IAo+IG1pbmUgc2F5cyAiWzYuMDUxNDI2XSBtdGQ6IGRldmlj
ZSAxMiAocm9vdGZzKSBzZXQgdG8gYmUgcm9vdCBmaWxlc3lzdGVtIgo+IAo+IHdoaWNoIGlzIHNp
bXBseSB0aGUgY2FsbCBmcm9tIGRyaXZlcnMvbXRkL210ZGNvcmUuYwo+IAo+IHNvIHRoZSByb290
ZnMgZGV2aWNlIGlzIHNldCBjb3JyZWN0bHkuIGl04oCZcyBqdXN0IG5vdCBib290aW5nIGZyb20g
aXQuCj4gCj4gdGhlIHJlZ3Jlc3Npb24gY29tZXMgZnJvbSBoYXZpbmcgR0xVRUJJK0JMT0NLIGVu
YWJsZWQsIGl0IHNlZW1zLCBhcmUgdGhleQo+IGZpZ2h0aW5nIGZvci9vcGVyYXRpbmcgb24gdGhl
IHNhbWUgcGFydGl0aW9uPwoKSSBkb24ndCBrbm93LiBMZXQncyBhc2sgRGFuaWVsLgoKPiAKPj4g
Cj4+Pj4gKDMxLCAxMikgd291bGQgYmUgbXRkYmxvY2sxMi4KPj4+PiBIb3cgZG9lcyB5b3VyIGtl
cm5lbCBrbm93IHRoYXQgbXRkYmxvY2sxMiBzaGFsbCBiZSB0aGUgcm9vdGZzPwo+Pj4gCj4+PiB0
aGlzIGlzIGFuIG9wZW53cnQgYXBwcm9hY2g6IGh0dHBzOi8vb3BlbndydC5vcmcvZG9jcy90ZWNo
cmVmL2ZpbGVzeXN0ZW1zICh1bmRlcgo+Pj4g4oCcdGVjaG5pY2FsIGRldGFpbHPigJ0sIHRoaXJk
IHBhcmFncmFwaCkKPj4+IAo+Pj4gZXNzZW50aWFsbHkgdGhlcmXigJlzIGEgZmVhdHVyZSB0aGV5
IGFkZCB0byB0aGUga2VybmVsICh2aWEgcGF0Y2gpIHdoZXJlIHlvdSBjYW4KPj4+IGVuYWJsZSBh
IGZlYXR1cmUgdGhhdCBzZXRzIHRoZSByb290IGRldmljZSBiYXNlZCBvbiB0aGUgbmFtZSBvZiB0
aGUgcGFydGl0aW9uLgo+PiAKPj4gU28sIHRoaXMgaXMgYWxsIG5vdCBtYWlubGluZS4gOi0vCj4g
Cj4gaSBkaWQgc2F5IG9wZW53cnQgYXQgdGhlIHN0YXJ0LCBhbmQgaSB0aGluayB0aGF04oCZcyBw
cmV0dHkgY2xvc2UgdG8gbWFpbmxpbmUgYXMKPiBpdCBnZXRzLgo+IAo+IHNvbWV0aW1lcyB0aGVz
ZSBwYXRjaGVzIGFyZW7igJl0IGFwcHJvcHJpYXRlIHRvIHB1c2ggdXBzdHJlYW0uIHRoaXMgb25l
IGlzIG5vdCB0aGUKPiBvbmUgY2F1c2luZyB0aGUgaXNzdWUuCj4gCj4gaXQgc2VlbXMgdG8gbWUg
dGhhdCB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBHTFVFQkkrQkxPQ0sgcGxheWluZyB0b2dldGhl
ci4KPiAKPiBhcyBmYXIgYXMgaSBjYW4gc2VlLCB0aGUgc2V0dGluZyBvZiB0aGUgZGV2aWNlIGlz
IGJlaW5nIGRvaW5nIGJ5IG10ZGNvcmUuYwo+IAo+IGl04oCZcyBqdXN0IG5vdCB3b3JraW5nIHdp
dGggZ2x1ZWJpIGFuZCBibG9jayBhcmUgZW5hYmxlZCwgYW5kIGkgbmVlZCB0byBrbm93Cj4gd2hl
dGhlciBkaXNhYmxpbmcgZ2x1ZWJpIHdpbGwgYWxsb3cgaXQgdG8gd29yay4KPiAKPiBpbiBvdGhl
ciB3b3JkcywgaXMgaXQgcG9zc2libGUgZm9yIGdsdWViaSB0byB1c2UgdGhlIHBhcnRpdGlvbiBj
cmVhdGVkIGJ5Cj4gdWJpX2Jsb2NrLCBhbmQgYWRkIHRoZSBNVERfVUJJVk9MVU1FIGZsYWc/CgpO
by4gVUJJQmxvY2sgd29ya3Mgb24gdG9wIG9mIFVCSSB2b2x1bWVzIGFuZCBjcmVhdGVzIGEgYmxv
Y2sgZGV2aWNlLgoKV2UnbGwgc29ydCB0aGlzIG91dC4gOikKClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
