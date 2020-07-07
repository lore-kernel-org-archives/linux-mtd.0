Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2EBC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BE22206BE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kERqELKo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vFExuLQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BE22206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwD+NsBbSNmYE0WBWGkVazsB2mfTgSpScTVgesiNkSI=; b=kERqELKoKvt49OkX2BNrculco
	+zxD8BxlTIGVcphTVdEjavWmxkpfDy8ZXgL4LQiOOuafEGnjQkeKOuIUkcGJKtOwWSWU3Nz88uKzA
	ivc+Q3Wt2L8OnTI4/Fgsjf07GoOdA06zM83E1sT0UT3ipus1hJbVq5pAK8MqQck6idW870FiykYfW
	NsEQJHMNw0CA/lAKc5Z0Ke63EoXBpKPA1a32pX28nT6saiZ15aBFuws/INBur5RN0F02VCjmExMoL
	/4slITXGFQymPorOsSWEZCZxeKqqKYygJ32nkZMgDmtAQr871mprzFxxVHEQfBi1k+OF/UJsWgFSV
	HtZemkcrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsm9s-0002PD-Lx; Tue, 07 Jul 2020 11:53:08 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsm9p-0002O6-Sf
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 11:53:06 +0000
Received: by mail-qk1-x741.google.com with SMTP id j80so37791592qke.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2020 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/lhR2DZXpozvvgwzQZE1TCPc3qqJrMpIFfl0B2ci+vU=;
 b=vFExuLQFOH/bXTR/xQJn75B8oonlcSiIttbkfBjYRxIChwEd2AR3gU2B1S+lwXsSRl
 R3WqH0yxCnRrY2KezY865zfBmTKORaxsXKfWcSiLF1SOD2peJy0N9Cewg7q5cYrnrwfW
 n1CgK+S/uqzPLW2XqkTUZVphPCEu2Nh+Ux0A51K52eQ2Z48jprlhtMq+AIeStSSHhh+l
 1h8Vprw543xz2CaF83OXxvIYtOvDUac7kcDUiR1nUI3nz8xk3rOEbwvXhCYNMA5jYckd
 a+nh9RXpYON2GH08oVNgGrqJNNmQha9h52VJ+2R3hj72ne8kjBQNbtj4coPkrSSH4q7U
 S9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/lhR2DZXpozvvgwzQZE1TCPc3qqJrMpIFfl0B2ci+vU=;
 b=he7hKHGskWjoR94nzzr0wFxrBM+sraMyQfa2VW4QOseIK/yBnjpKCzea/RoxENdL7I
 4mTkNcBxfUpxPaB34+4sJC5VbrJ4I7q5mGczKp5DBa/r8+K151hhPejdbOw3qj1Mzyoz
 NLgH0BXrxoHU12bEA8yA0ETf+ZKSXkGUyw2DXs71JvQUX4FT3RW2BlHOXt6zHw6dF196
 17RjvUvcRFFfLMiGKZ4bJU8LnVhLHlBzzbpYkqXnilWfWormUNPkuP5IfceaLvrFKG5/
 95O7OhiQtoQqOoOUAc2Fkm4Q05hiH6ddn2yc50ybDVaRDKPC1+3kK3mNkMDiM3zdQaIb
 nqMA==
X-Gm-Message-State: AOAM532QXLhFo5RsBOn8EUs0MPFOjmz2N4uyCtTONrVoOv1/Q6+d2+Uq
 bjR2aczUI7K+bTxYPDzGgOeiHOBCpQUJzQ8Mam8=
X-Google-Smtp-Source: ABdhPJxI0yK/3FTcBZrGCc+QfO7hVhj1GBMGcBdmHTMw0+jvC5IYgvfTIPEaDGxgMCOZTnR4yIJOJZHt4XFq01W7GeI=
X-Received: by 2002:a37:8b01:: with SMTP id n1mr51153237qkd.370.1594122784112; 
 Tue, 07 Jul 2020 04:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152048.1819867-1-chengzhihao1@huawei.com>
In-Reply-To: <20200702152048.1819867-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 7 Jul 2020 13:52:53 +0200
Message-ID: <CAFLxGvybobVbhS4zQSxSmq3xR40QP=pkyDG8j7jA8a6eOOKfHg@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Fix wrong orphan node deletion in
 ubifs_jnl_update()
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_075305_930642_D3811BBE 
X-CRM114-Status: GOOD (  18.03  )
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
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2020 at 5:21 PM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> There a wrong orphan node deleting in error handling path in
> ubifs_jnl_update(), which may cause following error msg:
>
>   UBIFS error (ubi0:0 pid 1522): ubifs_delete_orphan [ubifs]:
>   missing orphan ino 65
>
> Fix this by checking whether the node has been operated for
> adding to orphan list before being deleted,
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  fs/ubifs/journal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index e5ec1afe1c66..db0a80dd9d52 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -539,7 +539,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>                      const struct fscrypt_name *nm, const struct inode *inode,
>                      int deletion, int xent)
>  {
> -       int err, dlen, ilen, len, lnum, ino_offs, dent_offs;
> +       int err, dlen, ilen, len, lnum, ino_offs, dent_offs, orphan_added = 0;
>         int aligned_dlen, aligned_ilen, sync = IS_DIRSYNC(dir);
>         int last_reference = !!(deletion && inode->i_nlink == 0);
>         struct ubifs_inode *ui = ubifs_inode(inode);
> @@ -630,6 +630,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>                         goto out_finish;
>                 }
>                 ui->del_cmtno = c->cmt_no;
> +               orphan_added = 1;
>         }
>
>         err = write_head(c, BASEHD, dent, len, &lnum, &dent_offs, sync);
> @@ -702,7 +703,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>         kfree(dent);
>  out_ro:
>         ubifs_ro_mode(c, err);
> -       if (last_reference)
> +       if (last_reference && orphan_added)

I think you can just check for orphan_added here.
Looks good otherwise, thanks for fixing! :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
