Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE52AC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:29:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B704610C7
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B704610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d+U5S7th2wu3jAtMjMHqRBSwue5zCc5DwkzVGsH+V5w=; b=Jus4GGV4EK+PKshP2hjJCMzjo
	nTtkNLT+/kiplsVM8VLS2b7mX5fO65Ela+8h4SL+4YgSWIwdhh7z1RB5guaLqdZO95CNoPJ8msQxa
	1mIteXPAd48lDmdACLFma/1AvuTQSuayaAlsrHAgTOINwPDjM6O8UlpBeJsJH/yvi6Ttf/XzbmCia
	XcT/FBnK5MG8ZDy3uz6st/H26wTZ88K7VomgYgicAUKI1ebAuIA1sXiJiswFOpNis1lLJyviAFF4+
	cb4J6xc2zVmItp0iAPl02fhHpJ+6moNRHbf+Tu1sZBmM43BsV6wBE4oa8Ysv1Cnp/9caRNpaXpvw5
	Ve+XU1Ayw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUVeo-008Fkq-Bn; Thu, 08 Apr 2021 14:29:18 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUVeh-008FkR-G6
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 14:29:13 +0000
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 18200100002;
 Thu,  8 Apr 2021 14:29:07 +0000 (UTC)
Date: Thu, 8 Apr 2021 16:29:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Cc: <yukuai3@huawei.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: mtd_oobtest: fix error return code in
 mtd_oobtest_init()
Message-ID: <20210408162906.0ac844d7@xps13>
In-Reply-To: <20210408142413.748040-1-zhangxiaoxu5@huawei.com>
References: <20210408142413.748040-1-zhangxiaoxu5@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_152912_187177_45A6CF9A 
X-CRM114-Status: GOOD (  13.99  )
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

SGkgWmhhbmcsCgpaaGFuZyBYaWFveHUgPHpoYW5neGlhb3h1NUBodWF3ZWkuY29tPiB3cm90ZSBv
biBUaHUsIDggQXByIDIwMjEKMTA6MjQ6MTMgLTA0MDA6Cgo+IEZpeCB0byByZXR1cm4gYSBuZWdh
dGl2ZSBlcnJvciBjb2RlIGZyb20gdGhlIGVycm9yIGhhbmRsaW5nCj4gY2FzZSBpbnN0ZWFkIG9m
IDAsIGFzIGRvbmUgZWxzZXdoZXJlIGluIHRoaXMgZnVuY3Rpb24uCj4gCj4gUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IHpoYW5neGlh
b3h1IDAwNDY3NDk5IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4KICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eXl5eXl4KQ2FuIHlvdSBwbGVhc2UgdXNlIHlvdXIgcmVhbCBuYW1lIGhlcmU/
Cgo+IC0tLQo+ICBkcml2ZXJzL210ZC90ZXN0cy9vb2J0ZXN0LmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Rlc3Rz
L29vYnRlc3QuYyBiL2RyaXZlcnMvbXRkL3Rlc3RzL29vYnRlc3QuYwo+IGluZGV4IGM3MWRhYTg5
YmZjZS4uNTkwZDYxOWQyNzYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3Rlc3RzL29vYnRl
c3QuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Rlc3RzL29vYnRlc3QuYwo+IEBAIC03MDEsNiArNzAx
LDcgQEAgc3RhdGljIGludCBfX2luaXQgbXRkX29vYnRlc3RfaW5pdCh2b2lkKQo+ICAJCQkgICAg
ICAgKGxvbmcgbG9uZylhZGRyKTsKPiAgCQkJZXJyY250ICs9IDE7Cj4gIAkJCWlmIChlcnJjbnQg
PiAxMDAwKSB7Cj4gKwkJCQllcnIgPSAtRUlOVkFMOwo+ICAJCQkJcHJfZXJyKCJlcnJvcjogdG9v
IG1hbnkgZXJyb3JzXG4iKTsKPiAgCQkJCWdvdG8gb3V0Owo+ICAJCQl9CgpUaGFua3MsCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
