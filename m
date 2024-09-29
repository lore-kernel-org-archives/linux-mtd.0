Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C99CF6497
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 04:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2NnCm9q9yTkQS3jV+XUAPGaPIqRrkP/EUgUosvEpnI=; b=LRs2n5H1F0nlN6+d1J2HkhsnaA
	RCP009iBiVUxz0lzViklxnL9EFxFBIokNaRih6c6iq4fog9YFCj/W8ydnih0BS5oZh/DujfVDlfUU
	h4prarZIUAwSwVUfaOiDMJQFZ1xl7tsu1SmIY5TIDj+XPzp3dE3D/35HSR4luP3Yjc0qaqsKF1mNx
	P0hV3DjTNxmthVKopN6IxsngaO2NLWWtvUsyZaZKfm/oz/QMrForudN2q+4ehLREOTrb6Uih/VWss
	nDuTtc98srDrlnVLufi2DQNH/zbu7JjQrOcvrlhEvXKsNOpbIc9SzAeT6gHhSswye5vW+DysvTbPI
	B8L0oPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sul9b-0000000E5Gb-0YII;
	Sun, 29 Sep 2024 04:03:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sul9W-0000000E5FA-3EsL
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 04:03:25 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XGVsg5N3dz20pTQ;
	Sun, 29 Sep 2024 12:02:47 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D265140157;
	Sun, 29 Sep 2024 12:03:13 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 12:03:12 +0800
Subject: Re: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
To: Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, John Crispin <john@phrozen.org>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
 <Zvf_84xxhxwpPgee@makrotopia.org>
 <18e9d774-813b-427e-9938-53853d695e18@kernel.org>
 <ZvgU0eBEwTJ3sHuN@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ad5a3811-c856-4f4b-f569-bb67a0e3f751@huawei.com>
