Return-Path: <SRS0=0vqE=QZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06535C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 13:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3084217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Feb 2019 13:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmnqnLwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3084217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whPh6f7+I1XkC7yHgKJ6LDsi1EaQbvMZAsXnjWMhA1w=; b=mmnqnLwvsxHMQY
	SKzIjC4FJzFCZB/HaNDMoeJE8dPtX7tlNa03qYT4899F8eQnjOZkZi0O7zEndITQT34pPoG0mlNdt
	EghmwqfpZl65AISKMhCLXVUMoD9VmTDccL9RaPoVdWSOlzM6mJgl8cdS6C4+8P/jS8o9VqzdJL1Fe
	GgM2K0PJL9VHWeuz9DI99GDahCQAXBsrVpvCxGJqDpUgTKWa5tpNYcQI11FIOjfWOnAMrXM64lGjO
	mFd90s5h1IsaYT3t/I6qDVdhM1jQqJZPCZCS+9MRB7Q/T8O+M1xyx/1sEgjsbfJrcK4QScOsEkYHk
	CJk+9ZO/qfkTPVJGMIMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gviYl-0004TT-RF; Mon, 18 Feb 2019 13:02:11 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gviYe-0004Su-7b
 for linux-mtd@lists.infradead.org; Mon, 18 Feb 2019 13:02:10 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 0907980906B;
 Mon, 18 Feb 2019 14:02:02 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 Feb
 2019 14:02:01 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 18 Feb 2019 14:02:01 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "Heinrich.Toews@wago.com" <Heinrich.Toews@wago.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd: mchp23k256: How to follow a more generic approach?
Thread-Topic: mtd: mchp23k256: How to follow a more generic approach?
Thread-Index: AQHUx4YW9WCII7mMYUC2iYT0KpFxjaXldHaA
Date: Mon, 18 Feb 2019 13:02:01 +0000
Message-ID: <caa1f926-e50d-a851-8412-6b20c10942ec@kontron.de>
References: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
In-Reply-To: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <973E2859825A2F4891BFE64E922C2040@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 0907980906B.AF4E3
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: heinrich.toews@wago.com, linux-mtd@lists.infradead.org, 
 oleg.karfich@wago.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_050204_597748_80572198 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: "Oleg.Karfich@wago.com" <Oleg.Karfich@wago.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Heinrich,

On 18.02.19 13:33, Heinrich.Toews@wago.com wrote:
> Hi altogether,
> 
> I'm using currently the CONFIG_MTD_MCHP23K256 driver to access an
> ANV32AA1W 1Mb Serial SPI nvSRAM from Anvo-Systems Dresden.

We also have a ANV32 nvSRAM chip on some of our boards and so far we 
used misc/eeprom/at25.c to access the memory.
It would be nice to use the chip with the MTD framework too, so it's 
interesting to see, that it's possible with a modified version of 
mchp23k256.c.

> 
> I did some changes to the driver as seen below to make it work.
> 
> 
> diff --git a/drivers/mtd/devices/mchp23k256.c
> b/drivers/mtd/devices/mchp23k256.c
> index 9d8306a..6140973 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -28,6 +28,7 @@ struct mchp23k256_flash {
>    };
> 
>    #define MCHP23K256_CMD_WRITE_STATUS    0x01
> +#define MCHP23K256_CMD_WREN            0x06
>    #define MCHP23K256_CMD_WRITE           0x02
>    #define MCHP23K256_CMD_READ            0x03
>    #define MCHP23K256_MODE_SEQ            BIT(6)
> @@ -40,13 +41,14 @@ static int mchp23k256_write(struct mtd_info *mtd,
> loff_t to, size_t len,
>           struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>           struct spi_transfer transfer[2] = {};
>           struct spi_message message;
> -       unsigned char command[3];
> +       unsigned char command[4];
> 
>           spi_message_init(&message);
> 
>           command[0] = MCHP23K256_CMD_WRITE;
> -       command[1] = to >> 8;
> -       command[2] = to;
> +       command[1] = to >> 16;
> +       command[2] = to >> 8;
> +       command[3] = to;
> 
>           transfer[0].tx_buf = command;
>           transfer[0].len = sizeof(command);
> @@ -73,14 +75,15 @@ static int mchp23k256_read(struct mtd_info *mtd,
> loff_t from, size_t len,
>           struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>           struct spi_transfer transfer[2] = {};
>           struct spi_message message;
> -       unsigned char command[3];
> +       unsigned char command[4];
> 
>           spi_message_init(&message);
> 
>           memset(&transfer, 0, sizeof(transfer));
>           command[0] = MCHP23K256_CMD_READ;
> -       command[1] = from >> 8;
> -       command[2] = from;
> +       command[1] = from >> 16;
> +       command[2] = from >> 8;
> +       command[3] = from;
> 
>           transfer[0].tx_buf = command;
>           transfer[0].len = sizeof(command);
> @@ -104,17 +107,18 @@ static int mchp23k256_read(struct mtd_info *mtd,
> loff_t from, size_t len,
>    /*
>     * Set the device into sequential mode. This allows read/writes to the
>     * entire SRAM in a single operation
> + *
> + * CHANGE: Enable Write Mode in the device
>     */
>    static int mchp23k256_set_mode(struct spi_device *spi)
>    {
>           struct spi_transfer transfer = {};
>           struct spi_message message;
> -       unsigned char command[2];
> +       unsigned char command[1];
> 
>           spi_message_init(&message);
> 
> -       command[0] = MCHP23K256_CMD_WRITE_STATUS;
> -       command[1] = MCHP23K256_MODE_SEQ;
> +       command[0] = MCHP23K256_CMD_WREN;
> 
>           transfer.tx_buf = command;
>           transfer.len = sizeof(command);
> @@ -147,7 +151,7 @@ static int mchp23k256_probe(struct spi_device *spi)
>           flash->mtd.type         = MTD_RAM;
>           flash->mtd.flags        = MTD_CAP_RAM;
>           flash->mtd.writesize    = 1;
> -       flash->mtd.size         = SZ_32K;
> +       flash->mtd.size         = SZ_128K;
>           flash->mtd._read        = mchp23k256_read;
>           flash->mtd._write       = mchp23k256_write;
> 
> 
> What would be the best approach to add a more generic solution to the
> kernel in order to be able to address different SPI SRAM devices?

That's an interesting question. mchp23k256.c registers a RAM device 
(MTD_RAM), but nvSRAM contains RAM and flash and to the outside it acts 
more like flash as data is persistent.
The instructions seem to be very similar to EEPROM and SPI NOR devices.
So I'm curious about what others propose how to support these devices.

Regards,
Frieder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
