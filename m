Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0D1C5519F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F92D22240
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZbLxT7e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F92D22240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZYIL+JDw+B/IfJkTfVHmJe7W2+vkn4Vj0D2CaRvR2Rs=; b=mZbLxT7eowSxp0iMaf40Sqxic
	Je3VsP4Zi9dzwiFDkB2EnY9RjH4t/Z/PtMRqMHzT5+fvvAgRlqjHusuBt5mhhfgAJdFZ00fZH6X3X
	JSjNM5Y0JXhD0f84ROj8rHKTH4xQ6bPmcw4k6WGH0RhlujGV+VvFjO8CYTCu374xZpoNLOILJZqyi
	auCB1SAHVAw7EzSjrF1QgiidPRFirXFfuWWnRpUp2uH8OLHfzeOLSBmhe6wTzwp4azK/czb6Hl7IE
	bc5jLpiBa/ZESYiP3Egne5ZxhDT9Si2Zb10ehvlXA65nAYME0OH9ikS+lCvvJM8uxgSD4yfWl32Lj
	tJAc3d8ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdEty-0008AG-BK; Thu, 12 Nov 2020 15:52:46 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdEtu-000893-CM
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 15:52:44 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 340D81BF207;
 Thu, 12 Nov 2020 15:52:38 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:52:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 13/23] mtd: nand: raw: brcmnand: brcmnand: Demote
 non-conformant kernel-doc headers
Message-ID: <20201112165236.08decc40@xps13>
In-Reply-To: <CAC=U0a24oQasGEPGHeJfG7J4U-F-a8Q54oEPKGQfhrsd0iPhfw@mail.gmail.com>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-14-lee.jones@linaro.org>
 <CAC=U0a24oQasGEPGHeJfG7J4U-F-a8Q54oEPKGQfhrsd0iPhfw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_105242_618436_066AC827 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gVGh1
LCAxMiBOb3YgMjAyMCAxMDo0NjoxMwotMDUwMDoKCj4gT24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0
OjM3IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+ID4KPiA+ICBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE4NTQ6IHdhcm5pbmc6IEZ1
bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNjcmliZWQgaW4gJ2JyY21u
YW5kX2VkdV90cmFucycKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jOjE4NTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FkZHInIG5v
dCBkZXNjcmliZWQgaW4gJ2JyY21uYW5kX2VkdV90cmFucycKPiA+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE4NTQ6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ2J1Zicgbm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZWR1X3RyYW5zJwo+
ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmM6MTg1NDogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnbGVuJyBub3QgZGVzY3JpYmVkIGluICdi
cmNtbmFuZF9lZHVfdHJhbnMnCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYzoxODU0OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjbWQn
IG5vdCBkZXNjcmliZWQgaW4gJ2JyY21uYW5kX2VkdV90cmFucycKPiA+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE5NTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNjcmliZWQgaW4gJ2JyY21uYW5kX2ZpbGxfZG1h
X2Rlc2MnCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYzoxOTUx
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkZXNjJyBub3QgZGVzY3Jp
YmVkIGluICdicmNtbmFuZF9maWxsX2RtYV9kZXNjJwo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2JyY21uYW5kL2JyY21uYW5kLmM6MTk1MTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnYWRkcicgbm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZmlsbF9kbWFfZGVzYycK
PiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE5NTE6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2J1Zicgbm90IGRlc2NyaWJlZCBpbiAn
YnJjbW5hbmRfZmlsbF9kbWFfZGVzYycKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jOjE5NTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIg
J2xlbicgbm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZmlsbF9kbWFfZGVzYycKPiA+ICBkcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE5NTE6IHdhcm5pbmc6IEZ1bmN0
aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RtYV9jbWQnIG5vdCBkZXNjcmliZWQgaW4gJ2JyY21u
YW5kX2ZpbGxfZG1hX2Rlc2MnCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYzoxOTUxOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdiZWdp
bicgbm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZmlsbF9kbWFfZGVzYycKPiA+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE5NTE6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2VuZCcgbm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZmls
bF9kbWFfZGVzYycKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
OjE5NTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ25leHRfZGVzYycg
bm90IGRlc2NyaWJlZCBpbiAnYnJjbW5hbmRfZmlsbF9kbWFfZGVzYycKPiA+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jOjE5Nzc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2hvc3QnIG5vdCBkZXNjcmliZWQgaW4gJ2JyY21uYW5kX2RtYV9y
dW4nCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYzoxOTc3OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkZXNjJyBub3QgZGVzY3JpYmVk
IGluICdicmNtbmFuZF9kbWFfcnVuJwo+ID4KPiA+IENjOiBCcmlhbiBOb3JyaXMgPGNvbXB1dGVy
c2ZvcnBlYWNlQGdtYWlsLmNvbT4KPiA+IENjOiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWls
LmNvbT4KPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+
ID4gQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gPiBDYzogVmlnbmVz
aCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29tPgo+ID4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gPiBDYzogYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0QGJyb2FkY29tLmNv
bQo+ID4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+
IEFja2VkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gIAo+IAo+
IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29tPgoKSSBndWVz
cyB5b3UgbWVhbnQgdG8gc2hhcmUgeW91ciBSZXZpZXdlZCBvciBBY2tlZC1ieT8KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
