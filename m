Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F5CE79AB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chtJNMYNb/w1WaMYBcKVQD3XT2D1ehb1S9JgqpCT7a8=; b=pQbMghHygVfUbx
	7ehrInHoPOFQmzIcXg6yck/LOMJKwBt5BMm+97mSr251t9eqXDGqbdReOgasF5tMGciX7hZvsCA35
	gLvx8RnZumm0U+eQSiV/9Dx4Auqj9/8QVelh2+4HFE74Qb/hW+Pn8NyavN1s6GoWxc9Nm6gCq4CfH
	g+Hu37dLehqb6kU3RAzOib4MpxeHde9GpiYrxJ7tQUN0kGYbFKgBrWtpSQfUwtuxtsJ08kXPeepAK
	Lk44h1aXEOEFoaefHAXPvjxr7V+3xOZqjQI+9ZDn3Rsrvk+cDQRcI/DzMjaqFmItWv8s5jviF8R9K
	ItTDz6qf6ZAjGTRWc7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qidBq-000ome-0J;
	Tue, 19 Sep 2023 16:03:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qidBm-000oju-2o
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 16:03:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bceb02fd2bso93787801fa.1
        for <linux-mtd@lists.infradead.org>; Tue, 19 Sep 2023 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695139381; x=1695744181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdCAOkMTmAW6whrbSu7a2PqS1auXhVVDN1XDsIh3f0g=;
        b=YhO6q5f0qmePOTCwoyYqh4sfOh6noTUUX+NH2qAb8xWjR4r2tKw0n3oh04RObyiWeH
         mXhQxnE6KzAlR2vUjhHbDF3QGovk8NxLyntVITSIvg88Dn6MNPqpNra5tN8/luqv4EEI
         H7dlaj6CApG157NeCe0OGt6eL9PrHJmPT8afg0BDfo49zWpi+sIu/57SY5VYd9DlBboZ
         MOkkBKtY7IAvM4Ja6GH5baV2lOs9GmKRw7xZYowss8pgQRCWVTbQdzgYyhjKbrbiXfoR
         vl5CG6iAqMaibuqW3BqTw19HOcrAvieZkChJ5VOymx88UQfh1cMX4rw3imiFun2JID1d
         iDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695139381; x=1695744181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdCAOkMTmAW6whrbSu7a2PqS1auXhVVDN1XDsIh3f0g=;
        b=Ywd+cTdMjsRGpsNWt7rW0PCYwbBcCEQx+MfqIfnrYxr8GqqNLI8mWWgiPJcXMbx6FV
         YPE42XPd3WYsvnYaH6QhOP5Uh1zuhvzWwQGcG4CGCkkygR3mxIdh10bcqo586FE4b0Q3
         rcbMoOBVw7zo1FSVBXiXkLsrGBuP1Vqm2m4k9n6bca9dg22eRmCyq/+e2d8lkmgjXNdk
         DtawjxBfVQGQiE1167mem7zA9e6uEMkvg/2mzqIM9Cn7cgA64fROua959j6pAyJPOm5+
         Nxp7clMTtwPMmIGNUayrD/zGeLUgMD06sU0OBiUVUFFaT5qbKWXVH4wfSzm7PNM2VL2k
         A8/g==
X-Gm-Message-State: AOJu0Yxmm+vfq1KaFbbvAsf/+ElJdgQIxngPdgx2cbAWXKA33y9CRoEu
	GmNrmvBe0BSrzJ3IWZiknq4mVg==
X-Google-Smtp-Source: AGHT+IHA0KvMFC5B/OgYDUgOiwilx/o4jhSGmVMuYsiT2c6ZVOZTbPVujBPhpnyfuHGpvVifm9iRng==
X-Received: by 2002:a2e:9999:0:b0:2bc:c89e:d8df with SMTP id w25-20020a2e9999000000b002bcc89ed8dfmr10646034lji.48.1695139380700;
        Tue, 19 Sep 2023 09:03:00 -0700 (PDT)
