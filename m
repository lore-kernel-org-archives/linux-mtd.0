Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08EEEE49AB
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD7wybLqPBoDyEsi9PkZE6HI5OGKv4PM2a8GVsCcBSY=; b=pruNjKRx3qOLg0
	hvwqfjrhPGzEcbz6m731XUW1kpT/hV4JVf0AVwz9TVX5iaDhtuKqUmVQBgrPpEckCwhh6wiA4fzcp
	BSUoOSjUEm43qd/gWKSNmPvWkHNo+amrfe6JUW/y3tiz7aZXuN0a3A6Qaj0HC97q6Lbl1ju+kUDR9
	ALQlzEY7hPsFGpYd5GdaQXp94mrjmf/xckPc2vD6wBWrmzs/MRAzzOZa9yFzxz5kG88SA4Pf+KMcH
	ws/QyGOsn5eJ5UGpJxKJ5F1up1yMP1cbWlmz0keFdFvoASc4Rjvru3MC5QhSi/N60NxKCm8+CYMdV
	1Wpc3O5lP5EbOJ/ns39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZekh-0064bP-37;
	Fri, 25 Aug 2023 21:53:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZeke-0064al-1v
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 21:53:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2680eee423aso841486a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Aug 2023 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693000434; x=1693605234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=;
        b=cH08dFt6/4c3wH/stFXC+uGu5D8z0Csp+c9btLL74n40FUQC+soJCMHngcXZEBLgzm
         qybrDAhkHNIQidm6McS9k7OAisvjKsYcisQszCCpar5CuSiRIpSFGB178B7PZGJmjIVI
         4C//pqzQHhkBzMUsweM/Ox4iwIPKOu4SLlyG1BwihVAd4isMoJvmKve8ppg0AFR80Lm5
         +9HwDLBwFdO48zPf3pAy2OfApTkcKybUvjmHUA0hm0UnLP/VyyPd03hkf4rprWixbIcJ
         VF2B37IJ0D+t2NzeGs35vYm6/AeFMMVd3Duqbo/sN/EdZ49iAcVRSUTD7gvcubzYge+h
         CorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000434; x=1693605234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=;
        b=eNbliZqi5/ppmRXhQ9TJ+3HPTgqtKlUi5109ZFvazA3bSisyENo45MyruJXY9RChIp
         gko2yVGgKHhwTtksi3QHyJa6Q1Q9JmmANuGziPhTTk5roaelwIbPmBQei4t1xJ1mKQop
         QC6BPeDBICRtSKv8gl6RNltYYYk39a5VzF4doxLDiHf5GSfabwvWpBg6JsAm3btnrTwC
         oov6Mof3upr0sIlf5wv+VLiINJTeW2aKAop3xocfJp90FpzO+NM2yEKU3EWbAu+MCchI
         WeFWxIM2BVaQkGyy3os/6kmGlMEvhbA6t1lkY+xHIo7kowxN60GV9TW3RI0wgaWz0S14
         z6pQ==
X-Gm-Message-State: AOJu0YyP0wpeQXk/lDxYUIlx3geVCxuosHb/bulNXjiY1UWDEMbf2OLV
	5oP6R3MJRgz41pqI0cObhKtOug==
X-Google-Smtp-Source: AGHT+IGuXiZpaiaSoWbg0vAVB9MheRguVETxlh6z74Aponrqbg78kQHVeidygYbMeETEncHmOPB93Q==
X-Received: by 2002:a17:90a:bf88:b0:263:5d25:150c with SMTP id d8-20020a17090abf8800b002635d25150cmr15563047pjs.29.1693000434105;
        Fri, 25 Aug 2023 14:53:54 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id fz23-20020a17090b025700b0026b4decfe59sm2177778pjb.31.2023.08.25.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:53:53 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qZekY-006V5n-1X;
	Sat, 26 Aug 2023 07:53:50 +1000
Date: Sat, 26 Aug 2023 07:53:50 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 24/29] xfs: support nowait for xfs_buf_read_map()
Message-ID: <ZOki7u/zJGmZtL6g@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-25-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-25-hao.xu@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_145356_636152_7A9085B4 
X-CRM114-Status: GOOD (  17.19  )
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

On Fri, Aug 25, 2023 at 09:54:26PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This causes xfstests generic/232 hung in umount process, waiting for ail
> push, so I comment it for now, need some hints from xfs folks.
> Not a real patch.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_buf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index cdad80e1ae25..284962a9f31a 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -828,6 +828,13 @@ xfs_buf_read_map(
>  	trace_xfs_buf_read(bp, flags, _RET_IP_);
>  
>  	if (!(bp->b_flags & XBF_DONE)) {
> +//		/*
> +//		 * Let's bypass the _xfs_buf_read() for now
> +//		 */
> +//		if (flags & XBF_NOWAIT) {
> +//			xfs_buf_relse(bp);
> +//			return -EAGAIN;
> +//		}

This is *fundamentally broken*, and apart from anything else breaks
readahead.

IF we asked for a read, we cannot instantiate the buffer and then
*not issue any IO on it* and release it. That leaves an
uninitialised buffer in memory, and there's every chance that
something then trips over it and bad things happen.

A buffer like this *must* be errored out and marked stale so that
the next access to it will then re-initialise the buffer state and
trigger any preparatory work that needs to be done for the new
operation.

This comes back to my first comments that XBF_TRYLOCK cannot simpy
be replaced with XBF_NOWAIT semantics...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
