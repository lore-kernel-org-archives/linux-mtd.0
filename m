Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD8AC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:42:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564D364DAF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564D364DAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5TBm3uaBpqVT5630MMcHwrV0TpyBvZCVgG+lRkBjjN8=; b=yaLW4clYsfdV0qAgu47OxmcLs
	1Z242X0lRFp+gxs1bcwjR3icwnTa/YSnJBukPSrg2BrRQhvt12PP9HVHYxAZi9vGjuv9Jk1fdSCwd
	lqTUBei6QZubFpnXsKV8fAb+GFI8Bz0xB3RLpe1glxXbPyw3rhSqnMz/1lDp55UZPHOpryujtMb1I
	rlaj2Lfrl2Q73puVofvnjvOIEO9uWzlUl+sU9dpnfjs0pprzxJT9j1Aisee9WBEo0nWIePvK6lXkY
	/RtEe0JWYKIU8Vdt3v4jVO4MfJa7R6gBm0ZOh8krSb5CdYAXcTg4uahDy8Gqs2HBeqcsihEIamXnL
	BkvibbngA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBxnJ-0001Mz-Ht; Tue, 16 Feb 2021 10:41:25 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBxnG-0001MC-LQ
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 10:41:23 +0000
Received: by mail-io1-xd33.google.com with SMTP id i8so5353649iog.7
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05RYO12/a9zPYJjSrtc1UHz23InfA73T3rwzSCaT6oA=;
 b=uNdB3xrOtYB9sFVRLxpSeL0mFZBL4ld13IQXkXVU7VbDVaM3BmNqZ+TEmsI78e7NV7
 estweOJMtfmHIsUrYFiendLscThidTV5bF3ppj2KLfzH+uz38f9sXAvfEXkS80eBeVSH
 0ii9wtRdUTjcLPLYNhjCmC4yM/znpnEUWWcdMEW8/zpwNMq+7G7oz7wZwOYfm2fkV00J
 S9ISSjfQUTM3Rvv+9wmJyGLIeCK2td+DoWHcN0svFb29xTLL+0W204P9TciI338pCjNS
 iInba/NfiHc+3wZMksxTg/dKVzPhxb3Z6qOgt9l3oCMj6ry0tqdQ4PSeyh0Dl5I24GTk
 OsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05RYO12/a9zPYJjSrtc1UHz23InfA73T3rwzSCaT6oA=;
 b=PBKRh1DbphKaeJ6GSJhHU+ja+980x1wzWUalizDnSkbxV3TE8dlnvao0pD3TZ9YjYv
 dHmtoO3GGo86DJ5eLIbP8LbT3KksLlbYI8oI8/dKFrqz7McA8XIjG96X+lBGVCiBMmGf
 8vC6mKl4iNFxolCvf5KUO0EjVbSnKCzrT/bKtRimbWZ+Qhl+v+k/hE5H7L1zt25as+Vb
 DQ3S3GB4m5Qo8YhSdQ+HnjJlqQhn1UZGke8Ueu5ZtdyRLXgJ52x2yGTGZcNj0NrFDXnV
 UQHo0GIKoIqKIf1GwKUx5umw6KyhjhlPDN7R5Rz++Q43ZRLqFlapdQ/iN372OavaI2QR
 FTjA==
X-Gm-Message-State: AOAM531wf34s8Lk2ETaPk154p7RzkHrbcss0+xosFPYk/S3VwBiFsoJs
 VnS2VQAkov/oKQ6x9YDk7HHxAL/FQT3ysKU1AZ5RRrxiznk=
X-Google-Smtp-Source: ABdhPJz3wlHkDM6zDoJw1tzP0QRT7FdS+DvvTmBPpy2hyY3fKWYfmWR+oKfiYvezxfpnmKb0eK10hjsYxOqH0KxOJ6g=
X-Received: by 2002:a6b:8e57:: with SMTP id q84mr16398085iod.73.1613472079663; 
 Tue, 16 Feb 2021 02:41:19 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <20210216101603.s22b2fs7en52ximf@ti.com>
 <20210216102029.uz3u6dzl2eoh5c7x@ti.com>
In-Reply-To: <20210216102029.uz3u6dzl2eoh5c7x@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Feb 2021 11:41:08 +0100
Message-ID: <CAEyMn7YZ353TxcwF=N8Z8piiq=Us2=r-MNphsnEKuJs_8SJUBA@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_054122_748535_883AAAF8 
X-CRM114-Status: GOOD (  26.20  )
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
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am Di., 16. Feb. 2021 um 11:20 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
>
> On 16/02/21 03:46PM, Pratyush Yadav wrote:
> > On 16/02/21 10:48AM, Michael Walle wrote:
> > > Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> > > > On 15/02/21 10:53PM, Heiko Thiery wrote:
> > > > > Hi all,
> > > > >
> > > > > I faced an issue with a SPI flash on our board. We use a macronix
> > > > > MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> > > > > the MX25L12805D [2].
> > > > >
> > > > > The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> > > > > while the older doesn't.
> > > > >
> > > > > I thought that I could do a fixup with a device specific
> > > > > post_bfpt_fixups() call but by now this seems not possible. The older
> > > > > MX25L12805D has no flags set that allows a call to
> > > > > spi_nor_sfdp_init_params() and implements the fixup.
> > > > >
> > > > > Has anyone an idea how to solve this?
> > > >
> > > > The post_sfdp fixup is always run regardless of whether the flash has
> > > > SFDP or not. You can try putting your flash-specific fixups there.
> > >
> > > Well the problem here is, that the SFDP setup is skipped though the
> > > flash would support SFDP. If the jedec id wasn't already in the table,
> > > there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> > > parsed. But because there is already the legacy device (which likely
> > > doesn't support SFDP) it really doesn't fit.
> >
> > Is it possible to differentiate between the two flashes in any way? If
> > so you can use the init_params() fixup to check that add the flags for
> > the new flash. Modifying nor->info feels kind of wrong but it is an
> > acceptable compromise in this situation IMO.
>
> I take that back. nor->info is declared as const and let's keep it that
> way. Maybe you can add something in nor->flags to indicate we want to
> parse SFDP? Or maybe there is some other way to indicate SFDP support?

That was also my intention. I thought about something like
SPI_NOR_FORCE_SFDP. But what will happen if we try to parse and the
legacy device does not support SFDP read?

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
