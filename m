Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1874CC388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:16:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF6622240
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XKqncGtj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BF6622240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0rJMgUoMi0rzDOd8Uc1Lmq5i7iZCo9kTs2Qhjv7sDp4=; b=XKqncGtji7AssK7joZVK98q4a
	HjVjL4DgGQEFyGUO51P2tK8+sIKY5YkwfE9JIqVbM16VLsjyfhLqW7OLLQP7Kooaeudi4abeGYFa8
	2ZyO34kyZmh3GTVui+Hj5zjxVlxaVfAETQSZ8Xu2bzLu9YeNjqlpp6X4XoTq4T2J9h0ivHniZlV66
	aYcx/y8rO8ruCqTwwBMNpsgiO3mM/imPROGOb9M4GXkx6V4gHTo0Af/FjtjJl/+hXpaCUvANoBO7I
	bi1x7wbDyjE2SCY7EMRBOln4UyY9RU7q2J346KRUAdEaDGq/eAGkQehIpTUvhlOOw2MPHQhoa2HH4
	mx202DN+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrHl-00014L-Ag; Thu, 19 Nov 2020 21:16:09 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrHg-000127-EF
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:16:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 04D19E0009;
 Thu, 19 Nov 2020 21:16:00 +0000 (UTC)
Date: Thu, 19 Nov 2020 22:15:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH] mtd: spinand: macronix: Add support for MX35LFxGE4AD
Message-ID: <20201119221558.7b484949@xps13>
In-Reply-To: <20201119211133.31590-1-miquel.raynal@bootlin.com>
References: <1604490442-9052-1-git-send-email-ycllin@mxic.com.tw>
 <20201119211133.31590-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_161604_607171_54C53ECA 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: juliensu@mxic.com.tw, gch981213@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8KCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9u
IFRodSwgMTkgTm92IDIwMjAKMjI6MTE6MzMgKzAxMDA6Cgo+IE9uIFdlZCwgMjAyMC0xMS0wNCBh
dCAxMTo0NzoyMiBVVEMsIFlvdUNoaW5nIExpbiB3cm90ZToKPiA+IFRoZSBNYWNyb25peCBNWDM1
TEYyR0U0QUQgLyBNWDM1TEY0R0U0QUQgYXJlIDNWLCAyRyAvIDRHYml0IHNlcmlhbAo+ID4gU0xD
IE5BTkQgZmxhc2ggZGV2aWNlICh3aXRoIG9uLWRpZSBFQ0MpLgo+ID4gCj4gPiBWYWxpZGF0ZWQg
YnkgcmVhZCwgZXJhc2UsIHJlYWQgYmFjaywgd3JpdGUsIHJlYWQgYmFjayBhbmQgbmFuZHRlc3QK
PiA+IG9uIFhpbGlueCBaeW5xIFBpY29aZWQgRlBHQSBib2FyZCB3aGljaCBpbmNsdWRlZCBNYWNy
b25peCBTUEkgSG9zdAo+ID4gKGRyaXZlcnMvc3BpL3NwaS1teGljLmMpLgo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZb3VDaGluZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4gIAo+IAo+IEFwcGxp
ZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KClBsZWFzZSB1c2UgInYyIiBhcyBwcmVmaXgg
bmV4dCB0aW1lIHlvdSBjaGFuZ2Ugc29tZXRoaW5nIGluIHlvdXIgcGF0Y2gKaW5zdGVhZCBvZiAi
UkVTRU5EIiwgaXQgY29uZnVzZXMgbWUuIEkgYXBwbGllZCB0aGUgd3JvbmcgcGF0Y2gsIEkgd2ls
bApkcm9wIHRoaXMgb25lIGFuZCB0YWtlIHRoZSAiUkVTRU5ELCB2MSIgaW5zdGVhZC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
