Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B5CC04AB4
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 08:28:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB1D20848
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 08:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nhvneqvu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB1D20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ix14xhbAymv735bLRMmLQ2kcBKKT8kFFXGRcNzhN6oI=; b=NhvneqvuTUVdnN
	o9PH50EzBxaKaq0v1ri1n6kkwPkGCLjhqJAowwrksZ1jyuy1SG4qvCFOl0C2NRLQ3XPy9JiRJD5t+
	Vw45LAAFb7aowYNeGh4aRZM0LVi11/PClN21ORS/QtRM55Om1F+cVUeEAAWp4L4SeNkOirzMqkuw0
	bW18hpq/w7IrwsM2v4bYUEO63XJwjCPUIfb+9SXmyd/bsTjKqRsm6SqCdIis8ARM1389KrDKFoou6
	KKEkJ+z4cVYZW8ooK1Ef8Fsb1M50P/PCwyXx74Z0e3/XBDHXvmwUmuwy4Ho7OGz5Izkjdl0tovlfI
	xEYu13JTKWYkkPaLBckg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRBk8-0007ce-Dp; Thu, 16 May 2019 08:28:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRBk4-0007Vx-15
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 08:27:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 58C71608A39B;
 Thu, 16 May 2019 10:27:54 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id aJQJGYihpwvn; Thu, 16 May 2019 10:27:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CACBF608A3BE;
 Thu, 16 May 2019 10:27:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 62UdxJy2aWde; Thu, 16 May 2019 10:27:53 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A8DBA608A39B;
 Thu, 16 May 2019 10:27:53 +0200 (CEST)
Date: Thu, 16 May 2019 10:27:53 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "Shreya Gangan (shgangan)" <shgangan@cisco.com>
Message-ID: <1060037520.60545.1557995273554.JavaMail.zimbra@nod.at>
In-Reply-To: <5B190BFA-DF2A-4469-85E2-14A7347B7A8E@cisco.com>
References: <E44E4181-1CFB-493C-8023-147472049D19@cisco.com>
 <CAFLxGvysPg3FO4kT0QrRsYTr219WVttQMeat_StqbifTPrGLmA@mail.gmail.com>
 <5B190BFA-DF2A-4469-85E2-14A7347B7A8E@cisco.com>
Subject: Re: Removal of dump_stack()s from /fs/ubifs/io.c
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: Removal of dump_stack()s from /fs/ubifs/io.c
Thread-Index: AQHVC2FVil2C0hxsCESyeW0kls9eBqZsX3uAr4vQGkk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_012756_340744_87010153 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBUaGV5IGFyZSBub3QgcmVxdWlyZWQs
IGJ1dCB0aGV5IGFyZSBqdXN0IHVzZWZ1bC4gV2hpbGUgeW91IGFyZSByaWdodCB0aGF0IHRoZQo+
PiBsb2NhdGlvbnMgd2l0aGluIFVCSUZTIGFyZSB1bmlxdWUsCj4+IHRoZXkgYXJlIG5vdCBmb3Ig
dGhlIHdob2xlIGtlcm5lbCBjb250ZXh0Lgo+PiBGaWxlc3lzdGVtIGZ1bmN0aW9ucyBjYW4gZ2V0
IGNhbGxlZCB2aWEgbWFueSBkaWZmZXJlbnQgcGF0aHMgZnJvbSBWRlMuLi4KPiAKPiBJc24ndCB0
aGF0IHRydWUgZm9yIGFueSBrZXJuZWwgZXJyb3IgdGhvdWdoLgo+IFdhbnQgdG8gdW5kZXJzdGFu
ZCB3aHkgaXQgd291bGQgYmUgZXNzZW50aWFsIGZvciB1YmlmcyB0byBoYXZlIHRoZXNlIG92ZXIg
dGhlCj4gb3RoZXIga2VybmVsIG1vZHVsZXM/Cj4gQ2FuJ3QgdGhlIGRldmVsb3BlciBhZGQgdGhl
IGR1bXBfc3RhY2sgbGF0ZXIgZm9yIGRlYnVnZ2luZyByZWFzb25zPwoKSW4gVUJJRlMgdGhlIGR1
bXBfc3RhY2soKSBjYWxscyBhcmUgbW9yZSBvciBsZXNzIGEgV0FSTl9PTigpLgpTdWNoIHNpdHVh
dGlvbnMgc2hvdWxkIG5vdCBoYXBwZW4uIElmIHRoZXkgZG8sIHdlIHdhbnQgdGhlIGRldGFpbHMu
CgpTbywgaW4gdGhlIGxvbmcgcnVuZyB3ZSBjb3VsZCByZXBsYWNlIG1vc3Qgb2YgdGhlbSBieSBh
IFdBUk5fT04oKS4KTWF5YmUgZXZlbiBXQVJOX09OX09OQ0UoKS4KCj4+IFdoeSBkbyB5b3Ugd2Fu
dCB0byByZW1vdmUgdGhlbSwgd2hhdCBpcyB0aGUgYmVuZWZpdD8KPiAKPiBUaGUgd2F5IG91ciBz
eXN0ZW0gaXMgdXNpbmcgdGhlIHViaWZzLCBmb3IgYSBkZXZpY2Ugd2hpY2ggaXMgJ25vIGxvbmdl
ciB0aGVyZScKPiBjb3VsZCBiZSBmcmVxdWVudAo+ICdubyBzdWNoIGRldmljZScgZXJyb3JzIHdo
ZW4KPiAxLiB0aGVyZSBtaWdodCBiZSBtdWx0aXBsZSB3cml0ZSBhY2Nlc3NlcyB0byB0aGUgZmls
ZXN5c3RlbSBiZWZvcmUgdGhlCj4gcmVzcG9uc2libGUgcHJvY2VzcyBpcyB0ZXJtaW5hdGVkCj4g
Mi4gdGhlIGZpbGVzeXN0ZW0gaXMgdW5tb3VudGVkIGFmdGVyIHRoaXMKPiBUaGUgcmVzdWx0IHdv
dWxkIGJlIGZsb29kaW5nIG9mIHRoZSBjb25zb2xlIG9yIG1lc3NhZ2UgbG9ncyB3aXRoIGJvdGgg
dGhlIGVycm9yCj4gbWVzc2FnZXMgYW5kIHRoZSBkdW1wX3N0YWNrLAo+IG1ha2luZyBpdCByZWFs
bHkgdWdseS4KPiBJcyB0aGVyZSBhIHNwZWNpZmljIHdheSBhICdubyBzdWNoIGRldmljZScgaXNz
dWUgaXMgaGFuZGxlZCB0byBhdm9pZCB0aGUKPiBtZXNzYWdlcyBmcm9tIGZsb29kaW5nIHdpdGgg
dGhlIGR1bXBfc3RhY2tzPwoKSSBkb24ndCBmb2xsb3csIHNvcnJ5LgoKSWYgeW91ciBzeXN0ZW0g
dG9vIG5vaXN5LCBmaXggdGhlIGxvZyBsZXZlbC4gQnV0IHVzdWFsbHkgd2hlbiBVQklGUyBwcmlu
dHMKYW4gZXJyb3IgZm9sbG93ZWQgYnkgYSBzdGFjayB0cmFjZSwgaXQgaXMgc29tZXRoaW5nIHNl
cmlvdXMgeW91IHNob3VsZCBhZGRyZXNzCmFuZCBub3QgdHJ5aW5nIHRvIG1ha2UgdGhlIGVycm9y
IG1lc3NhZ2UgbG9vayBsZXNzIHNjYXJ5LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
