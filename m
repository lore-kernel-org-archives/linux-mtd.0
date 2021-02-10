Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C9CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 21:12:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5420F64E31
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 21:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5420F64E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Brvk4qTbsAeicNCT3s4ld71kVi3YFGFlxCVUt7Lu7+w=; b=ReRvygd11r3mCum5tMcMmGB9N
	XXZnuiw2mVQxQuMh2R2sl5hb04Qzr9WLlQOdIjxY3NSCumgXwktNYOYxL5N/DKDQ8sP3iFsaJBPNr
	0HRuSCoR52MgR1yy6amNVmgc2Kq+1bqlfJW3Q1YOh94H7lLgumofbqNGWIDURrKDCiGCX7yTppZ+o
	Psptumqd4wFGXGeYlqid83UWQaQGpK66MLYJg7ZCIECGOIQr9J87dtOMAEM3AnKHKpHwplDsamdLi
	VnOYpG08Qoo6ApEJp0HE2pDhCIscRUxPM1q8EQShhi7a+82NDdCm1TquFSBtx3f85IjanPmRcoUUM
	aB4N9BFjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9wlu-00059y-Dx; Wed, 10 Feb 2021 21:11:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9wlr-00059Z-77
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 21:11:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C4BB3627AFC8;
 Wed, 10 Feb 2021 22:11:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LRpPA_QJFqh4; Wed, 10 Feb 2021 22:11:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 780276083277;
 Wed, 10 Feb 2021 22:11:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id D9Tnmm0EdigE; Wed, 10 Feb 2021 22:11:31 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4EE976089354;
 Wed, 10 Feb 2021 22:11:31 +0100 (CET)
Date: Wed, 10 Feb 2021 22:11:31 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <605123206.382066.1612991491197.JavaMail.zimbra@nod.at>
In-Reply-To: <20210210215548.40ce9ba5@xps13>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <1507208626.379155.1612906761549.JavaMail.zimbra@nod.at>
 <CAJfpegugbvppOKhJ8KjSVGgZOGVuj6NSiy4n18mbD7Ui3wme6g@mail.gmail.com>
 <20210210121429.4fb5ecf3@xps13>
 <1183985773.380599.1612956233979.JavaMail.zimbra@nod.at>
 <20210210215548.40ce9ba5@xps13>
Subject: Re: [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: IS11nPAn7mspJgoMPO7FSWtrblrgdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_161135_401738_07C822FC 
X-CRM114-Status: UNSURE (   3.10  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Ron Minnich <rminnich@google.com>,
 sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBCeSBzaW5nbGUgcmVxdWVzdCB3ZSBt
ZWFudCBGVVNFIG9wLWNvZGVzLiBUaGUgTkFORCBzaW11bGF0b3IgaW4gVXNlcnNwYWNlCj4+IHdp
bGwgc2VlIGp1c3Qgb25lIGNhbGwuIE15IHBsYW4gaXMgdG8gYWJzdHJhY3QgaXQgaW4gbGliZnVz
ZS4KPiAKPiBJZiBsaWJmdXNlIGFic3RyYWN0cyBpdCwgYXMgbG9uZyBhcyBNVEQgb25seSBzZWVz
IGEgc2luZ2xlIHJlcXVlc3QgSSdtCj4gZmluZSA6KQoKOi0pCgpJJ2xsIHByb3RvdHlwZSB0aGF0
IGluIHRoZSBuZXh0IGZldyB3ZWVrcy4gTGV0J3Mgc2VlIHdoZXRoZXIgbXkgcGxhbnMgYXJlCmRv
YWJsZSB0byBub3QuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
