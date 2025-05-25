Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F7C54ED0
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDrhpt3rY94jmA2y3DDs+BCTd1DIgLVzWAvxAbQl2Ak=; b=qaMsFVwenFw43M
	tp/8Spv3YmssW18P184Vu/2Ce5BGkH73z9OKzCj2uYO6Z+OJvkWRTbKfVo3PxMtyyAw6VlS2za5qO
	sJ5vXYDgdtYItQtMtjcBs6b0ppkKyT/aNWDJxWr1mG7IRv4PkZUe8GSRJEyH1zzkKumC0sr9pgbR4
	V5iZOocmTbU/TmjGXF83HS8K2EsP+bjc56VyPRIbh+KdaLOg/fK5GQjPO2u0fxe5fP6ZuT3kMgBR5
	Qm1YLO0Uq30owM1X242PLotNMOWnLSQJmEdYneRvoCzXpaGTV6vNJtI7s3ERj6CvuyslC7RDOjSGM
	waHE0eYNJbVD2myFenBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnL-00000007NoZ-20fK;
	Sun, 25 May 2025 17:05:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEnJ-00000007NnO-2NGI
	for linux-mtd@lists.infradead.org;
	Sun, 25 May 2025 17:05:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso465014f8f.1
        for <linux-mtd@lists.infradead.org>; Sun, 25 May 2025 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748192752; x=1748797552; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2akPuUw+gIZFjkf04UeDQsu+2uurc56nZpewRFko9I=;
        b=Ydr6MGY2qpLWV5C6ThYgvVlYBjjtzNx1N/XeEhjrziOemZ2AVQ2YQEGikEJ60dcZEp
         sRf9KqHfOCeSvyQ6Or4GGrUnQGLeNXkmJHJQmPy1jiQfkqCSHKqseF/fHvzN9I5kc6mP
         8tOQj+J1iE1/I0YHYjyaQETXaMTo6Zz8xPxJPHsDbAwipkUh9H0mVXcHbzVbsqSmwbAN
         kV5oRxC3cvf2JeDVPA/dkkQiHSEHqsLa8UUul4LBzXrc88fJKa5lfEbaIphHjD0IqCmP
         rQv0ATqobJJQKKhyF/WR+8ks0PQE0T1x2ktJmIGi5K2/6S4qv50bkiVZLRToSzStXID0
         ZbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748192752; x=1748797552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2akPuUw+gIZFjkf04UeDQsu+2uurc56nZpewRFko9I=;
        b=TM11YokvvDpRgZfmzt87qyewh8euFAF3q33rZlA//Ca0ivSKsg6i2Drhb2csdtm5jd
         rf4EVf39Z+7qq4h/ocMdVTrulhlOJjkbawgqe3pg16AXmh80quZIaS+zj8shBsTZjKQp
         0GQT7Yiu90bxDrSEWvKj8roR7L4Vz0UrhBg1lFpQSXomGZCR3U7BXPHiIAnimdL+c3/h
         Ai0j2xRKpQNRiq+r1FWJZcjnzO5IlQvYDOduG/MlUIUEPBHciulEAFLgIcXmQJZ6N5GM
         gBfVAknk1Lf1gjLLeu13HOThGgpjlXR8BnZuUXDQi91+ZymS6Olb9c0hgpiRoeOZLBkh
         bWnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYPY+Xr0kIro4I3W3INLi3hg66CLMfx1GhjhzCNakoM1bvIb4ZWUHK7fdoDw3eY9F8LxGiqnh8zs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxFV1x5UiApW+ckXJKAUD5ZSJcvM5IwGUAcf7sVpvPZ+uI0aH4
	xOnqPbGvAsSlj2B4EwOGHOPPQL3e/aZPMZcVkkRZJ+18rfmi08lXhtS1
X-Gm-Gg: ASbGnctqqg8HAWZTtB/mONlQ96zx53N33y/XC5vxkCeOt4jcC6ym0RkNFem27zjd6eC
	Zp+NzEdcgG1XzZKsXlZF9aCwnni0w1ygQAGXWfONLhsDFC0WwVtd6acUP8Is7I0KjPMXL8cpZMH
	al7PXvepGtaTz30dkd5OoH+4Xaxf87mrDTkCmsXQggqyBsb73hu4gpw4Zm9iqV9b1RtdZ31ZyQ2
	G8DlW/0jDTVhedvg1aOWE3PUKe4//jizaHitGEdBdWPyRWkojWNH360rkmn72U5LVNW6iv+snLk
	wWVizPEkq78NjE6mq6B7W/FcLdbaU7gSUCZXLuXI1O7iEGDae4Ql2Qb93Pzz52xLfYaxVfhBKsm
	qH/5a
