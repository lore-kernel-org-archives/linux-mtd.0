Return-Path: <SRS0=Ei3U=Q2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8895C4360F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 08:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B84021904
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Feb 2019 08:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UThgqw3W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B84021904
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wago.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D31+ozz/cv406BxszPABiXD1YLz9Gglp5S5CMTrFWA=; b=UThgqw3WJC6P9P
	RtYTlZ5TnwXf5C8+v9uXlFIHegk0T89WnHmOl0vyXs8L5y4WGHe2rNDidIN9a6I7G2aPYBK86zwh9
	+eybS7J2JtoRuabtP48VQnPeibByXLfzwm9YA1MeCLeqAyIhPzj0or2jwnyx9tS2s54bvuURZfwfz
	oC6F5HA8Rd57MavsKV0MWZfomWK2taRxk06dRsdSPKTq+M0X9D45Tv9Tttpl230RGtFDtDB1998XQ
	dB64vn82Rafh1I+PR4VUMwG4beRSNnRy4MJF4XW/1lAQRMyqHC3TINPWK0Us7LZp8gxlwDTqENVn0
	oQVDRkhnYLyPY5anWgbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw0Z9-0006Z2-Rk; Tue, 19 Feb 2019 08:15:47 +0000
Received: from mail1.bemta26.messagelabs.com ([85.158.142.116])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw0Z6-0006YD-0A
 for linux-mtd@lists.infradead.org; Tue, 19 Feb 2019 08:15:46 +0000
Received: from [85.158.142.194] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 14/8F-12473-82BBB6C5;
 Tue, 19 Feb 2019 08:15:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRWlGSWpSXmKPExsVy8+3OTboau7N
 jDKaJW/QuPcdqsbtpGbsDk8eRq4tZPTYvqQ9gimLNzEvKr0hgzVi8ZQdTwRrziq/rljM1MF4w
 62Lk4hASeMYocajtBjuE84tR4lbLOmYIZw6jxN3Zh5i6GDk52ATkJabsPsoGYosIOElM3LWFB
 cRmFpCWeLNrK5gtLOAisfJOP2sXIwdQjavErudCEOVWEmf+X2MHsVkEVCUWnz4PNpJXwFpiXu
 MyJpByIYE8if7Z6iBhTgE7iY87XoCVMwrISmzYcJ4ZYpO4xK0n88FaJQQEJJbsgYhLCIhKvHz
 8jxXEFhUIl7jVtYIFIq4gseleMxuEbSixatoBqDjQxT3roOKmEv1Tz7CAnMAsoCmxfpc+xCpz
 iQ/7tkGtVZSY0v2QHeJiQYmTM5+AjRESUJG427eFHWKMpkTDsm1Qp9lLTH9/Feo0G4lDf1vhV
 r36MZlpAqP8LCTfzELYPAvJ5llINs9CsnkBI+sqRsukosz0jJLcxMwcXUMDA11DQ2NdM10jE2
 O9xCrdJL3UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYJJJKWT7vIPxz5L0Q4ySHExKory
 5W7JjhPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwOu8CygkWpaanVqRl5gDTHUxagoNHSYT3+k6g
 NG9xQWJucWY6ROoUoy7H24PP5zILseTl56VKifNOAykSACnKKM2DGwFLvZcYZaWEeRkZGBiEe
 ApSi3IzS1DlXzGKczAqCfMqg1zCk5lXArfpFdARTEBHrOXMADmiJBEhJdXAKBukN6Mrr3wex3
 HdwwFL2vj2qRo2qk5oeCD/52bfgcZVH8IT/CakpmToW0R7BJ7uvXi0qXaWQ8TyA18aDiUmnH9
 p9Uz4c5pU19Lg3oXKySzfnGZGrs3sWp6+vMkjXDb+wrNTr7I4vtmEr53QI3llvlfVtCePq3eb
 vWl9kHhxwdpdvzlKjOM2KrEUZyQaajEXFScCADdpxb64AwAA
