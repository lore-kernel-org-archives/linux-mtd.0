Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D81DC48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E25C61042
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E25C61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmR3I0BNw1+B7JVKVH3vKAAYe0Jm7rBGg0/YOkFhAPA=; b=GofSS91OETjiZz
	YxOkZEvJtUg1RkC77D2Dh4hGToqB59jz1xr4UGA5L7CdtorGzrGf6rrvELn+Q/y6Yu/hHSjl1RAwR
	twdrU4fe7MKkks/gYfpyesAXs/gnWuOfCNVkGY9q3k2UcifgPoebONqmvRnt2BL9XXD0GkvTjsQiC
	cV0CZcc+K252ur4fvbbfN+vygwiUpd7xyzFzSDBwEH+smX6hAEatFSJtyoKc5InMV8Hi7scbY/hYm
	AShHzzUS/1q9ZvZrfnmYLHigvjNUX5hmNfaeVqK1maPHmRMh76Nxr6mjK/RI7BdtSnzfkHKvN/zEr
	gvocMgjImRm2OhDvgFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqyv5-00EDun-T0; Wed, 09 Jun 2021 14:11:00 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyNi-00E1tx-8u; Wed, 09 Jun 2021 13:36:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E115C6000B;
 Wed,  9 Jun 2021 13:36:22 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:36:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>, Naga
 Sureshkumar Relli <nagasure@xilinx.com>, Amit Kumar Mahapatra
 <akumarma@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>, Siva Durga
 Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210609153621.1303bc4d@xps13>
In-Reply-To: <57ef16cd-33e7-6c16-3a24-9634f47831b3@canonical.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
 <57ef16cd-33e7-6c16-3a24-9634f47831b3@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_063630_502631_77F0DC2C 
X-CRM114-Status: GOOD (  17.28  )
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

SGkgS3J6eXN6dG9mLAoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBj
YW5vbmljYWwuY29tPiB3cm90ZSBvbiBXZWQsIDkKSnVuIDIwMjEgMTQ6MDE6MTAgKzAyMDA6Cgo+
IE9uIDA5LzA2LzIwMjEgMTA6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBBZGQgYSB5YW1s
IGRlc2NyaXB0aW9uIG9mIHRoaXMgTkFORCBjb250cm9sbGVyIHdoaWNoIGlzIGRlc2NyaWJlZCBh
cyBhCj4gPiBzdWJub2RlIG9mIHRoZSBTTUMgYnVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgLi4u
L2JpbmRpbmdzL210ZC9hcm0scGwzNTMtbmFuZC1yMnAxLnlhbWwgICAgIHwgNTcgKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXJt
LHBsMzUzLW5hbmQtcjJwMS55YW1sCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2FybSxwbDM1My1uYW5kLXIycDEueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1s
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5lNzJmYTE0
YjQzODUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1sCj4gPiBAQCAtMCwwICsxLDU3
IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9tdGQvYXJtLHBsMzUzLW5hbmQtcjJwMS55YW1sIwo+ID4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+
ID4gK3RpdGxlOiBQTDM1MyBOQU5EIENvbnRyb2xsZXIgZGV2aWNlIHRyZWUgYmluZGluZ3MKPiA+
ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogIm5hbmQtY29udHJvbGxlci55YW1sIgo+ID4g
Kwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+ID4gKyAgLSBOYWdhIFN1cmVzaGt1bWFyIFJlbGxpIDxuYWdhLnN1cmVz
aGt1bWFyLnJlbGxpQHhpbGlueC5jb20+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNv
bXBhdGlibGU6Cj4gPiArICAgIGl0ZW1zOgo+ID4gKyAgICAgIC0gZW51bTogIAo+IAo+IFRoYXQn
cyBub3QgYW4gZW51bSwgYnV0IHNpbXBsZSBjb25zdCB3aXRob3V0IGl0ZW1zLgoKT2suCgo+IAo+
ID4gKyAgICAgICAgICAtIGFybSxwbDM1My1uYW5kLXIycDEKPiA+ICsKPiA+ICsgIHJlZzoKPiA+
ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBkZXNjcmlw
dGlvbjogQ1Mgd2l0aCByZWdhcmQgdG8gdGhlIHBhcmVudCByYW5nZXMgcHJvcGVydHkKPiA+ICsg
ICAgICAgICAgLSBkZXNjcmlwdGlvbjogT2Zmc2V0IG9mIHRoZSBtZW1vcnkgcmVnaW9uIHJlcXVl
c3RlZCBieSB0aGUgZGV2aWNlCj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IExlbmd0aCBv
ZiB0aGUgbWVtb3J5IHJlZ2lvbiByZXF1ZXN0ZWQgYnkgdGhlIGRldmljZSAgCj4gCj4gRG9lc24n
dCBpdCBkZXBlbmQgb24gcGFyZW50J3MgYWRkcmVzcy9zaXplIGNlbGxzPwoKWWVzLCBidXQgYXMg
dGhlIGNoaWxkIG5vZGVzIGFyZSBub3QgZGVmaW5lZCBpbiB0aGUgcGFyZW50J3MgYmluZGluZwoo
aWUuIHRoZSBTTUMpIEkgdGhpbmsgaXQncyBpbnRlcmVzdGluZyB0byBoYXZlIHRoZW0gZGVmaW5l
ZCBoZXJlLCBubz8KCj4gPiArCj4gPiArICAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCj4gPiArICAi
I3NpemUtY2VsbHMiOiB0cnVlICAKPiAKPiBUaGVzZSBzaG91bGQgY29tZSBmcm9tIG5hbmQtY29u
dHJvbGxlci55YW1sCgpSaWdodCwgSSdsbCBkcm9wIHRoZXNlLCB0aGV5IGFyZSBwcm9iYWJseSBy
ZWR1bmRhbnQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
