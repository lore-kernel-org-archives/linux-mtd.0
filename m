Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1711C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Zkx7mgcKMgyMagdwPko2sq7CKiqrFf9hSpQgoIgKlc=; b=p/7bXTad2CzLsZ
	U2SNE3y4B3HIt1ZFq/mCQJ1aGiohWlJR6g4xduy2KGxQbbaopMp4T44mr4hr4fZveWKZFyVYM3ehY
	+csXYs+1a8H0vy+ygHRQXIm/TRE9z6Y8//vTd0bWbdV6HruuCo++cCA3ihPydiwefwCsPdetRecZj
	bdTken/LL9MuyMYJHUZEhDFAHLg/qNIGHYAN0TQ7heOKGZbbbksLtWLQQM+45+7ezBZnxWKm13gms
	a6BRUKHkEHfrSZuf2dwefUw26l9SmEYExg9LUyV9R8fz0+18bUc6EfxQFrmjWBwRA94XyfmkxMPbN
	FjnxXgi80nS0N6iIveCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzMb-0058gJ-39;
	Wed, 19 Jul 2023 05:04:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzMa-0058fX-1P
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aIWX+0QkR2seeNG4gDy+FdG9otR+wY0jdRk5Cj3RhpI=; b=TywDRaR/SCgJt+BGvgzBabRMn+
	W5lkUBKlhPaJYZWy1b5X54zyySHxdw98EuhlUsQjGpOvJLoZbkruy3a3MsE+MFI6ld39y+9VmXccT
	CF0IKhlja2+oeX0ir2i6E7A+FWHI8FHjwF+PBR00jHdUeVArPBL238mBRc3O0r8aFzbGnNcmvnnNE
	a++jAmxU/zEYL/+OMxKu87j6s52FWK7YKLmijn8Rnqxs1EcXQa3peKXnVAN2iIpL2y/2dbIWNYzKh
	RG0yphz7DFBu9mXT7IIkznvAn4jB6hvkEV5wpriG32Ut76nEuoLmhSJzBW2kFiLM7t6HxdWs4yspX
	k7/Y29sg==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnz2-00Bm63-1h
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:55:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso9681503e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689699211; x=1692291211;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIWX+0QkR2seeNG4gDy+FdG9otR+wY0jdRk5Cj3RhpI=;
        b=bY4mh7pAYXCi5ofSU6YgOLwOlzNiipc0rS/N3O3MF43SZPO55NMteq8blAmiVG7nT3
         zf+QYzm24SZhPoVp8iYq8euC3M0B1V03xIrC+1gBGo9NHkR8vSiF+RD96q9WaXomezVc
         VMAxAW4B4X5qZaj0uyK7D/zfvhiNeh1dwlAZmbm2oprKmm9bE7xdAi49lPuMA1vaOmn3
         9KtuebpRgNDHIrXLQUffT9W6QX5Dvu86zqw3CAe8ubWz3NE/BGxcgdDMgiZkp4DKXpsq
         38TRmhRHR4fuv29u10KOE76MXcVr26gF7YnGuP4pWgkcRBPr+6uRxNy8DOWoA2XDc9rN
         KxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689699211; x=1692291211;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIWX+0QkR2seeNG4gDy+FdG9otR+wY0jdRk5Cj3RhpI=;
        b=iQ34Dh8gWvH+EPk2xBK+FhP/Td/LOjwMvDO8U5NRQCMXXIC79yGuAT7t8SWDS40lfs
         vYEcVs9eFqN4A3/qHvwuygClraxSs5uNMoPDZ+eAiDBhJFKIPjSfLsTJlhZu+qmJq/w+
         3MjMiMuFhNelk8aGlr8iqxuzKdSMMLmYnp71KA0YfVlksGXnno1gmmYLgC4aSQTCUg1p
         rpWCw5EquuV37yA1rSFMIwDRKmD+3cU7o2RrB1ioTBnnEUodvKV3jLVuZ4CylhUy5skl
         L1o9MO2fSFoN3E5VgFqRcRfdQqTk0TB7tg0+egrD5cUzk3T6XCfmRxX+B1JkiGwLq97X
         XDhQ==
