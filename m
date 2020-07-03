Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8376AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 13:01:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FBD206B7
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 13:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mm5x3EKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3mmRTnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FBD206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jJXzS8cpT8GzLexg87scUzsldxK2dppj03MLBCNVBRQ=; b=Mm5x3EKuFiMUtfLQDzAvepg70
	SzS+lyu3r7IJylAXG6LHJ1N3aYiwMdFDx/A79qimFy2PAUq66w3LzL3XxGXFS8GB6WUaQgIrrApW1
	jwcDqJsBJGKXomMlNcplRrtes0g38lxZjpTGbjI3VMjXY6xQmsBlalek75XVTdNHvBZQbe81ZLEvF
	y5l3ky6HHFeaC+3W4o5DlwSScS4nGcYXqXKoQjfVMIql21msjvqjKZ0E5tUOCbKb89xfcAnES6jNV
	B1IIZCTk0LB9ocpA7/KTAcg9IPjupuyc/zIsYAz6z2GJC188p8zpB8YV8fgY/mOFdG4WUgHVqs/Ln
	MVvsu/YFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrLJF-0007ou-8r; Fri, 03 Jul 2020 13:00:53 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrLIz-0007iG-Rl
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 13:00:38 +0000
Received: by mail-qk1-x735.google.com with SMTP id q198so28673102qka.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2020 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKZc8jEsmob5AtjJBcuqRCIXd1dVVHVRWGQtRD8OJGY=;
 b=m3mmRTnfxZMPE4B9XuT46XgaFEQgaNV95HejRjLgjhnVeiTICFNzNAbjhZWlAAtrnr
 v3INIe0AMKqw2FiO5gc3avs5Wm3Wd6H2zbbLLll3OB3H4+yP2ximRufK6J3Vwzvjllq0
 MW0CYZbxg7w1Roe0yI2UP2NzENdmsEj30WtdDxyJ0XnFvRZewlO9i/bNCY3NNc0UmS2p
 iokGmsD/5X4x+tR203Jr+aqFj/Py5Zn3nGeC+VKM01Ako2AdD3ZjpHIzZ5tA2n9DMwYl
 g5Zd2gbJLWcHGnnhZPUSb2IPO6LpLSB9F0Vlqj4m+1i1oKpSy0UlCSb+XJX8WOjo2zN1
 ozlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKZc8jEsmob5AtjJBcuqRCIXd1dVVHVRWGQtRD8OJGY=;
 b=ac9NL6RBxPIIeRU+b1ItDH+sXsjYXLveCyJRq11Om4vlY/qIQFxBGHVDJvUNHORRJH
 8ffpGDiO/RlqUDOfokTJ2vm6RQsT5wmcG0ftWKj/csufy4+xStfnDKjCCb05eDhopw4F
 MYYhd1NOl2z4GfPv2nlpw/Hvo4ODltpLqkJQTyQRh0Wusg5JUAuEu2o0VIPb6Eu4D22X
 rGugyAECJTDd5E11cP/DlhmHAVD10p2skafQ2ofyBZYxe7OojzznJpjcgNdEVUQ0mSlw
 yl5iPWodHJaDH1Yk68Tcd0ab6TrMPRqJO5bEZWWcMA/E84aevUKdu+Y7YS85OvJ7LFdK
 eI1g==
X-Gm-Message-State: AOAM532iDgSSq76YbmgTeiof6Agxcm0tSCm+d3XE6wa5kbAJaZjbFoeF
 v7wt+lCps6t7V2ryxAZ9+t+hW7EnBmlfuJS7TYQ2nQ==
X-Google-Smtp-Source: ABdhPJwmZShMK31GSKo0guU3xyxh2mKmaVGm+OMPjpBALmZudCXYhEXL9pBkhrVBZGCkb3c+qrhKV89wj7DtURwJ8xw=
X-Received: by 2002:a37:b4f:: with SMTP id 76mr32604288qkl.283.1593781235114; 
 Fri, 03 Jul 2020 06:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <e31c36b5-5860-b547-81cb-74135eb5823a@koalo.de>
 <CABDT8WwS=gmS6r9ihV342hywvUZH-uXj-f7cdyh-n06QjObRYQ@mail.gmail.com>
 <CAFLxGvyuQ011RNjLYch-c0zhwPME214whiQZ=eMwodQ1SVafyw@mail.gmail.com>
 <3179465.I5GL2cDyv0@ada>
In-Reply-To: <3179465.I5GL2cDyv0@ada>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 3 Jul 2020 15:00:24 +0200
Message-ID: <CAFLxGvzc_t6ucygeJgRK-=RLJVy0GUufc=MZDYoiTaFoX=fQWQ@mail.gmail.com>
Subject: Re: lists.infradead.org restored from backup, git.infradead.org down.
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_090038_091002_6ADC55A5 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 3, 2020 at 12:32 PM Alexander Dahl <ada@thorsis.com> wrote:
> https://github.com/search?q=mtd-utils&s=updated&type=Repositories
>
> Sorting by "recently updated" reveals at least those which were last updated
> in February:
>
> - https://github.com/LeSpocky/mtd-utils (mine)
> - https://github.com/sigma-star/mtd-utils (already mentioned)
>

Well, the repo on infarroot.at is owned by David Oberhollenzer, he
maintains mtd-utils.
So it should be the most recent one. :-)

> But this is one repo only, git.infradead.org probably had more?

mtd-www.git is important too, David was so kind to reconstruct it.
aiaiai.git is also back. :-)

What repos do you miss?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
