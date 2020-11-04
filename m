Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519B3C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:32:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F3B20759
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seon6zrJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F3B20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Message-ID:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HVFHEl9/w16MBHEA7YsERieW4XyIcFk54AXArBe9TgM=; b=seon6zrJI7GDba3fJRsU+2R6es
	oZAWSc1heXzRTrN0zYiWE5siFF8len5S8jQ6dPgxkFQlrNEni4UXbh3fEoL17sD9ezF8IkRzztVcn
	Sb+w6DwYuJknhlfNeD36Y422A0dGAVsb+xtSbb6gLWB8iKRT9+94ZdEc4k2js9RiBkCfWxJ+cglt8
	gdsunAvKKMfIbAMg+35ibEPmRy3aiXuv2TcZWdE3LD0Mg4ByqyA8nB6F+1JvcmjImtjHveGiA0OfS
	M6d8xkwZxaHs9+N7L2idB69tmZvz3Lft9fVwS9S4oYBodW4lidxj2ychGFKS/lldnVa2W/xGdX3xM
	wX8NN/+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMdD-0005dV-O7; Wed, 04 Nov 2020 17:31:35 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMd9-0005bx-5k
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 17:31:33 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CRDG95Fqvz9txtn;
 Wed,  4 Nov 2020 18:31:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NutH99vC5nLa; Wed,  4 Nov 2020 18:31:13 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CRDG85cqJz9twgy;
 Wed,  4 Nov 2020 18:31:12 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 11349264F; Wed,  4 Nov 2020 18:33:53 +0100 (CET)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 04 Nov 2020 18:33:53 +0100
Date: Wed, 04 Nov 2020 18:33:53 +0100
Message-ID: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Kernel 5.10-rc1 not mounting NAND flash (Bisected to d7157ff49a5b
 ("mtd: rawnand: Use the ECC framework user input parsing bits"))
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_123131_350733_0944FB10 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

I'm unable to boot 5.10-rc1 on my boards. I get the following error:

[    4.125811] nand: device found, Manufacturer ID: 0xad, Chip ID: 0x76
[    4.131992] nand: Hynix NAND 64MiB 3,3V 8-bit
[    4.136173] nand: 64 MiB, SLC, erase size: 16 KiB, page size: 512,  
OOB size: 16
[    4.143534] ------------[ cut here ]------------
[    4.147934] Unsupported ECC algorithm!
[    4.152142] WARNING: CPU: 0 PID: 1 at  
drivers/mtd/nand/raw/nand_base.c:5244 nand_scan_with_ids+0x1260/0x1640
...
[    4.332052] ---[ end trace e3a36f62cae4ac56 ]---
[    4.336882] gpio-nand: probe of c0000000.nand failed with error -22

Bisected to commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework  
user input parsing bits")

My first impression is that with that change, the value set in chip->ecc.algo
by gpio_nand_probe() in drivers/mtd/nand/raw/gpio.c gets overwritten  
in rawnand_dt_init()

The following change fixes the problem, though I'm not sure it is the  
right fix. Can you have a look ?

diff --git a/drivers/mtd/nand/raw/nand_base.c  
b/drivers/mtd/nand/raw/nand_base.c
index 1f0d542d5923..aa74797cf2da 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5032,7 +5032,8 @@ static int rawnand_dt_init(struct nand_chip *chip)
  		chip->ecc.engine_type = nand->ecc.defaults.engine_type;

  	chip->ecc.placement = nand->ecc.user_conf.placement;
-	chip->ecc.algo = nand->ecc.user_conf.algo;
+	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+		chip->ecc.algo = nand->ecc.user_conf.algo;
  	chip->ecc.strength = nand->ecc.user_conf.strength;
  	chip->ecc.size = nand->ecc.user_conf.step_size;

---

Thanks
Christophe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
