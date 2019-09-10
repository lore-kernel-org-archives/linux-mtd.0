Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D49C49ED9
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 19:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5352168B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 19:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fbhh8Zat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJElaDOT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5352168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/QHMxAjWKULVRpfbMx/gcvHxMOTNrWqic2yU6RDv6k=; b=Fbhh8ZatG22kAj
	yjryXoIT7otf8x3KtJpdbka2reyNixQWyfUtuPMCZblhVcw41HpgszViSTuandRWQHRUCNA+oQuqx
	XycUeKaBH4yZ0RGfMvvkkBF6UFcCF5lQ0PTy4cP6L4PUKS6148o1Ei4HcfRmBqNKGwHBzPcesGa/I
	WRmX0vacRTowh8EYniQVX1Vak4fP4Nl5PZVJOCCH7lMm4NarfqRUpNhwcQdEHJwUPgSC6Lr6UTjPd
	xHaymwVxZpjc/QqGHoLGMWRY5EyuEwTaVd6K0QdMaY/1mAgLz1YAkWrtvMR3FIMg5+Uh0grf0ApEe
	doPUH+jO75f51NHuWDjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7lrJ-0006av-Cn; Tue, 10 Sep 2019 19:31:25 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7lrG-0006aS-Q9
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 19:31:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q14so21848110wrm.9
 for <linux-mtd@lists.infradead.org>; Tue, 10 Sep 2019 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbORNqUn50jApNwSMi+Pkx7XSvh/WAm5602Jc9d6LKE=;
 b=nJElaDOT/9TddYkFnFN7llCKT9hUFDeHmtn6KigsNICYdTJr5xNo9drEOhIBM1c+nE
 quUEdCgC8mUToSdvU8SZK7Tu1e2yf5X2chJ5Yy2ni4Y7xMxts0+THnVCEhoutvVe3poJ
 FgIMxUk/4Y6CedxL7EKUlL+2VtXKcIzpMK0EJakTqJVzznHndJOI4mxx0yZQBRawD7/m
 9W/wU7V66+XZL787UR1zSWWXX06KQxlsXamAoRFVoWuOvsZ0LsV7tNnB0m5LA756lfmw
 MoSOzngiHwesraPAXHtIoJjrJzyEihM7KDYOdxbumbK6aFj8eOhFti8glmaPTMzyk80U
 XO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbORNqUn50jApNwSMi+Pkx7XSvh/WAm5602Jc9d6LKE=;
 b=TYT3hTXhphRoWB+2pomQX4iynTUhobFlvVEFVGYniMDCkp4bVeNEN0Z+LWxUVIdmcM
 Af+zi3CmGrtdf01W+vodq3bDy7XPNC1wTmyU+B1j3WlF0uNqOU9ATyt/MrLRDF/LuGxd
 5vHjYVGx7iVpAblmr7j+m0KI+T7Rf+LaebsfxfvcYlwJSdZ6aWFoa3DyJYcrZiD4D/UD
 48O58lyV7cimn+B1sJmL6lW9zyFKRFo7NOdHKtvyG//r11eNCrMsla6XKZyz6Rundrkh
 LSHWlbSRDPhn1YRjeLQquB4Sbk1mrnjwqKY0R+6t3X+oPED00pueUXyZ2oUJiyyaIK7V
 FXpg==
X-Gm-Message-State: APjAAAUj942vv/kAjx4NCf6hLdeN9vgLzVdUJ2hmy4l3yWldYZYMVBvb
 JigK66Verd71nTt5tNCz0TnQuqDMQiqwAu2Q2/5EkPJGiQo=
X-Google-Smtp-Source: APXvYqxpRN2hbavZiu4zasdi3wjJASOGc7Bwzjwafgs73ryHTIdUN5luW+d3sZ4Z3KANN5ZuO5YHwiN3rhPAb4lIpCk=
X-Received: by 2002:a5d:6987:: with SMTP id g7mr3598396wru.306.1568143879657; 
 Tue, 10 Sep 2019 12:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFkQurKLwUdGSPNPLYLTrV7-fkWaL5RuP9up0nrN62L4pr-ivg@mail.gmail.com>
In-Reply-To: <CAFkQurKLwUdGSPNPLYLTrV7-fkWaL5RuP9up0nrN62L4pr-ivg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 10 Sep 2019 21:31:07 +0200
Message-ID: <CAFLxGvz5JipAzu1x_0EPX6v-SZgxtu6n3-gZZ=DQS4FLMH0XSg@mail.gmail.com>
Subject: Re: cannot ubiupdatevol squashfs image
To: Boris Stein <boris.stein@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_123122_856261_28778101 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 10, 2019 at 3:11 PM Boris Stein <boris.stein@gmail.com> wrote:

[...]

> But then there is a failure when system boots:

[...]

