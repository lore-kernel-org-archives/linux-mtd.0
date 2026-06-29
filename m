Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490DDC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdO/45uvp6zYn0hOmY6q5IjIV7BptKb+YF/eGedPrew=; b=trDN8ix7vnQft8
	Z2Zh9DlK4at7b8NZc+nhXD4KB26eRiRvCjJ1bFOm9qt2W7BpojZpKUwf1CY9EOPMdEEkjT3y04Hz3
	iD8RjemfIa7SU3WhmcC2uf/9+exa3GDu3DDhADVkEBPqfAkRMweZQb/NUAikdUHJaF80mqGPr5aZk
	/Q6yUrm6RLHLALnROfczNYbHsrM5Fn0US3PGRdjCTs4QUpB3p9gSwN8zjYKPfjRIPKJvaEEU5NZMP
	yTM0yAOt419fNHmGJF6q3xhmjSxCbcAmn3pQq/4tGo0a4218J0CtLF9OUT7lEPjvq1V/0HLXquhRp
	oSSMlY/+2eLi+rpWQoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEAk-0000000F6wP-3oL9;
	Mon, 29 Jun 2026 15:45:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEAk-0000000F6wD-0S3T
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:45:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D3E460008;
	Mon, 29 Jun 2026 15:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BFC1F000E9;
	Mon, 29 Jun 2026 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782747921;
	bh=vUIFi6oudLCwT4rsTkfdI/glAxPAzH10yX5pTbq+zV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WDwlNTr7dZjZgkqL2S0xDaDpkCEENvmi0mYeO5SfxCJ7ufeO3XRdoDE12NgSd3qTs
	 NC0eLVPWhnj90ach2EZxNnEDPds34qoYr31GZPco5ba46j9w1gi+DpKB4oQZ73eF9S
	 C8zXEa77iCERl/frZZvmzD/cKG27XZ8rX3HufwU5ZI91LyQPgf5SKx1o3uJ/vbVLZ0
	 amwbnu/dI4hDSjhzQut6meiCM449sL5KQCl970ml7G0MQ3oLygUwSloQmOVeCjnATB
	 CqHkgxDc1wv4h+OC6x4tO/WCJ4/ANIHjCUXw21Nu51tAwFLTXPtA6UT3AltlyIyUMB
	 o4WQweggBJmuQ==
Date: Mon, 29 Jun 2026 17:45:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <qkvokgxb425epxujnp3v7sha3ibxqpj6wnzvr32t4t24x6mzv5@zxje3qu4w64z>
References: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
 <20260609-quirky-rat-of-criticism-aea1fe@quoll>
 <87mrx4b164.fsf@bootlin.com>
 <aifKejyF7n6QsI9h@linaro.org>
 <a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
 <35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
 <aifX80IHM8TLQiV7@linaro.org>
 <87o6hk9i29.fsf@bootlin.com>
 <aifktn_s2qmg7MzI@linaro.org>
 <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
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

