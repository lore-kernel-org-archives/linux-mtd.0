Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41822C282C2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:37:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A922146E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 12:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVOQADvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A922146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+j7lVgEXvgGQ5TCkKgR/qfNVAFFjwf6x/tQCEbfhNQ=; b=LVOQADvFW51ehU
	JzWpvIMiD/5tc2C7wISjzKzpqMfaNp1i7ArBY5Nn66XKhtZdfU2nBr5f2eIODG3muHObSGgp+zpeD
	dVPIGdV6RqOxFmpSh3aswks3UPohFLLQW35B45IkawlTPaUtMJ+1D1/MmNP6d6LbLsSZal+gGBU5T
	ndDw9D9RV7E25PqeJa0zcZhL1Mjg+DYosSXrEDekiEjLUdZ5HP8sTZylk5wGu43/fCLMBfJeoNJ4g
	mV9SDULMR+d0rm2uVM21MSicpKAaUV1MolXKcpfvyyUewr9SwZ7WCauVokyGDhVXfdmEnvp/3v1/8
	b0D3NvKBYSP3lAHdwMuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn0k0-0006GB-ML; Fri, 25 Jan 2019 12:37:48 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn0jr-00066A-Na
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 12:37:42 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 55474209BE; Fri, 25 Jan 2019 13:37:38 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id 13225207AD;
 Fri, 25 Jan 2019 13:37:28 +0100 (CET)
Date: Fri, 25 Jan 2019 13:37:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] mtd: rawnand: remove ->legacy.erase and single_erase()
Message-ID: <20190125133728.07ad39a7@xps13>
In-Reply-To: <1548052327-26483-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548052327-26483-1-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_043740_328547_EA6A6734 
X-CRM114-Status: GOOD (  11.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBNb24sIDIxIEphbgoyMDE5IDE1OjMyOjA3ICswOTAwOgoKPiBOb3cgdGhh
dCB0aGUgbGFzdCB1c2VyIG9mIHRoaXMgaG9vaywgZGVuYWxpLmMsIHN0b3BwZWQgdXNpbmcgaXQs
Cj4gd2UgY2FuIHJlbW92ZSB0aGUgZXJhc2UgaG9vayBmcm9tIG5hbmRfbGVnYWN5Lgo+IAo+IEkg
c3F1YXNoZWQgc2luZ2xlX2VyYXNlKCkgYmVjYXVzZSBvbmx5IHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4KPiBzaW5nbGVfZXJhc2UoKSBhbmQgbmFuZF9lcmFzZV9vcCgpIGlzIHRoZSBudW1iZXIgb2Yg
Yml0IHNoaWZ0cy4KPiAKPiBUaGUgc3RhdHVzL3JldCBjb252ZXJzaW9uIGluIG5hbmRfZXJhc2Vf
bmFuZCgpIGlzIHVubmVlZGVkIHNpbmNlCj4gY29tbWl0IGViOTQ1NTVlOWU5NyAoIm10ZDogbmFu
ZDogdXNlIHVzdWFsIHJldHVybiB2YWx1ZXMgZm9yIHRoZQo+IC0+ZXJhc2UoKSBob29rIikuIENs
ZWFuZWQgaXQgdXAgbm93LiAgCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5
YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiAtLS0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
