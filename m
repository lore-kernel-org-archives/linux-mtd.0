Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40AACD13CF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvcHwN3RuJXVDwREB5TM771cYxyWqiEXNVCzV0/gtlM=; b=O8EvRhl7C1OSXH
	nmAZwyIpsicWbpabXmwdCLtuvoIrEbunmvMbITm1T3z+fisu/Jd40J0d+SxBjrd4wPB8bicrvRjdA
	0rTX4CrNRs9AulzYTiaNrwbKv4qF5K49SIj+hN0jI76SEablgddyvWR5zWUvTM+129GoLOIH9RlZT
	nYSLxZFGHleTDcFYiW83aEXgKfFJ4LZj+YcYA1qFfTDOUMzHNaTcDJW5ANA7ZhMEHfJp2DYVWA/yn
	Y11+XN9Yv6cxIePhRpwxPZwPftJ5YYUN3tpVFpE996ggl31E5l/XL6qdvaMoxHlb8ypnpNZMFG0Qf
	XJeUDFdjiIxaRCCvlr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7qU-0000000EcQD-2PvQ;
	Mon, 02 Sep 2024 14:15:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7qQ-0000000EcOn-3X1k
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 14:15:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F11F024000B;
	Mon,  2 Sep 2024 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725286547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOSscpEkGa8ztu4bWIy6JMXncsbMSioQscFLJZpRFy8=;
	b=NaBkOlsx82b0muYAnPtFPlQxzwMuxdw+Y5othV1AQKOuVoi2GnSwP2mDoOnGfl9VjutxoC
	LRsmTfXcAwnCJ6zZUZpNi7V7oSFhZ/5A5IAkPBskcTKUAGjfpGUzqqC398EbnOwTnOt0B8
	1z9ZGmBDqdWh42aT1Le0X9SNqKH26owrm38dUuWb/pnku2H7V3X44A36+aT2CJy7roPgXA
	7kmX/9nyClohjwTSHmSLbSnIlr9NToq56GpjaIEiHlSNwE5uYNAwiZ6ZgOWxptCgrrXWLu
	IHkju4Y/yVxRygvQBrPYkODCG42uYG8jY4/b5Gt0jqd/biPjaCr5XrwMBbLQ7w==
Date: Mon, 2 Sep 2024 16:15:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Roger Quadros <rogerq@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Nishanth Menon <nm@ti.com>, srk@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti, gpmc-nand: support partitions
 node
Message-ID: <20240902161545.3ca266de@xps-13>
In-Reply-To: <20240830174302.GA551760-robh@kernel.org>
References: <20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org>
	<20240830174302.GA551760-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_071551_043386_596AFD1D 
X-CRM114-Status: UNSURE (   7.81  )
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

SGksCgo+ID4gKyAgcGFydGl0aW9uczoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRl
c2NyaXB0aW9uOgo+ID4gKyAgICAgIE5vZGUgY29udGFpbmluZyBkZXNjcmlwdGlvbiBvZiBmaXhl
ZCBwYXJ0aXRpb25zLgo+ID4gKwo+ID4gIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+ID4gICAgIkBbMC05
YS1mXSskIjoKPiA+ICAgICAgJHJlZjogL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9u
LnlhbWwgIAo+IAo+IFRoaXMgYW5kIHRoZSBhZGRpdGlvbiBzaG91bGQgYmUgcmVwbGFjZWQgd2l0
aCBhIG10ZC55YW1sIHJlZmVyZW5jZS4KClllcywgaW5kZWVkLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
