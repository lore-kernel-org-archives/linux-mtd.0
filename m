Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2BC678D4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Mar 2023 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc09KtD8Ojjp09VgnQcXmkSv9Lpzzkj/4AQWfcaPtL0=; b=tgkQMm1o7sQMvCNYIoHHlNsalk
	jysfndV6CV7gCiJfNgi107uWWnLPsIutT5iElYjrgxqQlqp8lJ4zFiMxigpEaiymMLc59LF8rVvZs
	mSIIV/5GpC8yXcZGVL8dDS/v8ip4qa/yMtgWqN64C212ESDSPO4uKtf4ye89TOJY55NO2OPwb3IyB
	z0cFUEZLldb2oJPsd+6aePB7zCBGT9XMpYvIq0XW6PN7MDGAH4kFwYuxa2jv7RyiFd68hj04o+Btb
	KwRsr2AVfpQQ6KqlMBpzNxssn6pbi/WDed7Ok99dgPxeFa/2fvExYq5bs2uo2WP1Bg37XgFWNSbtT
	fslc/iIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4Um-006JMI-15; Fri, 03 Mar 2023 12:26:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4Uh-006JK0-U1
	for linux-mtd@lists.infradead.org; Fri, 03 Mar 2023 12:26:42 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PSnHv4MTJzrSHC;
	Fri,  3 Mar 2023 20:25:47 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 3 Mar 2023 20:26:27 +0800
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<Tudor.Ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>
CC: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, JaimeLiao <jaimeliao.tw@gmail.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
 <20230112093637.987838-4-miquel.raynal@bootlin.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fd34fe55-7f4a-030d-8653-9bb9cf08410d@huawei.com>
Date: Fri, 3 Mar 2023 20:26:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230112093637.987838-4-miquel.raynal@bootlin.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_042640_444636_4E631524 
X-CRM114-Status: GOOD (  14.19  )
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

Hi all,

> From: JaimeLiao <jaimeliao.tw@gmail.com>
> 
> Add support for sequential cache reads for controllers using the generic
> core helpers for their fast read/write helpers.
> 
> Sequential reads may reduce the overhead when accessing physically
> continuous data by loading in cache the next page while the previous
> page gets sent out on the NAND bus.
> 
> The ONFI specification provides the following additional commands to
> handle sequential cached reads:
> 
> * 0x31 - READ CACHE SEQUENTIAL:
>    Requires the NAND chip to load the next page into cache while keeping
>    the current cache available for host reads.
> * 0x3F - READ CACHE END:
>    Tells the NAND chip this is the end of the sequential cache read, the
>    current cache shall remain accessible for the host but no more
>    internal cache loading operation is required.
> 
> On the bus, a multi page read operation is currently handled like this:
> 
> 	00 -- ADDR1 -- 30 -- WAIT_RDY (tR+tRR) -- DATA1_IN
> 	00 -- ADDR2 -- 30 -- WAIT_RDY (tR+tRR) -- DATA2_IN
> 	00 -- ADDR3 -- 30 -- WAIT_RDY (tR+tRR) -- DATA3_IN
> 
> Sequential cached reads may instead be achieved with:
I find an ecc error problem in latest kernel(nandsim + ubi):

[   71.097739] [nandsim] error: write_byte: unknown command 0x31
[   71.100871] [nandsim] error: write_byte: unknown command 0x31
[   71.101508] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.102475] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.103427] ecc_sw_hamming_correct: uncorrectable ECC error
[   71.104018] ubi0 warning: ubi_io_read [ubi]: error -74 (ECC error) 
while reading 4096 bytes from PEB 180:2048, read only 4096 bytes, retry
[   71.105272] [nandsim] error: write_byte: unknown command 0x31
[   71.105901] [nandsim] error: write_byte: unknown command 0x31
[   71.106513] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.107392] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.108277] ecc_sw_hamming_correct: uncorrectable ECC error
[   71.108885] ubi0 warning: ubi_io_read [ubi]: error -74 (ECC error) 
while reading 4096 bytes from PEB 180:2048, read only 4096 bytes, retry
[   71.110230] [nandsim] error: write_byte: unknown command 0x31
[   71.110817] [nandsim] error: write_byte: unknown command 0x31
[   71.111433] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.112356] [nandsim] warning: read_buf: unexpected data output 
cycle, current state is STATE_READY
[   71.113232] ecc_sw_hamming_correct: uncorrectable ECC error

reproducer:
#!/bin/bash
set -e

TMP=/root/temp

mtd=/dev/mtd0
ubi=/dev/ubi0

ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB
modprobe nandsim id_bytes=$ID
flash_eraseall /dev/mtd0
modprobe ubi mtd="0,0" fm_autoconvert
ubimkvol -N vol_a -m -n 0 /dev/ubi0
modprobe ubifs
mount -t ubifs /dev/ubi0_0 $TMP

After reverting 003fe4b9545b83cc("mtd: rawnand: Support for sequential 
cache reads") the mtd will work normally.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
