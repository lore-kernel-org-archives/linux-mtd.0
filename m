Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1E4D63921
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBAwgJ0HOC137fniAxTmMZ0laoWQK6OWKjVYyonFSxM=; b=WO4ezVtpb9LQzj
	VYAF2qyNzU8XmJEUuRw6qoXxAi0ogcwpesY1SQ9mxDxqhxLFZGY0B4tU2tL9tYhSopgUsq5E5Lsqr
	aiasYfz2aBCV4PnOpMUAc/bymYKa+VJpuSXiyscJpQd4+XufNhOb8G6zL3vUAjypl6JC4bQ6nK5EB
	COF2anw0Gg1J+RJ66s6uQCwUqy01Z0YG5DzFsBtbOjDDx16aqTx/6TxnrcNTnc4vzgImJPBU3D3O/
	N+e9cDcBvkejFPVN8YS0nlF9J+0Ouwg2VSsFckaEm6eeQ3ntW999a0hjItOKfGWZtYgYor8mkO/IL
	pQTj2djsixERPhBU/WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhjb-0000000F24W-1coV;
	Wed, 20 Nov 2024 10:14:55 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhic-0000000F1rn-3wKr;
	Wed, 20 Nov 2024 10:13:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E611E6000F;
	Wed, 20 Nov 2024 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732097632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rund3eXE33gunWroliBrDttepEeQJ9PST86ln98CDmg=;
	b=DsZxB6BaaT/0Ww5LZyO6h+V9XleVnpsXjDfY5zxvRIDAwQW65PwtYmnLLAljfjYyKGqlgp
	bDLfpZ0E5Izwtgcvl3CS26oT6kV64zOBR2tL8huPCdjRhieUxdgmx0U64xscJhvY/qhmHT
	6DWzyH79UKH5SDm8+Gb24BHpLaImXVuG9GI39rx4uFGHD+GwvM2scmQf1yVUbVttX8ociB
	+YxLVHELGy/vnzGmEfR7uxMvGxsGHrs8Qqs7yoJO7GnNhOffwe3+kocUgQF8b2CI5HD0si
	V8tyweBYu8Aty8g6hVSki1wddilYdWjwsg9QU3+m+G2Xz3OxrtsktTnlz6frOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: SkyLake Huang (=?utf-8?B?6buD5ZWf5r6k?=) <SkyLake.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  "acelan.kao@canonical.com"
 <acelan.kao@canonical.com>,  "chengminglin@mxic.com.tw"
 <chengminglin@mxic.com.tw>,  "mika.westerberg@linux.intel.com"
 <mika.westerberg@linux.intel.com>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  Steven Liu
 <steven.liu@mediatek.com>,  "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>,  "daniel@makrotopia.org"
 <daniel@makrotopia.org>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  "richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH nand/next 0/4] mtd: nand: spi: Add CASN page support
