Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E8FC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Aug 2023 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/uCK6Tx0wbyy+J8Hm04rHyx+LzUlQ6KRNA+YKJGC62M=; b=xIO
	asCH50iMGerOF9hOjW56624P5dc6Mx1j9qI2+mmoWENv6g66cSOMmpHxN4q8XTMK75wodWYe8qAzP
	M51GWbA29TpxIjIuXfV0gyeHJY+jsjX6E8/b1VDNbu/BYzIt2mM7tpYYFINiVlZTLxO7wtwuvjVsW
	/7zd1PT6HMn4G2K+5PLKuebbFpOZvahBYZ98TJrBHuyr2rSZ+uxCzDKunGUDv/T1E0zCjAUDrlc76
	Ha6TxENQUP3H+K9HXlGY9e5uIKYJ8zc6wtcTdzlyN0LMlgtojl9xtKUWW7J6FVEZVboBrPg7DD/ya
	+EusjorJd7kD1I+q2tLghmtQoiJk3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaCY-00ACJa-1G;
	Thu, 03 Aug 2023 15:25:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRaCU-00ACIt-2K
	for linux-mtd@lists.infradead.org;
	Thu, 03 Aug 2023 15:25:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3178dd771ceso994725f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2023 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691076317; x=1691681117;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=90dE3whyKAeJrzFvZkiVWkEv+XoqJmJNZVoYnlly27M=;
        b=CHcqMe8H67MC3REP5VPjAKsdCz3YzFJouzf5Yc/9c6Z9UTN0lp8PT3wMToD3TQF92j
         GmHdHHcYj1jgVWVDTdadpcaYvuGzeXn26vkW4EMXIoRKKarh3ZyiRR4pvn1wDWzNf2Jh
         0OBgV2ae++kBsJq6UeZTCH19zOdkE6W8NOvLI8IE5kocKS//a/mKywh62oY2GNJiiOoC
         WiIWjcSdfs9NtTTPplbA70V8GdLN39I4DXbdH8eoZbyv4mc051pGwHpuiE4MFExoonH8
         1eNE9sqLjeeEOIruS4U5J8jMxergXATXC/2cGUwO69SX0JvDOIGtMxf9TfNETyGlcmXc
         3BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691076317; x=1691681117;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90dE3whyKAeJrzFvZkiVWkEv+XoqJmJNZVoYnlly27M=;
        b=GXizzU/TjmDWxc1G8/8YDJMAvOkfLo0lUCEjIxZAHLWnXVkEqN6cW0/1YL98IB9xJB
         eGckIiftOZyqK0VcdbNy8gT9HqKH4sYE7aryWeIwaYUWvH2pWy21DF2VqZhadyQCS1qj
         vAQ1B6zkzbMBrk/NoCEW90ZC5KnoOGU9s4S+VFggJFyzjjG4jv6egVkhsPlfnfPMXuZC
         VKD/AohEp5ZEPGOtVSPqTL0a0Ccyogm1AFoRbcLjMtvcJQwsHx/3Hz78rtYWyhYrAtZn
         2TnaySq2+7Q8AOXEfLCUY462c/rBabMsPOhuirYyiImR6omVIm+W3DkeUDPPZcpvQdKc
         euug==
X-Gm-Message-State: ABy/qLYpo5hauGok8AbSA28Xj9Q5cnuEizc/Slzj6owXQmSNBrqfmAGm
	zY2DJFr5qD9kjFf4Wm1o0DLJCTNruhoqf5s49H6aD51r/MM=
X-Google-Smtp-Source: APBJJlGYiCKqNZ7+J7bCwwsiVWeSUe30exByHM85GMkhW1yghwcPsjwRER2VP9RNxuU74HqMI3M5eTv3TF8gepr7t0M=
X-Received: by 2002:adf:dec2:0:b0:317:5cf6:ab4e with SMTP id
 i2-20020adfdec2000000b003175cf6ab4emr7467290wrn.62.1691076316976; Thu, 03 Aug
 2023 08:25:16 -0700 (PDT)
MIME-Version: 1.0
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Thu, 3 Aug 2023 17:25:05 +0200
Message-ID: <CAO1O6sde_2CT1irAhkaKM=xSdKkpdxWB6PGa=wUKU59nQuW5rQ@mail.gmail.com>
Subject: Boot fails after "mtd: rawnand: Support for sequential cache reads"
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_082518_763109_BD6A7DEA 
X-CRM114-Status: GOOD (  15.62  )
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

After trying to upgrade the kernel to version 6.3, my system no longer
boots. I tracked down the issue to the commit "mtd: rawnand: Support
for sequential cache reads"
https://lore.kernel.org/linux-mtd/20230112093637.987838-4-miquel.raynal@bootlin.com.

