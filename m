Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A511C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E1BF20782
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0C842CF4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=syscom.ch header.i=@syscom.ch header.b="mebqBCvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E1BF20782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=syscom.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBPZrw2PPouFZm69D95pQLqxdD/f400PIODQiBugWak=; b=0C842CF42/SLoDEjnc5RkZzfwm
	FBCciqiKmlPQyR6KXk9vqAqR9oWkBuAN7/56lyyNG7A55k+tW722gGR8AOxdVg8vYOulKG57iRtEZ
	eOCf+suj5UzelorYbZFn7O6jomlkv5KKJUvKQxuf1WD4qstpxUpG43BiANR/wxJvSNgwE2UJ5ExoB
	6OFfZuPf7+yRGHWYJFGho07SNbV1J6mMN2XI2EtFI2TpKN70U4h1mOU8jRlCGilapH30s+k0R4pGa
	pG6gXUZxFNOm9GbQ5JaB1Q8rDMwwlD6lM6Rn8IZ9/Nlr2hZYx1m3BtAaSPZl1M7K6nlfK6/29TLvi
	OWGyjRWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY5K6-0002rW-0p; Thu, 29 Oct 2020 10:38:26 +0000
Received: from smtp-42ab.mail.infomaniak.ch ([84.16.66.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY5K2-0002qV-A9
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 10:38:23 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4CMMNV406vzljNfM
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 11:38:18 +0100 (CET)
Received: from s-rd-8.syscom.lan (unknown [212.83.163.210])
 by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4CMMNV1z5gzlh8TQ
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 11:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=syscom.ch;
 s=20191113; t=1603967898;
 bh=cKs4HZK0zNN0x3e4XVfyDFXVoflpkfj6VN68Pyop0b0=;
 h=Date:From:To:Subject:From;
 b=mebqBCvk8Db42xUxXLSfY6OwAAj9e/depghDIyXBIET9CrFjh6/MV8JILqQlinz2s
 v53D05elfwiOw4nGJeFHymyJu+OW5heqPtWVBwCDB7aKqGC8Z1HSp3yXvYde95YFGJ
 dfIsgQAI79LVBcfs/5w0a8s6RLYzrNeeixd22FzQ=
Date: Thu, 29 Oct 2020 11:38:17 +0100
From: Viallard Anthony <viallard@syscom.ch>
To: linux-mtd@lists.infradead.org
Subject: mtd: spinand: Add support for IS37SML01G1 (ISSI)
Message-ID: <20201029113817.125a4d77@s-rd-8.syscom.lan>
Organization: Syscom Instruments SA
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_063822_585218_BC171EA7 
X-CRM114-Status: GOOD (  15.73  )
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

Hello folks,

I am working since few days to add the support for the IS37SML01G1 (a serial NAND 104MHZ SPI from ISSI manufacturer) in the linux kernel (v5.4).

I have followed the datasheet of this flash (http://www.issi.com/WW/pdf/37-38SML01G1.pdf) and wrote some lines of code in mtd/nand/spi/.

I am facing 2 problems:
 - I have to write the definition of this flash into mtd/nand/spi/gigadevice.c. Actually, the manufacturer code is the same as gigadevice (0xC8) (cf. Figure 6.13 in the datasheet). I think it will be nice to put the code in a new file (mtd/nand/spi/issi.c) but it needs to modify a little bit the behavior of gigadevice_spinand_detect() function to return 0 even if spinand_match_and_init() does not match the device code instead of a negative code. Do you think it is an acceptable modification ? Or is it better to let the ISSI support in gigadevice.c ?
 - The bad block logic implemented in mtd/nand/spi/core.c does not work with this flash. In spinand_isbad() function, the code checks the first two bytes in the OOB area of the first page to know whether the block is bad. But with this ISSI flash, the bad block marker is only on the first byte and right after this byte, there is an ECC on three bytes. Therefore, as soon as I write the first page of a block, this latest is likely to be detected bad. I think it needs to add new entries in the struct spinand_info to describe how the manufacturer has implemented the marking of defective blocks. What do you think about it ?

Best regards,
Anthony V.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
