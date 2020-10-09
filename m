Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A2C433E7
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 13:56:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A5B222B9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 13:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ol87f/aC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hX9UyplG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A5B222B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cRtDWcDcC8Wr3rg6VpzPEqLVmYhVhHq0j8lKQVApr8E=; b=Ol87f/aCD9F7oWTJUL/FmIo0T
	DU3MuC44U4BKq6KfJkCWqk/gUQguJKanebBFX/8SoY1cZt+bTLZSc3INYkzmFiLaKt4KRM0LuOVYI
	9M+yfcDV/PQHcGs0YuTqDC7CQc8/1OBkZetXG5sJo0jK9+IC0SvsCuLvftscmbMoYtxB6uh234R0b
	MudyVfj5obSvktZt5bY/2pSfkI1zE0Vf1BZxjrLV5YD6s+hbfiP3uRDbFjP5W9S5MBmxkQOcaqMK1
	YJSEhDxTo0nYKMy5ZLgVbZXUaJ2lrMcPIgjIXZ7m/qay+NLy8TL8/rF1qldeJzb+2Jo6GW4821FlR
	zzMM6zYnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQsrZ-00069E-Aj; Fri, 09 Oct 2020 13:55:13 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQsrX-00067y-10
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2020 13:55:11 +0000
Received: by mail-il1-x12f.google.com with SMTP id j13so5307392ilc.4
 for <linux-mtd@lists.infradead.org>; Fri, 09 Oct 2020 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2S3D9iYx51A87Z/QbgZ/692gZHGuP26oR+0wJ2UbLg8=;
 b=hX9UyplGhpPB5uZa13A2uK91raJ+XXjUWlWCULGthc4S0OtZCfMyA1Sc9MTHzTbgC4
 msSG67tcHwpsaaHcIcBIxD//0F918iRlSssC5PR4njAqbOOYLyKqyC5a8bmRJ+42fVIX
 m5szy0Q1jAgH4+eL9obnuOTNuNffxCrmelyiwXC67CEvoRL3Yl5tuCyUnJ8SRVUT/wwd
 h1sLQ8miFedqdQqlUJXnL3yQoAhnGJv523s7udQLzJJ8AiSS3EpjHJGGcxtnuYqvMEPB
 GokfmAsUWyD3jFdgVaVDlBKgdFPczycyRd6zaGtUR6Beyb3OEx622w4pKxPRyQvqURMf
 1iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2S3D9iYx51A87Z/QbgZ/692gZHGuP26oR+0wJ2UbLg8=;
 b=U0U+xTmb7kUzxcJOUyhW+WasQ22gHKPeTX4Q7epsor8lwvSOD3icxpI4MS/RarcHLA
 gIAwzGZFCLM5MPY0aVHmKKRQegWIpaVCqCBRXKYjnAKYl+qF72v7ghvRW6AekPaQYIiM
 i050n95e0IuQVD4GkCjPTQn2+j5R3Eo73GGNeM8Hz6XFvZX1/oNmzgoj75DdlKt+3il4
 6iz0zFNfG4o6jxBQ/6ISf2xZM7fyhm4fvtb2jCkoRuy8hy4S+VdMgF9CmgWdLsCRrYuk
 KMdS1ZcHB0bkJmMYGazUR9xjtjalh5BP5QFVWQRhIcgzQRAAj80+g9rD66SiwsbbdOzE
 cZhA==
X-Gm-Message-State: AOAM533xRk1Pcq62pzUBJlJa6Y9Rtq7TX28D5FBEvrV6WywG7BmCuws2
 /dRLhJ8YijtavyJvi88iGSkmoqT2wnMisxERG1tdQA==
X-Google-Smtp-Source: ABdhPJwJSrz7eUwTvUf7DlETg6YMldEBYzcCV0k+8KYceSzIWftZL4GSM73AlaH1smsxWJNOo4qH2nJDd79/yrPumYg=
X-Received: by 2002:a05:6e02:664:: with SMTP id
 l4mr11028746ilt.81.1602251705277; 
 Fri, 09 Oct 2020 06:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
 <20200924090349.GF27174@8bytes.org>
 <ecf71b34-a104-d42a-bfcd-9570e73520a7@arm.com>
 <20200924092546.GJ27174@8bytes.org>
 <e2186418-d4d6-e1f4-5eb4-3bfafb5cebb2@arm.com>
 <20200924095629.GL27174@8bytes.org>
In-Reply-To: <20200924095629.GL27174@8bytes.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 9 Oct 2020 19:24:54 +0530
Message-ID: <CA+G9fYu42j_B+Rg2nq+KKBiKLqxVEqabQ15CujyJ+o6jqRj2uQ@mail.gmail.com>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
To: Joerg Roedel <joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_095511_098409_27461C3E 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Poonam Aggrwal <poonam.aggrwal@nxp.com>, Rob Herring <robh@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, "Z.Q. Hou" <Zhiqiang.Hou@nxp.com>,
 Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Suram Suram <suram@nxp.com>, masonccyang@mxic.com.tw,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 at 15:26, Joerg Roedel <joro@8bytes.org> wrote:
>
> On Thu, Sep 24, 2020 at 10:36:47AM +0100, Robin Murphy wrote:
> > Yes, the issue was introduced by one of the changes in "dma-mapping:
> > introduce DMA range map, supplanting dma_pfn_offset", so it only existed in
> > the dma-mapping/for-next branch anyway.

FYI,
The reported problem still exists
>
> Okay, alright then.
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
