Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E28C388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 21:35:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C01520780
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 21:35:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AS+SE4r4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiFdfXn0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C01520780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4Ivn2oPkTabYRzTpe1LLCt+wOYA5rg7uV9FPm25znM=; b=AS+SE4r4rG3uXnPqK53U9AkYI
	HLGlSYM4zceJdoVhzMqS6T8eJgHJCT/QvHsqmPo+TR60nsYyCqrDOuZ+d7Tix99TlMjpk3VipID3X
	Si2JGPwlrheTqAIRFFjVt15MsGCmfU45PS1KU3PnXGFOI0OFNTSuuhpLKeC0LJbGb/815KNwXp4DT
	1rZ+OMfj8HrEC9hMHJfgkVNRQnRMRjakwMuWTJZtHky+1M2ZJVULb5rQuUXjZpubORCQh2JXVUo2Y
	A+q+EGcX+YTF82bIbFJxI8bil/dek94c62oeWeAdXpW0jGE4xAfwdQuoVZdQ63Bx5L5E2Vz9ZTqLz
	9+vsEcJHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcbHe-00014b-3y; Tue, 10 Nov 2020 21:34:34 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcbHb-0000ys-41
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 21:34:32 +0000
Received: by mail-qt1-x844.google.com with SMTP id h12so9734244qtc.9
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2020 13:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RqrVhYzb8a0/eQL0bLvdA9MvG4msw3Tt+QSyvoYvYys=;
 b=MiFdfXn0y34YBmXHg29ocMSB24QyE5LxOqXrRnao2l/bMMVUraEQC36Kb57Fb3Kq0I
 4rEzwiiLDnBrrXg9i0DtUQvxVLgzXongPU1fNmFslvjHlrHN56HSWLVaSdl8Jcl1yyLW
 FjARNDvwLCr6B3H++aFKANlfDgZOD2HYp0Vm8N7UDXDM0gVgxYn7Bu3PXA6mismny9jf
 qHa+Jm6+ANdpLM9YPIqZHEOq6x4fOFbe4TtQuWEXwoCF93NFnSacwLfdsv7AiZfoFMni
 g0Ft2G72dnA0mjWWywlg93Fkh054ZDV9/4DZeg+rSJ4rjAN+9e+N8mYmIMYwvZ7igwtd
 qn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RqrVhYzb8a0/eQL0bLvdA9MvG4msw3Tt+QSyvoYvYys=;
 b=aufftRezRotNT7h0mNpBmvF59BIBLS68e+/9pKVQ9dbUQQ2+O5uPPs61cMliWJcoIP
 EtM6dr0E+U6NGEPR0CiaQXcu4bPDbGgm65dvk/ZZG2+jTS3o3+YDQtn/sVt4IMr3m14n
 TygVp2t4/rDANbcC7NKGvhi4GIU2LvmlrlMNF+56y7XUTXtN5PvRaPMgtXKJlfnxAxgw
 OqOw4HcyJh9L1HdkbEX+bGv58CLQ5kt7LPcfaL+8V/XT10R+EsDCWmgnzfrKF5MQ/9+S
 w8Vq+/KnyRL4p3ljzDd9IDCU9MLCUaQjaAUq2L7+rvlGtYbaORsPiWgkMWZx+mS9Ca0n
 fFsg==
X-Gm-Message-State: AOAM5331j31RtHIriMYBam3LfcD3k3WkwVFGQiUWzcBRl1YySLP+Bdi2
 qxyTRXZErWQs1Lbtwb3bmqnVNygOENGkBohdyNc=
X-Google-Smtp-Source: ABdhPJxpaib4kGaPCwdyKN3MVlhJeEjrVro3/yy/4EKui/MjSKZ2G+EZXgpLlSCYjQBCs8FDM+i6HwHYbwueIVd0RNA=
X-Received: by 2002:ac8:2956:: with SMTP id z22mr18964042qtz.170.1605044069321; 
 Tue, 10 Nov 2020 13:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20201014065443.18512-1-lizhe67@huawei.com>
In-Reply-To: <20201014065443.18512-1-lizhe67@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 10 Nov 2020 22:34:17 +0100
Message-ID: <CAFLxGvwO_i31AF350i+9w-7wg25NToyVFFBcG2oHXW3m9sS+MQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] jffs2: fix ignoring mounting options problem during
 remounting
To: Zhe Li <lizhe67@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_163431_172946_F5468719 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: qiuxi1@huawei.com, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 wangfangpeng1@huawei.com, zhongjubin@huawei.com,
 David Woodhouse <dwmw2@infradead.org>, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 9:01 AM Zhe Li <lizhe67@huawei.com> wrote:
>
> From: lizhe <lizhe67@huawei.com>
>
> The jffs2 mount options will be ignored when remounting jffs2.
> It can be easily reproduced with the steps listed below.
> 1. mount -t jffs2 -o compr=none /dev/mtdblockx /mnt
> 2. mount -o remount compr=zlib /mnt
>
> Since ec10a24f10c8, the option parsing happens before fill_super and
> then pass fc, which contains the options parsing results, to function
> jffs2_reconfigure during remounting. But function jffs2_reconfigure do
> not update c->mount_opts.
>
> This patch add a function jffs2_update_mount_opts to fix this problem.

Oh, a regression. Thanks for fixing.

> By the way, I notice that tmpfs use the same way to update remounting
> options. If it is necessary to unify them?

If possible, sure. Maybe you can find a way to put the logic into fs/libfs.c

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
