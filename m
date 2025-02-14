Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE9EC021A6
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbDGQW0EWJBT9wl+Hzyg83xVVnPGZZwzPi4MkH7pxsE=; b=MdOBG3ibHBfp95
	nTT6j4BoSdPw0zJ2LjtkIHzc+7kdcLlTjRUDflYAMFCfen9dv8+mqhLUTOlVm1nB7n/PSAtbv3jL4
	FO0TV18WA4CgN2sLEqFOFkLhsNuVMfcFhDaH9UDOWGMPdqXbrh1GFFerW3ERSMVwhm9cmHlPf1CLK
	6BbjINq+mM41/AJXd8bRNKe0ObjvQIROrAkSUFdm0cVPcfnimbUWnflpDCrHr1+vF7BsuIUxscHIU
	0pUX+2nOspr1G6GTToWYu+RGe3OvC/pc4RztQ575hrkRVQeftPt5CP80KkF5YvkoY7hJZ0uODFWjV
	RBm5YKuR37tg+E7fcX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuvG-0000000Eqhn-2uvc;
	Fri, 14 Feb 2025 12:35:58 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuvC-0000000Eqh9-1srr
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 12:35:56 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 4503D240027
	for <linux-mtd@lists.infradead.org>; Fri, 14 Feb 2025 13:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739536550; bh=DhdTMX1B/VBmrfjg4gCD28dH1z0ZeJtuCVVqdYJtLzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=GPFoCbPMdVQTIokjgL474jofn1bmBFscmSoe8+kxWm5ko43fhMHtoJPqN2d9BIlXA
	 dwHbP/kKZO9sJvqO6HVDajQNNQfx+akrH829Wf+wle4YXXiIpEmGGBjZllq8isQIhG
	 9kT8097Rx9EkU5r3oG8wECEu51TaV1ElDAbMrn6BGm+NKWOci+4vgipWP0Krzpuojb
	 d/qJ2NJEOXHLyg+vmBc72wvWhI0SG8h1wuwO21Lxsc4vJ00/3Usj/XftI/L63HBDaK
	 kezRT9NGqPebT3yNBbINZOUu2f5wZHA7xI21Rp55wodaW11/AqqsqycjHtqd+N3VMa
	 ATrufniylyoZg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YvWjq1cxCz9rxG;
	Fri, 14 Feb 2025 13:35:41 +0100 (CET)
Date: Fri, 14 Feb 2025 12:35:41 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Frank Li <Frank.li@nxp.com>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v2 05/12] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-ID: <Z684nUnDX4Sb98rQ@probook>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-5-8137b0c42526@posteo.net>
 <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6pV4eauZj75+911@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_043554_793734_1C21AABB 
