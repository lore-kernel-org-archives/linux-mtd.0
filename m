Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58052C10F03
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 22:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E842083E
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 22:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWO0BpBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E842083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVQxhjcukQz1G+Vk4XZuKYPaSwMV5eZAcbb+mC9He4U=; b=jWO0BpBQAdCHL7
	Vn0EokGmcBjkpbti7TEr6csjiIhVk82tV51O95xXImx9JSNoQq1yMsr/B3z/odRmAtscPLf6eBIDB
	HS2JOvpo+B6OnU0H5DsH/Uff0kBkSGMj5Em/5N92VLaA+2tXLcD0N/lszXFNwe6W/0x2HUrEN49er
	+8mP3wGPtcyy6OshVyKRey853wMj0+hYRZecvPh5cCFOoSlyrM8X9EkFy79OnHODmOzV4Ly8UQ0ib
	XSFQcUo5QfdA+rc4E6xopWUlIMpc5Tarayl7uz2ll9idYcoLJJ36I0H4rP8pOKQTLtgFkr5PqqF7F
	WBoAlrmT06pl/jfdiY6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzqov-0000Fu-VP; Fri, 01 Mar 2019 22:39:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzqom-0008Fr-VA; Fri, 01 Mar 2019 22:39:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2337F608A38A;
 Fri,  1 Mar 2019 23:39:45 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0C3sa9bVpLP5; Fri,  1 Mar 2019 23:39:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CEFF5608A397;
 Fri,  1 Mar 2019 23:39:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UOl17io9Sbg8; Fri,  1 Mar 2019 23:39:44 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 3B902608A38A;
 Fri,  1 Mar 2019 23:39:44 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v3] mtd: rawnand: Mark expected switch fall-throughs
Date: Fri, 01 Mar 2019 23:39:43 +0100
Message-ID: <2354894.fi12vfZcmb@blindfold>
In-Reply-To: <1a9e7d7e-6743-4932-a1b6-528ae7e5643a@embeddedor.com>
References: <20190208174930.GA12962@embeddedor>
 <1a9e7d7e-6743-4932-a1b6-528ae7e5643a@embeddedor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_143949_168169_AB28EEF6 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: Kees Cook <keescook@chromium.org>, Wan ZongShun <mcuos.com@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 1. M=E4rz 2019, 22:38:18 CET schrieb Gustavo A. R. Silva:
> Hi all,
> =

> Friendly ping:
> =

> Who can take this, please?

/me points to Miquel. :)

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
