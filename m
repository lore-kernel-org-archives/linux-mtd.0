Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31F2C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+p9I0CRZ9HLWfXT+vYV5I43RwMrWsPaQK6dAUlKYAOw=; b=Fx/DBnnOnBLP0qZoud2Ar6j67v
	sia326ZzjpGNioA/PQ/KqyOMChtvmG6XxDXjL35hELMzlBHkWk5fcdVq5uOpLVIwqvNX95BOuQsDy
	NwekDY+VRSIaN0GV+/8HujCrWRbOEE0NifrmWN90sfLp6FgMTr/Hv0COFflPi1FSsp3PYsk/D6MXa
	Wf6DV3taQHn/WhxWtiOwRSBBzQWWQQBHAy3p8Q142g18uEgAZdOzA2OXetQ9kIMi9yucjpxG4K83A
	iU2DWR5dUu+KQvClHuz3gd7De5CHOW5eTdyGcyeMrqCTCZ1Mr+NVqPq9IlCJW3nUkWWK4BVRdVeJ1
	0gWsEnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvIHL-00FtOs-Qj; Thu, 09 Dec 2021 12:12:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvIHH-00FtNh-Uy
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 12:12:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6703BCE24D7;
 Thu,  9 Dec 2021 12:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91081C004DD;
 Thu,  9 Dec 2021 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639051915;
 bh=eADAqHBHTP/5lSMqidzF7Ig4xxyADIO5diu1cFOnGJM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=u3fpslFhOojJ+h1yBp50Bj7N+TWTKO+rsdU8WRhRlLyd02SACv4tdNI2bDS9Lmg7q
 VNSHRBBDr8hlgntOALHnp5TAbbbfNfLUM/jHXG2YA3Tdb829AQchsjcII6p0awT68s
 39k9N3hoV7o3jv++6b+LjGz99HTDtrAjoTkhMlBWl1sK/Yxu8utapE5defIH1QJrJP
 T6bxV+Tfp1EX1F3ofwMfhxha9tVXeJH/+as8pS5X0j92AM/wjfBfkBTjVWpdrj3DGW
 +WNGKTVVGCjr9pQ51o07N75XyBRpV3MIVRCp3m+Fz3Bv1jroF8Kc6+ngDTpPvBWKK/
 6+Yq2t+V85OPA==
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206174209.2297565-1-robh@kernel.org>
 <20211209104224.41d42cca@xps13>
 <bebef734-d0d3-e78e-e07a-9160ead1f673@kernel.org>
 <20211209114038.710139a8@xps13>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <1744af96-3b71-3d41-12e2-a9052684cb35@kernel.org>
Date: Thu, 9 Dec 2021 14:11:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209114038.710139a8@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_041200_405961_A1E3A6C0 
X-CRM114-Status: GOOD (  28.21  )
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