Date: Sun, 29 Sep 2024 12:03:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ZvgU0eBEwTJ3sHuN@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_210323_348765_0C096D9B 
X-CRM114-Status: GOOD (  23.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC85LzI4IDIyOjM4LCBEYW5pZWwgR29sbGUg0LS1wDoKPiBPbiBTYXQsIFNlcCAyOCwg
MjAyNCBhdCAwMzo0NTo0OVBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBP
biAyOC8wOS8yMDI0IDE1OjA5LCBEYW5pZWwgR29sbGUgd3JvdGU6Cj4+PiBPbiBTYXQsIFNlcCAy
OCwgMjAyNCBhdCAwMzowMjo0N1BNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+
Pj4+IE9uIDI4LzA5LzIwMjQgMTQ6NDcsIERhbmllbCBHb2xsZSB3cm90ZToKPj4+Pj4gQWRkIHRo
ZSAndm9sdW1lLWlzLWNyaXRpY2FsJyBib29sZWFuIHByb3BlcnR5IHdoaWNoIG1hcmtzIGEgVUJJ
IHZvbHVtZQo+Pj4+PiBhcyBjcml0aWNhbCBmb3IgdGhlIGRldmljZSB0byBib290LiBJZiBzZXQg
aXQgcHJldmVudHMgdGhlIHVzZXIgZnJvbQo+Pj4+PiBhbGwga2luZHMgb2Ygd3JpdGUgYWNjZXNz
IHRvIHRoZSB2b2x1bWUgYXMgd2VsbCBhcyBmcm9tIHJlbmFtaW5nIGl0IG9yCj4+Pj4+IGRldGFj
aGluZyB0aGUgVUJJIGRldmljZSBpdCBpcyBsb2NhdGVkIG9uLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPj4+Pj4gLS0tCj4+
Pj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLXZvbHVtZS55
YW1sICAgfCA5ICsrKysrKysrKwo+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy91Ymktdm9sdW1lLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLXZvbHVtZS55YW1sCj4+Pj4+IGluZGV4
IDE5NzM2YjI2MDU2Yi4uMmJkNzUxYmI3ZjllIDEwMDY0NAo+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLXZvbHVtZS55YW1sCj4+
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy91Ymktdm9sdW1lLnlhbWwKPj4+Pj4gQEAgLTI5LDYgKzI5LDE1IEBAIHByb3BlcnRpZXM6Cj4+
Pj4+ICAgICAgIGRlc2NyaXB0aW9uOgo+Pj4+PiAgICAgICAgIFRoaXMgY29udGFpbmVyIG1heSBy
ZWZlcmVuY2UgYW4gTlZNRU0gbGF5b3V0IHBhcnNlci4KPj4+Pj4gICAKPj4+Pj4gKyAgdm9sdW1l
LWlzLWNyaXRpY2FsOgo+Pj4+PiArICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRlciwgaWYg
cHJlc2VudCwgaW5kaWNhdGVzIHRoYXQgdGhlIFVCSSB2b2x1bWUKPj4+Pj4gKyAgICAgIGNvbnRh
aW5zIGVhcmx5LWJvb3QgZmlybXdhcmUgaW1hZ2VzIG9yIGRhdGEgd2hpY2ggc2hvdWxkIG5vdCBi
ZSBjbG9iYmVyZWQuCj4+Pj4+ICsgICAgICBJZiBzZXQsIGl0IHByZXZlbnRzIHRoZSB1c2VyIGZy
b20gcmVuYW1pbmcgdGhlIHZvbHVtZSwgd3JpdGluZyB0byBpdCBvcgo+Pj4+PiArICAgICAgbWFr
aW5nIGFueSBjaGFuZ2VzIGFmZmVjdGluZyBpdCwgYXMgd2VsbCBhcyBkZXRhY2hpbmcgdGhlIFVC
SSBkZXZpY2UgaXQgaXMKPj4+Pj4gKyAgICAgIGxvY2F0ZWQgb24sIHNvIGRpcmVjdCBhY2Nlc3Mg
dG8gdGhlIHVuZGVybHlpbmcgTVREIGRldmljZSBpcyBwcmV2ZW50ZWQgYXMKPj4+Pj4gKyAgICAg
IHdlbGwuCj4+Pj4+ICsgICAgdHlwZTogYm9vbGVhbgo+Pj4+Cj4+Pj4gVUJJIHZvbHVtZXMgYXJl
IG1hcHBpbmcgdG8gcGFydGl0aW9ucyAxLXRvLTEsIHJpZ2h0PyBTbyByYXRoZXIgSSB3b3VsZAo+
Pj4+IHByb3Bvc2UgdG8gdXNlIHBhcnRpdGlvbi55YW1sIC0gd2UgYWxyZWFkeSBoYXZlIHJlYWQt
b25seSB0aGVyZSB3aXRoCj4+Pj4gdmVyeSBzaW1pbGFyIGRlc2NyaXB0aW9uLgo+Pj4KPj4+IE5v
LCB0aGF0J3Mgbm90IHRoZSBjYXNlLgo+Pj4KPj4+IEFuIE1URCBwYXJ0aXRpb24gY2FuIGJlIHVz
ZWQgYXMgVUJJIGRldmljZS4gQSBVQkkgZGV2aWNlIChhbmQgaGVuY2UgTVRECj4+PiBwYXJ0aXRp
b24pIGNhbiBob3N0ICpzZXZlcmFsKiBVQkkgdm9sdW1lcy4KPj4+Cj4+PiBNYXJraW5nIHRoZSBN
VEQgcGFydGl0aW9uIGFzICdyZWFkLW9ubHknIHdvbid0IHdvcmssIGFzIFVCSSBuZWVkcwo+Pj4g
cmVhZC13cml0ZSBhY2Nlc3MgdG8gcGVyZm9ybSBiYWQgYmxvY2sgcmVsb2NhdGlvbiwgc2NydWJi
aW5nLCAuLi4KPj4KPj4gT0ssIHNvIG5vdCBwYXJ0aXRpb24gYnV0IHJlYWQtb25seSB2b2x1bWUu
Cj4gCj4gKzEKPiAKPj4KPj4+Cj4+PiBBbHNvLCB0eXBpY2FsbHkgbm90IGFsbCBVQkkgdm9sdW1l
cyBvbiBhIFVCSSBkZXZpY2UgYXJlCj4+PiByZWFkLW9ubHkvY3JpdGljYWwgYnV0IG9ubHkgYSBz
dWJzZXQgb2YgdGhlbS4KPj4+Cj4+PiBCdXQgeW91IGFyZSByaWdodCB0aGF0IHRoZSBkZXNjcmlw
dGlvbiBpcyBpbnNwaXJlZCBieSB0aGUgZGVzY3JpcHRpb24KPj4+IG9mIHRoZSAncmVhZC1vbmx5
JyBwcm9wZXJ0eSBpbiBwYXJ0aXRpb24ueWFtbCA7KQo+Pj4KPj4+IEkgaW5pdGlhbGx5IHRob3Vn
aHQgdG8gYWxzbyBuYW1lIHRoZSBwcm9wZXJ0eSAncmVhZC1vbmx5JywganVzdCBsaWtlCj4+PiBm
b3IgTVREIHBhcnRpdGlvbnMuIEhvd2V2ZXIsIGFzIHRoZSBkZXNpcmVkIGVmZmVjdCBnb2VzIGJl
eW9uZAo+Pj4gcHJldmVudGluZyB3cml0ZSBhY2Nlc3MgdG8gdGhlIHZvbHVtZSBpdHNlbGYsIEkg
dGhvdWdodCBpdCdkIGJlCj4+PiBiZXR0ZXIgdG8gdXNlIGEgbmV3IG5hbWUuCj4+Cj4+IFllYWgs
IG1heWJlLi4uIGNyaXRpY2FsIGluZGVlZCBjb3ZlcnMgbXVsdGlwbGUgY2FzZXMgYnV0IGlzIGFs
c28KPj4gc3ViamVjdGl2ZS4gRm9yIHNvbWUgYm9vdGxvYWRlciBpcyBjcml0aWNhbCwgZm9yIG90
aGVyIGJvb3Rsb2FkZXIgc3RpbGwKPj4gbWlnaHQgYmUgZnVsbHkgQS9CIHVwZGF0ZWFibGUgdGh1
cyBjb3VsZCBiZSBtb2RpZmlhYmxlLiBGb3Igb3RoZXJzLCB0aGV5Cj4+IHdhbnQgdG8gdXNlIGZ3
X3NldGVudiBmcm9tIHVzZXItc3BhY2Ugc28gbm90IGNyaXRpY2FsIGF0IGFsbC4KPiAKPiBUaGUg
Y2FzZSBJIHdhbnQgdG8gY292ZXIgaGVyZSBpcyB0aGUgYm9vdGxvYWRlciBpdHNlbGYgYmVpbmcg
c3RvcmVkCj4gaW5zaWRlIGEgVUJJIHZvbHVtZS4gTWVkaWFUZWsncyBmb3JrIG9mIEFSTSBUcnVz
dGVkRmlybXdhcmUtQSBibDIgY29tZXMKPiB3aXRoIHN1cHBvcnQgZm9yIFVCSSBhbmQgbG9hZHMg
QkwzICh3aGljaCBpcyBURi1BIEJMMzEgYW5kIFUtQm9vdCwgYW5kCj4gbWF5YmUgT1AtVEVFIGFz
IHdlbGwpIGZyb20gYSBzdGF0aWMgVUJJIHZvbHVtZS4gUmVtb3ZpbmcsIHJlbmFtaW5nIG9yCj4g
YWx0ZXJpbmcgdGhhdCB2b2x1bWUgcmVzdWx0cyBpbiB0aGUgZGV2aWNlIG5vdCBiZWluZyBhYmxl
IHRvIGJvb3QgYW55Cj4gbW9yZSBhbmQgcmVxdWlyaW5nIGEgY29tcGxpY2F0ZWQgaW50ZXJ2ZW50
aW9uIChhdCBhdHRhY2hpbmcgZGVidWdnaW5nCj4gVUFSVCBhbmQgdXNpbmcgbG93LWxldmVsIHJl
Y292ZXJ5IHRvb2wpIGluIG9yZGVyIHRvIHJlY292ZXIuCgpXaG8gcmVtb3Zlcy9yZW5hbWVzIHRo
ZSAnY3JpdGljYWwnIHZvbHVtZT8gSSBzdWdnZXN0IHRvIGZpeCBpdCBpbiB0aGUgCnVwcGVyIGxh
eWVyKG5vdCBpbiBrZXJuZWwpLiBBZnRlciBsb29raW5nIHRocm91Z2ggdGhlIHBhdGNoIDIsIGl0
IHNlZW1zIAphIGhhY2sgc29sdXRpb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
