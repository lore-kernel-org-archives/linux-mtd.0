Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAEBC48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 15:06:50 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5046157F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 15:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5046157F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Resent-To:Resent-Message-ID:Resent-Date:Resent-From:Reply-To:
	Content-ID:Content-Description:Resent-Sender:Resent-Cc:In-Reply-To:References
	:List-Owner; bh=JA3pArTyH96X2IpQhhuJ8Y5jujzDevfNNI2kJglN708=; b=CVE0aPJLL6aeR
	OHpYknf13VEIz5/FBwDv5Mjl20u0fHisJgVk8qphplJx+VtSMWokgkVh66VeFatY/ztgQoYgral9P
	clU1OJ8y9Huy3rewa4hH/mkB8FX7rgpKDJAdO6NWlDU0I/8CJpqKN3Dt1Es8MhSElDIZrkDk7B1N1
	9Q+fLX+s5nNuNIW34DWCs9RjLSj8H2TY7TMgj3lt885zEI3iY3LijRimysANTISIhrmCLTVEM4/+A
	sr4JphtZTizV6EjtnXdYeFLAFjDKt3lUfeEK1i1xNyMf9bFxGQwoPMVoANYm80MDTr+63GRTxY0R6
	v44ZoE/OkbpCieTUq0vdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9Gz-000E8D-FN; Tue, 15 Jun 2021 13:38:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9F8-000DEY-A0
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:MIME-Version:Resent-To:Resent-Message-ID:Resent-Date:Resent-From:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=; b=fX
 6nupvXeLbzpuZCXVXgdJLoV6GPTR4s4MAdZWKafjUW/b9ROLSt678noYWVlAMAjuOVxKZh9yGr0S6
 WiD2WVMXDAUV5EZ/ercbdxKoIuQRqOZa1XlA7y5n/2lzepaghQGUFVo6AqvMyYPUuMd5TehSufkoY
 brys4oCyXH3vILMhBI8eVRDNBZb0mvm4gCk9LxgBlDBCmp4HmYAI5mFxY0p61cF/5eFzZzw0GVoBG
 6Xj1QLygkYsAEK5zeTvCVjCTgXWjTvXbVEhpfJ69JcNwFps/e8h/JdLkG2baD3VtxO5TY4kZTuxcv
 ry4zmH4Yk0imO2UY9AbD5Ez7NX9vpCxQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt7jE-007pE5-TV
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 11:59:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3F8F6145C
 for <linux-mtd@lists.infradead.org>; Tue, 15 Jun 2021 11:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qvu/cXi8"
Resent-From: Will Deacon <will@kernel.org>
Resent-Date: Tue, 15 Jun 2021 12:59:38 +0100
Resent-Message-ID: <20210615115938.GE20598@willie-the-truck>
Resent-To: linux-mtd@lists.infradead.org
Received: by 2002:aa6:cb52:0:b029:fa:7990:4c75 with SMTP id h18csp3951187lkt; 
 Tue, 15 Jun 2021 04:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsTB4MeC5TodyaI7LAFR5x5zXd3n8q4kku4NsZHpVrIDZnwYwkpfr59EQPEm+5qe/qcZEO
X-Received: by 2002:a17:90a:b390:: with SMTP id
 e16mr24532044pjr.146.1623756003402; 
 Tue, 15 Jun 2021 04:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623756003; cv=none;
 d=google.com; s=arc-20160816;
 b=jgZ7PzaXLOPSejnfnB85A6MexejaVOx7ed/1jwaYdQguKePb+U4R4t66D8zh333/L/
 Qi8L5ASjn5MTcb2vQY1L//OCRajLw+teuFlupYktlB/jd+CoWjVb2Xfxb2EqZMHFd/av
 SS8OpUHKLEpqiE45fmmrqt1Ib4RC+p1axiVlLyO0ufZwdcStyNzWEcDPTX0zdQY7L00v
 IX9vRI960UAYuQprJfDm+oprbup6/IcH1dbO5gg4cGQxm+U0XL8FsihLeTYTWNjNw7gh
 lOcB+Z6ydZY6D8OKBt2TMgmELv7DXpBF9wQFnqi7/iYo1GR/7l8je0g7tEprTdbn38T5
 mZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature
 :dmarc-filter:delivered-to;
 bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=;
 b=jIJcbT/o8nmAi5WfZ4OgebxM6mt3qQug8BoZM3icRBQ28+Qt/nQ72jQiNb+0gWTLZ3
 cDqt8K1d9bTcrRTZFrbAOqAzOsOHqFUefSlGcBiw5p0Q7dc+chTa0Iz4Hk4QuJX/Jk47
 immpy8CuX9qVhbQ1nSRKdWYU7Lja5Bm/Kd0hMafdSQk9Hm5idzB0rUdwixCvzllxtDgy
 OKVzvSTJXfN5kWsMxT2pgeMKlJmF8p9ZDq5PNF77vZj0h6pbdfJwtKT9B0qwccFEfU7Q
 rDfrMsHAj+Zujfob5R087dKAFHGEbjInjmaFwOLi9wLR6iO4HZ0wuQFLuw/tAfnjVNzb
 atXQ==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=pass header.i=@linaro.org header.s=google header.b="qvu/cXi8";
 spf=pass (google.com: domain of
 srs0=bdlb=lj=linaro.org=naresh.kamboju@kernel.org designates 198.145.29.99 as
 permitted sender)
 smtp.mailfrom="SRS0=bDlB=LJ=linaro.org=naresh.kamboju@kernel.org"; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
 by mx.google.com with ESMTPS id c17si3819498plg.84.2021.06.15.04.20.03
 for <will.deacon.lists@gmail.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jun 2021 04:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 srs0=bdlb=lj=linaro.org=naresh.kamboju@kernel.org designates 198.145.29.99 as
 permitted sender) client-ip=198.145.29.99; 
