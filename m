Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CBEC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 21:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6282076D
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 21:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="heSluaXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6282076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOKAWshT7mEFi3EWkY4qI+2LZvesMFyfX3rPcGZHAA4=; b=heSluaXU+/n5mR
	EWpQd7skaz35wxozpxDWu8TLttde/h2WF+1ywPLgdPuRMw0OELspHPwSs5D2BlKzgH7hhRKSbOkej
	o/0wLjPElxhKCFBWJkzjzb0duSq4TvuSIUdO9DW6ae0+wLfSs0cPMFktUAmtrbr/pQ2XfT9UZpES8
	ZWR+giJUpd8ccUL004TZmt/LtP/X2hgqmKZcILq0MD231mIGc01+vbahAoeVm16AgrVYuyvZ4X/+m
	J8bt0woQAHhqeWgPu4p2/PFt3N/ZUp/s39IyIc7KZgUT9NS/GAkLWpQFSEVokdNWLJV7/qBoOnSdp
	sPdiuyOld4963uClS+tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWRK7-0002so-N6; Wed, 06 May 2020 21:11:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWRK5-0002sH-At
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 21:11:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 869602A23D7;
 Wed,  6 May 2020 22:11:19 +0100 (BST)
Date: Wed, 6 May 2020 23:11:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506231116.2d16b747@collabora.com>
In-Reply-To: <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
 <20200506224016.2d48d0b4@collabora.com>
 <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_141121_503671_1B84057F 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>, "Zoltan Szubbocsev,
 zszubbocsev" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>, "Bean Huo,
 beanhuo" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA2IE1heSAyMDIwIDIyOjU5OjM5ICswMjAwIChDRVNUKQpSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAt
LS0tLQo+ID4+IFVCSSBzY2FucyBvbmx5IGhlYWRlcnMgZHVyaW5nIGF0dGFjaC4gSWYgeW91IGRv
bid0IHRvdWNoIHRoZXNlLCBubyB3YXkuICAKPiA+IAo+ID4gU29ycnksIEkgbWlzdW5kZXJzdG9v
ZCB3aGF0IHlvdSBtZWFudCBieSBwYXlsb2FkLiBVQkkgc2hvdWxkIHNjaGVkdWxlCj4gPiB0aGUg
UEVCIGZvciBlcmFzZSBpZiB0aGUgRUMvVklEIGhlYWRlciBpcyBjb3JydXB0ZWQuICAKPiAKPiBV
QkkgZXZlbiB0cmllcyB0byByZWNvdmVyIGZyb20gc3VjaCBhIHNpdHVhdGlvbi4gSWYgb25seSB0
aGUgRUMgaGVhZGVyIGlzIGJhZCwKPiBpdCB3aWxsIGNyZWF0ZSBhIG5ldyBvbmUuIE9ubHkgb2Yg
dGhlIFZJRCBoZWFkZXIgaXMgYmFkL21pc3NpbmcgYW5kIHRoZSBwYXlsb2FkCj4gaXMgY29ycnVw
dGVkIChFQ0MgZXJyb3JzIG9yIGJpdC1mbGlwcykgaXQgd2lsbCBlcmFzZSBpdC4KClllcCwgSSBy
ZW1lbWJlciB0aGF0LCB0aG91Z2ggaW4gdGhlIGNhc2Ugb2YgYSBjb3JydXB0ZWQgRUMsIFVCSSB3
aWxsCnNjaGVkdWxlIGEgUEVCIHJlY292ZXJ5LCBhbmQgaWYgdGhlIHBheWxvYWQgaXMgY29ycnVw
dGVkLCB0aGUgcmVhZApzaG91bGQgZmFpbCB3aGVuIGNvcHlpbmcgdGhlIExFQiBjb250ZW50IHRv
IGFub3RoZXIgYmxvY2suCgo+IAo+IEEgbWlzc2luZyBWSUQgaGVhZGVyIHBsdXMgZ29vZCBwYXls
b2FkIHdpbGwgY2F1c2UgVUJJIHRvIHN0b3AgYXR0YWNoaW5nIHNpbmNlIGl0Cj4gdmlvbGF0ZXMg
dGhlIElPIG1vZGVsLgoKU3VyZSwgYW5kIHRoYXQncyBub3Qgd2hhdCB3ZSB3YW50IHRvIGRvIGFu
eXdheS4gV2UgYmFzaWNhbGx5IGhhdmUgMgpjaG9pY2VzIGhlcmU6CgoxLyBvdmVyd3JpdGUgYWxs
IHBhZ2VzIHN0YXJ0aW5nIGZyb20gcGFnZSAwIGFuZCBlbmRpbmcgYXQgcGFnZSAxNS4gVGhpcwp3
aWxsIGxlYWQgdG8gRUNDIGVycm9ycyBvbiBhbHJlYWR5IHdyaXR0ZW4gcGFnZXMsIGFuZCAwLWZp
bGxlZCBwYWdlcwpmb3Igb3RoZXJzICh1bmxlc3Mgd2UgZ28gZm9yIGEgcmF3IHdyaXRlLCBpbiB3
aGljaCBjYXNlIGl0IG1pZ2h0CmFjdHVhbGx5IGxlYWQgdG8gRUNDIGVycm9ycyBkZXBlbmRpbmcg
b24gdGhlIGVuZ2luZSkuCjIvIHRyYWNrIGFscmVhZHkgd3JpdHRlbiBwYWdlcyAoYnkgcmVhZGlu
ZyB0aGVtIGZpcnN0KSwgYW5kIG9ubHkgd3JpdGVzCnRob3NlIHRoYXQgaGF2ZSBub3QgYmVlbiB3
cml0dGVuIHlldC4gVGhhdCBtZWFucyBubyBFQ0MgZXJyb3IgaW4gdGhhdApjYXNlLCBhbmQgbm8g
Y29ycnVwdGVkIEVDL1ZJRCBoZWFkZXIgYXMgd2VsbC4KCkNsZWFybHksICMyIHdvdWxkIGhlbHAg
bWl0aWdhdGUgdGhlIHBlcmYgcGVuYWx0eSBpbmN1cnJlZCBieSB0aGUgTWljcm9uCndvcmthcm91
bmQsIGJ1dCBpZiBpdCdzIG5vdCBhbiBvcHRpb24sIG1heWJlIHdlIGNhbiBqdXN0IHN0YXJ0IHdp
dGgKIzEgKHdoaWNoIGlzIGJhc2ljYWxseSB3aGF0IE1pcXVlbCBpbXBsZW1lbnRlZCkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