X-Gm-Message-State: ABy/qLYy5wlVCzH1xeA6DTCJdMRgkB5unKxzXrZFaWWuS7GM61Bv9QqZ
	arWKY6JtobTist1c1LIn3rL/w24y5/P0PbOe
X-Google-Smtp-Source: APBJJlG2zw76wKh8Nx0j2+eftk//UrSKvOU1k8CnYe8ogaiZYIROXGghejKexVUnl1UiQwajoCXuQg==
X-Received: by 2002:ac2:4318:0:b0:4fb:9d61:db44 with SMTP id l24-20020ac24318000000b004fb9d61db44mr12428399lfh.12.1689699210970;
        Tue, 18 Jul 2023 09:53:30 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id w18-20020a05651203d200b004faa2de9877sm515026lfp.286.2023.07.18.09.53.30
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 09:53:30 -0700 (PDT)
Message-ID: <e2901183-7f81-7a32-0a31-df01ceb34009@gmail.com>
Date: Tue, 18 Jul 2023 18:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: MTD Maling List <linux-mtd@lists.infradead.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: mtd: WARNING: CPU: 0 PID: 1 at del_gendisk+0x27c/0x2fc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_175532_711178_976536A5 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I've noticed a following WARNING with Linux 6.1.38. It seems harmless
but probably should be taken care of. I'm not familiar with blktrans.
Any volunteers? :)


