Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0BEC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCF864DDA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCF864DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e9nnvCe7O5ahAwplyNRN1Bcv4ky78WxbfBzKFInEm7I=; b=Sdyz6gzJ2+WZn4skSuAnvbeNV
	cUg17gDnqr4hnUL7aSElOSTOf/1G9JRNLLGgRZQMWbnPidKHWtQhNPx9c/XPUTHYzYgxoynd+/AyM
	SRxSVj4DEEY6TDSJyyvE8pliasws7FY2JSQM/zLwwmiIzEroLCVdtQHFNJxkTJqwkn/6FHEwO5Sjp
	GfeIyrAZTqLJvPn8eq+DdVpiuwDEp0fj4GKzXj0SCXe/oGBA99pz4yqPi7XoG3IiJgs6HA2OOTxRb
	4LjS+bMKTLhquvIR4OOexHRYVxMcuI1WEuNmzxCBU5IBL2Q4oMSNeQXwsqe6uyQsnsQdXVXSEKhfJ
	9IYIiPoxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBy0n-0002jJ-JV; Tue, 16 Feb 2021 10:55:21 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBy0l-0002iO-33
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 10:55:20 +0000
Received: by mail-il1-x12b.google.com with SMTP id o7so7928899ils.2
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 02:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zGw6Yx+j2GHzuTNEHHGotUWpnReV7wjOuSQc/R80Wfk=;
 b=Fb4ngDbEMAfUPs5SX6V9A/RXQ15h4dImb1YKCpeQJHpphSBumvYHmVQLDQT6ce4IPA
 W6qW4w/t9iOQkpZsCW/D4qSOXfWgdadFpgxZt+1vbRIRgEP07I++bbEmd2xDdYaDIL1l
 Q8R6m5t3ITJBfVJiHkyUNdeGSIPNs5sex7A9h77vHJXHLL1voB2rKGsnKmrfzQEwgX19
 LZlZ8ej3OkOZdz3Bw3IXjv1ukv9sqgmf5Su1G2zoXOI9hoSL9WuL8opR0TUetzoTtnvq
 Wp5DxqNmHrbrX5k2CJiHoMK6Pz+e1T9nwodf4LHBXMwCMmVuG/GccBqDRPFMsy4jCqCT
 lMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zGw6Yx+j2GHzuTNEHHGotUWpnReV7wjOuSQc/R80Wfk=;
 b=ZDKNld7BY3wkXAcNE1CgQQzNbgb2WtHL+1YY8SwL+azPOhMwIuKpZ93ZdzdgfcK0qF
 BT1SLrSCwulun87q91isXix2yo3DOgPy4N88bZ/QXzM3+Kg+8FW+6FPG0F/yED6hGVay
 o5z2bxikv+ri8gIniCU19dijJ+h5cDXrs4LSTbxqoydskqgqJsAksyudCYCzj8wONM82
 t9lD0vzJt+UYeK3HzzZe2xFuWXMl1BTwWtkGxXyxQuR4EmTlcYz2YotdMkvKekk0WYnW
 b7KjG2PYLhycHq3ffWV6Rt6eIpQ1K/PiaDWKWDjdiGh6wjox3d8If/MFV7ZOPRriZ/k9
 uOIQ==
X-Gm-Message-State: AOAM533k5RBRfTkM1XeNCmAGkZncFuv/Qo0AOhYb7sFeqlgtJc0/tRZC
 WMM3fgG6oZDVBwdtDrGxGXjWh3BB1Bd7T2TiORNSTOfI7DM=
X-Google-Smtp-Source: ABdhPJxLNs5MnsSoVvpA6CRaXi5IJQIyPmyIx45Sxh+LR3UCkavvCrcAgkRSDljneux/lbw0KHJw38K4tJUesDzoaEs=
X-Received: by 2002:a05:6e02:48d:: with SMTP id
 b13mr6494041ils.98.1613472917159; 
 Tue, 16 Feb 2021 02:55:17 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <20210216101603.s22b2fs7en52ximf@ti.com>
 <20210216102029.uz3u6dzl2eoh5c7x@ti.com>
 <CAEyMn7YZ353TxcwF=N8Z8piiq=Us2=r-MNphsnEKuJs_8SJUBA@mail.gmail.com>
 <20210216104838.ntzwot5dqszwriwn@ti.com>
In-Reply-To: <20210216104838.ntzwot5dqszwriwn@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Feb 2021 11:55:06 +0100
Message-ID: <CAEyMn7bBLTMWbgHH9a-TZCA7Pe6-uiffMowHsv2Q6jxsVJ_now@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_055519_200050_2F3721F4 
X-CRM114-Status: GOOD (  30.55  )
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

Am Di., 16. Feb. 2021 um 11:48 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
>
> On 16/02/21 11:41AM, Heiko Thiery wrote:
> > Hi,
> >
> > Am Di., 16. Feb. 2021 um 11:20 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
> > >
> > > On 16/02/21 03:46PM, Pratyush Yadav wrote:
> > > > On 16/02/21 10:48AM, Michael Walle wrote:
> > > > > Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> > > > > > On 15/02/21 10:53PM, Heiko Thiery wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > I faced an issue with a SPI flash on our board. We use a macronix
> > > > > > > MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> > > > > > > the MX25L12805D [2].
> > > > > > >
> > > > > > > The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> > > > > > > while the older doesn't.
> > > > > > >
> > > > > > > I thought that I could do a fixup with a device specific
> > > > > > > post_bfpt_fixups() call but by now this seems not possible. The older
> > > > > > > MX25L12805D has no flags set that allows a call to
> > > > > > > spi_nor_sfdp_init_params() and implements the fixup.
> > > > > > >
> > > > > > > Has anyone an idea how to solve this?
> > > > > >
> > > > > > The post_sfdp fixup is always run regardless of whether the flash has
> > > > > > SFDP or not. You can try putting your flash-specific fixups there.
> > > > >
> > > > > Well the problem here is, that the SFDP setup is skipped though the
> > > > > flash would support SFDP. If the jedec id wasn't already in the table,
> > > > > there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> > > > > parsed. But because there is already the legacy device (which likely
> > > > > doesn't support SFDP) it really doesn't fit.
> > > >
> > > > Is it possible to differentiate between the two flashes in any way? If
> > > > so you can use the init_params() fixup to check that add the flags for
> > > > the new flash. Modifying nor->info feels kind of wrong but it is an
> > > > acceptable compromise in this situation IMO.
> > >
> > > I take that back. nor->info is declared as const and let's keep it that
> > > way. Maybe you can add something in nor->flags to indicate we want to
> > > parse SFDP? Or maybe there is some other way to indicate SFDP support?
> >
> > That was also my intention. I thought about something like
> > SPI_NOR_FORCE_SFDP. But what will happen if we try to parse and the
> > legacy device does not support SFDP read?
>
> Most likely it will not do anything and SFDP parsing will fail because
> it can't find the SFDP signature. But let's try to avoid that if
> possible. Is it possible to differentiate between the two flashes in any
> way? If it is possible, then just set the flag for the new device and
> leave the legacy device alone.

Is there a good reason not to do the SFDP parsing in general? At the
moment I have no other idea how to differentiate the two flashes.

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
