Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA8EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE1bu4CeLtKqCYJYAeOzCNEMuyspNQwApxUGqg598vE=; b=0rH25G5R7z+BIX
	gZd/Rdo+SU7bxk/EFS3/LTmBHWJBhx1f1DWmlds9K57HaBZW9AVwMkKgh+rFd9i5CsZD4ZFLU8iPx
	tezVKxQqWFahlf4ZE2a7PvwHIO6vCTGWtDyYILD0w8+r4QAIZpIWYZH3ZnH6zcVcZ2qu7vt8OzAYD
	k8BFpzAx1RqR76ujaOBflGlNgVRVD0SkPI5xIpZBOYKwrLoWRnIeVwOPn1Ecxnf1fTkltTqEIoTJI
	UNO4jLOnrBqy+vRDPOklGkkXZqfh2iHMw04yK8u52LSiJZujxWa0PP/QmatHbQZODzo8Uvl1YFY1e
	oXH6oyt9OEDU9Htm6ttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDyw-000qGQ-21;
	Mon, 17 Jul 2023 02:29:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDyo-000q9s-15;
	Mon, 17 Jul 2023 02:28:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D18BC60ED8;
	Mon, 17 Jul 2023 02:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEED7C433C8;
	Mon, 17 Jul 2023 02:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689560933;
	bh=ejBD3XkhCO/UH62OTfSc7SBKEe7/SmzV53hDY47N3sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmHbBBNOwXq7wsLMO9kfWVYk1Q1T3FJjubd+Fz6C0qkcBLMLMCePjo3o01d9P1UCM
	 9TiMawX7L/3A7gDFYaYxx+htxIcEBg4sRXtmA+0J0+Avi7BvQSrgXZoTbIHTLQDNt4
	 2t8vl/omFZejqpWhk4EJLRXPGAMfMSEIfZAlMGvuInSF7lMDbcgMNy7VWb9ETknAnd
	 Q97OApdTY3vcAIR8J9qJc3ZMhrscACAKmb1zYHc9o3QvFsSxHCpHH7EGS3CMnMDI3j
	 vsui+r/elpWQcAUkNPOdvyzpmht8y3jtG9E7De2pUnQ+p0InCbeK95s7rP2h1TJ2+z
	 RY0ussd4tVPlA==
Date: Mon, 17 Jul 2023 07:58:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] mtd: rawnand: qcom: Fix the spacing
Message-ID: <20230717022841.GD5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-5-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_192854_837293_FA984E09 
X-CRM114-Status: GOOD (  15.15  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MDhQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBGaXggZm9sbG93aW5nIGNoZWNrcGF0Y2ggd2FybmluZzoKPiAJIkNIRUNLOiBQbGVh
c2UgZG9uJ3QgdXNlIG11bHRpcGxlIGJsYW5rIGxpbmVzIgo+IAkiQ0hFQ0s6IFBsZWFzZSB1c2Ug
YSBibGFuayBsaW5lIGFmdGVyCj4gCQlmdW5jdGlvbi9zdHJ1Y3QvdW5pb24vZW51bSBkZWNsYXJh
dGlvbnMiCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KCkFja2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVs
Lm9yZz4KCi0gTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJp
dmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggNTRhN2I0OWJkYTg3Li41NTRj
Y2EzODAxZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gQEAgLTE5OTcsNyAr
MTk5Nyw2IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY193cml0ZV9wYWdlKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIGNvbnN0IHU4ICpidWYsCj4gIAkJCW9vYl9zaXplID0gZWNjLT5ieXRlczsKPiAg
CQl9Cj4gIAo+IC0KPiAgCQl3cml0ZV9kYXRhX2RtYShuYW5kYywgRkxBU0hfQlVGX0FDQywgZGF0
YV9idWYsIGRhdGFfc2l6ZSwKPiAgCQkJICAgICAgIGkgPT0gKGVjYy0+c3RlcHMgLSAxKSA/IE5B
TkRfQkFNX05PX0VPVCA6IDApOwo+ICAKPiBAQCAtMjM3Myw2ICsyMzcyLDcgQEAgcWNvbV9uYW5k
Y19jYWxjX2VjY19ieXRlcyhpbnQgc3RlcF9zaXplLCBpbnQgc3RyZW5ndGgpCj4gIHsKPiAgCXJl
dHVybiBzdHJlbmd0aCA9PSA0ID8gMTIgOiAxNjsKPiAgfQo+ICsKPiAgTkFORF9FQ0NfQ0FQU19T
SU5HTEUocWNvbV9uYW5kY19lY2NfY2FwcywgcWNvbV9uYW5kY19jYWxjX2VjY19ieXRlcywKPiAg
CQkgICAgIE5BTkRDX1NURVBfU0laRSwgNCwgOCk7Cj4gIAo+IC0tIAo+IDIuMzQuMQo+IAoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
