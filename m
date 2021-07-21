Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB7BC12002
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 17:30:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA146023B
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 17:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA146023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igq4R3UiXbPHc5FktLQET2x/w3XaynBHnoEtHpve5g4=; b=qjk7b0ot7gyzpN
	qmGE62f9VjwD1UkR4THT+5mUZcZ3TlJ6pA1eeg4JaBzd21Gtgyy8c3aFF/Q37FNxBK2cwasqGqc1V
	zN6beBfSMQvQfdK6WmDzRqVNZDCJQZm0OgqrhFgTU2j+oR1N0SkahoQI+lf1WJJHvDtoUR4NOLpkE
	m2V/1i2ls/Ah4CSnLff97gDCmbag+Y9WTYYXCw7yjmL9dShS++9gzy7lp0TE4E41j+qxzaLMLsvwK
	iOBED1L6MqocBHMX1NmZNbNqpranZsCuxbWIZ00BfVVtQeIBrO+kbgg5AS7hdGvZrJSVzRndAlNnt
	pV4OpSkvZOBkSEd0odbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6G2W-00GjCK-Pf; Wed, 21 Jul 2021 17:29:48 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6G2U-00GjC0-F6
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 17:29:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id qb4so4357553ejc.11
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jul 2021 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XP0iAPTzXCS6/hXN5afn3pCSvhDsfbRfFxq+vdKUGU8=;
 b=TWWXO8Wznrfh3IEb+hXEjiNusl0FD/72xovtttyL5WjrF/Ze4BgxjMwxkP2/KJB6Y8
 m2dHFVKSV7yt1eRra8XALcC9TGq+9kJ97VYMxIsW4EIdmRBKJqMPhsf+aeB9vzl4MCcQ
 g41p8gXVEk51SiDFzZ5DpUxLteBk48kOLOMLHiy2mlSDJdD6qJgB0a0+fgSw/Qb/sKhF
 DaH3TG9QNVSHHSm1pOHI7yNP2csO37NZv8yguDkDVZELfc05Cl1r13sG58hnLI1vhnhZ
 92Uoyj884HVys25GJ2canrGoL0tpmS+CYhOKNTtJ1ssWIgAPTSMjcDba/h0+sgCarVXA
 DS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XP0iAPTzXCS6/hXN5afn3pCSvhDsfbRfFxq+vdKUGU8=;
 b=OrDOmXdb1gvgal89F6jdS6WTDHspZhNG1q2P2UysyNof9UjGrg3whvf+lH+VU5z8lj
 tlHby/DFonEH3dS3HKYKs02jivy/E3dIEzwkgwoHXovLZf9IvSNo7B8Zzn98fKl2MO6u
 mMHDuDlZpeEIV4R3Ff+QKpv3LctczZw3JX3EHfapmrr4n18L+6i/vbtstpKQ6WdEHNs3
 eHoWQ9lpxWThOa09LqclVQxA8wuszTqWs+RgY1RtN7zJ6547ohrYtNimWCfzFVZ++GIc
 er8FxBuskaNdlPQnf8JsUej9se201BbefSzgh9SBYSd50xqPtN2+RepNuA9SMeJR3/Gp
 KUMg==
X-Gm-Message-State: AOAM5328Op65sIV1P2bGwPe8cpjIptPqBLAL7kNV00D3oF6f5+FL8RP1
 IArLIGX0nBwQLixeYfqpE90k8uusGefiukdOtmI=
X-Google-Smtp-Source: ABdhPJxVd/rBQsk/2obbH5UlqtV4a0WbF0Li9IC6O9OpXl6Zt+WB0yfa2RTbxjYDls2VAOQ7rBIZWAci0SlwjWWDCjc=
X-Received: by 2002:a17:907:2125:: with SMTP id
 qo5mr39615957ejb.252.1626888585194; 
 Wed, 21 Jul 2021 10:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 21 Jul 2021 22:59:33 +0530
Message-ID: <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 dm-devel@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 agk@redhat.com, 
 snitzer@redhat.com, shli@kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_102946_546310_D93AF7B4 
X-CRM114-Status: GOOD (  15.82  )
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

On Wed, 21 Jul 2021 at 22:40, Mikulas Patocka <mpatocka@redhat.com> wrote:

> > >
> > > Try to set up dm-verity with block size 512 bytes.
> > >
> > > I don't know what block size does squashfs use, but if the filesystem
> > > block size is smaller than dm-verity block size, it doesn't work.
> > >
> > Okay thank you so much for this clue,
> > It seems we are using 65536 as the squashfs block size:
>
> 65536 is the compression block size - it is unrelated to I/O block size.
>
> There's a config option SQUASHFS_4K_DEVBLK_SIZE. The documentation says
> that it uses by default 1K block size and if you enable this option, it
> uses 4K block size.
>
Okay it seems this config is set in our case:
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
So, with this the squashfs and dm-verity block size exactly matches (4K)

> So, try to set it. Or try to reduce dm-verity block size down to 1K.
>
Okay we are trying this.
Thank you so much!!

Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
