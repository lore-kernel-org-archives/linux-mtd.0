Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF3CC48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBJiFdyNfaKe4RxYB44KJwHCLHv8+4x48kCHGPdLY90=; b=QYwZIxAijtcUnn
	3RWyHuVI9v6jqLdsmfnm8I4kjv3YrMq01LRNgtenzQU2uNWTg1+7Kw+MnasaJp/IH7wS14NbrOfky
	+lN/Us1KpxRYXA7zIs1Nl6DwViVx8+/NXfWx9InnIfX2wfoRTiQdlJO+Fcsa/kLzI09G9PgmOs8rv
	LkL+QO6oXBPQ8pXO1eM8aANF3dwyidL7dd7zev+r8xZi4QJNjY7OcaOMa/gcyiAiPq1WMEhphcTzR
	9arBX4e6Fb/+M/6t4SK3Mj5qUzA9nKY+8yxVm2sm0fpoutCCzDtsR4OAgEgEZNuxzAmZ9tXolxRHe
	Ly4AcMl+f0kuRaZV16Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMtV-0000000E8se-40Wu;
	Tue, 20 Feb 2024 09:58:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcMtS-0000000E8pm-2loR;
	Tue, 20 Feb 2024 09:58:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C1C620003;
	Tue, 20 Feb 2024 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708423107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcdF3cM7G1JIgB8Vyh8DbPm0RSohNn1G9pQiRQ5TU6Q=;
	b=Zrb1VyH4wfenn+r4SIrNT9YDd9qgY35y8QJD99OcrwcpK3uO3IvYvlbMDBEhEV4MCRL6FA
	MO+NdboCGmzbjOGytGEX7vuJatzTi+Of9y/mTdIBTnYRfOfI5bD7P3bUmCGKfPTxFuTQWy
	eipKKcpg0aRHVJk28UtYkWADWPjc5MYJRUUPwTe7yPTJ6QNl/L5l5Xe5zvfPzeDoN5WKE1
	tdkeoTfvZH8rwrxI9MvZvcACh/EG7GkLZV/kcK+FjYdsKFylj1EzrrImp8RnXwXP2o4vzq
	Br8cNusGoMRM8wQzYc02UlTYO8qknuqQBk67qvcBBzxQK6Eg4SXCNwvRhVwSnA==
Date: Tue, 20 Feb 2024 10:58:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: brcmnand: Add support for
 getting ecc setting from strap
Message-ID: <20240220105824.76556c51@xps-13>
In-Reply-To: <20240207202257.271784-10-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
	<20240207202257.271784-10-william.zhang@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_015830_873098_2877F4BF 
X-CRM114-Status: GOOD (  13.11  )
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

SGkgV2lsbGlhbSwKCndpbGxpYW0uemhhbmdAYnJvYWRjb20uY29tIHdyb3RlIG9uIFdlZCwgIDcg
RmViIDIwMjQgMTI6MjI6NTQgLTA4MDA6Cgo+IEJDTUJDQSBicm9hZGJhbmQgU29DIGJhc2VkIGJv
YXJkIGRlc2lnbiBkb2VzIG5vdCBzcGVjaWZ5IGVjYyBzZXR0aW5nIGluCj4gZHRzIGJ1dCByYXRo
ZXIgdXNlIHRoZSBTb0MgTkFORCBzdHJhcCBpbmZvIHRvIG9idGFpbiB0aGUgZWNjIHN0cmVuZ3Ro
Cj4gYW5kIHNwYXJlIGFyZWEgc2l6ZSBzZXR0aW5nLiBBZGQgYnJjbSxuYW5kLWVjYy11c2Utc3Ry
YXAgZHRzIHByb3BldHkgZm9yCj4gdGhpcyBwdXJwb3NlIGFuZCB1cGRhdGUgZHJpdmVyIHRvIHN1
cHBvcnQgdGhpcyBvcHRpb24uCj4gCj4gVGhlIGdlbmVyaWMgbmFuZCBlY2Mgc2V0dGluZ3Mgc3Rp
bGwgdGFrZSBwcmVjZWRlbmNlIG92ZXIgdGhpcyBmbGFnLiBGb3IKCkFuZCB0aGlzIHNlbnRlbmNl
IGNhbiBhbHNvIGJlIGRyb3BwZWQuIFBsZWFzZSBtZW50aW9uIHRoZXkgY2Fubm90IGJlCnVzZWQg
YXQgdGhlIHNhbWUgdGltZS4KCj4gZXhhbXBsZSwgaWYgbmFuZC1lY2Mtc3RyZW5ndGggaXMgc2V0
IGluIHRoZSBkdHMsIHRoZSBkcml2ZXIgaWdub3JlcyB0aGUKPiBzdHJhcCBzZXR0aW5nIGFuZCBm
YWxscyBiYWNrIHRvIG9yaWdpbmFsIGJlaGF2aW9yLiBUaGlzIG1ha2VzIHN1cmUgdGhhdAo+IHRo
ZSBleGlzdGluZyBCQ01CQ0EgYm9hcmQgZHRzIHN0aWxsIHdvcmtzIHRoZSBvbGQgd2F5IGV2ZW4g
dGhlIHN0cmFwCj4gZmxhZyBpcyBzZXQgaW4gdGhlIEJDTUJDQSBjaGlwIGR0c2kuCgpJIHRoaW5r
IEkgYWxyZWFkeSBzYWlkIHRoaXMgd2FzIGEgYmFkIGlkZWEgSU1ITyA6LSkKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
