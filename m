Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE3DCF6495
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eibfAezMiH1Ifk+fQsMZ1KrYd8YmDjIKQmDlJ/L9nQQ=; b=dLTrAcX0/0EKyguRUeKbJbb/3B
	MKDTQBIzQ1yGLnc/8iQFOs7ZglPCBjoMBnsyRtw9JXRhntGk/nOrCT2ojDnbm2dNq4mi9NI6ND9q3
	QP/84yHETdn1i2PIXQGknmGtPt9pANOuTRGV6eWXvIGxOBHnWTtgUCccbT6Zn531TlgiT46TMk8Vj
	XvmI1qTAzls9OuFP1NqRK/wJ/5hwX36PAaS+9bemuhlxPSUbrA46hX1l7euo433VakmuNtWrFIuib
	K2wE3bcNRx88tjDym1z4P4owjA07goeQuCwxkl1Qkxjp/LV99k8GcjfsHBgsqvqEOK17wpKrYR5Kd
	ME/ABXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sus1b-0000000EflE-0fL8;
	Sun, 29 Sep 2024 11:23:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sus1W-0000000EfiK-00WP
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 11:23:38 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XGhcc5xc7zySb1;
	Sun, 29 Sep 2024 19:22:08 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 47F7818010A;
	Sun, 29 Sep 2024 19:23:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 29 Sep 2024 19:23:13 +0800
Subject: Re: [PATCH RFC 1/2] dt-bindings: mtd: ubi-volume: add
 'volume-is-critical' property
To: Daniel Golle <daniel@makrotopia.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, John
 Crispin <john@phrozen.org>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <7a2e8819-ac70-4070-a731-53994c72cd79@kernel.org>
 <Zvf_84xxhxwpPgee@makrotopia.org>
 <18e9d774-813b-427e-9938-53853d695e18@kernel.org>
 <ZvgU0eBEwTJ3sHuN@makrotopia.org>
 <ad5a3811-c856-4f4b-f569-bb67a0e3f751@huawei.com>
 <Zvkxi-6J8R1K95PQ@makrotopia.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3fbc4221-5967-fb9a-3cee-91cd5de2b805@huawei.com>
