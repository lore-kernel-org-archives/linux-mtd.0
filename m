Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE225C04AA7
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 21:39:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96D5A2085A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 21:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KWk5kAV6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96D5A2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdwuve/X8ybU7/HiS89iVSUbUOKh5gTdEwgj+lyui3w=; b=KWk5kAV6B+kpMU
	bLU3GFuQN3c1iLI6HNCTlB82UmmmMQBLyYA9pO9qRE6OL1QE/5knZQMjCZ4Ii22c08Dkia/a7s9Aw
	8UlJCX8dyBh6rP8SNcrwA49vZ4G3NAZL0sskyEQ9Gu2Bd3esWNrBOOmsMK8zMiDnD3AAd1ODmgw4y
	/TkP4cr7O+tDTgl9waW5bDCjqNG2mPb1qxtcvJf6HtKMa9KroxrnSGQRay0z2lnGHp8YXD/5jX5oi
	1v4F3gIPSK/V6Z+lR3v3Da1CkPmqJDLZb9ce7zLlhyHoXEDi7lW2sQ92vjMX6ls6gYgbin3ab6hzd
	ADp+ZMOhSTczHLE5n8Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQIf9-0002ca-DR; Mon, 13 May 2019 21:39:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQIf5-0002cC-Ne
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 21:39:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B5A626083107;
 Mon, 13 May 2019 23:39:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id d0hL8uthwQhf; Mon, 13 May 2019 23:39:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6C6886083108;
 Mon, 13 May 2019 23:39:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CtxwwqacyvI0; Mon, 13 May 2019 23:39:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 3FC4A6083107;
 Mon, 13 May 2019 23:39:04 +0200 (CEST)
Date: Mon, 13 May 2019 23:39:04 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <1886500245.56511.1557783544203.JavaMail.zimbra@nod.at>
In-Reply-To: <20190513195652.GB142816@gmail.com>
References: <20190326075232.11717-1-s.hauer@pengutronix.de>
 <20190326075232.11717-2-s.hauer@pengutronix.de>
 <20190508031954.GA26575@sol.localdomain>
 <1170873772.48849.1557298158182.JavaMail.zimbra@nod.at>
 <20190513195652.GB142816@gmail.com>
Subject: Re: [PATCH 1/2] ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
Thread-Index: wzeulKMKcqRRx0r0yyIy5nwtrOQ2UA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_143907_920606_130E0CB0 
X-CRM114-Status: UNSURE (   4.12  )
X-CRM114-Notice: Please train this message.
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
Cc: tytso <tytso@mit.edu>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fscrypt <linux-fscrypt@vger.kernel.org>, kernel <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFRoaXMgd2FzIG1lcmdlZCB0byBtYWlu
bGluZSBhbmQgaXQncyBzdGlsbCBicm9rZW4uICBUaGlzIGJyZWFrcyBVQklGUyBlbmNyeXB0aW9u
Cj4gZW50aXJlbHksIEJUVy4gIERvIHlvdSBub3QgcnVuIHhmc3Rlc3RzIGJlZm9yZSBzZW5kaW5n
IHB1bGwgcmVxdWVzdHM/CgpUaGUgc2ltcGxlIGFuc3dlciBpcywgbm90IHRoaXMgdGltZSBiZWNh
dXNlIG15IExhcHRvcHMnIGZpbGVzeXN0ZW0gYnJva2UKYW5kIEkgd2FzIGtpbmQgb2YgYnVzeSB3
aXRoIHJlY292ZXJ5LgpUaGUgaXNzdWUgaXMga25vd24sIHdlIGhhdmUgYSBwYXRjaCBhbmQgZml4
dXAgd2lsbCBiZSBzZW50IHRvIExpbnVzCnZlcnkgc29vbi4gTm9ib2R5IGdvdCBodXJ0LgoKVGhh
bmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
