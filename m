Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52461C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:21:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2127D20787
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 19:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axC6vgAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2127D20787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDBPheH71JleG74cPVRLlMDY1IZuelX7mGizX2eqMJ4=; b=axC6vgAIl0/PoT
	orNihBotkqNP2BpCOIpqfV0jvRUjAtJDKwEU4647OODbscJlAQw4QU917icSNWSgQYTKZJbw/gUGp
	GZDR748lvYnpmA2l1lS5fCrFBk7/WE9tQmcKASVedOxqcIdY9MYMmtL1+Fhiw2v8jim5uukDap/B/
	8nAJyJOVO+KQjs772jEWriygnGLGDBUKCz6X9ZCaneSr6YKJWSWx6NWkDI+DBk60c2XVqzkfm6n0y
	GhttHAH4+wNfZDJvXsdZvChOowH+MoMHhuHZS/0ijJGep/M8iVXeTeEs9DLQAn+CqgvTaEqQX6xaY
	DojWjt7FjhaPDpABLbxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcwBe-0008Br-CE; Sun, 24 May 2020 19:21:30 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcvzd-0006un-D7
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 19:09:07 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0C57A240003;
 Sun, 24 May 2020 19:09:01 +0000 (UTC)
Date: Sun, 24 May 2020 21:08:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Subject: Re: [PATCH] mtd: rawnand: Fix runtime PM imbalance on error
Message-ID: <20200524210859.6c8e81dd@xps13>
In-Reply-To: <20200524190259.3429-1-miquel.raynal@bootlin.com>
References: <20200522104008.28340-1-dinghao.liu@zju.edu.cn>
 <20200524190259.3429-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_120905_575635_4B5BFFC0 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFN1biwg
MjQgTWF5IDIwMjAKMjE6MDI6NTkgKzAyMDA6Cgo+IE9uIEZyaSwgMjAyMC0wNS0yMiBhdCAxMDo0
MDowNiBVVEMsIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gcG1fcnVudGltZV9nZXRfc3luYygpIGlu
Y3JlbWVudHMgdGhlIHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlciBldmVuCj4gPiB3aGVuIGl0IHJl
dHVybnMgYW4gZXJyb3IgY29kZS4gVGh1cyBhIHBhaXJpbmcgZGVjcmVtZW50IGlzIG5lZWRlZCBv
bgo+ID4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggdG8ga2VlcCB0aGUgY291bnRlciBiYWxhbmNl
ZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUgPGRpbmdoYW8ubGl1QHpqdS5l
ZHUuY24+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCj4gCj4gTWlx
dWVsCgpGWUkgSSBjaGFuZ2VkIHRoZSB0aXRsZSB0byBpbnRlZ3JhdGUgdGhlIGRyaXZlcidzIG5h
bWUuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
