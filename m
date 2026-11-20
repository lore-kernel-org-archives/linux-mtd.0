Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101E606A32A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 01:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7XdplOu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	In-Reply-To:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Unsubscribe-Post:List-Owner;
	bh=eTjlcirEEs/ewpTYjZ6JHTxYwVaryiJcMox1v6Oh0Yk=; b=L7XdplOup1K6hI/yTlHPctuZTF
	M/ZtDl0sn38x6VmJ7GwUnWOFT3xNGjtIfG6anMtsYseIq7Itt5QV3NVYFtmrvSiMaq1WpakGBMMTT
	/aDQhTHvRai8Yf0GzdYqeMx70dNu1wi4MCbmbkjOhd3sktBW7/Lici9j1KI9mbpUeuVvIVFOxbPON
	dGR0rtVOKCVHSW9Pu83S7pwX7Y45Vu+lo34fCM0xD1xFxnyjUeh60oyppyYqIIR4taUDMZUoVxGOE
	GkkQys7zKA1gn0bdd5Gfs1k0NI+XnuwN8fLwn2BpHLrrHIDlkJoZAYMXFvMAgBwVy61q/seXom8IN
	gkO+zhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUD3P-0000000DnB8-33s4;
	Fri, 20 Nov 2026 01:04:39 +0000
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUD3N-0000000DnAg-0dk3
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 01:04:38 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5384e381fbbso462271b6e.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 17:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136675; x=1795741475;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+GRSYw+eVW91K/ZQO+BzEBFhG1XRSg4Wq0Me5iRIbCE=;
        b=xUPfu7e+lgI2h34nWyw6r0UN5ZINL07TfMsy3D8gHqsDF42lulp0llcTjvKG3CqMVF
         /SbxlBBEaiH3z+1+/QeyRbwiQ5pUqoaHogO3ZJoSH/zDj8VjPoaSZT1ZxhBrpWIgXfvY
         V4JB6SlMkf78mhpBK9WP+XyuecQs/kCcTIzfzy9Y8Hf4+cqr270BPeoZVt8G+2A8uYcQ
         21Jzo3yTH27TC+EhPYaRU6+DKuFBRwscjbnw7bSMsksC4MQdxfXFyrlLdAaBns9t+j1W
         3S9vEmM6Fdz6nVwdIecNVUrL1h1OVTSlECUV+U2kBn9Xj1O2pg2uKn+DsmSVK8pMvOD6
         P4Mw==
X-Forwarded-Encrypted: i=1; AL+hErEr8j9W1TzLb3xXxOHOXYIlFVVYgwK7ULDwyj6hMAftFkVegZSwSEPzHCvNFm/c/UJ6BcD2Y3EAb24=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y1bV1f1CI8XssXvyeJwqI/Jyzm9iXEfTcuvJs+qa0FSA7Jeeh
	tI87NKJ81dC0s4HXiAaBDsKkZI6LAqqumMHKKUa9JvABvLGGmypb6PszR1EFE7nzNN6yZbfZQ+F
	R+LzJdycCVkIFW2GjPUy/ZK8Z+DBBa1RBoLVsSSTla5cn9Skngr5WsoAAC4w=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fc9:b0:573:4ad5:7e4d with SMTP id
 5614622812f47-57a0ac2fa3bmr2495724b6e.35.1795136675612; Thu, 19 Nov 2026
 17:04:35 -0800 (PST)
Date: Thu, 19 Nov 2026 17:04:35 -0800
In-Reply-To: <tencent_7590135AEEA7D2DC2CE7F27E4DF5B8936208@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aff9ca3.a159c4fa.1dac72.000a.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: 847807867@qq.com
Cc: 847807867@qq.com, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_170437_217807_A9B5E859 
X-CRM114-Status: GOOD (  17.30  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> #syz test

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> Hi Richard,
>
> Gentle ping.  I posted a fix for this on 2026-11-03 [1]; it resubmits
> Lucas Jeffrey's September patch with credit, as his thread had gone
> quiet while the bug kept reproducing.
>
> There has been no response so far, and the bug is still live -- 44
> crashes recorded in the November monthly report [2].  The fix is a
> one-liner clearing f->inocache in jffs2_init_inode_info(), consistent
> with the other pointer fields there: a stale inocache survives slab
> recycling after the previous mount's jffs2_free_ino_caches() and is
> dereferenced by jffs2_xattr_delete_inode() on the evict() error path
> when jffs2_new_inode() fails after jffs2_init_inode_info() but before
> jffs2_do_new_inode() assigns a fresh inocache.
>
> I've verified with the syzbot C reproducer under QEMU + KASAN: the UAF
> triggers before the patch and is absent after it.  The patch is inlined
> below so syzbot can re-verify on current master.
>
> Note that the syzbot bisection points at an unrelated block2mtd commit
> (7b09acdc "mtd: block2mtd: add support for an optional custom MTD
> label"); the repro mounts jffs2 on block2mtd, so that looks like
> bisection noise.
>
> Could you take a look?
>
> Thanks,
> Shuai Liu
>
> [1] https://lore.kernel.org/all/tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com/
> [2] https://lore.kernel.org/all/6afbd91e.e6a8accb.234e85.000a.GAE@google.com/
>
> ---
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
>  	f->metadata = NULL;
>  	f->dents = NULL;
>  	f->target = NULL;
> +	f->inocache = NULL;
>  	f->flags = 0;
>  	f->usercompr = 0;
>  }
> --
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
