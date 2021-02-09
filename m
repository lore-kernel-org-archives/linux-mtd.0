Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF474C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 21:39:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF7364EAC
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 21:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF7364EAC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8M+TFnubV1Km9e/6H1tj6yznH9z44Tl4loztr8h4Ac=; b=JDZQRxvkr9pR3ffZL90truVOR
	wulkaRELHuKQIAS6gHLwnmdMmOggXXNh7IRvgvg5Y+jAq0pD3FksUHJ2DLdtL89PtDPaj4zaUZ8mD
	9Ny5VBram7J/oZYWwvphIYuQyvj/zudl3pIUhsClhzjIjb8rDsaBZKwGN2RZbj+1hRgSTsaB0ExVS
	PrnL1L+qP7avSSl5Hi19lULdILCHGu2DI6yPIyM27aOptjYpVHByIyG0Sz7t1L+6GsnK4k2FnaxlX
	e8slQADcjXvtMQTkAxf91lvS6bDvNAZB3jvg5j1dSg5XgIf8L8FxuANHrNetx13G0yH82xuGgGRGq
	tp8NsCVkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9ajH-0004WJ-2w; Tue, 09 Feb 2021 21:39:27 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9ajE-0004VO-7a
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 21:39:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 25CCA6083270;
 Tue,  9 Feb 2021 22:39:22 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zcuKv_gcvvzX; Tue,  9 Feb 2021 22:39:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C6A76608A38F;
 Tue,  9 Feb 2021 22:39:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id o475j9w_Tchu; Tue,  9 Feb 2021 22:39:21 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A34F76083270;
 Tue,  9 Feb 2021 22:39:21 +0100 (CET)
Date: Tue, 9 Feb 2021 22:39:21 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miklos Szeredi <miklos@szeredi.hu>
Message-ID: <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
In-Reply-To: <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: ouVDBBxzMEdyj7XGvi0Ky/PygYF9uw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_163924_427306_08ECC896 
X-CRM114-Status: UNSURE (   5.71  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TWlrbG9zLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IElmIHlvdSBsb29rIGF0
IGZ1c2VfZG9faW9jdGwoKSBpdCBkb2VzIHZhcmlhYmxlIGxlbmd0aCBpbnB1dCBhbmQKPiBvdXRw
dXQgYXQgdGhlIHNhbWUgdGltZS4gIEkgZ3Vlc3MgeW91IG5lZWQgc29tZXRoaW5nIHNpbWlsYXIg
dG8gdGhhdC4KCkknbSBub3Qgc3VyZSB3aGV0aGVyIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkuCgpJ
biBNVVNFIG9uZSB1c2UgY2FzZSB3b3VsZCBiZSBhdHRhY2hpbmcgdHdvIGRpc3RpbmN0ICh2YXJp
YWJsZSBsZW5ndGgpIGJ1ZmZlcnMgdG8gYQpzaW5nbGUgRlVTRSByZXF1ZXN0LCBpbiBib3RoIGRp
cmVjdGlvbnMuCklmIEkgcmVhZCBmdXNlX2RvX2lvY3RsKCkgY29ycmVjdGx5LCBpdCBhdHRhY2hl
cyBhbHdheXMgYSBzaW5nbGUgYnVmZmVyIHBlciByZXF1ZXN0CmJ1dCBkb2VzIG11bHRpcGxlIHJl
cXVlc3RzLgoKSW4gTVVTRSB3ZSBjb2xkIGdvIHRoZSBzYW1lIHBhdGggYW5kIGlzc3VlIHVwIHRv
IHR3byByZXF1ZXN0cy4KT25lIGZvciBpbi1iYW5kIGFuZCBvcHRpb25hbGx5IGEgc2Vjb25kIG9u
ZSBmb3IgdGhlIG91dC1vZi1iYW5kIGRhdGEuCkhtbW0/CgpUaGFua3MsCi8vcmljaGFyZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
