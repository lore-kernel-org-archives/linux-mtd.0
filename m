Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5490CEBF8A
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Nov 2025 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5mVpfuB983ExScaVkZN3uzZ0JzGb1CYP65OXn5/Cn4=; b=JPzJ+5A8C/+cJx
	VIQjrcKB+gWQDzQ+X6O2wiSesn5cJdJETL1VuQa4VfYcE2Zp2V5f4UArV6kRV2DFXNzEZo/x2RA/o
	7LCruGki/4mlz4bEYj+FWkuW5f+H8rLw2viFAM2Yb70kP1pBQwJLxs6ELc2OoFZQGFV0a5xdxI71s
	OZ3KWdVV42yUsx31aUOqsbyl14vSzgymet1lbrfS3CfKxVubwwKNHrhBFhlgMZONhUdgYkcjsqzgM
	fcjeFsFgFaPofZE1+HybvpVagdbpoYFRRgLf2jrnabXCbwESXYRJZYgz/16GTLt5DhHxpX1V0Ce66
	b13cDrXAjm71DHNMv0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKY2Y-0000000ETm1-13f0;
	Sun, 16 Nov 2025 08:23:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKY2W-0000000ETlb-0K4Y
	for linux-mtd@lists.infradead.org;
	Sun, 16 Nov 2025 08:23:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-298287a26c3so41284025ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 16 Nov 2025 00:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1763281395; x=1763886195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M4MaMBAoduJmljAfpOLsOwZXGopJOVWqjmgthPn26W4=;
        b=vTZXmwVlJ0ksDhaF4s5oTI8AWZE8UCvFyuLjQQqn0gTdXuZpN7j/KFx+mdcnhpV+Dw
         kX4493ejygP6szdrKQbv+PaA5SmTikiUIEXJHcdaaHdRlSyUCBqmGLsEdFdJ+BbNjSS6
         zFPPFnJJrc2n0zE/U7VoQkPdvlZjbMnEGxvxZ4W9w96KPlPF/lzpt37OtDXsgTOe/sK2
         hJy5eL3uINbxv9DRkG13d451yW4OjywssbNqQtyM68lDzoStH9afG5IaX2L52ls2Lzzj
         /sZKmFjPwl1Om8C4nxU9nOuuj6RKcubbvuyH25PSTCPgY+fG24+UDS7P1+HEgtxNRvP6
         5NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763281395; x=1763886195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4MaMBAoduJmljAfpOLsOwZXGopJOVWqjmgthPn26W4=;
        b=IZ3ExwHqYZC2Lsbxatiz3ue3xkQXuF/namw7BXU2lA+bL0utBXd+nMroY1zxom9D6W
         OvnTV/O9GNEZU2cNd7/0oPYVPm0DXCpmoDmPLnYhsCVv9mwJUMQFLSbiLIEtMTraqK2R
         j0vH1gBYsLR16BT5hPh8SDAvYdzz6AcbWxtrQzWMJkIcFL0F2nIHv+IHF8ZaDYhjm/L+
         6dZeVMFNrEwvQqAO/i+bON2705ipxNv5gYyJMNN1Fjohr3U9H9YOV1yoXhrax02hJehL
         BbT+HvsLkjc0pOsBCzMD8r5bSJHtm4mU0/Np47oaGRAQilEPhJ5UafRnAp6t7GL8V/1R
         nWFA==
X-Forwarded-Encrypted: i=1; AJvYcCVnm8KbBwTuF2xQYwsii0Nrhg5Mrr2zxMHRYbD5Rj2fZhlTr82LA2gMdWyI2XVU0JUcQNlfX5T8JWg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn5B8EuzzQorHcnb/2YgD8sUAuhkW6wTjrXuqR9Ic3Ou6XT74l
	YqkOPD/MuriTfH1NJK3/4kYYazg6QZejZ40At2xxD1iyOBqFRvHLSuaVKYrhcgF4JAg=
