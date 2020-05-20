Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE432C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E2E207E8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 00:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fSzH5bL7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhQxs9eS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76E2E207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:To:Date:From:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mwAF7nULhUuhxgUfczC7DTiuhAQn5DcCZNi7eULmgC8=; b=fSz
	H5bL7Vn9ZT8otnp0kY8A9z+F0OCBU0Qk4y+4cHMli7dTBEI7iPdHkkfXiltG4B4Y+JhyejEgrDCMS
	/bUyInP05fYcjZSb5bWteKC0hAX9LdDvlgSnApmRPn5uh9rN2BrlCrrW6t5L41NDgE1URMLUG39tI
	RXPenmbmI5FxGTLS+Pjqx6ekQ2V03PVonUKiP1iSqk4bE51AJrrbLgfpYXMr2M3kVJZnHmQdKUS2X
	B6VoUDQuIUTXqBsYdrjPsuvsxnMVcOAnGJYvWHnJZAn2rGmuEFAVjcAqEIjf5IgYrzZmQaQA1+h7C
	2eH3WW8VP7AVZnHmGrAKGVREvZPGmIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCQd-0000IL-QT; Wed, 20 May 2020 00:17:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCQa-0000HN-HB
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 00:17:46 +0000
Received: by mail-oi1-x229.google.com with SMTP id j145so1438875oib.5
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 17:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:subject:message-id:reply-to:mime-version
 :content-disposition:user-agent;
 bh=UYoOd8AM/Yp9BPVsKpI3c/42NYWwCXTzVEOS872/v9M=;
 b=NhQxs9eS4rNS9u07k9rTw0lPdsGT3Cd8KD9LK7FM8uiUVysCIkiHe9PHM/Hfv4rM0m
 zjWCeq+uKEvWrIRODPAGEChV3pLeenLLW6qyuBYWd4w4tPVJCzNOzDlm4Ye/J0Lsv5Cg
 K6fYgKd0vbQYQCLqVu7q7qXWY9MNvw9lvVI9W5DpfzgRrObjGi+4FqvASQS4+dgd2Fn0
 SZVBai9qDo1m1PRJF2hJ9U/kdfNAvuxS571bqBRcowGZdUMOU+/IDfewAixtCliqwl+D
 oT99qyFVptdvzGqvjktE5C+1winW/ol3PJ2/baOyMK0YSxZUf3bCsJMQGQmMZ0D5f8yX
 bXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:subject:message-id:reply-to
 :mime-version:content-disposition:user-agent;
 bh=UYoOd8AM/Yp9BPVsKpI3c/42NYWwCXTzVEOS872/v9M=;
 b=HjBx8lVsjZ2QE1dh5UH6jqtHmBFF+Xh9aVtZ+tNeoR5z+0WfrXiJ/rQp7DntIp8Mfp
 CLLiTvaJiSTZLy3QGcBjpj+O+Djp3suFfBCQdKZceUE7A77wiFf0UyrsPCfNZzBj8NhQ
 Usvm4DKFEKhf5s9wlhfCzx1dWLBm7a1wnSiyGaMUtFmScSoLwf08RoTwhAvKvhS6ocqk
 66ZrenHqR+UFiUwvPOm8rnxVXq1Dug8RVpt9YtMCrxm1wiDZMciRMvw0QjiqrSIwrcEq
 XziMq8kncwDV0lK4NVqry73JLCutD+hjwEluF1FWzanONovdQ/0PT8eyE7fX4vFbPjkz
 Uu2Q==
X-Gm-Message-State: AOAM5312+I50XqvMTz6Fj3HwtVFowGlo5YxjalPX7fZCTYBV9rkX7VnD
 ur45Fq0OtxSf33Jky8yInOU=
X-Google-Smtp-Source: ABdhPJzEzD9MuUo9vZ/Zt7s9fvu0XXiFzl1AUGyp+CU/THV+g/3B2brqixWlcVmJNdVt5cPcNGq3zQ==
X-Received: by 2002:aca:4155:: with SMTP id o82mr1582551oia.16.1589933863109; 
 Tue, 19 May 2020 17:17:43 -0700 (PDT)
Received: from sreeram-MS-7B98 (cpe-173-174-83-82.austin.res.rr.com.
 [173.174.83.82])
 by smtp.gmail.com with ESMTPSA id t22sm365558ooc.37.2020.05.19.17.17.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 17:17:42 -0700 (PDT)
From: Sreeram Veluthakkal <srrmvlt@gmail.com>
X-Google-Original-From: Sreeram Veluthakkal <srrmvlt+dell@gmail.com>
Date: Tue, 19 May 2020 19:17:40 -0500
To: dwmw2@infradead.org, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: PROBLEM: JFFS2 Summary Oops - v4.19.16
Message-ID: <20200520001740.GA14040@sreeram-MS-7B98>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_171744_587026_E7803249 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Reply-To: srrmvlt+dell@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[1.] One line summary of the problem: JFFS2 Summary Oops - v4.19.16
[2.] Full description of the problem/report:
Kernel oops in JFFS2  in 4.19.16 (tainted). I couldn't find any similar known problems or a way to recreate this bug. Appreciate any leads to help recreate/rootcause/fix this bug.

