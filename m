Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C86CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 07:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1202260EE9
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 07:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1202260EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvvVqqm08n2XVbmZoWmYKVYkGPNgymE6V+sAmP36VlI=; b=Ap48SOpS8c1keq
	cnu9WlV83NwzNUscccMhSLeSygIRt9BpSCLmgFpNC1cUhUjhoUq4ZwdXrzPRPF91ox/BjkRF0BS/n
	E9z9m+w4hLQ4cWcLp13ILBWtyGw8WXg9/eH+0PdUWkCLKUZK1KykTTMmrnqhrkGgEbh7VDZCEvWRc
	9FnQquy9ZAqhC9wZKUvI16Vwbglg18bQlK4DPg/o5jobW1TZeFmV4zZ2FiO1RiLdSZC0Sr3OpSbko
	QpeD0aEVmST7tE2BtWq3lyyqW2w2Qn+I/Y6bLXI7z/or4E1+UfHz6vNyi5igtLsPBgZZYO/8L3Nkk
	fYeQmeYdKxekGyKwkvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkLtP-000ssS-FA; Tue, 09 Nov 2021 07:50:07 +0000
Received: from 2.mo583.mail-out.ovh.net ([178.33.109.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkLtL-000srH-EY
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 07:50:05 +0000
Received: from player750.ha.ovh.net (unknown [10.108.20.200])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 7214123AC3
 for <linux-mtd@lists.infradead.org>; Tue,  9 Nov 2021 07:49:51 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 6F7A52400E93F;
 Tue,  9 Nov 2021 07:49:37 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b5d7a376-507d-4bf9-be5d-6ccd0cb549da,
 59B56381F1A9F0D5248293F13F2B328DA5DD2F9D) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <48cb0c8c-c752-0832-1e1a-836303926ed3@milecki.pl>
Date: Tue, 9 Nov 2021 08:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 1/2] dt-bindings: mtd: brcmnand: add "no-wp" property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20211103151117.18690-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20211103151117.18690-1-zajec5@gmail.com>
X-Ovh-Tracer-Id: 2890748011998849882
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeetledugeejtdevheetieduhefgtedvgefftddvfedvieevjeegleffleegtdeunecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeehtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_235003_671623_D50E5F3F 
X-CRM114-Status: GOOD (  14.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDMuMTEuMjAyMSAxNjoxMSwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBJdCdzIHJlcXVpcmVkIHRvIHByb3Bl
cmx5IGRlc2NyaWJlIGJvYXJkcyB3aXRob3V0IGNvbm5lY3RlZCBXUCBwaW4gKGUuZy4KPiBBc3Vz
IEdULUFDNTMwMCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+IC0tLQo+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9icmNtLGJyY21uYW5kLnlhbWwgfCA1ICsrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWwKPiBpbmRleCBkZDVhNjQ5NjllMzcuLjQ5Yzc4
NjBjMGRhZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2JyY20sYnJjbW5hbmQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCj4gQEAgLTExMSw2ICsxMTEsMTEgQEAgcHJv
cGVydGllczoKPiAgICAgICAgIGVhcmxpZXIgdmVyc2lvbnMgb2YgdGhpcyBjb3JlIHRoYXQgaW5j
bHVkZSBXUAo+ICAgICAgIHR5cGU6IGJvb2xlYW4KPiAgIAo+ICsgIG5vLXdwOgo+ICsgICAgZGVz
Y3JpcHRpb246Cj4gKyAgICAgIFRoaXMgcHJvcGVydHkgbWFya3MgYm9hcmRzIHdpdGggV1AgcGlu
IG5vdCBjb25uZWN0ZWQgdG8gdGhlIE5BTkQgY2hpcC4KPiArICAgIHR5cGU6IGJvb2xlYW4KCkkg
c3RhcnRlZCByZXRoaW5raW5nIHRoaXMuIFNpbmNlIHdlIGFscmVhZHkgaGF2ICJicmNtLG5hbmQt
aGFzLXdwIgooYm9vbGVhbiksIHdvdWxkIG1ha2VzIG1vcmUgc2Vuc2U6CjEuIEFkZCAibm8td3Ai
IGJvb2xlYW4gKGFzIHByb3Bvc2VkIGluIHRoaXMgcGF0Y2gpCjIuIEFkZCAid3AiIChvciBzaW1p
bGFyKSB3aXRoIFswLCAxXSBhbmQgZGVwcmVjYXRlICJicmNtLG5hbmQtaGFzLXdwIgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
