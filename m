Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A1FF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7yKTcQSYCle1G1+d7H7PtmIp7RD4k7XmtQ1T2vXh6o=; b=wqfVIZD1SxZMLh
	CznERcw3SmVPo3iNCf0mbXoDQgj15VZuluhsjzeOhqdeOYpp/cWYyZrR+Yq36tj0iQCbtbDxOuVx4
	nOBHIvJRTxFixGOePe20hwZXenuc/dxNeCiinUuNfss5SZ6g9fM74waErHF530xOPBFZKZiaS4fYy
	bDvwwxQy/0KGTg9uZpWa6K0HkDvE+QfHSvfgcLWUM3hOQWGEdGQ0dV1+pUxin6oARJDykqBMtyGxp
	Rs12R3fbisZRzGhtZNLd0CInSY3EPZvh44/BwZNLK8vmKSGAJG8CiM+au8W9nenfRYFGvAwC0o1Tf
	ykA/csIDhZA/vgelnfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLBU-0000000GvBK-43or;
	Mon, 27 Apr 2026 12:35:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLBP-0000000GvAO-3GNj
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 12:35:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FF021A3442;
	Mon, 27 Apr 2026 12:35:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D41F5600D1;
	Mon, 27 Apr 2026 12:35:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A8D0107281E7;
	Mon, 27 Apr 2026 14:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777293325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uKFfXQaezyTz26nsftWjY8Ac+CXjHCjEYGqkt7gYjo0=;
	b=ghOXWGounxDetPhdU7XY9YNSDqNYMiii5lomtJUfnC/ed5CDqeMiIzGysSvLvemgn5Sk7v
	JFfAtexSdyRdebFrAe3+yN4dG/asDlmPaxSu/BYoBRlSRiKY7ciRiAbVt19gfTbscAeM56
	C2fu5xLIKeOlYDpRcb2qwVeQsQR5vk/OiZTlFPm3sk0O3nMSyrmCXB1tFavEoMsdczBtle
	Fov73CytapRE1ofZZq6mrBnu6RQ2s0L3gZ4S0phBYu+znYd+vUxMkoEdWwIPJtL12Fqog1
	jco7PQtWLho06274sENNyStVGGST+DAmNjyVWPrbaEjbka46RmcWgF3f+Katew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fuchs <fuchsfl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-sh@vger.kernel.org,  linux-kernel@vger.kernel.org,  Rich Felker
 <dalias@libc.org>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v2 3/3] mtd: maps: vmu-flash: Fix NULL pointer
 dereference in initialization
In-Reply-To: <20260427114750.2480900-4-fuchsfl@gmail.com> (Florian Fuchs's
	message of "Mon, 27 Apr 2026 13:47:50 +0200")
References: <20260427114750.2480900-1-fuchsfl@gmail.com>
	<20260427114750.2480900-4-fuchsfl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 14:35:25 +0200
Message-ID: <87y0i8h982.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_053527_945941_81C8619A 
X-CRM114-Status: UNSURE (   5.87  )
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

T24gMjcvMDQvMjAyNiBhdCAxMzo0Nzo1MCArMDIsIEZsb3JpYW4gRnVjaHMgPGZ1Y2hzZmxAZ21h
aWwuY29tPiB3cm90ZToKCj4gVGhlIG10ZF9pbmZvIGNvbnRhaW5zIGEgc3RydWN0IGRldmljZSwg
d2hpY2ggbXVzdCBiZSBsaW5rZWQgdG8gaXRzCj4gcGFyZW50LiBXaXRob3V0IHRoaXMsIHRoZSBp
bml0aWFsaXphdGlvbiBvZiB0aGUgTVREIGZhaWxzIHdpdGggYSBOVUxMCj4gcG9pbnRlciBkZXJl
ZmVyZW5jZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRnVjaHMgPGZ1Y2hzZmxAZ21haWwu
Y29tPgo+IC0tLQoKRm9yIGhvdyBsb25nIGFzIHRoaXMgYmVlbiBicm9rZW4/IElzIGl0IHJlYWxs
eSB1c2VkPwoKQW55d2F5LCBhbHNvIGhlcmUgeW91IHdpbGwgbmVlZCB0byBDYyBzdGFibGUgYW5k
IGFkZCBhIGZpeGVzIHRhZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
