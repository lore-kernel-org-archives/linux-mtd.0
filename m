Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63905C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv0MyXxd81BjUeDzn64fuQUXkudhGKAotfbWvpcmQdU=; b=fLuox7WD9wpenr
	IqZ79pKFKdRcRkzCqbcGZsXnUHaGhqVK6xTso0Yec+Nodsr2L0TvjQL8SSAXFoiq5AdmbgPquGgAM
	4ir3/JOijOO9jaM+JqSfEAH7Kn4u6wx6XDhSTv14cWHi1Q/xI/vuFdKxTho2r+4q+qCIZVZGz2xY8
	gX2arD26DvKGR6LnHJtbgjBwHg4CcLqIfBJlzdQ7/E7iXOO2WR+FBK2BmwvYOSnPbWaBnSiV/TwXa
	Ho9TAYz14g0UW3WvoCPzT46IsioZpet455lf2T4Gwv7Vv2oukmnS3TJ7bvUS0ZU4awows83uqcodG
	jvuAgc90b48PhIecEyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQlj-00000001dp3-3fQo;
	Tue, 04 Feb 2025 21:47:43 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQlS-00000001dhh-2Ff8
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 21:47:28 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 53772240027
	for <linux-mtd@lists.infradead.org>; Tue,  4 Feb 2025 22:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738705642; bh=hqFrHw4SuAtLqJ59fD6Qavu3B1gXposiTbudKR0gwzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=jaEcfrYbOJbTc2AMNkt0h53zwcEL6kRQTw/yJJ6sjXPEpDEKOwGO+mPYrpp6qDzNc
	 4cMIRHI1G2P7e7+NpEKlB1mTKjszrFxX4ivMAfS78L+lUSbuyKQg0semR16bh8NRAJ
	 a5Kt/hIajsgsaEL/wNBZbYUvDz4MnLkqJQ1kgb4AsfmJjsAC20hib8bmGU+JJR1stB
	 RsfBmswcDRsDUeIkmyq5gNlcCFnRjvPSIldMy10ax0aYxRZB7OvudcN5I4YcNzvJRG
	 DhhvJoBH7BEEkDMwLCVhCFDxeUT+c/rgL+isGnvYmnk5i/7ziirkFJywwXDWHi0gZv
	 wHFVGfso8GdAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YncQq5Wc6z9rxG;
	Tue,  4 Feb 2025 22:47:14 +0100 (CET)
Date: Tue,  4 Feb 2025 21:47:14 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/9] dt-bindings: dma: Convert fsl,elo*-dma bindings to
 YAML
Message-ID: <Z6KK4vLsFVxMS9pS@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-5-50649f51c3dd@posteo.net>
 <Z5qxLxa7z22Fk+Dv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5qxLxa7z22Fk+Dv@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_134726_869276_E830A343 
