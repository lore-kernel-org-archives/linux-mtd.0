Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB125C433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 08:13:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6979164EF1
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 08:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6979164EF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JopEX365K2xyceZwxKnEHhI1YsVUsazWg1Jt9nST3DE=; b=v79DKLXdTquCFhbboKbo5/5Pw
	Snx6GvIMUTsAe/UkmmCdmr4N+MS7kuKXR5FlpaEj6FB2r1QFiWfVp66FIAFYKAt70tgfoGdFXcA1S
	MvoXZ3PwrjWj1GQGQDGRX6/ymL9b9c2aLI66lqPefcZcC938bPe1DaxzjJ84xVqCGMPXysquL36vd
	eJZXp+kjqpC4ekVJEd3ljzevjzhUG/IWaVQo7SHd5ugWassh3IoVsS89hNvEMSkteKzmn33R73OeS
	otdLzO7p0ResAeI24VKhRMzpnD5RjXJpK0unlUuS+NgfGbq6uyKqQzZMy825Cb2a9kUCOuRmKdTss
	5KCsH5M5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBlM-00087Q-Pn; Thu, 25 Feb 2021 08:12:44 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBlJ-00086t-NW
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 08:12:43 +0000
Received: from xps13 (lfbn-tou-1-813-134.w86-250.abo.wanadoo.fr
 [86.250.253.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 369DC200005;
 Thu, 25 Feb 2021 08:12:39 +0000 (UTC)
Date: Thu, 25 Feb 2021 09:12:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
Message-ID: <20210225091238.4158cb3a@xps13>
In-Reply-To: <4DF5654C-1412-4E89-BF21-60C649EEDF4F@gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
 <20210224080210.23686-1-noltari@gmail.com>
 <CAN8TOE_Eg6zYqy8wLtrNcTiCQdcihM7wGM5JHw=bh4=b1CL-_A@mail.gmail.com>
 <20210225084838.34bbdbff@xps13>
 <4DF5654C-1412-4E89-BF21-60C649EEDF4F@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_031241_971419_5019A11F 
X-CRM114-Status: GOOD (  13.80  )
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
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFRodSwgMjUgRmViIDIwMjEKMDg6NTQ6MDkgKzAxMDA6Cgo+IEhpIE1pcXVlbCwK
PiAKPiA+IEVsIDI1IGZlYiAyMDIxLCBhIGxhcyA4OjQ4LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4gPiAKPiA+IEhpIMOBbHZhcm8sCj4gPiAK
PiA+IEJyaWFuIE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPiB3cm90ZSBvbiBX
ZWQsIDI0IEZlYiAyMDIxCj4gPiAxMzowMToxMyAtMDgwMDoKPiA+ICAgCj4gPj4gT24gV2VkLCBG
ZWIgMjQsIDIwMjEgYXQgMTI6MDIgQU0gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzCj4gPj4gPG5v
bHRhcmlAZ21haWwuY29tPiB3cm90ZTogIAo+ID4+PiBGaXhlczogMjdjNWIxN2NkMWIxICgibXRk
OiBuYW5kOiBhZGQgTkFORCBkcml2ZXIgImxpYnJhcnkiIGZvciBCcm9hZGNvbSBTVEIgTkFORCBj
b250cm9sbGVyIikgICAgCj4gPj4gCj4gPj4gRldJVywgSSBjb3VsZCBiZWxpZXZlIHRoaXMgd2Fz
IGJyb2tlbi4gV2Ugd2VyZW4ndCB0ZXN0aW5nIEhhbW1pbmcgRUNDCj4gPj4gKG5vciBKRkZTMikg
YXQgdGhlIHRpbWUsIHNvIGl0IGNvdWxkIGVhc2lseSBoYXZlIG9idmlvdXMgYnVncyBsaWtlCj4g
Pj4gdGhpcy4gIAo+ID4gCj4gPiBSaWdodCwgeW91IHNob3VsZCBwcm9iYWJseSBsaW1pdCB0aGUg
YmFja3BvcnQgdG8gdGhlIHRpbWUgd2hlbiByYXcKPiA+IGFjY2Vzc29ycyBnb3QgaW50cm9kdWNl
ZC9maXhlZC4gIAo+IAo+IFdoYXQgZG8geW91IG1lYW4/Cj4gVGhvc2UgYWNjZXNzb3JzIGhhdmUg
YmVlbiB0aGVyZSBzaW5jZSB0aGUgZmlyc3QgY29tbWl0ICgyN2M1YjE3Y2QxYjEwNTY0ZmEzNmY4
ZjUxZTRiNGI0MTQzNmVjYzMyKToKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi8yN2M1YjE3Y2QxYjEwNTY0ZmEzNmY4ZjUxZTRiNGI0MTQzNmVjYzMyL2RyaXZlcnMvbXRk
L25hbmQvYnJjbW5hbmQvYnJjbW5hbmQuYyNMMTg5Ni1MMTg5OQoKSSBtaXN1bmRlcnN0b29kIEJy
aWFuJ3MgYW5zd2VyLiBUaGlzIGNvbW1pdCBpcyBub3QgdGhhdCBvbGQgYW5kIGxvb2tzCmxlZ2l0
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
