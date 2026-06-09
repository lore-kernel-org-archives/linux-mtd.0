Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA91DCD8CA4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2G6UPG7ggviyhi08QAG2ojSyT6CO88kCRsONdMN3xzQ=; b=PElkfTwx4OWXxO
	MDG+abM3cHUbfCNw84iuWI5OAfBhFHLVWsLw/egIBwSp8dTBOLTvlTrihTYFblTyAJaCxQnIQRC8D
	pFMOpbXWsdRSc7c8+IderbWokLQgDEHz+A/yhvvpREmMGX1XVIochqh9KBxnOSEImt6nSoA1NI0dB
	6NORB+a4Zq2rO5XMuBcC6DgrJx2g+RORMJCoOvmuwqIJmvJrI1PKuVHHdsYnsXvHisquigVJpeF0l
	yl6FHsOOFTn13za5njNpWDBj0awdl6/wvhy+QE9iQ8jgXPRGCtqvGTRQYUi35hRMYd5DDgl/1/2DD
	2I0WU5y4n/ANjltc2ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsnd-00000005D7v-2Wvj;
	Tue, 09 Jun 2026 09:31:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsna-00000005D7R-3K05
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 09:31:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB69B4E40914;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B915FFC1;
	Tue,  9 Jun 2026 09:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18050106A2ADD;
	Tue,  9 Jun 2026 11:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997460; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A43LRr2R11CwZdLErI94QN/M8VqgGQQ2IlVMHrVdW1A=;
	b=TwGjK3VQXZ0F051JJq335p58AiVP0bVk7T/ENCeBJ3AwmFGNwLWolrA7je2kqWY8xHQifn
	uqTQOZQtu5skzrad7x9z6vVtpQoApFuPgth+vRHU1LBmFF2EMmo1V9EwKh1zW7Az9NvnHq
	qgFMh9kcQfU7T3jIQN03Xkvwrw5rY53SeH2aPHnkEsKgNp5MJJBMZjL2/uyqI/QAPdT3Eg
	81IBx3dbHZUXlmvUXQalzfYccNxytue4z0f8gfY5y2avAyPbts6Mv3wYIcWUJEX/wtwvqS
	av1oEHOBV41A1kYHKsCSzroRDiSMBzC5yKfd9VFJrh2a6zO1rN2hFyDoKC0/jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Manivannan Sadhasivam <mani@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
