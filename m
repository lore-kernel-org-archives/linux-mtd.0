Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86FEB64D7
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jun 2023 00:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgsV1g2wYVBqyuoD7ih0nfhkHPjXhD8TsovqB9sCbXo=; b=HhMQwakP9Mnyd3
	ODYjYwMVRjh7VuSqg0b1yrFwY3quEzHnXHoYfD7DT1w6jn8x+s805eA29JNmHIH88W1B/Z9vXnE/1
	1dS/afad8mIGA5WWx6zs6+yT69YtKRBFmceUwDk1DnCnRHrLEbxZNr0BnIL0A9RnmYfJu4PDN5DsC
	dJ3UvJGUBazfbpBBMgLiO3WvM2Iu2SgGjPIyfT8jB2pFmimfyjkqdp/VstPTZdk6wnI/B8iq9S/Ld
	5eNzxyYjrYP4TAAZ+M2DABswlxBdwHjfr5AIy+g9BDCV0zOakmZQbAoJ7D/a1x6+NQYHLFxFmygbw
	g73M/W8RRLT9mCJSlfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqpz-004tEA-0V;
	Sat, 24 Jun 2023 00:09:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqpv-004tCW-17
	for linux-mtd@lists.infradead.org;
	Sat, 24 Jun 2023 00:09:08 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so1022718b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2023 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687565342; x=1690157342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbJYrnA9pnU+meP6XQ4kPeEwf/5w1AM0kN7wumRTQPk=;
        b=PNtSvWLdn9xOWUkW+c/xisBSDCt4yIiRGsF9p+IVVWTxHksTX8GoGu+4bK9ObiNHdS
         6nkRKXaZeOpZfl0YXRsSGGC11zmCYcuj1wb9sqSktGdWDxoAnWmA441nYZnikI90iq/M
         uU+DCPS67i4GDBwiL1j/ZIRm4zeu/icq8P2m7jmPy+pOAZk/rj+8EA8/U7PkEQTUfyXX
         f1wm9xWCYKJO3sjjiMInuykINkywjC9BVLZEY5OWqgz0X10/+wDgafPmFpZ16YHQteS+
         TL8R4XaE3ALyzu9H7LB6bVnh43dxlBQy/BfQ7Z7SdmWSxssvI/YXa7EhP3URwBjI+H2R
         S5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687565342; x=1690157342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbJYrnA9pnU+meP6XQ4kPeEwf/5w1AM0kN7wumRTQPk=;
        b=HrfSLP5QQZJ+smfKtaj/bngvPzgpHmANPMx4S9FrDpVcWEpU0HxOKp15pj4f+/dnJP
         h9ASUD/AGGAy1fwDApTAfb0TUbGAjuj5VdGHnLX3f7sP1aE2BJNZh4i+uEWeOK0IYiu7
         uRtaVUtWzhlXOxe/bPDveUBeDxEDiIUvyUDr3Dm1adqMhv2kJO6GAbUr4zf2LZ/H5NRx
         7cdboV2N//6D3CLXITVXKMgqJvKduhFDWsXyann1kCPD5L4+KzQwsqXyAjqk0uYUco32
         S+5MBgTeChLwy2c9zxUsG29ylR0TbsW/Fqo5X6ID268TbEZlQjBakHswA2eRsZ2T+MDP
         CJHQ==
X-Gm-Message-State: AC+VfDwvV0pnwtoRwX+nWR/lgOGU1oX7YtFy5YzebL/16pqWX/j+26hU
	QoeEtt0rKUfvuj6GlpbyhP0=
X-Google-Smtp-Source: ACHHUZ5UWmNb3hGeP/QCkeICkX9qJKsrvt0uGbMg739NNzwe0eHF70/k0NEUj6d2y5jm6EUom87PcA==
X-Received: by 2002:a05:6a20:7f99:b0:10b:4539:fa0a with SMTP id d25-20020a056a207f9900b0010b4539fa0amr28469987pzj.1.1687565342232;
        Fri, 23 Jun 2023 17:09:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o5-20020a656145000000b0052858b41008sm165159pgv.87.2023.06.23.17.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 17:09:01 -0700 (PDT)
