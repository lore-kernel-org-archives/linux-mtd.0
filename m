Return-Path: <SRS0=HLk0=BU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD26C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2020 07:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1605A2076C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2020 07:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H9PZ7MKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1605A2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVSDrQyznQ5Jzz2JwiXUSNYAnAiuTtVikl8YQ9+2m0I=; b=H9PZ7MKNAbeixVrsBTF8E3IX5
	sAIP64evb92Tzc85bOTWurxh2q01qopOKeQh9bodLsOJt+fiSwkAu3tFnIIuLt3VMd0c0uB0iNXxM
	ixxHn13Y/jUeG7VixQ94A57PNEQi0lHi9ZEpZEvFrZI5nXPxxim+Pwh9nQFeE2W2/CShrptQ7MfwB
	MncIsezgm3jHbG3JL/iGCGY0kFf1OT9xMFAajeVP8rpCCP9XrWoN4gCMP5WNqlc+hHbWSfqQQKWi0
	VCIuS/1tdkJnbPWRlqwCRzAbVJGdhH0glFRfbJSxzUH6fTRIIuIyM9I3Tr3wAR+PEeZ3VQVIK9Cnc
	GRZZyzQZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52Bz-0003tu-Vw; Mon, 10 Aug 2020 07:26:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52Bx-0003sf-8q
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2020 07:25:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8FB46FF802;
 Mon, 10 Aug 2020 07:25:49 +0000 (UTC)
Date: Mon, 10 Aug 2020 09:25:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] mtd: Changes for 5.9
Message-ID: <20200810092548.415bcab7@xps13>
In-Reply-To: <CAHk-=whJ0SQjLeMiVvMXayxvxCmAMdROxyb-Pzs=kr4-Ba5BCA@mail.gmail.com>
References: <20200809003453.79673eb3@xps13>
 <CAHk-=whJ0SQjLeMiVvMXayxvxCmAMdROxyb-Pzs=kr4-Ba5BCA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_032557_420622_13BBDACD 
X-CRM114-Status: GOOD (  11.44  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIFN1biwgOSBBdWcgMjAyMAoxMjo0NzowMSAtMDcwMDoKCj4gT24gU2F0LCBBdWcg
OCwgMjAyMCBhdCAzOjM1IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4KPiA+IE1URCBjb3JlIGNoYW5nZXM6ICAKPiAuLgo+IAo+IFlvdSBkaWRu
J3QgZXZlbiBtZW50aW9uIHRoZSBzdG0zMiBjb250cm9sbGVyIGNoYW5nZSwgd2hpY2ggc2VlbXMg
dG8gYmUKPiB0aGUgYmlnZ2VzdCBpbmRpdmlkdWFsIHRoaW5nIGluIGhlcmUuLgoKT2ggc29ycnks
IEkgcHV0IGl0IGFzaWRlIGFuZCB0aGVuIGZvcmdvdCBpdCB3aGVuIHdyaXRpbmcgdGhlIGNoYW5n
ZWxvZyA6LwpJJ2xsIHRyeSB0byBiZSBtb3JlIGNhcmVmdWwuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
