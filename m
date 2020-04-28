Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21084C83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 12:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E53AA206D6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 12:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rMDb7w2I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E53AA206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mF+7SXdAt11zV4ncB0svs6zX9+rgp882fo5cq4HAjxA=; b=rMDb7w2IFaA0lB
	RgUbeA9oNKsgv9q8HDsEu5lM61l+1s5jWUyk7qF7UyZXnC+oaV5dzXWBUsY2ESdXbW4TIWyIC/8T7
	EKs+0ed9tdqAcdmYbgPBq5Q5KJIHafIMtIWF8mbA/5HXfsxkocYuGHeCOH0i00jDeJ/oolur27BVp
	wlzeThuu+KUED7Bw4C9+S7TbIB1hzTguSFaExUQTnuc8yUp3qNDjPdtshsfFcdB5HzNK4c1LdrZwn
	a1aAETMRE0QHLIBZsfKeYzEHxiop7jlc5MHeo9wbfwD1Szauuwlbbh0iIbb0RJgvLJ8xuHUqZVWfk
	5AOB48ROr91IcBWWynbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTOzy-0005vr-Sb; Tue, 28 Apr 2020 12:06:02 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTOzs-0005tZ-MJ
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 12:05:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 10CF4C0014;
 Tue, 28 Apr 2020 12:05:46 +0000 (UTC)
Date: Tue, 28 Apr 2020 14:05:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 03/10] mtd: rawnand: Rename a NAND chip option
Message-ID: <20200428140545.722393f7@xps13>
In-Reply-To: <20200425103956.378e254d@collabora.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
 <20200424173631.14311-4-miquel.raynal@bootlin.com>
 <20200425103956.378e254d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_050556_863666_7039E866 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDI1IEFwcgoyMDIwIDEwOjM5OjU2ICswMjAwOgoKPiBPbiBGcmksIDI0
IEFwciAyMDIwIDE5OjM2OjI0ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBOQU5EIGNvbnRyb2xsZXIgZHJpdmVycyBjYW4gc2V0
IHRoZSBOQU5EX1VTRV9CT1VOQ0VfQlVGRkVSIGZsYWcgdG8gYQo+ID4gY2hpcCAnb3B0aW9uJyBm
aWVsZC4gV2l0aCB0aGlzIGZsYWcsIHRoZSBjb3JlIGlzIHJlc3BvbnNpYmxlIG9mCj4gPiBwcm92
aWRpbmcgRE1BLWFibGUgYnVmZmVycy4KPiA+IAo+ID4gVGhlIGN1cnJlbnQgYmVoYXZpb3IgaXMg
dG8gbm90IGZvcmNlIHRoZSB1c2Ugb2YgYSBib3VuY2UgYnVmZmVyIHdoZW4KPiA+IHRoZSBjb3Jl
IHRoaW5rcyB0aGlzIGlzIG5vdCBuZWVkZWQuIFNvIGluIHRoZSBlbmQgdGhlIG5hbWUgaXMgYSBi
aXQKPiA+IG1pc2xlYWRpbmcsIGJlY2F1c2UgaW4gdGhlb3J5IHdlIHdpbGwgYWx3YXlzIGhhdmUg
YSBETUEgYnVmZmVyIGJ1dCBpbgo+ID4gcHJhY3RpY2UgaXQgd2lsbCBub3QgYWx3YXlzIGJlIGEg
Ym91bmNlIGJ1ZmZlci4KPiA+IAo+ID4gUmVuYW1lIHRoaXMgZmxhZyBOQU5EX1VTRV9ETUFfQlVG
RkVSIHRvIGJlIG1vcmUgYWNjdXJhdGUuICAKPiAKPiBJIHdvdWxkIHN1Z2dlc3QgcmVuYW1pbmcg
aXQgTkFORF9DT05UUk9MTEVSX05FRURTX0RNQUFCTEVfQlVGRkVSIG9yCj4gTkFORF9DT05UUk9M
TEVSX1VTRVNfRE1BLCBhbmQgbWF5YmUgd2Ugc2hvdWxkIGludHJvZHVjZSBOQU5EIGNvbnRyb2xs
ZXIKPiBmbGFncyAobmFuZF9jb250cm9sbGVyLmZsYWdzKSBpbnN0ZWFkIG9mIGhpamFja2luZyB0
aGUgTkFORCBjaGlwIGZsYWdzLgoKQWdyZWVkLCBpbiBmYWN0IEkgd291bGQgbGlrZSB0byBlbnRp
cmVseSByZXdvcmsgYWxsIHRoZSBOQU5EIGZsYWdzLiBJCndpbGwgZG8gaXQgaW4gYSBzZXBhcmF0
ZSBzZXJpZXMuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
