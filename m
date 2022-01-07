Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5599C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXbM1UOsdkHedBc4K8SeVn4EQKOTGOfHyTLafQURx5M=; b=zo4PHIPmRoacCL
	O/LcLuFODSRXiaMR3uvEYmkZ9qCiZ5vJHoo9Wg5WJnKwHynsa3PzZdUtFUxjsm/YeGNKKuo7HzSQ7
	zuV/mlm0B9d50A5QVOpx2HV0JhW0QunRdRYg5MW3FsPSoAltIycFD99GT9q/Cq4pAPulHlUEH4PP2
	pUVrsf8jT83aL616OUeVIc5OhqphTOtxrWlhz1MT0S49QQD2IsstQC8wIDcTDIFuKWGiAJSx5zXEG
	1wGifVOY5IomAE6eUle7GwbPvlaU8oWQ6twbzB1Kxo/6s6tv93QG5i4YbjndV5FZmX/CxbnSpYpsv
	1F8UkjzrXzvZc2NI096Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5jaN-002iZH-U8; Fri, 07 Jan 2022 07:22:51 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5jaL-002iXz-Dd
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 07:22:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AD1991BF204;
 Fri,  7 Jan 2022 07:22:42 +0000 (UTC)
Date: Fri, 7 Jan 2022 08:22:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Cai
 Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>, open
 list <linux-kernel@vger.kernel.org>, "open list:BROADCOM SPECIFIC AMBA
 DRIVER (BCMA)" <linux-wireless@vger.kernel.org>, "open list:BROADCOM STB
 NAND FLASH DRIVER" <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v2 2/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Message-ID: <20220107082241.318132a9@xps13>
In-Reply-To: <703aeebe-3413-0e5e-80ca-4c0bcd36e3f5@gmail.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
 <20220107001328.2233896-3-f.fainelli@gmail.com>
 <703aeebe-3413-0e5e-80ca-4c0bcd36e3f5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_232249_663111_1BE0BE5F 
X-CRM114-Status: GOOD (  16.29  )
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

SGkgRmxvcmlhbiwKCmYuZmFpbmVsbGlAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgNiBKYW4gMjAy
MiAxOToxMDoxMiAtMDgwMDoKCj4gT24gMS82LzIwMjIgNDoxMyBQTSwgRmxvcmlhbiBGYWluZWxs
aSB3cm90ZToKPiA+IEFsbG93IGEgYnJjbW5hbmRfc29jIGluc3RhbmNlIHRvIHByb3ZpZGUgYSBj
dXN0b20gc2V0IG9mIEkvTyBvcGVyYXRpb25zCj4gPiB3aGljaCB3ZSB3aWxsIHJlcXVpcmUgd2hl
biB1c2luZyB0aGlzIGRyaXZlciBvbiBhIEJDTUEgYnVzIHdoaWNoIGlzIG5vdAo+ID4gZGlyZWN0
bHkgbWVtb3J5IG1hcHBlZCBJL08uIFVwZGF0ZSB0aGUgbmFuZF97cmVhZCx3cml0ZX1fcmVnIGFj
Y29yZGluZ2x5Cj4gPiB0byB1c2UgdGhlIFNvQyBvcGVyYXRpb25zIGlmIHByb3ZpZGVkLgo+ID4g
Cj4gPiBUbyBtaW5pbWl6ZSB0aGUgcGVuYWx0eSBvbiBvdGhlciBTb0NzIHdoaWNoIGRvIHN1cHBv
cnQgc3RhbmRhcmQgTU1JTwo+ID4gYWNjZXNzZXMsIHdlIHVzZSBhIHN0YXRpYyBrZXkgd2hpY2gg
aXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgZ2V0cwo+ID4gZW5hYmxlZCBpZiBhIHNvYyBpbXBs
ZW1lbnRhdGlvbiBkb2VzIHByb3ZpZGUgSS9PIG9wZXJhdGlvbnMuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgo+ID4gLS0tICAK
PiAKPiBbc25pcF0KPiAKPiA+ICAgCWluaXRfY29tcGxldGlvbigmY3RybC0+ZG9uZSk7Cj4gPiAg
IAlpbml0X2NvbXBsZXRpb24oJmN0cmwtPmRtYV9kb25lKTsKPiA+ICAgCWluaXRfY29tcGxldGlv
bigmY3RybC0+ZWR1X2RvbmUpOwo+ID4gQEAgLTMxNDUsNiArMzE2OSw4IEBAIGludCBicmNtbmFu
ZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBzdHJ1Y3QgYnJjbW5hbmRfc29j
ICpzb2MpCj4gPiAgIAkJLyogRW5hYmxlIGludGVycnVwdCAqLwo+ID4gICAJCWN0cmwtPnNvYy0+
Y3RscmR5X2FjayhjdHJsLT5zb2MpOwo+ID4gICAJCWN0cmwtPnNvYy0+Y3RscmR5X3NldF9lbmFi
bGVkKGN0cmwtPnNvYywgdHJ1ZSk7Cj4gPiArCQlpZiAoYnJjbW5hbmRfc29jX2hhc19vcHMoc29j
KSkKPiA+ICsJCQlzdGF0aWNfYnJhbmNoX2VuYWJsZSgmYnJjbW5hbmRfc29jX2hhc19vcHNfa2V5
KTsgIAo+IAo+IFRoaXMgaHVuayBnb3QgbWlzdGFrZW5seSBhZGRlZCB3aXRoIGEgcmViYXNlLCBJ
IHdpbGwgd2FpdCBmb3IgYWRkaXRpb25hbCBjb21tZW50cyBiZWZvcmUgc3Bpbm5pbmcgYSBuZXcg
dmVyc2lvbi4KCkZZSSB0aGUgc2VyaWVzIExHVE0gb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
