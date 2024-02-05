Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A782DC48295
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRMEVbK776UPP75X7yAln47kCoDeLkUGx/avnm0f+Rs=; b=z14l+O7D2eIZeV
	hEl+RWqch7jVNmMdO7Z1nR1OECtEccX+JBPNqNPz7DrB1SJFilMcGqtJ/4bkf0hgWvanuavFRb5WK
	t2oKd7OnZ7r3cl5LjdgZIrJT4qZlR9NO/3zVnC109VIrFbaqfL2rXvH3udTmL2yVu7kr8kUZftYZJ
	GWvN7T2A8Q9rFX4iIa/rJoiJwiZBXJQSAhKzAKaTjJY5PnrxIhLx6qlDXZkQsIvVgNmHsK5P+h2Aj
	bWzGXs46f3YcO2AdthWxC1K/CVY0ANXP3sQHjmMBGXCO37VaZ9dzbIFbI12gw8u8d5fzKk2z9VsCU
	qmCst59khVfjfXgkuoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0Ic-00000003foP-0YRX;
	Mon, 05 Feb 2024 14:50:18 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0IZ-00000003fn0-1Yn3
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 14:50:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3E7DC0006;
	Mon,  5 Feb 2024 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707144612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxnkPK0aYtgTS6nZQaM0kMaiEPc4+MnQQKy76Kr6FOw=;
	b=PqK4/LodabUEXbS6Myk3Orf5lht8ZLXJGWRu6g0ykzgaOQMp4uCpI81FMC9+Zvhqe5BNc4
	rQoUNsnQ+Bs8y2Bo3Hw4B/KbC+qWMiqzo0it0850nG1+HUTjVGoLkzJrMjjBj5zb/ElK7P
	Wl9n50Cn/SPY57v8EBxJuK2HN8omD6mUauW3iENYAAUWmOZAV6QdN66RzO+8mzlt2TzsHf
	4DoxKvH0AVXd4cupwHbzKDcKVupzUlfHrX3OF0IkqTBj7ZGBhCov88UtggZ0XWStfxCNj9
	BS/kBo9XXFcOBS+g1U11IHMkZFQip8EoWs0KIM25jBxZiflSRLO/l9NRUrAy8g==
Date: Mon, 5 Feb 2024 15:50:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Zhenhua Huang <quic_zhenhuah@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, quic_tingweiz@quicinc.com,
 richard@nod.at, vigneshr@ti.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 quic_bjorande@quicinc.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: avoid automatically select from
 mtd.yaml
Message-ID: <20240205155011.7f27bb07@xps-13>
In-Reply-To: <170542500495.126061.10553621105906619365.robh@kernel.org>
References: <1704885705-7486-1-git-send-email-quic_zhenhuah@quicinc.com>
	<170542500495.126061.10553621105906619365.robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_065015_585733_A281B35E 
X-CRM114-Status: GOOD (  14.98  )
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

SGksCgpyb2JoQGtlcm5lbC5vcmcgd3JvdGUgb24gVHVlLCAxNiBKYW4gMjAyNCAxMToxMDowNSAt
MDYwMDoKCj4gT24gV2VkLCAxMCBKYW4gMjAyNCAxOToyMTo0NSArMDgwMCwgWmhlbmh1YSBIdWFu
ZyB3cm90ZToKPiA+IFRoZSBtdGQgYmluZGluZyBpcyBhbHdheXMgJHJlZidlZCBieSBvdGhlciBi
aW5kaW5ncywgZGVmYXVsdCBzZWxlY3Rvcgo+ID4gc2hvdWxkIGJlIGZyb20gb3RoZXIgYmluZGlu
ZyBmaWxlcyB3aGljaCByZWYnZWQgaXQuIE5vdywgIiRub2RlbmFtZSIgaW4KPiA+IG10ZC55YW1s
IHR1cm5zIGludG8gYSAic2VsZWN0IiBhdXRvbWF0aWNhbGx5IHN1Y2ggdGhhdCBhIGZldyBiaW5k
aW5nIGNoZWNrCj4gPiBpc3N1ZXMgcmVwb3J0ZWQgYmVjYXVzZSBpdCBjb25mbGljdHMgd2l0aCBz
cmFtIGRldmljZXMoZWcsIHFjb20saW1lbS55YW1sLAo+ID4gcnVsZXMgaW4gZm9sZGVyIHNyYW0v
KikKPiA+IAo+ID4gVG8gYXZvaWQgdGhlIGF1dG9tYXRpY2FsbHkgY3JlYXRlZCAic2VsZWN0IiBp
biBtdGQueWFtbCwgYWRkaW5nOgo+ID4gCj4gPiBzZWxlY3Q6IGZhbHNlCj4gPiAKPiA+IFN1Z2dl
c3RlZC1ieTogQmpvcm4gQW5kZXJzc29uIDxxdWljX2Jqb3JhbmRlQHF1aWNpbmMuY29tPgo+ID4g
Rml4ZXM6IDdiZGM2NzE4MjJlOSAoImR0LWJpbmRpbmdzOiBtdGQ6IHBoeXNtYXA6IFJldXNlIHRo
ZSBnZW5lcmljIGRlZmluaXRpb25zIikKPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW5odWEgSHVhbmcg
PHF1aWNfemhlbmh1YWhAcXVpY2luYy5jb20+Cj4gPiAtLS0KPiA+IEhpIEJqb3JuLAo+ID4gCj4g
PiBBcyB0aGUgaWRlYSBpcyBmcm9tIHlvdXIgY29tbWVudCwgSSBhZGRlZCAiU3VnZ2VzdGVkLWJ5
IiB5b3UuCj4gPiBQbGVhc2UgdGVsbCBtZSBpZiB0aGF0J3Mgbm90IHN1aXRhYmxlLiBUaGFua3Mu
Cj4gPiAKPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC55YW1s
IHwgMiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ICAgCj4gCj4g
QWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG10ZC9u
ZXh0LCB0aGFua3MhCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
