Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36135C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 21:57:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C080E611EE
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 21:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C080E611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uu+Q5A8888K9711J+0sNGTXXxr2SFjgxbJc7D/+8mgY=; b=PSObLqlmSxP7exLI5bfLiVjX9
	dLPGP8cBx8qUZir+sixbqNXDbFOfPt0sHV+XRgfz8AXPLgHdX7Pj/aqLltAfszwYVVZ4zhyrrVaNY
	Tl9gjlpVz/988rXlJrvbX9A7qITPrUAtPbtQhaGQ3EyAOLeiyAW60owKFUIU4Kbt0I7N4aonArI3K
	GTHXQcui4is/H5RvVHUF5rMsSe/dL4PFI6CzKBka8PI1JKeG76sZgM/evnyN+pl0X2Gr/XBWxBXGQ
	HeHod88LA+Icl5Q7fud/a7LNdHsyasdDlGvOHAroE5NpBKjNCXALyIJJOanqy597Fti/4ZAX19J9t
	qOjSBndvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUGAR-00679w-BZ; Wed, 07 Apr 2021 21:56:55 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUGAL-00678f-Bn; Wed, 07 Apr 2021 21:56:51 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id o11so5628980qvh.11;
 Wed, 07 Apr 2021 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4tTVq5QiH2Xb0EtjOJdc/qbW2Gofk9WYRP/7DRJHO0=;
 b=O7NDxYVuwAMnWgiVVttXejh4DLzj8sWFNSk+KEwa83NxE7eAytHpw7n2uNfa2AIXXz
 iPzhO2ui5k1LsxiT1nXtMYy8g7jL/VAjbdpmETMXeRlnFXGejoWFlcXzemUYc/BTeVPk
 ltGCiBL67Wna23PGYD+346N4FgkXHw5JYCXR1eMjLBIV+CPrgzx20p4F/Fot5ciG4h3P
 ac3m6O6t1xQ4gGWan3VHUsgbzqt+4cxP3tjVUaCJ9tRxya75Y+xnXAm/ReclZcNgotV8
 AJLRsbw2v8zZ+7ntTeFWD/jQvO0Pz+dXEX6I5+H0H/TI3U7DKdDDDkdTpmenJpPV9CwU
 STVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4tTVq5QiH2Xb0EtjOJdc/qbW2Gofk9WYRP/7DRJHO0=;
 b=XDcBoXUGhNsoL+gtFEr8wIhVvjRvLNQ13s/7bF4UONowr/7bDC+6iIN3AmiJDsJ6fs
 s3fVlcvb5cuf+tfgwNJNtRYDcJkKaJ97oRZ6Bo4sEb22MklrSsNclOJNSHT15auHPmQg
 QjPUSWGKgNWv7jsP03NKZqEFM7UBGGzK72XeAqJryEHWy6EEi4dYbAgsxGO5116LJIoU
 STcjn3hqU0Skqqm/o6IM3L75PnUwLCj6yWMB3ed31HzDz0WA+xJk8jo0Byy0iIx+wLBA
 ujfWITIGIxslpt1vGbTayGiqIQ8R2eGvwspR027TAgk04Y5UCNDDzkkT0JyNON0jHJPF
 oxfg==
X-Gm-Message-State: AOAM531eahilp006MeXXuA0UIkDyAafq2IA7YgELi/3sXSEtjOtVRdcB
 WZFHvWtpH3+35zIHfXIpyDAP2nd7W4m1sWwD3kNLP/MX
X-Google-Smtp-Source: ABdhPJyM6dcr4EsiCFIevT/oXml3V5GAPPZm4YReJNO+oNZDPRbebmQA8yrgtrl+4VGXuh3c2EX4KM39RkJ+61drBLA=
X-Received: by 2002:ad4:57a5:: with SMTP id g5mr5804051qvx.60.1617832607707;
 Wed, 07 Apr 2021 14:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210316085214.25024-1-guochun.mao@mediatek.com>
 <20210316085214.25024-2-guochun.mao@mediatek.com>
In-Reply-To: <20210316085214.25024-2-guochun.mao@mediatek.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 7 Apr 2021 23:56:36 +0200
Message-ID: <CAFLxGvygphmHbhzHJmSO=NQFO_02oSamXVjC5Loj2nCcQWWYNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ubifs: only check replay with inode type to judge
 if inode linked
To: guochun.mao@mediatek.com
Cc: Richard Weinberger <richard@nod.at>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_225649_461065_A2FFE7E3 
X-CRM114-Status: GOOD (  22.49  )
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

On Tue, Mar 16, 2021 at 10:00 AM <guochun.mao@mediatek.com> wrote:
>
> From: Guochun Mao <guochun.mao@mediatek.com>
>
> Conside the following case, it just write a big file into flash,
> when complete writing, delete the file, and then power off promptly.
> Next time power on, we'll get a replay list like:
> ...
> LEB 1105:211344 len 4144 deletion 0 sqnum 428783 key type 1 inode 80
> LEB 15:233544 len 160 deletion 1 sqnum 428785 key type 0 inode 80
> LEB 1105:215488 len 4144 deletion 0 sqnum 428787 key type 1 inode 80
> ...
> In the replay list, data nodes' deletion are 0, and the inode node's
> deletion is 1. In current logic, the file's dentry will be removed,
> but inode and the flash space it occupied will be reserved.
> User will see that much free space been disappeared.
>
> We only need to check the deletion value of the following inode type
> node of the replay entry.
>
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  fs/ubifs/replay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index 0f8a6a16421b..1929ec63a0cb 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -223,7 +223,8 @@ static bool inode_still_linked(struct ubifs_info *c, struct replay_entry *rino)
>          */
>         list_for_each_entry_reverse(r, &c->replay_list, list) {
>                 ubifs_assert(c, r->sqnum >= rino->sqnum);
> -               if (key_inum(c, &r->key) == key_inum(c, &rino->key))
> +               if (key_inum(c, &r->key) == key_inum(c, &rino->key) &&
> +                   key_type(c, &r->key) == UBIFS_INO_KEY)

This change makes sense. Thanks a lot for hunting this down.
It will be part of the merge window.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