X-Google-Smtp-Source: AGHT+IFTG1zfpw1TAZICDvBjGKa+vyBp9G8T94H9OBGXHSAAfq7s76PI8VMCHTS/srxbB4VIdKEI+Q==
X-Received: by 2002:a05:6000:178d:b0:3a3:671e:3b7c with SMTP id ffacd0b85a97d-3a4cb4996c6mr4736749f8f.48.1748192751737;
        Sun, 25 May 2025 10:05:51 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm32317405f8f.22.2025.05.25.10.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 10:05:51 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 25 May 2025 19:05:35 +0200
Subject: [PATCH 1/2] spi: spi-qpic-snand: reallocate BAM transactions
MIME-Version: 1.0
Message-Id: <20250525-qpic-snand-avoid-mem-corruption-v1-1-5fe528def7fb@gmail.com>
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
In-Reply-To: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_100553_612946_2314FD0D 
X-CRM114-Status: GOOD (  21.64  )
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

Using the mtd_nandbiterrs module for testing the driver occasionally
results in weird things like below.

1. swiotlb mapping fails with the following message:

  [   85.926216] qcom_snand 79b0000.spi: swiotlb buffer is full (sz: 4294967294 bytes), total 512 (slots), used 0 (slots)
  [   85.932937] qcom_snand 79b0000.spi: failure in mapping desc
  [   87.999314] qcom_snand 79b0000.spi: failure to write raw page
  [   87.999352] mtd_nandbiterrs: error: write_oob failed (-110)

  Rebooting the board after that causes a panic:

  # reboot
  [  877.178844] Unable to handle kernel read from unreadable memory at virtual address 0000000000000078
  [  877.178913] Mem abort info:
  [  877.186767]   ESR = 0x0000000096000005
  [  877.189508]   EC = 0x25: DABT (current EL), IL = 32 bits
  [  877.193312]   SET = 0, FnV = 0
  [  877.198780]   EA = 0, S1PTW = 0
  [  877.201676]   FSC = 0x05: level 1 translation fault
  [  877.204684] Data abort info:
  [  877.209559]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  [  877.212669]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  [  877.217964]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  [  877.223098] user pgtable: 4k pages, 39-bit VAs, pgdp=00000000446ae000
  [  877.228470] [0000000000000078] pgd=080000004492d403, p4d=080000004492d403, pud=080000004492d403, pmd=0000000000000000
  [  877.234944] Internal error: Oops: 0000000096000005 [#1]  SMP
  [  877.245395] Modules linked in: mtd_test pppoe ppp_async nft_fib_inet nf_flow_table_inet pppox ppp_generic nft_reject_ipv6 nft_reject_ipv4 nft_reject_inet nft_reject nft_redir nft_quota nft_numgen nft_nat nft_masq nft_log nft_limit nft_hash nft_flow_offload nft_fib_ipv6 nft_fib_ipv4 nft_fib nft_ct nft_chain_nat nf_tables nf_nat nf_flow_table nf_conntrack slhc sfp qrtr_smd nfnetlink nf_reject_ipv6 nf_reject_ipv4 nf_log_syslog nf_defrag_ipv6 nf_defrag_ipv4 mdio_i2c crc_ccitt evdev gpio_fan crypto_user algif_skcipher algif_rng algif_hash algif_aead af_alg sha512_generic seqiv geniv drbg hmac arc4 libarc4 gpio_keys usb_storage input_core leds_gpio xhci_plat_hcd xhci_pci xhci_hcd dwc3 dwc3_qcom phy_qcom_qusb2 phy_qcom_qmp_usb phy_qcom_m31 aquantia hwmon crc_itu_t crc32c_generic
  [  877.297039] CPU: 1 UID: 0 PID: 2060 Comm: reboot Not tainted 6.15.0-rc4+ #0 NONE
  [  877.319267] Hardware name: Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (DT)
  [  877.326820] pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  877.333936] pc : wakeup_flusher_threads+0x98/0x1d0
  [  877.340792] lr : wakeup_flusher_threads+0x128/0x1d0
  [  877.345653] sp : ffffffc082b23db0
  [  877.350426] x29: ffffffc082b23db0 x28: ffffff8003dd4000 x27: 0000000000000000
  [  877.353902] x26: 0000000000000000 x25: 0000000000000000 x24: ffffffc081c89b08
  [  877.361021] x23: ffffffc081cafc78 x22: 0000000000000020 x21: 0000000000000002
  [  877.368138] x20: 0000000000000001 x19: ffffffc08032c000 x18: 0000000000000000
  [  877.375257] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  [  877.382374] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
  [  877.389492] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc08032c36c
  [  877.396610] x8 : 0000000000000001 x7 : ffffffc080327318 x6 : 0000000000000000
  [  877.403728] x5 : 0000000000000000 x4 : 000000000002000f x3 : 0000000000000000
  [  877.410847] x2 : 0000000000000001 x1 : ffffff8003dd4000 x0 : 0000000000000040
  [  877.417965] Call trace:
  [  877.425078]  wakeup_flusher_threads+0x98/0x1d0 (P)
  [  877.427337]  ksys_sync+0x2c/0xa0
  [  877.432197]  __arm64_sys_sync+0x18/0x30
  [  877.435582]  invoke_syscall.constprop.0+0x64/0x110
  [  877.439143]  do_el0_svc+0x48/0xd8
  [  877.444003]  el0_svc+0x3c/0xf8
  [  877.447388]  el0t_64_sync_handler+0x10c/0x138
  [  877.450341]  el0t_64_sync+0x180/0x188
  [  877.454770] Code: d1008016 eb17001f 540002c0 a90153f3 (f9402ec0)
  [  877.458416] ---[ end trace 0000000000000000 ]---
  [  877.464492] Kernel panic - not syncing: Oops: Fatal exception
  [  877.469180] SMP: stopping secondary CPUs
  [  877.474825] Kernel Offset: disabled
  [  877.478812] CPU features: 0x0000,00000068,00000000,0200400b
  [  877.482025] Memory Limit: none
  [  877.487581] Rebooting in 3 seconds..

