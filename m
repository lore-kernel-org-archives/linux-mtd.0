Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23EFD49209
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8jtvkxk9hbnGpuxWa/mGGf2NYTaPUQOcOmld63XWQf8=; b=kZ5/3kWrV6bgxCVVbw33yx8NXE
	8Ch0fmHmlI8meThp2wzPWqpOOEebAIPS0naJL9qBnjrp2PwoEMWY+KByLmcMyYnQlmxOtknU85oJx
	s/0ukrjKVGBpE9A3QYMxuSbrIrRgNRzOTPlH1jQxsrzYgrPGhHQG/nz5cXBoE+xd4B5asR/aoY0qC
	lU1VROvWfFIX04T45ebTBNzcb8KaxA86FvIBA0tFQRttdmPIryPD2C4Zfts6jPnCwW0q8+BVTbKj3
	84e+dzJWvjVlsIHtbAs6arBezrZ8kTZYYe/XIrq8ginIL/U1H8qEtY+4lpomMYRfhHOryPtUxol7O
	9htgzVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCysH-000000093vv-2qfv;
	Mon, 18 Nov 2024 10:20:53 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCysF-000000093uX-0jdr
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:20:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CA4382A87E1;
	Mon, 18 Nov 2024 11:20:49 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id R3mCjP5e1-hG; Mon, 18 Nov 2024 11:20:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 714432A881A;
	Mon, 18 Nov 2024 11:20:49 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jN5xBbYgBdsR; Mon, 18 Nov 2024 11:20:49 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C32D2A87E1;
	Mon, 18 Nov 2024 11:20:49 +0100 (CET)
Date: Mon, 18 Nov 2024 11:20:49 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1747841136.38159796.1731925249043.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOf5uwnXmiB+ij=WzWuSytXh-VA60ZHVL7WiSBpA8iKi7SvjNA@mail.gmail.com>
References: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com> <b03b6625-3971-76c4-d045-6e35ec220caf@huawei.com> <CAOf5uwm=nLLcyvtc7EGK=rdu6N+j6t6_hYyCWcB3QMACOAEx2A@mail.gmail.com> <8df70e11-3278-06ed-5952-c808035bb679@huawei.com> <CAOf5uwkhgDxUprK+fp09dWh1aXMNPJC7YPjFNChT2Qj86do4hQ@mail.gmail.com> <302574690.38068166.1731924136160.JavaMail.zimbra@nod.at> <CAOf5uwnXmiB+ij=WzWuSytXh-VA60ZHVL7WiSBpA8iKi7SvjNA@mail.gmail.com>
Subject: Re: Some information about direct-io support on ubifs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Some information about direct-io support on ubifs
Thread-Index: mid3ncvrMfXKspuGcQGn4R7AppiyjA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_022051_351957_39787545 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pY2hhZWwgTmF6emFyZW5v
IFRyaW1hcmNoaSIgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+IFdoeSBhcmUgeW91
IHVzaW5nIFVCSUZTIGFueXdheSBmb3IgdGhpcz8gSnVzdCBwbGFjZSB0aGUgc3F1YXNoZnMgaW5z
aWRlCj4+IGFuIFVCSSB2b2x1bWUuCj4gCj4gWWVzIHRoaXMgaXMgb25lIG9mIHRoZSBzb2x1dGlv
bnMgSSBoYXZlIHByb3Bvc2VkLCBidXQgdGhlIGlkZWEgaXMgdG8KPiB1cGRhdGUgYSBzaW5nbGUg
c3F1YXNoZnMKPiBjb250YWluZXIgYW5kIG5vdCBib3VuZCB0aGUgbGltaXQgaW4gdGhlIGJlZ2lu
bmluZyBvZiB0aGUgZGV2aWNlIGxpZmUuCj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIHlvdT8KCk5v
dCByZWFsbHkgYmVjYXVzZSB5b3UgY2FuIGFkZC9yZXNpemUgVUJJIHZvbHVtZXMgYXQgcnVudGlt
ZS4KU28sIGxldCBVQkkgYmUgdGhlIGNvbnRhaW5lci4KCllvdSBjYW4gZWJlbiBnaXZlIHRoZW0g
bmFtZXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
