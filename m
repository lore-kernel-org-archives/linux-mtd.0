Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7355CC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:05:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DA62184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fu6hmBPE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DA62184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6outS9K3rphDvldkSpISKymXDNNbAl7VzM3/qK0444=; b=fu6hmBPE7IcbAL
	IbeWRRfx0q1DmUGRKiWH4GqiCgGG1aA2JtZLdtSp+o2nnuP3pSw7tu+OwwPsXGlceS0hZNIgNN3q/
	xvocBaPz3Xv5/R1teh94p0e6sfxJ7EAJY6yIfKsi+8UzLuuk/FD88vB9m4mEXLrZSmnUSPi66MCJr
	drLIspSgZsj9BjmU4MS7VruM234dA3ja98vZCVuw0PE8ACnE8E+QbuwUCR2fB2yuWjHXMCOtV+/h8
	Obds9otX6vGKyBqNj+O40ruyrdcCKIjLIJOLOwC0csLbKctZVrLTvkrboKo3pGUfNpjt6TIFi8bAm
	F+TakDKAxouqv3jCR9SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6iOe-0005eZ-59; Wed, 20 Mar 2019 21:05:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6iOa-0005Mv-Ly
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 21:05:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 087FE609187F;
 Wed, 20 Mar 2019 22:05:07 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xPnqxsYI2Co5; Wed, 20 Mar 2019 22:05:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BE98F60ED8A7;
 Wed, 20 Mar 2019 22:05:06 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9eGmChzciKqE; Wed, 20 Mar 2019 22:05:06 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 464D0609187F;
 Wed, 20 Mar 2019 22:05:06 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Date: Wed, 20 Mar 2019 22:05:05 +0100
Message-ID: <3141647.IxSqQhjO87@blindfold>
In-Reply-To: <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_140508_874561_7D305783 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

Am Mittwoch, 20. M=E4rz 2019, 21:20:51 CET schrieb Gustavo A. R. Silva:
> Hi all,
> =

> Friendly ping:
> =

> Who can take this?

Hmmm, for MTD I think we can schedule these patches for the next merge wind=
ow.
But I'm not sure whether these comments are a good solution.
I much more prefer the compiler attribute solution.
Also a tree-wide (sane) coccinelle script would be better IMHO,
and not zillions of individual patches via different trees.

Thanks,
//richard





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
