Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234AC83F2C
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Sep 2023 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=COE4Z/jO9Iqac5dnymOEDFS6HP4OfwVfltITnWAOsKA=; b=MsH
	ym6kAzDg/gncnRJYp8Ztx1h6e4I+ZlVsG0kx2i++nLwo/88UP6RgtT/xPdv1XyO5cS6c8ffbh8/1q
	S15cnLfp4rK/wIVhHx6cJKXRu8Of1P38jKMHHKZw8K+gBBW43YadwYLtfMLhZxbVCq6rJG8fENV3Y
	OZX/Xhy0LfAsFS9FzwETjp7NHhHSc17a6I3Rcs0xc7d2UJx2PeOwqyCxXizYcPMyrxWKoMHoqXm8d
	AsxrcXuZYBSTS3caCUeHBUEbdcVtZm31Zl2h3tUq7btk3QK6t0KPvuSvCrPVe1ST05mtXKIxftxCf
	QPcJCAB3veeFEODlkFAJHw/zLsujDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXJB-006Cti-27;
	Tue, 05 Sep 2023 14:45:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXJ8-006Csm-0N
	for linux-mtd@lists.infradead.org;
	Tue, 05 Sep 2023 14:45:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31c8321c48fso2216912f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2023 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693925130; x=1694529930; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HRMzWsWqPEn14H7nvNbNAxDhYLwv8fCuTmBZtmQ7ws8=;
        b=iqBzE1IuCc3SZcDlmaqRiP9jyDZJaZeNCrMoGqJE1KGoCctNEATlDnBqtrZa7ZxnQH
         lktT/jdMM4XplU0sWh+D1Zudr7N0WWPANWLIVBdQ5GmH7wBY7CBh+LOyoZbXBUNzT5XM
         9H0nYFYnnLtnIapcRUzazq3Wacxv6E6LYkfqaDx36dLM0+vM+MolGdEEW6yVl+XURu0P
         iJGBfADNhYL/m78PEem2YOIfn90pQyycgV4vkofWr2K6VwiKpjWyJvRIpDhM0Bj9JlQ7
         Y/Sa0TBeuQcLGpTg1OtvnslqE18FnQcuaSQfRhiJFtsnpANryhrNUDFfHBqxjjOJ1xeg
         LLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693925130; x=1694529930;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRMzWsWqPEn14H7nvNbNAxDhYLwv8fCuTmBZtmQ7ws8=;
        b=KUyvDd8e/ZZPX72PLH6LAZsScaWCJUvDC+g6fKwcC7AowXsEVWSzPIzudkQwEjWT8e
         8hDPqjNtabAifRYKmMdnPAWW/f2o5A+YSWNQfVoXqa7v+qV5oOH5zb3J3wqNcZI8e7ad
         gnmxD8EQ2jgy4p1sus50q5WbsCoqaF6/V/JTp1s5vD9OsPJt35T/yG4JmD3mEbjtscfX
         nsvtp1uACdx+FUmWWBv7rRsmW6wSMnWoa+gJd825PSbsxU7O2BbgYMmVloKk1kbdykOi
         5i0IEHfOHa7/sjSvrx7mVK9eUcnjh8ATKiTP9IrHQikFX8uc4bOxdujz0wzs1ENmHM62
         nT6w==
X-Gm-Message-State: AOJu0YyUpE86COc4LF2VbDZ0aFSpJUeyTVUnEjJqvcptUB3EpPltqa84
	hDj6PTCaw4fv2VYgCp/hm5NnGPGeNTgEtqyJxxPJ3DorJ4/4Tg==
X-Google-Smtp-Source: AGHT+IGY84m8koq6gqF8ecGf438sJ3mTNGIRVXZ1yrmj4VKBEG7xcpHOc8lghD4HsM8oPjpeto2gUJDBOWjFd7Lxj/4=
X-Received: by 2002:a5d:6b87:0:b0:317:5efa:c46a with SMTP id
 n7-20020a5d6b87000000b003175efac46amr31938wrx.27.1693925129234; Tue, 05 Sep
 2023 07:45:29 -0700 (PDT)
MIME-Version: 1.0
From: Leon Pollak <leon.pollak@gmail.com>
Date: Tue, 5 Sep 2023 17:45:18 +0300
Message-ID: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
Subject: Can't find correct configuration
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_074534_179374_AE2A006B 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

Hello, all.
I will be very very thankful for the help to find the correct
configuration for my NAND.
I passed through a lot of mails in the lists and google and ChatGPT -
no success.
I have 256MB NAND and 248MB partition for UBIFS. I run:
mkfs.ubifs -v -r rootfs -F -m 2048 -e 126976 -c 1981 -o ./ubifs.img
ubinize -v -o rootfs.img -m 2048 -p 128KiB -s 512 -O 2048 ubinize.cfg
-----
and ubinize.cfg looks like:
[ubifs]
mode=ubi
image=./ubifs.img
vol_id=0
vol_size=240MiB
vol_type=dynamic
vol_name=ubi_rootfs
vol_alignment=1
vol_flags=autoresize
------
Kernel configuration  was with CONFIG_MTD_UBI_BEB_LIMIT=20.
and here is the kernel log:
[    2.695659] ubi0: attaching mtd4
[    3.372343] ubi0: scanning is finished
[    3.383066] ubi0 warning: ubi_eba_init: cannot reserve enough PEBs
for bad PEB handling, reserved 4, need 40
[    3.404320] ubi0: volume 0 ("ubi_rootfs") re-sized from 1982 to 1982 LEBs
[    3.411667] ubi0: attached mtd4 (name "FS", size 248 MiB)
[    3.417095] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    3.424006] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[    3.430740] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    3.437734] ubi0: good PEBs: 1990, bad PEBs: 0, corrupted PEBs: 0
[    3.443860] ubi0: user volume: 1, internal volumes: 1, max. volumes
count: 128
[    3.451117] ubi0: max/mean erase counter: 1/0, WL threshold: 4096,
image sequence number: 1590570073
[    3.460295] ubi0: available PEBs: 0, total reserved PEBs: 1990,
PEBs reserved for bad PEB handling: 4
[    3.469575] ubi0: background thread "ubi_bgt0d" started, PID 131
[    4.648718] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 136
[    4.676640] UBIFS (ubi0:0): start fixing up free space
[   10.250099] UBIFS (ubi0:0): free space fixup complete
[   10.269046] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
name "ubi_rootfs"
[   10.276830] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB),
min./max. I/O unit sizes: 2048 bytes/2048 bytes
[   10.286794] UBIFS (ubi0:0): FS size: 250142720 bytes (238 MiB, 1970
LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[   10.297540] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[   10.303406] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0),
UUID A14D586A-32E2-45D7-A07E-BDC472FDF31D, small LPT model

My question is: why does this warning about reserved 4, needed 40
appear? How can I solve this?

Many thanks for the help!

LP

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
