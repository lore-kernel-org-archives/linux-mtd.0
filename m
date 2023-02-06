Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4486C05027
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7Aoc6AmkKT8eJxIIYdpXkbijjr6y3Ium68n4wIf/94=; b=QCUQsfd9TYVykTzmtKhNHQcLae
	W/ak/nkoovw7k1p8p9okG97fQ+Stm0PaiS0iKEbXD5cN8yulNq/G/Zb9j3aOmjEpzUOUh8ZhIp3i1
	k4gcvv44cUFLt7K4PxuevIFBYwwv+0VkUwEN6LKrYxZI3Y+ALqo4UEebRTeDSqTWbUJToAY7yRDA/
	6yQOV2LPleA7GhdSu0MupadFoedxuWPg0z0UvJ+fXMK3tlMLrZojbrjAdQMEr5SIZdL1osc4rj9+7
	qNadKid0L2rnS0ZcoVT0l6MWhQlZgQ90qkQzu+tZxMgLCUmQw0LvSsgS5iVOhDHpWYCSzB0wBygU8
	gBy6TmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxy5-007vGc-1t; Mon, 06 Feb 2023 09:39:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxxy-007vGD-DH
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 09:39:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id r2so9734846wrv.7
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 01:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqVvJOVcuvFlaGLL4Fc5oWmzqolL+L8BjUouGe3o1rA=;
        b=LIuA7HIsqtqY/xoDM2iNXIBBZ42W2Ktg/zN0DthBGrENA4b/4IaPnc/+n+lo0uQ3YO
         A0U5F2krn3pBEc/IgyrYIIKe/BKhIck1sI4JFvfOu5BTAs7dAOrFnbyafwqnBmjpR0bm
         iP4qKBS0KZ43Nk6f9i7DDZiNYVYI7wVWjJOFsus36C9hmxLMY/aYB2sUSKsL6iOK7HZO
         36TtpCtq4+8l3vOy/d1WvkBcL4ctLr/dcnWjnJHoYNtVAZ2bXRw7FpQE+O01JuXzTulm
         0p/vYPVGFGTe1YzemQn8Kypc8/NFVkB6/JoKuy2sxmE/UerOshbUpO9IJSyJRgxQF3B+
         bUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqVvJOVcuvFlaGLL4Fc5oWmzqolL+L8BjUouGe3o1rA=;
        b=4F4m+T3HWLNywIsstiEVYOGN3iz9ZPLE7ldIUQ916JXir2cI7R3j3SBokmTKBXEjUq
         3WBv3watseflnm6hZdwdWtPljERH5b7scHrOOmWL8e5r4vJGqqxUAfdRGKW6I8khlD9V
         KYbOcxE18T/MJDmaeTXFv3hau1GzUr6Ug7aJBVCWwXj0vPpLCwCU1yr8Ye6cg8hgn79K
         A/PqOaG8r9ulFKCYpdZzb3Sic++wXFON72HtjNDhb2QgXy5TdlzG4Ax6ZIfa59ijhVBE
         EZ/UUxcKFXSQUoS57yzdnkn61fEP6ZiOP9AbBKXSITErvdg7dYk7tuKxkLRYZc8DCeXf
         MXCQ==
X-Gm-Message-State: AO0yUKVipEX3NEBiD7E6336pC4eH0FwNbLqlWD0Ru2t0rOk7yn1IfrvH
	v9PO/RlCakQkBceJ4y9PVcLCSA8AjY7IR8dH
X-Google-Smtp-Source: AK7set/dHRn8LWqva593CdJxbV1+ohzQp3OcbMfeZosad2Nh/ScN31yPWSIw2pbsmgia1YsrcyoOLA==
X-Received: by 2002:adf:f38e:0:b0:2c3:ed84:af82 with SMTP id m14-20020adff38e000000b002c3ed84af82mr852946wro.29.1675676351542;
        Mon, 06 Feb 2023 01:39:11 -0800 (PST)
