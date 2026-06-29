Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AC6C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9eJ8vR5OZkRXS8OVtUROz95XnBxlB+yroiWHi26yfM=; b=Kd2Q+AE+ESDl12
	BFRX0LvGwSvTcJs+hVcuv7ABfr1in0mh4Wn7XDKF+6mXqL0/I7NDbP26C1KoSJLzim6OuQEDfWYv1
	JQphdxr8HTES9IgHJMUfcqhoEbPgcc1pocySedCjCI0y9bpo6mfPQl0jwAj+AAvM6ilnoS/8BDAPc
	W6RXpJv13pBjk9SYztY5iLssXe5ajiwgjBZn6bjScaMFH9vcfhlkXV3+L2t5pEVCRlKNSDzr3ihC1
	JM0MCQ24j7vGl0Qh6lz9KAcnjCKbOnAdACiGgQI/tcbn/mnI7kzIncyFsq1lpSumI0wLX2xl4xoR0
	iTSON1yjzvrF1/bv/mjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDZX-0000000F0sV-1qtg;
	Mon, 29 Jun 2026 15:06:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDZT-0000000F0rx-3gzM
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 15:06:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0DE5C6B3A9;
	Mon, 29 Jun 2026 15:06:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 854325FF96;
	Mon, 29 Jun 2026 15:06:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561EC106F18BF;
	Mon, 29 Jun 2026 17:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BONHax0KPGvnYh/wOipV0VMGtz4EIszzeU5Nj5QrZKk=;
	b=PDHsfQX8vE5Gkq/pWrLB4bkNUh8x6PgT3QnB23IU5i7pjORNCFKRKuWdrR9mSiBpE8xqNf
	3Vwv1M5wr/pfypZMB/pWA3EmDYfhhGeIV9hWBJQiaVxFC/I4wBpnJww2o0z8xL2vHcIU8N
	Hb9VPsY+FnNayGPaEkwHZH0W+54eVBbD0Z0A8Yxe0A8s0F6YeIaeSGp71GiaFHw9s6Xm9y
	1QuTgFH8U7zLx73V3vZiBqu++GH8mMqLiLZwzupY+ZDQMx1m3QDymc6ysKHO1hTigZPWtS
	SLUVw4xyFsap3weTpBrM8RL7kDWPb/IPuftw0GCBsBjZx5OEvjipX7Zzvok0zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>,  Kathiravan Thirumoorthy
 <quic_kathirav@quicinc.com>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com> (Konrad
	Dybcio's message of "Wed, 17 Jun 2026 13:42:44 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org> <87o6hk9i29.fsf@bootlin.com>
	<aifktn_s2qmg7MzI@linaro.org>
	<3ab3ccfc-1fdc-4176-b073-1f31e2c88c6a@oss.qualcomm.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:06:44 +0200
Message-ID: <87v7b1s7wb.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080652_111161_8F7D10C9 
X-CRM114-Status: GOOD (  26.59  )
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

SGVsbG8sCgpPbiAxNy8wNi8yMDI2IGF0IDEzOjQyOjQ0ICswMiwgS29ucmFkIER5YmNpbyA8a29u
cmFkLmR5YmNpb0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKCihrZWVwaW5nIHRoZSBjb250ZXh0
IGZvciBLcnp5c3p0b2YpCgo+IE9uIDYvOS8yNiAxMjowMiBQTSwgU3RlcGhhbiBHZXJob2xkIHdy
b3RlOgo+PiBPbiBUdWUsIEp1biAwOSwgMjAyNiBhdCAxMTozMDo1NEFNICswMjAwLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+Pj4gT24gMDkvMDYvMjAyNiBhdCAxMTowODowMyArMDIsIFN0ZXBoYW4g
R2VyaG9sZCA8c3RlcGhhbi5nZXJob2xkQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4KPj4+PiBPbiBU
dWUsIEp1biAwOSwgMjAyNiBhdCAxMTowMToxOEFNICswMjAwLCBLb25yYWQgRHliY2lvIHdyb3Rl
Ogo+Pj4+PiBPbiA2LzkvMjYgMTA6NTUgQU0sIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+Pj4+PiBP
biA2LzkvMjYgMTA6MTAgQU0sIFN0ZXBoYW4gR2VyaG9sZCB3cm90ZToKPj4+Pj4+PiBPbiBUdWUs
IEp1biAwOSwgMjAyNiBhdCAwOTo1Mjo1MUFNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4+Pj4+Pj4+IE9uIE1ETTk2MDcsIHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgY29udHJvbGxhYmxl
IGNsb2NrIGZvciB0aGUgTkFORAo+Pj4+Pj4+Pj4+IGNvbnRyb2xsZXIgKFJQTV9TTURfUVBJQ19D
TEspLiBUaGUgc2FtZSBzaXR1YXRpb24gYWxzbyBhcHBsaWVzIGUuZy4gZm9yCj4+Pj4+Pj4+Pj4g
cWNvbSxzZHg1NS1uYW5kLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZGV2aWNlIHRyZWUgKHFjb20t
c2R4NTUuZHRzaSkgd29ya3MKPj4+Pj4+Pj4+PiBhcm91bmQgdGhhdCBieSBhc3NpZ25pbmcgYSBk
dW1teSBjbG9jayAoJm5hbmRfY2xrX2R1bW15KSB0byB0aGUgc2Vjb25kCj4+Pj4+Pj4+Pj4gY2xv
Y2sgKCJhb24iKSB0aGF0IGlzIHJlcXVpcmVkIGJ5IHRoZSBkdC1iaW5kaW5ncy4gVGhpcyBpcyBu
b3QgcmVhbGx5Cj4+Pj4+Pj4+Pj4gdXNlZnVsLCBzbyBhdm9pZCBkb2luZyB0aGF0IGZvciBuZXcg
cGxhdGZvcm1zIGJ5IGV4Y2x1ZGluZyB0aGUgc2Vjb25kICJhb24iCj4+Pj4+Pj4+Pj4gY2xvY2sg
ZW50cnkgaW4gdGhlIGR0LWJpbmRpbmdzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFJldmlld2VkLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5j
b20+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdoYXQgaXMgdGhlIHByb2JsZW0gaW4gZ2l2aW5nIHR3aWNl
IHRoZSBzYW1lIGNsb2NrPyBJZiB0aGlzIGlzIHdoYXQgaXMKPj4+Pj4+Pj4gZG9uZSBpbiB0aGUg
aGFyZHdhcmUgcm91dGluZywgSSBkbyBub3Qgc2VlIHRoZSByZWFzb24gZm9yIG1vcmUKPj4+Pj4+
Pj4gY29tcGxleGl0eSBpbiB0aGUgYmluZGluZz8KPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEkg
aGFkIHRoYXQgaW4gbXkgZmlyc3QgZHJhZnQgZm9yIHRoaXMgc2VyaWVzLCBidXQgdGhpcyB3b3Vs
ZCBiZSB3cm9uZwo+Pj4+Pj4+IElNTy4gSSBzdXNwZWN0IHRoZXJlIGlzIG5vIFFQSUMvTkFORCBy
ZWxhdGVkICJhb24iIChhbHdheXMtb24pIGNsb2NrIG9uCj4+Pj4+Pj4gdGhpcyBwbGF0Zm9ybSBh
dCBhbGwuIEknbSBub3Qgc3VyZSBhYm91dCBNRE05NjA3IGluIHBhcnRpY3VsYXIgKG1heWJlCj4+
Pj4+Pj4gc29tZW9uZSBmcm9tIFF1YWxjb21tIGNhbiBjb25maXJtKSwgYnV0IGEgc2ltaWxhciBw
bGF0Zm9ybSBJIHdhcyBsb29raW5nCj4+Pj4+Pj4gaW50byBhdCBzb21lIHBvaW50IGFjdHVhbGx5
IGhhZCAqMyogc2VwYXJhdGUgY2xvY2tzIGZvciBRUElDIGluIHRoZQo+Pj4+Pj4+IGhhcmR3YXJl
IGFuZCBub25lIG9mIHRoZW0gd2VyZSBjYWxsZWQgImFvbiIgLi4uCj4+Pj4+Pgo+Pj4+Pj4gZ2Nj
X3FwaWNfYWhiX2NsayAoNTAvMTAwLzEzMy4oMykgTUh6IHNvdXJjZWQgZnJvbSBQQ05vQ19iZmRj
ZF9jbGtfc3JjKQo+Pj4+Pj4gZ2NjX3FwaWNfY2xrIChsaWtld2lzZSwgc291cmNlZCBmcm9tIHFw
aWNfY2xrX3NyYyB3aGljaCBpcyBzb3VyY2VkCj4+Pj4+PiBmcm9tIEdQTExzKQo+Pj4+Pj4gZ2Nj
X3FwaWNfc3lzdGVtX2NsayAoMzIgS0h6KQo+Pj4+Pj4KPj4+Pj4+IE5vIGNsb2NrIGNvbnRhaW5p
bmcgdGhlIHN1YnN0cmluZyAnYW9uJyBpbiBpdHMgbmFtZSBvbiB0aGlzIHBsYXRmb3JtCj4+Pj4+
Cj4+Pj4+IExvb2tpbmcgYXQgU0RYNjUsIHBlcmhhcHMgdGhlIDMyIEtoeiBjbG9jayBpcyB0aGUg
ImFvbiIgb25lIGFmdGVyIGFsbC4uCj4+Pj4+IFRoZSBOQU5EIGRvY3VtZW50YXRpb24gc2F5cwo+
Pj4+Pgo+Pj4+PiBDQ19RUElDX1NZU1RFTV9DTEsgLSBBbHdheXMtb24gdGltZW91dCBjbG9jayAo
MzIgS0h6KQo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciBsb29raW5nIHRoaXMgdXAuCj4+Pj4K
Pj4+PiBJTU8sIGlmIHdlIHdhbnQgdG8gZGVzY3JpYmUgdGhlIGFjdHVhbCBoYXJkd2FyZSByb3V0
aW5nLCB3ZSBzaG91bGQKPj4+PiBkZXNjcmliZSBhbGwgMyBjbG9ja3MgYW5kIGFzc2lnbiBhbGwg
b2YgdGhlbSB0byBSUE1fU01EX1FQSUNfQ0xLIGZvcgo+Pj4+IE1ETTk2MDcpLgo+Pj4KPj4+IFNv
dW5kcyBtb3JlIGFjY3VyYXRlIHRvIG1lLgo+Pj4KPj4+PiBUaGUgcmVzdWx0aW5nIGRpZmYgd291
bGQgYmUgYmFzaWNhbGx5IHRoZSBzYW1lIGFzIHRoaXMgcGF0Y2gganVzdAo+Pj4+IGludmVyc2Vk
ICgzIGNsb2NrcyBmb3IgTURNOTYwNytTRFgoPykgYW5kIDIgY2xvY2tzIGZvciB0aGUgSVBRKiBT
b0NzLgo+Pj4KPj4+IERpZmYgd291bGQgbm90IGJlIHNpbXBsZXIgYnV0IG1vcmUgYWNjdXJhdGUu
IFNvIGlmIHdlIGdvIGZvciBhCj4+PiBtb2RpZmljYXRpb24gb2YgdGhlIGJpbmRpbmdzLCBJIHdv
dWxkIHByZWZlciB0aGF0IHBhdGguCj4+Pgo+PiAKPj4gSU1PIHRoZSByZXN1bHQgd291bGRuJ3Qg
YmUgbXVjaCBtb3JlIGFjY3VyYXRlIGZyb20gdGhlIHBlcnNwZWN0aXZlIG9mCj4+IHRoZSBrZXJu
ZWwuIElmIHdlIGFzc2lnbiBSUE1fU01EX1FQSUNfQ0xLIHRvIGFsbCAzIGNsb2NrcyB3ZSB3b3Vs
ZCBiZQo+PiBlZmZlY3RpdmVseSBzYXlpbmcgInRoZXJlIGlzIGEgc2luZ2xlIGNsb2NrIHdpdGgg
YSBzaW5nbGUgcmF0ZSB0aGF0IGlzCj4+IHNvdXJjaW5nICdjb3JlJywgJ2FoYicgYW5kICdzeXN0
ZW0nKC8nYW9uJykiLiBCdXQgaW4gcmVhbGl0eSwgdGhlc2UgYXJlCj4+IDMgc2VwYXJhdGUgY2xv
Y2sgZG9tYWlucyB3aXRoIHNlcGFyYXRlIHJhdGVzLCBhcyBzaG93biBieSBLb25yYWQgYWJvdmUu
Cj4+IAo+PiBXZSBjb3VsZCB0cnkgZGVmaW5pbmcgZHVtbXkgY2xvY2tzIGxpa2UgdGhlICZuYW5k
X2Nsa19kdW1teSBpbgo+PiBxY29tLXNkeDU1LmR0c2ksIGJ1dCB0aGlzIGlzbid0IHZlcnkgYWNj
dXJhdGUgZWl0aGVyLiBQcmVzdW1hYmx5LCBhbGwgb2YKPj4gdGhlc2UgY2xvY2tzIGFyZSB0b2dn
bGVkIGJ5IFJQTV9TTURfUVBJQ19DTEsuIFNvIGlmIHdlIGRlZmluZSBhIGR1bW15Cj4+IGNsb2Nr
IGZvciAnYWhiJywgdGhlbiBlbmFibGluZyB0aGF0IGNsb2NrIHdpdGhvdXQgYWxzbyBlbmFibGlu
ZyB0aGUKPj4gbm9uLWR1bW15ICdjb3JlJyAoUlBNX1NNRF9RUElDX0NMSykgd2lsbCBkbyBub3Ro
aW5nLgo+Cj4gSSBjYW4ndCBmaW5kIGEgZ29vZCBhbnN3ZXIgZm9yIHdoYXQgUlBNX1NNRF9RUElD
X0NMSyBjb250cm9scywgbWF5YmUKPiArTWFuaSBvciArS2F0aGlyYXZhbiBrbm93IHdoZXJlIHRv
IGxvb2sKPgo+IEtvbnJhZAo+Cj4+IAo+PiBBdCB0aGUgZW5kLCB0aGUgdHJ1dGggZm9yIHRoZSBP
Uy9rZXJuZWwgcnVubmluZyBvbiB0aGlzIGhhcmR3YXJlIGlzIHRoYXQKPj4gaXQgY2FuIG9ubHkg
c2VlIHRoZSAnY29yZScgY2xvY2sgKHdpdGggdGhlIG9wdGlvbiB0byBjaGFuZ2UgaXRzIHJhdGUp
Lgo+PiBBbGwgb3RoZXJzIGFyZSBpbnZpc2libGUsIHdpdGggbm8gd2F5IHRvIGluZmx1ZW5jZSBv
ciBjaGVjayB0aGUgc3RhdHVzLAo+PiBzbyBwcmV0ZW5kaW5nIHRoYXQgd2UgaGF2ZSBzZXBhcmF0
ZSByZXNvdXJjZXMgZm9yIHRoZW0gZG9lc24ndCByZWFsbHkKPj4gbWFrZSB0aGluZ3MgbW9yZSBh
Y2N1cmF0ZSBpbiBteSBvcGluaW9uLgo+PiAKPj4gQnV0IHllYWgsIGxldCdzIGxlYXZlIHRoZSBk
ZWNpc2lvbiB1cCB0byBLcnp5c3p0b2YuIEknbSBoYXBweSB0byBjaGFuZ2UKPj4gdGhpcyBwYXRj
aCBhcyBuZWVkZWQgYXMgbG9uZyBpdCB3b3JrcyBhdCB0aGUgZW5kLiA6LSkKClNvcnJ5IHRvIGJv
dGhlciB5b3UgS3J6eXN6dG9mLiBCYXNlZCBvbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiwgd291
bGQKeW91IG1pbmQgZ2l2aW5nIGFuIHVwZGF0ZWQgcG9pbnQgb2Ygdmlldz8gSWYgeW91IGRvbid0
IGhhdmUgdGltZSwgbm8KcHJvYmxlbSwgSSBjYW4gdGFrZSB0aGUgc2VyaWVzIGFzLWlzLgoKVGhh
bmtzIGEgbG90LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
