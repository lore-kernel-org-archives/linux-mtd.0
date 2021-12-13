Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACF1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpM95GRga0n7mZI/JG8pFp+hwsHsmCgwxDw7OjNk4XI=; b=C4kdfPRB/+sQdc
	JOnfdSRYdIROurZPxgYd91gVSl31Az8QPV/kubqr2k8haO9a/7/1sV3VxuQeSsX+EK6nsvcHockdb
	SZ/ex94CDK87CfAq3qpVCCdUAElr5Q1KEbivU+WleJqhTJXXkAMlHyITsyDWTimic6FgJNMhn0Sav
	ffbUmwhjah/vYXHsgfYsl6r8mAgC/8a1B5PgKvoSSwa3LbOqacqXX5T4vMyLW4F1uY8Br3W6bQDXA
	MEE/nCHzn5dcehL7lA2ctQZ6JLtA3xyXaXSii9SCieFQRKQOsMilloiMNxk8iFctK/9Cvr5HXjlRu
	ektA7mOyQlXNlrM5UJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfjc-0084qZ-39; Mon, 13 Dec 2021 07:26:56 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfjZ-0084ou-I9
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 07:26:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 911BB68AA6; Mon, 13 Dec 2021 08:26:45 +0100 (CET)
Date: Mon, 13 Dec 2021 08:26:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 linux-block <linux-block@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
Message-ID: <20211213072645.GA20552@lst.de>
References: <20211206070409.2836165-1-hch@lst.de>
 <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_232653_791079_39CD4AEA 
X-CRM114-Status: GOOD (  20.68  )
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

T24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgMTE6NTI6MjZBTSAtMDcwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiA+IEZpeGVzOiAxZWJlMmU1ZjlkNjhlOTRjICgiYmxvY2s6IHJlbW92ZSBHRU5IRF9GTF9F
WFRfREVWVCIpCj4gPiBSZXBvcnRlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgo+ID4gVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPgoKPiBOb3Qgc3VyZSB3aHkgSSBkaWRuJ3Qgc3BvdCB0aGlzIHVudGlsIG5vdywg
YnV0Ogo+IAo+IGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6IEluIGZ1bmN0aW9uIOKAmGFkZF9t
dGRfYmxrdHJhbnNfZGV24oCZOgo+IGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6MzYyOjMwOiBl
cnJvcjog4oCYR0VOSERfRkxfTk9fUEFSVOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhHRU5IRF9GTF9OT19QQVJUX1NDQU7igJk/Cj4g
ICAzNjIgfCAgICAgICAgICAgICAgICAgZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05PX1BBUlQ7Cj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0VOSERfRkxfTk9fUEFSVF9TQ0FO
Cj4gZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYzozNjI6MzA6IG5vdGU6IGVhY2ggdW5kZWNsYXJl
ZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBh
cHBlYXJzIGluCj4gCj4gSG1tPwo+IAo+IEknbSBnb2luZyB0byByZXZlcnQgdGhpcyBvbmUgZm9y
IG5vdywgbm90IHN1cmUgaG93IGl0IGNvdWxkJ3ZlIGJlZW4KPiB0ZXN0ZWQgaW4gdGhpcyBmb3Jt
LgoKSXQgd2FzIHRlc3RlZCBpbiBhIHRyZWUgdGhhdCBhbHNvIGNvbnRhaW5zIHRoZSBjb21taXQg
aWRlbnRpZmllZCBieSB0aGUKRml4ZWQgdGFnLCB3aGljaCBpcyBpbiB0aGUgZm9yLW5leHQgdHJl
ZSBidXQgbm90IHRoZSBibG9jay01LjE2IG9uZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
