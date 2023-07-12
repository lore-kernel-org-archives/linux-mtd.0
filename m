Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23200EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pT3XxUaQQLnfrt529N9j51VFI6s7dTwKexfg1M+aOPU=; b=bHF
	b/5i9d17Fk9ZZ9v+RSWSHAXYZavEF0djWtBDVEzNoOEEwWrX12tFeerolcbhNHnif9/J+/Q6V/sX3
	jEFUC1bhEVz50tqVjkb3+J3bj7mg9E9UxQuCoOQvSy8fBA6rrO9x6MyWb5H+ojA42YvbHQgjLBjO7
	yqZkOHtXDfPDQu66M60xqbpdbu0pvq5x0/Y+RfZIqiY5wxtuzh2Qt1GPsOVBqDeg+YB/QMIye1UWd
	Y4aMC7Bj+IyGsHuYDJjh5kqxTJCa15U1F8ttnwW+6Bojg2TnFOPja0MSZ/WokFKxX7SRORwcxMdhx
	bXPITv/SUZ5Zm5Ffb0o97ba+d0hQ8oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaNp-0008Em-0n;
	Wed, 12 Jul 2023 13:59:57 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaNm-0008D0-1j
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 13:59:55 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-444f9c0b2a4so2088314137.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2023 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689170390; x=1691762390;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=la7xD6v4M8WAlisTF+ijLkx9gxv01PJflmUjfs8N44g=;
        b=hkoJF0iT6tOtmhignEwpFUrvcXpQp1ZyK84MCiIoBdRwnVbfaHNecu4NOA0STWpU1x
         w+w7h3/jaODj4pP/JiS5oJgfcAoQoqLfmJ6PpI9inys63dr1nJLaZR5hT28K7/Ppaje+
         pWHa7VmkmCAIch7XAScY1HBcY8jGCanzoQqejRDuL92noz5pw8zEJlfIGDOzQBH9iNTy
         jTlfbnfnztn086ToOzEBcEcInVXsuXmyMckjdLslg2ao/BAhf+UP34oi/vYhwNQ/nKyc
         2AsVP107fqXnuqVem9M8R6SfUhomZhMbImcEz2w/HedgT1HHMWzURVQPIqotU30Ap6Fv
         1s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170390; x=1691762390;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=la7xD6v4M8WAlisTF+ijLkx9gxv01PJflmUjfs8N44g=;
        b=JoyrVclIC6A03jwiUEckDWlaoAo1XKQ6E63/wO0BYo9mXNr+Ep22qkFWMJK4nu4fZq
         lyWNEBuUSFVy51EGwOmN1hDnEI46TfO3XcwvGSjCbbraeVAU+R9yJkPuWkqnW8vQxvLQ
         8j60CIDhdMggP7fgiwFbXurywZvoMZ/fczBZkuyuUf+hFUrRiaN51x8GBJJjXC5vPrgu
         YhncYvd1vCh5L3jEadcfRG/QvR+nVibvxqa+M3huGI4l99N9aOOLuSnjllhRsJuUInT0
         Lv6/Q85imyB4IxiVr03Lvb697aGHZ+/RWNN4oTQ928DElIhU8/hq5NZQJcLVE784XFOz
         p4zg==
X-Gm-Message-State: ABy/qLYD+p1iPcc4oGAWQ5ZkBh8rFmyZn1nJJG1JWzxnmPWIp4i1To+u
	ndmVLlCdhmo8g3fM/IJjJxs+BgpLXJf7ZGfqFtQ=
X-Google-Smtp-Source: APBJJlGHb8UgulGcSBJwSnFIW+aaN70f7DUA4/cb5cVFlzfQncuxlS8VeWHSjG/YwqF+isRC3pXWJkI44UVXWoEWq/Q=
X-Received: by 2002:a67:eb15:0:b0:443:4302:b24b with SMTP id
 a21-20020a67eb15000000b004434302b24bmr8424550vso.11.1689170390207; Wed, 12
 Jul 2023 06:59:50 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 12 Jul 2023 19:29:39 +0530
Message-ID: <CAOuPNLizjBp_8ceKq=RLznXdsHD-+N55RoPh_D7_Mpkg7M-BwQ@mail.gmail.com>
Subject: MTD: Lots of mtdblock warnings on bootup logs
To: open list <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel@kvack.org, ezequiel@collabora.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, bjorn@mork.no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_065954_573291_6392937E 
X-CRM114-Status: GOOD (  10.10  )
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

Hi,

We are getting below warning messages in dmesg logs on a NAND device
for every raw partition.
Kernel: 5.15 ; arm64 ; NAND + ubi + squashfs
We have some RAW partitions and one UBI partition (with ubifs/squashfs volumes).

We are seeing large numbers of these logs on the serial console that
impact the boot time.
[....]
[    9.667240][    T9] Creating 58 MTD partitions on "1c98000.nand":
[....]
[   39.975707][  T519] mtdblock: MTD device 'uefi_a' is NAND, please
consider using UBI block devices instead.
[   39.975707][  T519] mtdblock: MTD device 'uefi_b' is NAND, please
consider using UBI block devices instead.
[....]

This was added as part of this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/mtd/mtdblock.c?h=v5.15.120&id=f41c9418c5898c01634675150696da290fb86796
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/mtd/mtdblock.c?h=v5.15.120&id=e07403a8c6be01857ff75060b2df9a1aa8320fe5

I think this warning was decided after my last year's discussion about
mtdblock vs ubiblock for squashfs.

But these are raw NAND partitions and not mounted by us.

What is the exact meaning of these warnings ?

We have both these configs enabled:
CONFIG_MTD_BLOCK=y
CONFIG_MTD_UBI_BLOCK=y

Through this warning, are we telling that only one of the above config
should be enabled ?
And the recommendation is to use ubi_block and disable mtd_block ?

We are already using ubiblock for mounting squashfs volumes.
But how to get rid of these warnings for raw NAND partitions ?

Is there a way to avoid or we are missing something which we are not aware of?


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
