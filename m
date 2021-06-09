Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96515C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:17:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A1F613AD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 14:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A1F613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcBlsy9d8JyDJ1/agvxPoxBE68mTCL9KTonOE/bFKQY=; b=xcUH6ob0verOMW
	2iI0k0mnB96a0VLhCQHOSHwqFkesNaLC5T21rkuN9YQGNJKBELAXfVSSqFdvFytnUgqZ3WJeIecOC
	JFe8v3j/3AVognc65UN9bMPc9FhfcML9j7qqi/yRgrseP4+SNBtDTspTz+nbuiS2MkzIRjChe38rQ
	Ld3s4dVELWvH+Upv/oHQyOYtv2AQOUmkN0jk3GfOB3rplZBGbM6/f04YspGRDeMPmPt/X5guWfiK+
	BlhgG13HCQXX+kypTe9hk+iWAxEaNReeVcDhOM3jU94imyixU2yyZY16M2exdUowGJMjJmyaLPu64
	CwGUOHqi/cNil9oVPbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqz0g-00EFi1-46; Wed, 09 Jun 2021 14:16:46 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyT6-00E3Ht-2d; Wed, 09 Jun 2021 13:42:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DBDBB1BF215;
 Wed,  9 Jun 2021 13:41:55 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:41:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek
 <monstr@monstr.eu>, Amit Kumar Mahapatra <akumarma@xilinx.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, helmut.grohne@intenta.de, Srinivas Goud
 <sgoud@xilinx.com>, Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v22 15/18] MAINTAINERS: Add PL353 SMC entry
Message-ID: <20210609154154.54aa5f06@xps13>
In-Reply-To: <f04b06fc-72f9-8f90-343d-e4826a3bf4d7@canonical.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-16-miquel.raynal@bootlin.com>
 <f04b06fc-72f9-8f90-343d-e4826a3bf4d7@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_064204_289131_99EC052E 
X-CRM114-Status: GOOD (  14.11  )
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
YW5vbmljYWwuY29tPiB3cm90ZSBvbiBXZWQsIDkKSnVuIDIwMjEgMTU6MjM6MTEgKzAyMDA6Cgo+
IE9uIDA5LzA2LzIwMjEgMTA6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBBZGQgTmFnYSBm
cm9tIFhpbGlueCBhbmQgbXlzZWxmIHJlc3BvbnNpYmxlIG9mIHRoaXMgZHJpdmVyLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gLS0tCj4gPiAgTUFJTlRBSU5FUlMgfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4gICAKPiAKPiBNZW1vcnkgY29udHJvbGxlciBiaXRzIGxv
b2sgZ29vZCB0byBtZSwgZXhjZXB0IGZldyB0aGluZ3MgaW4gYmluZGluZ3MuIEkKPiBjYW4gdGFr
ZSB0aGVtIHVwIHRvIHRoaXMgcGF0Y2gsIGZvciB3aGljaCBJIHdvdWxkIG5lZWQgYWxzbyBBY2sg
ZnJvbQo+IE5hZ2EgU3VyZXNoa3VtYXIgUmVsbGkgY29uZmlybWluZyBoZSB3aWxsIGNvLW1haW50
YWluIHRoaXMgY29kZS4KClN1cmUuIEkgd291bGQgYWxzbyBleHBlY3QgUm9iIHRvIEFjayB0aGUg
eWFtbCBjb252ZXJzaW9uIHBvc3NpYmx5LgoKSSBhbSB3YWl0aW5nIGZvciB5b3VyIGZlZWRiYWNr
IG9uIGEgY291cGxlIG9mIHF1ZXN0aW9ucyBhbmQgdGhlbiBJIHdpbGwKcmVzcGluIHRoZSBzZXJp
ZXMuCgo+IEkgYXNzdW1lIHRoZSBOQU5EIGRyaXZlciBkZXBlbmRzIG9uIHRoaXMsIHNvIEkgY2Fu
IHByZXBhcmUgYSBzdGFibGUgdGFnCj4gd2l0aCB0aGUgbWVtb3J5IGNvbnRyb2xsZXIgcGFydCwg
aWYgbmVlZGVkLgoKQWJzb2x1dGVseSwgdGhhdCB3b3VsZCBiZSBncmVhdC4KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
