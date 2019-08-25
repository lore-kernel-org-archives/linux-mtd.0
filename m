Return-Path: <SRS0=xwO+=WV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B94C3A5A1
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F2052173E
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Aug 2019 11:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qC2PE+3k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F2052173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZEPtLhZ/s3o3izyM+EILrvTTmYiWGE4g5ffE29gj3k=; b=qC2PE+3ky1E+Sn
	ar7eEel6+0mee+9Oyrrwlro3zLpSUyKetxX2JRRoJMJgEKSORRp3e9Qd2jOsyJZVipcEEsFnQFuRO
	fNXYffKl+39zvmLkkPJgv1BxDP/Frmg9HvD9AUKnJ9XtsswyVPotKdhju3JG2IAK6zgZXEo++EDzo
	LzVf2dNcjNWmd0/v35CAWgiQmh0sOwT61fwrZxFM0pOZ6hemaQ2Frwwp0xbcxHXQ/CwAL6prxFLwi
	VVbr4cFEuquokodRKwcWjJbZhdTkuphwi6QKS1tN5ZXjpxjyl7OzrN+pViJ8c4k7Phrp/SjYqL4sb
	uUJSzffEE7fYNJC0zUFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1qrM-0008Bc-90; Sun, 25 Aug 2019 11:39:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1qrJ-0008BG-LN
 for linux-mtd@lists.infradead.org; Sun, 25 Aug 2019 11:38:59 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D42426DF12;
 Sun, 25 Aug 2019 12:38:56 +0100 (BST)
Date: Sun, 25 Aug 2019 13:38:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH 0/5] mtd: spi-nor: move manuf out of the core - batch 0
Message-ID: <20190825133853.32532641@collabora.com>
In-Reply-To: <20190823155325.13459-1-tudor.ambarus@microchip.com>
References: <20190823155325.13459-1-tudor.ambarus@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_043857_835837_8EF175E5 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 23 Aug 2019 15:53:33 +0000
<Tudor.Ambarus@microchip.com> wrote:

> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> This series is a prerequisite for the effort of moving the
> manufacturer specific code out of the SPI NOR core.
> 
> The scope is to move all [FLASH-SPECIFIC] parameters and settings
> from 'struct spi_nor' to 'struct spi_nor_flash_parameter'. We will
> have a clear separation between the SPI NOR layer and the flash
> parameters and settings.
> 
> 'struct spi_nor_flash_parameter' describes the hardware capabilities
> and associated settings of the SPI NOR flash memory. It includes
> legacy flash parameters and settings that can be overwritten by the
> spi_nor_fixups hooks, or dynamically when parsing the JESD216
> Serial Flash Discoverable Parameters (SFDP) tables. All SFDP params
> and settings will fit inside 'struct spi_nor_flash_parameter'.

While we're at moving things around, I think it'd make sense to move
all '[DRIVER SPECIFIC]' fields (which are actually SPI NOR controller
driver specific fields) to a separate struct:

struct spi_nor_controller_ops {
	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
	ssize_t (*read)(struct spi_nor *nor, loff_t from,
			size_t len, u_char *read_buf);
	ssize_t (*write)(struct spi_nor *nor, loff_t to,
			size_t len, const u_char *write_buf);
	int (*erase)(struct spi_nor *nor, loff_t offs);
};

struct spi_nor {
...
	const struct spi_nor_controller_ops *controller_ops;
...
};

> 
> Tested uniform and non-uniform erase on sst26vf064b flash using the
> atmel-quadspi driver.
> 
> In order to test this, you'll have to merge v5.3-rc5 in spi-nor/next.
> This patch depends on
> 'commit 834de5c1aa76 ("mtd: spi-nor: Fix the disabling of write protection at init")
> 
> Tudor Ambarus (5):
>   mtd: spi-nor: Regroup flash parameter and settings
>   mtd: spi-nor: Use nor->params
>   mtd: spi-nor: Drop quad_enable() from 'struct spi-nor'
>   mtd: spi-nor: Move clear_sr_bp() to 'struct spi_nor_flash_parameter'
>   mtd: spi-nor: Move erase_map to 'struct spi_nor_flash_parameter'
> 
>  drivers/mtd/spi-nor/spi-nor.c | 236 ++++++++++++++++-----------------------
>  include/linux/mtd/spi-nor.h   | 254 ++++++++++++++++++++++++++++--------------
>  2 files changed, 269 insertions(+), 221 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
