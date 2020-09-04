Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76F4C43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 09:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3AD205CB
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 09:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taNdhTAm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJOSGEnd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3AD205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MTWcIxkp8elkm7YNv04KK6K/i2Qxmrvupfx1yRM/wOk=; b=taNdhTAm69jzYkIJ/2lyzb9v7
	/Ne4gApA2DIB0D7cfH3YupgO2Ks/q9FRY/p9FtkIhV5UzZUyBM8ZQ38I+qA1IFhjiYekHrEciWUui
	c+ytOBLTThhlt9S90wNWEMlStGhSLHFAOi3SuqLfNtEvmr4CUi52I9fTfR5or0naRIe6tnXyassf0
	itO1iNsXCCcVQrrc/OAtGQAOzZsmQrqTMRxU5bVumIlbte+3cYg37589wwcnzIvu1l3MmX61j2LQF
	d2T4JKR+2KGYYXXG5gPlRD1jfSOF0ayzXQ/AA48RwLnEGc/cMG5oo9S4u1TOLaeVr2dsIlfE9cR0t
	41IaqB/mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE88X-0002th-KJ; Fri, 04 Sep 2020 09:36:01 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE88V-0002rW-4u
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 09:36:00 +0000
Received: by mail-io1-xd42.google.com with SMTP id g13so6433516ioo.9
 for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2020 02:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rD0nix55W2qfF3AXNZ1lJkfBUsCM4Tbaaye3ueUSSKw=;
 b=eJOSGEndIYZWlRnHV1NQXnbV6S2msBA0g4K1HLpj5sL/oI1ucdbyavUAkBLMIiEb65
 QvAgHsxmpjOpcOef/syFkqSidUst8orFU9pmVkSYfo34xVFxyscP5HxX0VrJX/VLi9b/
 ow8sFlC+OMXMzZm2j49EKBE3TP6wdPOIgClJYgz+WHacxouDbhZ6YrHs/n54/Bx5NFxH
 cLrjfgGLF+lHO74P2NILuZ1h7AiIe5bBnFK1VJpDt5eYbvymFVPI3nYupAA3G+1kG1CK
 XRP9aNCDyMYHRjQ5Row8FRWhAWZwVVaU37KcFy2T8jC4+o0nsrRSnkOsQHmJ5p9PCv7L
 ObOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rD0nix55W2qfF3AXNZ1lJkfBUsCM4Tbaaye3ueUSSKw=;
 b=H7ahSM6qFfIBvbl2Ug6FBhEDDI20e12hU8fzxpSU43i2q3eOtTfhLBgvx2/uYeSgV7
 oVlN+M03ObxwZ8zXQy/Gf4za+LzZ6ORCVDYXks4zEYFd0lyPCUKIKz5wC4Y1yiEMAdbi
 Z4kY4+ec5LfOo+TOdVj7sHhMNY+k76EVjFy4K/6qd5bUTnT+tZdDTpDOUvcfoR4oe6uK
 xNKLhzFXsB6z0PnHLemB+lbhCB4/NLFPfAa/Zrf9CNxu9BtuBrD6mbfsT6B+gqookp9A
 NdjFmZIrbb4MbJJOZA8j8rxSo84SFGxR/c/Q1/kAVXbnv0YSZ6fVqTbukOTgNowPC5ud
 w1xw==
X-Gm-Message-State: AOAM5311oUl+OOyc6OqWsUnw+7ATM5UFWazntShUzOqFamXePanz3rQV
 G2DzJ8yqpjIdRspmU/EwYEvDOLEQARQkgpAhQw==
X-Google-Smtp-Source: ABdhPJz8Dzrphb4Pkq47+wyYgTsl4bAQz29JSCKwGYGvWoIEXRneWp1b40lTsehDvqWnoeFFVqV2baDNYKc6GlL81HE=
X-Received: by 2002:a6b:b787:: with SMTP id h129mr6787840iof.202.1599212155462; 
 Fri, 04 Sep 2020 02:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <1884fb58-9395-680c-3c10-a17199826026@ti.com>
 <2a1da276-96c6-9b5e-e7f1-563b5d2a1feb@hisilicon.com>
 <10ab34bf-653a-ae72-286e-43b08dc7f909@ti.com>
 <0c3dcb65-3a6d-d742-da83-3b71f5417115@hisilicon.com>
In-Reply-To: <0c3dcb65-3a6d-d742-da83-3b71f5417115@hisilicon.com>
From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Fri, 4 Sep 2020 11:35:43 +0200
Message-ID: <CAO8h3eFWHH0sq-37Etdu99+ULYFrkFLuh5SP1qDPFseStBchqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Yicong Yang <yangyicong@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_053559_260198_2219B5C9 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, sergei.shtylyov@cogentembedded.com,
 tudor.ambarus@microchip.com, richard@nod.at, me@yadavpratyush.com,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, alexander.sverdlin@nokia.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Fr., 4. Sept. 2020 um 09:55 Uhr schrieb Yicong Yang
<yangyicong@hisilicon.com>:
> > Given the fact that setting and unsetting NV bit causes wearing of this
> > rather important bit and also breaks backward compatibility of tools
> > that expect Kernel to set QE bit on flashing, I suggest reverting these patches:
> >
> > cc59e6bb6cd6 mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()
> > be192209d5a3 mtd: spi-nor: Add capability to disable flash quad mode
>
> I've send the revert patches. You may found at :
> https://lore.kernel.org/linux-mtd/1599205640-26690-1-git-send-email-yangyicong@hisilicon.com/

Thanks. I think this is currently the way to go.

> but I still have something uncertain, I think we should avoid setting the non-volatile bits
> in spi-nor driver, should we?

Why not? If quad mode should be used the QE bit has to be set. There is no
other way to enable quad mode (on the devices I am aware of).

Regards,
Matthias

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
