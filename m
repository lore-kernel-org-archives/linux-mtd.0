Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32509C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 21:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E1E213F2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 21:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NSgVwM5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E1E213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPNcOvhZYcov1oLq8vM4lAgZQ013d4j6NM1FY2jQ1vI=; b=NSgVwM5qqHR7sX
	AisRqg9MwNfoS5C9z5gMpCkt0RJgONmScp/tfuTM3pnUqwkfKdrrjWgLXS2R5Ky6fimT6qETfFNEO
	20NVH5CGAVzcWElATrrhoXWWMg1GUbaVHMP0L3lZ9Zv+EIW8XD7Ga8QKLQM/xA5pM9PF76dbXZH2U
	JUZs1zgu9SlNy3H72rTeK8CnSbCrVc6RMZFIFpNQYJe1oDTqhqCstJazCSBONsb4WF0vbh6OpCkSP
	dSQHgpQmbuT0ncaRu5thx0i7rZ2q9j7ZQH4cTuzoz/YcpKTaSSn96UHbmObzi11tm6XJRgir43x3W
	7JGwGGwb5SIIjBJ6xGLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5zyf-0001v9-44; Mon, 18 Mar 2019 21:39:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5zya-0001tq-Rs
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 21:39:22 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CD94AFF806;
 Mon, 18 Mar 2019 21:39:06 +0000 (UTC)
Date: Mon, 18 Mar 2019 22:39:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
Message-ID: <20190318223905.18f020f2@xps13>
In-Reply-To: <1552941429.1495.0@crapouillou.net>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-9-paul@crapouillou.net>
 <20190315094009.66b91ad5@xps13> <1552660654.1727.0@crapouillou.net>
 <1552941429.1495.0@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_143921_204670_854E4D73 