X-CRM114-Status: GOOD (  25.82  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDI6Mzk6MTNQTSAtMDUwMCwgRnJhbmsgTGkgd3JvdGU6
Cj4gT24gRnJpLCBGZWIgMDcsIDIwMjUgYXQgMTA6MzA6MjJQTSArMDEwMCwgSi4gTmV1c2Now6Rm
ZXIgdmlhIEI0IFJlbGF5IHdyb3RlOgo+ID4gRnJvbTogIkouIE5ldXNjaMOkZmVyIiA8ai5uZUBw
b3N0ZW8ubmV0Pgo+ID4KPiA+IFRoZSBkZXZpY2V0cmVlIGJpbmRpbmdzIGZvciBGcmVlc2NhbGUg
RE1BIGVuZ2luZXMgaGF2ZSBzbyBmYXIgZXhpc3RlZCBhcwo+ID4gYSB0ZXh0IGZpbGUuIFRoaXMg
cGF0Y2ggY29udmVydHMgdGhlbSB0byBZQU1MLCBhbmQgc3BlY2lmaWVzIGFsbCB0aGUKPiA+IGNv
bXBhdGlibGUgc3RyaW5ncyBjdXJyZW50bHkgaW4gdXNlIGluIGFyY2gvcG93ZXJwYy9ib290L2R0
cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0
Pgo+ID4gLS0tCj4gPgo+ID4gVjI6Cj4gPiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBtdWx0aWxpbmUg
bWFya2Vycwo+ID4gLSBmaXggYWRkaXRpb25hbFByb3BlcnRpZXMgdG8gYWx3YXlzIGJlIGZhbHNl
Cj4gPiAtIGFkZCBkZXNjcmlwdGlvbi9tYXhJdGVtcyB0byBpbnRlcnJ1cHRzCj4gPiAtIGFkZCBt
aXNzaW5nICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIHByb3BlcnRpZXMKPiA+IC0gY29udmVy
dCAiTm90ZSBvbiBETUEgY2hhbm5lbCBjb21wYXRpYmxlIHByb3BlcnRpZXMiIHRvIFlBTUwgYnkg
bGlzdGluZwo+ID4gICBmc2wsc3NpLWRtYS1jaGFubmVsIGFzIGEgdmFsaWQgY29tcGF0aWJsZSB2
YWx1ZQo+ID4gLSBmaXggcHJvcGVydHkgb3JkZXJpbmcgaW4gZXhhbXBsZXM6IGNvbXBhdGlibGUg
YW5kIHJlZyBjb21lIGZpcnN0Cj4gPiAtIGFkZCBtaXNzaW5nIG5ld2xpbmVzIGluIGV4YW1wbGVz
Cj4gPiAtIHRyaW0gc3ViamVjdCBsaW5lIChyZW1vdmUgImJpbmRpbmdzIikKPiA+IC0tLQo+ID4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9mc2wsZWxvLWRtYS55YW1sICAgICAgIHwgMTQw
ICsrKysrKysrKysrKysrCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2ZzbCxlbG8z
LWRtYS55YW1sICAgICAgfCAxMjMgKysrKysrKysrKysrKwo+ID4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RtYS9mc2wsZWxvcGx1cy1kbWEueWFtbCAgIHwgMTM0ICsrKysrKysrKysrKysrCj4g
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9mc2wvZG1hLnR4dCAgICAgICAgfCAy
MDQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzOTcgaW5zZXJ0
aW9ucygrKSwgMjA0IGRlbGV0aW9ucygtKQpbLi4uXQo+ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJ
dGVtczogMQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBETUEgR2VuZXJhbCBTdGF0
dXMgUmVnaXN0ZXIsIGkuZS4gREdTUiB3aGljaCBjb250YWlucyBzdGF0dXMgZm9yCj4gPiArICAg
ICAgYWxsIHRoZSA0IERNQSBjaGFubmVscy4KPiAKPiBuZWVkbid0IG1heEl0ZW1zCj4gaXRlbXM6
Cj4gICAtIGRlc2NyaXB0aW9uOiBETUEgLi4uCgpHb29kIHBvaW50LCBJJ2xsIGRvIHRoYXQuCgo+
IAo+ID4gKwo+ID4gKyAgY2VsbC1pbmRleDoKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlc2NyaXB0aW9uOiBDb250cm9sbGVy
IGluZGV4LiAwIGZvciBjb250cm9sbGVyIEAgMHg4MTAwLgo+ID4gKwo+ID4gKyAgcmFuZ2VzOiB0
cnVlCj4gPiArCj4gPiArICAiI2FkZHJlc3MtY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMQo+ID4g
Kwo+ID4gKyAgIiNzaXplLWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+ICsKPiA+ICsgIGlu
dGVycnVwdHM6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArICAgIGRlc2NyaXB0aW9uOiBDb250
cm9sbGVyIGludGVycnVwdC4KPiAKPiBOZWVkbid0IGRlc2NyaXB0aW9uIGJlY2F1c2Ugbm8gYW55
IGFkZGl0aW9uYWwgaW5mb3JtYWl0b24uCgpUcnVlLgoKPiAKPiA+ICsKPiA+ICtyZXF1aXJlZDoK
PiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKWy4uLl0KPiA+ICthZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UKPiAKPiBOZWVkIHJlZiB0byBkbWEtY29tbW9uLnlhbWw/CgpTb3VuZHMg
Z29vZCwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIGFib3V0IHRoZSAjZG1hLWNlbGxzIHBy
b3BlcnR5LAp3aGljaCBpcyByZXF1aXJlZCBieSBkbWEtY29tbW9uLnlhbWwuCgpUaGVyZSBhcmVu
J3QgbWFueSBleGFtcGxlcyBvZiBETUEgY2hhbm5lbHMgYmVpbmcgZXhwbGljaXRseSBkZWNsYXJl
ZCBpbgpkZXZpY2UgdHJlZXMuIE9uZSBleGFtcGxlIHRoYXQgSSBjb3VsZCBmaW5kIGlzIHRoZSB0
aGUgeGlsaW54X2RtYS50eHQKYmluZGluZzoKCgoJYXhpX3ZkbWFfMDogYXhpdmRtYUA0MDAzMDAw
MCB7CgkJY29tcGF0aWJsZSA9ICJ4bG54LGF4aS12ZG1hLTEuMDAuYSI7CgkJI2RtYV9jZWxscyA9
IDwxPjsKCQlyZWcgPSA8IDB4NDAwMzAwMDAgMHgxMDAwMCA+OwoJCWRtYS1yYW5nZXMgPSA8MHgw
MDAwMDAwMCAweDAwMDAwMDAwIDB4NDAwMDAwMDA+OwoJCXhsbngsbnVtLWZzdG9yZXMgPSA8MHg4
PjsKCQl4bG54LGZsdXNoLWZzeW5jID0gPDB4MT47CgkJeGxueCxhZGRyd2lkdGggPSA8MHgyMD47
CgkJY2xvY2tzID0gPCZjbGsgMD4sIDwmY2xrIDE+LCA8JmNsayAyPiwgPCZjbGsgMz4sIDwmY2xr
IDQ+OwoJCWNsb2NrLW5hbWVzID0gInNfYXhpX2xpdGVfYWNsayIsICJtX2F4aV9tbTJzX2FjbGsi
LCAibV9heGlfczJtbV9hY2xrIiwKCQkJICAgICAgIm1fYXhpc19tbTJzX2FjbGsiLCAic19heGlz
X3MybW1fYWNsayI7CgkJZG1hLWNoYW5uZWxANDAwMzAwMDAgewoJCQljb21wYXRpYmxlID0gInhs
bngsYXhpLXZkbWEtbW0ycy1jaGFubmVsIjsKCQkJaW50ZXJydXB0cyA9IDwgMCA1NCA0ID47CgkJ
CXhsbngsZGF0YXdpZHRoID0gPDB4NDA+OwoJCX07CgkJZG1hLWNoYW5uZWxANDAwMzAwMzAgewoJ
CQljb21wYXRpYmxlID0gInhsbngsYXhpLXZkbWEtczJtbS1jaGFubmVsIjsKCQkJaW50ZXJydXB0
cyA9IDwgMCA1MyA0ID47CgkJCXhsbngsZGF0YXdpZHRoID0gPDB4NDA+OwoJCX07Cgl9OwoKCS4u
LgoKCXZkbWF0ZXN0XzA6IHZkbWF0ZXN0QDAgewoJCWNvbXBhdGlibGUgPSJ4bG54LGF4aS12ZG1h
LXRlc3QtMS4wMC5hIjsKCQlkbWFzID0gPCZheGlfdmRtYV8wIDAKCQkJJmF4aV92ZG1hXzAgMT47
CgkJZG1hLW5hbWVzID0gInZkbWEwIiwgInZkbWExIjsKCX07CgpJdCBoYXMgI2RtYV9jZWxscyAo
SSdtIHN1cmUgI2RtYS1jZWxscyB3YXMgaW50ZW5kZWQpIG9uIHRoZSBjb250cm9sbGVyLgoKCkFu
b3RoZXIgZXhhbXBsZSBpcyBpbiBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL3AxMDIyc2ktcG9z
dC5kdHNpOgoKCWRtYUBjMzAwIHsKCQlkbWEwMDogZG1hLWNoYW5uZWxAMCB7CgkJCWNvbXBhdGli
bGUgPSAiZnNsLHNzaS1kbWEtY2hhbm5lbCI7CgkJfTsKCQlkbWEwMTogZG1hLWNoYW5uZWxAODAg
ewoJCQljb21wYXRpYmxlID0gImZzbCxzc2ktZG1hLWNoYW5uZWwiOwoJCX07Cgl9OwoKCS4uLgoK
CXNzaUAxNTAwMCB7CgkJY29tcGF0aWJsZSA9ICJmc2wsbXBjODYxMC1zc2kiOwoJCWNlbGwtaW5k
ZXggPSA8MD47CgkJcmVnID0gPDB4MTUwMDAgMHgxMDA+OwoJCWludGVycnVwdHMgPSA8NzUgMiAw
IDA+OwoJCWZzbCxwbGF5YmFjay1kbWEgPSA8JmRtYTAwPjsKCQlmc2wsY2FwdHVyZS1kbWEgPSA8
JmRtYTAxPjsKCQlmc2wsZmlmby1kZXB0aCA9IDwxNT47Cgl9OwoKClRoZXJlLCB0aGUgRE1BIGNo
YW5uZWxzIGFyZSB1c2VkIGRpcmVjdGx5IGFuZCB3aXRob3V0IGFkZGl0aW9uYWwKaW5mb3JtYXRp
b24gKGkuZS4gI2RtYS1jZWxscyA9IDwwPiwgYWx0aG91Z2h0IGl0IGlzbid0IHNwZWNpZmllZCku
CgoKPiA+ICsgICAgICAgIGRtYS1jaGFubmVsQDAgewo+ID4gKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLG1wYzgzNDktZG1hLWNoYW5uZWwiLCAiZnNsLGVsby1kbWEtY2hhbm5lbCI7Cj4g
PiArICAgICAgICAgICAgcmVnID0gPDAgMHg4MD47Cj4gPiArICAgICAgICAgICAgY2VsbC1pbmRl
eCA9IDwwPjsKPiA+ICsgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpcGljPjsKPiA+
ICsgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDcxIDg+Owo+IAo+ICc4JywgIHVzZSBwcmVkZWZp
bmUgTUFDUk8gZm9yIGlycSB0eXBlLgoKR29vZCBjYXRjaCwgd2lsbCBkbwoKPiAKPiBGcmFuawoK
VGhhbmtzIGZvciB5b3VyIHJldmlldyEKSi4gTmV1c2Now6RmZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