Date: Fri, 23 Jun 2023 17:08:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 08/24] init: pass root_device_name explicitly
Message-ID: <c1391658-d785-4b2f-ba7e-01e4668685d7@roeck-us.net>
References: <20230531125535.676098-1-hch@lst.de>
 <20230531125535.676098-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531125535.676098-9-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_170907_391723_3A786F31 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, May 31, 2023 at 02:55:19PM +0200, Christoph Hellwig wrote:
> Instead of declaring root_device_name as a global variable pass it as an
> argument to the functions using it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This patch results in the following build error when trying to build
xtensa:tinyconfig.

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
ERROR: modpost: Section mismatches detected.

Unfortunately, reverting it is not possible due to conflicts,
so I can not confirm the bisect results.

Bisect log attached.

Guenter

---
# bad: [8d2be868b42c08290509c60515865f4de24ea704] Add linux-next specific files for 20230623
# good: [45a3e24f65e90a047bef86f927ebdc4c710edaa1] Linux 6.4-rc7
git bisect start 'HEAD' 'v6.4-rc7'
# good: [a5838c78db6a3a02e8d221e588c948f792e7f256] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
git bisect good a5838c78db6a3a02e8d221e588c948f792e7f256
# bad: [cca41cc0b5485a0ec20707316c1a00082c01a2af] Merge branch 'for-next' of git://git.kernel.dk/linux-block.git
git bisect bad cca41cc0b5485a0ec20707316c1a00082c01a2af
# good: [901bdf5ea1a836400ee69aa32b04e9c209271ec7] Merge tag 'amd-drm-next-6.5-2023-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect good 901bdf5ea1a836400ee69aa32b04e9c209271ec7
# good: [b4666c320b8113d94b3f4624054562e7add57e4a] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git
git bisect good b4666c320b8113d94b3f4624054562e7add57e4a
# good: [b2c28785b125acb28a681462510297410cbbabd7] ASoC: dt-bindings: microchip,sama7g5-pdmc: Simplify "microchip,mic-pos" constraints
git bisect good b2c28785b125acb28a681462510297410cbbabd7
# bad: [9d217fb0e778d69b2e3988efbc441976c0fb29b5] nvme: reorder fields in 'struct nvme_ctrl'
git bisect bad 9d217fb0e778d69b2e3988efbc441976c0fb29b5
# good: [20d099756b98fa6b5b838448b1ffbce46f4f3283] block: Replace all non-returning strlcpy with strscpy
git bisect good 20d099756b98fa6b5b838448b1ffbce46f4f3283
# bad: [93c8f6f38be67e30adf8d8eb5e7e9ccb89326119] pktcdvd: Drop redundant castings for sector_t
git bisect bad 93c8f6f38be67e30adf8d8eb5e7e9ccb89326119
# bad: [c8643c72bc42781fc169c6498a3902bec447099e] init: pass root_device_name explicitly
git bisect bad c8643c72bc42781fc169c6498a3902bec447099e
# good: [87efb39075be6a288cd7f23858f15bd01c83028a] fs: add a method to shut down the file system
git bisect good 87efb39075be6a288cd7f23858f15bd01c83028a
# good: [aa5f6ed8c21ec1aa5fd688118d8d5cd87c5ffc1d] driver core: return bool from driver_probe_done
git bisect good aa5f6ed8c21ec1aa5fd688118d8d5cd87c5ffc1d
# good: [cc89c63e2fe37d476357c82390dfb12edcd41cdd] PM: hibernate: move finding the resume device out of software_resume
git bisect good cc89c63e2fe37d476357c82390dfb12edcd41cdd
# good: [e3102722ffe77094ba9e7e46380792b3dd8a7abd] init: rename mount_block_root to mount_root_generic
git bisect good e3102722ffe77094ba9e7e46380792b3dd8a7abd
# good: [a6a41d39c2d91ff2543d31b6cc6070f3957e3aea] init: refactor mount_root
git bisect good a6a41d39c2d91ff2543d31b6cc6070f3957e3aea
# first bad commit: [c8643c72bc42781fc169c6498a3902bec447099e] init: pass root_device_name explicitly

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