2. If the swiotlb mapping does not fail, rebooting the board may result
in a different panic:

  # reboot
  [  256.104459] BUG: spinlock bad magic on CPU#3, procd/2241
  [  256.104488] Unable to handle kernel paging request at virtual address ffffffff0000049b
  [  256.108827] Mem abort info:
  [  256.116548]   ESR = 0x0000000096000005
  [  256.119240]   EC = 0x25: DABT (current EL), IL = 32 bits
  [  256.123060]   SET = 0, FnV = 0
  [  256.128528]   EA = 0, S1PTW = 0
  [  256.131391]   FSC = 0x05: level 1 translation fault
  [  256.134431] Data abort info:
  [  256.139291]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  [  256.142419]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  [  256.147713]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  [  256.152836] swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000041e5b000
  [  256.158218] [ffffffff0000049b] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
  [  256.164906] Internal error: Oops: 0000000096000005 [#1]  SMP
  [  256.173323] Modules linked in: mtd_test pppoe ppp_async nft_fib_inet nf_flow_table_inet pppox ppp_generic nft_reject_ipv6 nft_reject_ipv4 nft_reject_inet nft_reject nft_redir nft_quota nft_numgen nft_nat nft_masq nft_log nft_limit nft_hash nft_flow_offload nft_fib_ipv6 nft_fib_ipv4 nft_fib nft_ct nft_chain_nat nf_tables nf_nat nf_flow_table nf_conntrack slhc sfp qrtr_smd nfnetlink nf_reject_ipv6 nf_reject_ipv4 nf_log_syslog nf_defrag_ipv6 nf_defrag_ipv4 mdio_i2c crc_ccitt evdev gpio_fan crypto_user algif_skcipher algif_rng algif_hash algif_aead af_alg sha512_generic seqiv geniv drbg hmac arc4 libarc4 gpio_keys usb_storage input_core leds_gpio xhci_plat_hcd xhci_pci xhci_hcd dwc3 dwc3_qcom phy_qcom_qusb2 phy_qcom_qmp_usb phy_qcom_m31 aquantia hwmon crc_itu_t crc32c_generic
  [  256.225139] CPU: 3 UID: 0 PID: 2241 Comm: procd Not tainted 6.15.0-rc4+ #0 NONE
  [  256.247369] Hardware name: Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (DT)
  [  256.254921] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  256.261951] pc : spin_bug+0x70/0xd8
  [  256.268806] lr : spin_bug+0x68/0xd8
  [  256.272278] sp : ffffffc083763b00
  [  256.275750] x29: ffffffc083763b00 x28: ffffff80005b8000 x27: ffffffc0827f4000
  [  256.279225] x26: ffffffc080dab000 x25: ffffffc083763c18 x24: ffffff80005b8000
  [  256.286344] x23: 0000000000000002 x22: ffffffc081c00c00 x21: ffffffff0000001b
  [  256.293462] x20: ffffffc080d44c80 x19: ffffff8004d52888 x18: 0000000000000005
  [  256.300580] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000006
  [  256.307698] x14: 0000000000000000 x13: 313432322f64636f x12: ffffffc081c707b8
  [  256.314816] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffffc0800cdfd0
  [  256.321935] x8 : c0000000ffffefff x7 : ffffffc081c186a8 x6 : 0000000000057fa8
  [  256.329052] x5 : ffffffc081c70760 x4 : 0000000000000000 x3 : ffffffc0837638e0
  [  256.336170] x2 : 000000000000001b x1 : ffffff80005b8000 x0 : 000000000000002c
  [  256.343289] Call trace:
  [  256.350402]  spin_bug+0x70/0xd8 (P)
  [  256.352660]  do_raw_spin_lock+0xa4/0x128
  [  256.356132]  _raw_spin_lock_irqsave+0x70/0x98
  [  256.360299]  __mutex_lock+0x268/0xdf0
  [  256.364552]  mutex_lock_nested+0x2c/0x40
  [  256.368199]  device_shutdown+0xfc/0x260
  [  256.372191]  kernel_restart+0x4c/0xb8
  [  256.375750]  __do_sys_reboot+0x108/0x230
  [  256.379570]  __arm64_sys_reboot+0x2c/0x40
  [  256.383563]  invoke_syscall.constprop.0+0x64/0x110
  [  256.387470]  do_el0_svc+0x48/0xd8
  [  256.392156]  el0_svc+0x3c/0xf8
  [  256.395541]  el0t_64_sync_handler+0x10c/0x138
  [  256.398494]  el0t_64_sync+0x180/0x188
  [  256.402923] Code: 54000220 940009a5 b9400662 b4000295 (b94482a4)
  [  256.406570] ---[ end trace 0000000000000000 ]---
  [  256.412645] Kernel panic - not syncing: Oops: Fatal exception
  [  256.417340] Kernel Offset: disabled
  [  256.422972] CPU features: 0x0000,00000068,00000000,0200400b
  [  256.426273] Memory Limit: none
  [  256.431828] Rebooting in 3 seconds..

