Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB6C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 19:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DE9C610A0
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 19:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DE9C610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHUQD+1eFWz4a31zJ7VsX7a54a8dvXvWPXS5UbiInGQ=; b=CnfSWUZ++oK08V
	fYdptetRtXm9UIjIFcK+46bhDwUKED7KU0wPbySZrNn201ZkrJn4UBYN2ofruets9ZcFacHGjmQ8l
	HObZUUSiLaVufBYUTFxRG751vz57TQzAxJqU8tSEw8NuwEtq1qQSUgE3mnFnG9Bl+fqSfwaHYLz5Q
	V6LRR0cbr1IyJNdpm8mloBrtOO1pdDN2KAAlhBbWezdxIR1ErsjQ0jX+1YwtK9E4wcGD02Q+3vOKW
	pzqBmyF54YalZeRsmq9GwFJEm5KkGytgMpRzmUCuzNM4n0MzTJYEqBx+PbgzSwCh7lwvEk8bkTRfh
	OZjik/uIsUgmqk75Hk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGnJX-009K3w-17; Thu, 19 Aug 2021 19:02:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGnJT-009K36-1y
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 19:02:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9EAA26000C;
 Thu, 19 Aug 2021 19:02:47 +0000 (UTC)
Date: Thu, 19 Aug 2021 21:02:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd-physmap: Add 'arm,vexpress-flash'
 compatible
Message-ID: <20210819210246.76845e46@xps13>
In-Reply-To: <20210819182427.1175753-1-robh@kernel.org>
References: <20210819182427.1175753-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_120251_275258_AA3F4B79 
X-CRM114-Status: GOOD (  13.33  )
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gVGh1LCAxOSBB
dWcgMjAyMSAxMzoyNDoyNyAtMDUwMDoKCj4gVGhlICdhcm0sdmV4cHJlc3MtZmxhc2gnIGNvbXBh
dGlibGUgaXMgaW4gdXNlLCBidXQgaGFzIG5ldmVyIGJlZW4gZG9jdW1lbnRlZCwKPiBzbyBhZGQg
aXQgbm93Lgo+IAo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IENjOiBWaWduZXNo
IFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
PiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQtcGh5c21h
cC55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC1waHlzbWFw
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC1waHlzbWFw
LnlhbWwKPiBpbmRleCAxM2MyOWNjOTFiNTkuLmY4Mjc5ODQ5MzZmNiAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC1waHlzbWFwLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL210ZC1waHlzbWFwLnlh
bWwKPiBAQCAtMjMsNiArMjMsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICAgIC0gYW1k
LHMyOWdsMjU2bgo+ICAgICAgICAgICAgICAgIC0gYW1kLHMyOWdsNTEybgo+ICAgICAgICAgICAg
ICAgIC0gYXJtLHZlcnNhdGlsZS1mbGFzaAo+ICsgICAgICAgICAgICAgIC0gYXJtLHZleHByZXNz
LWZsYXNoCj4gICAgICAgICAgICAgICAgLSBjb3J0aW5hLGdlbWluaS1mbGFzaAo+ICAgICAgICAg
ICAgICAgIC0gY3lwcmVzcyxoeXBlcmZsYXNoCj4gICAgICAgICAgICAgICAgLSBnZSxpbXAzYS1m
aXJtd2FyZS1taXJyb3IKCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
