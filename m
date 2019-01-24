Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EAEC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A99521872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 08:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUwMOV0u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A99521872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WBuZiiVltGvRZpcwPUif/98lYqnjxft+q1/lJTKuoUQ=; b=UUwMOV0u+rvr0mN/MqvESvk/4
	kV2YBfVSJGUf6HV4cFxg3DukqGXXBPkUKWojX4Ee9PpEmfumoSvGZRt/amv0ArDbY+FQgbMcYyMjl
	pwK5RfWalV4TEyRPUJPrP2l5lqHDEfwV+DCWue/C2zF5qmve927w5l1FOhEkPdfrA0hpXaHXRGapx
	h5cA1dpaZu5CIRNNvE237rhn9brOMSdkJ2+kOaNbnNF34sEIy/wIUdD3P9zVhGdvyNZyS01q6UrXp
	p/QJpjjrtm+n6k9hLQ/YDVJQevvz2fNiewiQlvvBubuJyTbGJesxKxUVw2UczFAc3//AC+xj9tnZ2
	NOYtlP4nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmZwi-0000Ji-QG; Thu, 24 Jan 2019 08:01:08 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmZwL-0008Gb-85
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 08:00:52 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 13A84A1718;
 Thu, 24 Jan 2019 09:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id TxeLKXYczWcU; Thu, 24 Jan 2019 09:00:39 +0100 (CET)
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
To: Boris Brezillon <bbrezillon@kernel.org>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
 <20190123103512.722095cd@bbrezillon>
 <adedc307-dc10-3200-84fa-36313b858dbf@denx.de>
 <20190123122514.0db87887@bbrezillon>
 <4f630269-5562-b795-63ca-92989d6c5059@denx.de>
 <20190123132249.2e7f65a2@bbrezillon>
 <358c78d9-6507-3998-a065-ddd18809d02b@denx.de>
 <20190123134050.7efe59a6@bbrezillon> <20190123135735.358fc9a6@bbrezillon>
 <0786ffac-ec46-f924-002a-5324c76bcb89@denx.de>
 <20190124085231.6f9ef74d@bbrezillon>
