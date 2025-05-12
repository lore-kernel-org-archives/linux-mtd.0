Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE962C3ABC3
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mYt6exlGbHqRETFzprkthYMz3kYYtoaMgilAOlUnjCs=; b=GqYbBNOJJ2LWEaqUYmUGVKZuG1
	d/PAFFGPtBugyHBc4swRvOe93kacrKLYGfe/h9NVCELOQseosgMKXv2L6Q4a5h1Sr/NHFeADHza1p
	aFfjHaVNHIth0Edfhqp/4mqUVNvmXbHr0JqQB16t5fNECKAUMawwEucCwO/43ugSUiD8rqhgYHKsh
	P+kt0XS7hz96GngHOzF81G/55mcpO2BQNBpezFRS8e0tE7+NSlX+MNnSHP5zRlJ2E1XF/RhEXs8Rc
	tTrblH1MRTOsAmrHJICbWfJrWrlNO2jPKtFwyagfOhRFzxI5fTBP65o8QUL5vypPwuYLIr2N+roie
	HOWrmBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESmE-00000009TLy-3qVw;
	Mon, 12 May 2025 13:01:02 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESYo-00000009QWd-03hW
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 12:47:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A607C294730;
	Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id f6iLu6qRFOPt; Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0542F298563;
	Mon, 12 May 2025 14:47:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RLjzZz2HeF-r; Mon, 12 May 2025 14:47:05 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA437294730;
	Mon, 12 May 2025 14:47:05 +0200 (CEST)
Date: Mon, 12 May 2025 14:47:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
In-Reply-To: <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <87frhambri.fsf@bootlin.com> <d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: Verify written data in paranoid mode
Thread-Index: vdlBgtKgU0/G1AOofAbE/k3HO+5Ouw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_054710_198959_C568912B 
X-CRM114-Status: UNSURE (   6.34  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNzw7Nrw6FzIEJlbmNlIiA8
Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPiBXZWxsLCB5ZXMsIGluIG91ciBjYXNlLiBCdXQgdGhl
IHBvaW50IGlzLCB3ZSBoYXZlIGEgc3RyaWN0IHJlcXVpcmVtZW50Cj4gZm9yIGRhdGEgaW50ZWdy
aXR5LCB3aGljaCBpcyBub3QgdW5pcXVlIHRvIHVzIEkgYmVsaWV2ZS4gSSB3b3VsZCB0aGluawo+
IHRoZXJlIGFyZSBvdGhlciBpbmR1c3RyaWFsIGNvbnRyb2wgYXBwbGljYXRpb25zIGxpa2Ugb3Vy
cywgd2hpY2ggZGljdGF0ZQo+IGEgaGlnaCBkYXRhIGludGVncml0eS4KCkluIHlvdXIgbGFzdCBw
YXRjaCBzZXQgeW91IHNhaWQgeW91ciBoYXJkd2FyZSBoYXMgYW4gaXNzdWUgdGhhdCBldmVyeQpu
b3cgYW5kIHRoYXQgZGF0YSBpcyBub3QgcHJvcGVybHkgd3JpdHRlbi4KTm93IHlvdSB0YWxrIGFi
b3V0IGRhdGEgaW50ZWdyaXR5IHJlcXVpcmVtZW50cy4gSSdtIGNvbmZ1c2VkLgoKTXkgcG9pbnQg
aXMgdGhhdCBhdCBzb21lIGxldmVsIHdlIG5lZWQgdG8gdHJ1c3QgaGFyZHdhcmUsCmlmIHlvdXIg
Zmxhc2ggbWVtb3J5IGlzIHNvIGJyb2tlbiB0aGF0IHlvdSBjYW4ndCByZWx5IG9uIHRoZSB3cml0
ZQpwYXRoIHlvdSdyZSBpbiBkZWVwIHRyb3VibGUuCldoYXQgaXMgdGhlIG5leHQgc3RlcCwgcmVh
ZGluZyBpdCBiYWNrIGV2ZXJ5IGZpdmUgc2Vjb25kcyB0byBtYWtlCnN1cmUgaXQgaXMgc3RpbGwg
dGhlcmU/IChqdXN0IGtpZGRpbmcpLgoKV2UgZG8gaGF2ZSBwbGVudHkgb2YgdGVzdHMgdG8gdmVy
aWZ5IHRoaXMgZm9yICp0ZXN0aW5nKgp0byBmaW5kIGJyb2tlbiBkcml2ZXJzIG9yIGhhcmR3YXJl
LgplLmcuIG10ZC91YmkgdGVzdHMsIFVCSSB2ZXJpZnkgYXQgcnVudGltZS4KClRoYW5rcywKLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
