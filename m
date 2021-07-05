Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729D1C07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 10:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255F7613FC
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 10:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 255F7613FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioRxynheLKdTSG91OkgEdbcxWUL0tT6WEzj6/dRTa4A=; b=KDwh9PFisEe4Ak
	weSy07nzc44DAP7gwPJzOZqKbfcwE7k65VOWe4SHNmq7SqvdBEM7HAjKuL63MphXA0QxbGhbaKsWG
	XBfBL105hEZPS4vwucIVJiYTy+i5SohnAshlHsx6kIzmSlvE3lKgaRRP1I8BFKbPHKhStpjjZSScX
	od8agzYcyOanGeFe1U1L4zg37XfQ/4qoRKiofiVNXhxYnHYx2q+DX9JLHtM4EOTUDmdav4DY3+cpS
	BiPgBFX/SftQJfF07Hq9VonLc7cgNX97WYlco05t6Yv9dmMjLM5Fndx0eh3HHDfHeax0rte33gIXJ
	tkXMSXRR5P0EBdkSu9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0M7y-008dL3-7c; Mon, 05 Jul 2021 10:47:02 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0M7u-008dIw-CR
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 10:47:00 +0000
Received: from skn-laptop (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id BC8064C5383;
 Mon,  5 Jul 2021 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1625482015; bh=/8FqO6pBB1MSEkM8eBrDR29KNXvVw/vqG/8FEdlGiHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=kDmIklMJBmOIl5BQ9Bv3Ly8GWxhpiYpztpHJ35MvrpmD7fC3h7/S94MlWE2MYfrIY
 BBixsqqoIUJs9jbUBqnkxKyofKBcUCeRts3GP35rTDarTTYPZjR09bNHJydjvaBgRJ
 fkTJuQe71mHSRivmxatVrUv5bS5DBYU3hwofvrSs1MJYRtqPDJJNzU2SsM/kSnlB1D
 qXMQpzAAUq/Y/FSp8zQcNgoWKosSVY8zt1rXgxJX1RU3xcrLmA83I1yB0cfBgsdCeG
 q8JYTUxvI5DR/QoWA2k7csQqvE0MPo+KNZ/YlefZAIKzJ8sNkTrPINgPFjX1/I0xm5
 kxXzqnV2uj1bQ==
Date: Mon, 5 Jul 2021 12:46:54 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Han Xu <han.xu@nxp.com>, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
Message-ID: <20210705104654.gko7ettkilrrosi7@skn-laptop>
References: <20210522205136.19465-1-han.xu@nxp.com>
 <13c975bc-b37b-8708-9ac7-acdc62ef7108@geanix.com>
 <20210525191308.jlxqvy7khptbuj4z@umbrella>
 <20210526094136.279976a6@xps13>
 <20210526141700.5gygssig4rnzn6mj@umbrella>
 <20210526173123.1787713b@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526173123.1787713b@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_034658_661718_F2AA30B8 
X-CRM114-Status: GOOD (  42.20  )
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

T24gV2VkLCBNYXkgMjYsIDIwMjEgYXQgMDU6MzE6MjNQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBIYW4sCj4gCgpbIC4uLiBdCgo+IAo+IEkgdW5kZXJzdGFuZCB0aGF0ICgyKSBt
aWdodCBiZSBpZGVhbCB0byBtZWV0IGJ1dCBpcyBicmVha2luZyBhbGwgdGhlCj4gYm9hcmRzIHRo
YXQgdXNlIHRoaXMgZHJpdmVyIHJlYWxseSB3b3J0aCB0aGUgdHJvdWJsZT8KPiAKPiBTaG9ydCBh
bnN3ZXI6IG5vLiBTbyB3ZSBuZWVkIHRvIGFkYXB0IHRoZSBjYWxjdWxhdGlvbiBmb3IgbmV3Cj4g
Ym9hcmRzL25ldyBmbGFzaCBjaGlwcy9jZXJ0YWluIGdlb21ldHJpZXMgYXQgbW9zdC4KPiAKPiA+
ID4gPiBUaGUgbmV3IGltcGxlbWVudGF0aW9uIG1pZ2h0IGdldCB3ZWFrIGVjYyB0aGFuIGxlZ2Fj
eSB3YXkgaW4gc29tZSBjYXNlcyBidXQgaXQKPiA+ID4gPiBpcyBzYWZldHkgZ3VhcmFudGVlZC4g
IAo+ID4gPiAKPiA+ID4gV2hhdCBkb2VzICJzYWZldHkgZ3VhcmFudGVlZCIgbWVhbnM/ICAKPiA+
IAo+ID4gc2V0IG1pbmltdW0gZWNjIHJlcXVpcmVkIGJ5IG5hbmQgY2hpcCBhdCBsZWFzdCBtZWV0
IGFsbCByZXF1aXJlbWVudHMKPiA+IAo+ID4gPiAgIAo+ID4gPiA+IFRoaXMgcmVtaW5kcyBtZSB0
aGUgZ3BtaSByYXcgYWNjZXNzIG1vZGUgY2hhbmdlcyBpbiBrZXJuZWwgMy4xOSwgaXQgYWxzbyBj
aGFuZ2VzCj4gPiA+ID4gdGhlIGRyaXZlciBiZWhhdmlvcnMgYW5kIG1ha2VzIHRvdGFsbHkgZGlm
ZmVyZW50IG91dHB1dCBjb21wYXJlZCB3aXRoIG9sZGVyCj4gPiA+ID4gdmVyc2lvbnMuIEkga25v
dyBjaGFuZ2VzIGJyaW5nIG1lc3MgYnV0IHdlIGhhdmUgdG8gYWNjZXB0IGl0IGF0IHNvbWUgcG9p
bnQKPiA+ID4gPiByYXRoZXIgdGhhbiBrZWVwIGNvbXByb21pc2luZyB0byB0aGUgd3Jvbmcgd2F5
LiAgCj4gPiA+IAo+ID4gPiBIb3cgaXMgdGhpcyBhbiBhcmd1bWVudD8gSSBhbSB1c3VhbGx5IGlu
IGZhdm9yIG9mIG1vdmluZyBmb3J3YXJkIHdoZW4KPiA+ID4gdGhlcmUgaXMgYSByZWFsIGp1c3Rp
ZmljYXRpb24sIGJ1dCB0aGlzIGRvZXMgbm90IHNlZW0gdGhlIGNhc2UsIHVubGVzcwo+ID4gPiBJ
IGFtIHVuZGVyc3RhbmRpbmcgaXQgYWxsIHRoZSB3cm9uZyB3YXkuCj4gPiA+ICAgCj4gPiA+ID4g
VGhlIGNoYW5nZSBoYXMgYmVlbiBpbiBOWFAga2VybmVsIGZvcmsgZm9yIGEgd2hpbGUsIHNvIHF1
aXRlIGEgZmV3IGN1c3RvbWVycyBhcmUKPiA+ID4gPiB1c2luZyB0aGlzIGJjaCBnZW9tZXRyeSBz
ZXR0aW5ncy4gSSBob3BlIGl0IGNhbiBiZSB1cHN0cmVhbWVkLCBhbnkgb3RoZXIgdGhpbmdzCj4g
PiA+ID4gSSBjYW4gZG8gbWF5IG1pdGlnYXRlIHRoZSBpbWFwYWN0PyAgCj4gPiA+IAo+ID4gPiBZ
b3UgYXJlIHdlbGwgYXdhcmUgb2YgdGhlIHVwc3RyZWFtaW5nIHByb2Nlc3MsIHRyeWluZyB0byBt
ZXJnZQo+ID4gPiBzb21ldGhpbmcgbG9jYWxseSwgbWFraW5nIGl0IHVzZWQgYW5kIHRoZW4gY29t
cGxhaW5pbmcgYmVjYXVzZSBub3QKPiA+ID4gdXBzdHJlYW1pbmcgaXQgd291bGQgYnJlYWsgeW91
ciBjdXN0b21lcnMgcmVhbGx5IGlzIHlvdXIgb3duCj4gPiA+IHJlc3BvbnNpYmlsaXR5LiAgCj4g
PiAKPiA+IFNvcnJ5IEkgdW5kZXJzdGFuZCBJIHNob3VsZCB0cnkgdXBzdHJlYW1pbmcgaXQgZWFy
bHksIHNvIEkgYW0gc3RpbGwgbG9va2luZyBmb3IKPiA+IGEgY2hhbmNlIHRvIGF2b2lkIGZ1cnRo
ZXIgZGl2ZXJnZW5jZS4KPiA+IAo+ID4gPiAKPiA+ID4gSU1ITyB0aGUgc29sdXRpb25zIGFyZToK
PiA+ID4gLSB0aGUgY3VycmVudCAobWFpbmxpbmUpIGRlZmF1bHQgd2lsbCByZW1haW4gdGhlIHN0
YW5kYXJkIGZvcgo+ID4gPiAgIGdlb21ldHJpZXMgd2hpY2ggYXJlIGFscmVhZHkgd2lkZWx5IHN1
cHBvcnRlZAo+ID4gPiAtIGlmIHRoZXJlIGFyZSBuZXcgZ2VvbWV0cmllcyB0aGF0IG11c3QgYmUg
c3VwcG9ydGVkIGFuZCBkbyBub3QgZml0Cj4gPiA+ICAgYmVjYXVzZSBvZiB0aGUgImxlZ2FjeSIg
bG9naWMsIHRoZW4geW91IG1heSBkZXRlY3QgdGhhdCBhbmQgdHJ5Cj4gPiA+ICAgdG8gZmFsbGJh
Y2sgdG8gdGhlICJtb2Rlcm4iIHdheSBvZiBjYWxjdWxhdGluZyB0aGUgRUNDCj4gPiA+ICAgcGFy
YW1ldGVycyAob3IgZXZlbiBqdW1wIGRpcmVjdGx5IHRvIHRoZSBtb2Rlcm4gd2F5IGlmIHRoZSBn
ZW9tZXRyeQo+ID4gPiAgIHJlYWxseSBpcyBub3QgY3VycmVudGx5IHN1cHBvcnRlZCBvZmZpY2lh
bGx5KQo+ID4gPiAtIGlmIHlvdXIgY3VzdG9tZXJzIHdhbnQgYSBzcGVjaWZpYyBjaHVuayBzaXpl
L3N0cmVuZ3RoIHdoZW4KPiA+ID4gICByZWJhc2luZyBvbiB0b3Agb2YgYSBtYWlubGluZSBrZXJu
ZWwgdGhlcmUgYXJlIERUIHByb3BlcnRpZXMgd2hpY2ggZG8KPiA+ID4gICB0aGF0IGFueXdheQo+
ID4gPiAtIGZvbGxvdyBTZWFuIGFkdmljZTogaW50cm9kdWNlIGEgcHJvcGVydHkgcmVxdWVzdGlu
ZyB0byB1c2UgdGhlCj4gPiA+ICAgJ21vZGVybicgb3IgJ2xlZ2FjeScgbG9naWMgKHdpdGggYSBi
ZXR0ZXIgbmFtZSB0aGFuIG1vZGVybikgYnV0IGZpcnN0Cj4gPiA+ICAgY2hlY2sgd2l0aCBSb2Ig
dGhhdCB0aGlzIGlmIHZhbGlkLgo+IAo+IEFub3RoZXIgaGludDogcGxlYXNlIGNoZWNrIHRoZSBj
b3JlIGhlbHBlcnMgYW5kIHVzZSB0aGVtIGluc3RlYWQgb2YKPiB0cnlpbmcgdG8gcmUtaW52ZW50
IHRoZSB3aGVlbDogbm9ybWFsbHkganVzdCBkZXNjcmliaW5nIHRoZSBlbmdpbmUKPiBjYXBhYmls
aXRpZXMgYW5kIGNhbGxpbmcgYSBzaW5nbGUgaGVscGVyIHNob3VsZCBkbyB0aGUgdHJpY2suIEJ1
dCB0aGlzCj4gJ25ldycgY2FsY3VsYXRpb24gc2hvdWxkIG9ubHkgYXBwbHkgdG8gZWcuIE1MQyBk
ZXZpY2VzIG9yIGRldmljZXMgd2l0aAo+IHNwZWNpZmljIGdlb21ldHJpZXMsIG5vdCB0byBhbGwg
ZGV2aWNlcy4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKSGkgSGFuLAoKSXMgdGhpcyBzb21ldGhp
bmcgeW91IGFyZSB3b3JraW5nIG9uPwpJZiBub3QgSSByZWFsbHkgdGhpbmsgd2UgbmVlZCB0byBy
ZXZlcnQgdGhlIGNoYW5nZXMgdG8gdS1ib290LCB0byBhbGxpZ24KdmFuaWxsYSB1LWJvb3QgYW5k
IGtlcm5lbC4KCi9TZWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
