Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F4606A31B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 00:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q2f68XeN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhO5DKc4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qL8oYNyfcRRGWkG99HpMgvzgUa/eVVE1HxYwLYj9kXM=; b=Q2f68XeNT8hK7/KICxG+jmtlik
	JF1gS90K4e1WjFq/iajiy9GnGOyYJllBIB5aTDZ27I2mscaGoA4WPJyExOJC6eaqQi2C3hYYJy8QA
	vD0xX7c8x9Tj2dJ+fKQvrADabFRsyDfqqldmJ2UUMI92xwZduhVGjI6THWf1G6xdLtIMzLOV9G+NU
	wUnnh+Ndx4U5/U2ooa/sTuRwbJ43HlolVSs6ng5xHVHAF/r4LE4Rm5sTE+ciZiqjrQfJiHaBLQE1t
	g/ANB0+KdhpGTiSaqdf0MTJ3R+sA+iyi+rX/zpoxY/4GrEE92nRMPFn/59WKSIUc9E0cUZ2e2TjuD
	hX2JBSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPHt-000000041q6-2hBN;
	Wed, 04 Nov 2026 00:55:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPHq-000000041pn-3jK1
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 00:55:36 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso75102a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 16:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753734; x=1794358534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=RhO5DKc4AJyJKYsZySLb3d3JosUAkOhNBniLQ6QTjHRyJAsKOp40lVX7x4HqZIckjb
         GLB6ik8O+dUOLc7dO1vhp0jMzHt3en+6RhDjj0vkN4P79Z49TSxaJVREAicL1zxb4uLj
         8afhvApkH3GkN9047SSpi7xTntS3/GgDyHW1vOnnia8OGdfw0kt18/txrwCsyx0hGxiV
         tGDl+efXNZrKPiQk2wfIvIHCXDEwxLtGbrWttVqtVeVIMX2wBI0jmNYA/Zhx+375xzBx
         TtHNQZXJ0EPHbGNmy5YpX1UARaUoTjr5O7rImnaEJ/SzfT62zm5EvVGk66XOR8pmbVBz
         8kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753734; x=1794358534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=S4h0Z2LfYiWDroZbLQstFih/26RFoUj3bmRl+WSpDpCVbGNpAw5DJ7rrJcXcSIDGl2
         4CAGXE4FaUi02UrQy4UzCYEQQ88WHCsOFvETUQG4QMkCK6gHnPBJjeFyZgAWfiRxNhp0
         pHmMTgLCC2QqiX3WM19TzSn111cGq529PO83G4+aFEXVkfZ+vAPShrctfHhgdEa2Pzah
         Zk6KZOMXjGfcPsgTl9MKj+nwIqgJPHtsL6RVDpUO96vlgGbRMCQXOMiTGnnySZoV+IkU
         g6Zwiu8IBW57X15ra3EsW/tafmmo1fecIOGHK09t1zYcD5syCs2kaiVgfAGiDm4eRmAX
         sq4w==
X-Forwarded-Encrypted: i=1; AKwUvBy67iO4cjoRVsFE9X2rPOIAGEMG9z1CA0hvzbrbOMHXdU3mjEFcFPJW3dQs+iO7Cmnq24+KZ+6v/YY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Rr+08vsqyxUJTYiA6GBsWymdCa1szgZQjbrOYlAKTOQOCr1ni
	xhwuXKDk3tlgSylkTkE+xe7yv/9cYnQd2javqHJVNOJSZ6hiEhbSoVg7ZEZeS8l2
X-Gm-Gg: AYBFou2uvJFIu4kOvTYUlamo3qyl9Pai26jeybEX6MCawicOHtkMC53AJLhCETTzuPq
	a+vX9CLnoy+5uscFIfjFfBBaG+wv1dwS8a3gzJSOwYeiCbg1iT2cqCRVosrfN/XI/0CTRnM9kac
	3GEnKeteFCb1S0NZj7ftCP7ZCw0M7+F27tfjK6EhI+A+opLzSiX0MgmYowadD1ZCOzQ2y+a1mXz
	Bkep/LrjLv5+iPEo8MCDw3YPXPVaXniC2JpRtjkDFO1aZYXhHqI3wQlbcN4Xw65Coi7Q6Ududp5
	2Zbd5UKvd7+yujY+vgtt/yL32ij30vpNM5AapVeOuRO5Nn18fhLdVDU4k8jARFpP6JXl7bV6jNo
	88borbkCBtRfxodVtQO+iRLuf4l9PZqBYF8GIK4P8UZFRBztA1g4jpSTzMVrpdYVI/mbMA6DQR3
	npmToVdch6eiJ9EPmT9o5NkbQPWuuEdcta6l+kKISTdxQuLT+tqo3p3t53tUWTAgwxU+wozM7ba
	ldzD6lZeiRmoF4jFbguJY7DJ2aQpfanMNMCA/FpYBvGA9iLl1uA03KRvhJ70kDnNBRrezi4G5hk
	ADFk9RKw/lzo/KvjSw==
X-Received: by 2002:a17:90b:184f:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ae897e06efmr11479861a91.64.1793753733906;
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm1222403a91.5.2026.11.03.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Date: Wed, 4 Nov 2026 09:55:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 18/34] ntfs: use the generic emergency read-only state
Message-ID: <auqCgguXEsKCq9p2@hyunchul-PC02>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_165534_932596_0F35CB80 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 29, 2026 at 05:07:09PM +0100, Christian Brauner wrote:
> Set SB_STATE_EMERGENCY_RO instead of the NV_EmergencyRO volume flag when
> an error makes the volume read-only. ntfs_emergency_state() keeps
> telling a shutdown (EIO) and the emergency state (EROFS) apart so all of
> its callers stay as they are. /proc/mounts shows the volume read-only
> again.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
