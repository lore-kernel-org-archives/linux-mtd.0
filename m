Return-Path: <SRS0=/XrL=CI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8989CC433E6
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Aug 2020 19:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBAD206F0
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Aug 2020 19:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DHH9bWD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3Se4sbQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBAD206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=juGejuzCwVnG0Rf5HHVeSK76NZoTeKmvCRNOWLwimuU=; b=DHH9bWD2FRJg98rpDMLyW6McZ
	OZG76VOEmoYazPTE3MT6M0+nQoE3qaYzl6sXnTGhqaxXMj8f3krg3uzWgGob5o4hYSVx/wXmfCIHr
	yYU7WM6lc5SCm0iNEXDyBlLvPL+iRn5TQzG3WFNMG5RB01YVHbcIiYfNUOtub9qQRLhRhLFzuCilm
	EGF/2929LLTn8PdWVf49UeJ/GRp9LoOJ328MTIteFt6Ekxxp9mNeaO6uKgzeYDqxMUxfk30nlCsBW
	KdbrkKDlitkRWFt804tEjBSa5YcPnJSE654DF6DvHNkjpKZyfWijXhNP2caKDVaFifaaLVqdKgGqS
	QWDASk8Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCSvy-00054P-2G; Sun, 30 Aug 2020 19:24:10 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCSvr-00053o-ON
 for linux-mtd@lists.infradead.org; Sun, 30 Aug 2020 19:24:04 +0000
Received: by mail-qt1-x844.google.com with SMTP id t20so3346883qtr.8
 for <linux-mtd@lists.infradead.org>; Sun, 30 Aug 2020 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Skpi6H+OYPmXs+7QMT/lOgahlNwn/ONRzuEk3fT9+8s=;
 b=a3Se4sbQvM/cYT12thyCZ0Y/DU9wFGyNgrHlazvqWKrMzyRlf06M0i+h+wW3O9fJU5
 xKOCgb0LF2OcUaLSdaR0at9Iuu2ElIh7Quhb7hah3YhRDCAOdl1bUiFZvfTeD68saodF
 OgU5U/ebXzxaMd4XLd/xDDliARHXqV7h9FyOzTBPrfCzrZawb5LLlDM4ad2zIHwqt5Hk
 qfVfu2qns9RRtmFxaSVoglS+phgW3Nxzn8bWqebIy4VNou61s0QZHQTng9qL+6CNJemH
 1LWhAuGWwUVrIhnhM4/VFFJS77J0bEXof9ubj8ZzRk0p9tSuGfgru3OQKGeYuLv05krN
 46SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Skpi6H+OYPmXs+7QMT/lOgahlNwn/ONRzuEk3fT9+8s=;
 b=KWQZpmLggSPuWWvXAShFOeaNRv0ai/11byVVrAjFrnPu8/yCH3E6r5RTze/a8R0Lje
 vQJcUUKtvrEYro3DiXYtfvj6cX9CH789ugOPPV+rNpJgfLR4mk+Lscxs5Y4Pa4VG8T6l
 1m7qWg9JZXoRCU+nqcbMe4whcJnSs8otgymlAQyDda+pl/pw9PZ8OZenL3HIJMKTBr9x
 C6WR7hIHcj5CHWDBQeiMWWYneoTLDzdrmEqwFPV3YencH0xHfDAapt9foy/SMgUVLgiY
 vth+znNJ2MZQt/TA6bIxX6yZaD6MRcdGMlxff+R9vDQ3KeQP/xA1yETCMgZlpdeDAt/3
 g6OQ==
X-Gm-Message-State: AOAM533tf4NjYeTkevqKzEFINjX7NupDm4CseGF4PTLSRl+JLe6alDEU
 djDKv9t898FNOwuGiZ7dhXswJ5eUu1rpGI5D/IY=
X-Google-Smtp-Source: ABdhPJyb9qi2LXnAbvFzVyN/tfOSbhD1qiFz3ip6XgbbtB5H0Jzc0lVlB0f2iHl8Rc4gDlTYGpwJ/gI8lWuPMfl82P0=
X-Received: by 2002:ac8:70c3:: with SMTP id g3mr10420820qtp.164.1598815440336; 
 Sun, 30 Aug 2020 12:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200828033250.910168-1-chengzhihao1@huawei.com>
In-Reply-To: <20200828033250.910168-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 30 Aug 2020 21:23:49 +0200
Message-ID: <CAFLxGvwzTiDDLaN3Q5BSa2+7cwxBooeJuHSrgNPaM9=ONBLTkg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: setflags: Don't show error message when
 vfs_ioc_setflags_prepare() fails
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_152403_827335_C2DC30EE 
X-CRM114-Status: GOOD (  13.56  )
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
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 5:33 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> Following process will trigger ubifs_err:
>   1. useradd -m freg                                        (Under root)
>   2. cd /home/freg && mkdir mp                              (Under freg)
>   3. mount -t ubifs /dev/ubi0_0 /home/freg/mp               (Under root)
>   4. cd /home/freg && echo 123 > mp/a                       (Under root)
>   5. cd mp && chown freg a && chgrp freg a && chmod 777 a   (Under root)
>   6. chattr +i a                                            (Under freg)
>
> UBIFS error (ubi0:0 pid 1723): ubifs_ioctl [ubifs]: can't modify inode
> 65 attributes
> chattr: Operation not permitted while setting flags on a
>
> This is not an UBIFS problem, it was caused by task priviliage checking
> on file operations. Remove error message printing from kernel just like
> other filesystems (eg. ext4), since we already have enough information
> from userspace tools.
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  fs/ubifs/ioctl.c | 1 -
>  1 file changed, 1 deletion(-)

Makes sense, thanks for fixing!
BTW: I didn't forget about the other valuable fixes from you, in the
next two weeks I'll hopefully
find more time for reviewing/testing. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