From: Stefan Roese <sr@denx.de>
Message-ID: <3c58a6f2-c7dd-8bef-5a74-64d0852080e2@denx.de>
Date: Thu, 24 Jan 2019 09:00:38 +0100
MIME-Version: 1.0
In-Reply-To: <20190124085231.6f9ef74d@bbrezillon>
Content-Type: multipart/mixed; boundary="------------7F42257A03645E119A036002"
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_000046_337633_3F12EC9C 
X-CRM114-Status: GOOD (  23.71  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------7F42257A03645E119A036002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.01.19 08:52, Boris Brezillon wrote:
> On Thu, 24 Jan 2019 08:35:32 +0100
> Stefan Roese <sr@denx.de> wrote:
> 
>> On 23.01.19 13:57, Boris Brezillon wrote:
>>> On Wed, 23 Jan 2019 13:40:50 +0100
>>> Boris Brezillon <bbrezillon@kernel.org> wrote:
>>>    
>>>>> This definitely does look better. I assume that we are we on the
>>>>> right track now?
>>>>
>>>> Yep, and it confirms the ECC caps => 8bits/512bytes. Will send a proper
>>>> commit for the fix I did and Cc you so you can add your
>>>> Tested-by/Reviewed-by.
>>>
>>> Oh, looks like a side-effect of migrating to the dirmap approach
>>> (merged in nand/next [1]) is that this bug does not exist. Can you test
>>> the nand/next branch and let me know if it still works?
>>>
>>> [1]http://git.infradead.org/linux-mtd.git/shortlog/refs/heads/nand/next
>>
>> Unfortunately this does not seem to work. I was unable to boot my
>> platform from this branch directly so I rebased all MTD/NAND related
>> patches on top of the latest kernel.org tree for this. Here a log
>> with this version (new error this time):
>>
>> root@mt7688:~# ./nandbiterrs /dev/mtd5 -i
>> incremental biterrors test
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>>           error 5 (Input/output error)
>> Failed to write page 0 in block 0
>>
>> Here a log with nandwrite errors:
>>
>> root@mt7688:~# flash_erase /dev/mtd5 0 1
>> Erasing 128 Kibyte @ 0 -- 100 % complete
>> root@mt7688:~# nandwrite --input-size=2048 /dev/mtd5 /dev/urandom
>> Writing data to block 0 at offset 0x0
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 0, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 00000000 to 0x01ffff
>> Writing data to block 1 at offset 0x20000
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 1, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 0x020000 to 0x03ffff
>> Writing data to block 2 at offset 0x40000
>> libmtd: error!: cannot write 2048 bytes to mtd5 (eraseblock 2, offset 0)
>>           error 5 (Input/output error)
>> Erasing failed write from 0x040000 to 0x05ffff
>> ...
>>
>> Any ideas on this?
> 
> BTW, what's the SPI controller connected to this chip?

The platform is MediaTek MT7688 MIPS and the SPI controller driver is
not mainlined yet. I've attached the currently used version. Please
be warned that its not mainline quality yet. This is still on our list.

Thanks,
Stefan

--------------7F42257A03645E119A036002
Content-Type: text/x-csrc;
 name="spi-mt7621.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="spi-mt7621.c"

/*
 * spi-mt7621.c -- MediaTek MT7621 SPI controller driver
 *
 * Copyright (C) 2011 Sergiy <piratfm@gmail.com>
 * Copyright (C) 2011-2013 Gabor Juhos <juhosg@openwrt.org>
 * Copyright (C) 2014-2015 Felix Fietkau <nbd@nbd.name>
 *
 * Some parts are based on spi-orion.c:
 *   Author: Shadi Ammouri <shadi@marvell.com>
 *   Copyright (C) 2007-2008 Marvell Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/clk.h>
#include <linux/err.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/reset.h>
#include <linux/spi/spi.h>
#include <linux/of_device.h>
#include <linux/platform_device.h>
#include <linux/swab.h>

#include <ralink_regs.h>

#define SPI_BPW_MASK(bits) BIT((bits) - 1)

#define DRIVER_NAME			"spi-mt7621"
/* in usec */
#define RALINK_SPI_WAIT_MAX_LOOP	2000

/* SPISTAT register bit field */
#define SPISTAT_BUSY			BIT(0)

#define MT7621_SPI_TRANS	0x00
#define SPITRANS_BUSY		BIT(16)

#define MT7621_SPI_OPCODE	0x04
#define MT7621_SPI_DATA0	0x08
#define MT7621_SPI_DATA4	0x18
#define SPI_CTL_TX_RX_CNT_MASK	0xff
#define SPI_CTL_START		BIT(8)

#define MT7621_SPI_POLAR	0x38
#define MT7621_SPI_MASTER	0x28
#define MT7621_SPI_MOREBUF	0x2c
#define MT7621_SPI_SPACE	0x3c

#define MT7621_CPHA		BIT(5)
#define MT7621_CPOL		BIT(4)
#define MT7621_LSB_FIRST	BIT(3)

#define RT2880_SPI_MODE_BITS	(SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST | SPI_CS_HIGH)

struct mt7621_spi;

struct mt7621_spi {
	struct spi_master	*master;
	void __iomem		*base;
	unsigned int		sys_freq;
	unsigned int		speed;
	struct clk		*clk;

	struct mt7621_spi_ops	*ops;
};

static inline struct mt7621_spi *spidev_to_mt7621_spi(struct spi_device *spi)
{
	return spi_master_get_devdata(spi->master);
}

static inline u32 mt7621_spi_read(struct mt7621_spi *rs, u32 reg)
{
	return ioread32(rs->base + reg);
}

static inline void mt7621_spi_write(struct mt7621_spi *rs, u32 reg, u32 val)
{
	iowrite32(val, rs->base + reg);
}

static void mt7621_spi_reset(struct mt7621_spi *rs, int duplex)
{
	u32 master = mt7621_spi_read(rs, MT7621_SPI_MASTER);

	master |= 7 << 29;
	master |= 1 << 2;
	master &= ~(1 << 10);

	mt7621_spi_write(rs, MT7621_SPI_MASTER, master);
}

static void mt7621_spi_set_cs(struct spi_device *spi, int enable)
{
	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
	int cs = spi->chip_select;
	u32 polar = 0;

	mt7621_spi_reset(rs, cs);

	if (enable)
		polar = BIT(cs);
	mt7621_spi_write(rs, MT7621_SPI_POLAR, polar);
}

static int mt7621_spi_prepare(struct spi_device *spi, unsigned int speed)
{
	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
	u32 rate;
	u32 reg;

	dev_dbg(&spi->dev, "speed:%u\n", speed);

	rate = DIV_ROUND_UP(rs->sys_freq, speed);
	dev_dbg(&spi->dev, "rate-1:%u\n", rate);

	if (rate > 4097)
		return -EINVAL;

	if (rate < 2)
		rate = 2;

	reg = mt7621_spi_read(rs, MT7621_SPI_MASTER);
	reg &= ~(0xfff << 16);
	reg |= (rate - 2) << 16;
	rs->speed = speed;

	reg &= ~MT7621_LSB_FIRST;
	if (spi->mode & SPI_LSB_FIRST)
		reg |= MT7621_LSB_FIRST;

	reg &= ~(MT7621_CPHA | MT7621_CPOL);
	switch(spi->mode & (SPI_CPOL | SPI_CPHA)) {
		case SPI_MODE_0:
			break;
		case SPI_MODE_1:
			reg |= MT7621_CPHA;
			break;
		case SPI_MODE_2:
			reg |= MT7621_CPOL;
			break;
		case SPI_MODE_3:
			reg |= MT7621_CPOL | MT7621_CPHA;
			break;
	}
	mt7621_spi_write(rs, MT7621_SPI_MASTER, reg);

	return 0;
}

static inline int mt7621_spi_wait_till_ready(struct spi_device *spi)
{
	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
	int i;

	for (i = 0; i < RALINK_SPI_WAIT_MAX_LOOP; i++) {
		u32 status;

		status = mt7621_spi_read(rs, MT7621_SPI_TRANS);
		if ((status & SPITRANS_BUSY) == 0) {
			return 0;
		}
		cpu_relax();
		udelay(1);
	}

	return -ETIMEDOUT;
}

static int mt7621_spi_mb_transfer_half_duplex(struct spi_master *master,
						struct spi_message *m)
{
	struct mt7621_spi *rs = spi_master_get_devdata(master);
	struct spi_device *spi = m->spi;
	unsigned int speed = spi->max_speed_hz;
	struct spi_transfer *t = NULL;
	int status = 0;
	int i = 0, len = 0;
	u8 is_write = 0;
	u32 data[9] = { 0 };
	u32 val = 0;
	u32 transfer_len = 0;
	int cs_active = 0;

	mt7621_spi_wait_till_ready(spi);
	dev_dbg(&spi->dev, "seven spidev test ->cs:\n");

	list_for_each_entry(t, &m->transfers, transfer_list) {
		const u8 *txbuf = t->tx_buf;
		u8 *rxbuf = t->rx_buf;

		if (t->tx_buf == NULL && t->rx_buf == NULL && t->len) {
			dev_err(&spi->dev,
				 "message rejected: invalid transfer data buffers\n");
			status = -EIO;
			goto msg_done;
		}

		if (rxbuf)
			is_write = 0;
		else if(txbuf)
			is_write = 1;

		if (mt7621_spi_prepare(spi, speed)) {
			status = -EIO;
			goto msg_done;
		}

		transfer_len = t->len/4;
		if (!cs_active) {
			mt7621_spi_set_cs(spi, 1);
			cs_active = 1;
		}

		if(transfer_len) {   /* for word transfer */
			u32 u32TxNum = 0;

			while ( transfer_len > 0 ) {
				u32TxNum = transfer_len % 8;
				if ( !u32TxNum )
					u32TxNum = 8;

				for ( i=0; i<u32TxNum*4; i++) {
					if ( is_write ) { /* for write transfer */
						data[i / 4] |= *txbuf++ << (8 * (i & 3));
					}
					//else  /* for read transfer */
				}
#if 0
				for(i=0; i<u32TxNum*4; i += 4)
					printk("0x%x, ", data[i/4]);

				printk("\n");
#endif
				data[0] = swab32(data[0]);
				val = 0;
				if(is_write) {
					for(i=0; i<u32TxNum*4; i += 4)
						mt7621_spi_write(rs, MT7621_SPI_OPCODE + i, data[i / 4]);

					val = (min_t(int, u32TxNum*4, 4) * 8) << 24; /* must be set 32 */
					val |= ((u32TxNum*4) - 4) * 8;               /* mosi_cnt */
				} else
					val |= ((u32TxNum*4) * 8) << 12;             /* miso_cnt */

				mt7621_spi_write(rs, MT7621_SPI_MOREBUF, val);
				val = mt7621_spi_read(rs, MT7621_SPI_TRANS);
				val |= SPI_CTL_START;
				mt7621_spi_write(rs, MT7621_SPI_TRANS, val);

				mt7621_spi_wait_till_ready(spi);

				if(!is_write) {
					for (i = 0; i < u32TxNum*4; i += 4)
						data[i / 4] = mt7621_spi_read(rs, MT7621_SPI_DATA0 + i);

					for (i = 0; i < u32TxNum*4; i++)
						*rxbuf++ = data[i / 4] >> (8 * (i & 3));
				}

				len += u32TxNum*4;
				transfer_len -= u32TxNum;
				memset(data, 0, sizeof(data));
			}
		}

		transfer_len = t->len % 4;
		if(transfer_len) { /* for bytes transfer 0-3bytes*/
			for ( i=0; i<transfer_len; i++ ) {
				if(is_write)
					data[i / 4] |= *txbuf++ << (8 * (i & 3));
			}

			data[0] = swab32(data[0]);
			data[0] >>= (4 - transfer_len) * 8;

			val = 0;
			if(is_write) {
				for(i=0; i<transfer_len; i += 4)
					mt7621_spi_write(rs, MT7621_SPI_OPCODE + i, data[i / 4]);

				val = (min_t(int, transfer_len, 4) * 8) << 24;  /* must be 32 */
			} else {
				 val |= (transfer_len* 8) << 12;         /* miso_cnt */
			}
			mt7621_spi_write(rs, MT7621_SPI_MOREBUF, val);
			val = mt7621_spi_read(rs, MT7621_SPI_TRANS);
			val |= SPI_CTL_START;
			mt7621_spi_write(rs, MT7621_SPI_TRANS, val);

			mt7621_spi_wait_till_ready(spi);

			if(!is_write) {
				for (i = 0; i < transfer_len; i += 4)
					data[i / 4] = mt7621_spi_read(rs, MT7621_SPI_DATA0 + i);

				for (i = 0; i < transfer_len; i++)
					*rxbuf++ = data[i / 4] >> (8 * (i & 3));
			}
			len += transfer_len;
			memset(data, 0, sizeof(data));
		}

		m->actual_length = len;     //+ rx_len;
		if (t->cs_change) {
			 mt7621_spi_set_cs(spi, 0);
			 cs_active = 0;
		}
	}

msg_done:
	if (cs_active)
		mt7621_spi_set_cs(spi, 0);

	m->status = status;
	spi_finalize_current_message(master);

	return 0;
}

static int mt7621_spi_transfer_one_message(struct spi_master *master,
						struct spi_message *m)
{
	return mt7621_spi_mb_transfer_half_duplex(master, m);
}

static int mt7621_spi_setup(struct spi_device *spi)
{
	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);

	if ((spi->max_speed_hz == 0) ||
		(spi->max_speed_hz > (rs->sys_freq / 2)))
		spi->max_speed_hz = (rs->sys_freq / 2);

	if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
		dev_err(&spi->dev, "setup: requested speed is too low %d Hz\n",
			spi->max_speed_hz);
		return -EINVAL;
	}

	return 0;
}

