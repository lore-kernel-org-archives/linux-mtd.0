Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E43DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 11:35:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA1864DE0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 11:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA1864DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0It+xKWT6qb54kyliU4hnGew9FC/625YH0/mxP1fpWU=; b=IDerK4PBpbwxvADHnT32SpAvF
	iNqCh9YJKMPjcAPL0f2tU6a/rRLym7ETAwM83p/6yPJua/TVZpZFmoenCaLiMkW+FS63+frCfnG/W
	j+/mkcyCZRcIBO/D7cI3uOgr7USXO1OOW39n0cvSIc2rIeQBmWXwjt3LE8eMeZ+CZWQCwtHOWlqFr
	FPEbGpq2c9sEqVKeGWKoOGLAkbA4IOW0aioxo/kkjOHO9AaTUYjFfOx8fkDWMS/KilTfL6CLhHmXT
	sin8AmJSpktYMGCvpni9D7rOlpnMCOvHHcVkbHG+8C76OdlfJSEKTPvOa8CBg0zHEVmSXY/ccd5C3
	CNa4gpU0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBc9l-0001iZ-FQ; Mon, 15 Feb 2021 11:35:09 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBc9h-0001ht-W1
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 11:35:07 +0000
Received: by mail-qt1-x830.google.com with SMTP id h16so4545026qth.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LWrT8fZ201oRUWB5SANs4J6J66fxCMxMhnS4qgTBh3w=;
 b=i5xjhDLNkMrL//Xp50xS/bfVCwM3dBlG4QTulJZQ+Nb1tIZTYqaF0+DlWviGe7/tZT
 dnxmX7TQHx/vegReqj6uOjsDj8lxussCU29kWRFSAOb7qJzuveCI9YDsKwbin2UNJ1Dg
 v+Dktuqu/4ovnxFUxlr9tHIc3/wEUvCKuxJhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LWrT8fZ201oRUWB5SANs4J6J66fxCMxMhnS4qgTBh3w=;
 b=T1T/AFH/2isKF6O4uIAxDDh45Z+yFlwZEdX4S5CGZKV5bStOXM76hQDJJlT3wG5WjI
 aQwxoAvqTP4decZiUhHsdFVbw8af55WX9D3vhNyhdRc5+dKR5UFGlz8FsB51eMK/bIYu
 MuELaI56Q53q7H3nwUZICzeAOYqxCKXQfEUprEJuvFpkmEPDl/6lajcADX0i2MxjEgNw
 PNFJw4WvKrjzLmeHYgRsEOdpNMqHCIqBlO5yiM5VdPFkIZzhAhw4lMAfW7BZ0n4Kc9gX
 PRvVGItG/0OdjnXW099/zROLU+LnPfx+M4/O3NVEIGpfGzgyCSEeFLw2Ll7rcFQFpDcy
 i9GA==
X-Gm-Message-State: AOAM533cP3Xza+6z2n03yz58vn+zCUK64/v7glEnYKjQAlG/bTvmE5dl
 njmTorYpQ+Ph0RS2ZXIIUr0ahqAhKVJmyYxNJK6qSCuKQxE=
X-Google-Smtp-Source: ABdhPJyadDYkgRM4Ru/vdhJiHMG8Mk2MVykrG8xexKVBuTXrk3Wj1k22YIM5G9DsfHe+fBHAcZUMJnrGMhX43ZIjs/k=
X-Received: by 2002:aed:2845:: with SMTP id r63mr13568740qtd.386.1613388904137; 
 Mon, 15 Feb 2021 03:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
In-Reply-To: <20210215121653.4edd86c4@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 15 Feb 2021 20:34:53 +0900
Message-ID: <CAFr9PXmc09zkXfhxPmPADuZE=EPZg=8kaWhc1oeNRbnzSLqqgA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_063506_125655_519DDE0C 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Mon, 15 Feb 2021 at 20:16, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> But a changelog should always be added when you change something
> between two versions. And the changelog can be located below the three
> dashes ("---") without being part of the final commit message, it does
> not need to be in a separate cover letter.

Oh. I didn't even realise that feature existed. :)

> I see. Can you please try the following:
>
> nandwrite -o /dev/mtdx /dev/zero
> nanddump -ol1 /dev/mtdx
>
> If the entire area is effectively free to be used, you should see 0's
> everywhere. Otherwise you should have ff's somewhere.

Ok, I will confirm this and get back to you.

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
