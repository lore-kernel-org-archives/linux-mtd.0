Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333F606A326
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uh1ve0Ta;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9umDr/X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mv862xkH3kE2XZ345iewn5a8yWmqfPGI91+0uDWD7/M=; b=uh1ve0TaJ9HEXPr38982Y8EJMt
	wkHV0O58fXZ4XX3InJDpbe6skzP3L+wwQo6G62scrbxzHYJ3eXklvjJHkuXA8HdNfo3fDjHdWhAIJ
	hjA/WwifqaLnqUQQRid9mcgiVIjsxJQjW+n6VvAP6fXGVCP+cIkZtzxoZEUHc5RPnyvvM3gzHtJXO
	3tMC4OSUBZCGKTvb6QauaPtGBHGUo3AO7q4p6wjL19+5uDoQqpJN8GNlv/xXkeK1XcqCckI6G22cn
	pST6hQYK/7KhvaNsqTPg09hCDCWKs/LdzZ32jqMfRek0XApdJap5Ba8Zv4UIaHTt7lz5Eux8wjW1I
	0LDBAZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPCN-000000041Ji-23n3;
	Wed, 04 Nov 2026 00:49:55 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPCK-000000041JM-3X7H
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 00:49:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-886e61fa30fso101054b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 16:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753391; x=1794358191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bumM81nPiENiLh9PH/Fm40C+VENRMD3A/OuAfI8Z4s=;
        b=m9umDr/XrC5mQTd+f6AgQ2IzkuAgtYcggkZeGrGo5DHDehcV4mPy7e5gwqTkto55aF
         J1hD5R2fjkK+3mHuu2OvquNtc8iwGq34jVgQqADBVyLS6Z4FMf3y2ehmpTfzqs83S/I+
         1Q0EUVSeW3sCvNBUzkuMFRRez8VxhH/lw0yZt6GW1S5zuUs1cW9Uocha+fmT78Nhl2PN
         5QFbZH1k1mzmWvCd9IZH0M1QzkxB+sC184UQ8LMVld7BT106CN1JClkbhz/FeU28zjQ2
         gv0exM5BrkhIlEjPFuu7Rex5S8RgTL0yAQKTv5zEyJqj3LCbCguoMEXJ02T7l/cYyDfy
         bm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753391; x=1794358191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bumM81nPiENiLh9PH/Fm40C+VENRMD3A/OuAfI8Z4s=;
        b=NbfzCEob0VrwEBVE2Q5HKWXgWMBMiY0S+Vk7F9t6dDnGFnnTJ+Iw1jCdlhwMSUXkfb
         vY2mocR+TadKV5ULr0XdJnPwf8o/FwtjuDLN6PmzcC0d1XHUCP7RlSSNeKc5PMCm7Jmg
         60rnF8FDUHbz6bJCTnFipNXI8SkO3dMUwYjAxsU3deZWPGbCj56S+vjdM030qDAG4+mv
         P2yuu64Yg0vi4LshMQmfqgTeOqHhF4QoUYaCIzufbiVXjPD25elMqwIsxbWOOLuD6Ucg
         Ekr17gguNQX/xXkxz4xE7KhdH8vroe0X5ksJCSuPjY1XTsqQGmree3KmdmaOjHgNSNvG
         TOPw==
X-Forwarded-Encrypted: i=1; AKwUvBxy2i4gZ3lVD9CISclEOAvPGlEEjrmbxRGEyFa2p7ZhpEgLtRrTYVJUcMSMB52zbF9Na5999rG+JUE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/p/dWHpkje9Qp2lt2LCeBDr2qrN32ElR0xKy0QyGJznaV3RcQ0
	uaBHYRv7LT9IS/ypDdJf5+xMxvk4zGARIdD7em4pg3Jdw3ggiNCZmhwI
X-Gm-Gg: AYBFou3iskCxV6tljKxdU2656J9aJMGgCQW0sqNV9/NQIx1Zb32pMJV5RvB0DnB3AEH
	BlH9LsfqpkBiD6n7gYEuc9ORqmTb6POq3xR2IvLp9KTxDsma4Pr1HGAXIUXybNzjzJS9VXK6u7s
	SAKj9OgQVroUF1W9YZTmsfHW3CuaoqfXvZdVhi0wTYFuftbt/UB+I+PW1p78cCxH+ClHewU5ld+
	neFB+BEmedVYof+aMA4T8woHqWC2mlPTnSIljaOXzRaUuccx7BNYhtYlGCNHrYvxSFAKXkDKoc/
	SN3zKl9RmHiOaeDWwbCrcdtBy5jFqy79sKHJnOmy4Qokynlkv4uXB3vzll/feJlAT9kkbwTrHjW
	wQ2GRf5ERVyHEpKoi+UQWKGJ2gWzXUYatUH3dIyGe5MRN83F54+tFYy1yjvXPUKNhvjAQ1L2mSO
	bEeEM8feYE1ZpIhtQP0+2lQL8fADe7mTf18zHEGrrKxj9vSVT+pvA2rpULQ7XF2rfYXwuGYuenP
	ovSTpItCeoXYYPj1G6sGnxY4Jyq95Sy+ZiiJP41j3CjruDGPN0OX/uhCnbW3l419jBgveRv+86K
	+wEbP9WHIbwoMwIg5E6xMkZ2Z363Tx+7MBxwurg=
X-Received: by 2002:a05:6a20:914b:b0:3e2:9470:5303 with SMTP id adf61e73a8af0-3e928953948mr11828504637.15.1793753391239;
        Tue, 03 Nov 2026 16:49:51 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46440cc7sm329325a12.3.2026.11.03.16.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:49:50 -0800 (PST)
Date: Wed, 4 Nov 2026 09:49:48 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 17/34] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <auqBLEvcurRZfGj6@hyunchul-PC02>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-17-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-17-2f44f64f0b66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_164952_884772_D8BDA74A 
X-CRM114-Status: GOOD (  17.17  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 05:07:08PM +0100, Christian Brauner wrote:
> With errors=remount-ro every ntfs_error() ends up in ntfs_handle_error()
> which sets SB_RDONLY without holding s_umount. If that happens while the
> volume is frozen through bdev_freeze() thaw_super() sees a read-only
> superblock and leaves the s_writers rwsems locked so every writer hangs.
> 
> So set NV_Errors and a new NV_EmergencyRO flag instead like ext4 does.
> ntfs_emergency_state() returns EIO after a shutdown and EROFS after an
> error and the write side shutdown checks use it now. fallocate,
> ->set_acl(), FS_IOC_SETFSLABEL, FITRIM and ntfs_mft_record_free() get a
> check as well. Errors while mounting still set SB_RDONLY, nothing can
> freeze the superblock before SB_BORN.
> 
> NV_Errors already refuses a remount to read-write and since
> commit 521978c4f444 ("ntfs: sync the volume dirty bit with the recorded
> error state") the volume stays marked dirty once errors were recorded.
> But the dirty bit may not be on disk yet when the error hits and
> writeback is refused from then on. So a work item writes it right away
> because ntfs_error() can be called with mft records locked, and umount
> lets a pending one run first.
> 
> Unlinked inodes are left to chkdsk in that state. Their mft records are
> freed with direct bios while the index and bitmap updates of the
> deletion can't be written back anymore. And writing to an encrypted file
> only warns now. It called ntfs_error() which let anyone put the volume
> into the emergency state.
> 
> /proc/mounts keeps showing the volume read-write. Writes through file
> descriptors opened before the error fail with EROFS.
> 
> Fixes: 6251f0b0de7d ("ntfs: update super block operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