In-Reply-To: <9880b3b2f71afd1b020c393fd5d4c0c5673df187.camel@mediatek.com>
	("SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCkiJ3M=?= message of "Wed, 20 Nov
 2024 07:24:28
	+0000")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<87jzd0zuc0.fsf@bootlin.com>
	<9880b3b2f71afd1b020c393fd5d4c0c5673df187.camel@mediatek.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 20 Nov 2024 11:13:48 +0100
Message-ID: <87ldxew6ub.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_021355_267836_A9141724 
X-CRM114-Status: GOOD (  28.53  )
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

T24gMjAvMTEvMjAyNCBhdCAwNzoyNDoyOCBHTVQsIFNreUxha2UgSHVhbmcgKOm7g+WVn+a+pCkg
PFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKCj4gT24gTW9uLCAyMDI0LTExLTE4
IGF0IDExOjUzICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBFeHRlcm5hbCBlbWFpbCA6
IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbAo+PiB5
b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lgo+PiAKPj4gCj4+IE9u
IDIwLzEwLzIwMjQgYXQgMjE6Mjc6MTggKzA4LCBTa3kgSHVhbmcgPFNreUxha2UuSHVhbmdAbWVk
aWF0ZWsuY29tPgo+PiB3cm90ZToKPj4gCj4+ID4gRnJvbTogIlNreSBIdWFuZyIgPHNreWxha2Uu
aHVhbmdAbWVkaWF0ZWsuY29tPgo+PiA+IAo+PiA+IEhpLCB0aGlzIGlzIFFpLVplIEh1YW5nKFNr
eSBIdWFuZykgZnJvbSBNZWRpYVRlay4gT24gb3VyIHJvdXRlcgo+PiA+IHBsYXRmb3Jtcwo+PiA+
IGNoaXBzLCB3ZSBoYXZlIHRvIHF1YWxpdHkgbG90cyBvZiBTUEktTkFORCBkZXZpY2VzIGFuZCBh
cmUgZWFnZXIKPj4gPiBmb3IKPj4gPiBhIHN0YW5kYXJkIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0
byBtYWludGFpbiB0cml2aWFsIGZsYXNoIElEIHRhYmxlCj4+ID4gYW55bW9yZS4gSSBhbHNvIG5v
dGljZWQgYSB0YWxrIGluIDIwMTkgRW1iZWRkZWQgTGludXggQ29uZmVyZW5jZSwKPj4gPiBNZW1v
cnkgVGVjaG5vbG9neSBEZXZpY2VzOiB3aGF0J3MgbmV3LCB3aGljaCBtZW50aW9uZWQgIk9ORkkg
Zm9yCj4+ID4gU1BJLU5BTkRzPyBNYXliZSwgbWF5YmUgbm90Ii4KPj4gPiAKPj4gPiBTbyBlYXJs
aWVyIHRoaXMgeWVhciwgSSBwcm9wb3NlZCBhIGJvbGQgaWRlYSwgQ0FTTiBwYWdlIChDb21tb24K
Pj4gPiBBdHRyaWJ1dGVzCj4+ID4gZm9yIFNQSS1OQU5EKS4gSSB3b3JrZWQgdG9nZXRoZXIgd2l0
aCB0b3AgMyBTUEktTkFORCBtYXJrZXQgc2hhcmUKPj4gPiBmbGFzaAo+PiA+IHZlbmRvcnMgYW5k
IG90aGVyIHZlbmRvcnMgdG8gaW50ZWdyYXRlIENBU04gcGFnZSBvbiB0aGVpciBTUEktTkFORAo+
PiA+IGRldmljZXMKPj4gPiBpbmNsdWRpbmcgYnV0IG5vdCBsaW1pdGVkIHRvOgo+PiA+IFtFU01U
XQo+PiA+IEY1MEwxRzQxTEIKPj4gPiBGNTBMMkc0MUtBCj4+ID4gCj4+ID4gW0V0cm9uXQo+PiA+
IEVNNzNDMDQ0VkNGLUgKPj4gPiBFTTczRDA0NFZDTy1ICj4+ID4gRU03M0UwNDRWQ0UtSAo+PiA+
IEVNNzNGMDQ0VkNBLUgKPj4gPiAKPj4gPiBbR2lnYURldmljZV0KPj4gPiBHRDVGMUdNN1VFCj4+
ID4gR0Q1RjFHUTVVRVlJRwo+PiA+IEdENUYyR003VUUKPj4gPiBHRDVGMkdRNVVFWUlHCj4+ID4g
R0Q1RjRHTThVRQo+PiA+IEdENUY0R1E2VUVZSUcKPj4gPiAKPj4gPiBbTWFjcm9uaXggKE1YSUMp
XQo+PiA+IE1YMzVMRjFHRTRBQlo0SUcKPj4gPiAKPj4gPiBbV2luYm9uZF0KPj4gPiBXMjVOMDFH
Vgo+PiA+IFcyNU4wMUtWCj4+ID4gVzI1TjAyS1YKPj4gPiBXMjVOMDRLVgo+PiA+IAo+PiA+IEEg
ZG9jdW1lbnQgb2YgQ0FTTiBpcyBob3N0ZWQgb24gZ2l0aHViKAo+PiA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vbXRrLW9wZW53cnQvX187ISFDVFJOS0E5
d01nMEFSYnchal9URVM3ZEpfQW4tOXd0eVFxV2dHQkU5b3ZQblVBLXRETmxaLXBHcFVkWXY0Z3Bo
elc0djU0RmFsOGlfbkx3U21QQXpLOUFwZ1NCRzFYUV9tUkVkVFMwWndyQldSQSQKPj4gPiBkb2Mv
YmxvYi9tYWluL0NBU04lMjBQYWdlJTIwSW50cm9kdWN0aW9uLnBkZikgU28gSSdsbCB0cnkgdG8g
a2VlcAo+PiA+IGl0Cj4+ID4gc2ltcGxlIGhlcmUuCj4+ID4gCj4+ID4gV2l0aCBDQVNOIHBhZ2Us
IHdlIGRvbid0IG5lZWQgdG8gbWFpbnRhaW4gU1BJLU5BTkQgZmxhc2ggSUQgdGFibGUKPj4gPiBh
bnltb3JlLgo+PiA+IEN1cnJlbnRseSwgaXQncyBpbnRlZ3JhdGVkIGluIDMuM1YgU1BJLU5BTkRz
IG9mIHNtYWxsIGRlbnNpdHkgYW5kCj4+ID4gaXQncyBub3QKPj4gPiBKRURFQyBzdGFuZGFyZCB5
ZXQuIEJ1dCBpdCBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgMS44ViBhbmQgY2FuIGJlCj4+ID4g
ZWFzaWx5Cj4+ID4gaW50ZWdyYXRlZCBieSBmbGFzaCB2ZW5kb3JzLgo+PiA+IAo+PiA+IEkgYmVs
aWV2ZSB0aGlzIGlkZWEgYW5kIGltcGxlbWVudGF0aW9uIGhhdmUgcm9vbSBmb3IgaW1wcm92ZW1l
bnQuCj4+ID4gSG9wZSB0bwo+PiA+IGhlYXIgeW91IG9wZW4gc291cmNlIGNvbW11bml0eSdzIGNv
bW1lbnRzIHNvb24uCj4+IAo+PiBJIHRoaW5rIHRoaXMgaXMgYSBicmlnaHQgaW5pdGlhdGl2ZS4g
SSdkIHdlbGNvbWUgc29tZSBzdGFuZGFyZGlzYXRpb24KPj4gb24KPj4gdGhlIGRpc2NvdmVyeSBp
bmRlZWQuCj4+IAo+PiBCdXQgdG8gYmUgcmVhbGx5IHVzZWZ1bCwgSSBiZWxpZXZlIHRoaXMgdGFi
bGUgbXVzdCBiZSByZWFsbHkKPj4gY29tcGxldGUsCj4+IG90aGVyd2lzZSBJRCdzIHdpbGwgcmVt
YWluLiBGb3IgaW5zdGFuY2UgU0RSL0REUiBtb2RlcyBhcmUgbm90Cj4+IGVudGlyZWx5Cj4+IGRl
ZmluZWQgYXMgd2UgYWxyZWFkeSBoYXZlIG1peGVkIG1vZGVzLiBUaGVyZSBpcyBhbHNvIG5vIGlu
Zm9ybWF0aW9uCj4+IGFib3V0IHdoYXQgbWF4aW11bSBmcmVxdWVuY2llcyBjYW4gYmUgdXNlZCB3
aXRoIGVhY2ggb3BlcmF0aW9uLiAKPgo+IE1heGltdW0gZnJlcXVlbmNpZXMgYXJlIGxpbWl0ZWQg
YnkgU1BJIGNvbnRyb2xsZXIncyBtYXggZnJlcSBub3csIEkKPiBndWVzcz8KCk5vLCB0aGlzIGlz
IGp1c3QgdGhlIFBDQi9jb250cm9sbGVyIGxpbWl0YXRpb24uIEJ1dCB0aGVyZSBhcmUgY2hpcHMg
d2l0aApmcmVxdWVuY3kgbGltaXRhdGlvbnMgZGVwZW5kaW5nIG9uIHRoZSB0eXBlIG9mIGNvbW1h
bmQgKHNlZSBmb3IgaW5zdGFuY2UKV2luYm9uZCBBQyB0aW1pbmdzIHRhYmxlcyBmb3IgRERSIGNh
cGFibGUgZGV2aWNlcykuCgo+PiBBcwo+PiBhbm90aGVyIGV4YW1wbGUsIHRoZXJlIGlzIG5vIHJl
YWQgcmV0cnkgaW5mb3JtYXRpb24uCj4gV2hhdCB3aWxsIHJldHJ5IGluZm9ybWF0aW9uIGxvb2sg
bGlrZT8KCk51bWJlciBvZiByZXRyeSBtb2RlcywgaG93IHRvIGVuYWJsZSByZXRyeSBtb2RlICh3
aGljaCBpcyBtYXliZQpzdGFuZGFyZGl6ZWQgcGVyIG1hbnVmYWN0dXJlciwgaW4gdGhpcyBjYXNl
IHdlIGNhbiBqdXN0IGdldCB0aGUgcmlnaHQKaG9vayBmcm9tIHRoZSBtYW51ZmFjdHVyZXIgaW5m
b3JtYXRpb24sIGJ1dCBvdGhlcndpc2UgaWYgdGhlcmUgYXJlCmRpZmZlcmVuY2VzIGluc2lkZSBw
cm9kdWN0aW9uIGxpbmVzIGZyb20gYSBzaW5nbGUgbWFudWZhY3R1cmVyLCB3ZSdsbApzdGlsbCBu
ZWVkIGVpdGhlciBhIHRhYmxlIG9yIHNvbWUgZXh0ZW5zaW9uIG9mIENBU04uCgo+PiBOb3IgYW55
dGhpbmcgYWJvdXQKPj4gdGhlIGZhY3QgdGhhdCB0aGUgb24tZGllIEVDQyBlbmdpbmUgbWlnaHQg
bm90IGJlIGRpc2FibGVkLgo+IEFzIGZhciBhcyBJIGtub3csIG9ubHkgU2t5SGlnaCdzIFNQSS1O
QU5EJ3MgRUNDIGVuZ2luZSBjYW4ndCBiZQo+IGRpc2FibGVkIHNpbmNlIGl0cyBvbi1kaWUgRUND
IGVuZ2luZSBjb250YWlucyByYW5kb21pemVyLgoKUmFuZG9taXplciBhbmQgRUNDIGVuZ2luZSBh
cmUgdHdvIGRpZmZlcmVudCB0aGluZ3MsIHRoZXJlIGFyZSBtYW55IHJhdwpOQU5EIGNvbnRyb2xs
ZXJzIHdpdGggYSBwcm9ncmFtbWFibGUgRUNDIGVuZ2luZSAqYW5kKiByYW5kb21pemVyLiBUaGV5
Cmp1c3QgY2hvb3NlIHRvIGhpZGUgdGhlIGNvbnRyb2xzLgoKVG9kYXkgaXQgaXMgU2t5SGlnaC4g
V2hhdCBhYm91dCB0b21vcnJvdz8KCj4gVGhlcmUgYXJlIHNvbWUgcmVzZXJ2ZWQgZmllbGRzLiBX
ZSBjYW4gaGFuZGxlIGFib3ZlIHJlcXVpcmVtZW50cyBpbgo+IENBU04gVjEuMiBvciBWMi4gQnV0
IG1heSBJIGFzayB3aGF0J3MgdGhlIHB1cnBvc2Ugb2YgaW52b2x2aW5nIGFib3ZlCj4gaW5mb3Jt
YXRpb24gaW4gQ0FTTj8gQXJlIHRoZXJlIGFueSBwcmFjdGljYWwgYXBwbGljYXRpb24gc2NlbmFy
aW9zPwoKWW91IGNsYWltIHlvdSB3YW50IHRvIHJlcGxhY2UgdGhlIElEIHRhYmxlcy4gVGhlc2Ug
dGFibGVzIGFyZSBmaWxsZWQKd2l0aCBhbGwgdGhlIHJlbGV2YW50IGRhdGEgdG8gbWFrZSB0aGUg
Y2hpcHMgc3VwcG9ydGVkIGluIExpbnV4LiBJZiBvbmUKb2YgdGhlc2UgZmllbGRzIGlzIG1pc3Np
bmcgZnJvbSBDQVNOLCBpdCBtZWFucyB3ZSBuZWVkIHRvIGtlZXAgdGhlCnRhYmxlcy4gU28gaXQg
a2luZCBvZiBkZWZlYXRzIHRoZSBDQVNOIHB1cnBvc2UuIFllcyB3ZSBtYXkgaGF2ZSBkeW5hbWlj
CnZlbmRvciBob29rcyB0byBhZGFwdCB0aGVzZSBwYXJhbWV0ZXJzICJvbiB0aGUgZmx5IiwgYnV0
IHdlIHN0aWxsIG5lZWQKaW50ZXJuYWwgdGFibGVzIGZvciB0aGF0LgoKPj4gT3ZlcmFsbCBJIHRo
aW5rIHRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgaW5pdGlhdGl2ZSBidXQgSSB3b3VsZCBsaWtlIGl0
Cj4+IHRvCj4+IGJlIG1vcmUgYWR2YW5jZWQuCj4gQWdyZWUuCj4KPj4gSXMgdGhlcmUgYSBwbGFu
IG9uIGdldHRpbmcgdGhpcyBzdGFuZGFyZGl6ZWQgdGhyb3VnaAo+PiBlZy4gYSBKRURFQyBzcGVj
Pwo+PiAKPj4gVGhhbmtzLAo+PiBNaXF1w6hsCj4gWWVzLiBXZSdyZSB3b3JraW5nIG9uIGl0LiBC
dXQgaXQgd2lsbCB0YWtlIHNvbWUgdGltZS4gWW91ciBvcGluaW9ucwo+IG1lYW4gYSBsb3QgdG8g
Q0FTTiBwYWdlIHN0YW5kYXJkaXNhdGlvbi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
