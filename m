Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4FBC433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 14:44:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3CD1206B5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 14:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m98qofnX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9lTFOto"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3CD1206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7/rivdldLpwgJO78ibppCNKzSngBhybtrrHHkc/i4EI=; b=m98qofnX87h/ujfUJ2xRxV/HeH
	b6uzMKG1ZnpmUtf+cACDnRFD27HAoCjO9oBE54ykR/LzeM1oEMoZcwAtKSnaIhEaF3CLY9cRMbUzZ
	0AbJjCCbqOGCl1ox2PdGs3fwziZzE5X0cb5kZEBhOXwF6S3Yg24nf/MyZpvqtge/hsFQTWvSW/2jW
	oN5mGlgE/SbFAg6VWfL9wqqRNKf6kzbnde3e+MgOhjhBhy91FNo5x9lENPE2dNfK3um1Teh9RZs6H
	vnURESCH33A1obWOky7sq1g8N0NcQmH964bZd33UUz0fF+a1IW/hM1aSUcz8uS9cBLrEUDNTPTDOx
	XWESJqig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICAx-0001UA-Nx; Tue, 15 Sep 2020 14:43:19 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICAv-0001Ta-3x
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 14:43:18 +0000
Received: by mail-vs1-xe44.google.com with SMTP id j185so2061074vsc.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2020 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rrjfzxVghWtDllXXlldYZkkSsO6sSIHwKweAdC4VPdM=;
 b=N9lTFOtoXIKB5vQe2jyItS+5JBHTA7swGcxd2tRT8KuO7gDQZvmfy8GXUpdLJJkzXr
 zpLSAXRqQjsfkBfy884XyN2UqKqZEnJezfkRCN29T5yqTNwEG6y4SUpkoBM+BG1jodsK
 2TUle1smsBZXE5vJYE2R4tfefrusr7X1WnIEohlyD2rHl1bVGcX5kAyPruCDrh0mKDGx
 03E/HmaYM+4gzMgmZNvLY3ouXjP7Fd/yQ8Ew23l9RXkM29ENOrWD/mNIxMvqCCMt1RzC
 48Fc3ZDz8TEX4mVoXIbFL7WooVpQEgIjofFdazmGYs2UPkdtwP2rH8Izc2DlcqzfG3SA
 n24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rrjfzxVghWtDllXXlldYZkkSsO6sSIHwKweAdC4VPdM=;
 b=lRYRkYGr8qmEqjKe82OSLHAydDnsPlZNWihPttCVdCeBY852HluVnyH9chaG6N7m7n
 bN8l3FPpTYHRI0Z+/WktyLudjFAnTAhHD++eVl0y6yZGodosRj3Yqavwhc53FBSCDjAq
 kV3oFthpAQ9/bdcocUiAzI27REWIf41nR68jnybgqreYEKZ724zgqHVJCtatBPN+K0cN
 HxcCDvegJGyjHlJip9VzTZ/mCOUA4VHexaIA1HxOwoLaHxXDQcabUpiilObhmSRbO4bR
 SZdvzMqT9tzdEPYqA8T1mduW/sn20sfraVkEMiy5+wZt+rwc/fqMblRcV5UfIPPXI0oe
 UHpw==
X-Gm-Message-State: AOAM532KlEygX35grm3xjzQ57iXdiGTBHvmPVG/PKjn1C70Ns3WWAB1V
 fFPYKOUeHVv4rnZJvP1ucPCoeGhVyBkwx3f++OANiHv7res=
X-Google-Smtp-Source: ABdhPJy44qhq6JLhaJaaPJqSNCMTOHRr59toNZiMYBoSSFKYGBVWUjMkaqfEiRIWE+t7ivD4nA04cInlvwLU8JIBHbM=
X-Received: by 2002:a67:7945:: with SMTP id u66mr11828312vsc.7.1600180992581; 
 Tue, 15 Sep 2020 07:43:12 -0700 (PDT)
