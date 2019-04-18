Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_RHS_DOB autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC8C10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B4E20693
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZBzKZOA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B4E20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNXWn3Eqap8PwhKERYWgkM56y7chzFK4xFjwTH8tCWk=; b=MZBzKZOA1i6qsV
	pLnJI/kRSfcGNj90jwZlDLzULa+h5iOzEpzYJOd4ofklCHvln5lOBx36hdIRUBfrA+Af+ZRh0WZky
	6plH9zoKtw2bc4A6hqZbamVOLnWef5lSEV1+RWGMU5ykFgZa60UqYACappJN7BB9Ipw14yKayRLxx
	X4PDPpH2Bc6lMycVwiEubi/5N4cSAQFVO8PPQ7tXzIwUSTI5Ao3QmaBqTcMSNdF+gYsumHbomYw9C
	BBPQBKiS8oD3ULsmjimstSmaUukYowAoOtu1vdiJETFVBSPrwnGeGCUIr/7EvE1bcInZjdbvzaNdp
	cdCFgbySgZ/yln9XdDQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9WS-0003r7-34; Thu, 18 Apr 2019 16:04:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9WJ-0003l3-Q2; Thu, 18 Apr 2019 16:04:17 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4E8A020006;
 Thu, 18 Apr 2019 16:04:01 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:03:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 0/6] mtd: nand: 6th batch of cleanups (Kconfig)
Message-ID: <20190418180359.12073fef@xps13>
In-Reply-To: <20190304222226.12682-1-miquel.raynal@bootlin.com>
References: <20190304222226.12682-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_090415_992263_390820D2 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBNb24sICA0IE1hciAyMDE5CjIzOjIyOjIwICswMTAwOgoKPiBIZWxsbywKPiAKPiBUaGlzIGlz
IGEgc21hbGwgcHJlcGFyYXRpb24gc2VyaWVzIGZvY3VzZWQgb24gTWFrZWZpbGUvS2NvbmZpZwo+
IGZpbGVzLiBUaGUgZ29hbCBpcyB0byBjbGFyaWZ5IHdoYXQgaXMgY29tcGlsZWQgaW4gdGhlIE5B
TkQgc3Vic3lzdGVtLAo+IHJhdyBOQU5EIGNvbnRyb2xsZXIgZHJpdmVycywgU1BJLU5BTkQgY29u
dHJvbGxlcnMgYW5kIHNvb24gRUNDCj4gZW5naW5lcy4gUGxlYXNlIGhhdmUgYSBsb29rIHdpdGgg
YSBtZW51Y29uZmlnIGF0IHRoZSBuZXcgcHJlc2VudGF0aW9uLAo+IEkgZmVlbCBpdCBpcyBtdWNo
IG1vcmUgcmVhZGFibGUgYW5kIHVuZGVyc3RhbmRhYmxlLiBNb3JlIGNoYW5nZXMgd2lsbAo+IGNv
bWUgaW4gdGhlc2UgS2NvbmZpZyBmaWxlcyB3aGVuIGFkZGluZyB0aGUgRUNDIGVuZ2luZSBnZW5l
cmljIGxheWVyLgo+IAo+IFJlZ2FyZHMsCj4gTWlxdcOobAo+IAoKU2VyaWVzIGFwcGxpZWQgd2l0
aCBBbmRlcnMnIGZpeGVzIHNxdWFzaGVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