Investigating the issue revealed that these symptoms are results of
memory corruption which is caused by out of bounds access within the
driver.

The driver uses a dynamically allocated structure for BAM transactions,
which structure must have enough space for all possible variations of
different flash operations initiated by the driver. The required space
heavily depends on the actual number of 'codewords' which is calculated
from the pagesize of the actual NAND chip.

Although the qcom_nandc_alloc() function allocates memory for the BAM
transactions during probe, but since the actual number of 'codewords'
is not yet know the allocation is done for one 'codeword' only.

Because of this, whenever the driver does a flash operation, and the
number of the required transactions exceeds the size of the allocated
arrays the driver accesses memory out of the allocated range.

To avoid this, change the code to free the initially allocated BAM
transactions memory, and allocate a new one once the actual number of
'codewords' required for a given NAND chip is known.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index fd129650434f0129e24d3bdac7e7c4d5542627e6..c552cb7aa80e368e193d71e1826b2cc005571a9c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -315,6 +315,22 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 
 	mtd_set_ooblayout(mtd, &qcom_spi_ooblayout);
 
+	/*
+	 * Free the temporary BAM transaction allocated initially by
+	 * qcom_nandc_alloc(), and allocate a new one based on the
+	 * updated max_cwperpage value.
+	 */
+	qcom_free_bam_transaction(snandc);
+
+	snandc->max_cwperpage = cwperpage;
+
+	snandc->bam_txn = qcom_alloc_bam_transaction(snandc);
+	if (!snandc->bam_txn) {
+		dev_err(snandc->dev, "failed to allocate BAM transaction\n");
+		ret = -ENOMEM;
+		goto err_free_ecc_cfg;
+	}
+
 	ecc_cfg->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
 			FIELD_PREP(UD_SIZE_BYTES_MASK, ecc_cfg->cw_data) |
 			FIELD_PREP(DISABLE_STATUS_AFTER_WRITE, 1) |

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
