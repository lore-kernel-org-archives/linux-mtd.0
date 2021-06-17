Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4286FC48BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 17:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B439961418
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B439961418
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdMKQNSCNTJTPjjhUkRHvtzaHT0ZPDYGt3HfOdCa+gE=; b=ShbMCrCantyX2UFjVt/Q7wyayb
	THbjBcrM1veR03jfeNW2u38RNZHDK028twQVp5e1EgvcCG8N8yKhUxjUejWYAZnBCE8D1F7Xrmx5n
	Wsoii1ZbZQeQpVniXjAsvtAyK6ee4R+B/9ZofkPxtn8wJLQLb1wRVaNIyPoUWODgv3zaNI+NH3ID/
	GN3PoJwVgWPVCO2mOg46zlrmZ45pZxneeoZSJ4XHDDOMZ3xMh+BXUn214PMV8mOhZ6lUUt17VHQQP
	Nay4ZTqJlYKlyEOlEiuIeNxNuuVC3yaui1x1daRy2AcmdTdU5ObgzriwbdUdvpfjLaVsCOCIGtKJc
	2qQkDZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltvdm-00BCAn-7x; Thu, 17 Jun 2021 17:17:18 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltvdi-00BC9C-Pv
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 17:17:16 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G5TJ01mHBzBC99;
 Thu, 17 Jun 2021 19:17:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atQEwQkIxV5q; Thu, 17 Jun 2021 19:17:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G5TJ00sMczBC94;
 Thu, 17 Jun 2021 19:17:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 159958B819;
 Thu, 17 Jun 2021 19:17:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uboCIDBLdJIC; Thu, 17 Jun 2021 19:17:04 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C96D38B801;
 Thu, 17 Jun 2021 19:17:03 +0200 (CEST)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: nand: WARNING: a0000000.nand: the ECC used on your system (1b/256B)
 is too weak compared to the one required by the NAND chip (4b/512B)
Message-ID: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
Date: Thu, 17 Jun 2021 19:17:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_101715_051616_00488904 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel,

I have a board running latest kernel with the following NAND:

[    1.523076] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xda
[    1.529505] nand: Micron MT29F2G08ABAEAWP
[    1.533526] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz
e: 64
[    1.541196] nand: WARNING: a0000000.nand: the ECC used on your system (1b/256
B) is too weak compared to the one required by the NAND chip (4b/512B)

Until now I was using kernel 4.14 and I was having no problem, allthough it was also exhibiting the 
following (less detailed) warning

[    0.591009] nand: WARNING: a0000000.nand: the ECC used on your system is too weak compared to the 
one required by the NAND chip

Now and then I'm using one of the latest kernels (Today is 5.13-rc6), and sometime in one of the 5.x 
releases, I started to get errors like:

[    5.098265] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.103859] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 60
  bytes from PEB 99:59824, read only 60 bytes, retry
[    5.525843] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.531571] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.537490] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 30
73 bytes from PEB 107:108976, read only 3073 bytes, retry
[    5.691121] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.696709] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.702426] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.708141] ecc_sw_hamming_correct: uncorrectable ECC error
[    5.714103] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 30
35 bytes from PEB 107:25144, read only 3035 bytes, retry
[   20.523689] random: crng init done
[   21.892130] ecc_sw_hamming_correct: uncorrectable ECC error
[   21.897730] ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 13
94 bytes from PEB 116:75776, read only 1394 bytes, retry

Most of the time, when the reading of the file fails, I just have to read it once more and it gets 
read without that error.


What am I supposed to do to avoid the ECC weakness warning at startup and to fix that ECC error issue ?

Thanks for your help
Christophe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
