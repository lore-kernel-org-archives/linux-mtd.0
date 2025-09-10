Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E2CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZvlhZg2meq9XGapYUIE2M3E7SLyHOV7ndLN208KdeQ=; b=AUql6htxmmT3l7
	59SBve5HKt/H41ufV6D2AA5T4SEzGC6mAUJMJol1d7r64kUtNxxoFyhPKRg/u1FYK6F8HH62Jmhf8
	WghbzU6l7pXF0g+Grqlc4qF99DTv/osh5TSKqNz8h2GSxKP/zLB9yHwBC43YLdf6wemNVCbxaqtsb
	khCauGi0YtdyQuXVUxsoccLhPqu9CpKrlMlEsox76oBvFdF53fFx9j6FauzePAbGkQLsMH4Y9AhPR
	QOBz+MTmtTLnHikoizWP9HKpfwT3nD9KTfynLcd2k5e5GgK4LFWBWFoJQhqJWlK51pE3Cqj1uxuyH
	RxCmKrpypYOJanTxhXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGdQ-0000000D4se-0uZ7;
	Wed, 10 Sep 2025 08:57:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGdM-0000000D4qo-3QfC
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:56:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16B174E40BA8;
	Wed, 10 Sep 2025 08:56:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E72606D4;
	Wed, 10 Sep 2025 08:56:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C79FE102F1D2E;
	Wed, 10 Sep 2025 10:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757494614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qo2BlmEUSD/J8v+xzmhhSNhPkQC0w+4Piainj47b+IU=;
	b=vmSmM908Ow2DoozMw2yMHS167Mej8C9ju6lL/Gg899huQ+nJBJFri8u4BDtkXL8M22LPIe
	0Ht8uTa91iphxBPGQjo3x0oGM33tLvd0o771n3UnzYqpZq82ioH3gU0+hIOssSAQFzfvUV
	F7px4NXyWWOt5UirxxI9Q02/0rCyKAarA2CSZzcKLlroxQrsjNfQJg5OqrQQIfUP0EytbY
	4KioQUzyA1b9vSF+6yZ98w9mcB5rSVlEY4S6qXoo9xj6AEAI7pd86r+G5y61WdWaClSBzb
	rvNGaTbwMSCSdyMptAn46evHaf2zgYUpErZgSemIRLBlQSYic8ROyK/1pBsarg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubb.aaron@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
Subject: Re: [PATCH v4 0/7] mtd: rawnand: loongson: Add Loongson-2K nand
 controller support
Message-Id: <175749461059.461240.3393347019053494264.b4-ty@bootlin.com>
Date: Wed, 10 Sep 2025 10:56:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_015656_992031_4F584D05 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAwNCBTZXAgMjAyNSAyMTowNjozMiArMDgwMCwgQmluYmluIFpob3Ugd3JvdGU6Cj4g
VGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBMb29uZ3Nvbi0ySzA1MDAvTG9vbmdz
b24tMksxMDAwIE5BTkQKPiBjb250cm9sbGVycywgd2hpY2ggYXJlIHNpbWlsYXIgdG8gdGhlIExv
b25nc29uLTFDIE5BTkQgY29udHJvbGxlci4KPiAKPiBUaGV5IHN1cHBvcnQgYSBtYXhpbXVtIGNh
cGFjaXR5IG9mIDE2R0IgRkxBU0ggcGVyIGNoaXAsIHdpdGggYSBtYXhpbXVtCj4gcGFnZSBzaXpl
IG9mIDhLQi4gVGhlIGNoaXAgc3VwcG9ydHMgdXAgdG8gNCBjaGlwIHNlbGVjdHMgYW5kIDQgUkRZ
IHNpZ25hbHMuCj4gCj4gVGhlIGtleSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIExvb25nc29uLTJL
IE5BTkQgY29udHJvbGxlcnMgaXMgdGhhdCB0aGUKPiBMb29uZ3Nvbi0ySzEwMDAgZXhwbGljaXRs
eSBjb25maWd1cmVzIHRoZSBETUEgY29udHJvbGxlciByb3V0aW5nLCB3aGlsZQo+IHRoZSBMb29u
Z3Nvbi0ySzA1MDAgZGVmYXVsdHMgdG8gdXNpbmcgQVBCRE1BMC4KPiAKPiBbLi4uXQoKQXBwbGll
ZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzddIG10ZDogcmF3bmFuZDogbG9vbmdzb24xOiBS
ZW5hbWUgdGhlIHByZWZpeCBmcm9tIGxzMXggdG8gbG9vbmdzb24KICAgICAgY29tbWl0OiA3YTFl
M2E0NTJhNTc0ZWYzMzdjNGMyY2Q5MjAyMzMyYTFhZTljZDk0ClsyLzddIG10ZDogcmF3bmFuZDog
bG9vbmdzb246IEFkZCA2LWJ5dGUgTkFORCBJRCByZWFkaW5nIHN1cHBvcnQKICAgICAgY29tbWl0
OiBmYjFkZDZiNjcyMmI1MTg3YTRmYTczODVkMGJlNjBiMjhjMGY5OTM2ClszLzddIG10ZDogcmF3
bmFuZDogbG9vbmdzb246IEFkZCBuYW5kIGNoaXAgc2VsZWN0IHN1cHBvcnQKICAgICAgY29tbWl0
OiA3YWQ1YmRmODhkNzI5NWMyOTVhMzYzYTVkYWY0ODFiMjgzYWNlZGMyCls0LzddIGR0LWJpbmRp
bmdzOiBtdGQ6IGxvb25nc29uLGxzMWItbmFuZC1jb250cm9sbGVyOiBEb2N1bWVudCB0aGUgTG9v
bmdzb24tMkswNTAwIE5BTkQgY29udHJvbGxlcgogICAgICBjb21taXQ6IDRhMmJhYjdjY2NlYjE0
YjQ4ZTg2Nzk0Yjg3MTA0MjQ4Yzc1YWE1ODcKWzUvN10gbXRkOiByYXduYW5kOiBsb29uZ3Nvbjog
QWRkIExvb25nc29uLTJLMDUwMCBOQU5EIGNvbnRyb2xsZXIgc3VwcG9ydAogICAgICBjb21taXQ6
IGU1NWJiZGQ0YTRiNjU0ZGZlOGVlODY0OWIzYmUxZGI4MjMxOWQ2YzAKWzYvN10gZHQtYmluZGlu
Z3M6IG10ZDogbG9vbmdzb24sbHMxYi1uYW5kLWNvbnRyb2xsZXI6IERvY3VtZW50IHRoZSBMb29u
Z3Nvbi0ySzEwMDAgTkFORCBjb250cm9sbGVyCiAgICAgIGNvbW1pdDogMGIxYWU2NDgwYzNiZTU4
YWQzMWFmZTc1N2NiZjEwNjlhZTA3MmJiMQpbNy83XSBtdGQ6IHJhd25hbmQ6IGxvb25nc29uOiBB
ZGQgTG9vbmdzb24tMksxMDAwIE5BTkQgY29udHJvbGxlciBzdXBwb3J0CiAgICAgIGNvbW1pdDog
NTgwOGFlNjZmMjJlNjY1YzcxMzE4MTZlMTQ2NTQ4ZjJkNzkwM2FlMQoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