Authentication-Results: mx.google.com;
 dkim=pass header.i=@linaro.org header.s=google header.b="qvu/cXi8";
 spf=pass (google.com: domain of
 srs0=bdlb=lj=linaro.org=naresh.kamboju@kernel.org designates 198.145.29.99 as
 permitted sender)
 smtp.mailfrom="SRS0=bDlB=LJ=linaro.org=naresh.kamboju@kernel.org"; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail.kernel.org (Postfix)
 id 115D361459; Tue, 15 Jun 2021 11:20:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CEF9D61432
 for <will@kernel.org>; Tue, 15 Jun 2021 11:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF9D61432
Authentication-Results: mail.kernel.org;
 dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org;
 spf=tempfail smtp.mailfrom=naresh.kamboju@linaro.org
Received: by mail-ej1-f43.google.com with SMTP id g20so22047487ejt.0
 for <will@kernel.org>; Tue, 15 Jun 2021 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=;
 b=qvu/cXi8LAEVvTXCOgV6EdujzUvor9gxWDJoh8e5/wgsdBPRFBJ9L2EK4uKNtfR3ty
 mVHuBDENDndaLxF2UZ8qTSVE1s+oOADiGbptv31TDjJiWDQ/Cn+TGkj53Afn1OA9neQn
 MNEm1P9hheTcmMkl/ybxp8hL0LG3TbehBOk2fCBL10FzmFYhkQxp/k/F3CEwaXjIRBpT
 NtR2B+HyMmjThVRgE+FNQM0rYt4esAmRHBwSekUacelfTowzOOtv45Z+FFjwtv2nrhCg
 awG7WAKI/rCCH4Zud+Qwe+JNVbOGolpSAz86lci7fAcnEdzylVI8H0jqUV3KDysasJQA
 LVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=;
 b=Jbj/Z51FgpqeXlDzfGr+FSpHduVzMDluh4gDTkEJ1KUcDAIwEoAyAV6Veh2oXuf+uu
 WrkBG2Sg1ji/2IZQVGdIZSMvvkEChaYW+OMSCKGhLhtVmAmJvxL5vD/kzJ/zn6v9TENK
 BL4PknGPNluCdSvHHFJ/yYsOBUKutk9xBGwFmIXuZ10dqh1goy8LjszEmb0ebqrU61QK
 gPx1a2g1ggQo4Vg3/YCZsWTMaygEWnAsbmZiGjzG/dNVfezzuJpshTFJIuTBef6y+BfD
 jFJV6wFGFqpEh4ESG4nf39kb0eyiyur1+3lpRpZR0nWeUBhapT4N2sZq94mp9kXnPXu5
 FrHg==
X-Gm-Message-State: AOAM531pADY4m+m/ZwqVnOevInEDwvWemYIEpPeeMT0QKX5mqs+U16op
 sZGRjSHWAwPv2zrzWbCRD4nAr0VfrcHbpFUG6cYaag==
X-Received: by 2002:a17:906:480a:: with SMTP id
 w10mr3748711ejq.18.1623756001316; 
 Tue, 15 Jun 2021 04:20:01 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Jun 2021 16:49:50 +0530
