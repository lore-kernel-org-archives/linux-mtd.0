Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F51C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LzUw7MvQRdAzlJZ/qAAK8CTWmpRoboQev2q19FIz6g=; b=iNM8XXbGOchJrB
	T1wop/CHjglhcf5N98GVDro7tEgHpaK9GHZzXgbOHAWTobctuBLbMnBClKCYpcouoP2xIcJvZ+pLs
	RSNsS6qiZY4Uqh1zLwgMjyMHlxBs4tiiPkVm/SBM/pPGSLgvjvUG/bd2tEAgiM3NhAg01s+lZR9zI
	+savrgJYrgxNHyrwQv3sj5sb3JZ8LI5Wc9dlplwEMr68TAUI2o0ifw++OYv7mcL2zEosHXFT2PkDL
	j0QGEH5PuoEiKg/FwtVCBMtvrNZaLNUkbPhpg4I/SEo8Q0yPl5KN/JW9okEEgth3u4X7hiTcNswDl
	L5Y1USX5FsM8ZT7i8x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFKk-000xpD-V3; Thu, 09 Jun 2022 10:24:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFKi-000xnD-4L
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 10:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654770243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6a5SsgsnTuFo9sIZWQwmUlikCgiuGiGF/De3NllGDd0=;
	b=O1xC9fxZOMxaqC6rSRf/wp7oRubAOdtuQF660ZO5XT5/cyF74PDWeE2QN9m27mc+BMztdJ
	4cTCEIEgzKecWwUfZ7+HFqcmlsf3bRPqSVsgzJFiymh+8vAQB/cUacDsI0Qr52taSElHs3
	mqthmRsXI3hdg1HfHwjn9aCD07YEUwY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-QDxIYIxFOoO7rIw0Ycbadw-1; Thu, 09 Jun 2022 06:24:02 -0400
X-MC-Unique: QDxIYIxFOoO7rIw0Ycbadw-1
Received: by mail-wm1-f71.google.com with SMTP id h189-20020a1c21c6000000b0039c65f0e4ccso1379044wmh.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 03:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6a5SsgsnTuFo9sIZWQwmUlikCgiuGiGF/De3NllGDd0=;
        b=GP2TwEqQe4gpy4BtYtspD3jQm6LvU5k0UzGgk7Wa3Hp2pSPf2+91DV0Ptz9fJJq/dM
         3QJnWC7Bs+dMVPE4z0R60dkEI9rXQeo/j4JBcQoh9Sz82xdQsM6UTDIktRehAzSDjK8j
         SVdt1+wG9J5RWoUbixLo1qABnRWAqSyRdyJKjLB+nbzS5ei722DqJyhY4bN1UxZY0mu/
         N3XdzoxwmncTOpuA6SRH7SUqmoAUm4GHgcveF2HsbbTHC12gGyzT/5zHkmOg4uFXcZDi
         HGTAKoNxNn/1PCvqRbmkKPhcL0dtRzgIFwwmMyN1tbtH/Z9aZXaHkmiTsKwhG3+qSAWv
         xsUg==
X-Gm-Message-State: AOAM5329zwIv5EzPh10koCtqic6uBFkY+pJLmXQnLncDGMOYjwqj4reU
	eF9wQH/RRaoiU63N1+5inRWnM6u6K/B1Ss7OU0p++fM2Qj3J8++oIF3lAVO+tlzY4BfrqxzcbWe
	dPk9hnId3I2gv4oVjkAT4akRHNg==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id m1-20020a1ca301000000b003929bc5203cmr2594377wme.67.1654770241337;
        Thu, 09 Jun 2022 03:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy58rh3fuuccVM2J0IS1QrE1vJ3CH41QyKYHa1IrWm/Rvain2xs2JDw35eE5SOSwtsykjkKLA==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id m1-20020a1ca301000000b003929bc5203cmr2594345wme.67.1654770240948;
        Thu, 09 Jun 2022 03:24:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8? ([2a09:80c0:192:0:20af:34be:985b:b6c8])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d460a000000b0021552eebde6sm17782568wrq.32.2022.06.09.03.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 03:23:59 -0700 (PDT)
Message-ID: <a079ed41-1978-0551-2b5c-6d61aff7ddf2@redhat.com>
Date: Thu, 9 Jun 2022 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 02/19] mm: Convert all PageMovable users to
 movable_operations
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 virtualization@lists.linux-foundation.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-3-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220608150249.3033815-3-willy@infradead.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_032408_270285_17000A85 
X-CRM114-Status: GOOD (  11.26  )
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

On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
> These drivers are rather uncomfortably hammered into the
> address_space_operations hole.  They aren't filesystems and don't behave
> like filesystems.  They just need their own movable_operations structure,
> which we can point to directly from page->mapping.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  arch/powerpc/platforms/pseries/cmm.c |  60 +---------------
>  drivers/misc/vmw_balloon.c           |  61 +---------------
>  drivers/virtio/virtio_balloon.c      |  47 +-----------
>  include/linux/balloon_compaction.h   |   6 +-
>  include/linux/fs.h                   |   2 -
>  include/linux/migrate.h              |  26 +++++--
>  include/linux/page-flags.h           |   2 +-
>  include/uapi/linux/magic.h           |   4 --
>  mm/balloon_compaction.c              |  10 ++-
>  mm/compaction.c                      |  29 ++++----
>  mm/migrate.c                         |  24 +++----
>  mm/util.c                            |   4 +-
>  mm/z3fold.c                          |  82 +++------------------
>  mm/zsmalloc.c                        | 102 ++++++---------------------
>  14 files changed, 94 insertions(+), 365 deletions(-)

You probably should have cc'ed the relevant maintainers (including me :P ).

For everything except z3fold.c and zsmalloc.c,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