MIME-Version: 1.0
From: Kristof Havasi <havasiefr@gmail.com>
Date: Tue, 15 Sep 2020 16:43:38 +0200
Message-ID: <CADBnMviQd-9TbkJFUCWE8THCYF9oq-iZfu6Cjxcy9GvTfe=KUg@mail.gmail.com>
Subject: UBIFS-AUTH panic after reboot
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_104317_208585_1ED84082 
X-CRM114-Status: GOOD (  19.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there,

I am trying to deploy a root filesystem with UBIFS encryption and
authentication.
The target is similar to a raspberry pi 2 with an ARM MCU and 1Gb NAND Flash.

Observation:
===========
My applications have been running on a bare UBIFS root filesystem without
encryption or authentication for years now.
When I turn on the UBIFS encryption, the system is still running stable.
But with encryption and authentication I encounter a kernel panic after reboot.
Snippet of the output is at [1].

Interestingly, if I just test the system with filling up the flash via `dd` and
rebooting it periodically, no panic is encountered. But if I install my business
logic and let the daemons and apps start up via bb-init.d and then
kill some apps
and do one or two reboots, I can reproduce the panic every time.
(App installation is done via a manual wget and ipkg install.
The killing is done via killall xxx. I am trying to isolate a minimal scenario
from our business logic with which the phenomenon is reproducible, but with no
success yet.)

Set-up:
======
The root filesystem is created with Buildroot-2020.02.3 with mtd-utils manually
bumped to v2.1.2 and extended to depend on host-openssl because of building with
`--with-crypto` option. The auth-key comes from softHSM and the certificate
counterpart is compiled into the used kernel (v5.4.63) via `signing_key.pem` and
the Kconfigs settings `X509_CERTIFICATE_PARSER` and `SYSTEM_TRUSTED_KEYS`.

So the image is signed off-line. But another auth-key is also injected to the
kernel keyring via a custom driver which takes this key from the bootstrap and
injects it as a logon key to the keyring. The descriptor of this new key is
specified via bootargs using `auth_key`. (And of the hash is defined as sha256
equivalently as the adequate mkfs.ubifs argument.)
With this instrumentation, if I understand correctly, there is a re-signing
taking place after the first boot process/mounting.
The system comes up successfully for the first time.

What I have tried:
=================
Based on the panic log [1], I can see that the panic happens here:
    ubifs_lpt_calc_hash
        `->ubifs_get_pnode
inside the iteration over the LPT pnodes with hashing

Because of this, I re-did the panic-scenario with chk_lprops turned on via
/sys/kernel/debug/ubifs. This generates a lot of logs, even before any business
logic has ever run. E.g. upon `ipkg install`. The logs are scrambled and very
repetitive. A cleaned up snippet is included at [2].

As I researched the www, UBIFS Authentication seems to be a rather new feature,
with rather few documentation and usage examples. (E.g. the otherwise excellent
infradead documentation does not refer to it at all.)

Other things I tried, but didn't gain any improvements by them:

- After killing the business logic apps, a manual `sync && sleep 10 && reboot`
- Turn off runtime compression
- Mount with chk_data_crc
- Mount with sync
- pass `-F` also as a mkfs.ubifs argument
- dmesg -c && dmesg -n 7 and then redo the sequence which generates leads to the
  panic, calling dmesg between each step: Nothing gets logged

Questions:
=========
Q1: Are the chk_* knobs authentication aware? Or do they report so loudly
    because I enabled the authentication and they cannot handle it yet?

Q2: Could I use `integr_chk` with authentication and so that the UBI volume is
    my root filesystem?

Q3: Could anyone help which tools I could use to narrow down the on the trigger?
    E.g. Maybe with some formats combined with dynamic debugging [3]?

Q4: If I stumbled upon a mainline bug, what could I do to help analysis and fix?

Q5: Is there any UBIFS-Auth specific instrumentation for mkfs.ubifs apart from
    passing in the secrets and hash-algo? IDK something like, the journal size
    needs to be increased or other smaller detail?


Any help or suggestion would be greatly appreciated.

Best Regards,
    Kristof

[1]
ubi0: scanning is finished
ubi0: attached mtd1 (name "ubivols", size 1023 MiB)
ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 253952 bytes
ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 4096
ubi0: VID header offset: 4096 (aligned 4096), data offset: 8192
ubi0: good PEBs: 4076, bad PEBs: 19, corrupted PEBs: 0
ubi0: user volume: 5, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence
number: 793556105
ubi0: available PEBs: 0, total reserved PEBs: 4076, PEBs reserved for
bad PEB handling: 61
ubi0: background thread "ubi_bgt0d" started, PID 628
rtc-rv8803 1-0032: setting system clock to 2020-09-08T09:33:20 UTC (1599557600)
UBIFS (ubi0:4): Mounting in authenticated mode
UBIFS (ubi0:4): background thread "ubifs_bgt0_4" started, PID 632
UBIFS error (ubi0:4 pid 1): ubifs_get_pnode.part.6: error -22 reading
pnode at 7:37186
(pid 1) dumping pnode:
        address c7138c80 parent c7138e80 cnext 0
        flags 0 iip 3 level 0 num 0
        0: free 0 dirty 255408 flags 1 lnum 0
        1: free 0 dirty 190192 flags 1 lnum 0
        2: free 0 dirty 255360 flags 1 lnum 0
        3: free 0 dirty 248896 flags 1 lnum 0
CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.49-00026-gb40c178a4299 #2
Hardware name: Atmel SAMA5
[<c010bb5c>] (unwind_backtrace) from [<c010a7c8>] (show_stack+0x10/0x14)
[<c010a7c8>] (show_stack) from [<c0260c8c>] (ubifs_get_pnode.part.6+0x228/0x298)
[<c0260c8c>] (ubifs_get_pnode.part.6) from [<c0262a10>]
(ubifs_lpt_calc_hash+0x1c8/0x220)
[<c0262a10>] (ubifs_lpt_calc_hash) from [<c0262fcc>]
(ubifs_lpt_init+0x564/0x5b0)
[<c0262fcc>] (ubifs_lpt_init) from [<c024bd30>] (ubifs_mount+0x7b8/0x15e8)
[<c024bd30>] (ubifs_mount) from [<c01e38e0>] (legacy_get_tree+0x24/0x50)
[<c01e38e0>] (legacy_get_tree) from [<c01b8b10>] (vfs_get_tree+0x24/0xdc)
[<c01b8b10>] (vfs_get_tree) from [<c01d5fc8>] (do_mount+0x610/0x840)
[<c01d5fc8>] (do_mount) from [<c01d6584>] (ksys_mount+0x8c/0xb4)
[<c01d6584>] (ksys_mount) from [<c0801438>] (mount_block_root+0x124/0x23c)
[<c0801438>] (mount_block_root) from [<c08016dc>] (prepare_namespace+0x9c/0x188)
[<c08016dc>] (prepare_namespace) from [<c0593718>] (kernel_init+0x8/0x108)
[<c0593718>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
Exception stack(0xc7829fb0 to 0xc7829ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
UBIFS error (ubi0:4 pid 1): ubifs_get_pnode.part.6: calc num: 71
UBIFS (ubi0:4): background thread "ubifs_bgt0_4" stops


[2]
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4185, error -30
UBIFS error (ubi0:4 pid 802): make_reservation: cannot reserve 1672
bytes in jhead 2, error -30
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4187, error -30
UBIFS error (ubi0:4 pid 802): make_reservation: cannot reserve 3720
bytes in jhead 2, error -30
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4189, error -30
UBIFS error (ubi0:4 pid 802): make_reservation: cannot reserve 1192
bytes in jhead 2, error -30
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4193, error -30
UBIFS error (ubi0:4 pid 802): make_reservation: cannot reserve 4040
bytes in jhead 2, error -30
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4207, error -30
UBIFS error (ubi0:4 pid 802): make_reservation: cannot reserve 4200
bytes in jhead 2, error -30
UBIFS error (ubi0:4 pid 802): do_writepage: cannot write page 29 of
inode 4223, error -30


[3] http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
