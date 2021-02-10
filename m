Return-Path: <SRS0=JPnc=HM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C864CC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6896C64DC3
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Feb 2021 09:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6896C64DC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p6+ncATnahpySu5ebYkymRzUqUxXj0YsA3JfU1MSOfo=; b=Duh7pFb7Q+uGyEffVUz4Cl9Zp
	RHD5jz8wiEFmrKjOji39nBUs7egUQyMtdKdNDqGSu9Ce9qEOQ/BEFfD7wj+QH/2Yx1ieFVUQ1bqbW
	wKhszLprRd5i1t6cjO1eYTjgIpkwfAThCuo/rZL8Mycj0VHzKk3VfgmJGJBXQaz/gElwHycjlG6kR
	V3bv473dpniKv7MH4mv0IyMS7XD+tee3lYHY3gOxfls01gYFnYYdgLt/8NeX9dep67l1ymgpOf8Kx
	2a7O4YjmrL4nt92aEYXjJ007/Tye/RfzIqmnMqWdGINu04aR9MhLdjqaSzKCtHPZPGhl9M0yq0Y9g
	4Q/qmVM1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9llu-0004as-5x; Wed, 10 Feb 2021 09:26:54 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9lls-0004Zx-Cf
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2021 09:26:53 +0000
Received: by mail-qk1-x72d.google.com with SMTP id s77so1007189qke.4
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2021 01:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUW14oJzJdjUDsWV3MT8TacLVCR6XNRBOmwlUylJ2+c=;
 b=U4em3IxHTV50wQFHjPqesqYw8TGDsG7a1oWORpg58HAVmiN2sv3MZtkapciT2b7lH1
 Wjp1cDuOnzCB5F11vvVK6V3dfUW1YTfENfJ8BotRI5GduBydaKY47npcPQostoEW8VQL
 zMnjHh01RVeQqwnV4JuiNUWVgzyU7YLjVmBnYQCStgD3y1nDs5oiIiGoNVphECgU0R/8
 tmeo9WiW+k/4gr1D+bbdjSOkSNDwK7NrTBioPzLtqcYL8xDu9szXFZhn2AjSZSF41Bl/
 tFEjMLvTNz60jbzxPc5OHJPnGsS7KaR5+vrE3icFaWlvZEWrgauXuCKXllnc2OmWdIPd
 nvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUW14oJzJdjUDsWV3MT8TacLVCR6XNRBOmwlUylJ2+c=;
 b=q4GO1PEW5iHjmd51lDdelXuZ8TK44h7xxsKBu+JQa400O2FE2jJ5l+35vZw9X20Hlb
 /3OLWW+QsD6E3dsb9nxELy8OUOkqEdFsc8NOvO/OqIpcwC4cVm+QyZP8T8khfKavVMR8
 bwq/zKOEEg8uk6etsMrrKzPU9QvfXPpL+hQFnbpX6ahtKecUENpmHsbjbp6BygKt0EhM
 457e2hlbMEesBSaUdMSYXjoeJFDqg8lMatrSgj9rtopyMmY8pWMQpWci2EqH6iuwTGXv
 WT68eEC2JwGBn0y9G7TGuoTnyK+udAt+kltZkFvMGh7YSbSNnec5d0CJ3uU33KJd7lva
 c8Hg==
X-Gm-Message-State: AOAM532J7YCpX2YKoRpz1XS4CC93QN7Jsz+3D0wYalnxupFdw7nEy/HY
 b0KidAHabZmyapVs/469s0Xrr9rkPTQYLgoP4nw=
X-Google-Smtp-Source: ABdhPJyIwGeOqc7DiQL1c4I1ykt2TQm8Fn4owHUTOPvymT/wzUWXJD3ujPIriVeS9efqPosT0c7+76FM6t+5LwxXZ5M=
X-Received: by 2002:a37:2781:: with SMTP id n123mr2562606qkn.56.1612949210365; 
 Wed, 10 Feb 2021 01:26:50 -0800 (PST)
MIME-Version: 1.0
References: <353c6d02-5426-81fb-c883-d9b399ea3111@microchip.com>
In-Reply-To: <353c6d02-5426-81fb-c883-d9b399ea3111@microchip.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 10 Feb 2021 10:26:39 +0100
Message-ID: <CAFLxGvzz1QZifE_CJOWXW3zyEmPgw_jhWeygx9R7DrAASsgn_A@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for v5.12
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_042652_447515_3033B382 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Feb 8, 2021 at 7:42 AM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Richard,
>
> This is the SPI NOR PR for v5.12.
>
> Cheers,
> ta
>
> The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:
>
>   Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.12

Pulled, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
