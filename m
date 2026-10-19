Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BFDCCF2DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 06:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+sb0rr3ZDZ0rjRiVjWn43Hb5P8eYYTYFrF8WOkV4qM=; b=NLaCOF7D34kZWo
	GCV8yDp/rcDwAA5Kp3SbTcEMD3ylwcDsVPjxBvIu4CtrIZ+xi6ii66l62bo3SHYpDgFEiFTWFOt1+
	DBTWbvxzmqiV4pv1ipJrtylmozW5OATzQEWau+Yl9LS3q/f2p3yvq5buivWRaKhSJ/DzbEtiRrH/Y
	fZpgQUwcNdPPUK0ZfbRprsj6/2S1KxEIW2YYnTu7mff48cfjNGGs4DNN4+PACBWIYmfos+hA9HATA
	dBQnVncRPzoh3NogkBgj8Q7+/cN6rbRWjEnYRcueSr4LN5GiE3PM2b4APFnnscOTJbsiLawuNZzyW
	EiyC/vUIzsctXAxfUqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIge8-00000006gF3-1s9Y;
	Mon, 19 Oct 2026 06:14:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIge5-00000006gEg-3GAc
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 06:14:55 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so934925a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 18 Oct 2026 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390492; x=1792995292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=McqFomcOwuuUrazLCYHWyb5IDYuYKEXLE+gvNFn+npP+CnHJXttwHAzxY9uR5XUdqL
         pfbRkj6mL80N6WyLbsx5xiX5y7eF+01bA7xozNFxZ+v9WkkA98AxzT/CZjobs2lvpZ1e
         AQsvw2kjzZhLv50xz1jrkTjCajaAumx8V/piyWfoJQQPmw9f4JNOzbp5sFeqFZ12gytr
         4X4cm7FyS9QeJB8OHov+X0ni0Npdg/G/9ybz8Tner6PilptciilEJUVBai3SUiXrx9EU
         U4fSubZN/JgV8NNLtjSxaee2nooD5xG6AOHPK3bgxSvdIAg0D5j7diw2isvpG/VaGnYq
         mnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390492; x=1792995292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=0wOZFhFWr0/7Hu81OWVAtjyIW0NAleo51DDWF+UuRk5HVo6jTSN511YrGcNasnlgXj
         dIN1Ia5uQ5HpoKkx1kJtPAjFtf1y9OZ4v/fBfa79MzH7ttg+H+xp6Cx7BWp1fU8y65qM
         fh2cRRLDeAYAQFQKUA/E+PjGIEinOWQwHhd00PWW2HrKESyyA1+a0rsSVfG4H4JvgR0s
         vOKtvLjMCq/LpRd5ZgnSzaVzF8h3Ou233nGLXzLoVJl+gmE/S+F84OA7OszWbrCs73Rs
         HyfawHXZs1w0e5F/GUhtDGaHuSzQIFFdNFvVbMp8WnHFOssbdhWg3I01XpgwjfI7EUlZ
         RNGg==
X-Forwarded-Encrypted: i=1; AKwUvBy3iC1LvMugYv+mwXzI2+vEj7uLxtsEzUvYZjEpsm9y45T/ser/VzdabiwHibw1mzUL5A/iZ8dv6tA=@lists.infradead.org
X-Gm-Message-State: AFq9FYI/kCHgL8BTS28Hyw7EjMQLWHWK1rBHAQIPOEFnXh7GIf0xpcZF
	zXF90499S/zvUpuUPPaN++ILkk9XzehO4RL4XiLwvmg70CP3Z0oxrVqT
X-Gm-Gg: AYBFou0xs1r+Ra8kVO2vl/HZpM6jWHJFajpcn/0Gl4ixeqiibdsWydl7DlXKbSrBrhQ
	M46l+IfYncnzAqgAUTVKdrRPiyRpeLDCxK4wCkEB9bb0cO8Fc1/aybIrNs3ufVtbWWK/uKQy7he
	NQnRScDs4gr5OwmfxUDAP1xRcGhecCDzkWJNpvyY+A0P30uoadwFAcrbVSQubGo98zmuKlbGgjd
	5nW9GAD70pYPrE0+ssdl/JOKhCsjSPy+URRwB1hqre5MQOyOrFIEBQwqkUQT0bE4hE/YZjitR/w
	4bjEDejQ/QnVnxY4EmCuv673jQbhYsrVthbtXXRmxPF/Bm1Q56vg5jg/7kSJNt/lRaH8Tl6wY7m
	qxA2tRKmTA/VhdcyCmN3vPihr2x9diKYPfONRugaPdAa5pTsbfakE4BngJNuVmO+03slPLLbSrR
	Hz1DYdf7c6DesHZ1YzDTbiv9bBxiVxi6l6/G99G3fjfinqNX3ZwbOnzWGi28/H
X-Received: by 2002:a17:90b:3851:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3aceeea8f3amr5078332a91.35.1792390492104;
        Sun, 18 Oct 2026 23:14:52 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm19035101a91.12.2026.10.18.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:14:46 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 14/28] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <atW1VhJXAIvtYPfd@hyunchul-PC02>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_231453_841642_C48ECD7B 
X-CRM114-Status: GOOD (  12.25  )
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

Hi Christian,

> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 4066bacabe37..12ad2ce938ba 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -269,6 +269,8 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  
>  	ntfs_debug("Entering with remount");
>  
> +	/* Mark the volume dirty first if an error made it read-only. */
> +	flush_work(&vol->error_work);
>  	sync_filesystem(sb);
>  

    if (sb_rdonly(sb) && !(fc->sb_flags & SB_RDONLY)) {
        ....
	return -EROFS;

Before this patch, SB_RDONLY is set, so remount,rw returned -EROFS. With
this patch, sb_rdonly(sb) is false, so remount,rw skips the check and
return success even though writes are rejected with -EROFS.

I think that the condition should be test NVolErrors(), for example

    if ((sb_rdonly(sb) || NVolErrors(vol)) &&
        !(fc->sb_flags & SB_RDONLY)) {

-- 
Thanks,
Hyunchul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
