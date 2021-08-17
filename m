Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2EAC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B9660FDA
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 16:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89B9660FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8Dmt9PBByXKRMjOLp1wQIXjDqChMDBf3/MJf5zj280=; b=pz3lZ4J69OTYXP
	rdHhOGZE1GMZyS7KcBQXryXTLXcJhffME/rvtYYdzxmTpn7yCHSgwk6AS0oBekkoc3HC+5Av/8EFN
	QoBQTkfQaEJM3miG3OcMkBPk57/uMVvrgDrFLwRrUfaNUU9vd+kO8/ZDveIr5AGzPq7bLwfdUFgDT
	x4iYbqkOArflU+2i5GSvlfHoQ835pV+mDfNAUVNdcYF/XnlRk7XGC/469/2OfdognsT7zY+XLBMJT
	Yj1b0ZEYHKwXIxcahoeV2GWILbkFWGFtptbprfZL0yDKxOOnD0n2bIOIjMTIY/uZ/ERtzSK3KyGAd
	aqJExlhelERx+6jChfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG1wh-002xcD-KG; Tue, 17 Aug 2021 16:28:11 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG1wd-002xaq-Uh
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 16:28:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id q3so28247193edt.5
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Uq2l7hqjwwkcGAhoOcZ4h9vCm3YfoxhlGasvmZN7Js=;
 b=ZbU+xCvxYpLIMcprfxhfUI2Aoe/CInM6n8lkNHDrCfJX5vOVSaLyYuchnTqq9w3rEv
 tFedeq/mDoXHBDMOKB4411WB8I0ceFucimNy8CMxXlWKdm1z2jJTotB7DbgjdXTD9O+G
 l+r82FTekchZ/IV+tTUdxZuBBQxfRWsUsjl4M66sWulNA7d1YP+t0ppHhb/n0H8dLxu9
 yg4V7ulG3GuOXu6OJVWIuFdXN9gU2Ez7AMzFa2eMkg3RUE7g1RabsEvtWjmyx0Bo1T2s
 3P7frCKt0Ff4n8qMjBCmkCN8OE9uDpubstLkO/wADGVD1xOk+T9HojeBxMvBvPQ9IeZ/
 PaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Uq2l7hqjwwkcGAhoOcZ4h9vCm3YfoxhlGasvmZN7Js=;
 b=Jb5AkDLngIlUc0uTC0+7O6DggV/2XnCxxtqpzKe5imDsRHTipvHmYhlV97uKDvfMnr
 8uut3uhIxFMyxKyYuXOUdPfbh5LQ9H+IPlPwClGdkZdOY690t4RYGkK9iMfE2ShABQCq
 3h7MJedy5JNEIeAIac27u1dBBvMgX9n4d+4qSmiceVJJhpr6Oa/2RF+fetKcNn5l+ZdU
 r5UzdzlNUa7tMwt1NTY8IU+OTo2bpa4FzIbbcI1pBVuO8f8588P4qYKQ6Iwl0dON4Yh2
 5j8sclm5Oj/9nBfqAIM71uk2Qy4zpASavjrV2qHQO7kpOtUyGfigp4SJvfrueXkIR0jD
 qNqA==
X-Gm-Message-State: AOAM530sv5THAQpakLukPtmyr2Ria/Io3CzIpZCPDPt9eKBwG2cJVseF
 AFc5k/LwUzAwi4mUgYkgWDXyF+wvB41QX7wznDdiYcrZr7ebNQ==
X-Google-Smtp-Source: ABdhPJyjAicBj+Zkhl9MPlRn/9cal3SriOfxu/ZVcX7jZc7v1JYp6W+gP3bVaSV0iEWah9ngtzNCpXdJcymqWK2FgAM=
X-Received: by 2002:a05:6402:70a:: with SMTP id
 w10mr4991545edx.213.1629217685800; 
 Tue, 17 Aug 2021 09:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210801234509.18774-8-ezequiel@collabora.com>
 <20210806200537.394260-1-miquel.raynal@bootlin.com>
In-Reply-To: <20210806200537.394260-1-miquel.raynal@bootlin.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Aug 2021 13:27:54 -0300
Message-ID: <CAAEAJfDqEu0XtZ_FvVUM31p5PumPmK0x-r8sFWXzENDqf5zj_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtdblock: Warn if the added for a NAND device
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_092808_152252_FE851C8E 
X-CRM114-Status: GOOD (  17.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Bonjour Miquel,

On Fri, 6 Aug 2021 at 17:05, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> On Sun, 2021-08-01 at 23:45:09 UTC, Ezequiel Garcia wrote:
> > There is a surprisingly large number of tutorials
> > that suggest using mtdblock to mount SquashFS filesystems
> > on flash devices, including NAND devices.
> >
> > This approach is suboptimal than using UBI. If the flash device
> > is NAND, this is specially true, due to wear leveling, bit-flips and
> > badblocks. In this case UBI is strongly preferred, so be nice to users
> > and print a warning suggesting to consider UBI block, if mtdblock
> > is added for a NAND device.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.
>

Any chance you respin this one?

It appears somehow this made its way to the patch:
"Untracked files not listed" sorry about that -- could you remove it?

While there, you can fix the typo in the commit title:
"mtdblock: Warn if the added for a NAND device" -> "mtdblock: Warn if
added for a NAND device"

Thanks a lot,
Ezequiel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
