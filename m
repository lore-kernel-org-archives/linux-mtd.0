Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE19C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B45B61028
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 17:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B45B61028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+DBkpRNQkJ1T1oGmErEiC35BLcrHZRxRoF6djzoo+U=; b=2p4FGyUF6LMeId
	GVVZmd/KhTpOsG4beQG2Upf5TEon7pKjWAN2zQBnZJOANbdjTu5HyPc8TeaXDXmhgdB9xeSXGjeeq
	T13ij3o1tllNNkieU4DwP3vctSEiLcc3veKI/M75UoQjhHjY8E+HcyPBViVaFwKpYDIG91dkdCcXb
	IPNyLpx5OSmtrN9viJAMThZNfFmqPPeVyy41T3YMtufdnSPgHs7YGgaQYwdyLpI6y6Dfj3Qln1GPz
	olEyAqAu+9U3KVi0OeLJZ0fCXWR+Q8ztjEC3OrvBgO83i1r4PoB+4dtPvG12i7qGlpQijI6GAfcGp
	lDOr2ruM63rndPuke80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmJPY-007toc-Lq; Thu, 27 May 2021 17:03:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmICE-007KGn-N3
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 15:45:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so748207wmh.4
 for <linux-mtd@lists.infradead.org>; Thu, 27 May 2021 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EqB3YzXc6NucoBaGbpaC1BiOPCwAoJHin9yTSAd+PX8=;
 b=mCBrOwkzREeq3KXF/XyWX3gq5mP+iuLJYIR6+a4vicZTgS7pwklbtuviUUdtJXctIR
 LU+I/gXxJSyohhQWJhITbcw1VcgK8JZ/0SmIkXd7Dpnn02kfaB3aW60GRnwukanjimUr
 rnoHD8kgffXUw9XPiq+yGG74Ov3JEDgOddFcLJ+kFZsxh4AbNnAV9nuMGUcpeRgDduj6
 to8rJAX7D19L9P9UpI2fp40SwuAebzIwEZGkxdsIy3f6Y4fJaHXQDbjknzel92/oVAQJ
 FpX7kqPnmySSW3S6edX+19Bf+HMlmmSBGAvxEdiXFDQUdIrDfrHpPX2mvVU7JjTaVQfo
 aC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EqB3YzXc6NucoBaGbpaC1BiOPCwAoJHin9yTSAd+PX8=;
 b=ARTJiSBGxRtGdOOsRNAFeeTtZfsv3Xr8q9h22xStP2N7tWCkI35anTbTtHdEeh+C1H
 XB+hCCNffcUl6cxvK42R+56MvzJq4/kEHtexGGclqtMBeYdqjEV3H+qWwXy33f/6kUpt
 iEvcfAFSSRuHz8y2Uzt+k8/hD6yxA+nOh6te+OJ13macXJnUYI04CUu+K3DzNjip3qK1
 +L7kr5N3OpmxJuez20ozhh/RqF444r1sDNFbTqbJUfLNfVkz3vEF58CTN2+qNl8fEO/2
 sq6ZG+sLzFHI9sOYz3G/z+0WQWCNtSBUY0YJQeJ3D5az8FVcG/4F9u/yqkt/COOkw1fY
 69TA==
X-Gm-Message-State: AOAM533sbIwRwFqxMFG7RGexUeqB+XZ0aB2WjZMNODsWROFPAwc1NDBe
 vEUndK0IWJh724LDW7H3TSXPMQ==
X-Google-Smtp-Source: ABdhPJwvE2UbFePXyarYXLaWMVK+xb89KVNNSB74DjxmigzJBh0bH3A/Kpd82bIFnesv6XiUdT8pmg==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr9354498wmg.24.1622130315599;
 Thu, 27 May 2021 08:45:15 -0700 (PDT)
Received: from ntb.petris.klfree.czf (snat2.klfree.cz. [81.201.48.25])
 by smtp.gmail.com with ESMTPSA id v3sm3948131wrr.19.2021.05.27.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 08:45:14 -0700 (PDT)
Date: Thu, 27 May 2021 17:45:08 +0200
From: Petr Malat <oss@malat.biz>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using
 SFDP
Message-ID: <20210527151702.GA4807@ntb.petris.klfree.czf>
References: <20210520160701.28176-1-oss@malat.biz>
 <20210521095503.qw3aivg4zklupwcj@ti.com>
 <20210521115350.GA7908@ntb.petris.klfree.czf>
 <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64dd1df6-0ace-702b-f205-a7c7d4d12697@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_084518_869749_2C3A4DA8 
X-CRM114-Status: GOOD (  29.50  )
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

On Thu, May 27, 2021 at 07:22:19PM +0530, Vignesh Raghavendra wrote:
> >>> This change allows adding a support for flashes with correct SFDP
> >>> without recompilation of the kernel by setting sfdp-compatible property
> >>> in their node. Alternatively, sfdp_compatible module option can be used
> >>> to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
> >>> be used to match all JEDEC IDs.
> >>
> >> I have skimmed through the patch. Before I look at it more closely, I 
> >> want to understand the use case for this patch. Why would you not want 
> >> to recompile the kernel when adding support for new hardware? Do you 
> >> want the ability to support flashes on devices that have already been 
> >> deployed in the field? Is it something that comes up frequently?
> > In my case the kernel is loaded from a USB mass storage device, which
> > can be preproduced and on stock (with the kernel already on it). With
> > my patch I can change the flash vendor without the need of updating
> > the image on already existing USB mass storage devices.
> > 
> > The patch is also useful for people who use distribution kernel as they
> > will not have to wait until (and if) the distribution updates it.
> 
> Don't need separate DT property or cmdline argument. There is no way to
> know if the SFDP tables are 100% valid when kernel is working with a
> "generic flash".
> Flashes are often replaced with newer revisions of the part that may/may
> not have valid SFDP tables.
> 
> So just rely on SFDP, when no valid entry is found in the manufacturer's
> flash_info[] while printing out a warning to user that this is just best
> effort support.

OK, I will rework it to fallback to SFDP by default. I put the safeguard
there to avoid a case when one has a flash requiring workarounds and then
does a kernel downgrade to a release where the flash is not known and uses
it. Should I make an opposite flag sfdp-incompatible or do we consider this
a theoretical scenario not worth of addressing in the code?
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