[    0.592614] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xdc
[    0.599135] nand: AMD/Spansion NAND 512MiB 3,3V 8-bit
[    0.604338] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    0.612144] bcm63138_nand ff801800.nand-controller: detected 512MiB total, 128KiB blocks, 2KiB pages, 16B OOB, 8-bit, BCH-4
[    0.624870] Bad block table found at page 262080, version 0x01
[    0.632759] Bad block table found at page 262016, version 0x01
[    0.639200] 2 cmdlinepart partitions found on MTD device brcmnand.0
[    0.645580] Creating 2 MTD partitions on "brcmnand.0":
[    0.650877] 0x000000000000-0x000000100000 : "loader"
[    0.687209] offset:0x40000 magic:0x75456e76 BINGO
[    0.743290] offset:0xac000 magic:0x75456e76 BINGO
[    0.748051] 2 brcm_u-boot partitions found on MTD device loader
[    0.754149] Creating 2 MTD partitions on "loader":
[    0.759072] 0x000000040000-0x000000044008 : "u-boot-env"
[    0.764540] mtd: partition "u-boot-env" doesn't end on an erase/write block -- force read-only
[    0.773565] mtd mtd1: Failed to register NVMEM device: -517
[    0.779278] Deleting MTD partitions on "brcmnand.0":
[    0.784337] Deleting loader MTD partition
[    0.788452] [del_mtd_device] Calling not->remove: blktrans_notify_remove
[    0.795372] ------------[ cut here ]------------
[    0.800098] WARNING: CPU: 0 PID: 1 at del_gendisk+0x27c/0x2fc
[    0.806013] Modules linked in:
[    0.809150] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.38 #0
[    0.815240] Hardware name: Luxul RT-20 (DT)
[    0.819543] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.826710] pc : del_gendisk+0x27c/0x2fc
[    0.830742] lr : del_mtd_blktrans_dev+0x34/0x1bc
[    0.835490] sp : ffffffc00802b6d0
[    0.838896] x29: ffffffc00802b6d0 x28: 0000000000000000 x27: ffffff8000f62548
[    0.846242] x26: ffffffc008a408a0 x25: ffffffc0088497f0 x24: ffffffc008849818
[    0.853589] x23: ffffffc008a40a20 x22: ffffff80014e64a0 x21: ffffff80014db000
[    0.860936] x20: ffffff8000c61600 x19: ffffff8001604700 x18: 000000000000006c
[    0.868285] x17: 0000000025d6171a x16: 0000000023ac72e8 x15: ffffffc0089b8898
[    0.875631] x14: 0000000000000144 x13: 000000000000006c x12: 00000000ffffffea
[    0.882978] x11: 00000000ffffefff x10: ffffffc008a10898 x9 : ffffffc0089b8840
[    0.890325] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
[    0.897673] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc00802b560
[    0.905020] x2 : ffffffc0089b87f0 x1 : 0000000000000000 x0 : 0000000000000004
[    0.912369] Call trace:
[    0.914877]  del_gendisk+0x27c/0x2fc
[    0.918549]  del_mtd_blktrans_dev+0x34/0x1bc
[    0.922941]  mtdblock_remove_dev+0x10/0x20
[    0.927151]  blktrans_notify_remove+0x88/0xd0
[    0.931631]  del_mtd_device+0x124/0x150
[    0.935573]  __del_mtd_partitions+0x94/0x110
[    0.939965]  del_mtd_partitions+0x48/0x70
[    0.944086]  add_mtd_partitions+0xa0/0x1c0
[    0.948296]  parse_mtd_partitions+0x470/0x4c0
[    0.952777]  add_mtd_partitions+0x190/0x1c0
[    0.957078]  parse_mtd_partitions+0x470/0x4c0
[    0.961558]  mtd_device_parse_register+0xe8/0x2e0
[    0.966396]  brcmnand_init_cs+0x180/0x200
[    0.970517]  brcmnand_probe+0x830/0xd20
[    0.974459]  bcm63138_nand_probe+0x80/0xa0
[    0.978671]  platform_probe+0x68/0xc0
[    0.982435]  really_probe+0xbc/0x2dc
[    0.986108]  __driver_probe_device+0x78/0x120
[    0.990588]  driver_probe_device+0x40/0x120
[    0.994888]  __driver_attach+0x94/0x19c
[    0.998831]  bus_for_each_dev+0x60/0xa0
[    1.002774]  driver_attach+0x24/0x30
[    1.006447]  bus_add_driver+0x154/0x20c
[    1.010389]  driver_register+0x78/0x130
[    1.014331]  __platform_driver_register+0x28/0x34
[    1.019170]  bcm63138_nand_driver_init+0x1c/0x28
[    1.023920]  do_one_initcall+0x50/0x1d0
[    1.027862]  kernel_init_freeable+0x234/0x298
[    1.032342]  kernel_init+0x28/0x130
[    1.035926]  ret_from_fork+0x10/0x20
[    1.039599] ---[ end trace 0000000000000000 ]---
[    1.044438] [del_mtd_device] Done
[    1.047892] Failed to parse subpartitions: -517
[    1.052482] Deleting MTD partitions on "brcmnand.0":


diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 35a7adad4..03f4d844e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -557,7 +557,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
  		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
  			mtd->nvmem = NULL;
  		} else {
-			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
+			dev_err(&mtd->dev, "Failed to register NVMEM device: %ld\n", PTR_ERR(mtd->nvmem));
  			return PTR_ERR(mtd->nvmem);
  		}
  	}
@@ -810,8 +810,11 @@ int del_mtd_device(struct mtd_info *mtd)

  	/* No need to get a refcount on the module containing
  		the notifier, since we hold the mtd_table_mutex */
-	list_for_each_entry(not, &mtd_notifiers, list)
+	list_for_each_entry(not, &mtd_notifiers, list) {
+		pr_info("[%s] Calling not->remove: %ps\n", __func__, not->remove);
  		not->remove(mtd);
+		pr_info("[%s] Done\n", __func__);
+	}

  	if (mtd->usecount) {
  		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
