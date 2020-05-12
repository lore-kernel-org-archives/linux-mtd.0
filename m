Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56EECA90AF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33252492B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWDSXhLe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33252492B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taBy0Co4iQxc1VxelHlzupk32C2IegFjnHSt+0i7NZE=; b=PWDSXhLe0Cs3kq
	A7p1NTRg1QXF9nVw5gqJSpEmNiebJM2/kV920aRtle52LZUsm5zgcKAXIrhN/0RQJPG+vc6hM68Tb
	BK8hRSmUTh1UzoTE68rDkI69B+eft1Ne3OCpFRuK+MmPqeuDaeUsCl8idXNR9NQrhbliAONtJTCds
	UCtN9Rkpy7Aqvf+xM8lQamHCRRAr9aFWVta8NtogWpBXE4P3Vvn3jbpYhcAKbZr33DRsE0wPmYlK4
	bqXh2JKocvclRrLc5dM62CoHl9HksriZVLzlqrSP/sZqOmpmEaBUWc33CzOtEa3eVyj6ycPQ6LZDb
	NYhD7bRpP76CopveVL1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYaHf-0001DE-FF; Tue, 12 May 2020 19:09:43 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYaHb-0001CZ-FV
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 19:09:41 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3B06024000F;
 Tue, 12 May 2020 19:09:35 +0000 (UTC)
Date: Tue, 12 May 2020 21:09:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rickard Andersson <rickaran@axis.com>
Subject: Re: [PATCH] mtd: rawnand: Non ONFI specialized timing support
Message-ID: <20200512210933.03280fd0@xps13>
In-Reply-To: <20200422121800.7365-1-rickaran@axis.com>
References: <20200422121800.7365-1-rickaran@axis.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_120939_651668_430785D7 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: richard@nod.at, s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmlja2FyZCwKCisgYm9yaXMKClJpY2thcmQgQW5kZXJzc29uIDxyaWNrYXJhbkBheGlzLmNv
bT4gd3JvdGUgb24gV2VkLCAyMiBBcHIgMjAyMAoxNDoxODowMCArMDIwMDoKCj4gRnJvbTogUmlj
a2FyZCB4IEFuZGVyc3NvbiA8cmlja2FyYW5AYXhpcy5jb20+Cj4gCj4gVGhlIEtpb3hpYS9Ub3No
aWJhIFRINThOVkcyUzNIQkFJNCBOQU5EIG1lbW9yeSBpcyBub3QgYQo+IE9ORkkgY29tcGxpYW50
IG1lbW9yeS4gVGhlIHRpbWluZ3Mgb2YgdGhhdCBtZW1vcnkgYXJlIHF1aXRlCj4gY2xvc2UgdG8g
T05GSSBtb2RlIDQgYnV0IGlzIGJyZWFraW5nIHRoYXQgc3BlYy4KPiAKPiBUaGlzIHBhdGNoIGFk
ZHMgYSBzcGVjaWFsIHRhYmxlIHdpdGggdGltaW5ncyB0aGF0IGNhbiBiZQo+IHVzZWQgZm9yIG5v
biBPTkZJIG1lbW9yaWVzLgo+IAo+IEVyYXNlIGJsb2NrIHJlYWQgc3BlZWQgaXMgaW5jcmVhc2Vk
IGZyb20gNjczOSBLaUIvcyB0bwo+IDEzMjYwIEtpQi9zLiBFcmFzZSBibG9jayB3cml0ZSBzcGVl
ZCBpcyBpbmNyZWFzZWQgZnJvbQo+IDMwMDQgS2lCL3MgdG8gMzg3MiBLaUIvcy4KPiAKPiBUZXN0
ZWQgb24gSU1YNlVMTCB3aGljaCBoYXMgYSBOQU5EIGNvbnRyb2xsZXIgc3VwcG9ydGluZwo+IEVE
TyBtb2RlLgoKSSBhbSBjb252aW5jZWQgYWJvdXQgdGhlIGlkZWEgb2YgdHdlYWtpbmcgbm9uLU9O
RkkgdGltaW5ncyBvbiBhCnBlci1jaGlwIGJhc2lzIHRvIGVuaGFuY2UgdGhlaXIgdGhyb3VnaHB1
dCwgYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGRvCnRoaXMgYW5vdGhlciB3YXkuIAoKV2hhdCB3ZSBj
b3VsZCBoYXZlIGlzIGEgd2F5LCBmb3IgTkFORCBtYW51ZmFjdHVyZXIgZHJpdmVycywgdG8gb3Zl
cmxvYWQKdGhlIHRpbWluZ3MuIFRoaXMgd2F5LCBLaW94aWEgdGltaW5ncyByZW1haW4gaW4gdGhl
IFRvc2hpYmEgZHJpdmVyLgoKSSBxdWlja2x5IHByZXBhcmVkIGEgc21hbGwgc2VyaWVzIFsxXSwg
aXQgaXMgdW50ZXN0ZWQgYnV0IGl0IHdpbGwKaG9wZWZ1bGx5IGhlbHAgeW91IGFkYXB0IHlvdXIg
cGF0Y2guIFlvdSBqdXN0IGhhdmUgdG8gc2V0IHRoZQpjaGlwLT5pbml0X2RhdGFfaW50ZXJmYWNl
KCkgaG9vayBmcm9tIHRoZSBUb3NoaWJhIGRyaXZlciBhdCBpbml0IHRpbWUuClRoaXMgaG9vayBp
cyBzdXBwb3NlZCB0byB1cGRhdGUgdGhlIHdob2xlIGRhdGEgaW50ZXJmYWNlIHN0cnVjdHVyZSBh
bmQKYWxzbyBjYWxsIGNoaXAtPmNvbnRyb2xsZXIub3BzKCkgdG8gdmVyaWZ5IGl0IGlzIHN1cHBv
cnRlZCBieSB0aGUKY29udHJvbGxlci4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbWlxdWVscmF5
bmFsL2xpbnV4L3RyZWUvcGVyc28vbmFuZC1uZXh0L3RpbWluZ3MKClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
