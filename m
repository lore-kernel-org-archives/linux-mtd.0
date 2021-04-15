Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD24EC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:15:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C59610CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 19:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C59610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yAczoRbvIOotwWrqFhKCXYutfun1n9+qX+Pevnqde14=; b=gqnVnq64z0iWoCu8SUY4ub1CY
	eMEqLwD3K4nD9DGU96zCJw8UrR+ieT2nYDriz2ZUtvEv7kVGRgA2k4zjdjPkv9e0AlhnNQBPHKRBZ
	67VoVcIymR2mhO/1Zx4G/O6VHRooTdxKLpJk2osBInswrL1nR5iVZGxLuc0wfcE92HZESb2PNsFi7
	jU0Yq2B5WNny8E+IsaceRNbwvJk0dL+fWfsz6BKgsQoU2fppJr6tpoFqIEf+kQxuq167EJ/R5aAfr
	KGQ2SOsW/SZqJ8BkbtpbvvFvwFs3tyDLzlcnAzLConLp1IiH8GwyZGNtiGIz9ErtK2R/9uHt1+Swt
	paCF01dmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX7R5-00H5gz-5b; Thu, 15 Apr 2021 19:13:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7Qt-00H5fR-E3
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 19:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cyVMhza7QHyz2otLIKmAiJdFbZ/RATa3Op0jBBlYAqY=; b=jYxyAWRKzmqTeFYqCzC+O3SUG9
 Rd5yOFqKomVD7EweV0DOjyVeeDrjYtHbacZk932rG9BorRUwTENaNgDgdrvSGuntIE287cZSq1fIG
 21wdCwQ5LWKg+DitAv9IGtCZYeQ6IFCy2VdUgFuoyUbPo/HR00zJsqk5rYXGeW1Y0v9MP1lrcsj3H
 ukl7mFv7aRu5ru3FwyVDgy7zrgPIXpo/oyDhFQP33G3Sv4vO+JmLbBwt/Swg5Q66ewXeeBicWEqh1
 WOjYVWzNrWLKPzgy1FcJrqlrkjn1JNuKIXMRm9lF/kJIhT1XTteUdtuSRK1UYvZvivywjCpfHccZZ
 2WJ5YnZA==;
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX7Qq-008pzI-RZ
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 19:13:42 +0000
Received: by mail-qt1-x82e.google.com with SMTP id t11so10471785qtr.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2021 12:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cyVMhza7QHyz2otLIKmAiJdFbZ/RATa3Op0jBBlYAqY=;
 b=kTia0ZHpyWR+hfRw6/MGA2XmR1/bo/RXFMNGyUPrVvlRrzAn9kOxhOKfgfYolZ7bTN
 oKVLgbHrhYCU1244KvJXl/SJ3dy3Mx1IBdIZPLz954zYh7TKL6crDP1T9Khf8ZHRbdy0
 xqcmctlu7GyQMSjtfRyGH2fqvnPcXXDmxPYJK5Ewea9fXRaX4yihlxAW1/ykevyBOspO
 Rd+j5apdwbnnL5XQzVyZA1odqmfI78YiQ1roVB4Yz1VTCML97ZRriWh+qmHYZJ6qmXVq
 q3hdLbch/jZA/hNOcvOar0L0KWrEYElH44PdCrJ8fJO/VLrAvHgxdcGzoSWIam33SAh3
 nvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cyVMhza7QHyz2otLIKmAiJdFbZ/RATa3Op0jBBlYAqY=;
 b=R132fuEGmg8hUsv8TbLBny6Jqy749ue4ijLPtGoN+wNy+tGjWudDcZRxstnXcrL8Kf
 5FNBV84L74qyy/nNwAZzcQbhNkLpMfN5tm9DSz2OBkp3muT88szIFutBMZIg/dAVbH2M
 qWbajpI9Tf8BiMBwy/EtwUIIRcM8CakAoIKsS5+rSto2LbSTBLesvyuBJsIn78iEdFeL
 8jfMyOq1+c2QxLWWznlPB7Oy9yHO9I5ITVU8iSom65xShP2T2PPbplZM6qisFZtgBN2W
 Xp12FVK1rdFOHIsHt4Wdapq/nWV0ZYRum8//E3KGhMTak3Mg9tSg/joZTQ53iIlMcuyz
 2vQA==
X-Gm-Message-State: AOAM530xlTbxyfJWW68Km3LP+fIoDy6eFkeAioCrZWZ3FnXM66cyKSSt
 9VJjb4LTNy0NHmrM9SVf/EUx0Rocb/if3ZltGxI=
X-Google-Smtp-Source: ABdhPJyIuuiKs6ZqpT2DHKMnfYllIWkbNYaFktRkZ6bExgba9BTC664e3e2cSOO1EJ3B9L6VEDjP2YjcCTw6kutc+yQ=
X-Received: by 2002:a05:622a:10f:: with SMTP id
 u15mr4203659qtw.285.1618514018861; 
 Thu, 15 Apr 2021 12:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <76cae1e2-a1f4-ad3a-3c21-64f4dbd945c1@ti.com>
In-Reply-To: <76cae1e2-a1f4-ad3a-3c21-64f4dbd945c1@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 15 Apr 2021 21:13:27 +0200
Message-ID: <CAFLxGvwLjp-tNKGO1TstHLmHKzQst81Bg=E9sw9n9bUAD949Xg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BGIT_PULL=5D_CFI_and_HyperFlash_changes_for_v5=2E13=2D?=
 =?UTF-8?Q?rc1=E2=80=8B?=
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_121340_929665_78220DEB 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 14, 2021 at 8:12 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi  Miquel, Richard,
>
> Here is the CFI and HyperFlash related PR for v5.13-rc1. Thanks!
>
> Regards
> Vignesh
>
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
>
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/for-5.13

Pulled, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
