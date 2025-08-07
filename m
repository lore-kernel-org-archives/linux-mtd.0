Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58098C87FCA
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v1NHjC4mAOp5SAlTxuWkBuQYFgjjr6UkAjH2Rwmw30k=; b=KddGZ4TaxyHmGX
	qEU/SAXf4WW+7seqd8jaixoVso9OOifcdIBXdkVgflb01g70x8cW7bU71FYwF4mUcdNx+Ob3yfGmp
	EZUNaxGXrh8+olGqqvaYl6YOmaCflvlRqaHDJAu8fYivUm3fKcUT3Zxch/7GV8W/1h5vMRAZXsU4U
	ScCCi/FfrOt4t3MBIRN1PK4mGt58f8Ngli7/k1iVxW3oSilqhLNqEv24YoC8B7q5BP5ugBrgeLpSh
	rmPBgYQXNhISjCK7F4apimqtBKBdMNI4mARWmSuB9LP9YQRE3DLSzdusgialv+h3ZQ/J5DR33TGwz
	a1Do9zO9YZpypNMxZjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2M4-00000000yvr-33MP;
	Thu, 07 Aug 2025 15:16:32 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2M1-00000000yv3-2d8q
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 15:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754579787; x=1755184587;
	i=markus.stockhausen@gmx.de;
	bh=7YoXQgv3gD5H/itRLRhnsbho8RyaLLSNrU2vJdqmgPs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Fu7dRpuVgHyxUa3jyibdSZ/d3ZVo3iv8w4vK5bAfT2og/AQxfVDjAxnWImOm00mx
	 zBkwru7yoHoNMDtZqJc0Fawzopq3gZzC0QGswKiqVfifqPNqnDCQqM0/C3k6zdZ6n
	 pOYpWr4FssijDZsaTSsEkaa3nZ96YyRvW3kueeqvfSZhM5+Vons6raSO/qqzOsBQG
	 +XFmQuvRI5DWINHEIrY0CKVSfOckZMdnxNDLu36oBr0CYm5D9ckw4/N4C5N3/o7Wp
	 xZuPrat2gKPaVe4vUy/1MkHDXQAkYcLzLsp8CRNGeHNjjpY6HLhBVp9lYMIUHx89s
	 CgY9JXOg10FvZxIDKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1umWG22KaH-00DeDi; Thu, 07
 Aug 2025 17:16:27 +0200
From: <markus.stockhausen@gmx.de>
To: <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>,
	<richard@nod.at>,
	<tudor.ambarus@linaro.org>,
	<linux-mtd@lists.infradead.org>
Cc: "'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>
Subject: NAND ECC errors
Date: Thu, 7 Aug 2025 17:16:25 +0200
Message-ID: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AdwHqGyt2keeh0YRQwu69CO4vX1Wig==
X-Provags-ID: V03:K1:mbbSvFIQ3ieAJzpjnTl6dVOYBNxv9sxyOPT/Y5JJ8+p1xiSoQBQ
 HHi5ddA3cvYAgV3vkvLNLB1l+ijtm83aPbZwFPb7qPolKFG+ExsPSV+1aGp7u1k246udvsD
 W9ggsTtjuidVIdudykrZPmaYWXmCuERCYDjbFHrIB9Za4j/C7MFUNoikUYdDU/QP8f6+fep
 V+F0PDrF/VcTOAR21vRGg==
UI-OutboundReport: notjunk:1;M01:P0:ZtnFzTsDyFE=;IGtZqGJsLHvFRwaVEbSfmLZ4t5b
 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
 xHjtU/TgUVm3qWXej2hDuSwEQdhcw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_081629_964661_0E9577EE 
X-CRM114-Status: UNSURE (   9.88  )
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

Hi,

Chris (CC) developed the drivers/spi/spi-realtek-rtl-snand.c for the 
Realtek switch platform. Thanks for that and the inclusion into mainline. 
While adding it to one of my devices I'm getting ECC errors. 

Situation is as follows.

- Linksys LGS328 (with RTL9301 SOC and that NAND controller)
- OpenWrt with Kernel 6.12 longterm
- The Realtek SPI NAND driver (backported from current master)
- Macronix MX35LF1GE4AB (1GBit)
- Boot via TFTP

I found a vendor UBI partition in NAND that I want to analyze. 
It is actively and the vendor firmware seems to work on in.
I assume it contains a filesystem with configuration and logs.
During ubiattach I get tons of errors "ubi0 warning: ubi_io_read: 
Error -77  (ECC error) while reading 64 bytes from PEB 0:0, read 
only 64 bytes, retry".

Call stack shows:

spinand_mtd_regular_page_read
  spinand_read_page
    spinand_load_page_op
    spinand_wait -> sets status = STATUS_ECC_UNCOR_ERROR 
    nand_ecc_finish_io_req start
      spinand_ondie_ecc_finish_io_req run
        spinand_check_ecc_status start
          macronix_ecc_get_status -> reads status & returns -EBADMSG

Reading data from NAND directly I see this data layout for 2K data

- 4x 512 bytes data
- 4x 6 bytes oob = 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
- 4x 10 bytes ECC 

A quick ECC calc for empty blocks says it must be BCH6. So now I have
several options but have no idea if I'm right or which to follow.

1. The NAND chip seems to have ECC build in. Ignored by vendor?
2. There is a hardware ECC controller -> Driver must be coded
3. Maybe I must activate the software BCH driver
4. The old vendor firmware (Linux 4.x) uses other ECC logic.

Anyone good ideas what to do first from here?

Thanks in advance.

Markus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