Received: from 1.. (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id jx10-20020a170906ca4a00b009ae3e6c342asm340857ejb.111.2023.09.19.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 09:03:00 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 00/41] mtd: spi-nor: clean the flash_info database up
Date: Tue, 19 Sep 2023 19:02:56 +0300
Message-Id: <169513932067.27768.2341524831414044809.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=g8SbyLrdIPwEfgcmqq1bAcZZTilDdZ2HAc0rLIr7njM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlCcYs25yE+Es7IZBpFahE5U2qBZKWv6j8ea+Pu vU9OnmhNjmJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZQnGLAAKCRBLVU9HpY0U 6TP1CACjyF/tQReio0iuKb+E3XjwsuhqyoO6ZfkN5dSe06CgDaACacU9MaiHonwTbT6oHam7w5b pSK4KHWejGdClarHiXi3oi8qE8XIOUYC7SZzLRMzPPERKCmtpAKDKiYOW7472+mE8TN6npSckez v5dB9yCNhFHFv9DlF12IpaaJG7RJSwweGeghRFk81ZFPpfSWt5k23b1ZtEXNc+QJcO2LX17HIcy ZxHQhqaE32J07LSyp0aLPkcgJSgEXuVwNO2SSB4fZtHBKkjURrE+nw5U4kx+8UG+pWihORVE0dG 2xOreBLdg1XRFUI9nxQ+N4yQGfi3NTNpQRfcNKafdTp8lFx9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_090302_913707_21FE3685 
X-CRM114-Status: GOOD (  12.67  )
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

On Fri, 08 Sep 2023 12:16:18 +0200, Michael Walle wrote:
> The goal is to have slim entries for *new* entries and to have a
> flexible macro to specify the flash ID and get rid of the former
> INFOx() macros with the hardcoded ID length.
> 
> Here is are some examples how an entry of flash_info will look like
> after the conversion:
>   {
>     .id = SNOR_ID(0xef, 0x80, 0x20),
>     .name = "w25q512nwm",
>     .otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
>   }
> 
> [...]

Made the agreed adjustments and applied to
git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[01/41] mtd: spi-nor: remove catalyst 'flashes'
        https://git.kernel.org/mtd/c/022545e057f3
[02/41] mtd: spi-nor: remove Fujitsu MB85RS1MT support
        https://git.kernel.org/mtd/c/d9cd5c9a6fe2
[03/41] mtd: spi-nor: xilinx: use SPI_NOR_ID() in S3AN_INFO()
        https://git.kernel.org/mtd/c/74b7ad768353
[04/41] mtd: spi-nor: xilinx: remove addr_nbytes from S3AN_INFO()
        https://git.kernel.org/mtd/c/afbfb8c5fb57
[05/41] mtd: spi-nor: convert .n_sectors to .size
        https://git.kernel.org/mtd/c/0554effe99f6
[06/41] mtd: spi-nor: default page_size to 256 bytes
        https://git.kernel.org/mtd/c/d0cfd228b34c
[07/41] mtd: spi-nor: store .n_banks in struct spi_nor_flash_parameter
        https://git.kernel.org/mtd/c/9983e6da917d
[08/41] mtd: spi-nor: default .n_banks to 1
        https://git.kernel.org/mtd/c/e255a79162b6
[09/41] mtd: spi-nor: push 4k SE handling into spi_nor_select_uniform_erase()
        https://git.kernel.org/mtd/c/9b6bb07eadaf
[10/41] mtd: spi-nor: make sector_size optional
        https://git.kernel.org/mtd/c/6dec24b1a34c
[11/41] mtd: spi-nor: drop .parse_sfdp
        https://git.kernel.org/mtd/c/3ea3f0ac242c
[12/41] mtd: spi-nor: introduce (temporary) INFO0()
        https://git.kernel.org/mtd/c/95c6e3d26691
[13/41] mtd: spi-nor: move the .id and .id_len into an own structure
        https://git.kernel.org/mtd/c/2d7f3a08875b
