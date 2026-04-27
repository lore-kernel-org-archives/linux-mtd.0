Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F5DFF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYEUCogbaEolxJ7dRA1W+21UtGzbZDBfKwQ1Q2C+u5U=; b=A8E1s8UEoN3Yw1
	GfS6YgeeizG9au59ZIqciE2Sq9Lwg/wOwKFgpEyvSJcVgo+nXJhAzqu59QLvbhUAk7tp5BaUkH9Bu
	zfi0qqwrdj0oFOMs8C9yGtFMRm8QU1NbWZkzVyCCsmO6SLSnn0ok37FwzLSwPlMfkYEi+uqtWxDBY
	h43eDNtIb25H6v8duvO1An8hVYA/otCM5NWyuOWyZeuQ09tsNnIAXJ7b2vMMIA+0pLSGuVTNeScM6
	c7VQ068+96BR9pYJgOyQbet074FuAO8m1z7I3NjXv47VlkIM0DaUnj6H/KdaHDaVMii50G78cbGcm
	6K6pNBrtb+7udk5cuidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLAh-0000000Gv49-2R1s;
	Mon, 27 Apr 2026 12:34:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLAe-0000000Gv3n-1P4P
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 12:34:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C41BCC5CD46;
	Mon, 27 Apr 2026 12:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D1BD600D1;
	Mon, 27 Apr 2026 12:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D3D51072806A;
	Mon, 27 Apr 2026 14:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777293276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jCxkAOBQczVa5vCrereqaQuzkFeKTL+bu3gajaEh6CA=;
	b=V4CIzrmN9pFd3j7SEkG9OFQ0vIpI09scTnbE9VSkmXByNjy7mXrFik0BSx5UXrJ5fnhSeU
	AXEhperFc3JOfVThM7o2HmQNv8MR3RNYBeVUFvMU0ElcjaiQSVMIOL5kWbeIEnh4LCqGhx
	TGT44OnV7YPYydcpkYYmjQb/SNbWH2p3uHNKdp/qRd1fZO3FidxKdtAZNtfihIBakYQR5g
	bgM53ehi+L4dJrfhVCfueIu6VupSTc78y3Mo8ToYmLCJNPL4RnO1BwO9wgMtM5E6soy78v
	fFedLg2p/9TK/WIjX8UYfLT+vcrXvGm8r002oBHjTK61COZFFh8X7MldxqiLdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-sh@vger.kernel.org,  linux-kernel@vger.kernel.org,  Rich Felker
 <dalias@libc.org>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v2 2/3] mtd: maps: vmu-flash: fix fault in unaligned fixup
In-Reply-To: <20260427114750.2480900-3-fuchsfl@gmail.com> (Florian Fuchs's
	message of "Mon, 27 Apr 2026 13:47:49 +0200")
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
	<20260427114750.2480900-3-fuchsfl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 14:34:35 +0200
Message-ID: <874ikwintw.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_053440_517156_CF03D466 
X-CRM114-Status: UNSURE (   5.04  )
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

T24gMjcvMDQvMjAyNiBhdCAxMzo0Nzo0OSArMDIsIEZsb3JpYW4gRnVjaHMgPGZ1Y2hzZmxAZ21h
aWwuY29tPiB3cm90ZToKCj4gVXNlIGt6YWxsb2Nfb2JqKCkgLyBremFsbG9jX29ianMoKSB0byBh
bGxvY2F0ZSB0aGUgbWVtY2FyZCBzdHJ1Y3RzLAo+IGluc3RlYWQgb2Yga21hbGxvY19vYmooKSAv
IGttYWxsb2Nfb2JqcygpIHRvIHByZXZlbnQgYWNjZXNzIHRvCj4gdW5pbml0aWFsaXplZCBkYXRh
Lgo+Cj4gRml4ZXMgcnVudGltZSBlcnJvcjogRmF1bHQgaW4gdW5hbGlnbmVkIGZpeHVwOiAwMDAw
IFsjMV0gYXQKPiBtdGRfZ2V0X2ZhY3RfcHJvdF9pbmZvLgoKU2hhbGwgdGhpcyBwYXRjaCByZWNl
aXZlIGEgRml4ZXMgdGFnIGlmIGl0IGFjdHVhbGx5IGZpeGVzIHJ1bnRpbWUKYmVoYXZpb3VyPwoK
QWxzbywgcGxlYXNlIGFkZCB0aGUgJ0NjOiBzdGFibGUnIGxpbmUgaW4geW91ciBmaXhlcy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
