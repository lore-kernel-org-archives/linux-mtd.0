Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF10C33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6711724656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUm7TTzy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdWJez/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6711724656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p41QkJHPsGZWC8lSN5K2hc57FQvYezV+573lfIK7HwA=; b=VUm7TTzyzQMkDW
	cQZAl6IFXXIAclBH6Lb6FyEnt4YPwSegfys9Z2QtrupF7JhgZbrYejm42ik8lvm8KGDYWvzmyTI8C
	eldalznEBe+DjGqRDy9Hvl36aflmJorWwjH8G0FgyXGim0B1c1Ahh2llndpzRvbMprjI9UJqzqJJi
	dYpsTGD8AFEkBsdXDYsjl7NAPjBvfN3z9i/C0xR5Jbm9JuIEzTGayPiWGWRU8gWh0uYz7DxVoz1PZ
	4AagrarG26pG6xK/g6vfxKjSEzZgnJQUR8vGpPMHZi46Kgw3WJ6hrwRBq5T88inY9qh8B14kxQ3Mj
	M/ui/KTmW8EiIoeHiVNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPii-0006JN-UH; Tue, 14 Jan 2020 17:11:12 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPhC-0003sc-7c
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:09:42 +0000
Received: by mail-lj1-x243.google.com with SMTP id u71so15163344lje.11
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2020 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bv5gJKdnZT6X63j2KLe3y/Rw6sbzysamfEdPUwWvhZ4=;
 b=bdWJez/PvRa7Bg6zk5RTeKB0pnCa3AeQDZvLjVbwSLoN74DDJgtBiG5pyoCsjGyNxz
 6jEk3JVvE6PPkTTN+nKkT9wJDIMY0PTAK4mV5OdksAucCZoPMFM8i2kW4tpWH66UKu8T
 B15IElH5UKt9Uma0UBstyAQdhI6UtLYHnxw4lCewxXZ7HyMqk4NSaF1k1EJyTIUrqMEZ
 /Q5rcEsi5YGm4k3EVOR3Wv0pI1Jpw23igzWH2FmDyyuXAJQYok3c5Q90I4ddECSa0yOc
 asipPQCmV0G2cwm0Fo3QnAc/yX/OlRf/6R4frY4jFli91VCnA2EYsQ6TAKvETVDu8gBH
 YRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bv5gJKdnZT6X63j2KLe3y/Rw6sbzysamfEdPUwWvhZ4=;
 b=hFy9TDDbpzwcdwPArM7rLo9qteJAsHeZKIyEgC8EiGc0SCpb1VZybc9FE8gMcuB3PE
 doGLcYkLl3A0bCqWXv+3gXAQahKAhzqX9hhZc76cW2CRBUPxhcDwv9g4437GUiSAYlfO
 UL7kPpSv1+GPtTK87W3nK5rVkXmPTS7rprTaKh8iRhc+9PSEEklKlZ6llr0XzT27LsxT
 F3vVl6+fSw+qz4y4uAvf7Gt3b3LiuD6rfXMpaSJwp5SvSZPl86nkKChaWD0zAtKud1tv
 M2qmCvuT3UjVvZp93cP3wiBgqm8Bbvy8lCMtXMHyfjcLFHNNFepGX/OirnIVlxUFe0vv
 +cFg==
X-Gm-Message-State: APjAAAVW8i6jKi2z+JujcNXcOT6wq6okGJLpdx3x4a10B/ksmIa5OHF2
 l7vdDGvXgbbhyEdGwzkTYKqnPInbsFM2Q4j1Sl8=
X-Google-Smtp-Source: APXvYqyHJApzuHSB0btmCtN4nkmDgLyk4wPciMEd5bQNTnE7S9mQkS0SoBuYVAvskMVIezD1l2ySxJfzsfgzLy6G7ak=
X-Received: by 2002:a2e:9cca:: with SMTP id g10mr12686433ljj.258.1579021774885; 
 Tue, 14 Jan 2020 09:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20200102130826.170647-1-esben@geanix.com>
 <20200114170354.918-1-miquel.raynal@bootlin.com>
In-Reply-To: <20200114170354.918-1-miquel.raynal@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Jan 2020 14:09:21 -0300
Message-ID: <CAOMZO5BvO+rSqc8pPkzC=dEa1SkokeDNtgK=W87amWsOUODBgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090938_285004_14D613F2 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Esben Haabendal <esben@geanix.com>, sean@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 martin@geanix.com, Han Xu <han.xu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 2:04 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> On Thu, 2020-01-02 at 13:08:25 UTC, Esben Haabendal wrote:
> > On system resume, the gpmi clock must be enabled before accessing gpmi
> > block.  Without this, resume causes something like
> >
> > [  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
> > [  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
> > [  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 returns -110
> > [  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110
> >
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > Acked-by: Han Xu <han.xu@nxp.com>

Shouldn't this one contain a Fixes tag and be backported to stable?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
