Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3F9C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:24:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EEB61074
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EEB61074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q7CcSLI3UAtFbxqQF0qbOB/dYHd8FDmWPASQ8omBBKQ=; b=Z8bq7qCSahvo9da50f44J2hq9
	M8ZsFq5NrHDCjP3S5YmRLkTjCqh7gfcz54lwg1ZmXkX/LbToUMPn562BfQxk71ADSBT7buy9qlIk6
	NuRWzstJyKkSlyjdb036X3w2KCAkxGoG5yjySaQoRQqy12tzYthXY8meHPa9W8yEL8qTxP3nd7EAk
	6b+qDRJ5+xYeqAjAPPZZzIuJc5rn/Y5PQ52X9cr/eMsLGdabviC9sAJ99eduo28FZLnF2YBZOTEWv
	dVni+mUbSQeT5wApha1+0ma0jlEKkUxZot6E766g/QpNlRSXXp00y6+G4wczSMVkNWQK2FbTrEAus
	1yTlYSLFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUVYv-008FG4-Qq; Thu, 08 Apr 2021 14:23:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUVYs-008FFY-Du
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 14:23:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id u21so3324437ejo.13
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vwtK80T1DcvdQa1FAI2jtGEjdTtfVkLM2SIvSNWaLIk=;
 b=ACNfgd1QArqPlTQktYH1Ex1bCfKfu8UZXKId8OgiiQeobA5J1XUDpA19Ak3FHyE+d/
 pWruGOAtodhnbVZeFRykcWUlbYBAH5/YrralglWc3fn4yq49cApM+z4nur0dTHBPQ2iI
 Csx8LMKGC6ulwXz5wMufV1e1VZJB+0ardOxINsrcl0nlLyTXm4nMe/f3kudT8WJ0oSjv
 YZFAqeXIs9wjZkn11lvVmi1wnUR4GOjtfLXDh1SqjztwPVFHl7Nyupe6uKhZhKA1NeOL
 +KqqLIxNWfYOe3KEhs5UbM0Uod0S8LZB1VDzb54TJbr16x9l/b5XEUVZ90aWG7pyVjPx
 5WRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vwtK80T1DcvdQa1FAI2jtGEjdTtfVkLM2SIvSNWaLIk=;
 b=dyMeb4s6mttGIfH+SMSSuCdC83yU7PVZ18YAhBGXSNr5jL9F44CaDtR2CFQkMI3Gta
 yMqiX0p9ts+oedJJDHB245p883CCoLJW2u6f2FmiJOTm4LU3WSFAReWITW1Ru9Jtfph4
 SOClR6oX/EXzIxV2tYu4ezYZegobST+Bue8Eb3dhSaAy2nK+ZBYAlXcC6R1OLou7RB0D
 jEFqztKEAPAjSenR09aCKZ81QAYjbDVnC1b2t94OsCih1ZMqta/weFOKE1gz6y0oXg/q
 ex4c7hffgToxvcT2TZN9PJjJBFrJYcWrYFfbJvb0KnydrkXxrhQYman2dHI4mFIZoq+q
 9STQ==
X-Gm-Message-State: AOAM531ITv+uhg8UVC42KqSrhE/pdxOLAXh/FpSpOsbr8hZVQ6cEOz75
 JvYRG67efR/4E7ANGGfZPgD0Tj/T9qcMOKM2lw==
X-Google-Smtp-Source: ABdhPJxMq2t3j6t2QcS2dptIWdOfv1qy4Wta+x7KAGHEg0FEAvg7HWG8a1JiK/VOehoscBFHrKfJHN0Lf709gBcFqBI=
X-Received: by 2002:a17:907:935:: with SMTP id
 au21mr10494140ejc.362.1617891788931; 
 Thu, 08 Apr 2021 07:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210405152935.148129-1-rsalvaterra@gmail.com>
 <CAFLxGvwhtRY-6kT-sN=AgjvyssHb5qdTS6WQHkhKu3YrPuTkdw@mail.gmail.com>
In-Reply-To: <CAFLxGvwhtRY-6kT-sN=AgjvyssHb5qdTS6WQHkhKu3YrPuTkdw@mail.gmail.com>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 8 Apr 2021 15:22:57 +0100
Message-ID: <CALjTZvZrn=yngbEcS8JCKaF_yW8Sn00vvy6cAODkr46UJvD7gA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: default to zstd compression
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_152310_513944_C720E960 
X-CRM114-Status: GOOD (  11.19  )
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

Hi, Richard,

On Thu, 8 Apr 2021 at 12:00, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> I was about to NACK this patch but by looking at the diff I realized
> that you change
> the default compressor only for the default filesystem as created by
> UBIFS itself.

Yes, that was the idea. :)

> Queued for the merge window. :-)

Thanks a lot!

Rui

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
