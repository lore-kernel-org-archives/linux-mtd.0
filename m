Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7132AD6E2CD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6/Ab6KjDrXvTDOo2fHpu+qp9ND+S3a+KyD5HFbaaKes=; b=vpvg0OPpepuFw93VkNToPhC5NQ
	GqdqWpyX3DVTTGwmmBhhje9kXIcpJVksGmNxa5tMaaHvXpywTkhiCVglO8nYuagAxMpYrRnCN1m8o
	kQ1KR0lFLkhcJ2mcPHpxpD8bkMr9yWe6QVD5lc21yuTMhF2tFjcpWbVuzNeom+2ly3JNrs/rcnaI+
	J/vdMWC/TPwHKeJVkFXeRNSBQiCDKtoP1DkY7rab3pGbLEIDGpGVaRUxV0p0iI0phLEXZ0n9/jxmf
	Ey+ufkMRl1ASXC+BuNphDN0CXZiVFz1aTJuPoFsJuJpJ5N8vqzKylohORAeE1PkHhZWQxM159/B79
	i8vy3ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDf3S-0000000Ebcy-2CeB;
	Wed, 20 Nov 2024 07:23:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDf3Q-0000000EbcV-05uw
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 07:23:13 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9aa8895facso314886466b.2
        for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2024 23:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732087390; x=1732692190; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TUH4fBzcOFFv2mVquyak0awmCdSSw1x1C2GwnTi8IY=;
        b=ACZmwtmNLGG1+EErRl7M5xpxB/F/sr+rGFhhdGoaN0JIzCHzDV3du3X50KWT/TyRcs
         5VW102ymhyyvikBVDk4EJpA9SExtfPUwxUmJvUDue6sXWRx6KmyAGLKzzKnjVOyww+bz
         ejZBPWpDSrZWsEgMyNySVvS2qEmZ2YdC8QLSK0CJEPLPJgFGvjaKj5PKGE9VBXyXRbXd
         ofdavwCzi1P76ZWoHuuPVMYN0ljqiJnFFMlACdu5+qlf8kd3T7Jy0d5USF5mhjLMYdg8
         U+bmNFj8bhkWyoxH0UkOysX4bnPybI67oex7yX1x+GFAQQi/PPrxgvdiI7HUH+gsCr0X
         GZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732087390; x=1732692190;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TUH4fBzcOFFv2mVquyak0awmCdSSw1x1C2GwnTi8IY=;
        b=VjnkPEdDNg3aBYHxsonBSSwvnpx3SixAk4D79SjSfRZsZ0TC5IiFdYzUi7XP0LWZ4B
         AxA/agMg3/Mv7ynhYVk7C3nPBJ8/iqK5TuiILGT9GeiIfWfZcxD7N7JrnKg5OsU2NHJI
         eaPLoikWVuMcArgHvnjTDZ70eDoWRgQhTcokGgR8KjYstQ/b0wZ315zz+a9+cirTiIHg
         IOr4RdYhoBnmJxqLW3a9jhW1e7NPQojtyiIakL0iPRBlazfMMI7qb3HWGbvp4uT+++Ib
         TD0103DKsrjrvNclZYFdsOhswGrVJ7UIqNH98yZPMg8dRuwGLZeaipBGxoXhnOsG9Cxa
         8+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx4UB48SWEAyq+0NizaHKpIMZqoxPprRtpyU3goUVgCBqNXRRSkkeHGxSXjHh6m1adryOdYuu/O7I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkYA1+IeZ3IhwRr1+z1EKChXHHFm/Jr3D/IG1CzavSzSOJ2uXl
	3SeW+9zqqdUckvF/w1IoUiiPyrc1jA0C6yaLAWRC1WgMaWlzFmi8U59QkTCNCs0WpwiAcJ4tBII
	ihM01XAyJ6348b2UCrD+UClOXj69PCQ==
X-Google-Smtp-Source: AGHT+IFJLaQBiwiWiQwPPj21kY4gRHUQRpwhGpQ3ocHcoYF5cTnC9mIFUs/iW5OYYbNRN5ehA+LKxz+IPQmL9rmyI/g=
X-Received: by 2002:a17:907:2da2:b0:a9f:450:48eb with SMTP id
 a640c23a62f3a-aa4dd71a2c0mr141394266b.45.1732087389628; Tue, 19 Nov 2024
 23:23:09 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
In-Reply-To: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 20 Nov 2024 12:52:57 +0530
Message-ID: <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com>
Subject: Re: Block based OTA update needs mtdblock
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, chengzhihao1@huawei.com, 
	open list <linux-kernel@vger.kernel.org>, kernelnewbies@nl.linux.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_232312_059798_43F7D3DA 
X-CRM114-Status: GOOD (  20.86  )
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

Hi,

On Mon, 4 Nov 2024 at 21:31, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi All,
>
> For one of our automotive products we have the following configuration:
> QC chipset, arm64, Kernel-5.15, NAND Flash 1GB, A/B system, UBI
> volumes (squashfs, ubifs), DM-verity for rootfs (squashfs), simple
> busybox platform.
>
> For OTA updates we have a strong dependency with MTD_BLOCK.
>
> Till now, we were using ubiblock for mounting squashfs volumes and
> completely got rid of mtd_block by configuring it as a loadable
> module.
> But, we also need to support OTA updates (Full, Incremental) on A/B
> volumes using the same Android OTA framework.
> https://source.android.com/docs/core/ota/nonab/block
>
> OTA update will be applied to the B (inactive) partition.
> OTA updates prefer block based update over file based especially for
> dm-verity enabled devices.
>
> Now, the problem is, on MTD we only have 2 options for block based
> updates; ubi_block or mtd_block.
> We cannot use ubiblock for OTA updates as it is read only.
> For full update volume, we can use "ubiupdatevol" interface to
> completely replace the volume content, but for partial or incremental
> update we need to update only specific blocks and not entire
> partitions.
> Thus, we have to use the MTD_BLOCK (/dev/mtdblock) interface to
> support block based OTA updates on UBI volumes.
> Thus, during ota updates (only) we need to install the mtdblock
> module, perform the update and then uninstall the module.
>
> That means, we cannot completely get rid of MTD_BLOCK from our product
> especially for OTA use cases.
>
> Is this the only way, or do we have any other option to support OTA
> updates over UBI volumes ?
>
Restarting this thread again...
Any further comment on this ?

Did anybody used block based OTA update NAND A/B system without using
mtd_block ?
Since ubiblock is read-only, it seems there is no other way to perform
OTA update, if mtd_block is disabled.
Or, we need to make ubiblock also as read/write.


Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
