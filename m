Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63014C47258
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGeG8KPHDihI470wQWiDCB1FRUeRJaEl5U/g46uNbYg=; b=ZhDlcVdnq9H4bw
	99z+Bgmji4a98h596/fQJftaQJWRf+Qe5+NSZiFi7OtHRPB/c/j9pOznJa93n+kBCHaXu3+u9o6L9
	yqA+zKO9wV/X7DvFtUVU8nINYyUi6jQOv8Fs8F4ZKzxUsBrVsLtz1D5z6L4MdXPykST8FmNMPlJo2
	J/b0loZ0mgrd+B90PeFz3yxkYgcHED2lg2uhaW1Qz3cyuXXCNxS5Rbgv9RW8TQgkW1iVcDxSnjk5V
	BU+jxyCMktGYexAwycSEitpvjiH57vjM4ZkV7HqKJIReZ3VZhIpkVcAlIXpqVZKgeccwTCggrH0cW
	7cJhdYAfV8J1Q8GQ59ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rREn1-00884e-2l;
	Sat, 20 Jan 2024 17:05:51 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rREmy-00884A-1n;
	Sat, 20 Jan 2024 17:05:50 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-595aa5b1fe0so1230975eaf.2;
        Sat, 20 Jan 2024 09:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705770346; x=1706375146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSSZ+uUrBnGLtLNByRJO3k6mx1p75ru6YpoQqSrwF3o=;
        b=FtRlI1Lk9I3/nRaV7UnU4DHzTVaoWD12inXBGxVqxMWXNlLo8SodrKok95L3sBz68P
         qgkR6hFnwZ2pRB/vbDLjAYrmS2vbdm4yIaJK11j1H14CcTh6Nj1q171F1O7BWssvkWJt
         6uyX1YU4+Hcnv/+L492AsjYygDjYtnA+3cyAJkMUJg7uhhi85ITmjxH3wRjHzUetpHs1
         LbdqyXFhJfoNYpLyPFXO/HrNp4UsDmcMcTZE0ufbLB4MR9ECoMothjCBhYuOBOg6Z49M
         FhxCcLZv3AstjQah5L5eO7e7X+yCyezRrqqtmvMExQ1bGzMHHgJD0949utIG9thEqwK/
         30tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705770346; x=1706375146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSSZ+uUrBnGLtLNByRJO3k6mx1p75ru6YpoQqSrwF3o=;
        b=jY9xcMY8jLqbuo8JmWR6QZs6jc9VR3Hh+Q/Gl848TBFbcHaZWUAZ+AW3YYm5Sb0msB
         6j8q07yweTQm6okhZRLzDlRttdRCVOymjYZ+XwaVqVCq5P6pZxu3tabQJTwuJDxEOR9q
         AWfl9vj1UnuEohEZ5/2qOxX6t4mhioooUvBxOeIStWeVJef/VItarIAZqZJruqPDLZyd
         AaZxkpFWIIk9xhW9SS5gzsTP8V73K89DFuBGrznMU+fVNsC/escpb7kxLowv3Sa7il8e
         LN/0ak+BRiyrSfhirwMvbzyPpWUzGtxOnSCYKwM8LOr9eLm5zXVykXYo4kA1Looy7dHV
         DGIQ==
X-Gm-Message-State: AOJu0YxMP0fQWTqf+cyJk1DSNRuoE3TgZDUOuf704JplGvPkY3bikt7W
	u8ugiZs1/dw2NcUTOdatVZkRgY7BBNQzojVqnoO6O0UfuJChGs5A
X-Google-Smtp-Source: AGHT+IEe7Tj3eDqHrVJrjBOmoIpluh5tLTny4B8bIrKkjUIC1uwOw716UNoMn8WG+UEWOZm/G457Fg==
X-Received: by 2002:a05:6359:4c15:b0:175:dbd5:9190 with SMTP id kj21-20020a0563594c1500b00175dbd59190mr2218797rwc.15.1705770345598;
        Sat, 20 Jan 2024 09:05:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r18-20020a170902be1200b001d73ac054a0sm556505pls.33.2024.01.20.09.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 09:05:44 -0800 (PST)
Date: Sat, 20 Jan 2024 09:05:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: broonie@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_090548_601955_DAFF6299 
X-CRM114-Status: GOOD (  32.50  )
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