Message-ID: <CA+G9fYurEcTfV7Z=co2Ki-TubF4d-Ext7ivZPaQT9SR5XazUtQ@mail.gmail.com>
Subject: [next] [arm64] Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000068
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, 
 lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_125944_207539_67CE7D6B 
X-CRM114-Status: GOOD (  10.17  )
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

Following kernel crash reported while booting linux next 20210615 tag
on qemu_arm64.

Crash log:
-------------
[    0.767379] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000068
[    0.769815] Mem abort info:
[    0.770735]   ESR = 0x96000004
[    0.771598]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.773008]   SET = 0, FnV = 0
[    0.773865]   EA = 0, S1PTW = 0
[    0.774844]   FSC = 0x04: level 0 translation fault
[    0.776195] Data abort info:
[    0.776968]   ISV = 0, ISS = 0x00000004
[    0.778010]   CM = 0, WnR = 0
[    0.778961] [0000000000000068] user address but active_mm is swapper
[    0.780643] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.782189] Modules linked in:
[    0.783098] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
5.13.0-rc6-next-20210615 #1
[    0.785239] Hardware name: linux,dummy-virt (DT)
[    0.786626] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
[    0.788352] pc : blk_finish_plug+0x88/0x270
[    0.789598] lr : blk_queue_write_cache+0x34/0x80
[    0.790997] sp : ffff800012aeb9d0
[    0.791981] x29: ffff800012aeb9d0 x28: ffff0000c088eeb0 x27: ffff800011a27110
[    0.794067] x26: ffff0000c18511a0 x25: ffff8000114ecaa8 x24: 0000000005a00000
[    0.796127] x23: ffff8000114ed3c8 x22: 0000000000000000 x21: ffff0000c088fa00
[    0.798208] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000001
[    0.800239] x17: 7265727574636166 x16: 756e614d202e6b6e x15: ffff0000c0290488
[    0.802308] x14: ffffffffffffffff x13: ffff0000c088fa2c x12: ffff0000c088fa14
[    0.804341] x11: 0000000000000026 x10: 0000000000000401 x9 : ffff80001058247c
[    0.806408] x8 : ffff0000c088fa2c x7 : 0000000000000008 x6 : 0000000000000001
[    0.808429] x5 : ffff80001258a000 x4 : ffff80001258a260 x3 : 0000000000000068
[    0.810492] x2 : 0000000000000001 x1 : 0000000000000068 x0 : 0000000000020000
[    0.813153] Call trace:
[    0.813878]  blk_finish_plug+0x88/0x270
[    0.815064]  add_mtd_blktrans_dev+0x258/0x3f0
[    0.816316]  mtdblock_add_mtd+0x6c/0xb8
[    0.817428]  blktrans_notify_add+0x50/0x78
[    0.818666]  add_mtd_device+0x304/0x4d8
[    0.819790]  mtd_device_parse_register+0x1d8/0x2f0
[    0.821150]  physmap_flash_probe+0x4c8/0x7a8
[    0.822431]  platform_probe+0x70/0xe0
[    0.823494]  really_probe+0xf0/0x4d0
[    0.824539]  driver_probe_device+0x108/0x178
[    0.825760]  device_driver_attach+0x7c/0x88
[    0.827039]  __driver_attach+0xb8/0x190
[    0.828142]  bus_for_each_dev+0x78/0xd0
[    0.829254]  driver_attach+0x2c/0x38
[    0.830381]  bus_add_driver+0x14c/0x230
[    0.831502]  driver_register+0x6c/0x128
[    0.832604]  __platform_driver_register+0x30/0x40
[    0.833952]  physmap_init+0x24/0x30
[    0.835011]  do_one_initcall+0x50/0x2c8
[    0.836116]  kernel_init_freeable+0x25c/0x2e4
[    0.837366]  kernel_init+0x2c/0x138
[    0.838403]  ret_from_fork+0x10/0x18
[    0.839453] Code: c8037c22 35ffffa3 17fff238 f9800031 (c85f7c22)
[    0.841176] ---[ end trace 66ee8a40712bfd28 ]---
[    0.842563] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    0.844577] SMP: stopping secondary CPUs
[    0.845707] Kernel Offset: disabled
[    0.846731] CPU features: 0x10000071,00000846
[    0.847969] Memory Limit: none
[    0.848853] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

ref:
https://lkft.validation.linaro.org/scheduler/job/2901452#L556

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20210615
  kernel-config: https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/config

build link:
    https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/

Steps to reproduce:
--------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-9
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/config

--
Linaro LKFT
https://lkft.linaro.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
