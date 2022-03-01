Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EBDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gf0Tl21P3dxnyQCm790FpxzFLw5gAV35wA/GCfksZbA=; b=fSHOMN80ZmgZBdr80p4q22ykRD
	Vqq8wyL9nOrTIkJj0r0HLgNgdfFQ5gnHen5PH3CTpdQN3b93gKsT8c4zL9xhiSmEL7EcaRytltHEf
	BtgUwE20A8DQ7kjm6htlYZRpQ8690HeKLNaoAE2CGQDK5nSTYTOKyj16enGXBeJvk2VkJZrxsSfnq
	Bkq0CCeZrOn4FNX613ffUKFrM4cNaRb97alUmSbObK1RTU9Sudg2fx9xNkhBf1l0yMVnhz5nskTZY
	x3MlPSuFp6mubdifNCKIvpnKfZ7NVI2Um6pM0PRoteI2/ozzeqFtU3VRXH+SJR6B/BfrB0Oe9KwuB
	QFXSNSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP44j-00HCAp-QE; Tue, 01 Mar 2022 15:06:05 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP44d-00HC7f-5b
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 15:06:00 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B0E44609B3C0;
 Tue,  1 Mar 2022 16:05:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0v40nSVbi-hE; Tue,  1 Mar 2022 16:05:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 33003609B3D3;
 Tue,  1 Mar 2022 16:05:55 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Kz-2b_1qeBCK; Tue,  1 Mar 2022 16:05:55 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id F2CA5609B3C0;
 Tue,  1 Mar 2022 16:05:54 +0100 (CET)
Date: Tue, 1 Mar 2022 16:05:54 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Jan Kara <jack@suse.cz>
Cc: wuchi zero <wuchi.zero@gmail.com>, 
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 tj <tj@kernel.org>, mszeredi <mszeredi@redhat.com>, 
 sedat dilek <sedat.dilek@gmail.com>, axboe <axboe@fb.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 torvalds <torvalds@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <719960584.100772.1646147154879.JavaMail.zimbra@nod.at>
In-Reply-To: <20220301103218.ulbmakdy4gbw2fso@quack3.lan>
References: <2104629126.100059.1646129517209.JavaMail.zimbra@nod.at>
 <20220301103218.ulbmakdy4gbw2fso@quack3.lan>
Subject: Re: Different writeback timing since v5.14
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Different writeback timing since v5.14
Thread-Index: A7tsGqUsSQ3AY4M1uWfsU/0uR9rf+A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_070559_385065_5B33F61B 
X-CRM114-Status: UNSURE (   7.87  )
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

SmFuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkphbiBLYXJhIiA8
amFja0BzdXNlLmN6Pgo+PiBJcyB0aGlzIGV4cGVjdGVkPwo+PiBKdXN0IHdhbnQgdG8gbWFrZSBz
dXJlIHRoYXQgdGhlIHNhaWQgY29tbWl0IGRpZG4ndCB1bmNvdmVyIGFuIFVCSUZTIGlzc3VlLgo+
IAo+IFllcywgSSB0aGluayBpdCBpcyBleHBlY3RlZC4gTGlrZWx5IHRoZSBiYWNrZ3JvdW5kIHRo
cmVzaG9sZCBmb3IgVUJJRlMgYmRpCj4gaXMgdmVyeSBzbWFsbCAocHJvYmFibHkgVUJJRlMgaXMg
bm90IHVzZWQgbXVjaCBmb3Igd3JpdGViYWNrIGNvbXBhcmVkIHRvCj4gb3RoZXIgZmlsZXN5c3Rl
bXMpLiBQcmV2aW91c2x5LCB3ZSBqdXN0IHVzZWQgd2Jfc3RhdCgpIHdoaWNoIHJldHVybmVkIDAK
PiAoUENQIGNvdW50ZXIgaW5leGFjdCB2YWx1ZSkgYW5kIHNvIGJhY2tncm91bmQgd3JpdGViYWNr
IGRpZG4ndCB0cmlnZ2VyLiBOb3cKPiB3ZSB1c2Ugd2Jfc3RhdF9zdW0oKSB3aGVuIHRocmVzaG9s
ZCBpcyBzbWFsbCwgZ2V0IGV4YWN0IHZhbHVlIG9mIGRpcnR5Cj4gcGFnZXMgYW5kIGRlY2lkZSB0
byBzdGFydCBiYWNrZ3JvdW5kIHdyaXRlYmFjay4KClRoYW5rcyBmb3IgdGhlIHByb21wdCByZXBs
eSEKCj4gVGhlIG9ubHkgdGhpbmcgaXMsIHdoZXRoZXIgaXQgaXMgcmVhbGx5IGV4cGVjdGVkIHRo
YXQgdGhlIHRocmVzaG9sZCBmb3IKPiBVQklGUyBiZGkgaXMgc28gc21hbGwuIFlvdSBjYW4gY2hl
Y2sgdGhlIHZhbHVlcyBpbgo+IC9zeXMva2VybmVsL2RlYnVnL2JkaS88YmRpPi9zdGF0cy4KCkJk
aURpcnR5VGhyZXNoIGlzIGluZGVlZCAwLgoKQmRpV3JpdGViYWNrOiAgICAgICAgICAgICAgICAw
IGtCCkJkaVJlY2xhaW1hYmxlOiAgICAgICAgICAgICAgMCBrQgpCZGlEaXJ0eVRocmVzaDogICAg
ICAgICAgICAgIDAga0IKRGlydHlUaHJlc2g6ICAgICAgICAgICAgNzcyNjIwIGtCCkJhY2tncm91
bmRUaHJlc2g6ICAgICAgIDM4NTgzNiBrQgpCZGlEaXJ0aWVkOiAgICAgICAgICAgICAgICAgIDAg
a0IKQmRpV3JpdHRlbjogICAgICAgICAgICAgICAgICAwIGtCCkJkaVdyaXRlQmFuZHdpZHRoOiAg
ICAgIDEwMjQwMCBrQnBzCmJfZGlydHk6ICAgICAgICAgICAgICAgICAgICAgMApiX2lvOiAgICAg
ICAgICAgICAgICAgICAgICAgIDAKYl9tb3JlX2lvOiAgICAgICAgICAgICAgICAgICAwCmJfZGly
dHlfdGltZTogICAgICAgICAgICAgICAgMApiZGlfbGlzdDogICAgICAgICAgICAgICAgICAgIDEK
c3RhdGU6ICAgICAgICAgICAgICAgICAgICAgICAxCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
