Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045BAC48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB82613AD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 12:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB82613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwrpUZ4/UkXzd6CDdo15zcU2EkzHkUEE7IHuH6x0sGA=; b=vlMMe3C1x0M2Qt
	zx9Z7MIKlG2s0VuLrzWgBYe+fnJ9V2ZDtmy03L1auzB1Jky8VKIGOY1bDuZg3hgPbb/azeS7UsJJe
	2TrE1zWbsWi2lN2En13zlZ7aru/3MGTd71oiymMhV8k+IoeB4nq9FWc29dPxwPVmQFomgeY4VEImE
	G0d7Ljs5absy5gqSnW+9v5sp4IB+6GndIbtE77xdRVn9gytWVUhJQPxuz0iCkq/3lzMCMFN75fPym
	2f5WbqZWQUy+IHOCJKrAbxc/72SbfbvuMYyv9uyyF9cJbo+F/fGslXDdK/e2Cj5V6vhRThutZFuxG
	ok2uoxw00mIxyOIZTg3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqxOU-00Di9S-Ag; Wed, 09 Jun 2021 12:33:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwpe-00DUfo-QA; Wed, 09 Jun 2021 11:57:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B398724000B;
 Wed,  9 Jun 2021 11:57:08 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:57:07 +0200
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
Subject: Re: [PATCH v22 12/18] memory: pl353-smc: Let lower level controller
 drivers handle inits
Message-ID: <20210609135707.6c9c67cc@xps13>
In-Reply-To: <b9be2ca0-7d62-c5fd-6aa8-e04c57b0f75c@canonical.com>
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-13-miquel.raynal@bootlin.com>
 <b9be2ca0-7d62-c5fd-6aa8-e04c57b0f75c@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_045715_024643_A0D71BC0 
X-CRM114-Status: GOOD (  16.54  )
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
YW5vbmljYWwuY29tPiB3cm90ZSBvbiBXZWQsIDkKSnVuIDIwMjEgMTM6NTQ6MjQgKzAyMDA6Cgo+
IE9uIDA5LzA2LzIwMjEgMTA6MDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGVyZSBpcyBu
byBwb2ludCBpbiBoYXZpbmcgYWxsIHRoZXNlIGRlZmluaXRpb25zIGF0IHRoZSBTTUMgYnVzIGxl
dmVsLAo+ID4gdGhlc2UgYXJlIGV4dHJlbWVseSB0aWdodCB0byB0aGUgTkFORCBjb250cm9sbGVy
IGRyaXZlciBpbXBsZW1lbnRhdGlvbiwKPiA+IGFyZSBub3QgcGFydGljdWxhcmx5IGdlbmVyaWMs
IGltcGx5IG1vcmUgYm9pbGVycGxhdGUgdGhhbiBuZWVkZWQsIGRvCj4gPiBub3QgcmVhbGx5IGZv
bGxvdyB0aGUgZGV2aWNlIG1vZGVsIGJ5IHJlY2VpdmluZyBubyBhcmd1bWVudCBhbmQgc29tZSBv
Zgo+ID4gdGhlbSBhcmUgYWN0dWFsbHkgYnVnZ3kuCj4gPiAKPiA+IExldCdzIGdldCByaWQgb2Yg
dGhlc2UgcmlnaHQgbm93IGFzIHRoZXJlIGlzIG5vIGN1cnJlbnQgdXNlciBhbmQga2VlcAo+ID4g
dGhpcyBkcml2ZXIgYXQgYSBzaW1wbGUgbGV2ZWw6IG9ubHkgdGhlIFNNQyBiYXJlIGluaXRpYWxp
emF0aW9ucy4KPiA+IAo+ID4gVGhlIE5BTkQgY29udHJvbGxlciBkcml2ZXIgd2hpY2ggSSBhbSBn
b2luZyB0byBpbnRyb2R1Y2Ugd2lsbCB0YWtlIGNhcmUKPiA+IG9mIHJlZGVmaW5pbmcgcHJvcGVy
bHkgYWxsIHRoZXNlIGhlbHBlcnMgYW5kIHVzaW5nIHRoZW0gZGlyZWN0bHkuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL21lbW9yeS9wbDM1My1zbWMuYyB8IDI5NCAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9wbDM1My1zbWMuaCAg
fCAgMzAgLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzI0IGRlbGV0aW9ucygtKQo+ID4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3BsMzUzLXNtYy5oCj4gPiAgIAo+IAo+IEkg
c2VlIHlvdSByZW1vdmUgaGVyZSBhIGJ1bmNoIG9mIGNvZGUuIEFyZSB0aGUgc2VyaWVzIHN0aWxs
IGZ1bGx5Cj4gYmlzZWN0YWJsZT8KCkFic29sdXRlbHksIHllcywgYmVjYXVzZSB0aGlzIGNvZGUg
aXMgY3VycmVudGx5IHVudXNlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