X-CRM114-Status: GOOD (  29.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBN
b24sIDE4IE1hciAyMDE5IDIxOjM3OjA5CiswMTAwOgoKPiBIaSwKPiAKPiBMZSB2ZW4uIDE1IG1h
cnMgMjAxOSDDoCAxNTozNywgUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+IGEg
w6ljcml0IDoKPiA+IEhpLAo+ID4gCj4gPiBMZSB2ZW4uIDE1IG1hcnMgMjAxOSDDoCA5OjQwLCBN
aXF1ZWwgUmF5bmFsID4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IGEgw6ljcml0IDogIAo+
ID4+IEhpIFBhdWwsICAKPiA+PiA+PiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4gd3JvdGUgb24gV2VkLCAxMyBNYXIgMjAxOSA+PiB/MjM6MjI6NTYgIAo+ID4+ICswMTAwOiAg
Cj4gPj4gPj4+ICBVc2UgdGhlICdlY2MtZW5naW5lJyBzdGFuZGFyZCBwcm9wZXJ0eSBpbnN0ZWFk
IG9mIHRoZSBjdXN0b20gIAo+ID4+PiAgJ2luZ2VuaWMsYmNoLWNvbnRyb2xsZXInIGN1c3RvbSBw
cm9wZXJ0eSwgd2hpY2ggaXMgbm93IGRlcHJlY2F0ZWQuICAKPiA+Pj4gPj4+ICBTaWduZWQtb2Zm
LWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4gIAo+ID4+PiAgLS0tICAK
PiA+Pj4gPj4+ICBOb3RlczogIAo+ID4+PiAgICAgIHY1OiBOZXcgcGF0Y2ggIAo+ID4+PiA+Pj4g
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfZWNjLmMgfCAxMyArKysrKysr
KysrLS0tICAKPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkgIAo+ID4+PiA+Pj4gIGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9p
bmdlbmljL2luZ2VuaWNfZWNjLmMgPj4+IH9/Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmlj
L2luZ2VuaWNfZWNjLmMgIAo+ID4+PiAgaW5kZXggZDdmM2E4YzNhYmVhLi4zMDQzNmNhNjYyOGEg
MTAwNjQ0Cj4gPj4+ICAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNf
ZWNjLmMKPiA+Pj4gICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19l
Y2MuYwo+ID4+PiAgQEAgLTgyLDkgKzgyLDkgQEAgc3RhdGljIHN0cnVjdCBpbmdlbmljX2VjYyA+
Pj4gKmluZ2VuaWNfZWNjX2dldChzdHJ1Y3Qgf39kZXZpY2Vfbm9kZSAqbnApICAKPiA+Pj4gPj4+
ICAgLyoqICAKPiA+Pj4gICAgKiBvZl9pbmdlbmljX2VjY19nZXQoKSAtIGdldCB0aGUgRUNDIGNv
bnRyb2xsZXIgZnJvbSBhIERUIG5vZGUKPiA+Pj4gIC0gKiBAb2Zfbm9kZTogdGhlIG5vZGUgdGhh
dCBjb250YWlucyBhIGJjaC1jb250cm9sbGVyIHByb3BlcnR5Lgo+ID4+PiAgKyAqIEBvZl9ub2Rl
OiB0aGUgbm9kZSB0aGF0IGNvbnRhaW5zIGEgZWNjLWVuZ2luZSBwcm9wZXJ0eS4gIAo+ID4+ID4+
IFdvdWxkICJjb250YWlucyBhbiBlY2MtZW5naW5lIHByb3BlcnR5IiBiZSBiZXR0ZXIgRW5nbGlz
aD8KPiA+PiA+PiBJIGFtIG5vdCBzdXJlIHdoYXQgaXMgdGhlIHJ1bGUgd2hlbiBpdCBjb21lcyB0
byBwbGFpbiBFbmdsaXNoIHdpdGggIAo+ID4+IHZhcmlhYmxlIG5hbWVzLiBIb3dldmVyIGlmIHlv
dSBhZ3JlZSwgbm8gbmVlZCB0byByZS1zZW5kIHRoZSBzZXJpZXMsID4+IEkKPiA+PiBjYW4gZml4
IGl0IHdoZW4gYXBwbHlpbmcuICAKPiA+IAo+ID4gWWVzLCB0aGF0J3MgYmV0dGVyLgo+ID4gICAK
PiA+PiBCVFcsIEkgYWRkZWQgaHcgRUNDIGVuZ2luZXMgc3VwcG9ydCB0byBteSBnZW5lcmljIEVD
QyBlbmdpbmUKPiA+PiBpbXBsZW1lbnRhdGlvbiwgYnV0IG1pZ3JhdGluZyB0aGUgd2hvbGUgcmF3
IE5BTkQgc3Vic3lzdGVtICh1c2luZyBJL08KPiA+PiByZXF1ZXN0cyBsaWtlIGluIHRoZSBTUEkt
TkFORCBjb3JlLCBhZGRpbmcgcHJlcGFyZS9maW5pc2hfaW9fcmVxID4+IH9ob29rcykKPiA+PiBp
cyBnb2luZyB0byBiZSBtdWNoIG1vcmUgaW52YXNpdmUgdGhhbiBpbml0aWFsbHkgZXhwZWN0ZWQs
IHNvIEkgYW0gPj4gbm90Cj4gPj4gc3VyZSBJIHdpbGwgZmluaXNoIHRoZSBtaWdyYXRpb24gYW55
IHRpbWUgc29vbi4gIAo+ID4gCj4gPiBPaywgSSB3aWxsIGZvbGxvdyB0aGUgZGV2ZWxvcG1lbnQg
dGhlbi4KPiA+ICAgCj4gPj4gVGhhbmtzLAo+ID4+IE1pcXXDqGwgIAo+ID4gCj4gPiBPbmUgdGhp
bmcgSSBub3RpY2Ugd2l0aCBteSBwYXRjaHNldDogaXQgd29ya3MgcGVyZmVjdGx5IG9uIHRvcCBv
ZiA+IDQuMjAsCj4gPiBidXQgb24gdG9wIG9mIDUuMCBJIGFtIHVuYWJsZSB0byBlcmFzZSBhbnkg
ZXJhc2VibG9jayB3aXRoID4gZmxhc2hfZXJhc2UuCj4gPiBJIGdldCAtRUlPIGV2ZXJ5IHRpbWUu
IEknbSB0cnlpbmcgdG8gZGVidWcgaXQgYnV0IGRpZG4ndCBnbyB2ZXJ5IGZhciwKPiA+IGl0IGxv
b2tzIGxpa2UgbmFuZF9zdGF0dXNfb3AoKSBnaXZlcyBtZSBhIHN0YXR1cyBvZiAweGZmLiBEbyB5
b3Uga25vdwo+ID4gd2hhdCBjb3VsZCBoYXZlIGNoYW5nZWQgYmV0d2VlbiA0LjIwIGFuZCA1LjAg
dGhhdCBjb3VsZCB0cmlnZ2VyIHRoaXMgPiBidWc/ICAKPiAKPiBOZXZlcm1pbmQuIEl0IHdvcmtz
IG5vdy4KCkdyZWF0IQoKPiAKPiA+IFNlY29uZCB0aGluZywgZXZlcnl0aW1lIEkgcmVib290IGl0
IGZhaWxzIHRvIGZpbmQgdGhlIEJCVC4gVGhhdCdzID4gYmVjYXVzZQo+ID4gdGhlIEJCVCBtYXJr
ZXIgaXMgb3ZlcndyaXR0ZW4gYnkgdGhlIEVDQyBkYXRhIGFzIHRoZXkgb2NjdXB5IHRoZSBzYW1l
ID4gYXJlYQo+ID4gaW4gdGhlIE9PQiBzcGFjZS4gSXMgdGhlcmUgYSB3YXkgdG8gbW92ZSB0aGUg
QkJUIG1hcmtlcj8gT3Igc2hvdWxkIEkgPiB1c2UKPiA+IE5BTkRfQkJUX05PX09PQiB0aGVuPyBT
aW5jZSB0aGUgZXJhc2VibG9ja3Mgd2hlcmUgdGhlIEJCVHMgYXJlIGxvY2F0ZWQKPiA+IGlzIHVz
ZWQgaW4gbXkgc3lzdGVtIHBhcnRpdGlvbiwgd29uJ3QgdGhhdCBjb25mbGljdCB3aXRoIHRoZSBk
YXRhPyAgCj4gCj4gUmVzcG9uc2UgdG8gbXlzZWxmOiBJdCdzIHBvc3NpYmxlIHRvIG1vdmUgdGhl
IEJCVCBtYXJrZXIuIEJ1dCBpbiBteSBjYXNlIEkKPiBoYXZlIHRvIGRlYWwgd2l0aCB0aHJlZSBw
b3NzaWJsZSBsYXlvdXRzLCBzbyBpdCdzIHNpbXBsZXIgdG8ganVzdCB1c2UKPiBOQU5EX0JCVF9O
T19PT0IgdGhlbi4gVGhlIEJCVCBwYWdlcyBhcmUgbWFya2VkIHNvIHRoYXQgdGhleSdyZSBub3Qg
dXNlZAo+IGZvciBkYXRhIGluIHRoZSBwYXJ0aXRpb25zLgoKTWF5YmUgeW91IHNob3VsZCBjaGVj
ayBGcmllZGVyJ3Mgc2VyaWVzOgoKbXRkOiByYXduYW5kOiBTdXBwb3J0IGJhZCBibG9jayBtYXJr
ZXJzIGluIGZpcnN0LCBzZWNvbmQgb3IgbGFzdCBwYWdlCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
