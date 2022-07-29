Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E589EC00140
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 01:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRzNciIKaRFuZ6Y12fwfPMufl/7Z0GMKpt0V91qtQi8=; b=jSJl5ud5PqfPtR
	3HILTfBK44JJbmzGbJLXhE2q5C3dOdcnlAM7cjHY5HDk8mAA8uTbghTRgICfsoD5N+9FBKN16TbOt
	Ml8agULVT1rAoyCBFZr1rbNQKk1DQlBxRhBHvlgtQeltpkp1jRsmXg/I0fX2oX3G9PCgfphhBcedo
	ylyxjflhYJ9pbHA6CC0B2slbeGan4a/qUGRbb6rojCMq8RPw79afYQ8V57RF7JKqrAh9Hm+f7gjne
	DFujxYjzXZKZej4t/fhXZNbBLhxQwFLS6VOE9jJKQMD9GUxu+QaGLzLdbczkTPNkbWRrGqh6wnrWx
	IffOCgRjeJWWAtQ/a36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFAe-00GogP-SN; Fri, 29 Jul 2022 01:52:08 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFAc-00GofA-15
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 01:52:07 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b10so3375805pjq.5
        for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2022 18:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TpL10iobcJaKvx1KQjSddiwYHJQrd7e+Q/eCN7lBKI0=;
        b=HMcu00TB/JgK5RO+FWwKaWxm8bTqiUyFWVDVW19PRoBy88iRrFRTc3dCnad+lVGrUz
         MlVp6ml+O+YRejzJR7cCzmzsOG/UyAJKuiGIkhM1D5OjJ3+wvWdoVBVOZYHUq/ELSZ7t
         3MjcRk6ONFYiE2qyYttB2ZbpN1cfamwAAM9SwluL52agGpluZQSWKDUxI3vO6fvVApC+
         lLnwuxosLQ5n2TYyzVRGRzRHDiuwSuhyvbk22aW0B/eugvtuvk70AQuwiVF/yW/pe8S2
         EMWe8GkgVypj2p+gB9YF5JcrC13tdvxhV4NKeGV3wbjvz/XbrxdB4MMshQfmmgks3j4m
         WJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TpL10iobcJaKvx1KQjSddiwYHJQrd7e+Q/eCN7lBKI0=;
        b=aArDk1bAedKZhNEu1jzxfygi9oEZ5Ue0iYkzcXYXeaw8+Z+1Sziw45K7fKVJTGvE1l
         x261VeCiZI/Ei7QpBf14VjSz0MYhuoGyCI/t56Pvkkl6JIeWMtCnCK3MI8EW+ypP6Fwb
         K0Kw6Bwip5ABN2ALeDaRDzvRek2WAXlIxanl8PPJfKHEAA/sZj98+UoJoBw/K4Quc4h1
         LjlLJNrqE9ijNLEQquzZP94/Hn16cK6CBgZl2ozm6PWbgm1zMmhuyyeSDexqQNiuvl1d
         EFOqZd4zRi5won6RxhVrbARGMkljDj24rd3Zf4puTMUT5iNSS3i3sc60BQMxYD2twHrZ
         JlBw==
X-Gm-Message-State: ACgBeo2fqLibG8Ezyk0L0F7DaNNfLBG2aTkhhtuqB6FVz6i9uHwCkMTd
	b2hRa5a5V66zgUYlYgFtEY0=
X-Google-Smtp-Source: AA6agR5DXW5CkjCKR/fNok85329yJE8hsiSIaaQ2OLNZkV1o8FsRGCvPimG0fHICWFNu/gR+utYvyg==
X-Received: by 2002:a17:90a:930b:b0:1ed:5441:1fff with SMTP id p11-20020a17090a930b00b001ed54411fffmr1545330pjo.238.1659059525490;
        Thu, 28 Jul 2022 18:52:05 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id r12-20020aa79ecc000000b0052ab47dd0d5sm1495199pfq.63.2022.07.28.18.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 18:52:05 -0700 (PDT)
Message-ID: <f3f552cb-fa11-beaa-656a-9c9dd32291cd@gmail.com>
Date: Fri, 29 Jul 2022 10:52:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] mtd: spi-nor: generic flash driver
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Takahiro.Kuwano@infineon.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <b3d5ecf7-39e4-d6f1-93a8-9efc8e352c9d@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <b3d5ecf7-39e4-d6f1-93a8-9efc8e352c9d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_185206_118618_B8F6DAC8 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor and Michael,

On 7/26/2022 5:06 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> Would you please review this patch set?
> 
I tested a Flash device that is not yet in the database.
https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a&da=t

And it works fine.


zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
spi-nor-generic
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342b190f0890
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080101ff00000114000100ff84000102500100ffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe7ffe2ffffffff0f48eb086bffff
ffffeeffffffffff00ffffff00ff11d810d800ff00ff321cfeff71e9ffe1
ec031c607a757a75f766805c00d65dfff938c0a100000000000000000000
0000ffffffff710600fedcdcffff
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
13ecce2f195c4c71648e90d4a7e4a0df  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
zynq> test_qspi.sh
6+0 records in
6+0 records out
6291456 bytes (6.0MB) copied, 0.231887 seconds, 25.9MB/s
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
20b1c32188a5e337ef7575ffb5e4fa424f6bf5a9  qspi_test
20b1c32188a5e337ef7575ffb5e4fa424f6bf5a9  qspi_read


Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