The system is running UBIFS as root partition, and it is when mounting
the root partition the boot process fails.

The system is based on NextThing's GR8 (Allwinner R8 inside) and has
the Toshiba flash TC58NVG2S0HTA00. It should be more or less
equivalent to NextThing's "CHIP Pro".

It appears like UBI itself manages to get initialized, but mounting
the UBIFS partition fails.

After inserting "#define DEBUG" into nand_base.c and sunxi_nand.c,
this is the kernel log:

...
[   89.750000] nand: executing subop (CS0):
[   89.760000] nand:     ->CMD      [0x00]
[   89.760000] nand:     ->ADDR     [5 cyc: 00 00 40 fe 01]
[   89.770000] nand:     ->CMD      [0x30]
[   89.770000] nand:     ->WAITRDY  [max 1 ms]
[   89.770000] nand: executing subop (CS0):
[   89.780000] nand:     ->CMD      [0x00]
[   89.780000] nand:     ->ADDR     [5 cyc: 00 00 80 fe 01]
[   89.790000] nand:     ->CMD      [0x30]
[   89.790000] nand:     ->WAITRDY  [max 1 ms]
[   89.800000] nand: executing subop (CS0):
[   89.800000] nand:     ->CMD      [0x00]
[   89.800000] nand:     ->ADDR     [5 cyc: 00 00 80 fe 01]
[   89.810000] nand:     ->CMD      [0x30]
[   89.810000] nand:     ->WAITRDY  [max 1 ms]
[   89.820000] nand: executing subop (CS0):
[   89.820000] nand:     ->CMD      [0x00]
[   89.820000] nand:     ->ADDR     [5 cyc: 00 00 c0 fe 01]
[   89.830000] nand:     ->CMD      [0x30]
[   89.830000] nand:     ->WAITRDY  [max 1 ms]
[   89.840000] nand: executing subop (CS0):
[   89.840000] nand:     ->CMD      [0x00]
[   89.850000] nand:     ->ADDR     [5 cyc: 00 00 c0 fe 01]
[   89.850000] nand:     ->CMD      [0x30]
[   89.860000] nand:     ->WAITRDY  [max 1 ms]
[   89.860000] ubi0: scanning is finished
[   89.860000] nand: nand_do_read_ops: using read bounce buffer for buf@273e236b
[   89.870000] nand: executing subop (CS0):
[   89.880000] nand:     ->CMD      [0x00]
[   89.880000] nand:     ->ADDR     [5 cyc: 00 00 81 02 01]
[   89.880000] nand:     ->CMD      [0x30]
[   89.890000] nand:     ->WAITRDY  [max 1 ms]
[   89.890000] nand:       CMD      [0x31]
[   89.900000] nand:       WAITRDY  [max 1 ms]
[   89.900000] nand: executing subop (CS0):
[   89.910000] nand:       CMD      [0x00]
[   89.910000] nand:       ADDR     [5 cyc: 00 00 81 02 01]
[   89.910000] nand:       CMD      [0x30]
[   89.920000] nand:       WAITRDY  [max 1 ms]
[   89.920000] nand:     ->CMD      [0x31]
[   89.930000] nand:     ->WAITRDY  [max 1 ms]
[   89.930000] nand: nand_do_read_ops: using read bounce buffer for buf@3ce995ec
[   89.940000] nand: executing subop (CS0):
[   89.940000] nand:     ->CMD      [0x31]
[   89.950000] nand:     ->WAITRDY  [max 1 ms]
[   89.950000] nand: nand_do_read_ops: using read bounce buffer for buf@6bb80c75
[   89.960000] nand: executing subop (CS0):
[   89.960000] nand:     ->CMD      [0x31]
[   89.970000] nand:     ->WAITRDY  [max 1 ms]
[   89.970000] nand: nand_do_read_ops: using read bounce buffer for buf@a6f19d8d
[   89.980000] nand: executing subop (CS0):
[   89.980000] nand:     ->CMD      [0x31]
[   89.990000] nand:     ->WAITRDY  [max 1 ms]
[   89.990000] nand: nand_do_read_ops: using read bounce buffer for buf@7b81d074
[   90.000000] nand: executing subop (CS0):
[   90.000000] nand:     ->CMD      [0x31]
[   90.010000] nand:     ->WAITRDY  [max 1 ms]
[   90.010000] nand: nand_do_read_ops: using read bounce buffer for buf@9896eb14
[   90.020000] nand: executing subop (CS0):
[   90.020000] nand:     ->CMD      [0x31]
[   90.030000] nand:     ->WAITRDY  [max 1 ms]
[   90.030000] nand: nand_do_read_ops: using read bounce buffer for buf@4bfef574
[   90.040000] nand: executing subop (CS0):
[   90.040000] nand:     ->CMD      [0x00]
[   90.050000] nand:     ->ADDR     [5 cyc: 00 00 c1 02 01]
[   90.050000] nand:     ->CMD      [0x30]
[   90.060000] nand:     ->WAITRDY  [max 1 ms]
[   90.060000] nand:       CMD      [0x31]
[   90.060000] nand:       WAITRDY  [max 1 ms]
[   90.070000] nand: executing subop (CS0):
[   90.070000] nand:       CMD      [0x00]
[   90.080000] nand:       ADDR     [5 cyc: 00 00 c1 02 01]
[   90.080000] nand:       CMD      [0x30]
[   90.080000] nand:       WAITRDY  [max 1 ms]
[   90.090000] nand:     ->CMD      [0x31]
[   90.090000] nand:     ->WAITRDY  [max 1 ms]
[   90.100000] nand: nand_do_read_ops: using read bounce buffer for buf@4081acc0
[   90.110000] nand: executing subop (CS0):
[   90.110000] nand:     ->CMD      [0x31]
[   90.110000] nand:     ->WAITRDY  [max 1 ms]
[   90.120000] nand: nand_do_read_ops: using read bounce buffer for buf@9b009736
[   90.130000] nand: executing subop (CS0):
[   90.130000] nand:     ->CMD      [0x31]
[   90.130000] nand:     ->WAITRDY  [max 1 ms]
[   90.140000] nand: nand_do_read_ops: using read bounce buffer for buf@a4f94df0
[   90.150000] nand: executing subop (CS0):
[   90.150000] nand:     ->CMD      [0x31]
[   90.150000] nand:     ->WAITRDY  [max 1 ms]
[   90.160000] nand: nand_do_read_ops: using read bounce buffer for buf@3430763c
[   90.170000] nand: executing subop (CS0):
[   90.170000] nand:     ->CMD      [0x31]
[   90.170000] nand:     ->WAITRDY  [max 1 ms]
[   90.180000] nand: nand_do_read_ops: using read bounce buffer for buf@5e8b5aa8
[   90.190000] nand: executing subop (CS0):
[   90.190000] nand:     ->CMD      [0x31]
[   90.190000] nand:     ->WAITRDY  [max 1 ms]
[   90.200000] ubi0: attached mtd2 (name "UBI", size 509 MiB)
[   90.210000] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 258048 bytes
[   90.220000] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 1024
[   90.220000] ubi0: VID header offset: 1024 (aligned 1024), data offset: 4096
[   90.230000] ubi0: good PEBs: 2030, bad PEBs: 6, corrupted PEBs: 0
[   90.240000] ubi0: user volume: 8, internal volumes: 1, max. volumes
count: 128
[   90.240000] ubi0: max/mean erase counter: 5/1, WL threshold: 4096,
image sequence number: 862042766
[   90.250000] ubi0: available PEBs: 734, total reserved PEBs: 1296,
PEBs reserved for bad PEB handling: 34
[   90.260000] ubi0: background thread "ubi_bgt0d" started, PID 30
[   90.270000] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   90.290000] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   90.290000] ALSA device list:
[   90.300000]   #0: sun4i-codec
[   90.300000] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[   90.310000] cfg80211: failed to load regulatory.db
[   90.310000] nand: executing subop (CS0):
[   90.320000] nand:     ->CMD      [0x00]
[   90.320000] nand:     ->ADDR     [5 cyc: 00 00 c1 70 01]
[   90.330000] nand:     ->CMD      [0x30]
[   90.330000] nand:     ->WAITRDY  [max 1 ms]
[   90.340000] List of all partitions:
[   90.340000] No filesystem could mount root, tried:
[   90.340000]  ubifs
[   90.340000]
[   90.350000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

I initially suspected the "return 0" error code in nand_check_op
should be "-ENOTSUPP" instead, as the commit message hints for
https://github.com/torvalds/linux/commit/930370253ec51fccebb743409428ac2f364b3559,
but the sunxi nand driver supports the exec op operation, so that code
path is not triggered.

As I'm not really familiar with this part of the kernel, I don't know
how to debug this further. Let me know if I can assist debugging
somehow.

I saw other people having issues related to this commit in the mailing
list archive as well as at
https://society.oftrolls.com/@mansr/110576568140109154, but not sure
if anyone has had problems on Allwinner systems.

Returning immediately in rawnand_check_cont_read_support seems to
workaround the issue, completely bypassing this new feature.

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