X-Env-Sender: Heinrich.Toews@wago.com
X-Msg-Ref: server-36.tower-239.messagelabs.com!1550564135!1399959!1
X-Originating-IP: [217.237.185.178]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 568 invoked from network); 19 Feb 2019 08:15:35 -0000
Received: from unknown (HELO mail.wago.com) (217.237.185.178)
 by server-36.tower-239.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 19 Feb 2019 08:15:35 -0000
Received: from SVEX01012.wago.local (10.1.103.230) by SVEX01009.wago.local
 (10.1.103.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Tue, 19 Feb
 2019 09:15:35 +0100
Received: from SVEX01006.wago.local (10.1.101.122) by SVEX01012.wago.local
 (10.1.103.230) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.1531.3 via Frontend
 Transport; Tue, 19 Feb 2019 09:15:35 +0100
Received: from SVEX01008.wago.local ([169.254.4.220]) by svex01006.wago.local
 ([10.1.101.122]) with mapi id 14.03.0415.000;
 Tue, 19 Feb 2019 09:15:35 +0100
From: <Heinrich.Toews@wago.com>
To: <frieder.schrempf@kontron.de>, <linux-mtd@lists.infradead.org>
Subject: Re: mtd: mchp23k256: How to follow a more generic approach?
Thread-Topic: mtd: mchp23k256: How to follow a more generic approach?
Thread-Index: AQHUx4YW9WCII7mMYUC2iYT0KpFxjaXldHaAgAFCL4A=
Date: Tue, 19 Feb 2019 08:15:34 +0000
Message-ID: <782d297a-a030-08c9-702e-c1ba2b3e6626@wago.com>
References: <21e1b97c-0f90-1cf9-cd93-e9785adb1856@wago.com>
 <caa1f926-e50d-a851-8412-6b20c10942ec@kontron.de>
In-Reply-To: <caa1f926-e50d-a851-8412-6b20c10942ec@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
x-originating-ip: [10.1.103.230]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
x-pp-proceessed: 76874689-fff8-43e0-8f1a-01f8fc6dac97
Content-ID: <412AB2653AE00F4A926F3EAF6C61AD8F@WAGO.com>
MIME-Version: 1.0
X-KSE-ServerInfo: SVEX01009.wago.local, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-PP-Proceessed: 81a9f692-418a-4f33-bb70-032f75efc73b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_001544_196221_951F0815 
X-CRM114-Status: GOOD (  24.41  )
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
Cc: Oleg.Karfich@wago.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Frieder,

On 18.02.19 14:02, Schrempf Frieder wrote:
> Hi Heinrich,
> 
> On 18.02.19 13:33, Heinrich.Toews@wago.com wrote:
>> Hi altogether,
>>
>> I'm using currently the CONFIG_MTD_MCHP23K256 driver to access an
>> ANV32AA1W 1Mb Serial SPI nvSRAM from Anvo-Systems Dresden.
> 
> We also have a ANV32 nvSRAM chip on some of our boards and so far we
> used misc/eeprom/at25.c to access the memory.
> It would be nice to use the chip with the MTD framework too, so it's
> interesting to see, that it's possible with a modified version of
> mchp23k256.c.

We saw that the AT25 misc driver is limiting the access to a maximum of 
4k (PAGE_SIZE) data blocks and by this is increasing the data transfer 
overhead. In order to minimize the CPU utilization we considered to 
write the whole 128k of data during one SPI transfer. By this using the 
MCHP23K256 we reached 70ms for one mtdchar_write operation which is 
quite good for the driver spends most of the time in DMA (68ms).

>>
>> I did some changes to the driver as seen below to make it work.
>>
>>
>> diff --git a/drivers/mtd/devices/mchp23k256.c
>> b/drivers/mtd/devices/mchp23k256.c
>> index 9d8306a..6140973 100644
>> --- a/drivers/mtd/devices/mchp23k256.c
>> +++ b/drivers/mtd/devices/mchp23k256.c
>> @@ -28,6 +28,7 @@ struct mchp23k256_flash {
>>     };
>>
>>     #define MCHP23K256_CMD_WRITE_STATUS    0x01
>> +#define MCHP23K256_CMD_WREN            0x06
>>     #define MCHP23K256_CMD_WRITE           0x02
>>     #define MCHP23K256_CMD_READ            0x03
>>     #define MCHP23K256_MODE_SEQ            BIT(6)
>> @@ -40,13 +41,14 @@ static int mchp23k256_write(struct mtd_info *mtd,
>> loff_t to, size_t len,
>>            struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>>            struct spi_transfer transfer[2] = {};
>>            struct spi_message message;
>> -       unsigned char command[3];
>> +       unsigned char command[4];
>>
>>            spi_message_init(&message);
>>
>>            command[0] = MCHP23K256_CMD_WRITE;
>> -       command[1] = to >> 8;
>> -       command[2] = to;
>> +       command[1] = to >> 16;
>> +       command[2] = to >> 8;
>> +       command[3] = to;
>>
>>            transfer[0].tx_buf = command;
>>            transfer[0].len = sizeof(command);
>> @@ -73,14 +75,15 @@ static int mchp23k256_read(struct mtd_info *mtd,
>> loff_t from, size_t len,
>>            struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>>            struct spi_transfer transfer[2] = {};
>>            struct spi_message message;
>> -       unsigned char command[3];
>> +       unsigned char command[4];
>>
>>            spi_message_init(&message);
>>
>>            memset(&transfer, 0, sizeof(transfer));
>>            command[0] = MCHP23K256_CMD_READ;
>> -       command[1] = from >> 8;
>> -       command[2] = from;
>> +       command[1] = from >> 16;
>> +       command[2] = from >> 8;
>> +       command[3] = from;
>>
>>            transfer[0].tx_buf = command;
>>            transfer[0].len = sizeof(command);
>> @@ -104,17 +107,18 @@ static int mchp23k256_read(struct mtd_info *mtd,
>> loff_t from, size_t len,
>>     /*
>>      * Set the device into sequential mode. This allows read/writes to the
>>      * entire SRAM in a single operation
>> + *
>> + * CHANGE: Enable Write Mode in the device
>>      */
>>     static int mchp23k256_set_mode(struct spi_device *spi)
>>     {
>>            struct spi_transfer transfer = {};
>>            struct spi_message message;
>> -       unsigned char command[2];
>> +       unsigned char command[1];
>>
>>            spi_message_init(&message);
>>
>> -       command[0] = MCHP23K256_CMD_WRITE_STATUS;
>> -       command[1] = MCHP23K256_MODE_SEQ;
>> +       command[0] = MCHP23K256_CMD_WREN;
>>
>>            transfer.tx_buf = command;
>>            transfer.len = sizeof(command);
>> @@ -147,7 +151,7 @@ static int mchp23k256_probe(struct spi_device *spi)
>>            flash->mtd.type         = MTD_RAM;
>>            flash->mtd.flags        = MTD_CAP_RAM;
>>            flash->mtd.writesize    = 1;
>> -       flash->mtd.size         = SZ_32K;
>> +       flash->mtd.size         = SZ_128K;
>>            flash->mtd._read        = mchp23k256_read;
>>            flash->mtd._write       = mchp23k256_write;
>>
>>
>> What would be the best approach to add a more generic solution to the
>> kernel in order to be able to address different SPI SRAM devices?
> 
> That's an interesting question. mchp23k256.c registers a RAM device
> (MTD_RAM), but nvSRAM contains RAM and flash and to the outside it acts
> more like flash as data is persistent.

The data is transferred through SPI directly into a SRAM and written 
only into the flash on power loss. So its basically a RAM connected by 
SPI and so MTD_RAM seems for me to be the right choice here.

> The instructions seem to be very similar to EEPROM and SPI NOR devices.
> So I'm curious about what others propose how to support these devices.

I'm planning to write the driver for the ANV32AA1W during the next weeks 
and it would be really great to have some feedback on the approach here.


Thanks,
Heinrich.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
