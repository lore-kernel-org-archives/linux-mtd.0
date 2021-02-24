Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A1DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 07:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B1E64ECB
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 07:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B1E64ECB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9tILVa9CZrHSmWtShinyZeN7tzFgfmslAadJOe9dGJ4=; b=smPHOmwOnX2lZEVgRHjVPPLbh
	YXr5XUUHI4qh2q9fl/6CaeB7gzU5f8dI/pm3jM+B7bUaZxpYKOnMu/+cU/B+ZIlL2wqpSzrLocftU
	trl2huCIzhOkSp4p6wdJcJ2bKl+dKM8uTfSpDwIdmJUpzroBPdvAhre/Xpr7bheEim/XURx3RkNbC
	T5sg73EApX9J5c3AHDIZn3P8ZnnPT3d88GCXCg501o11sBRcdjefVr3QRgUcbOh/yGD5TB4RZvcUX
	WN50Fq/Ky2tHnyEWhV+w+wvWmKwtM37bAsMLEPSy2fUfnsx33QuGdGd/EeMI6OCqmvYGRABF9XvfB
	Hdop2KjeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEokQ-0000gg-6L; Wed, 24 Feb 2021 07:38:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEokN-0000gH-Pq
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 07:38:12 +0000
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr
 [86.210.203.113]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F5CF20009;
 Wed, 24 Feb 2021 07:38:06 +0000 (UTC)
Date: Wed, 24 Feb 2021 08:38:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] nand: brcmnand: fix OOB R/W with Hamming ECC
Message-ID: <20210224083805.34f625a0@xps13>
In-Reply-To: <0670B343-C39E-4610-8061-A7F81F90B9F4@gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
 <32837cb2-f7ba-d59e-de66-051019b21e89@gmail.com>
 <0670B343-C39E-4610-8061-A7F81F90B9F4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_023811_977664_324DB2FA 
X-CRM114-Status: GOOD (  12.80  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFdlZCwgMjQgRmViIDIwMjEKMDg6MTY6NTggKzAxMDA6Cgo+IEhpIEZsb3JpYW4s
Cj4gCj4gPiBFbCAyNCBmZWIgMjAyMSwgYSBsYXMgNDo0NiwgRmxvcmlhbiBGYWluZWxsaSA8Zi5m
YWluZWxsaUBnbWFpbC5jb20+IGVzY3JpYmnDszoKPiA+IAo+ID4gCj4gPiAKPiA+IE9uIDIvMjIv
MjAyMSAxMjoxNiBQTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+ID4+IEhhbW1p
bmcgRUNDIGRvZXNuJ3QgY292ZXIgdGhlIE9PQiBkYXRhLCBzbyByZWFkaW5nIG9yIHdyaXRpbmcg
T09CIHNoYWxsCj4gPj4gYWx3YXlzIGJlIGRvbmUgd2l0aG91dCBFQ0MgZW5hYmxlZC4KPiA+PiBU
aGlzIGlzIGEgcHJvYmxlbSB3aGVuIGFkZGluZyBKRkZTMiBjbGVhbm1hcmtlcnMgdG8gZXJhc2Vk
IGJsb2Nrcy4gSWYgSkZGUzIKPiA+PiBjbGVubWFya2VycyBhcmUgYWRkZWQgdG8gdGhlIE9PQiB3
aXRoIEVDQyBlbmFibGVkLCBPT0IgYnl0ZXMgd2lsbCBiZSBjaGFuZ2VkCj4gPj4gZnJvbSBmZiBm
ZiBmZiB0byAwMCAwMCAwMCwgcmVwb3J0aW5nIGluY29ycmVjdCBFQ0MgZXJyb3JzLgo+ID4+IAo+
ID4+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFp
bC5jb20+Cj4gPiAKPiA+IFNob3VsZCB0aGVyZSBiZSBhIEZpeGVzOiB0YWcgcHJvdmlkZWQgaGVy
ZSBmb3IgYmFjayBwb3J0aW5nIHRvIHN0YWJsZSB0cmVlcz8KPiAKPiBJIHRoaW5rIHNvLCBidXQg
dGhlIGZpeGVkIGNvbW1pdCB3b3VsZCBiZSB0aGUgZmlyc3Qgb25lLCByaWdodD8KPiAyN2M1YjE3
Y2QxYjEwNTY0ZmEzNmY4ZjUxZTRiNGI0MTQzNmVjYzMyCgpZZXAsIHNob3VsZG4ndCBiZSBhIHBy
b2JsZW0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
