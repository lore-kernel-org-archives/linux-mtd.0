Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DE5D68BCF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPaqNvKRvJaCYEeudMglBOzsIVmj/tScGQXsE2ZYnOA=; b=F12XVMQQ3BqYY8
	IbxeahdQ5wAi9Ui7ZtvjwZsfilHFc23HPPOjknKfnr5zIlA+yLgIpBYSFO1OU4HtiKu9uH86/+TIH
	WDba0qPmNHkAPvHnf/dQuens8XSpiEC/g+k/L1OFI3Y0njbopqMHcAD7xT3eOIFFOT8vzhwpmrqoq
	Ujxh+g0wyCNB9ZZ82oM23si9oZZ7Z4J0aW69YoX+PIwb16qPhJ59oJ3ZDZowNjAmjd8iXQAF6B8aS
	WttKKvTDbFMw+An7ejLqg5LtH5c4J2qh/ihcP1WMTZItXXYmA3RxK9v6WMrv1rmSgMiMEEJDk6W37
	lNdncmCE8uu0syOiG/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2Il-00000003uii-3RkI;
	Fri, 15 Nov 2024 19:48:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2Ii-00000003uhz-2Wso
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 19:48:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E5991C0005;
	Fri, 15 Nov 2024 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731700091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zidj6aK4ZzZS5mK+WBisxr8dK9UXKfKqNFz5dL1Vybo=;
	b=Bh0o2tXCaWlJ/kPdhW1p2kKgtneIYHjFijVrY4kE+oazMUmXua9ga6YDQywPhiQ3Q2VmnW
	d8ybYCDwQ1i0eNlHJJhq8YADAvFgYVvelvoNuzs7fK9yND5+9W0YEsDkHgijWy4OcfSOBA
	njdAdj7GTBJiOlWh7uIPSWl3fnzYV067iP6TE3J92yft64lkSnfYbZGy+PMkLdnyn9IS0g
	hcDApdX2+LxmbSrQ/8Q8guKFKTULDGqQFYC/ruetmm9o7yyodz+qVNx/6yf6w+dehqDLtT
	GH3VLkvdQQ833m5bu6ohnQLyLkNBUsdLmBQRDyBMn7ZWsrsoolnW0m4tWJvINw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/2] mtd: nand: davinci: add support for on-die ECC
 engine type
In-Reply-To: <ZzcL53TmSOwTuIFM@gmail.com> (Marcus Folkesson's message of "Fri,
	15 Nov 2024 09:52:55 +0100")
References: <20241107-ondie-v7-0-98829fc8a958@gmail.com>
	<20241107-ondie-v7-1-98829fc8a958@gmail.com>
	<ZzcL53TmSOwTuIFM@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Fri, 15 Nov 2024 20:48:09 +0100
Message-ID: <871pzcnurq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_114816_769509_4CDA1B64 
X-CRM114-Status: GOOD (  10.30  )
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

T24gMTUvMTEvMjAyNCBhdCAwOTo1Mjo1NSArMDEsIE1hcmN1cyBGb2xrZXNzb24gPG1hcmN1cy5m
b2xrZXNzb25AZ21haWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDI6
NDc6MDdQTSArMDEwMCwgTWFyY3VzIEZvbGtlc3NvbiB3cm90ZToKPj4gU29tZSBjaGlwcywgZS5n
LiBNaWNyb24gTVQyOUYxRzA4QUJCRkFINCwgaGFzIGEgbWFuZGF0b3J5IG9uLWRpZSBFQ0MuCj4+
IEFkZCAib24tZGllIiBhcyBFQ0MgZW5naW5lIHR5cGUgaW4gb3JkZXIgdG8gYmUgY29tcGF0aWJs
ZSB3aXRoIHRob3NlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWFyY3VzIEZvbGtlc3NvbiA8bWFy
Y3VzLmZvbGtlc3NvbkBnbWFpbC5jb20+Cj4+IC0tLQo+Cj4gQ2FuIHNvbWVvbmUgcGxlYXNlIHRh
a2UgYSBsb29rIGF0IHRoaXMgcGF0Y2g/CgpXZWxsLCBpdCdzIHY3LCBzbyBJIGJlbGlldmUgd2Un
dmUgZ2l2ZW4gYXR0ZW50aW9uIHRvIHRoaXMKcGF0Y2hzZXQgOi0pIEFsc28sIHBsZWFzZSBjb25z
aWRlciAyIHdlZWtzIGFzIGEgYmV0dGVyIGRlbGF5IGZvciBwaW5ncy4KCkl0IGlzIGZsYWdnZWQg
Im9rYXkiIG9uIG15IHNpZGUsIGJ1dCB3aWxsIG9ubHkgYmUgYXBwbGllZCBhZnRlciAtcmMxCnVu
bGVzcyBJIGdldCBuZWdhdGl2ZSBmZWVkYmFjayBhYm91dCBpdCBpbiB0aGUgbWVhbiB0aW1lLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