static const struct of_device_id mt7621_spi_match[] = {
	{ .compatible = "ralink,mt7621-spi" },
	{},
};
MODULE_DEVICE_TABLE(of, mt7621_spi_match);

static size_t mt7621_max_transfer_size(struct spi_device *spi)
{
	return 32;
}

static int mt7621_spi_probe(struct platform_device *pdev)
{
	const struct of_device_id *match;
	struct spi_master *master;
	struct mt7621_spi *rs;
	void __iomem *base;
	struct resource *r;
	int status = 0;
	struct clk *clk;
	struct mt7621_spi_ops *ops;
	int ret;

	match = of_match_device(mt7621_spi_match, &pdev->dev);
	if (!match)
		return -EINVAL;
	ops = (struct mt7621_spi_ops *)match->data;

	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	base = devm_ioremap_resource(&pdev->dev, r);
	if (IS_ERR(base))
		return PTR_ERR(base);

	clk = devm_clk_get(&pdev->dev, NULL);
	if (IS_ERR(clk)) {
		dev_err(&pdev->dev, "unable to get SYS clock, err=%d\n",
			status);
		return PTR_ERR(clk);
	}

	status = clk_prepare_enable(clk);
	if (status)
		return status;

	master = spi_alloc_master(&pdev->dev, sizeof(*rs));
	if (master == NULL) {
		dev_info(&pdev->dev, "master allocation failed\n");
		return -ENOMEM;
	}

	master->mode_bits = RT2880_SPI_MODE_BITS;

	master->setup = mt7621_spi_setup;
	master->transfer_one_message = mt7621_spi_transfer_one_message;
	master->bits_per_word_mask = SPI_BPW_MASK(8);
	master->dev.of_node = pdev->dev.of_node;
	master->num_chipselect = 2;
	master->max_transfer_size = mt7621_max_transfer_size;

	dev_set_drvdata(&pdev->dev, master);

	rs = spi_master_get_devdata(master);
	rs->base = base;
	rs->clk = clk;
	rs->master = master;
	rs->sys_freq = clk_get_rate(rs->clk);
	rs->ops = ops;
	dev_info(&pdev->dev, "sys_freq: %u\n", rs->sys_freq);

	ret = device_reset(&pdev->dev);
	if (ret) {
		dev_err(&pdev->dev, "device_reset failed (%d)!\n", ret);
		return ret;
	}

	mt7621_spi_reset(rs, 0);

	return spi_register_master(master);
}

static int mt7621_spi_remove(struct platform_device *pdev)
{
	struct spi_master *master;
	struct mt7621_spi *rs;

	master = dev_get_drvdata(&pdev->dev);
	rs = spi_master_get_devdata(master);

	clk_disable(rs->clk);
	spi_unregister_master(master);

	return 0;
}

MODULE_ALIAS("platform:" DRIVER_NAME);

static struct platform_driver mt7621_spi_driver = {
	.driver = {
		.name = DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table = mt7621_spi_match,
	},
	.probe = mt7621_spi_probe,
	.remove = mt7621_spi_remove,
};

module_platform_driver(mt7621_spi_driver);

MODULE_DESCRIPTION("MT7621 SPI driver");
MODULE_AUTHOR("Felix Fietkau <nbd@nbd.name>");
MODULE_LICENSE("GPL");

--------------7F42257A03645E119A036002
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--------------7F42257A03645E119A036002--