TWlxdWVsLAoKT24gMDkvMTIvMjAyMSAxMjo0MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBS
b2dlciwKPiAKPiByb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBUaHUsIDkgRGVjIDIwMjEgMTI6
MDg6MDcgKzAyMDA6Cj4gCj4+IEhpIE1pcXVlbCwKPj4KPj4gT24gMDkvMTIvMjAyMSAxMTo0Miwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhpIFJvYiwKPj4+Cj4+PiByb2JoQGtlcm5lbC5vcmcg
d3JvdGUgb24gTW9uLCAgNiBEZWMgMjAyMSAxMTo0MjowOSAtMDYwMDoKPj4+ICAgCj4+Pj4gV2l0
aCAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJyBzdXBwb3J0IGltcGxlbWVudGVkLCB0aGUgVEkgR1BN
QyBleGFtcGxlCj4+Pj4gaGFzIGEgd2FybmluZzoKPj4+Pgo+Pj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvdGksZ3BtYy5leGFtcGxlLmR0Lnlh
bWw6IG5hbmRAMCwwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ3Ji
LWdwaW9zJyB3YXMgdW5leHBlY3RlZCkKPj4+Pgo+Pj4+IEFkZCB0aGUgbWlzc2luZyBkZWZpbml0
aW9uIGZvciAncmItZ3Bpb3MnLiAgCj4+Pgo+Pj4gcmItZ3Bpb3MgaXMgYWxyZWFkeSBkZWZpbmVk
IGluIG5hbmQtY29udHJvbGxlci55YW1sLiBJIHNlZW1zIGxpa2UgdGhlCj4+PiByZWFsIHByb2Js
ZW0gaXMgdGhhdCB0aGlzIGZpbGUgZG9lcyBub3QgcmVmZXIgdG8gaXQuIENhbiB5b3UgdXBkYXRl
IHRoZQo+Pj4gZml4PyAgCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHJlZmVyIHRvIG5hbmQt
Y29udHJvbGxlci55YW1sIHJpZ2h0IG5vdyBhcyB3ZSBhcmUgbm90Cj4+IGZ1bGx5IGNvbXBhdGli
bGUgd2l0aCBpdCB5ZXQuIFBsZWFzZSBzZWUgZXhhbXBsZXMgYmVsb3cuCj4gCj4gVGhpcyBpcyBh
ICp2ZXJ5KiB3cm9uZyB3YXkgb2YgZGVmaW5pbmcgYSBOQU5EIHNldHVwLiBJIHdpbGwgdGFrZSB0
aGUKPiBwYXRjaCB0byBzaWxlbmNlIHRoZSB3YXJuaW5nLCBidXQgcGxlYXNlIGNvbnZlcnQgdGhp
cyByZXByZXNlbnRhdGlvbiB0bwoKVGhhbmtzIQoKPiB0aGUgJ25ldycgb25lLiBJIGJlbGlldmUg
b24gdGhlIGRyaXZlciBzaWRlIGl0IHNob3VsZCBub3QgYmUgdG9vCj4gY29tcGxpY2F0ZWQgdG8g
c3VwcG9ydCBoYXZpbmcgYSBmZXcgb2YgdGhlc2UgcHJvcGVydGllcyBtb3ZlZCB0byBhIE5BTkQK
PiBjaGlwIHN1Ym5vZGUgYW5kIHN0aWxsIHN1cHBvcnQgdGhlIGJlbG93IGJpbmRpbmcuIEp1c3Qg
YmUgdmVyeSBjbGVhcgo+IHRoYXQgaWYgdGhlIGxlZ2FjeSBiaW5kaW5ncyBhcmUgdXNlZCwgb25s
eSBhIHNpbmdsZSBjaGlwIGlzIHN1cHBvcnRlZC4KCkkgYWdyZWUgd2l0aCB5b3UuIEl0IGhhcyBi
ZWVuIHRoYXQgd2F5IHNpbmNlIGFnZXMuIEkgd2lsbCBsb29rIGF0IGNsZWFuaW5nCml0IHVwIHdo
ZW5ldmVyIHBvc3NpYmxlIGZvciBtZS4gSSB0aGluayB3ZSB3aWxsIGhhdmUgdG8gc3VwcG9ydCB0
aGUgb2xkCmJpbmRpbmdzIGFzIHdlbGwgYXMgdGhlIG5ldyBvbmUgZ29pbmcgZm9yd2FyZCBhcyBt
YW55IGxlZ2FjeSBwbGF0Zm9ybXMKYXJlIHVzaW5nIGl0LgoKY2hlZXJzLAotcm9nZXIKCj4gCj4+
IHRpLGdwbWMtbmFuZCBleGFtcGxlOgo+Pgo+PiAgICAgICBuYW5kQDAsMCB7Cj4+ICAgICAgICAg
Y29tcGF0aWJsZSA9ICJ0aSxvbWFwMi1uYW5kIjsKPj4gICAgICAgICByZWcgPSA8MCAwIDQ+OyAg
ICAgICAgICAvKiBkZXZpY2UgSU8gcmVnaXN0ZXJzICovCj4+ICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3BtYz47Cj4+ICAgICAgICAgaW50ZXJydXB0cyA9IDwwIElSUV9UWVBFX05PTkU+
LCAvKiBmaWZvZXZlbnQgKi8KPj4gICAgICAgICAgICAgICAgICAgICAgPDEgSVJRX1RZUEVfTk9O
RT47IC8qIHRlcm1jb3VudCAqLwo+PiAgICAgICAgIHRpLG5hbmQteGZlci10eXBlID0gInByZWZl
dGNoLWRtYSI7Cj4+ICAgICAgICAgdGksbmFuZC1lY2Mtb3B0ID0gImJjaDE2IjsKPj4gICAgICAg
ICB0aSxlbG0taWQgPSA8JmVsbT47Cj4+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4+Cj4+ICAgICAgICAgLyogTkFORCBnZW5lcmlj
IHByb3BlcnRpZXMgKi8KPj4gICAgICAgICBuYW5kLWJ1cy13aWR0aCA9IDw4PjsKPj4gICAgICAg
ICByYi1ncGlvcyA9IDwmZ3BtYyAwIEdQSU9fQUNUSVZFX0hJR0g+OyAgLyogZ3BtY193YWl0MCAq
Lwo+Pgo+PiAgICAgICAgIC8qIEdQTUMgcHJvcGVydGllcyovCj4+ICAgICAgICAgZ3BtYyxkZXZp
Y2Utd2lkdGggPSA8MT47Cj4+Cj4+ICAgICAgICAgcGFydGl0aW9uQDAgewo+PiAgICAgICAgICAg
bGFiZWwgPSAiTkFORC5TUEwiOwo+PiAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMDA0
MDAwMD47Cj4+ICAgICAgICAgfTsKPj4gICAgICAgICBwYXJ0aXRpb25AMSB7Cj4+ICAgICAgICAg
ICBsYWJlbCA9ICJOQU5ELlNQTC5iYWNrdXAxIjsKPj4gICAgICAgICAgIHJlZyA9IDwweDAwMDQw
MDAwIDB4MDAwNDAwMDA+Owo+PiAgICAgICAgIH07Cj4+ICAgICAgIH07Cj4+Cj4+Cj4+IG5hbmQt
Y29udHJvbGxlciBleGFtcGxlOgo+Pgo+PiAgICAgbmFuZC1jb250cm9sbGVyIHsKPj4gICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+PiAgICAg
ICBjcy1ncGlvcyA9IDwwPiwgPCZncGlvQSAxPjsgLyogQSBzaW5nbGUgbmF0aXZlIENTIGlzIGF2
YWlsYWJsZSAqLwo+Pgo+PiAgICAgICAvKiBjb250cm9sbGVyIHNwZWNpZmljIHByb3BlcnRpZXMg
Ki8KPj4KPj4gICAgICAgbmFuZEAwIHsKPj4gICAgICAgICByZWcgPSA8MD47IC8qIE5hdGl2ZSBD
UyAqLwo+PiAgICAgICAgIG5hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZTsKPj4gICAgICAgICBuYW5k
LWVjYy1hbGdvID0gImJjaCI7Cj4+Cj4+ICAgICAgICAgLyogY29udHJvbGxlciBzcGVjaWZpYyBw
cm9wZXJ0aWVzICovCj4+ICAgICAgIH07Cj4+Cj4+ICAgICAgIG5hbmRAMSB7Cj4+ICAgICAgICAg
cmVnID0gPDE+OyAvKiBHUElPIENTICovCj4+ICAgICAgIH07Cj4+ICAgICB9Owo+Pgo+Pgo+Pj4K
Pj4+IFdoaWxlIGF0IGl0IHlvdSBtaWdodCBhbHNvIHdhbnQgdG8gZHJvcCB0aGUgcmItZ3Bpb3Mg
cHJvcGVydHkgZnJvbQo+Pj4gaW5nZW5pYyxuYW5kLnlhbWwsIHdoaWNoIGFsc28gZGVmaW5lcyBp
dCBhIHNlY29uZCB0aW1lLgo+Pj4gICAKPj4+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPj4+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5v
ZC5hdD4KPj4+PiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+Pj4+
IENjOiBUb255IExpbmRncmVuIDx0b255QGF0b21pZGUuY29tPgo+Pj4+IENjOiBSb2dlciBRdWFk
cm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPj4+PiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+
Pj4+IC0tLQo+Pj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGdw
bWMtbmFuZC55YW1sIHwgNSArKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC90aSxncG1jLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwKPj4+PiBpbmRleCBiZWIyNmI5YmNmYjIuLjFjMjgw
ZjUyYmFhMCAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbAo+Pj4+IEBAIC01Myw2ICs1MywxMSBA
QCBwcm9wZXJ0aWVzOgo+Pj4+ICAgICAgZW51bTogWzgsIDE2XQo+Pj4+ICAgICAgZGVmYXVsdDog
OAo+Pj4+ICAKPj4+PiArICByYi1ncGlvczoKPj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4+ICsg
ICAgICBHUElPIGNvbm5lY3Rpb24gdG8gUi9CIHNpZ25hbCBmcm9tIE5BTkQgY2hpcAo+Pj4+ICsg
ICAgbWF4SXRlbXM6IDEKPj4+PiArCj4+Pj4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4+ICAgICJA
WzAtOWEtZl0rJCI6Cj4+Pj4gICAgICAkcmVmOiAiL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvcGFy
dGl0aW9uLnlhbWwiICAKPj4+Cj4+PiBUaGFua3MsCj4+PiBNaXF1w6hsCj4+PiAgIAo+Pgo+PiBj
aGVlcnMsCj4+IC1yb2dlcgo+Pgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