X-CRM114-Status: GOOD (  31.35  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDU6NTI6MzFQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDBQTSArMDEwMCwgSi4gTmV1c2Now6Rm
ZXIgd3JvdGU6Cj4gPiBUaGUgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgRnJlZXNjYWxlIERNQSBl
bmdpbmVzIGhhdmUgc28gZmFyIGV4aXN0ZWQgYXMKPiA+IGEgdGV4dCBmaWxlLiBUaGlzIHBhdGNo
IGNvbnZlcnRzIHRoZW0gdG8gWUFNTCwgYW5kIHNwZWNpZmllcyBhbGwgdGhlCj4gPiBjb21wYXRp
YmxlIHN0cmluZ3MgY3VycmVudGx5IGluIHVzZSBpbiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+
IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRtYS55YW1sICAg
ICAgIHwgMTI5ICsrKysrKysrKysrKysKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEv
ZnNsLGVsbzMtZG1hLnlhbWwgICAgICB8IDEwNSArKysrKysrKysrKwo+ID4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvcGx1cy1kbWEueWFtbCAgIHwgMTIwICsrKysrKysrKysr
Kwo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvZnNsL2RtYS50eHQgICAgICAg
IHwgMjA0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMzU0IGlu
c2VydGlvbnMoKyksIDIwNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRtYS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRtYS55YW1sCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMC4uZDFmNDk3OGE2NzJjMTIxN2MzMjJjMjdmMjQzNDcwYjJkZThjOTlkNAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9mc2wsZWxvLWRtYS55YW1sCj4gPiBAQCAtMCwwICsxLDEyOSBAQAo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZ
QU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
ZG1hL2ZzbCxlbG8tZG1hLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IEZyZWVzY2FsZSBFbG8g
RE1BIENvbnRyb2xsZXIKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gSi4gTmV1c2No
w6RmZXIgPGoubmVAcG9zdGVvLm5ldD4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+IAo+IG5l
ZWRuJ3QgfCBoZXJlCgpXaWxsIHJlbW92ZS4KCj4gCj4gPiArICBUaGlzIGlzIGEgbGl0dGxlLWVu
ZGlhbiA0LWNoYW5uZWwgRE1BIGNvbnRyb2xsZXIsIHVzZWQgaW4gRnJlZXNjYWxlIG1wYzgzeHgK
PiA+ICsgIHNlcmllcyBjaGlwcyBzdWNoIGFzIG1wYzgzMTUsIG1wYzgzNDksIG1wYzgzNzkgZXRj
Lgo+ID4gKwo+ID4gKyAgTm90ZSBvbiBETUEgY2hhbm5lbCBjb21wYXRpYmxlIHByb3BlcnRpZXM6
IFRoZSBjb21wYXRpYmxlIHByb3BlcnR5IG11c3Qgc2F5Cj4gPiArICAiZnNsLGVsby1kbWEtY2hh
bm5lbCIgb3IgImZzbCxlbG9wbHVzLWRtYS1jaGFubmVsIiB0byBiZSB1c2VkIGJ5IHRoZSBFbG8g
RE1BCj4gCj4gVGhlcmUgYXJlIG5vdCAnZnNsLGVsb3BsdXMtZG1hLWNoYW5uZWwnIHVuZGVyICJe
ZG1hLWNoYW5uZWxALiokIi4gSSBzdWdnZXN0Cj4gcmVtb3ZlIHRoaXMgYmVjYXVzZSAnY29tcGF0
aWJsZSc6IGl0ZW1zIGFscmVhZHkgc2hvdyBzdWNoIGluZm9ybWF0aW9uLgoKR29vZCBwb2ludCwg
SSdsbCB0cmltIHRoaXMgdGV4dCBkb3duLgoKPiA+ICsgIGRyaXZlciAoZnNsZG1hKS4gIEFueSBE
TUEgY2hhbm5lbCB1c2VkIGJ5IGZzbGRtYSBjYW5ub3QgYmUgdXNlZCBieSBhbm90aGVyCj4gPiAr
ICBETUEgZHJpdmVyLCBzdWNoIGFzIHRoZSBTU0kgc291bmQgZHJpdmVycyBmb3IgdGhlIE1QQzg2
MTAuICBUaGVyZWZvcmUsIGFueQo+ID4gKyAgRE1BIGNoYW5uZWwgdGhhdCBzaG91bGQgYmUgdXNl
ZCBmb3IgYW5vdGhlciBkcml2ZXIgc2hvdWxkIG5vdCB1c2UKPiA+ICsgICJmc2wsZWxvLWRtYS1j
aGFubmVsIiBvciAiZnNsLGVsb3BsdXMtZG1hLWNoYW5uZWwiLiAgRm9yIHRoZSBTU0kgZHJpdmVy
cywgZm9yCj4gPiArICBleGFtcGxlLCB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBzaG91bGQgYmUg
ImZzbCxzc2ktZG1hLWNoYW5uZWwiLiAgU2VlCj4gPiArICBzc2kudHh0IGZvciBtb3JlIGluZm9y
bWF0aW9uLgoKSSBub3RpY2VkIGZzbCxzc2kudHh0IGhhcyBiZWVuIGNvbnZlcnRlZCB0byBZQU1M
IHNpbmNlIHRoaXMgdGV4dCB3YXMKb3JpZ2luYWxseSB3cml0dGVuLCBzbyBJJ2xsIG1ha2UgcmVm
ZXJlbmNlIHRvIHRoYXQuCgpbLi4uXQo+ID4gK2V4YW1wbGVzOgo+ID4gKyAgLSB8Cj4gPiArICAg
IGRtYUA4MmE4IHsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4
MzQ5LWRtYSIsICJmc2wsZWxvLWRtYSI7Cj4gPiArICAgICAgICByZWcgPSA8MHg4MmE4IDQ+Owo+
IAo+IGNvbXBhdGlibGUgYW5kIHJlZyBzaG91bGQgYmUgZmlyc3QgdHdvIHByb3BlcnR5LgoKV2ls
bCBmaXguCgo+IAo+ID4gKyAgICAgICAgcmFuZ2VzID0gPDAgMHg4MTAwIDB4MWE0PjsKPiA+ICsg
ICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmlwaWM+Owo+ID4gKyAgICAgICAgaW50ZXJydXB0
cyA9IDw3MSA4PjsKPiA+ICsgICAgICAgIGNlbGwtaW5kZXggPSA8MD47Cj4gCj4gbmVlZCBzcGFj
ZSBsaW5lIGhlcmUuCgpXaWxsIGZpeC4KCj4gPiArICAgICAgICBkbWEtY2hhbm5lbEAwIHsKPiA+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxtcGM4MzQ5LWRtYS1jaGFubmVsIiwgImZz
bCxlbG8tZG1hLWNoYW5uZWwiOwo+ID4gKyAgICAgICAgICAgIGNlbGwtaW5kZXggPSA8MD47Cj4g
PiArICAgICAgICAgICAgcmVnID0gPDAgMHg4MD47Cj4gPiArICAgICAgICAgICAgaW50ZXJydXB0
LXBhcmVudCA9IDwmaXBpYz47Cj4gPiArICAgICAgICAgICAgaW50ZXJydXB0cyA9IDw3MSA4PjsK
PiA+ICsgICAgICAgIH07Cj4gCj4gbmVlZCBzcGFjZSBsaW5lIGhlcmUuIGNoZWNrIG90aGVyJ3Mg
ZXhhbXBsZSBkdHMKCldpbGwgZml4IGluIGFsbCBmaWxlcy4KCgpbLi4uXQo+ID4gK3BhdHRlcm5Q
cm9wZXJ0aWVzOgo+ID4gKyAgIl5kbWEtY2hhbm5lbEAuKiQiOgo+ID4gKyAgICB0eXBlOiBvYmpl
Y3QKPiA+ICsKPiA+ICsgICAgcHJvcGVydGllczoKPiA+ICsgICAgICBjb21wYXRpYmxlOgo+ID4g
KyAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZW51bToKPiA+ICsgICAgICAgICAgICAg
IC0gZnNsLG1wYzg1NDAtZG1hLWNoYW5uZWwKPiA+ICsgICAgICAgICAgICAgIC0gZnNsLG1wYzg1
NDEtZG1hLWNoYW5uZWwKPiA+ICsgICAgICAgICAgICAgIC0gZnNsLG1wYzg1NDgtZG1hLWNoYW5u
ZWwKPiA+ICsgICAgICAgICAgICAgIC0gZnNsLG1wYzg1NTUtZG1hLWNoYW5uZWwKPiA+ICsgICAg
ICAgICAgICAgIC0gZnNsLG1wYzg1NjAtZG1hLWNoYW5uZWwKPiA+ICsgICAgICAgICAgICAgIC0g
ZnNsLG1wYzg1NzItZG1hLWNoYW5uZWwKPiA+ICsgICAgICAgICAgLSBjb25zdDogZnNsLGVsb3Bs
dXMtZG1hLWNoYW5uZWwKPiAKPiBJIHRoaW5rIHlvdSBjYW4gbWVyZ2UgdGhpcyBmc2wsbXBjODN4
eC1kbWEgeWFtbCBmaWxlCj4gCj4gK2FsbE9mOgo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRp
ZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToKPiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAg
ICAgICAgICBjb25zdDogZnNsLGVsby1kbWEKPiArICAgIHRoZW46Cj4gKyAgICAgIHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+ICsgICAgICAgICJeZG1hLWNoYW5uZWxALiokIjoKPiArICAgICAgICAgIHBy
b3BlcnRpZXM6Cj4gKyAgICAgICAgICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgICAgICAgICAgaXRl
bXM6Cj4gKyAgICAgICAgICAgICAgICAtIGVudW06Cj4gCQkJLi4uLgo+ICsgICAgZWxzZQo+ICsg
ICAgICBwYXR0ZXJuUHJvcGVydGllczoKPiArICAgICAgICAiXmRtYS1jaGFubmVsQC4qJCI6Cj4g
KyAgICAgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAg
ICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAgICAgICAgLSBlbnVtOgo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIC4uLi4KPiArICAgICAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxlbG9wbHVz
LWRtYS1jaGFubmVsCgpJIHN1cHBvc2UgdGhhdCB3b3JrcywgYnV0IEknbSBub3QgZW50aXJlbHkg
Y29udmluY2VkIGl0IHdvdWxkIGhlbHAgd2l0aApyZWFkYWJpbGl0eSwgY29tcGFyZWQgdG8gbGVh
dmluZyB0aGUgdGhyZWUgdmFyaWFudHMgc2VwYXJhdGUuCgoKVGhhbmsgeW91IGZvciB5b3VyIHJl
dmlldyEKCkJlc3QgcmVnYXJkcywKSi4gTmV1c2Now6RmZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
