Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AA8C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:58:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B14020671
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WssVYU4V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsLtS79H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B14020671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sewk5+wdOuFEk2b1LNpsHtFc6OdidFnVDeqrkikPY+E=; b=WssVYU4V1whARx
	f5JGzox1sQcA15NXYOOc4gbZkfYWhnXgMQQ08bPnxonVU62isX2jucKGrcVf2jRuCcQHHCxPrzmGj
	TfTtVqMMb+6jH+H/AKtaFk9hbFBjo9SOPN5XAx2uAIJ8+gA2xnK0N8vtPf7us48xAZ43LCWwiiUpn
	yR4pPRay7dI7Bk/4sHJdk1EAQYjMz0caaTwjsEx/ApkBL6BBJK79JWYybUcy2m3J364iNB+f3qh7U
	4S4rdUCJXRJPiLp/SbS7bguXXhZzA/W6pRJ7noBQtw5Gqr/Nc329nC6jSqrnSKBaZ4tpvq0mixre4
	kFiIGEJ8YDiDpHzN9Njg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbR6b-00054K-9j; Wed, 20 May 2020 15:58:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbR6M-0004u0-O7; Wed, 20 May 2020 15:57:51 +0000
Received: from kernel.org (unknown [87.71.47.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39A8B20671;
 Wed, 20 May 2020 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589990270;
 bh=dyM+tK9H4/jk7pTbjNgGxP0ZUddj2kYd/1wdgIKNWSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VsLtS79HWRN19PUB99ZLXgO2mU0/W9GPWWQi60AkvrvCoQIglg2Dt0z2XWLOvacbf
 9UeOcnBWA5TZhonPflDchQYmxWK5BVFp7elu1xhP1+mi0XP3lJDRpeknKs+lzbTPun
 41cMmp6vFgobMY9POhClbsS1z2IOyeSOqRz+x/J8=
Date: Wed, 20 May 2020 18:57:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
Message-ID: <20200520155735.GF1118872@kernel.org>
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_085750_808731_21CE9877 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:
> On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >
> > As these boards have no more users nor testers, and patching them has
> > become a burden, be that because of the PCI part or the MTD NAND
> > support, let's remove them.
> >
> > The cm-x300 will for now remain and represent Compulab boards at its
> > best in the PXA department.
> >
> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

I've not been PXA development for a while, so FWIW

Acked-by: Mike Rapoport <rppt@kernel.org>


> Should we take the series through the soc tree? If so, please
> send them to soc@kernel.org if there are no objections;
> or along with other patches you might have in the pull requests.
> 
>       Arnd

-- 
Sincerely yours,
Mike.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