[14/41] mtd: spi-nor: rename .otp_org to .otp and make it a pointer
        https://git.kernel.org/mtd/c/83e62ffa7d1b
[15/41] mtd: spi-nor: add SNOR_ID() and SNOR_OTP()
        https://git.kernel.org/mtd/c/3e85be98875a
[16/41] mtd: spi-nor: remove or move flash_info comments
        https://git.kernel.org/mtd/c/da7e48db514b
[17/41] mtd: spi-nor: atmel: convert flash_info to new format
        https://git.kernel.org/mtd/c/f9d52efb3953
[18/41] mtd: spi-nor: eon: convert flash_info to new format
        https://git.kernel.org/mtd/c/ca7fb359d0a1
[19/41] mtd: spi-nor: esmt: convert flash_info to new format
        https://git.kernel.org/mtd/c/5a329c40894b
[20/41] mtd: spi-nor: everspin: convert flash_info to new format
        https://git.kernel.org/mtd/c/6ecc52e44dbf
[21/41] mtd: spi-nor: gigadevice: convert flash_info to new format
        https://git.kernel.org/mtd/c/29cd12e08cd3
[22/41] mtd: spi-nor: intel: convert flash_info to new format
        https://git.kernel.org/mtd/c/3de6404725df
[23/41] mtd: spi-nor: issi: convert flash_info to new format
        https://git.kernel.org/mtd/c/856f61797cbc
[24/41] mtd: spi-nor: macronix: convert flash_info to new format
        https://git.kernel.org/mtd/c/09e5a29fa3ad
[25/41] mtd: spi-nor: micron-st: convert flash_info to new format
        https://git.kernel.org/mtd/c/8eb4eb838f9f
[26/41] mtd: spi-nor: spansion: convert flash_info to new format
        https://git.kernel.org/mtd/c/bb2d5c67b926
[27/41] mtd: spi-nor: sst: convert flash_info to new format
        https://git.kernel.org/mtd/c/47541a60636a
[28/41] mtd: spi-nor: winbond: convert flash_info to new format
        https://git.kernel.org/mtd/c/348d772d04fa
[29/41] mtd: spi-nor: xilinx: use new macros in S3AN_INFO()
        https://git.kernel.org/mtd/c/8e52f54ca994
[30/41] mtd: spi-nor: xmc: convert flash_info to new format
        https://git.kernel.org/mtd/c/9e02cb5b1d09
[31/41] mtd: spi-nor: atmel: sort flash_info database
        https://git.kernel.org/mtd/c/a16ae25022d9
[32/41] mtd: spi-nor: eon: sort flash_info database
        https://git.kernel.org/mtd/c/bc16dfcbf27f
[33/41] mtd: spi-nor: gigadevice: sort flash_info database
        https://git.kernel.org/mtd/c/1d8e64f40b24
[34/41] mtd: spi-nor: issi: sort flash_info database
        https://git.kernel.org/mtd/c/947bb8f24b61
[35/41] mtd: spi-nor: macronix: sort flash_info database
        https://git.kernel.org/mtd/c/b0eea634d086
[36/41] mtd: spi-nor: micron-st: sort flash_info database
        https://git.kernel.org/mtd/c/9df3c9ac6ea6
[37/41] mtd: spi-nor: spansion: sort flash_info database
        https://git.kernel.org/mtd/c/8770a6a89b15
[38/41] mtd: spi-nor: sst: sort flash_info database
        https://git.kernel.org/mtd/c/1de410815768
[39/41] mtd: spi-nor: winbond: sort flash_info entries
        https://git.kernel.org/mtd/c/d3b5ea3cc5ba
[40/41] mtd: spi-nor: atmel: drop duplicate entry
        https://git.kernel.org/mtd/c/1d4c725453c8
[41/41] mtd: spi-nor: core: get rid of the INFOx() macros
        https://git.kernel.org/mtd/c/914efd602a80

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
