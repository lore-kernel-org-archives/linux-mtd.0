Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBCCC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OR2n8UWbg2vAioEJ5VMH8RpeDQtgYKfAzWREkfxWzfA=; b=o1CeCpbHbUD+k0
	WSH+/nlBeyod/hsWYwDHOE6YPo3j+FjSPgBRJqSQ+iT+XXFMKLn3phzLUUimohbVOMjjTC82u4+0O
	LZwhAgeM1UObVmaaVQETTp88l1XVNMnn9V5LFN9q8s2Ze3tRGhQ5Bc3AvaVG3Fd6Os7dQ93Iix5eY
	67YqisnlA2oYwI5iS7bQ7rJPeORFu2LtpJH0OSTyUWz5t+0DqeaiiWIXZn5SoSUvhLVUue698rsjl
	q8acIYc7uTWJiVDIl7K3/F2tMhXIQ0c2i5hUJgt6V1vfFJ8FrthgPr9A7h3G/6CzS+dPWPZsICEHP
	1Y04tihRBbXIx1zRXaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx8Nb-007mvA-3L; Fri, 03 Jun 2022 14:34:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx8NX-007mu9-Th
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 14:34:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52EBD617D1;
	Fri,  3 Jun 2022 14:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDC3C385A9;
	Fri,  3 Jun 2022 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654266857;
	bh=3nAELPzfAqOQmMeq44MqN+8FRP1GoZ6OQ7z/q+8F6nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XH0DMFMPOaK4wqwPXozOLeoRU+BC9lC/4jjMf8Ss8jxwAImkqjIqfZy5jOSObMEw3
	 MktfV//vAQ0NbofATGFbRO5O8D3bJG/J06Ainax6o3NAaAEHHLonj5OCDp7DuODnbs
	 1VKxKZ6rChwetbrDOF80MsnQZsG4gGnYnjBOzPzn8GTeEZVj8iX1sTgZRx61sjsFbU
	 IIGG/yCeqP9fDpRIlgv3PPVT5oT9gPYI/gfSE1Nkac3pTOl74HzozkA3u4dSRyoXsw
	 fi76rV1bOrhDcp1TwwVq62G5W0QVSQA5aCuCW+7nEwufMxI3m3AkvRCIdacVXBk6bf
	 SFGf3+R3I32Pw==
Date: Fri, 3 Jun 2022 20:04:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for unprotected spare data page
Message-ID: <20220603143410.GA26696@thinkpad>
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220603154934.521c57ab@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603154934.521c57ab@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_073420_071668_A097D1EE 
X-CRM114-Status: GOOD (  34.53  )
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