> [    5.919637] ubi0: attaching mtd25
> [    7.038038] ubi0: scanning is finished
> [    7.048738] ubi0: attached mtd25 (name "system", size 319 MiB)
> [    7.048767] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
> [    7.053530] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
> [    7.060333] ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
> [    7.067173] ubi0: good PEBs: 1279, bad PEBs: 0, corrupted PEBs: 0
> [    7.073956] ubi0: user volume: 8, internal volumes: 1, max. volumes
> count: 128
> [    7.080208] ubi0: max/mean erase counter: 2/1, WL threshold: 4096,
> image sequence number: 796905358
> [    7.087316] ubi0: available PEBs: 0, total reserved PEBs: 1279,
> PEBs reserved for bad PEB handling: 40
> [    7.096278] ubi0: background thread "ubi_bgt0d" started, PID 207
> [    7.105838] cpuidle: enable-method property 'psci' found operations
> [    7.106471] lpm_levels_of: Residency < 0 for LPM
> [    7.106475] lpm_levels_of: idx 1 420
> [    7.106478] lpm_levels_of: Residency < 0 for LPM
> [    7.106480] lpm_levels_of: idx 2 500
> [    7.106483] lpm_levels_of: idx 2 3040
> [    7.106693] lpm_levels: register_cluster_lpm_stats()
> [    7.108873] rmnet_ipa3 started initialization
> [    7.109878] RNDIS_IPA module is loaded.
> [    7.109878] audio_pdr_late_init get_service_location failed ret -19
> [    7.110531] msm_bus_late_init: Remove handoff bw requests
> [    7.135649] vreg_sd_mmc: disabling
> [    7.135656] emac_phy: disabling
> [    7.135661] rgmii_io_pads: disabling
> [    7.135668] vreg_wlan: disabling
> [    7.135672] ALSA devic[    7.193476] Freeing unused kernel memory: 1024K
> /etc/mdev/iio.sh: .: line 19: can't open
> '/sys/bus/i2c/devices/*-006*/iio:device?*/uevent'
> [    7.697004] iio.sh (216) used greatest stack depth: 6288 bytes left
> /etc/mdev/iio.sh: .: line 19: can't open
> '/sys/bus/i2c/devices/*-006*/iio:device?*/uevent'
> [    7.730144] iio.sh (218) used greatest stack depth: 6256 bytes left
> mkdir: can't create directory '/mnt/sdcard/': No such file or directory
> mount: mounting /dev/mmcblk0p1 on /mnt/sdcard/ failed: No such file or directory
> [    8.038745] mdev (214) used greatest stack depth: 6000 bytes left
> mdm-init : Detected block device : 25 for system
> [    8.051651] ubi: mtd25 is already attached to ubi0ubiattach:
> error!: cannot attach mtd25
>            error 17 (File exists)
> [    8.107261] Waiting for ubinfo for md-rootfs
> [    8.107431] Done ubinfo for md-rootfs, volume ID: 1
> [    8.111069] Waiting for /dev/ubi0_1
> [    8.115328] Done waiting for /dev/ubi0_1
> [    8.124406] block ubiblock0_1: created from ubi0:1(md-rootfs)
> [    8.125039] Waiting for /dev/ubiblock0_1
> [    8.186355] Done waiting for /dev/ubiblock0_1
> [    8.216688] Waiting for ubinfo for rootfs
> [    8.216872] Done ubinfo for rootfs, volume ID: 0
> [    8.219764] Waiting for /dev/ubi0_0
> [    8.224833] Done waiting for /dev/ubi0_0
> [    8.233326] block ubiblock0_0: created from ubi0:0(rootfs)
> [    8.233943] Waiting for /dev/ubiblock0_0
> [    8.301729] Done waiting for /dev/ubiblock0_0
> [    8.614592] 1911 device_is_secure: #########################
> device_is_secure=0

???

> [    8.651724] Waiting for ubinfo for md-sdatafs
> [    8.651900] Done ubinfo for md-sdatafs, volume ID: 3
> [    8.655158] Waiting for /dev/ubi0_3
> [    8.660428] Done waiting for /dev/ubi0_3
> [    8.668817] block ubiblock0_3: created from ubi0:3(md-sdatafs)
> [    8.669459] Waiting for /dev/ubiblock0_3
> [    8.734968] Done waiting for /dev/ubiblock0_3
> [    8.766984] Waiting for ubinfo for sdatafs
> [    8.767156] Done ubinfo for sdatafs, volume ID: 2
> [    8.770369] Waiting for /dev/ubi0_2
> [    8.774891] Done waiting for /dev/ubi0_2
> [    8.783874] block ubiblock0_2: created from ubi0:2(sdatafs)
> [    8.784493] Waiting for /dev/ubiblock0_2
> [    8.851409] Done waiting for /dev/ubiblock0_2
> [    8.913053] 1911 device_is_secure: #########################
> device_is_secure=0

???

> mount: mounting /dev on /system/dev failed: Invalid argument
> mount: mounting /dev/pts on /system/dev/pts failed: No such file or directory

wut?

> [    9.006327] SQUASHFS error: zlib decompression failed, data probably corrupt
> [    9.006359] SQUASHFS error: squashfs_read_data failed to read block 0x785a5a

usually squashfs has a blocksize of 1k or 4k. So block 0x785a5a is out
of bounds.

> [    9.012677] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> [    9.019470] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> [    9.026242] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> [    9.032876] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> [    9.039529] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> [    9.046225] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> [    9.052910] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> [    9.059573] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
> [    9.066281] SQUASHFS error: Unable to read fragment cache entry [785a5a]
> [    9.072954] SQUASHFS error: Unable to read page, block 785a5a, size d6b4
>
>
> Please adivse,

There seem to be many other components involved.
Is the squashfs image actually correct?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
