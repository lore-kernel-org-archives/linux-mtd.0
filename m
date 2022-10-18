Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6647AC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms/Ae3kg/39/UQF0SWw//h3HfPI9kaHtxAbTzYek5VE=; b=dJCM47XAN6Z0NG
	8T4kYAdfIdSG1kOe0b500QgZzCPMTHLJLTWP3PxlNx+nttA3rxAVL8jkhMVK589aqsGHysTYyeW3B
	ggKuKQiryJHsHcgQQ6DWv81n/hEWqkX63COnDIGLzfbklEkdXtqutsQm7lfF1vCcBoD0ajoxss3+E
	iq+FUDeok531bh83ad9ksNvyMTueQxbhSSA3s2Dsu24PfsBmkf3t6tgqFgIDJu+7TKQ8pGRnQz75G
	dYFVF0NmfxE+U5OJZv0qag+wEfAlNKfryRtaUQZS9yB2JZ2CaFsEu2MSb505ED+oBtpiNhFs8IjuB
	KGRcC9dyve8gWdyWdk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okihK-004o4p-US; Tue, 18 Oct 2022 09:15:43 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okihG-004o3B-NM
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:15:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 20969E0002;
	Tue, 18 Oct 2022 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666084536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIh7/MktIL/Bgsl7usNJZzJ7tzKUt8ldGOiT8Wb6Mjw=;
	b=YBUHIwJ87ghMBEzyyPldfs47TIrRgINqsYQ6hj35gIzp+MAwGN4DdEEbS7lkQF/+skX2pZ
	RnXpek4AWhky40r15iNEjRN8rEqCBtRPRhdhGfpuFRLzcuRWpz/K7cMSUjIwvbiXjNA4SP
	IJhh4/Lq2Pg84EmnG7J2A8mv6cAFMQuoO4WBXwOHTGntw8jU5PWmuOl5V4hUdLxsMSK4Qm
	tU9Wak2p6stPZV34ah8OrvQQv1qNLEo7U/+rwJuP6ySVvFOJ2A0djfhIe/i5t1Z6WI16ds
	09D2GTblPSj37XPdC46W6lOjCkIl/mwgMGo/P7+mnWbx+praYmLoR5eK1Z4FCQ==
Date: Tue, 18 Oct 2022 11:15:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Valentin Korenblit" <vkorenblit@sequans.com>,
 linux-mtd@lists.infradead.org, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v3] mtd: rawnand: cadence: support 64-bit slave dma
 interface
Message-ID: <20221018111533.661ae4ff@xps-13>
In-Reply-To: <8e87cd6d-fc3c-4edf-ae6e-3edc50dbd6cb@app.fastmail.com>
References: <20221018090045.10268-1-vkorenblit@sequans.com>
	<8e87cd6d-fc3c-4edf-ae6e-3edc50dbd6cb@app.fastmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_021538_932295_54E4ACF3 
X-CRM114-Status: UNSURE (   9.88  )
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

SGVsbG8sCgphcm5kQGFybmRiLmRlIHdyb3RlIG9uIFR1ZSwgMTggT2N0IDIwMjIgMTE6MTA6NDQg
KzAyMDA6Cgo+IE9uIFR1ZSwgT2N0IDE4LCAyMDIyLCBhdCAxMTowMCBBTSwgVmFsZW50aW4gS29y
ZW5ibGl0IHdyb3RlOgo+ID4gMzItYml0IGFjY2Vzc2VzIG9uIDY0LWJpdCBzZG1hIHRyaWdnZXIg
c2RtYV9lcnIgaW4gaW50cl9zdGF0dXMgcmVnaXN0ZXIuCj4gPgo+ID4gQ2hlY2sgZG1hIGNhcGFi
aWxpdGllcyBiZWZvcmUgcmVhZGluZy93cml0aW5nIGZyb20vdG8gc2RtYSBpbnRlcmZhY2UuCj4g
Pgo+ID4gTGluayB0byBkaXNjdXNzaW9uOgo+ID4gaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJr
aXR0eS9saXN0L2tidWlsZC1hbGxAbGlzdHMuMDEub3JnL3RocmVhZC8zTk1BQ0dJTTVORFVCUFhS
VDVSVEJaT042TFFFNUEzQi8gIAo+IAo+IE1heWJlIG1ha2UgdGhpcwo+IAo+IExpbms6IGh0dHBz
Oi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9rYnVpbGQtYWxsQGxpc3RzLjAxLm9yZy90
aHJlYWQvM05NQUNHSU01TkRVQlBYUlQ1UlRCWk9ONkxRRTVBM0IvCgpJJ2xsIGZpeCBpdCB3aGls
ZSBhcHBseWluZy4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbiBLb3JlbmJsaXQgPHZrb3Jl
bmJsaXRAc2VxdWFucy5jb20+ICAKPiAKPiBSZXZpZXdlZC1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KClRoYW5rcyBhIGxvdCBmb3IgdGhlIGhlbHAgQXJuZCEKCkNoZWVycywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