Received: from [192.168.0.173] ([82.77.80.113])
        by smtp.gmail.com with ESMTPSA id t6-20020adfa2c6000000b002be063f6820sm8608612wra.81.2023.02.06.01.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 01:39:11 -0800 (PST)
Message-ID: <ac2b5000-8828-a9c1-ec1b-f91bce78910b@linaro.org>
Date: Mon, 6 Feb 2023 11:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>
Subject: [GIT PULL] mtd: spi-nor: Changes for v6.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_013914_507657_49241C21 
X-CRM114-Status: UNSURE (   8.67  )
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

Hi, Miquel, Richard,

This PR contains just small fixes on SPI NOR. You'll notice that I
merged 'mtd/fixes-for-6.2-rc4' into spi-nor/next to spare Linus of
solving a conflict on the include headers in drivers/mtd/spi-nor/core.c.

Cheers,
ta

The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

   Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git 
tags/spi-nor/for-6.3

for you to fetch changes up to f047382519ca41702ebaee5a862e87390f687137:

   Merge tag 'mtd/fixes-for-6.2-rc4' into spi-nor/next (2023-02-06 
11:23:34 +0200)

----------------------------------------------------------------
SPI NOR changes:
* small fixes on core and spansion driver.

----------------------------------------------------------------
Arnd Bergmann (1):
       mtd: cfi: allow building spi-intel standalone

Louis Rannou (1):
       mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type

Mikhail Zhilkin (1):
       mtd: parsers: scpart: fix __udivdi3 undefined on mips

Miquel Raynal (1):
       mtd: spi-nor: Create macros to define chip IDs and geometries

Takahiro Kuwano (3):
       mtd: spi-nor: sfdp: Fix index value for SCCR dwords
       mtd: spi-nor: sfdp: Rename BFPT_DWORD() macro to SFDP_DWORD()
       mtd: spi-nor: sfdp: Use SFDP_DWORD() macro for optional parameter 
tables

Tudor Ambarus (5):
       MAINTAINERS: Update email of Tudor Ambarus
       mtd: spi-nor: spansion: Consider reserved bits in CFR5 register
       mtd: spi-nor: spansion: Make CFRx reg fields generic
       mtd: spi-nor: Sort headers alphabetically
       Merge tag 'mtd/fixes-for-6.2-rc4' into spi-nor/next

Yuan Can (1):
       mtd: parsers: Fix potential memory leak in 
mtd_parser_tplink_safeloader_parse()

Zeng Heng (1):
       mtd: spi-nor: core: fix implicit declaration warning

  .mailmap                                                             | 
  1 +
  Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml  | 
  2 +-
  Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml  | 
  2 +-
  Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml | 
  2 +-
  Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml      | 
  2 +-
  Documentation/devicetree/bindings/spi/atmel,quadspi.yaml             | 
  2 +-
  MAINTAINERS                                                          | 
10 +++---
  drivers/crypto/atmel-ecc.c                                           | 
  4 +--
  drivers/crypto/atmel-i2c.c                                           | 
  4 +--
  drivers/crypto/atmel-i2c.h                                           | 
  2 +-
  drivers/mtd/parsers/scpart.c                                         | 
  2 +-
  drivers/mtd/parsers/tplink_safeloader.c                              | 
  4 ++-
  drivers/mtd/spi-nor/core.c                                           | 
21 ++++++++----
  drivers/mtd/spi-nor/core.h                                           | 
44 ++++++++++++------------
  drivers/mtd/spi-nor/debugfs.c                                        | 
  2 +-
  drivers/mtd/spi-nor/issi.c                                           | 
  2 +-
  drivers/mtd/spi-nor/macronix.c                                       | 
  2 +-
  drivers/mtd/spi-nor/sfdp.c                                           | 
78 +++++++++++++++++++++++--------------------
  drivers/mtd/spi-nor/sfdp.h                                           | 
  9 +++--
  drivers/mtd/spi-nor/spansion.c                                       | 
27 +++++++++------
  include/linux/mtd/spi-nor.h                                          | 
  1 -
  21 files changed, 120 insertions(+), 103 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
