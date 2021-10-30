Return-Path: <SRS0=MDdG=PS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B72FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 17:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7D5603E8
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Oct 2021 17:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB7D5603E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn/3kg8W/iiR3kc3nEtcXDhvORHNcbpAYgvVXTPAXkk=; b=4ajEwz0tWVfzGJ
	aQe9ZxQ8h4Y13DPaRWvrM1tn4ub5mufR83KK5yEtHfPIBleaRB3dxTLt+lnTYRwgeulP119DcMcHY
	GrjENHmCZs5ZqIhPZ8QjmHY+e9jk3KTy9mPzeMH8rGiavorQUS+Lm7ZFlnWzItmHS8xBlsDLichD8
	O+YcHyiHhXexmACqoJxss9J1DB203WNiTb5uI7rw1yHft2xrVxrfYPjG+ibBV8lFBRql6L9P2ym/P
	klohFCScKi2sS83KScmML1JQP9hAQDw6axQ7N5FjqdizQXTLle0ywKeoOOu1AyXd0ZoG6kN4iQBhP
	Vp7b2K+Y76mGYNALvniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgrpv-00DHgs-Ql; Sat, 30 Oct 2021 17:08:07 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgrpi-00DHbw-H9
 for linux-mtd@lists.infradead.org; Sat, 30 Oct 2021 17:07:55 +0000
Received: by mail-io1-xd32.google.com with SMTP id g8so15112149iob.10
 for <linux-mtd@lists.infradead.org>; Sat, 30 Oct 2021 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=cj7b4WzzJcmZ+tVCjhkRXyXcKv7YSLzrxMjWUHMImLY=;
 b=Wopv4tcWqOAJZGqYx1oWAbH++R5QUK3biTMI/xiKmgq8kzd4BjfbTwqyki2cw/dKMZ
 zMePBAMmf+SLZ1e8obk5O2B8EqEDPivRKlRqkehfknMQ8MNLufX0ul/cJWZhewILt5Oh
 6lHlndFiey7eEaiN0hgGC39LpO35JqvHs71OpDs0TY9XL4bVtIavn6nIEfmea/hq+LZm
 LUd2MMSVR+UBeThxm8no9AVI+Lkwbvjh/Wd3YPAJax1gQlPv8O8NjJriy/LoIbj10SRd
 9zfUre2XtVMt8acixbfHpVQ/bS6vxPEHVT/7jgMGiywvDrcUkISQerA52lYJTtjCW/Wj
 XOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=cj7b4WzzJcmZ+tVCjhkRXyXcKv7YSLzrxMjWUHMImLY=;
 b=3rzA37Vh15wg2evAmna5W8K91T/E3u1rL6gfAC0asPFoX5ig3LHJfIKDVfbsUk92sf
 maPZRw/UB1LamJtifS33yuiEobT43CEyf3bOXKzwi4UDbXrxTzrhk84bjL5m44Pwze/A
 MDQ5elgmazV4PNHA2ZSqr+9mB5ZVdgNS1KmW59ySS+ohWMLovNBdYxudgLvruw/jqRSv
 Mt1PNNlOyb1k7tP8PXNSjbAkT2mFwumdAm6ndNq8yEnl3MxY2hKJiODI+bQYYRRGDE44
 c+l/SwZPt4hWrs3swE+4KRYfgSDUfonHXmfWu8ctuNN0OoWCEKGb9kr7jeo/C3f1was/
 xMCA==
X-Gm-Message-State: AOAM532uCh8yib5oDu1AMHyd6v7wgQyE49h0myzQSFzTh5PP8TCXXr1V
 YovcqhVFip5AfWHVV26nb1ytsQ==
X-Google-Smtp-Source: ABdhPJzTVX/ZyGI7Pmdgi3Ji0UX3geoz9OnmwOkoYIKCEwZOPpGwJ2EvLzYUymZf8Uzb5XEpGHWwDg==
X-Received: by 2002:a02:cbb1:: with SMTP id v17mr13623686jap.51.1635613667880; 
 Sat, 30 Oct 2021 10:07:47 -0700 (PDT)
Received: from [127.0.1.1] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id o8sm5504963ilu.2.2021.10.30.10.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:47 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: vigneshr@ti.com, richard@nod.at, geoff@infradead.org,
 vishal.l.verma@intel.com, kbusch@kernel.org, sagi@grimberg.me,
 minchan@kernel.org, mpe@ellerman.id.au, ira.weiny@intel.com, hch@lst.de,
 senozhatsky@chromium.org, dave.jiang@intel.com, miquel.raynal@bootlin.com,
 paulus@samba.org, dan.j.williams@intel.com, benh@kernel.crashing.org,
 jim@jtan.com, ngupta@vflare.org, Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20211015235219.2191207-1-mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
Subject: Re: (subset) [PATCH 00/13] block: add_disk() error handling stragglers
Message-Id: <163561366669.77445.6593243934116934390.b4-ty@kernel.dk>
Date: Sat, 30 Oct 2021 11:07:46 -0600
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_100754_580714_E0DC9C17 
X-CRM114-Status: GOOD (  11.99  )
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

On Fri, 15 Oct 2021 16:52:06 -0700, Luis Chamberlain wrote:
> This patch set consists of al the straggler drivers for which we have
> have no patch reviews done for yet. I'd like to ask for folks to please
> consider chiming in, specially if you're the maintainer for the driver.
> Additionally if you can specify if you'll take the patch in yourself or
> if you want Jens to take it, that'd be great too.
> 
> Luis Chamberlain (13):
>   block/brd: add error handling support for add_disk()
>   nvme-multipath: add error handling support for add_disk()
>   nvdimm/btt: do not call del_gendisk() if not needed
>   nvdimm/btt: use goto error labels on btt_blk_init()
>   nvdimm/btt: add error handling support for add_disk()
>   nvdimm/blk: avoid calling del_gendisk() on early failures
>   nvdimm/blk: add error handling support for add_disk()
>   zram: add error handling support for add_disk()
>   z2ram: add error handling support for add_disk()
>   ps3disk: add error handling support for add_disk()
>   ps3vram: add error handling support for add_disk()
>   block/sunvdc: add error handling support for add_disk()
>   mtd/ubi/block: add error handling support for add_disk()
> 
> [...]

Applied, thanks!

[01/13] block/brd: add error handling support for add_disk()
        commit: e1528830bd4ebf435d91c154e309e6e028336210

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
