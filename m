Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48401C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 14:04:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB12206CA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 14:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GaGl4Fnx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhASimIb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB12206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L5H3BWqjcfjGGjyrY82yDEb1XA/uBOHYkMm4LmbHLRA=; b=GaGl4FnxxQqU4vXtSxAqZYv5O
	dNd+L5VW6wsU5VkENWQMrbSfP5sVMj1+c8+Jo60XuOC2yAiGGam55CODBNmTzHDwD5HRuBekQiUhi
	PjRI9uk/JFHYwu5JLLQAGKNx1FIDOz0AtP5SpRU5xPP8bCxION9yODYDDn63Ne27lekinjk1jvm/L
	+jCZlSAKFKNAGf0/gKHBB+ubF9F86gfEBPZ53Igk9QrMZ2H5zVI5sLp9Cxe2BucwAyCRyjMThWc7T
	nerW5hzpvfRuX8ZFMmLkD4KntG1uIrWFngTOeI0k0au0MyRdbiIvwQfGxmC6Qum3rrbpO2pYAlugP
	0cDRpxPWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieLW-00081W-6H; Fri, 27 Nov 2020 14:03:34 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieLT-000817-Lk
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 14:03:32 +0000
Received: by mail-qt1-x841.google.com with SMTP id l7so3275862qtp.8
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzU+HgRGUqQXDQJgAS2UTA7XggbtzEjD+tyhsnf0+aQ=;
 b=RhASimIb1/iMSsxcBfZih5NOPJy2g4H/V5Y9s2EJzuzUH+McZDpxmuKXz3UoVl2MTO
 tLgphFslaRyyBDPWG+cQSHs0Cmj3CH+bdM+yXyfrQXmRrDB/M33ggAS5UJ4endlPY64y
 aGTVIGjdQpX77YVcYI6dllYr5dRabiTJdipmODx2/SwRXBZGlY1EKOgKLG8ZUj9aKlFL
 MgX1nP/zHcuHxtn6onlq2k4m4lHU0EEoiy55Xnk7VtPvpBMmnyhN5CpnkqJIYNSUvTuh
 w40QpR8mfK0aStuDD2TfNYE2ek7WYbrDKUGI89+p2fngaWEzQhUZ6jCyvF7lJRtswqgT
 xjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzU+HgRGUqQXDQJgAS2UTA7XggbtzEjD+tyhsnf0+aQ=;
 b=VqSrO/G38dya5yP1UhtP4UMxQl3qhXbgR/UxGTOqgK0JBtzYMOF47afbrD45kjNdhl
 P/0OheiJxkKkxp82qPYb9FxfP6sbexyYpu5qCeHl3P9/IoI0JeY+FhtkPN5KLBDw7O7E
 wn+Ljd5WpvNmqOe7kxHWagJUHyZ51PnT+c9rP+u6l1gfeSoFEzOWqIMhO4hC/TcYpHFs
 MB6sNQhLV88Gv2hForJdeyArPvby8aVZnk2Zu9z/0p3YIicjB7ALWunXFUKJ5h0PBI8o
 RKus8XyJ30+HRJiHurEJGGHzDEoxcCkf6DRALjimFJXPjgo7Q5h1BU3g1LyFFpx3CoT3
 0hCA==
X-Gm-Message-State: AOAM530qSIk9E5ZKF3LKexNG9DpMVzU4K6b1DScggHuIv4tVfmT9rq90
 u4TsLQsgllClFzOBEFo96sKhq7LkbIQ/CE6F6Zc=
X-Google-Smtp-Source: ABdhPJzW3ZanoGjw4GpRVm3BU1qQOqy9mwVj1cThDA/oP1wzPB3X0wGRXb5Nxwach/Gw40S8iL3DBxmCeR3kEnjLrlI=
X-Received: by 2002:ac8:6c49:: with SMTP id z9mr8315767qtu.82.1606485809942;
 Fri, 27 Nov 2020 06:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20201127000708.2894-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20201127000708.2894-1-chris.packham@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 27 Nov 2020 15:03:18 +0100
Message-ID: <CAFLxGvz3CXJTdSRFRW9B5OX_KFsX-kEwxRa3fQmWvv8M3RZf-w@mail.gmail.com>
Subject: Re: [PATCH v2] libmtd: avoid divide by zero
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_090331_724791_F3941D60 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 27, 2020 at 1:16 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> The concept of erase blocks doesn't apply to mtd-ram devices. Such
> devices set MTD_NO_ERASE to indicate this and some report 0 for the
> erase block size. Avoid a divide by zero when calculating the erase
> block count for such devices.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
