Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81B5C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 11:16:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766A8207BC
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 11:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766A8207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y50RVLLlQMT4sbBJglrUY0TyzaJvn0zXMMzaA2YafB0=; b=qupYvB7qpeBNtfTEL8nF135F7
	E0Q/CqF6HK0RIcKcuAVqB+LH8pNCi2Vd+t4ynUrGqTnuoEJWJqYRa9/mIWx04oEsLlNpTt+V4ZLH6
	1Bbn9RqQ7ATmn9atb8vtx6/T+y1frnfXJkTFUot+Z4YgoO/y0IF/SplxdvLW8D1QX1Ms27RTqU5yB
	t9DC3aTo/CqnxKB9ALXI9xXsSmAtBVCb+3n7Ztd7AxtZyP4pC2ubGK//WuJFs+fyciPhe9hhl8BC1
	ik6VNBhTioRQm/FPLV+cLYYUW3MsKrRFusm2mpX2gjdE55vmkP1Thw8DyMKrlb4oGT13YqTz2+Mhq
	QSVj/VSXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwNpb-0002tO-RA; Mon, 04 Jan 2021 11:15:23 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwNpZ-0002s7-58
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 11:15:22 +0000
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AE75620000C;
 Mon,  4 Jan 2021 11:15:17 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:15:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting
 raw payload
Message-ID: <20210104121516.3d50fb58@xps13>
In-Reply-To: <7db4b36e-23a6-6075-132c-214d043e78bd@geanix.com>
References: <20210104103558.9035-1-miquel.raynal@bootlin.com>
 <7db4b36e-23a6-6075-132c-214d043e78bd@geanix.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_061521_297760_A88C7990 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin =?UTF-8?B?SHVuZGViw7hsbA==?= <martin@geanix.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2VhbiwKClNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4gd3JvdGUgb24gTW9uLCA0
IEphbiAyMDIxIDExOjUwOjEwICswMTAwOgoKPiBPbiAwNC8wMS8yMDIxIDExLjM1LCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+ID4gT24gTW9uLCAyMDIwLTEyLTIxIGF0IDEwOjAwOjEzIFVUQywgU2Vh
biBOeWVramFlciB3cm90ZTogIAo+ID4+IFJlLWFkZCB0aGUgbXVsdGlwbHkgYnkgOCB0byAic3Rl
cCAqIGVjY3NpemUiIHRvIGNvcnJlY3QgdGhlIGRlc3RpbmF0aW9uIGJpdCBvZmZzZXQKPiA+PiB3
aGVuIGV4dHJhY3RpbmcgdGhlIGRhdGEgcGF5bG9hZCBpbiBncG1pX2VjY19yZWFkX3BhZ2VfcmF3
KCkuCj4gPj4KPiA+PiBGaXhlczogZTVlNTYzMWNjODg5ICgibXRkOiByYXduYW5kOiBncG1pOiBV
c2UgbmFuZF9leHRyYWN0X2JpdHMoKSIpCj4gPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiA+PiBSZXBvcnRlZC1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4gIAo+ID4g
QXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgo+ID4KPiA+IE1pcXVlbCAgCj4gSGkg
TWlxdWVsCj4gCj4gV2lsbCB5b3UgcGxlYXNlIHF1ZXVlIHRoaXMgZm9yIGZpeGVzPyBJdCdzIHF1
aXRlIHJlbGV2YW50IGZvciA1LjEwIExUUyA6KQoKUmlnaHQsIHRoYXQgd2lsbCBiZSBxdWlja2Vy
IHRvIGhhdmUgaXQgaW4gTGludXMnIHRyZWUuIEkgbW92ZWQKdGhlIHBhdGNoIHRvIHRoZSBtdGQv
bmV4dCBicmFuY2guCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