T24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDM6NDk6MzRQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSwKPiAKPiBhbnN1ZWxzbXRoQGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDE5IE1h
eSAyMDIyIDIxOjAxOjEwICswMjAwOgo+IAo+ID4gU29tZSBiYWNrZ3JvdW5kIGFib3V0IHRoaXMu
Cj4gPiBPbiBvcmlnaW5hbCBxc2RrIGlwcTgwNjQgYmFzZWQgZmlybXdhcmUgdGhlcmUgd2FzIGEg
YmlnIHNlcGFyYXRpb24gZnJvbQo+ID4gYm9vdCBwYXJ0aXRpb24gYW5kIHVzZXIgcGFydGl0aW9u
LiBXaXRoIGJvb3QgcGFydGl0aW9uIHdlIHJlZmVyIHRvCj4gPiBwYXJ0aXRpb24gdXNlZCB0byBp
bml0IHRoZSByb3V0ZXIgKGJvb3Rsb2FkZXIsIHNwbSBmaXJtd2FyZSBhbmQgb3RoZXIKPiA+IGlu
dGVybmFsIHN0dWZmKSBXaXRoIHVzZXIgcGFydGl0aW9uIHdlIHJlZmVyIHRvIGxpbnV4IHBhcnRp
dGlvbiBhbmQgZGF0YQo+ID4gcGFydGl0aW9uIG5vdCB1c2VkIHRvIGluaXQgdGhlIHJvdXRlci4K
PiA+IFdoZW4gc29tZW9uZSBoYWQgdG8gd3JpdGUgdG8gdGhlc2UgYm9vdCBwYXJ0aXRpb24gYSBz
cGVjaWFsIG1vZGUgd2FzCj4gPiBuZWVkZWQsIHRvIHN3aXRjaCB0aGUgbmFuZCBkcml2ZXIgdG8g
dGhpcyBzcGVjaWFsIGNvbmZpZ3VyYXRpb24uCj4gPiAKPiA+IFVwc3RyZWFtIHZlcnNpb24gb2Yg
dGhlIG5hbmRjIGRyaXZlciB0b3RhbGx5IGRyb3BwZWQgdGhpcyBhbmQgdGhlIHJlc3VsdAo+ID4g
aXMgdGhhdCBpZiBzb21lb25lIHRyeSB0byByZWFkIGRhdGEgZnJvbSB0aGVzZSBwYXJ0aXRpb24g
YSBDUkMgd2FybmluZwo+ID4gaXMgcHJpbnRlZCBhbmQgaWYgc29tZW9uZSB0cnkgdG8gd3JpdGUg
dGhhdCAoaWYgZm9yIGV4YW1wbGUgc29tZW9uZQo+ID4gd2FudHMgdG8gcmVwbGFjZSB0aGUgYm9v
dGxvYWRlcikgcmVzdWx0IGlzIGEgYnJva2VuIHN5c3RlbSBhcyB0aGUgZGF0YQo+ID4gaXMgYmFk
bHkgd3JpdHRlbi4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgY29tZXMgdG8gZml4IHRoaXMuCj4gPiAK
PiA+IEEgdXNlciBjYW4gZGVjbGFyZSBvZmZzZXQgYW5kIHNpemUgb2YgdGhlc2Ugc3BlY2lhbCBw
YXJ0aXRpb24gdXNpbmcgdGhlCj4gPiBxY29tLGJvb3QtcGFnZXMgYmluZGluZy4KPiA+IAo+ID4g
QW4gaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIGFzc3VtZWQgdGhhdCB0aGUgYm9vdC1w
YWdlcyBzdGFydGVkCj4gPiBmcm9tIHRoZSBzdGFydCBvZiB0aGUgbmFuZCBidXQgd2UgZGlzY292
ZXIgdGhhdCBzb21lIGRldmljZSBoYXZlIGJhY2t1cAo+ID4gb2YgdGhlc2Ugc3BlY2lhbCBwYXJ0
aXRpb24gYW5kIHdlIGNhbiBoYXZlIHNpdHVhdGlvbiB3aGVyZSB3ZSBoYXZlIHRoaXMKPiA+IHBh
cnRpdGlvbiBzY2hlbWUKPiA+IC0gQVBQU0JMIChyZXF1aXJlIHNwZWNpYWwgbW9kZSkKPiA+IC0g
QVBQU0JMRU5WIChkb2Vzbid0IHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+ID4gLSBBUlQKPiA+IC0g
QVBQU0JMQksgKGJhY2sgb2YgQVBQU0JMIHJlcXVpcmUgc3BlY2lhbCBtb2RlKQo+ID4gLSBBUFBT
QkxFTlZCSyAoYmFjayBvZiBBUFBTQkxFTlYgZG9lc24ndCByZXF1aXJlIHNwZWNpYWwgbW9kZSkK
PiA+IFdpdGggdGhpcyBjb25maWd1cmF0aW9uIHdlIG5lZWQgdG8gZGVjbGFyZSBzcGFyc2UgYm9v
dCBwYWdlIGFuZCB3ZSBjYW4ndAo+ID4gYXNzdW1lIGJvb3QtcGFnZXMgYWx3YXlzIHN0YXJ0cyBm
cm9tIHRoZSBzdGFydCBvZiB0aGUgbmFuZC4KPiA+IAo+ID4gQSB1c2VyIGNhbiB1c2UgdGhpcyBm
b3JtIHRvIGRlY2xhcmUgc3BhcnNlIGJvb3QgcGFnZXMKPiA+IHFjb20sYm9vdC1wYWdlcyA9IDww
eDAgMHgwYzgwMDAwIDB4MGM4MDAwMCAweDA1MDAwMDA+Owo+ID4gCj4gPiBUaGUgZHJpdmVyIGlu
dGVybmFsbHkgd2lsbCBwYXJzZSB0aGlzIGFycmF5LCBjb252ZXJ0IGl0IHRvIG5hbmQgcGFnZXMK
PiA+IGFuZCBjaGVjayBpbnRlcm5hbGx5IG9uIGV2ZXJ5IHJlYWQvd3JpdGUgaWYgdGhpcyBzcGVj
aWFsIGNvbmZpZ3VyYXRpb24KPiA+IHNob3VsZCB1c2VkIGZvciB0aGF0IHBhZ2Ugb3IgdGhlIG5v
cm1hbCBvbmUuCj4gPiAKPiA+IFRoZSByZWFzb24gZm9yIGFsbCBvZiB0aGlzIGlzIHRoYXQgcWNv
bSBGT1IgU09NRSBSRUFTT04sIGRpc2FibGUgRUNDIGZvcgo+ID4gc3BhcmUgZGF0YSBvbmx5IGZv
ciB0aGVzZSBib290IHBhcnRpdGlvbiBhbmQgd2UgbmVlZCB0byByZWZsZWN0IHRoaXMKPiA+IHNw
ZWNpYWwgY29uZmlndXJhdGlvbiB0byBtdXRlIHRoZXNlIHdhcm5pbmcgYW5kIHRvIHBlcm1pdCBh
Y3R1YWxseQo+ID4gd3JpdGluZyB0byB0aGVzZSBwYWdlcy4KPiAKPiBNYW5pdmFubmFuLCBhbnkg
ZmVlZGJhY2sgb24gdGhpcz8KPiAKClNvcnJ5IGZvciB0aGUgZGVsYXkuIEkgd2lsbCBjaGVjayBp
bnRlcm5hbGx5IG9uIHNvbWUgb2YgdGhlIHVua25vd24KaW1wbGVtZW50YXRpb25zIG1lbnRpb25l
ZCBhbmQgcHJvdmlkZSBteSBjb21tZW50cy4KClRoYW5rcywKTWFuaQoKPiA+IAo+ID4gdjQ6Cj4g
PiAtIEZpeCB3cm9uZyBjb21wYXRpYmxlIHNldCBmb3IgYm9vdC1wYWdlcyAoaXBxODA3NCBpbnN0
ZWFkIG9mIGlwcTgwNngpCj4gPiB2MzoKPiA+IC0gRml4IHR5cG8gaW4gRG9jbXVuZXRhdGlvbiBj
b21taXQgZGVzcmlwdGlvbgo+ID4gLSBBZGQgaXRlbXMgZGVzY3JpcHRpb24gZm9yIHVpbnQzMi1t
YXRyaXgKPiA+IHYyOgo+ID4gLSBBZGQgZml4ZXMgZnJvbSBLcnp5c3p0b2YgaW4gRG9jdW1lbnRh
dGlvbgo+ID4gCj4gPiBBbnN1ZWwgU21pdGggKDIpOgo+ID4gICBtdGQ6IG5hbmQ6IHJhdzogcWNv
bV9uYW5kYzogYWRkIHN1cHBvcnQgZm9yIHVucHJvdGVjdGVkIHNwYXJlIGRhdGEKPiA+ICAgICBw
YWdlcwo+ID4gICBkdC1iaW5kaW5nczogbXRkOiBxY29tX25hbmRjOiBkb2N1bWVudCBxY29tLGJv
b3QtcGFnZXMgYmluZGluZwo+ID4gCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3Fj
b20sbmFuZGMueWFtbCAgIHwgIDI2ICsrKwo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21f
bmFuZGMuYyAgICAgICAgICAgICB8IDE0OCArKysrKysrKysrKysrKysrKy0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+
4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
