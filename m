Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36DAC4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:48:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA9C20855
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 11:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M2K009il"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA9C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT1FhD+TWcRbY5CRyGcNh5wLUE3Tek+Qh66SlLXkIrQ=; b=M2K009ilNGL20h
	WCgFxt9BAQyvNX1u5gqcCAHf4NUIsvNT3jThmN3Uc4ijV8dnOH/+Ha9C3m3RUR8V27mqv+1u3z47Z
	PvQ0NUd8kqkAfWTkz5fg51cF7rXQvaayTejDAVA74rMEZw3rl8UKoosuPT1ifdIdPwCFrvGGM0aE1
	A8IvbeWRMEeZZuv7enS+BvRjWz00/Er66Q67aLHu5xe49JECx8xA5A0ubRHF07kEAbQJzK5pPB7wJ
	sr8RwMn2K2APo21ybLtDP5tlVrMCZ/ayoAzV8TfVFTO6xOsjKewr5LxE9TfdYnef/BIHqN5sMCOZN
	7w61JSNKtQv7S69/IC4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmqK-00056N-AM; Thu, 21 Feb 2019 11:48:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmq6-0004s0-S3; Thu, 21 Feb 2019 11:48:35 +0000
X-Originating-IP: 90.88.23.190
Received: from xps13 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr
 [90.88.23.190]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2E55F20003;
 Thu, 21 Feb 2019 11:48:27 +0000 (UTC)
Date: Thu, 21 Feb 2019 12:48:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [RFC PATCH 08/27] mtd: nand: ecc: Use SPDX license identifier
 for the software BCH code
Message-ID: <20190221124826.0fdb0875@xps13>
In-Reply-To: <20190221122538.414750f7@kernel.org>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
 <20190221100216.25255-9-miquel.raynal@bootlin.com>
 <20190221122538.414750f7@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_034831_275418_6A5BD111 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJicmV6aWxsb25Aa2VybmVsLm9yZz4gd3JvdGUg
b24gVGh1LCAyMSBGZWIgMjAxOQoxMjoyNTozOCArMDEwMDoKCj4gT24gVGh1LCAyMSBGZWIgMjAx
OSAxMTowMTo1NyArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+IAo+ID4gUmVtb3ZlIHRoZSBsZWdhY3kgbGljZW5zZSB0ZXh0LCBhbHNvIHVw
ZGF0ZSB0aGUgTU9EVUxFX0xJQ0VOU0UgbWFjcm8KPiA+IGluIGFjY29yZGFuY2Ugd2l0aCB0aGUg
dGV4dCBhdCB0aGUgdG9wIG9mIHRoZSBmaWxlIChHUEwgdjIgb3IKPiA+IGhpZ2hlcikuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL2VjYy9zdy1iY2gtZW5naW5lLmMgICB8
IDE3ICsrLS0tLS0tLS0tLS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tdGQvbmFuZC1zdy1iY2gt
ZW5naW5lLmggfCAgNSArLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
ZWNjL3N3LWJjaC1lbmdpbmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvZWNjL3N3LWJjaC1lbmdpbmUu
Ywo+ID4gaW5kZXggMzdkYzBmMDA2MWQzLi44NzFjNGRkOWY3MWQgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL2VjYy9zdy1iY2gtZW5naW5lLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvZWNjL3N3LWJjaC1lbmdpbmUuYwo+ID4gQEAgLTEsMjIgKzEsOSBAQAo+ID4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gIC8qCj4gPiAgICogVGhpcyBmaWxl
IHByb3ZpZGVzIEVDQyBjb3JyZWN0aW9uIGZvciBtb3JlIHRoYW4gMSBiaXQgcGVyIGJsb2NrIG9m
IGRhdGEsCj4gPiAgICogdXNpbmcgYmluYXJ5IEJDSCBjb2Rlcy4gSXQgcmVsaWVzIG9uIHRoZSBn
ZW5lcmljIEJDSCBsaWJyYXJ5IGxpYi9iY2guYy4KPiA+ICAgKgo+ID4gICAqIENvcHlyaWdodCDC
qSAyMDExIEl2YW4gRGplbGljIDxpdmFuLmRqZWxpY0BwYXJyb3QuY29tPgo+ID4gLSAqCj4gPiAt
ICogVGhpcyBmaWxlIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFu
ZC9vciBtb2RpZnkgaXQKPiA+IC0gKiB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUKPiA+IC0gKiBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkKPiA+
IC0gKiBsYXRlciB2ZXJzaW9uLgo+ID4gLSAqCj4gPiAtICogVGhpcyBmaWxlIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCBXSVRIT1VUCj4gPiAt
ICogQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YgTUVS
Q0hBTlRBQklMSVRZIG9yCj4gPiAtICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
ICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gPiAtICogZm9yIG1vcmUgZGV0
YWlscy4KPiA+IC0gKgo+ID4gLSAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCj4gPiAtICogd2l0aCB0aGlzIGZp
bGU7IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwK
PiA+IC0gKiA1OSBUZW1wbGUgUGxhY2UsIFN1aXRlIDMzMCwgQm9zdG9uLCBNQSAwMjExMS0xMzA3
IFVTQS4KPiA+ICAgKi8KPiA+ICAKPiA+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiA+IEBA
IC0yMjcsNiArMjE0LDYgQEAgdm9pZCBuYW5kX2JjaF9mcmVlKHN0cnVjdCBuYW5kX2JjaF9jb250
cm9sICpuYmMpCj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0wobmFuZF9iY2hfZnJlZSk7Cj4gPiAg
Cj4gPiAtTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIi
KTsgIAo+IAo+IEdQTCB3YXMgY29ycmVjdCBoZXJlLCBzZWUgWzFdCj4gCj4gWzFdaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMC1yYzcvc291cmNlL2luY2x1ZGUvbGludXgvbW9k
dWxlLmgjTDE3NQoKT2ggcmlnaHQsIHRoZW4gaXQncyB0aGUgc2FtZSBmb3IgdGhlIHNpbWlsYXIg
cGF0Y2ggb3ZlciB0aGUgSGFtbWluZwpmaWxlLiBJIHdpbGwgY29ycmVjdCBib3RoLCB0aGFua3Mg
Zm9yIHBvaW50aW5nIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