Date: Sun, 29 Sep 2024 19:23:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <Zvkxi-6J8R1K95PQ@makrotopia.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_042335_611371_1ECA52D1 
X-CRM114-Status: GOOD (  28.44  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjQvOS8yOSAxODo1MiwgRGFuaWVsIEdvbGxlIOWGmemBkzoKPiBPbiBTdW4sIFNlcCAy
OSwgMjAyNCBhdCAxMjowMzoxMVBNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAy
MDI0LzkvMjggMjI6MzgsIERhbmllbCBHb2xsZSDlhpnpgZM6Cj4+PiBPbiBTYXQsIFNlcCAyOCwg
MjAyNCBhdCAwMzo0NTo0OVBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+
IE9uIDI4LzA5LzIwMjQgMTU6MDksIERhbmllbCBHb2xsZSB3cm90ZToKPj4+Pj4gT24gU2F0LCBT
ZXAgMjgsIDIwMjQgYXQgMDM6MDI6NDdQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4+IE9uIDI4LzA5LzIwMjQgMTQ6NDcsIERhbmllbCBHb2xsZSB3cm90ZToKPj4+Pj4+
PiBBZGQgdGhlICd2b2x1bWUtaXMtY3JpdGljYWwnIGJvb2xlYW4gcHJvcGVydHkgd2hpY2ggbWFy
a3MgYSBVQkkgdm9sdW1lCj4+Pj4+Pj4gYXMgY3JpdGljYWwgZm9yIHRoZSBkZXZpY2UgdG8gYm9v
dC4gSWYgc2V0IGl0IHByZXZlbnRzIHRoZSB1c2VyIGZyb20KPj4+Pj4+PiBhbGwga2luZHMgb2Yg
d3JpdGUgYWNjZXNzIHRvIHRoZSB2b2x1bWUgYXMgd2VsbCBhcyBmcm9tIHJlbmFtaW5nIGl0IG9y
Cj4+Pj4+Pj4gZGV0YWNoaW5nIHRoZSBVQkkgZGV2aWNlIGl0IGlzIGxvY2F0ZWQgb24uCj4+Pj4+
Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlh
Lm9yZz4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy91Ymktdm9sdW1lLnlhbWwgICB8IDkgKysrKysrKysrCj4+Pj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91Ymktdm9s
dW1lLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvdWJpLXZvbHVtZS55YW1sCj4+Pj4+Pj4gaW5kZXggMTk3MzZiMjYwNTZiLi4yYmQ3NTFiYjdm
OWUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL3ViaS12b2x1bWUueWFtbAo+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91Ymktdm9sdW1lLnlhbWwKPj4+
Pj4+PiBAQCAtMjksNiArMjksMTUgQEAgcHJvcGVydGllczoKPj4+Pj4+PiAgICAgICAgZGVzY3Jp
cHRpb246Cj4+Pj4+Pj4gICAgICAgICAgVGhpcyBjb250YWluZXIgbWF5IHJlZmVyZW5jZSBhbiBO
Vk1FTSBsYXlvdXQgcGFyc2VyLgo+Pj4+Pj4+ICsgIHZvbHVtZS1pcy1jcml0aWNhbDoKPj4+Pj4+
PiArICAgIGRlc2NyaXB0aW9uOiBUaGlzIHBhcmFtZXRlciwgaWYgcHJlc2VudCwgaW5kaWNhdGVz
IHRoYXQgdGhlIFVCSSB2b2x1bWUKPj4+Pj4+PiArICAgICAgY29udGFpbnMgZWFybHktYm9vdCBm
aXJtd2FyZSBpbWFnZXMgb3IgZGF0YSB3aGljaCBzaG91bGQgbm90IGJlIGNsb2JiZXJlZC4KPj4+
Pj4+PiArICAgICAgSWYgc2V0LCBpdCBwcmV2ZW50cyB0aGUgdXNlciBmcm9tIHJlbmFtaW5nIHRo
ZSB2b2x1bWUsIHdyaXRpbmcgdG8gaXQgb3IKPj4+Pj4+PiArICAgICAgbWFraW5nIGFueSBjaGFu
Z2VzIGFmZmVjdGluZyBpdCwgYXMgd2VsbCBhcyBkZXRhY2hpbmcgdGhlIFVCSSBkZXZpY2UgaXQg
aXMKPj4+Pj4+PiArICAgICAgbG9jYXRlZCBvbiwgc28gZGlyZWN0IGFjY2VzcyB0byB0aGUgdW5k
ZXJseWluZyBNVEQgZGV2aWNlIGlzIHByZXZlbnRlZCBhcwo+Pj4+Pj4+ICsgICAgICB3ZWxsLgo+
Pj4+Pj4+ICsgICAgdHlwZTogYm9vbGVhbgo+Pj4+Pj4KPj4+Pj4+IFVCSSB2b2x1bWVzIGFyZSBt
YXBwaW5nIHRvIHBhcnRpdGlvbnMgMS10by0xLCByaWdodD8gU28gcmF0aGVyIEkgd291bGQKPj4+
Pj4+IHByb3Bvc2UgdG8gdXNlIHBhcnRpdGlvbi55YW1sIC0gd2UgYWxyZWFkeSBoYXZlIHJlYWQt
b25seSB0aGVyZSB3aXRoCj4+Pj4+PiB2ZXJ5IHNpbWlsYXIgZGVzY3JpcHRpb24uCj4+Pj4+Cj4+
Pj4+IE5vLCB0aGF0J3Mgbm90IHRoZSBjYXNlLgo+Pj4+Pgo+Pj4+PiBBbiBNVEQgcGFydGl0aW9u
IGNhbiBiZSB1c2VkIGFzIFVCSSBkZXZpY2UuIEEgVUJJIGRldmljZSAoYW5kIGhlbmNlIE1URAo+
Pj4+PiBwYXJ0aXRpb24pIGNhbiBob3N0ICpzZXZlcmFsKiBVQkkgdm9sdW1lcy4KPj4+Pj4KPj4+
Pj4gTWFya2luZyB0aGUgTVREIHBhcnRpdGlvbiBhcyAncmVhZC1vbmx5JyB3b24ndCB3b3JrLCBh
cyBVQkkgbmVlZHMKPj4+Pj4gcmVhZC13cml0ZSBhY2Nlc3MgdG8gcGVyZm9ybSBiYWQgYmxvY2sg
cmVsb2NhdGlvbiwgc2NydWJiaW5nLCAuLi4KPj4+Pgo+Pj4+IE9LLCBzbyBub3QgcGFydGl0aW9u
IGJ1dCByZWFkLW9ubHkgdm9sdW1lLgo+Pj4KPj4+ICsxCj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEFs
c28sIHR5cGljYWxseSBub3QgYWxsIFVCSSB2b2x1bWVzIG9uIGEgVUJJIGRldmljZSBhcmUKPj4+
Pj4gcmVhZC1vbmx5L2NyaXRpY2FsIGJ1dCBvbmx5IGEgc3Vic2V0IG9mIHRoZW0uCj4+Pj4+Cj4+
Pj4+IEJ1dCB5b3UgYXJlIHJpZ2h0IHRoYXQgdGhlIGRlc2NyaXB0aW9uIGlzIGluc3BpcmVkIGJ5
IHRoZSBkZXNjcmlwdGlvbgo+Pj4+PiBvZiB0aGUgJ3JlYWQtb25seScgcHJvcGVydHkgaW4gcGFy
dGl0aW9uLnlhbWwgOykKPj4+Pj4KPj4+Pj4gSSBpbml0aWFsbHkgdGhvdWdodCB0byBhbHNvIG5h
bWUgdGhlIHByb3BlcnR5ICdyZWFkLW9ubHknLCBqdXN0IGxpa2UKPj4+Pj4gZm9yIE1URCBwYXJ0
aXRpb25zLiBIb3dldmVyLCBhcyB0aGUgZGVzaXJlZCBlZmZlY3QgZ29lcyBiZXlvbmQKPj4+Pj4g
cHJldmVudGluZyB3cml0ZSBhY2Nlc3MgdG8gdGhlIHZvbHVtZSBpdHNlbGYsIEkgdGhvdWdodCBp
dCdkIGJlCj4+Pj4+IGJldHRlciB0byB1c2UgYSBuZXcgbmFtZS4KPj4+Pgo+Pj4+IFllYWgsIG1h
eWJlLi4uIGNyaXRpY2FsIGluZGVlZCBjb3ZlcnMgbXVsdGlwbGUgY2FzZXMgYnV0IGlzIGFsc28K
Pj4+PiBzdWJqZWN0aXZlLiBGb3Igc29tZSBib290bG9hZGVyIGlzIGNyaXRpY2FsLCBmb3Igb3Ro
ZXIgYm9vdGxvYWRlciBzdGlsbAo+Pj4+IG1pZ2h0IGJlIGZ1bGx5IEEvQiB1cGRhdGVhYmxlIHRo
dXMgY291bGQgYmUgbW9kaWZpYWJsZS4gRm9yIG90aGVycywgdGhleQo+Pj4+IHdhbnQgdG8gdXNl
IGZ3X3NldGVudiBmcm9tIHVzZXItc3BhY2Ugc28gbm90IGNyaXRpY2FsIGF0IGFsbC4KPj4+Cj4+
PiBUaGUgY2FzZSBJIHdhbnQgdG8gY292ZXIgaGVyZSBpcyB0aGUgYm9vdGxvYWRlciBpdHNlbGYg
YmVpbmcgc3RvcmVkCj4+PiBpbnNpZGUgYSBVQkkgdm9sdW1lLiBNZWRpYVRlaydzIGZvcmsgb2Yg
QVJNIFRydXN0ZWRGaXJtd2FyZS1BIGJsMiBjb21lcwo+Pj4gd2l0aCBzdXBwb3J0IGZvciBVQkkg
YW5kIGxvYWRzIEJMMyAod2hpY2ggaXMgVEYtQSBCTDMxIGFuZCBVLUJvb3QsIGFuZAo+Pj4gbWF5
YmUgT1AtVEVFIGFzIHdlbGwpIGZyb20gYSBzdGF0aWMgVUJJIHZvbHVtZS4gUmVtb3ZpbmcsIHJl
bmFtaW5nIG9yCj4+PiBhbHRlcmluZyB0aGF0IHZvbHVtZSByZXN1bHRzIGluIHRoZSBkZXZpY2Ug
bm90IGJlaW5nIGFibGUgdG8gYm9vdCBhbnkKPj4+IG1vcmUgYW5kIHJlcXVpcmluZyBhIGNvbXBs
aWNhdGVkIGludGVydmVudGlvbiAoYXQgYXR0YWNoaW5nIGRlYnVnZ2luZwo+Pj4gVUFSVCBhbmQg
dXNpbmcgbG93LWxldmVsIHJlY292ZXJ5IHRvb2wpIGluIG9yZGVyIHRvIHJlY292ZXIuCj4+Cj4+
IFdobyByZW1vdmVzL3JlbmFtZXMgdGhlICdjcml0aWNhbCcgdm9sdW1lPyBJIHN1Z2dlc3QgdG8g
Zml4IGl0IGluIHRoZSB1cHBlcgo+PiBsYXllcihub3QgaW4ga2VybmVsKS4gQWZ0ZXIgbG9va2lu
ZyB0aHJvdWdoIHRoZSBwYXRjaCAyLCBpdCBzZWVtcyBhIGhhY2sKPj4gc29sdXRpb24uCj4gCj4g
VGhlIGVuZW15IGlzIHRoZSB1c2VyLCB0aGUgdXBwZXIgbGF5ZXIgaXMgYmV0d2VlbiB0aGUga2V5
Ym9hcmQgYW5kIHRoZQo+IHNjcmVlbi4gSnVzdCBsaWtlIGZvciAncmVhZC1vbmx5JyBNVEQgcGFy
dGl0aW9ucyBJJ20gbG9va2luZwo+IGZvciBhIHNpbWlsYXIgc29sdXRpb24gZm9yIFVCSSB3aGlj
aCBwcmV2ZW50cyB0aGUgdXNlciBmcm9tIGFjY2lkZW50YWxseQo+IGRlbGV0aW5nIG9yIGRlc3Ry
b3lpbmcgdGhlIGJvb3Rsb2FkZXIsIGxldHMgc2F5LCB3aGVuIGxvZ2dlZCBpbiB2aWEgU1NILgo+
IC4KPiAKCkkgZ3Vlc3MgdGhhdCBvdGhlciBwYXJ0aXRpb25zKGV4Y2VwdHMgbXRkKSBoYXZlIHRo
ZSBzaW1pbGFyIHNpdHVhdGlvbnMsIAp1c2VycyBjb3VsZCBkZWxldGUgYSByb290ZnMoZXh0NCkg
cGFydGl0aW9uIGJ5IG9wZXJhdGlvbiB0aGUgcmF3IGJsb2NrIApkZXZpY2UuIFRoZSBrZXJuZWwg
aGFzIG5vIHdheSB0byBzdG9wIHVzZXIgZG9pbmcgdGhpcywgd2hhdCBpZiB0aGUgdXNlciAKanVz
dCB3YW50IHRvIHJlYnVpbGQgcGFydGlvbnM/Ck1hcmtpbmcgdm9sdW1lIGFzIGNyaXRpY2FsKGJ5
IGEgc3RvcHBlciBpbiBrZXJuZWwpIGNvdWxkIHByZXZlbnQgdXNlciAKbWlzdGFrZW5seSBvcGVy
YXRpbmcsIGJ1dCBJIHRoaW5rIGl0IGlzIG1vcmUgaW1wb3J0YW50IHRoYXQgdXNlciBuZWVkIHRv
IAprbm93IHdoYXQgaGUvc2hlIGlzIGRvaW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
