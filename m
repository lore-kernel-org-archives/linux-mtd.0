Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE107C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775D821916
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="awsmNafE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775D821916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grandegger.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I9qgkyjlFVEwKCiKq0nPYFYcSsIne713XScUCiP4LO0=; b=awsmNafEY69jkx
	n1e7ddbVOyZUDAdjOuWf9NS1pEgtS7lUydkUCHTLAQ7jFEvYlxYJ+yQRb/SKZPbqRPIt2eQ6Ew+VC
	2GloJOA2e7/4maEf9UB/3hZwjUNRZR0bcngXXhN71ppxQ7b7zKG05VIM9a/vb1iG7YI6VPAwJCmwb
	cAc4gDbXBq0ZAz7bAKmaSM/t0sKoOfQWzniCWksvu8Y8dTT6wCRX70m9QhWrt4o48GSedoBjML7E+
	yWwEmSzm2+bvN0sb5Tc63b/it9nNXxDCnFxUuCpIZrQw83abHou+q67j3+btGHZ2ntgqdza1c+ljc
	kIglAluc8vNmG+OcTBlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2RR-0006hP-O4; Fri, 08 Feb 2019 09:27:25 +0000
Received: from mailproxy07.manitu.net ([217.11.48.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2RO-0006fY-IO
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:27:24 +0000
Received: from [192.168.178.20] (aftr-88-217-180-104.dynamic.mnet-online.de
 [88.217.180.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy07.manitu.net (Postfix) with ESMTPSA id D6B14C8107
 for <linux-mtd@lists.infradead.org>; Fri,  8 Feb 2019 10:27:42 +0100 (CET)
To: linux-mtd@lists.infradead.org
From: Wolfgang Grandegger <wg@grandegger.com>
Subject: i.MX28 nand driver broken in Linux 4.18
Openpgp: preference=signencrypt
Autocrypt: addr=wg@grandegger.com; prefer-encrypt=mutual; keydata=
 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
 8QEfHnPzgykCs2DOOQ==
Message-ID: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
Date: Fri, 8 Feb 2019 10:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_012722_761608_FB53BD56 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hello,

I'm upgrading the BSP of my i.MX28 board to Linux 4.18. Unfortunately,
the NAND driver does not working any longer. Here is the output of
"nandtest" including the kernel messages:

  root@m28evk:~# nandtest -k /dev/mtd3 
  ECC corrections: 0
  ECC failures   : 0
  Bad blocks     : 0
  BBT blocks     : 0
  00000000: reading (2 of 4)...gpmi-nand 8000c000.gpmi-nand: DMA timeout, last DMA
  gpmi-nand 8000c000.gpmi-nand: Show GPMI registers :
  gpmi-nand 8000c000.gpmi-nand: offset 0x000 : 0x2180083e
  gpmi-nand 8000c000.gpmi-nand: offset 0x010 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x020 : 0x000011ff
  gpmi-nand 8000c000.gpmi-nand: offset 0x030 : 0x0000083e
  gpmi-nand 8000c000.gpmi-nand: offset 0x040 : 0x44dc0800
  gpmi-nand 8000c000.gpmi-nand: offset 0x050 : 0x46800800
  gpmi-nand 8000c000.gpmi-nand: offset 0x060 : 0x0104000c
  gpmi-nand 8000c000.gpmi-nand: offset 0x070 : 0x00010101
  gpmi-nand 8000c000.gpmi-nand: offset 0x080 : 0x90000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x090 : 0x09020101
  gpmi-nand 8000c000.gpmi-nand: offset 0x0a0 : 0x01000030
  gpmi-nand 8000c000.gpmi-nand: offset 0x0b0 : 0x0f000003
  gpmi-nand 8000c000.gpmi-nand: offset 0x0c0 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x0d0 : 0x03010000
  gpmi-nand 8000c000.gpmi-nand: Show BCH registers :
  gpmi-nand 8000c000.gpmi-nand: offset 0x000 : 0x00000100
  gpmi-nand 8000c000.gpmi-nand: offset 0x010 : 0x0000fe04
  gpmi-nand 8000c000.gpmi-nand: offset 0x020 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x030 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x040 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x050 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x060 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x070 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x080 : 0x030a4200
  gpmi-nand 8000c000.gpmi-nand: offset 0x090 : 0x083e4200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0a0 : 0x070a8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0b0 : 0x10da8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0c0 : 0x070a8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0d0 : 0x10da8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0e0 : 0x070a8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x0f0 : 0x10da8200
  gpmi-nand 8000c000.gpmi-nand: offset 0x100 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x110 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x120 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x130 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x140 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x150 : 0x20484342
  gpmi-nand 8000c000.gpmi-nand: offset 0x160 : 0x01000000
  gpmi-nand 8000c000.gpmi-nand: offset 0x170 : 0x00000000
  gpmi-nand 8000c000.gpmi-nand: BCH Geometry :
  GF length              : 13
  ECC Strength           : 8
  Page Size in Bytes     : 2110
  Metadata Size in Bytes : 10
  ECC Chunk Size in Bytes: 512
  ECC Chunk Count        : 4
  Payload Size in Bytes  : 2048
  Auxiliary Size in Bytes: 16
  Auxiliary Status Offset: 12
  Block Mark Byte Offset : 1999
  Block Mark Bit Offset  : 0
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Error in ECC-based read: -22
  00000000: reading (3 of 4)...gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Error in ECC-based read: -22
  00000000: reading (4 of 4)...gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Error in ECC-based read: -22
  00000000: erasing... gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  00000000: writing...gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Chip: 0, Error -22
  gpmi-nand 8000c000.gpmi-nand: Error in ECC-based write: -22

  write: Invalid argument
  ...

I have already applied the patch: 

  [PATCH] mtd: rawnand: gpmi: fix MX28 bus master lockup problem

but it didn't help. It works fine with Linux 4.14. Are there any known
issues with 4.18?

Thanks,

Wolfgang.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
