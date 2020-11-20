Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026F9C2D0E4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 19:32:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A9C22240
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 19:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZVMhsGU1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GgFl3K9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A9C22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lOVyPCLsIQ2nsK2HslYzFeOUwQW88gOFvk9B2ZAjoAc=; b=ZVMhsGU1KIGnItpWLE/N2XOgm
	Dm+x+cHG+agz2sT264MF5eFHOr064Lb8YrjI6Rxn9A0bBj4Yc1b3yIil10LTpACA8VHG1R8i4EU8U
	+plDxbjHGATLgGrZTmzQStWAtSVH3c784bcAzeVZqYInGEpIblZEBw5IpV68mQqs3Ohd6oUX9b+5d
	J00358N29NinLnO2al8mFitTvjwe7CPsAMFXiaivK3ud9qRdaiT1K5201dytdomw82rIbat68O9Io
	2WQfpxussmeTHTFGDolRtzauY8iZ8Twl05xgK8QEGjgnulfcA7AekjJ3mcOrANXq3DtmO0axOMAzV
	Qc2tOHB4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgC7S-0004um-8c; Fri, 20 Nov 2020 19:30:54 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgC7L-0004ps-0b
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 19:30:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id a18so8832048pfl.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2020 11:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3bv50j9tOMZCSWAChUvUk5K6TgooTRt3SRcQZBJ9fcA=;
 b=GgFl3K9IS/lWsdMjkEVVAtTSDzsQ0sxEOabPKwuHzNJyTA7s1nVN/P5Py+wtAIOvbE
 i43RryzoLL4QMDFVI6bDxTe0ngekUN0rycJ/u5dixn0o4ZWxiMdHtnF6M1zgV7bxdmjG
 OxnZTS8PQwcd6ZCwnahaxVB8GYQEw6f4nxFx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3bv50j9tOMZCSWAChUvUk5K6TgooTRt3SRcQZBJ9fcA=;
 b=G0I/aoM2oIYUjQ5uBJKtVjG/CQO4ywByJLTNtWySQPIKk1twn65z+0mYa0bLKDYfr6
 j38ZwuCjwc3KMxJu5255AL03zH6cTI0q2MUmb2geSA+XALDouoxHzSnBs1hU2CAmI/6H
 6xg2bseRmP8DsfuJwEsNwjcCg4CMFGSVs8CZAzurjmgtNVZBWekKj3BuqzaHHoShD7o9
 himt1TFTh4SUbGpesGAo5jEELqVI8rKW3hof0BPLe75neHM9OzLcuNBEm+rFzUbSHPmT
 t8XHIFqGO8KnUTYsCNAnpikMsGpR/EzyfctGKURDXdrpd11pyI91yRRGmU4BErt50g+x
 vtyg==
X-Gm-Message-State: AOAM533if+tR25kaY6E2rrcwFogs937KfAnlRnMSIWLaGU+uZp756tx+
 jxvK673XusEL714HvKcL6qCULQ==
X-Google-Smtp-Source: ABdhPJwl3VgOHP/MWhG5DtpaEL0Yyt6dBbRzpe/94BRgWnGkgcq6AJ5JXkZmDK0TJqDkyAhq9Y3Q+Q==
X-Received: by 2002:a63:5043:: with SMTP id q3mr17907345pgl.137.1605900643099; 
 Fri, 20 Nov 2020 11:30:43 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d10sm4785681pjj.38.2020.11.20.11.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 11:30:41 -0800 (PST)
Date: Fri, 20 Nov 2020 11:30:40 -0800
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <202011201129.B13FDB3C@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_143047_212640_0F78B41E 
X-CRM114-Status: GOOD (  19.88  )
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
 target-devel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:
> > This series aims to fix almost all remaining fall-through warnings in
> > order to enable -Wimplicit-fallthrough for Clang.
> > 
> > In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> > add multiple break/goto/return/fallthrough statements instead of just
> > letting the code fall through to the next case.
> > 
> > Notice that in order to enable -Wimplicit-fallthrough for Clang, this
> > change[1] is meant to be reverted at some point. So, this patch helps
> > to move in that direction.
> > 
> > Something important to mention is that there is currently a discrepancy
> > between GCC and Clang when dealing with switch fall-through to empty case
> > statements or to cases that only contain a break/continue/return
> > statement[2][3][4].
> 
> Are we sure we want to make this change? Was it discussed before?
> 
> Are there any bugs Clangs puritanical definition of fallthrough helped
> find?
> 
> IMVHO compiler warnings are supposed to warn about issues that could
> be bugs. Falling through to default: break; can hardly be a bug?!

It's certainly a place where the intent is not always clear. I think
this makes all the cases unambiguous, and doesn't impact the machine
code, since the compiler will happily optimize away any behavioral
redundancy.


-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