There are two partitions mounted with jffs2.
mtd:abc on /flash/mnt1 type jffs2 (rw,seclabel,noatime)
/dev/mtdblock1 on /flash/mnt2 type jffs2 (rw,seclabel,relatime)

/flash/mnt2 generally has more I/O than /flash/mnt1. After the system rebooted, I checked the disk usage of both paritions and they were under 40%.

[3.] Keywords (i.e., modules, networking, kernel): JFFS2, filesystem, SPI
[4.] Kernel information
[4.1.] Kernel version (from /proc/version): Linux version 4.19.16 (oe-user@oe-host) (gcc version 7.3.0 (GCC)) #1 SMP Thu Mar 12 02:29:52 UTC 2020
[4.2.] Kernel .config file:
[5.] Most recent kernel version which did not have the bug:
[6.] Output of Oops.. message (if applicable) with symbolic information
     resolved (see Documentation/admin-guide/bug-hunting.rst)

[  513.760000] ------------[ cut here ]------------
[  513.760000] kernel BUG at fs/jffs2/summary.c:862!
[  513.770000] Internal error: Oops - BUG: 0 [#1] SMP ARM
[  513.800000] CPU: 1 PID: 1976 Comm: jffs2_gcd_mtd10 Tainted: G           O      4.19.16 #1
[  513.810000] PC is at jffs2_sum_write_sumnode+0x88/0x54c
[  513.820000] LR is at jffs2_sum_write_sumnode+0x88/0x54c
[  513.820000] pc : [<b03c5f3c>]    lr : [<b03c5f3c>]    psr: 60000013
[  513.830000] sp : c5d17c90  ip : 00000000  fp : c5d17d8c
[  513.830000] r10: 000000c4  r9 : 00000f84  r8 : c5c7829c
[  513.840000] r7 : c7ce5800  r6 : 00000fac  r5 : c7ce5800  r4 : c6a22a80
[  513.850000] r3 : 86281bc8  r2 : 86281bc8  r1 : ccb2e2e8  r0 : 00000045
[  513.850000] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  513.860000] Control: 18c5387d  Table: 0ecb804a  DAC: 00000051
[  513.870000] Process jffs2_gcd_mtd10 (pid: 1976, stack limit = 0xa8ed1488)
[  513.870000] Stack: (0xc5d17c90 to 0xc5d18000)
[  513.880000] 7c80:                                     60000013 00000001 c5d17cb0 b08880ec
[  513.880000] 7ca0: c7ce5940 c7ce5918 00000000 b0d054c8 00000000 00000000 00000000 c5d17cbc
[  513.890000] 7cc0: c5d17cbc 86281bc8 a0000013 c7ce5960 c7ce5800 c7eb6ba0 00000002 000005d6
[  513.900000] 7ce0: 00000000 86281bc8 c79621f8 c7ce5800 c5c7829c 00000fac c7ce5800 b0a333bc
[  513.910000] 7d00: 00000f84 000000c4 c5d17d8c b03b5068 00001f40 b03b73e4 00000044 000000c4
[  513.920000] 7d20: c5d17de8 c5c9cb00 c7ce5918 000000c4 c7ce5800 00000f84 c5d17d8c c7eb6ba0
[  513.930000] 7d40: c7ce5800 b03b56f0 c5c9cb00 c796221c c7ce5800 00000000 00000f84 c5cff4e0
[  513.930000] 7d60: c7eb6ba0 b03bafe4 c7ce5960 ffffe000 c79621f8 00000008 b0142b98 00000001
[  513.940000] 7d80: b0d054c8 b03b7720 b0d05340 000000c4 c5d17de8 86281bc8 c7962238 c5c9cb00
[  513.950000] 7da0: c796221c c6a2b0f0 00000000 c5cff4e0 00001000 c79621f8 c7ce5800 b03bb9ec
[  513.960000] 7dc0: c7962238 b0d054c8 c79621f8 b08880d4 00001f40 b03be798 c5c799f8 000000c4
[  513.970000] 7de0: b0d054c8 c7ce5800 e0021985 00000d10 d440f0bb 00000008 000005d6 000081fc
[  513.970000] 7e00: 03d90000 00001f40 5e9af375 5e9af375 5e9af375 00000334 00000ccc 00000ccc
[  513.980000] 7e20: 00000000 f0504a5b a929cd16 86281bc8 c7ce5800 b0d054c8 c7ce5800 00000008
[  513.990000] 7e40: 00000000 c5cff4e0 00000008 b03bec90 c7ce5918 86281bc8 00000000 c7ce5800
[  514.000000] 7e60: c7ce5918 b0d054c8 00000000 ffffffb3 c5c799f8 c5cff4e0 c79621f8 b03baeb0
[  514.010000] 7e80: c695dcf0 b012701c c7ce5960 c7ce584c 0000000c 00000001 c695d800 b0888104
[  514.020000] 7ea0: b0d054c8 c5d17edc 86281bc8 86281bc8 b0d054c8 c695d800 c7ce5800 c7ce5918
[  514.020000] 7ec0: c5d16000 ffffe000 00000504 00000001 c6b24228 b03bdac0 b0d03900 00000001
[  514.030000] 7ee0: 00000000 00000001 00000000 00000080 00000000 00000000 00000000 00000000
[  514.040000] 7f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  514.050000] 7f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  514.060000] 7f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  514.060000] 7f60: 00000000 86281bc8 c6b24200 c9da5d80 00000000 c5d16000 c7ce5800 b03bd8ec
[  514.070000] 7f80: c7f41dd8 b01392ec 00000099 c9da5d80 b013919c 00000000 00000000 00000000
[  514.080000] 7fa0: 00000000 00000000 00000000 b01010e8 00000000 00000000 00000000 00000000
[  514.090000] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  514.100000] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[  514.110000] [<b03c5f3c>] (jffs2_sum_write_sumnode) from [<b03b5068>] (jffs2_do_reserve_space+0x84/0x3e0)
[  514.110000] [<b03b5068>] (jffs2_do_reserve_space) from [<b03b56f0>] (jffs2_reserve_space_gc+0x40/0x80)
[  514.120000] [<b03b56f0>] (jffs2_reserve_space_gc) from [<b03bafe4>] (jffs2_garbage_collect_pristine+0x64/0x400)
[  514.130000] [<b03bafe4>] (jffs2_garbage_collect_pristine) from [<b03bb9ec>] (jffs2_garbage_collect_live+0x4a0/0x10f0)
[  514.140000] [<b03bb9ec>] (jffs2_garbage_collect_live) from [<b03baeb0>] (jffs2_garbage_collect_pass+0x7d4/0x8a4)
[  514.150000] [<b03baeb0>] (jffs2_garbage_collect_pass) from [<b03bdac0>] (jffs2_garbage_collect_thread+0x1d4/0x20c)
[  514.170000] [<b03bdac0>] (jffs2_garbage_collect_thread) from [<b01392ec>] (kthread+0x150/0x15c)
[  514.170000] [<b01392ec>] (kthread) from [<b01010e8>] (ret_from_fork+0x14/0x2c)
[  514.180000] Exception stack(0xc5d17fb0 to 0xc5d17ff8)
[  514.190000] 7fa0:                                     00000000 00000000 00000000 00000000
[  514.190000] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  514.200000] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  514.210000] Code: e34b00a3 e593300c e59313a8 ebf69ae1 (e7f001f2) 
[  514.220000] ---[ end trace d60044e37afc2dfd ]---
[  514.230000] Kernel panic - not syncing: Fatal exception
[  514.240000] CPU0: stopping
[  514.240000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D    O      4.19.16 #1
[  514.240000] [<b010cd70>] (unwind_backtrace) from [<b0107538>] (show_stack+0x18/0x1c)
[  514.240000] [<b0107538>] (show_stack) from [<b086c208>] (dump_stack+0x88/0x9c)
[  514.240000] [<b086c208>] (dump_stack) from [<b010a248>] (handle_IPI+0x1d8/0x370)
[  514.240000] [<b010a248>] (handle_IPI) from [<b0102818>] (gic_handle_irq+0x7c/0x80)
[  514.240000] [<b0102818>] (gic_handle_irq) from [<b01020ac>] (__irq_svc+0x6c/0x90)
[  514.240000] Exception stack(0xb0d01f18 to 0xb0d01f60)
[  514.240000] 1f00:                                                       00000000 002ba614
[  514.240000] 1f20: ccb21300 b0112560 00000000 ffffe000 b0d054e8 b0d05530 00000001 00000000
[  514.240000] 1f40: b0c87968 b0d054c8 00000000 b0d01f68 b01043f0 b01043f4 600b0013 ffffffff
[  514.240000] [<b01020ac>] (__irq_svc) from [<b01043f4>] (arch_cpu_idle+0x3c/0x40)
[  514.240000] [<b01043f4>] (arch_cpu_idle) from [<b0146fb0>] (do_idle+0x104/0x200)
[  514.240000] [<b0146fb0>] (do_idle) from [<b014734c>] (cpu_startup_entry+0x20/0x24)
[  514.240000] [<b014734c>] (cpu_startup_entry) from [<b0c00ee4>] (start_kernel+0x468/0x490)
[  514.240000] Rebooting in 90 seconds..
[7.] A small shell script or example program which triggers the
     problem (if possible)
[8.] Environment
[8.1.] Software (add the output of the ver_linux script here)
Linux 4.19.16 #1 SMP Thu Mar 12 02:29:52 UTC 2020 armv7l armv7l armv7l GNU/Linux

Util-linux              226532
Mount                   226532
Module-init-tools       25
E2fsprogs               1.43.8
Nfs-utils               2.1.1
Linux C Library         2.27
Linux C++ Library       6.0.24
Procps                  3.3.12
Kbd                     2.0.4
Console-tools           2.0.4
Sh-utils                8.29
Udev                    237

Thanks
Sreeram

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
