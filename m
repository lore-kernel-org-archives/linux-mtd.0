Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588FDC48BD6
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 16:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317FD205ED
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 16:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E0uWfvDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317FD205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB0igJxByqZeC0OWFBmoZ7v8Sw+CLRYGkMiSy3OUSRY=; b=E0uWfvDloPUSqD
	mK7ACJqt8zA1tIjwnoWGnDrb3P/ni+XCWuEu8FNjt2VY+S+vOp/ammHxHgIU1wMw3ormzaLWsAQNo
	JBiJGTOm1cshPGiTQ7NT9U2A6H9eGmwydlHYYfDMXWljZ4jwW8a03l/ikxoTYJe8J/E9mlrC+XM60
	Lp8A7ydDyVkuobEn2PWjQC3TZo+TyhVJr1qAXbhoUK3VI+IFrBd5ZwHQiPb/Puei5hUFfAhjknLVB
	NLq7s3etKrVLCUQCABxuvZO35INVrLKh9iVLJszU6jpZfmWsiqOvsSFsEpduebgWWHZ2T46bd7mlC
	ftdbXfUgsz5SiNls1Xng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgXFd-00054q-Aa; Thu, 27 Jun 2019 16:27:57 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgXFZ-00053r-St
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 16:27:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 43C36E0010;
 Thu, 27 Jun 2019 16:27:45 +0000 (UTC)
Date: Thu, 27 Jun 2019 18:27:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasureshkumarrelli@gmail.com>
Subject: Re: [LINUX PATCH v12 3/3] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Message-ID: <20190627182742.6389d772@xps13>
In-Reply-To: <20190619044424.GB28766@xhdnagasure40.xilinx.com>
References: <20181212100931.149b0cac@xps13>
 <MWHPR02MB2623EDA15BE59304795F3034AFA70@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181212141825.69711c57@xps13>
 <MWHPR02MB26235AE6567A06EF4C6362E6AFBC0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181217174114.24196d17@xps13>
 <MWHPR02MB26237B932D7F3CCEE0476FE0AFBD0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20181219152647.76f77711@xps13>
 <MWHPR02MB262396FFF946A95D7821D61BAFB80@MWHPR02MB2623.namprd02.prod.outlook.com>
 <MWHPR02MB262328DF62906C01DCDF18E5AF960@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20190128102720.70a52da7@xps13>
 <20190619044424.GB28766@xhdnagasure40.xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_092754_093037_D74EBD43 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "martin.lund@keep-it-simple.com" <martin.lund@keep-it-simple.com>,
 "richard@nod.at" <richard@nod.at>, Michal Simek <michals@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmFnYSwKCk5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgPG5hZ2FzdXJlc2hrdW1hcnJlbGxpQGdt
YWlsLmNvbT4gd3JvdGUgb24gVHVlLAoxOCBKdW4gMjAxOSAyMjo0NDoyNCAtMDYwMDoKCj4gT24g
TW9uLCBKYW4gMjgsIDIwMTkgYXQgMTA6Mjc6MzlBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPiBIaSBNaXF1ZWwsCj4gCj4gPiBIaSBOYWdhLAo+ID4gCj4gPiBOYWdhIFN1cmVzaGt1bWFy
IFJlbGxpIDxuYWdhc3VyZUB4aWxpbnguY29tPiB3cm90ZSBvbiBNb24sIDI4IEphbiAyMDE5Cj4g
PiAwNjowNDo1MyArMDAwMDoKPiA+ICAgCj4gPiA+IEhpIEJvcmlzICYgTWlxdWVsLAo+ID4gPiAK
PiA+ID4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIHlvdXIgdGhvdWdodHMgb24gdGhpcyBkcml2
ZXIgdG8gc3VwcG9ydCBIVy1FQ0M/Cj4gPiA+IEFzIEkgc2FpZCBwcmV2aW91c2x5LCB0aGVyZSBp
cyBubyB3YXkgdG8gZGV0ZWN0IGVycm9ycyBiZXlvbmQgTiBiaXQuCj4gPiA+IEkgYW0gb2sgdG8g
dXBkYXRlIHRoZSBkcml2ZXIgYmFzZWQgb24geW91ciBpbnB1dHMuICAKPiA+IAo+ID4gV2Ugd29u
J3Qgc3VwcG9ydCB0aGUgRUNDIGVuZ2luZS4gSXQgc2ltcGx5IGNhbm5vdCBiZSB1c2VkIHJlbGlh
Ymx5Lgo+ID4gCj4gPiBJIGFtIHdvcmtpbmcgb24gYSBnZW5lcmljIEVDQyBlbmdpbmUgb2JqZWN0
LiBJdCdzIGdvbm5hIHRha2UgYSBmZXcKPiA+IG1vbnRocyB1bnRpbCBpdCBnZXRzIG1lcmdlZCBi
dXQgYWZ0ZXIgdGhhdCB5b3UgY291bGQgdXBkYXRlIHRoZQo+ID4gY29udHJvbGxlciBkcml2ZXIg
dG8gZHJvcCBhbnkgRUNDLXJlbGF0ZWQgZnVuY3Rpb24uIEFsdGhvdWdoIHRoZSBFQ0MgIAo+IAo+
IENvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgdGhhdCwgd2hlbiBjYW4gd2UgZXhwZWN0IGdl
bmVyaWMgRUNDIGVuZ2luZQo+IHVwZGF0ZSBpbiBtdGQgTkFORD8KPiBCYXNlZCBvbiB0aGF0LCBp
IHdpbGwgcGxhbiB0byB1cGRhdGUgdGhlIEFSQVNBTiBOQU5EIGRyaXZlciBhbG9uZyB3aXRoIHlv
dXIKPiBjb21tZW50cyBtZW50aW9uZWQgYWJvdmUgdW5kZXIgdGhpcyB1cGRhdGUsCj4gYXMgeW91
IGtub3cgdGhlcmUgaXMgYSBsaW1pYXRpb24gaW4gQVJBU0FOIE5BTkQgY29udHJvbGxlciB0byBk
ZXRlY3QKPiBFQ0MgZXJyb3JzLgo+IGkgYW0gZm9sbG93aW5nIHRoaXMgc2VyaWVzIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA4Mzg3MDUvCgpJdCBpcyBnb25uYSB0YWtlIG1v
cmUgdGltZSB0aGFuIGV4cGVjdGVkLiBZb3UgY2FuIHN0aWNrIHRvIHRoZSBzb2Z0d2FyZQplbmdp
bmVzIGZvciBub3cuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
