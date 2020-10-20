Return-Path: <SRS0=vJsE=D3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CCBC4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 14:21:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC522098B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 14:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oogjImtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC522098B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PSXqLQnIiQcLCnEZyhyGZ/7tStZiKOOuXN7JMJcgTOE=; b=oogjImtkbVypwpMbMsnPreXsi
	3Hye2/bPGu2IkElWAmvU9ZVH+2kF7MdnzMNxxzexgvILcC7+OCXjFRkvZVCrwuXyNUmtVHWh1F38f
	Zr29bI6Miqy1Fjvcp7oJGz+0aqJywBVoZmTBQNJPw5rmzOiQJ1ZcW3uHwi9CHDs90Kv41GKOckR7D
	m+0VcMCva6K2kK9LpxejlHGANmKwrxJMn9PaQbMI7kpt0icXkm5XsShxOu6ZbMnEk0GSHyy70vh4a
	BXXutUkTdEJIc4dSJKQxuqXFRNYgHqFY2PRuJlakDuBJZQK3xwvHb96jqgUhb+sMF2XOR0aDmKNr2
	XP/22NlBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUsUy-0006yI-Eh; Tue, 20 Oct 2020 14:20:24 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUsUv-0006xV-Mn
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2020 14:20:22 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 188DB6231F3E;
 Tue, 20 Oct 2020 16:20:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2bqLSZFXsX7f; Tue, 20 Oct 2020 16:20:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6AF986125F39;
 Tue, 20 Oct 2020 16:20:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ki_go-2lwbUD; Tue, 20 Oct 2020 16:20:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4BB546231F3E;
 Tue, 20 Oct 2020 16:20:16 +0200 (CEST)
Date: Tue, 20 Oct 2020 16:20:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tom Rix <trix@redhat.com>
Message-ID: <1957286686.215125.1603203616230.JavaMail.zimbra@nod.at>
In-Reply-To: <fef9fb1c-30ee-14fb-a9bd-4f4a554a8bbc@redhat.com>
References: <20201019191631.9604-1-trix@redhat.com>
 <CAFLxGvwAVbpUe221N-qS19aFSaJ4hM=J=veHfi+4wAkNTNGAog@mail.gmail.com>
 <fef9fb1c-30ee-14fb-a9bd-4f4a554a8bbc@redhat.com>
Subject: Re: [PATCH] mtd: remove unneeded break
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: remove unneeded break
Thread-Index: VuWEEkF7B042gHmZlY7KkRdT2r+sCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_102021_838524_F5C1BF39 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRvbSBSaXgiIDx0cml4QHJl
ZGhhdC5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNoYXJkLndlaW5iZXJnZXJA
Z21haWwuY29tPgo+IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2
aWduZXNockB0aS5jb20+LAo+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IEdl
c2VuZGV0OiBEaWVuc3RhZywgMjAuIE9rdG9iZXIgMjAyMCAxNjowMDozNwo+IEJldHJlZmY6IFJl
OiBbUEFUQ0hdIG10ZDogcmVtb3ZlIHVubmVlZGVkIGJyZWFrCj4+IEFja2VkLWJ5OiBSaWNoYXJk
IFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+Pgo+PiBEbyB5b3Ugd2FudCB0byByb3V0ZSB0
aGlzIHBhdGNoIHRocm91Z2ggbXRkIG9yIGRvIHlvdSBjYXJyeSBpdD8KPiAKPiBOb3Qgc3VyZSBp
ZiB0aGlzIHF1ZXN0aW9uIGlzIGZvciBtZS4KCkl0IHdhcy4gOi0pCiAKPiBJIGRvIG5vdCBtYWlu
dGFpbiBhIHN1YnN5c3RlbS9icmFuY2gsIHNvIHRocm91Z2ggbXRkIGlzIHdoYXQgaSB3YXMgYXNz
dW1pbmcuCgpPa2F5LCB0aGVuIGxldCdzIGNhcnJ5IHRoaXMgb25lIHRocm91Z2ggbXRkLgpHbG9i
YWwgY2xlYW51cHMgZ28gc29tZXRpbWVzIGluIGEgZGVkaWNhdGVkIHRyZWUgZGlyZWN0bHkgdG8g
TGludXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
