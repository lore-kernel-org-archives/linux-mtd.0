Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A420C25B7C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnlqd1U+mHn/EbPZmDTgLYJ7SzpT8VmXZR4hGnN5Fps=; b=QxUvNEuNBoBtIg
	Y89aTDT+SugyvGnGEqPQT0/WQgZOs88MRceMUh0kfS7ZheZblqjUO15X/yT/M/WMuKq07bhRxFOGy
	zjiPgrnIILcZDMbJPxqV7I10oZswcU5byAKlGOXbsCfZ6UXrQAQOxx6PBDs7iljJpul8LO4jA+jbL
	MsotjCSuTX9lgUyVCv0ya7PrVJHRFMXeEVcqXHa3JZ5yW9Xb37rTGpqSXWvHiYxNi14mh5ymKN/lG
	zQiXtT6ilsUp/eCvOrKXd+ab73DnmF+OF93brMrRKQnXmpIuORmHhqWeXwooGvsHqCNkCjZzxLv9r
	TmwgU8gxhPzmovzchVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwFo-00000000dsC-0AOa;
	Tue, 28 May 2024 12:48:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwFk-00000000dqU-0DNN
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 12:48:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4721FF809;
	Tue, 28 May 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716900506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLJWkJDSvhOXa3XSbG71htDtV3QhuWVrpRwUqqioGx0=;
	b=ICY6tl549JvPFPlVwt7iObOMHzhwO2lt67WGlfgFejMB/CKbBgh0rHR0kbXuCmasmx4bAF
	X/za9QNoeNAJlaHCDrzMsH+35b9WPdDGQpZ7AHVDDay3ObaxU2lQj8Dc3JH6fJmX8qW8AJ
	h3HlXE4vvI9RI8NreTXfiU6d/1ZwADbZKLSNSjlRvrrin8YNfItjGk5eWQDCAHal0Iv9pC
	hjiVU6v+VeEwDNHxhfAKOnjCN4Xs62Z9A/i2yii7l2bdqsNKzLNC/rWvHIzZEE6Qna5ZTq
	UxnZB3XMLJO/2rXiu8CDVjQM98YnjqCKGP+MsBKcRMAxwH4LXtfx/AuUo9IPpQ==
Date: Tue, 28 May 2024 14:48:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
Message-ID: <20240528144823.2ec929f6@xps-13>
In-Reply-To: <20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
References: <20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com>
	<20240528-fsl-ifc-config-v2-1-5fd7be76650d@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_054832_389329_BC47CD44 
X-CRM114-Status: UNSURE (   8.13  )
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

SGkgRXNiZW4sCgplc2JlbkBnZWFuaXguY29tIHdyb3RlIG9uIFR1ZSwgMjggTWF5IDIwMjQgMTQ6
Mjg6NTIgKzAyMDA6Cgo+IFdoaWxlIHVzZSBvZiBmc2xfaWZjIGRyaXZlciB3aXRoIE5BTkQgZmxh
c2ggaXMgZmluZSwgYXMgdGhlIGZzbF9pZmNfbmFuZAo+IGRyaXZlciBzZWxlY3RzIEZTTF9JRkMg
YXV0b21hdGljYWxseSwgd2UgbmVlZCB0aGUgQ09ORklHX0ZTTF9JRkMgb3B0aW9uIHRvCj4gYmUg
c2VsZWN0YWJsZSBmb3IgcGxhdGZvcm1zIHVzaW5nIGZzbF9pZmMgd2l0aCBOT1IgZmxhc2guCj4g
Cj4gRml4ZXM6IGVhMGMwYWQ2YjZlYiAoIm1lbW9yeTogRW5hYmxlIGNvbXBpbGUgdGVzdGluZyBm
b3IgbW9zdCBvZiB0aGUgZHJpdmVycyIpCj4gU2lnbmVkLW9mZi1ieTogRXNiZW4gSGFhYmVuZGFs
IDxlc2JlbkBnZWFuaXguY29tPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
