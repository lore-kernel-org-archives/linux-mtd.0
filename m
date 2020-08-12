Return-Path: <SRS0=lgj1=BW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13742C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 07:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F9D120781
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2020 07:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vs+OdcP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F9D120781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VaoO3vt5OdaLmMuZEGxADekXbIjYnWzhqnYAaq+nUnc=; b=Vs+OdcP31xA2gnOq+bnEhOB01
	252EM3416sjucE4g7Wtn42IyRO7U3Caz3RJESHlo5kOioVTBa/m2G+lUjHAQshEE0IzGmeti+IeQH
	DOwOAOhaUzizCt+Locj+Yr9/6BH48Zg3N5Sbopioelhv7pl0sxVRi9RHg8aCKlxbl8daWw41UcTsN
	fxjA8d5T9tQR7/pTh7NZEbwkZxT+7rG2SGru36yuI98hwXj8tHIay9LVth1nQC9r/+u9YYtzqGaCa
	aygQTEzuMX00iWEkDSeIrPqaisMUFyFyYlDEWnn2Tv8EMVj4J8qcAM5RNoInHGqrkB/0S7QpoXWP6
	p2NTQzsxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5l76-0000HB-C7; Wed, 12 Aug 2020 07:23:56 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5l72-0000GY-RF
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2020 07:23:54 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 10716FF803;
 Wed, 12 Aug 2020 07:23:42 +0000 (UTC)
Date: Wed, 12 Aug 2020 09:23:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 0/3] mtd: lpddr: Fix bad logic bug in print_drs_error
Message-ID: <20200812092341.0adf08e2@xps13>
In-Reply-To: <98383342041c87a8d50fe9cef486a687c50af248.camel@perches.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
 <98383342041c87a8d50fe9cef486a687c50af248.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_032352_991091_8966FBB6 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLCBHdXN0YXZvLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24g
VHVlLCAxMSBBdWcgMjAyMCAxNjo0NzozNiAtMDcwMDoKCj4gT24gTW9uLCAyMDIwLTA0LTI3IGF0
IDE0OjAwIC0wNTAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+
IFRoaXMgc2VyaWVzIGFpbXMgdG8gZml4IGEgYmFkIGxvZ2ljIGJ1ZyBpbiBwcmludF9kcnNfZXJy
b3IsIHdoaWNoIGlzCj4gPiB0YWdnZWQgZm9yIC1zdGFibGUuICBUaGUgc2VyaWVzIGFsc28gaW5j
bHVkZSBzb21lIGZvcm1hdHRpbmcgZml4dXBzLiAgCj4gCj4gQUZBSUNUOiBUaGlzIHNlcmllcyBp
cyBzdGlsbCBub3QgYXBwbGllZCB0byBhbnkgdHJlZS4KPiAKPiBDYW4gc29tZW9uZSBwbGVhc2Ug
YXBwbHkgaXQ/CgpJIHRob3VnaHQgYSB2MiB3YXMgY29taW5nLCBHdXN0YXZvLCBjYW4geW91IHBs
ZWFzZSBzZW5kIGFuIHVwZGF0ZT8gSUlSQwp0aGVyZSBhcmUgc3RyaW5ncyB0aGF0IG5lZWQgdG8g
YmUgInVuYnJva2VuIiBhbmQgYW4gZXh0cmEgImlubGluZSIKd2hpY2ggbmVlZHMgdG8gYmUgZHJv
cHBlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
