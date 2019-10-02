Return-Path: <SRS0=okf0=X3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4A4C35280
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 16:13:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A820021D81
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 16:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fQeTYPHx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU+DS5Li"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A820021D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kvvjcT9HqRumr2r/VzBvYPrwTclpbmicPoi3UEPnIA=; b=fQeTYPHxDQLylq
	pxnpVZyu3bWvw3Ktfe6gU1J3nh9ijUP6W2/8oqfMGJYZPHHeBmrh1tpGbr3AV6dEufsko8sDsoua3
	CmucGnysoBKe4xsSTdI5+PccAb4p6775jRIQvbo02e5N6mIAnIKQs01jHpUZBQqsDJWpAHGiN5Ciw
	7UZwOHxqFu7FK1c9lyzrczTPZFL3HEJR6aMvnW5accEByDpVWHF4csHB9ZqaXekgGkehZxvegLFU6
	m6TBLyqSF3b1agUG8+GxgAB0dTzdFN4eZpEyyUuRdrnrP4dp9FRJbUGr+voeFCvKOGybp8wCQKDRR
	mssVoIk/vUSygehOHNSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFhFw-0004yT-9s; Wed, 02 Oct 2019 16:13:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFhFt-0004y1-CJ
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2019 16:13:34 +0000
Received: by mail-wr1-x42a.google.com with SMTP id o18so20307376wrv.13
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2019 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kaYZtEVfGGLTQbvLLDVRoA0jS6dNAcEXyH63OuZNwpU=;
 b=eU+DS5Liup2MgSpgVX4MOFlKxFlP51Mo23FB22/Lq4ZznLDD4pre8Tcf56bC/FxWsX
 XN68kFBDGt7/0jFWvOR4j+NECdiWGXuzIttYjNV67hBPoo6dIwIcMdSVe3NefqM+AkDt
 VDsswuw5qV/3aDwi1cfzT7kjsKNn6FUmZBQ9qmWzwai+Unj+5WgXiCvcbi0/NewvvRP3
 zvlJ+FXhvez6YSeN6eH2sE+3xyqFMl5eH8zm3KRYEaGeaH0W80QEHLNxeQaZ/UMKXGI2
 yEeF0O/pnXYYEiXHSPZ9pbbLkapmJ1UfI9gz5SFXHgGT/1aXHjPxqwB8swohoNDB2q3a
 dgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaYZtEVfGGLTQbvLLDVRoA0jS6dNAcEXyH63OuZNwpU=;
 b=HOB8zbzdi1CHxptmCrUA2u2eIDJOZLgf0pqiWOXod4oHjR6YYa46vMdWtCRiieV2e8
 Mj3lQYYzzNJTj63hzEKuy1DsVb7tkC+YXz1ADblGZENUsiyCgPLKY8ZFCfpakC+CtUE3
 MNb7PqjWdtZRVr66Etkj3a5xsjO0upCDJaMrSJqAhQ1lR0KpyXcZo79JiJagCqiUFD5X
 5VOwOsVoIwuzW+4DS29V0adU/TQl0x/fBbdLJwhmCrhFWociIYxdiLhfVSYVTKzBz1xx
 I6V4Jfq/Mna1gV9QpYDavMLe0EPjv6HOCtCFcglmyrQPkGajDPW77YnMHPlxUCioqsQJ
 wA0w==
X-Gm-Message-State: APjAAAWUhxrnuWENhzGghpnLoPbI/h2KF0Pfmi1SAAkBZg/3Lket3Wru
 Ah6X5oKsuZsXQmZ9dg6O8pbD7d17njUCVU0ID/AeQB2P
X-Google-Smtp-Source: APXvYqxxgn1Gpm7XBZ7cIl9kKLWP+j1U1bzG7NbawLFlHhy/DIjIaH//hE05Pj6xjMle6K95wfb/ybjW1yK1y7Dw43Y=
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr2658000wrs.4.1570032809468;
 Wed, 02 Oct 2019 09:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
In-Reply-To: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 2 Oct 2019 18:13:10 +0200
Message-ID: <CAFLxGvxg3dYoiiTy7=vNwC75s529akqx0DO3ozLrP_TbhATr_g@mail.gmail.com>
Subject: Re: How the bad blocks occured in despite MTD manages the bad blocks
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_091333_417317_66C57354 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 2, 2019 at 12:35 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> My understinding is that MTD manages the NAND bad blocks, but can the
> MTD prevent bad blocks happening?

It does not. UBI does by applying wear-leveling.

> My iMX6 NAND device was only up and running about a month, it now
> failed to boot from NAND due to the bad blocks:

Why do you think so?

> Questions:
>
> (a) what could be common cause to trigger bad blacks?

Mostly due to block aging.

> (b) if I reflush the NAND will the bad blacks recovered or just mapped
> it to bad block list?

A bad block will be bad forever.

> .......
> Bad block table found at page 131008, version 0x01
> Bad block table found at page 130944, version 0x01

Having a bad block table is nothing bad.

> ................
> [FAILED] Failed to mount Kernel Debug File System.
> [FAILED] Failed to mount Temporary Directory (/tmp).
> [FAILED] Failed to start Remount Root and Kernel File Systems.
> [FAILED] Failed to mount /var/volatile.
> [FAILED] Failed to mount FUSE Control File System.

This lines are useless. Why exactly is it failing? And *what* fails?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