On Fri, Jan 12, 2024 at 11:11:10AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Sat, Nov 25, 2023 at 02:51:30PM +0530, Amit Kumar Mahapatra wrote:
> > AMD-Xilinx GQSPI controller has two advanced mode that allows the
> > controller to consider two flashes as one single device.
> > 
> > One of these two mode is the parallel mode in which each byte of data is
> > stored in both devices, the even bits in the lower flash & the odd bits in
> > the upper flash. The byte split is automatically handled by the QSPI
> > controller.
> > 
> > The other mode is the stacked mode in which both the flashes share the
> > same SPI bus but each of the device contain half of the data. In this mode,
> > the controller does not follow CS requests but instead internally wires the
> > two CS levels with the value of the most significant address bit.
> > 
> > For supporting both these modes SPI core need to be updated for providing
> > multiple CS for a single SPI device.
> > 
> > For adding multi CS support the SPI device need to be aware of all the CS
> > values. So, the "chip_select" member in the spi_device structure is now an
> > array that holds all the CS values.
> > 
> > spi_device structure now has a "cs_index_mask" member. This acts as an
> > index to the chip_select array. If nth bit of spi->cs_index_mask is set
> > then the driver would assert spi->chip_select[n].
> > 
> > In parallel mode all the chip selects are asserted/de-asserted
> > simultaneously and each byte of data is stored in both devices, the even
> > bits in one, the odd bits in the other. The split is automatically handled
> > by the GQSPI controller. The GQSPI controller supports a maximum of two
> > flashes connected in parallel mode. A SPI_CONTROLLER_MULTI_CS flag bit is
> > added in the spi controller flags, through ctlr->flags the spi core
> > will make sure that the controller is capable of handling multiple chip
> > selects at once.
> > 
> > For supporting multiple CS via GPIO the cs_gpiod member of the spi_device
> > structure is now an array that holds the gpio descriptor for each
> > chipselect.
> > 
> > CS GPIO is not tested on our hardware, but it has been tested by @Stefan
> > https://lore.kernel.org/all/005001da1efc$619ad5a0$24d080e0$@opensource.cirrus.com/
> > 
> 
> With this patch in the mainline kernel, two of my qemu emulations
> (quanta-q71l-bmc and almetto-bmc) fail to instantiate the first SPI
> controller and thus fail to boot from SPI. The error message is
> 
> [    3.006458] spi_master spi0: No. of CS is more than max. no. of supported CS
> [    3.006775] spi_master spi0: Failed to create SPI device for /ahb/spi@1e620000/flash@0
> 
> The problem is no longer seen after reverting this patch.
> 

FWIW, the problem is due to

+#define SPI_CS_CNT_MAX 4

in the offending patch, but apeed2400 FMC supports up to 5 SPI chip selects.

 static const struct aspeed_spi_data ast2400_fmc_data = {
        .max_cs        = 5,
	^^^^^^^^^^^^^^^^^^^
        .hastype       = true,

Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the problem,
though of course I don't know if increasing SPI_CS_CNT_MAX has other side
effects.

Guenter

> Bisect log attached for reference.
> 
> Guenter
> 
> ---
> # bad: [70d201a40823acba23899342d62bc2644051ad2e] Merge tag 'f2fs-for-6.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
> # good: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect start 'HEAD' 'v6.7'
> # bad: [de927f6c0b07d9e698416c5b287c521b07694cac] Merge tag 's390-6.8-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect bad de927f6c0b07d9e698416c5b287c521b07694cac
> # bad: [35f11a3710cdcbbc5090d14017a6295454e0cc73] Merge tag 'mtd/for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> git bisect bad 35f11a3710cdcbbc5090d14017a6295454e0cc73
> # good: [d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9] Merge tag 'slab-for-6.8' of git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab
> git bisect good d30e51aa7b1f6fa7dd78d4598d1e4c047fcc3fb9
> # good: [fb46e22a9e3863e08aef8815df9f17d0f4b9aede] Merge tag 'mm-stable-2024-01-08-15-31' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> # good: [063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac] Merge tag 'lsm-pr-20240105' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
> git bisect good 063a7ce32ddc2c4f2404b0dfd29e60e3dbcdffac
> # bad: [f6cd66231aa58599526584ff4df1bdde8d86eac8] spi: stm32: add st,stm32mp25-spi compatible supporting STM32MP25 soc
> git bisect bad f6cd66231aa58599526584ff4df1bdde8d86eac8
> # good: [18f78b5e609b19b56237f0dae47068d44b8b0ecd] spi: axi-spi-engine: improvements round 2
> git bisect good 18f78b5e609b19b56237f0dae47068d44b8b0ecd
> # bad: [9d93c8d97b4cdb5edddb4c5530881c90eecb7e44] spi: spi-ti-qspi: switch to use modern name
> git bisect bad 9d93c8d97b4cdb5edddb4c5530881c90eecb7e44
> # bad: [e6b7e64cb11966b26646a362677ca5a08481157e] spi: st-ssc4: switch to use modern name
> git bisect bad e6b7e64cb11966b26646a362677ca5a08481157e
> # bad: [c3aeaf2f0ec8af93189488bda3928a1ac7752388] spi: pxa2xx: Use inclusive language
> git bisect bad c3aeaf2f0ec8af93189488bda3928a1ac7752388
> # good: [f05e2f61fe88092e0d341ea27644a84e3386358d] ALSA: hda/cs35l56: Use set/get APIs to access spi->chip_select
> git bisect good f05e2f61fe88092e0d341ea27644a84e3386358d
> # bad: [88a50c1663ffa9f6b31705c6bf7a887a2c8d9434] spi: Add support for stacked/parallel memories
> git bisect bad 88a50c1663ffa9f6b31705c6bf7a887a2c8d9434
> # bad: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core
> git bisect bad 4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b
> # first bad commit: [4d8ff6b0991d5e86b17b235fc46ec62e9195cb9b] spi: Add multi-cs memories support in SPI core

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
