Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DDDC07E95
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 06:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A896613EB
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 06:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A896613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZW0Itemt3aB73ce4nXfOG4i1VLML9JV+e4WS+qZ3eWY=; b=VqjutubH9qhe6MAAcW/oM0I+Hv
	5dVu7YhlG1V7fmohV3SSlTUL0Xl4uPrXciY3f5hrQJwQsH8TJjT2lHbMmJSA6N/mu5VQxGyIkOsDy
	y5hPSreWIqYFqxfzlIaR6PD5ktuxEkIsS/AHjXfx0JkhsEcy7lJHCGuET/dWEhtjIV/qLpmu7BxLF
	OAxHAxZrUlCMsN0n8r46em/0afCtDWKMElYREepteZVgoURL0riGvc7FcYPIbRo4ogBhq6MI2E2pq
	XP/qH16X7Oh9lxzShoIrCJRTzuoSRtSk8JXdoqPGjsaBIlxEDp1VCTQ8elQEH0nJBLbSLnE5bJNk2
	1xtrG9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4HKU-003LQq-8l; Fri, 16 Jul 2021 06:28:10 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HKP-003LPW-5I
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 06:28:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16G6RuHJ104744;
 Fri, 16 Jul 2021 01:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626416876;
 bh=cfELfHH8dQSgPhXYzJWo0hBT+/tjY/kBcQVU7dCb3a0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xHjHEw1GaOV5UGeSOurHeQrKtu60Tx0cR2xYrNcgy7RDzqyBJlJuGt/WdsUd60Rtd
 sqryxk8xucQNh6Lz4IBWX+TRjSCC1ZZa5Wnlf0GgR+Oj4hNNNr6JqiiyhYtPnue2Vl
 WcFrDLrnGY9LldTat2wSSJrgdcfOo3YExZ3ut7Ok=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16G6Rubn052120
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Jul 2021 01:27:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 01:27:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 01:27:56 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16G6RrBp041628;
 Fri, 16 Jul 2021 01:27:54 -0500
Subject: Re: [PATCH v6 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
To: Takahiro Kuwano <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1623831222.git.Takahiro.Kuwano@infineon.com>
 <3a760ae3-a7af-bbc5-5272-ef6d6e29c1f7@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0224ac50-b06e-6d60-bd19-cf40e9fe1e25@ti.com>
Date: Fri, 16 Jul 2021 11:57:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3a760ae3-a7af-bbc5-5272-ef6d6e29c1f7@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_232805_500451_202FA1B8 
X-CRM114-Status: GOOD (  18.13  )
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



On 7/15/21 12:04 PM, Takahiro Kuwano wrote:
> Hi,
> 
> I found some critical changes are missing from this series.
> I will submit new version.
> 

While reposting, could you provide dumps of SFDP and device ID data 
in cover letter for future reference. See [1] on how to dump these tables.

[1] https://lore.kernel.org/linux-mtd/7038f037de3e224016d269324517400d@walle.cc/

Regards
Vignesh

> On 6/16/2021 5:44 PM, tkuw584924@gmail.com wrote:
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> The summary datasheets can be found in the following links.
>> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
>>
>> The full version can be found in the following links (registration
>> required).
>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
>>
>> Tested on Xilinx Zynq-7000 FPGA board.
>>
>> Changes in v6:
>>   - Remove 2Gb dual die package parts and related changes to split mulit
>>     die package support into another series of patches  
>>
>> Changes in v5:
>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>
>> Changes in v4:
>>   - Reword 'legacy' to 'default'
>>   - Rename spi_nor_read() to spi_nor_default_ready()
>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>   - Modify comment for spansion_write_any_reg()
>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>
>> Changes in v3:
>>   - Split into multiple patches
>>   - Remove S25HL256T and S25HS256T
>>   - Add S25HL02GT and S25HS02GT 
>>   - Add support for multi-die package parts support
>>   - Cleanup Read/Write Any Register implementation
>>   - Remove erase_map fix for top/split sector layout
>>   - Set ECC data unit size (16B) to writesize 
>>
>> Changes in v2:
>>   - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
>>   - Check CFR3V[4] to determine page_size instead of force 512B
>>   - Depend on the patchset below to support non-uniform sector layout
>>     https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/
>>
>> Takahiro Kuwano (3):
>>   mtd: spi-nor: spansion: Add support for Read/Write Any Register
>>   mtd: spi-nor: spansion: Add support for volatile QE bit
>>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
>>
>>  drivers/mtd/spi-nor/spansion.c | 278 +++++++++++++++++++++++++++++++++
>>  1 file changed, 278 insertions(+)
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