In-Reply-To: <aifX80IHM8TLQiV7@linaro.org> (Stephan Gerhold's message of "Tue,
	9 Jun 2026 11:08:03 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
	<20260609-quirky-rat-of-criticism-aea1fe@quoll>
	<87mrx4b164.fsf@bootlin.com> <aifKejyF7n6QsI9h@linaro.org>
	<a6b17b9a-f639-4a7f-adb6-d0c9dbd31e68@oss.qualcomm.com>
	<35c7513b-6aea-48cf-aea8-da8604616601@oss.qualcomm.com>
	<aifX80IHM8TLQiV7@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 09 Jun 2026 11:30:54 +0200
Message-ID: <87o6hk9i29.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_023106_997706_F095B151 
X-CRM114-Status: GOOD (  25.60  )
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

T24gMDkvMDYvMjAyNiBhdCAxMTowODowMyArMDIsIFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbi5n
ZXJob2xkQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIEp1biAwOSwgMjAyNiBhdCAxMTow
MToxOEFNICswMjAwLCBLb25yYWQgRHliY2lvIHdyb3RlOgo+PiBPbiA2LzkvMjYgMTA6NTUgQU0s
IEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4+ID4gT24gNi85LzI2IDEwOjEwIEFNLCBTdGVwaGFuIEdl
cmhvbGQgd3JvdGU6Cj4+ID4+IE9uIFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDA5OjUyOjUxQU0gKzAy
MDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+ID4+Pj4+IE9uIE1ETTk2MDcsIHRoZXJlIGlzIG9u
bHkgYSBzaW5nbGUgY29udHJvbGxhYmxlIGNsb2NrIGZvciB0aGUgTkFORAo+PiA+Pj4+PiBjb250
cm9sbGVyIChSUE1fU01EX1FQSUNfQ0xLKS4gVGhlIHNhbWUgc2l0dWF0aW9uIGFsc28gYXBwbGll
cyBlLmcuIGZvcgo+PiA+Pj4+PiBxY29tLHNkeDU1LW5hbmQsIGJ1dCB0aGUgY29ycmVzcG9uZGlu
ZyBkZXZpY2UgdHJlZSAocWNvbS1zZHg1NS5kdHNpKSB3b3Jrcwo+PiA+Pj4+PiBhcm91bmQgdGhh
dCBieSBhc3NpZ25pbmcgYSBkdW1teSBjbG9jayAoJm5hbmRfY2xrX2R1bW15KSB0byB0aGUgc2Vj
b25kCj4+ID4+Pj4+IGNsb2NrICgiYW9uIikgdGhhdCBpcyByZXF1aXJlZCBieSB0aGUgZHQtYmlu
ZGluZ3MuIFRoaXMgaXMgbm90IHJlYWxseQo+PiA+Pj4+PiB1c2VmdWwsIHNvIGF2b2lkIGRvaW5n
IHRoYXQgZm9yIG5ldyBwbGF0Zm9ybXMgYnkgZXhjbHVkaW5nIHRoZSBzZWNvbmQgImFvbiIKPj4g
Pj4+Pj4gY2xvY2sgZW50cnkgaW4gdGhlIGR0LWJpbmRpbmdzLgo+PiA+Pj4+Cj4+ID4+Pj4gUmV2
aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAb3NzLnF1
YWxjb21tLmNvbT4KPj4gPj4+Cj4+ID4+PiBXaGF0IGlzIHRoZSBwcm9ibGVtIGluIGdpdmluZyB0
d2ljZSB0aGUgc2FtZSBjbG9jaz8gSWYgdGhpcyBpcyB3aGF0IGlzCj4+ID4+PiBkb25lIGluIHRo
ZSBoYXJkd2FyZSByb3V0aW5nLCBJIGRvIG5vdCBzZWUgdGhlIHJlYXNvbiBmb3IgbW9yZQo+PiA+
Pj4gY29tcGxleGl0eSBpbiB0aGUgYmluZGluZz8KPj4gPj4+Cj4+ID4+Cj4+ID4+IEkgaGFkIHRo
YXQgaW4gbXkgZmlyc3QgZHJhZnQgZm9yIHRoaXMgc2VyaWVzLCBidXQgdGhpcyB3b3VsZCBiZSB3
cm9uZwo+PiA+PiBJTU8uIEkgc3VzcGVjdCB0aGVyZSBpcyBubyBRUElDL05BTkQgcmVsYXRlZCAi
YW9uIiAoYWx3YXlzLW9uKSBjbG9jayBvbgo+PiA+PiB0aGlzIHBsYXRmb3JtIGF0IGFsbC4gSSdt
IG5vdCBzdXJlIGFib3V0IE1ETTk2MDcgaW4gcGFydGljdWxhciAobWF5YmUKPj4gPj4gc29tZW9u
ZSBmcm9tIFF1YWxjb21tIGNhbiBjb25maXJtKSwgYnV0IGEgc2ltaWxhciBwbGF0Zm9ybSBJIHdh
cyBsb29raW5nCj4+ID4+IGludG8gYXQgc29tZSBwb2ludCBhY3R1YWxseSBoYWQgKjMqIHNlcGFy
YXRlIGNsb2NrcyBmb3IgUVBJQyBpbiB0aGUKPj4gPj4gaGFyZHdhcmUgYW5kIG5vbmUgb2YgdGhl
bSB3ZXJlIGNhbGxlZCAiYW9uIiAuLi4KPj4gPiAKPj4gPiBnY2NfcXBpY19haGJfY2xrICg1MC8x
MDAvMTMzLigzKSBNSHogc291cmNlZCBmcm9tIFBDTm9DX2JmZGNkX2Nsa19zcmMpCj4+ID4gZ2Nj
X3FwaWNfY2xrIChsaWtld2lzZSwgc291cmNlZCBmcm9tIHFwaWNfY2xrX3NyYyB3aGljaCBpcyBz
b3VyY2VkCj4+ID4gZnJvbSBHUExMcykKPj4gPiBnY2NfcXBpY19zeXN0ZW1fY2xrICgzMiBLSHop
Cj4+ID4gCj4+ID4gTm8gY2xvY2sgY29udGFpbmluZyB0aGUgc3Vic3RyaW5nICdhb24nIGluIGl0
cyBuYW1lIG9uIHRoaXMgcGxhdGZvcm0KPj4gCj4+IExvb2tpbmcgYXQgU0RYNjUsIHBlcmhhcHMg
dGhlIDMyIEtoeiBjbG9jayBpcyB0aGUgImFvbiIgb25lIGFmdGVyIGFsbC4uCj4+IFRoZSBOQU5E
IGRvY3VtZW50YXRpb24gc2F5cwo+PiAKPj4gQ0NfUVBJQ19TWVNURU1fQ0xLIC0gQWx3YXlzLW9u
IHRpbWVvdXQgY2xvY2sgKDMyIEtIeikKPj4gCj4KPiBUaGFua3MgZm9yIGxvb2tpbmcgdGhpcyB1
cC4KPgo+IElNTywgaWYgd2Ugd2FudCB0byBkZXNjcmliZSB0aGUgYWN0dWFsIGhhcmR3YXJlIHJv
dXRpbmcsIHdlIHNob3VsZAo+IGRlc2NyaWJlIGFsbCAzIGNsb2NrcyBhbmQgYXNzaWduIGFsbCBv
ZiB0aGVtIHRvIFJQTV9TTURfUVBJQ19DTEsgZm9yCj4gTURNOTYwNykuCgpTb3VuZHMgbW9yZSBh
Y2N1cmF0ZSB0byBtZS4KCj4gVGhlIHJlc3VsdGluZyBkaWZmIHdvdWxkIGJlIGJhc2ljYWxseSB0
aGUgc2FtZSBhcyB0aGlzIHBhdGNoIGp1c3QKPiBpbnZlcnNlZCAoMyBjbG9ja3MgZm9yIE1ETTk2
MDcrU0RYKD8pIGFuZCAyIGNsb2NrcyBmb3IgdGhlIElQUSogU29Dcy4KCkRpZmYgd291bGQgbm90
IGJlIHNpbXBsZXIgYnV0IG1vcmUgYWNjdXJhdGUuIFNvIGlmIHdlIGdvIGZvciBhCm1vZGlmaWNh
dGlvbiBvZiB0aGUgYmluZGluZ3MsIEkgd291bGQgcHJlZmVyIHRoYXQgcGF0aC4KCj4gVGhlIGNv
bXBsZXhpdHkgb2YgdGhlIGJpbmRpbmcgd291bGQgYmUgdGhlIHNhbWUsIHNvIGlzIGl0IHdvcnRo
Cj4gcmV3b3JraW5nIHRoaXMgcGF0Y2g/IEF0IHRoZSBlbmQsIHRoZXJlIGlzIGp1c3Qgb25lIGNs
b2NrIHdlIGNhbiB0b2dnbGUKPiB0aHJvdWdoIHRoZSBmaXJtd2FyZSBoZXJlIGFuZCBJIGRvdWJ0
IGFueW9uZSB1c2VzIHRoaXMgU29DIHdpdGhvdXQgdGhlCj4gUlBNIGZpcm13YXJlLgoKVGhpcyBp
cyBub3QgcmVhbGx5IGFib3V0IGhvdyB3ZSB1c2UgaXQsIGV2ZW4gdGhvdWdoIGFuIGludGVncmF0
aW9uCnNwZWNpZmljIGNvbXBhdGlibGUgaXMgcHJvYmFibHkgYWxsb3dlZCB0byBzaW1wbGlmeSB0
aGUgaW5wdXRzLiBTbyBub3cKdGhhdCBJIHJhaXNlZCB0aGF0IHBvaW50LCBJJ2xsIGxldCB0aGUg
ZmluYWwgZGVjaXNpb24gdG8gS3J6eXp0b2Ygd2hvCmtub3dzIGJldHRlciB0aGUgUWNvbW0gZWNv
c3lzdGVtIHRoYW4gbWUuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
