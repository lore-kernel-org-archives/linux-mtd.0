Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1ACC0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FDFA2089E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 17:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGk/cM9V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUamGemk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FDFA2089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kztnf/c3TiJjsRyn0vZ13QAmrosREGprQKgOK5illuY=; b=LGk/cM9V6LYMU6
	115gUXn8KG+jkgrFI7WZPmDmU1tMzwdgtd7opESPWzR0L0im3y6GNAlLNn/zL17b4Wx6651k5CO30
	mRa6UCUCVMqrMbR6rEDh748UDlFXZcaMOPqJVvMQc8Ce5fD8b56D/8qiGAlAcUX2d1IpqofbJzfXY
	bsFiz8hLkwxN5XDF4dLl+tdFZjmot7uq16ZRjVldkydmQ05yZWaVVgfPvj4PJxXySJNk7J0sLDEwM
	qe2DheWs0B67wQjOJbDyNdtkElfetdJ+gnaVVuNAybaBZP8NDM7aiBvXoJc8ihWn5k+/Ihym22Of/
	xKwRFMI1zMyB2R1U6B3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsVtW-0003wy-0y; Tue, 30 Jul 2019 17:26:38 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsVtT-0003wS-0i
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 17:26:36 +0000
Received: by mail-io1-xd42.google.com with SMTP id m24so129986219ioo.2
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2019 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=;
 b=LUamGemkbRqnOVHbq7CXnlGi/lEYqOEEySiKtSrwXqEp6shA4gxXuseHjOaOiH3aa7
 q4CF5Eum/dqTa4wC00EDfSR4wSTPClq6Y3O6fnjnuTa8UISAGRv24/2prGpJP4yj+/5K
 pp6QgCoaOkGX8YfVQJvI0ldkf7g5Qtz5YPjBIm1MafS1QJbnmne2KPhWiFiOFjpLhpua
 9zkTIHWrBNLvn7Si20xo61CMzJCVm2tyy8IPzybo7iqfWECXz7HiHXR7qDV7Zs/ri977
 AjNYEbpGf5FVBSgWnRjBEI6oRswJ4WN7oBSH2Oh+cBt5ZquUgXtZtN3ILEA184MLtXtW
 bQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=;
 b=EoLYk6FOsPo2yFCk3YN7Y2tB1PvqlxbAZ+0goh5UCtp+PDNgLuM2WnsuXp299QZ2pC
 71DXnJOlw7lKvf+sEbLBX7IDyJZvfQTMoivwTbOg+EmectgZ/Z6NnxcuXOcHQjaqnPNM
 nQqFa7GzcyFxLDn4f3z8pOov2XcKteBZUDDmqeu8bQzuqteV0U/cuxVORvWWLGPSBRj+
 8XtHhX7CENLl6ltFZRehE/K/72p9TfcmQkPxm1XsGlnsZOOQafZ5nxCzVf/sWoPlCm7+
 wrD99EeWrsY3epEoDeYXuSsHS7LgdPuCEgfYk3e5CpVNhXFIqsEGOw4GMgGix/B22n1n
 BqyQ==
X-Gm-Message-State: APjAAAXCxP2QESxsbUswm9JtlN8RlSMEklRVTqd/v3iBU7TzHC5xh+x5
 ++KINZzB5WFZ+N6HdmOa+Mir/yOQYLnhfxOrTE8=
X-Google-Smtp-Source: APXvYqy+9zDOTHm2OHuBLA2soclNQ3YwB8p18dgCUYzErzvrXdSDbEEW8GCwNV3FQCvXOrwwAN9MF+uqzNXPUM4I49E=
X-Received: by 2002:a5e:8210:: with SMTP id l16mr81558885iom.240.1564507594217; 
 Tue, 30 Jul 2019 10:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
 <20190730014924.2193-4-deepa.kernel@gmail.com>
 <87d0hsapwr.fsf@mail.parknet.co.jp>
In-Reply-To: <87d0hsapwr.fsf@mail.parknet.co.jp>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Tue, 30 Jul 2019 10:26:22 -0700
Message-ID: <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
Subject: Re: [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_102635_061568_9AEBD866 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, yuchao0@huawei.com,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-ntfs-dev@lists.sourceforge.net, stoph Hellwig <hch@lst.de>,
 anton@tuxera.com, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 1:27 AM OGAWA Hirofumi
<hirofumi@mail.parknet.co.jp> wrote:
>
> Deepa Dinamani <deepa.kernel@gmail.com> writes:
>
> > diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> > index 1e08bd54c5fb..53bb7c6bf993 100644
> > --- a/fs/fat/misc.c
> > +++ b/fs/fat/misc.c
> > @@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
> >               inode->i_atime = (struct timespec64){ seconds, 0 };
> >       }
> >       if (flags & S_CTIME) {
> > -             if (sbi->options.isvfat)
> > -                     inode->i_ctime = timespec64_trunc(*now, 10000000);
> > +             if (sbi->options.isvfat) {
> > +                     inode->i_ctime = timestamp_truncate(*now, inode);
> > +             }
> >               else
> >                       inode->i_ctime = fat_timespec64_trunc_2secs(*now);
> >       }
>
> Looks like broken. It changed to sb->s_time_gran from 10000000, and
> changed coding style.

This is using a new api: timestamp_truncate(). granularity is gotten
by inode->sb->s_time_gran. See Patch [2/20]:
https://lkml.org/lkml/2019/7/29/1853

So this is not broken if fat is filling in the right granularity in the sb.

-Deepa

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