T24gV2VkLCBKdW4gMTcsIDIwMjYgYXQgMDE6NDI6NDRQTSArMDIwMCwgS29ucmFkIER5YmNpbyB3
cm90ZToKPiBPbiA2LzkvMjYgMTI6MDIgUE0sIFN0ZXBoYW4gR2VyaG9sZCB3cm90ZToKPiA+IE9u
IFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDExOjMwOjU0QU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3Jv
dGU6Cj4gPj4gT24gMDkvMDYvMjAyNiBhdCAxMTowODowMyArMDIsIFN0ZXBoYW4gR2VyaG9sZCA8
c3RlcGhhbi5nZXJob2xkQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4+IE9uIFR1ZSwgSnVu
IDA5LCAyMDI2IGF0IDExOjAxOjE4QU0gKzAyMDAsIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4gPj4+
PiBPbiA2LzkvMjYgMTA6NTUgQU0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4gPj4+Pj4gT24gNi85
LzI2IDEwOjEwIEFNLCBTdGVwaGFuIEdlcmhvbGQgd3JvdGU6Cj4gPj4+Pj4+IE9uIFR1ZSwgSnVu
IDA5LCAyMDI2IGF0IDA5OjUyOjUxQU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPj4+
Pj4+Pj4+IE9uIE1ETTk2MDcsIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgY29udHJvbGxhYmxlIGNs
b2NrIGZvciB0aGUgTkFORAo+ID4+Pj4+Pj4+PiBjb250cm9sbGVyIChSUE1fU01EX1FQSUNfQ0xL
KS4gVGhlIHNhbWUgc2l0dWF0aW9uIGFsc28gYXBwbGllcyBlLmcuIGZvcgo+ID4+Pj4+Pj4+PiBx
Y29tLHNkeDU1LW5hbmQsIGJ1dCB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2UgdHJlZSAocWNvbS1z
ZHg1NS5kdHNpKSB3b3Jrcwo+ID4+Pj4+Pj4+PiBhcm91bmQgdGhhdCBieSBhc3NpZ25pbmcgYSBk
dW1teSBjbG9jayAoJm5hbmRfY2xrX2R1bW15KSB0byB0aGUgc2Vjb25kCj4gPj4+Pj4+Pj4+IGNs
b2NrICgiYW9uIikgdGhhdCBpcyByZXF1aXJlZCBieSB0aGUgZHQtYmluZGluZ3MuIFRoaXMgaXMg
bm90IHJlYWxseQo+ID4+Pj4+Pj4+PiB1c2VmdWwsIHNvIGF2b2lkIGRvaW5nIHRoYXQgZm9yIG5l
dyBwbGF0Zm9ybXMgYnkgZXhjbHVkaW5nIHRoZSBzZWNvbmQgImFvbiIKPiA+Pj4+Pj4+Pj4gY2xv
Y2sgZW50cnkgaW4gdGhlIGR0LWJpbmRpbmdzLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gUmV2aWV3
ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxj
b21tLmNvbT4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIGluIGdpdmlu
ZyB0d2ljZSB0aGUgc2FtZSBjbG9jaz8gSWYgdGhpcyBpcyB3aGF0IGlzCj4gPj4+Pj4+PiBkb25l
IGluIHRoZSBoYXJkd2FyZSByb3V0aW5nLCBJIGRvIG5vdCBzZWUgdGhlIHJlYXNvbiBmb3IgbW9y
ZQo+ID4+Pj4+Pj4gY29tcGxleGl0eSBpbiB0aGUgYmluZGluZz8KPiA+Pj4+Pj4+Cj4gPj4+Pj4+
Cj4gPj4+Pj4+IEkgaGFkIHRoYXQgaW4gbXkgZmlyc3QgZHJhZnQgZm9yIHRoaXMgc2VyaWVzLCBi
dXQgdGhpcyB3b3VsZCBiZSB3cm9uZwo+ID4+Pj4+PiBJTU8uIEkgc3VzcGVjdCB0aGVyZSBpcyBu
byBRUElDL05BTkQgcmVsYXRlZCAiYW9uIiAoYWx3YXlzLW9uKSBjbG9jayBvbgo+ID4+Pj4+PiB0
aGlzIHBsYXRmb3JtIGF0IGFsbC4gSSdtIG5vdCBzdXJlIGFib3V0IE1ETTk2MDcgaW4gcGFydGlj
dWxhciAobWF5YmUKPiA+Pj4+Pj4gc29tZW9uZSBmcm9tIFF1YWxjb21tIGNhbiBjb25maXJtKSwg
YnV0IGEgc2ltaWxhciBwbGF0Zm9ybSBJIHdhcyBsb29raW5nCj4gPj4+Pj4+IGludG8gYXQgc29t
ZSBwb2ludCBhY3R1YWxseSBoYWQgKjMqIHNlcGFyYXRlIGNsb2NrcyBmb3IgUVBJQyBpbiB0aGUK
PiA+Pj4+Pj4gaGFyZHdhcmUgYW5kIG5vbmUgb2YgdGhlbSB3ZXJlIGNhbGxlZCAiYW9uIiAuLi4K
PiA+Pj4+Pgo+ID4+Pj4+IGdjY19xcGljX2FoYl9jbGsgKDUwLzEwMC8xMzMuKDMpIE1IeiBzb3Vy
Y2VkIGZyb20gUENOb0NfYmZkY2RfY2xrX3NyYykKPiA+Pj4+PiBnY2NfcXBpY19jbGsgKGxpa2V3
aXNlLCBzb3VyY2VkIGZyb20gcXBpY19jbGtfc3JjIHdoaWNoIGlzIHNvdXJjZWQKPiA+Pj4+PiBm
cm9tIEdQTExzKQo+ID4+Pj4+IGdjY19xcGljX3N5c3RlbV9jbGsgKDMyIEtIeikKPiA+Pj4+Pgo+
ID4+Pj4+IE5vIGNsb2NrIGNvbnRhaW5pbmcgdGhlIHN1YnN0cmluZyAnYW9uJyBpbiBpdHMgbmFt
ZSBvbiB0aGlzIHBsYXRmb3JtCj4gPj4+Pgo+ID4+Pj4gTG9va2luZyBhdCBTRFg2NSwgcGVyaGFw
cyB0aGUgMzIgS2h6IGNsb2NrIGlzIHRoZSAiYW9uIiBvbmUgYWZ0ZXIgYWxsLi4KPiA+Pj4+IFRo
ZSBOQU5EIGRvY3VtZW50YXRpb24gc2F5cwo+ID4+Pj4KPiA+Pj4+IENDX1FQSUNfU1lTVEVNX0NM
SyAtIEFsd2F5cy1vbiB0aW1lb3V0IGNsb2NrICgzMiBLSHopCj4gPj4+Pgo+ID4+Pgo+ID4+PiBU
aGFua3MgZm9yIGxvb2tpbmcgdGhpcyB1cC4KPiA+Pj4KPiA+Pj4gSU1PLCBpZiB3ZSB3YW50IHRv
IGRlc2NyaWJlIHRoZSBhY3R1YWwgaGFyZHdhcmUgcm91dGluZywgd2Ugc2hvdWxkCj4gPj4+IGRl
c2NyaWJlIGFsbCAzIGNsb2NrcyBhbmQgYXNzaWduIGFsbCBvZiB0aGVtIHRvIFJQTV9TTURfUVBJ
Q19DTEsgZm9yCj4gPj4+IE1ETTk2MDcpLgo+ID4+Cj4gPj4gU291bmRzIG1vcmUgYWNjdXJhdGUg
dG8gbWUuCj4gPj4KPiA+Pj4gVGhlIHJlc3VsdGluZyBkaWZmIHdvdWxkIGJlIGJhc2ljYWxseSB0
aGUgc2FtZSBhcyB0aGlzIHBhdGNoIGp1c3QKPiA+Pj4gaW52ZXJzZWQgKDMgY2xvY2tzIGZvciBN
RE05NjA3K1NEWCg/KSBhbmQgMiBjbG9ja3MgZm9yIHRoZSBJUFEqIFNvQ3MuCj4gPj4KPiA+PiBE
aWZmIHdvdWxkIG5vdCBiZSBzaW1wbGVyIGJ1dCBtb3JlIGFjY3VyYXRlLiBTbyBpZiB3ZSBnbyBm
b3IgYQo+ID4+IG1vZGlmaWNhdGlvbiBvZiB0aGUgYmluZGluZ3MsIEkgd291bGQgcHJlZmVyIHRo
YXQgcGF0aC4KPiA+Pgo+ID4gCj4gPiBJTU8gdGhlIHJlc3VsdCB3b3VsZG4ndCBiZSBtdWNoIG1v
cmUgYWNjdXJhdGUgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YKPiA+IHRoZSBrZXJuZWwuIElmIHdl
IGFzc2lnbiBSUE1fU01EX1FQSUNfQ0xLIHRvIGFsbCAzIGNsb2NrcyB3ZSB3b3VsZCBiZQo+ID4g
ZWZmZWN0aXZlbHkgc2F5aW5nICJ0aGVyZSBpcyBhIHNpbmdsZSBjbG9jayB3aXRoIGEgc2luZ2xl
IHJhdGUgdGhhdCBpcwo+ID4gc291cmNpbmcgJ2NvcmUnLCAnYWhiJyBhbmQgJ3N5c3RlbScoLydh
b24nKSIuIEJ1dCBpbiByZWFsaXR5LCB0aGVzZSBhcmUKPiA+IDMgc2VwYXJhdGUgY2xvY2sgZG9t
YWlucyB3aXRoIHNlcGFyYXRlIHJhdGVzLCBhcyBzaG93biBieSBLb25yYWQgYWJvdmUuCj4gPiAK
PiA+IFdlIGNvdWxkIHRyeSBkZWZpbmluZyBkdW1teSBjbG9ja3MgbGlrZSB0aGUgJm5hbmRfY2xr
X2R1bW15IGluCj4gPiBxY29tLXNkeDU1LmR0c2ksIGJ1dCB0aGlzIGlzbid0IHZlcnkgYWNjdXJh
dGUgZWl0aGVyLiBQcmVzdW1hYmx5LCBhbGwgb2YKPiA+IHRoZXNlIGNsb2NrcyBhcmUgdG9nZ2xl
ZCBieSBSUE1fU01EX1FQSUNfQ0xLLiBTbyBpZiB3ZSBkZWZpbmUgYSBkdW1teQo+ID4gY2xvY2sg
Zm9yICdhaGInLCB0aGVuIGVuYWJsaW5nIHRoYXQgY2xvY2sgd2l0aG91dCBhbHNvIGVuYWJsaW5n
IHRoZQo+ID4gbm9uLWR1bW15ICdjb3JlJyAoUlBNX1NNRF9RUElDX0NMSykgd2lsbCBkbyBub3Ro
aW5nLgo+IAo+IEkgY2FuJ3QgZmluZCBhIGdvb2QgYW5zd2VyIGZvciB3aGF0IFJQTV9TTURfUVBJ
Q19DTEsgY29udHJvbHMsIG1heWJlCj4gK01hbmkgb3IgK0thdGhpcmF2YW4ga25vdyB3aGVyZSB0
byBsb29rCj4gCgpRUElDIGhhcmR3YXJlIGluIHJlY2VudCBTb0NzIHJlcXVpcmVzIDMgY2xvY2tz
IGFzIEtvbnJhZCBkZXNjcmliZWQuIEJ1dCBvbGRlcgpTb0NzIGxpa2UgSVBRODA2NCByZXF1aXJl
IG9ubHkgMiBjbG9ja3M6CgoxLiBRUElDX0FIQl9DTE9DSwoyLiBRUElDX0NMT0NLIC0gQ29yZSBj
bG9jawozLiBRUElDX1NZU1RFTV9DTE9DSyAtIEFPTiBjbG9jawoKVGhlc2UgMyBjbG9ja3MgYXJl
IHN1cHBsaWVkIGJ5IHRoZSBHbG9iYWwgQ2xvY2sgQ29udHJvbGxlciAoR0NDKSwgYnV0IHRoZSBh
Y2Nlc3MKaXMgcmVzdHJpY3RlZCB0byBSUE1oICh0aGUgZW50aXR5IHRoYXQgY29udHJvbHMgdGhl
IHBvd2VyIHRvIHRoZSB3aG9sZSBTb0MpIG9uClNvQ3Mgd2hlcmUgUlBNaCBpcyBhdmFpbGFibGUu
IE9uIG5vbi1SUE1oIFNvQ3MgbGlrZSBJUFE4MDY0LCB0aGVzZSBjbG9ja3MgYXJlCmRpcmVjdGx5
IGNvbnRyb2xsZWQgYnkgdGhlIGtlcm5lbCB2aWEgR0NDLiBCdXQgb24gUlBNaCBTb0NzLCBrZXJu
ZWwgY2Fubm90CmNvbnRyb2wgdGhlc2UgY2xvY2tzIGluZGVwZW5kZW50bHkgYW5kIGl0IGNhbiBv
bmx5IHZvdGUgZm9yIFJQTV9TTURfUVBJQ19DTEssCndoaWNoIGltcGxpY2l0bHkgY29udHJvbHMg
dGhlc2UgMyBjbG9ja3MuCgpTbyBmcm9tIGtlcm5lbCBQb1YsIHRoZXJlIGlzIG9ubHkgb25lIGNs
b2NrLiBJIHRoaW5rIHdlIGNhbiBqdXN0IGNhbGwgaXQgJ0NvcmUKQ2xvY2snIGFzIHBlciB0aGUg
Y3VycmVudCBiaW5kaW5nIGFuZCBkcm9wIHRoZSBBT04gY2xvY2sgZm9yIFNvQ3Mgc3VwcG9ydGlu
ZwpSUE1oLgoKU28gdGhpcyBzZXJpZXMgaXMgZ29vZCBhcy1pcyBJTU8uCgotIE1hbmkKCi0tIArg
rq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
