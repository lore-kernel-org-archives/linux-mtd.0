Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A63C25B4E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9vZJNUIXbIcwLQGQNkDKDMK5uoZBfGV5aEnUc6JXE4=; b=ndqp20TY+3EiIX
	GNq2y7yIZptP78IhuTJPi2vL8iCAcp567LlR0B6bF+RMkILF981whAUC2cuxUJmr7lEHNX8kr9me7
	/f16x0TIpr5lBNYPddzZKx3NFd4d/aVPfdDvx/Q6nAUKx8qZIGvHFPvGj5cv89EyZylh5bbH1kP+V
	Vx2cskDs/EwFRkrQX8jkR0RWaR+DqtjENQlngl4jguj2j0qnXQRBeY30vW15qBpHw1aF5tfC9g56t
	vDgc6gYpK6epFsaz2R5M13W3suURk61N6Qhh+jbBh3JCFbPuLBsJAxHN+MRn2S8Bf0dmqngoWrtiv
	SPqf16AXN2QsasEwt64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJsP-004A79-AG; Tue, 24 Jan 2023 14:02:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJep-004465-SM
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 13:48:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so954660wmq.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2023 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxaf/f1QewW4LzAbNfnn+pTasvGPcVaqV+QnlU1wFXM=;
        b=hZMl1kv6qogirZi2caqeHlazTd0rr0Mb8dmaOvVpVRCU5ZYx7vSGZIFXIeljnuudip
         5mkXZZo7IMWHwdHbtd83F5ZAVwTBX2AUb05cdyyd0T6DUQk1yB+h34c6vkK9BxJE8/pz
         TBsD6b7N0gWCUePkKaNjC1MlwpqoWyxnnZD9ixwUKDrk0L1TOJFpyG3GHfzntJ0/TPdq
         SUgp3yOOt3Jvp/Zte5V741bTy3F3dzE8/mLvRIL6Ezmu1kX3QMzgzYj0vY4bkyfAybW8
         /jvO6GyYCQ9v3pHJCRE2VszQRfZZpAUVbF2iHMgk+B1bch7D5lRcKL6UpK+ZqdptGtaz
         swRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxaf/f1QewW4LzAbNfnn+pTasvGPcVaqV+QnlU1wFXM=;
        b=R2hRNH/DuKw2ci9ClV1OveYxkLElkjWP60iyEz5LxHz3ob4Cf1FJ4JaOhnbbKFpEDJ
         DflLPc8YHjGHaDNDc0an2HkDyTeuNl+d8SNPAQVbjOn6NJISTO+RdZ+IjzSudsEShw13
         kFqzZZMv+ObbQy5SGBtOe51hZTMEHQqBcU/9DolCEbi5zquo2cmKtIl6TyPtKSeT8uLK
         ZJh+D5hZYvcZrBm9rJrsM0oEMA9lXlyaBY29Y0O6yb/ziwu593tzBCcBK+qKNlK1WutV
         I+6T8iCFl39py1OodxWO7H1si5rBQ71VbdTxcH3SEu+JcgOH/hPqL13wMZY7PImvuW2u
         YUBQ==
X-Gm-Message-State: AFqh2krhWTQZ24SUb2pNe+xSZIdn1ZliP3mjlrJbnkNsQQK8m0FVXj9t
	gJo06RCfs6Z9rXga1yIHWV+x4mGSLDLceeNI5EClHg==
X-Google-Smtp-Source: AMrXdXueQc4IgTBNSkLOZ6ednEGEyPVX2rus59b2Pqn/um3cAsNRbtcIjWybgC5Uvt+lUmv3Lz89ZfzcitzqMZ2v0GE=
X-Received: by 2002:a05:600c:805:b0:3cf:81b1:bc7b with SMTP id
 k5-20020a05600c080500b003cf81b1bc7bmr1464312wmp.121.1674568091782; Tue, 24
 Jan 2023 05:48:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHEoWwuK_rZfka+skd=CTBf2mjAFL71HX_qC77rCWcaO+qy-vg@mail.gmail.com>
 <mafs0lelsf6p9.fsf@amazon.de>
In-Reply-To: <mafs0lelsf6p9.fsf@amazon.de>
From: Mike Williamson <michael.williamson@criticallink.com>
Date: Tue, 24 Jan 2023 08:48:00 -0500
Message-ID: <CAHEoWwu+x6jhbZF301HALL9dTAh6-N7u-or8YNQ8_z5q3TLWzg@mail.gmail.com>
Subject: Re: Question about SPI-NOR micron-st.c driver and OSPI devices.
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_054816_290865_EF66A7DE 
X-CRM114-Status: GOOD (  28.83  )
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

Hi Pratyush,

On Tue, Jan 24, 2023 at 7:46 AM Pratyush Yadav <ptyadav@amazon.de> wrote:
>
> Hi Mike,
>
> On Mon, Jan 16 2023, Mike Williamson wrote:
>
> > Hello,
> >
> > I am looking at the drivers/mtd/spi-not/micron-st.c file.
> >
> > I was wondering why the mt35xu512aba_fixups, and in general the patch below,
> > were not also applied to the mt35xu02g device entry?  Best I can tell, the
> > datasheets for the two parts (same family, different densities) look nearly
> > identical and the
> >
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2333941.html
> >
> > I ask because we are having some troubles with the mt35xu02g and I am
> > wondering if we need these fixups to run reliably in octal mode.
>
> When I wrote the patches for Octal DTR support on MT35 flash family, I
> only had the mt35xu512aba flash on me. And it was a new feature so I did
> not want to add it to a flash I could not test, and risk breaking it. I
> figured if someone really wanted Octal DTR support on the 02G part, they
> can populate the fixups and test it themselves.
>
> So this is what I suggest you do as well. Add the fixups, test it out,
> and if it works, upstream the patch.

I have tested using the fixups on the 02G part successfully, but we are
working out of a 5.10 branch TI is providing for a new SOC.  I'm not sure
when I will be able to test against mainline/next as I don't know the state
of the SOC drivers (for TI's AM62x).  I know they are working to get them
in, but I don't think they are there yet.

Knowing the motivation for leaving the fixups out is helpful. I have a bit of
confidence that the patch is likely the right fix for Octal DTR support.

> ... While you are at it, perhaps also
> convert it to use the PARSE_SFDP flag. See db391efe765c ("mtd: spi-nor:
> spansion: Remove NO_SFDP_FLAGS from s28hs512t info") or a30f53d8bc0f
> ("mtd: spi-nor: issi: is25wp256: Init flash based on SFDP") for example.
>

I will have a look.

Thanks,
Mike

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