X-Gm-Gg: ASbGncudYQqtX5iwHLZnQA6FZzAO3wgachDE4Ol8leo4ZOtkTVkCkFBRKGLqDHz+M3u
	ZAokrNT7MJiNFmsnoONA+tYvgNoPtMhOToNmp3NoC8dCgvm0GVGikRoeORIw7c/aF4kmn6gG6Ls
	KogQ+qjkd+6lmEB3p3rKlhZ/eU/8GBq+Ndu4KYOTvoU6/IgkAHVcI4tHjFnOAL3H0wWRdGVXj1C
	/ZJwL4+ortomek8X/e1S4Vd899GL8QJBQ+O2EgSPfEc2v8h7Oy/3k3sWTRZpFRPncPlCLnKs81U
	CJNpkTMy9g+wclpg80uTtAgC+PMqOHDzRWdh9bN4/946hSxmdEoqcfyffynIIXxZD8tiChtbH6D
	MQHgDd8mGhiPt9LZIRN1xmhcX2VVAymO6AyyWuez85S/3V2xB3c8PTfMS6jjTHYwRQv7ulVoTwC
	dcpUxNP+30ysbHYYPlA/nVBOCqyPeoCSsgVU8rFJ7/EvoanP8lZddY9lgA5fzZxg==
X-Google-Smtp-Source: AGHT+IE2kISBEpmbZV/bnZzdrwmOacrEejG6ljtHkn9ZRcGe++TC5tzXGzGVsKaVV/gcvGARY/ZhHw==
X-Received: by 2002:a17:903:41ca:b0:294:ec7d:969c with SMTP id d9443c01a7336-2986a769988mr112616935ad.49.1763281394800;
        Sun, 16 Nov 2025 00:23:14 -0800 (PST)
Received: from dread.disaster.area (pa49-181-58-136.pa.nsw.optusnet.com.au. [49.181.58.136])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29864b00fc9sm79958015ad.40.2025.11.16.00.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 00:23:14 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1vKY2R-0000000BUhZ-3a27;
	Sun, 16 Nov 2025 19:23:11 +1100
Date: Sun, 16 Nov 2025 19:23:11 +1100
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	io-uring@vger.kernel.org, devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 14/14] xfs: enable non-blocking timestamp updates
Message-ID: <aRmJ728evgFnBLhn@dread.disaster.area>
References: <20251114062642.1524837-1-hch@lst.de>
 <20251114062642.1524837-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114062642.1524837-15-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_002316_117196_337D4AF1 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Nov 14, 2025 at 07:26:17AM +0100, Christoph Hellwig wrote:
> The lazytime path using generic_update_time can never block in XFS
> because there is no ->dirty_inode method that could block.  Allow
> non-blocking timestamp updates for this case.
> 
> Fixes: 66fa3cedf16a ("fs: Add async write file modification handling.")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/xfs/xfs_iops.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> index bd0b7e81f6ab..3d7b89ffacde 100644
> --- a/fs/xfs/xfs_iops.c
> +++ b/fs/xfs/xfs_iops.c
> @@ -1195,9 +1195,6 @@ xfs_vn_update_time(
>  
>  	trace_xfs_update_time(ip);
>  
> -	if (flags & S_NOWAIT)
> -		return -EAGAIN;
> -
>  	if (inode->i_sb->s_flags & SB_LAZYTIME) {
>  		if (!((flags & S_VERSION) &&
>  		      inode_maybe_inc_iversion(inode, false)))
> @@ -1207,6 +1204,9 @@ xfs_vn_update_time(
>  		log_flags |= XFS_ILOG_CORE;
>  	}
>  
> +	if (flags & S_NOWAIT)
> +		return -EAGAIN;
> +
>  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
>  	if (error)
>  		return error;

Not sure this is correct - this can now bump iversion and then
return -EAGAIN. That means S_VERSION likely won't be set on the
retry, and we'll go straight through the non-blocking path to
generic_update_time() and skip logging the iversion update....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
