Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93C3C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:12:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B334E2084A
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 11:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dru6gti9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B334E2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaqebwOBAxp9rrGE6uWwb5NhcBpCIL7jfWfTX9vuFrA=; b=dru6gti9wiADEi
	KnelEtvLml/b7Xh7DiXBmBMt1fzm9VyuX/dZobiXtZurGJRuknKqwE1s2kxpigsyfmjFrSOBfKNNV
	bH6yOTKLNbAo4bhwdSs3A3UOpa++EOEpD756BVKAL8ha5CCiDeBln+448ei0mQDnBgv+AEW0M9pr8
	8CsxyhySDLzhN1TT0xa+MKJ4nGo1QwyWrCL3N/MVGJOmjJOmkk0wbnBTQ7q2pLxBQSbtIowmYE3s6
	44XucLVSztK5BxyD7MMgleoQ0hoeZY3EvODncxzvFqwtQcwA4KC2Ys+lm0X2kPzrbjTl7le6nppXS
	anNbk3/iRFR2dqtn7Qwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gltz8-0005zj-Vn; Tue, 22 Jan 2019 11:12:50 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gltz6-0005zL-6q
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 11:12:49 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 5ED702078C; Tue, 22 Jan 2019 12:12:46 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id 2105D206DC;
 Tue, 22 Jan 2019 12:12:36 +0100 (CET)
Date: Tue, 22 Jan 2019 12:12:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: rework partitions handling
Message-ID: <20190122121236.341d22f4@xps13>
In-Reply-To: <20190117212916.70ad1269@bbrezillon>
References: <20190117152929.28256-1-miquel.raynal@bootlin.com>
 <20190117152929.28256-2-miquel.raynal@bootlin.com>
 <20190117212916.70ad1269@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_031248_385232_F053F6A9 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgo+ID4gIGludCBtdGRfYmxvY2tfbWFya2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgbG9mZl90IG9mcykKPiA+ICB7Cj4gPiAtCWlmICghbXRkLT5fYmxvY2tfbWFya2JhZCkKPiA+
ICsJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOwo+ID4gKwlp
bnQgcmV0Owo+ID4gKwo+ID4gKwlpZiAoIW1hc3Rlci0+X2Jsb2NrX21hcmtiYWQpCj4gPiAgCQly
ZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAgCWlmIChvZnMgPCAwIHx8IG9mcyA+PSBtdGQtPnNpemUp
Cj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICAJaWYgKCEobXRkLT5mbGFncyAmIE1URF9XUklU
RUFCTEUpKQo+ID4gIAkJcmV0dXJuIC1FUk9GUzsKPiA+IC0JcmV0dXJuIG10ZC0+X2Jsb2NrX21h
cmtiYWQobXRkLCBvZnMpOwo+ID4gKwo+ID4gKwlyZXQgPSBtYXN0ZXItPl9ibG9ja19tYXJrYmFk
KG1hc3RlciwgbXRkX2dldF9tYXN0ZXJfb2Zmc2V0KG10ZCwgb2ZzKSk7Cj4gPiArCWlmIChyZXQp
Cj4gPiArCQlyZXR1cm4gcmV0Owo+ID4gKwo+ID4gKwl3aGlsZSAobXRkLT5wYXJlbnQpIHsKPiA+
ICsJCW10ZC0+ZWNjX3N0YXRzLmJhZGJsb2NrcysrOwo+ID4gKwkJbXRkID0gbXRkLT5wYXJlbnQ7
Cj4gPiArCX0gIAo+IAo+IE5vdCBleGFjdGx5IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IGlm
IHdlIG1hcmsgYSBibG9jayBiYWQgb24gdGhlCj4gbWFzdGVyIGRldmljZSB0aGlzIGluZm9ybWF0
aW9uIGlzIG5vdCBwcm9wYWdhdGVkIHRvIHBhcnRzIGV4cG9zaW5nIHRoaXMKPiBibG9jay4KCk5v
IGJ1dCBpcyB0aGlzIGltcG9ydGFudD8gSXQgaXMgdmVyeSBxdWljayB0byBnZXQgdXAgdG8gdGhl
IG1hc3RlcgpkZXZpY2Ugc28gdGhlIHBlbmFsdHkgZm9yIGRvaW5nIHRoYXQgaXMgYWxtb3N0IG5v
bi1leGlzdGVudC4KCk90aGVyIGNvbW1lbnRzIGFkZHJlc3NlZCwgdGhhbmtzIGZvciB0aGUgcmV2
aWV3LgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
