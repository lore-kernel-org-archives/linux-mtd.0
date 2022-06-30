Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3AFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jun 2022 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4SEDfJ/al+1Qt/EDKZaR9t7iMZPxsxUr2v9oDKmHRE=; b=2k9jMSRf9cf1a/
	RrOjjkpLFCxCGvlYSaLgdVtgTSxwABIK3y8xOGIBU+yjBwpGvMVBrXy0pqYp5gBh1nqQRCwHkFH2Z
	CcmnOOZpCToEgk29h6fJjcBLIO8SCds0O5+TRg9eBxKwd1gO9C9JkQiSX1sXQQInRX4P7ZM6ovWhy
	Q5fiVCfaBwTcHYjMIx5zSmnFlMLgFwXA35Cn987oN9As9B6/zHPqvWMHjb5pif0jRPEEKCex4yl+z
	vT1UJQmm/2L2dCu0KPVDWCnGuxTdRRc57pZGVhPJvYJtYSB8LTM7F6b68Q1uJgAaHt4mruexSpHvl
	hBDoRtuSTyHCCYzVYg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6oPz-00FjDY-6w; Thu, 30 Jun 2022 07:16:51 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6oPu-00Fj9V-5O
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2022 07:16:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3C033240011;
	Thu, 30 Jun 2022 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656573400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9I94e4QJGBDEKtn1NYQX9pGoS4V5rF6gB5rgv3ePiKY=;
	b=f1D5owjWynMmSNvMz/29rgnS21+K0IiCKp4Q9pLK4PR/JbHpD4NuS+5PkOWug5hXGX/1c0
	qA4QB5yL58gvxqdMb8wfap5OvlGS8XR1sGAmO2D0JFodHMDhIa6Gwmep4OIFX2lg9nB8vx
	2RuAsIBg5a5fMFsg4QFGXnvMK88ycDolLJ0jqX4TyUiyXKnSsjoNB7n7CNEqUmGpWtEijI
	GAWNSXlFwJN4bL0r03f7/CAqqRpgUYRdofQYKBADNJb9xufoH0C7FkvI0AbvEUKdaMbXpR
	+FQy3m9wcU+6BSf1VfptrzqejlDFFXLqPjrt7ED0DDbf8KtaoLmtPngXyfnjqA==
Date: Thu, 30 Jun 2022 09:16:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd/partitions: Convert
 arm-firmware-suite to DT schema
Message-ID: <20220630091636.03386395@xps-13>
In-Reply-To: <20220629185031.23826-1-robh@kernel.org>
References: <20220629185031.23826-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_001646_517983_77CCF9EE 
X-CRM114-Status: GOOD (  17.49  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFdlZCwgMjkgSnVuIDIwMjIgMTI6NTA6
MzAgLTA2MDA6Cgo+IENvbnZlcnQgdGhlIGFybSxhcm0tZmlybXdhcmUtc3VpdGUgcGFydGl0aW9u
IGJpbmRpbmcgdG8gRFQgc2NoZW1hCj4gZm9ybWF0LiBTaW1wbGUgY29udmVyc2lvbiBhcyB0aGVy
ZSdzIG9ubHkgYSBjb21wYXRpYmxlIHByb3BlcnR5Lgo+IAo+IFJldmlld2VkLWJ5OiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAtLS0KPiB2MjoKPiAgLSBGaXggZXhhbXBsZSBkdGMg
d2FybmluZwo+IC0tLQo+ICAuLi4vbXRkL3BhcnRpdGlvbnMvYXJtLGFybS1maXJtd2FyZS1zdWl0
ZS50eHQgfCAxNyAtLS0tLS0tLS0tLQo+ICAuLi4vcGFydGl0aW9ucy9hcm0sYXJtLWZpcm13YXJl
LXN1aXRlLnlhbWwgICAgfCAyOCArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYXJtLGFy
bS1maXJtd2FyZS1zdWl0ZS50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9hcm0sYXJtLWZpcm13YXJlLXN1aXRl
LnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL2FybSxhcm0tZmlybXdhcmUtc3VpdGUudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2FybSxhcm0tZmlybXdhcmUtc3Vp
dGUudHh0Cj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZDVjNTYxNmY2ZGI1Li4w
MDAwMDAwMDAwMDAKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L3BhcnRpdGlvbnMvYXJtLGFybS1maXJtd2FyZS1zdWl0ZS50eHQKPiArKysgL2Rldi9udWxsCj4g
QEAgLTEsMTcgKzAsMCBAQAo+IC1BUk0gQUZTIC0gQVJNIEZpcm13YXJlIFN1aXRlIFBhcnRpdGlv
bnMKPiAtPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLQo+IC1UaGUg
QVJNIEZpcm13YXJlIFN1aXRlIGlzIGEgZmxhc2ggcGFydGl0aW9uaW5nIHN5c3RlbSBmb3VuZCBv
biB0aGUKPiAtQVJNIHJlZmVyZW5jZSBkZXNpZ25zOiBJbnRlZ3JhdG9yIEFQLCBJbnRlZ3JhdG9y
IENQLCBWZXJzYXRpbGUgQUIsCj4gLVZlcnNhdGlsZSBQQiwgdGhlIFJlYWxWaWV3IGZhbWlseSwg
VmVyc2F0aWxlIEV4cHJlc3MgYW5kIEp1bm8uCj4gLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+
IC0tIGNvbXBhdGlibGUgOiAocmVxdWlyZWQpIG11c3QgYmUgImFybSxhcm0tZmlybXdhcmUtc3Vp
dGUiCj4gLQo+IC1FeGFtcGxlOgo+IC0KPiAtZmxhc2hAMCB7Cj4gLQlwYXJ0aXRpb25zIHsKPiAt
CQljb21wYXRpYmxlID0gImFybSxhcm0tZmlybXdhcmUtc3VpdGUiOwo+IC0JfTsKPiAtfTsKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2FybSxhcm0tZmlybXdhcmUtc3VpdGUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9hcm0sYXJtLWZpcm13YXJlLXN1aXRlLnlhbWwKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzZjODgwMjdiNmQyCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9hcm0sYXJtLWZpcm13YXJlLXN1aXRlLnlhbWwKPiBAQCAtMCwwICsxLDI4
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9wYXJ0aXRpb25zL2FybSxhcm0tZmlybXdhcmUtc3VpdGUueWFtbCMKPiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+
ICt0aXRsZTogQVJNIEZpcm13YXJlIFN1aXRlIChBRlMpIFBhcnRpdGlvbnMKPiArCj4gK21haW50
YWluZXJzOgo+ICsgIC0gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+
ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGUgQVJNIEZpcm13YXJlIFN1aXRlIGlzIGEgZmxh
c2ggcGFydGl0aW9uaW5nIHN5c3RlbSBmb3VuZCBvbiB0aGUKPiArICBBUk0gcmVmZXJlbmNlIGRl
c2lnbnM6IEludGVncmF0b3IgQVAsIEludGVncmF0b3IgQ1AsIFZlcnNhdGlsZSBBQiwKPiArICBW
ZXJzYXRpbGUgUEIsIHRoZSBSZWFsVmlldyBmYW1pbHksIFZlcnNhdGlsZSBFeHByZXNzIGFuZCBK
dW5vLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFy
bSxhcm0tZmlybXdhcmUtc3VpdGUKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+
ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICBwYXJ0aXRpb25zIHsKPiArICAgICAgICBj
b21wYXRpYmxlID0gImFybSxhcm0tZmlybXdhcmUtc3VpdGUiOwo+ICsgICAgfTsKPiArLi4uCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
