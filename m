Return-Path: <SRS0=wpvZ=ZH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34366C432C3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 13:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0538F206CC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 13:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BVEaVih/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+osObYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0538F206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8islYYS/7ubqEtjuq/d3DtskE1qRij6oATjaAHxApto=; b=BVEaVih/P/AVQy
	dlCE7FQZIUeK9k/rtMsy8D4Gh4vDvawXy6zMaQcHYVYCBIr53kD+xfRLKkB4OvuhwrQdLgsX8XZp7
	2lMPBqTwXIvWciFmfxnTL5m/jnLjiFgOmfsLOvhL+5mYAs/jcl11zVfElVzAlvrz0wMIbHbG8JutZ
	mpMkxlxFsmECJfvJJobWahtMw4NnImJNEBz9TW0LejoC5WN1vrO4xdpkSN6/xI8650RJBUqm/vmRN
	08nvaxXuxYqPyN3Pu9J+ux3L61/zycWsfTym7Q0thNXFZTdiwBaBuM6WZDIjjRckc0bCEjVU2sAns
	doboTf1Nj8omn12lOhzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVbXd-0001Lu-RG; Fri, 15 Nov 2019 13:21:37 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVbXa-0001LL-Mh
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2019 13:21:36 +0000
Received: by mail-wr1-x443.google.com with SMTP id l7so10961163wrp.6
 for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2019 05:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gsJuRTfm0pzdP5qIgYrHTIKYOcEemQZJnf9+HD8U5I0=;
 b=b+osObYVxSvsu+1H3izI5Utot7rnQ3pmwHwA51mifYWIaJatC8XrYJEvdP40HXwBkH
 vVFqCGelUeAOaJb5NatPlUprPRetGvZpX1F7JHoDjXdKzsjEj4PljICZxGpbVKKO97i2
 L70V1xCk6fzlcqUk3u5axb7pAn05xtLoj46JGPweIbc0Ej/BiEM40mwTo0Vm5ICYavSK
 tnl7WdtNfc108S4+ggMDpRhiJ1fbPN2sZwtQq7BHiM7O89H4q0tkEv9gi+Y443YLse0m
 et3J2Dzhyelt2MTvv3NRrtF0iW91OroVwP4gnoLsmfbVFcIOYWGE1LPaH7Og1vhEK2Ag
 fsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gsJuRTfm0pzdP5qIgYrHTIKYOcEemQZJnf9+HD8U5I0=;
 b=SMHGogYlQ6j4IoS6yQMaRs1beJ55Z4gOLTs8sIZCcJN0ZVeDp8zzvzL+cQImOQ4U9V
 dvY4KfWwZmxFsGjTEvmLtE4bqMG0jRBdRnmsOdzGPO2uGIjcaEf7igiEQ7wm7AH0hral
 oRJXP6whVlbv6YC804fzi9gf409/q41nJyprndRV+7cyZz1MfDZ5LRFWAgoYTyQX52R0
 gfM+3qFDEbW1F1OZ3q2+NXAkJWSyzY7gmNLnbvVJbnpGoZWV6f/wmTW4zMO1kesxZ/RS
 92U5Vq0wnhtVDMrv5tiZynChoWVidN/1boVgP/1E1s1VuHMHfDZlCbdk4c5vgCeFVLNe
 FFVw==
X-Gm-Message-State: APjAAAUOJnmHvp4eooK/yZrlxR5v+gzHXZDN1sKmcQL1nYGFhcGMukMQ
 fWCttwtiwysrI+TXYifTPtk=
X-Google-Smtp-Source: APXvYqwa19cEKDifksR/7B+DiqFGuiVA1CAVSnlA7IatsJED7NDIaJftyJ7TAzxa9fVjE83KUhnYXw==
X-Received: by 2002:adf:e506:: with SMTP id j6mr15610362wrm.19.1573824093188; 
 Fri, 15 Nov 2019 05:21:33 -0800 (PST)
Received: from 5WDYG62 (static-css-cqn-143221.business.bouyguestelecom.com.
 [176.149.143.221])
 by smtp.gmail.com with ESMTPSA id w10sm9455768wmd.26.2019.11.15.05.21.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Nov 2019 05:21:32 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
X-Google-Original-From: Romain Izard <izard_r@5WDYG62>
Date: Fri, 15 Nov 2019 14:21:26 +0100
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] Revert "ubifs: Fix memory leak bug in alloc_ubifs_info()
 error path"
Message-ID: <20191115132052.GA9185@5WDYG62>
References: <20191024082535.1022-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024082535.1022-1-richard@nod.at>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_052134_737075_656113A0 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: linux-fsdevel@vger.kernel.org, Wenwen Wang <wenwen@cs.uga.edu>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 24, 2019 at 10:25:35AM +0200, Richard Weinberger wrote:
> This reverts commit 9163e0184bd7d5f779934d34581843f699ad2ffd.
> 
> At the point when ubifs_fill_super() runs, we have already a reference
> to the super block. So upon deactivate_locked_super() c will get
> free()'ed via ->kill_sb().

And without a revert, trying to mount a UBI volume with a squashfs image
on it as a UBIFS partition will lead to kernel panics due to the double
free.

> 
> Cc: Wenwen Wang <wenwen@cs.uga.edu>
> Fixes: 9163e0184bd7 ("ubifs: Fix memory leak bug in alloc_ubifs_info() error path")
> Reported-by: https://twitter.com/grsecurity/status/1180609139359277056
> Signed-off-by: Richard Weinberger <richard@nod.at>

Tested-by: Romain Izard <romain.izard.pro@gmail.com>

> ---
>  fs/ubifs/super.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7d4547e5202d..5e1e8ec0589e 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2267,10 +2267,8 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
>  		}
>  	} else {
>  		err = ubifs_fill_super(sb, data, flags & SB_SILENT ? 1 : 0);
> -		if (err) {
> -			kfree(c);
> +		if (err)
>  			goto out_deact;
> -		}
>  		/* We do not support atime */
>  		sb->s_flags |= SB_ACTIVE;
>  		if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
> -- 
> 2.16.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
