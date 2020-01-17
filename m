Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3FCC33C9E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C952072E
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 20:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lpKuWpvP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="gO45Ce3q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C952072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ix4r8N1C5UASk9nc5j9R8Bc5T59hQTW+4n97DR4/o2A=; b=lpKuWpvPH/AJ0R
	NxJ0WeK9VN3t6ftODi1xTYkYmu8amEPtFBwH31BGwJlRr1XkvusRDFiai6T4RYt9c0OhHucXdpKBA
	7ozjY1rGjVqHBwVvtQ6st6ev5rVPga02XuFtjklYlX2Z40meBjh3DB44U0UfcKzRlpF8aYBJjbyd6
	8x7qTZJ6TOXBZBu1tXGPB8YfOqql4qWFWTY5mkjkL3C4MA6MX7EGke0P9Z33340hODUfTG8dvgtpD
	+3rR8SThydBLlsrDfr9/py1FimGtztjeFLHiRxi2fzF2nVeLkaRjoHqVM6BJEhLG5i+QR8o/WdSbd
	e9XjCSBX/GCd59oUX0QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isXzv-0004wz-F9; Fri, 17 Jan 2020 20:13:39 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isXzr-0004wZ-Qh
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 20:13:37 +0000
Received: by mail-lj1-x242.google.com with SMTP id j1so27690462lja.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2020 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=37j64iFVRcbYUifMvO0VUWihxKWBhXSorXWLwrVpBYI=;
 b=gO45Ce3qTBY3QAoB5qAI4gvSBv0MQbvAJKoYGbTLefKraI7FiRsHnxXytoSJC7tuJ8
 WobuSfzTWiS09toTGtcn1e3/DTq3/85qPncdmCyLUMO+SoRHJg4niw4PncPb0SISHhGG
 tv52jUGjLQA4RATu3IW6KmX2uDSok1snRFxgjimhkhNhuN+8rsjW1krc44sPp3SxBg2A
 RWdF38EA2mjGrlLVYzYxFJqcd8goMJ1Ps4cmklcZUSJdpnmcm/PwURyGYjKrIb0M5HKc
 +IrRsWKyF71xA+Ic9zhqM/A9aPh9iGOHuSRl+hqcpwE7iWITACGV6Ra0V63EwN1y/3Ht
 trCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=37j64iFVRcbYUifMvO0VUWihxKWBhXSorXWLwrVpBYI=;
 b=HBjKQs4IY7Ge88qKJC+G4wls5/whaTeVoVGKMqw2RUQQKlX4liB9KeO/XOCC+0CwBM
 K965oKjaPqDmp6TaIE26oyhU4SD1zpt1J0YJS7bA5kBVBPP4UCqhH2wbubBH5AoY3P+t
 lNtEohr0nLEjvgixbbUlaxIkKQ1+oO086BTvH5ZqmmI5IjM8CP7Kw1PnIYx7AHDw7AWG
 cfg9KP2VBjW+enK+mfZWkh99inkR5zgdFj2OP62raJjFKKiJfG+H+/A54X6XBaxOPUIb
 7zKkb9Re+AYxHCxtpOiSTucKcsRc0F14wSbOOIk4SfdrCXYxBxstaIPva7hQ97S+cgFp
 uGkQ==
X-Gm-Message-State: APjAAAUlib5Vz1fKVCYEnYh/qYBY0iLduMkbsRwRGKdYGNe3lwskBe4l
 lME1ayofuAsOyF7eB6qyeOvkVg==
X-Google-Smtp-Source: APXvYqzvfiy4WNj8sGiZMelRDkyJbYDOhXB2O4wPSmq5rRRowgLRk76W6u2L2nCn2epMAru4qCwsFw==
X-Received: by 2002:a2e:9013:: with SMTP id h19mr6284290ljg.223.1579292013556; 
 Fri, 17 Jan 2020 12:13:33 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:68e:b53a:88ca:69f2:f8b6:d53])
 by smtp.gmail.com with ESMTPSA id z5sm12885767lji.40.2020.01.17.12.13.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jan 2020 12:13:32 -0800 (PST)
Subject: Re: [PATCH REPOST v3] mtd: spi-nor: use spi-mem dirmap API
To: Tudor.Ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <88969938-961b-973b-0c13-3792c394b1d3@cogentembedded.com>
 <988a924d-98be-5b86-3ec2-f87f242de069@microchip.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3f4c9cbc-ec3e-a4a3-85af-febc31f9ab63@cogentembedded.com>
Date: Fri, 17 Jan 2020 23:13:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <988a924d-98be-5b86-3ec2-f87f242de069@microchip.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_121336_278940_01E94B65 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 12/23/2019 04:45 PM, Tudor.Ambarus@microchip.com wrote:

>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Make use of the spi-mem direct mapping API to let advanced controllers
>> optimize read/write operations when they support direct mapping.
>>
>> Based on the original patch by Boris Brezillon <boris.brezillon@bootlin.com>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>
>> ---
>> The patch is against the 'spi-nor/next' branch of the MTD 'linux.git repo...
>> Forgot to post to 'linux-mtd' 1st time... :-(
>>
>> Changes in version 3:
>> - simplified the way spi_mem_dirmap_{read|write}() are called;
>> - refreshed the patch;
>> - added Boris' tag.
>>
>> Changes in version 2:
>> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}() to
>>   spi_nor_spimem_{read|write}_data().
>>
>>  drivers/mtd/spi-nor/spi-nor.c |   66 ++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/spi-nor.h   |    5 +++
>>  2 files changed, 71 insertions(+)
>>
>> Index: linux/drivers/mtd/spi-nor/spi-nor.c
>> ===================================================================
>> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
>> +++ linux/drivers/mtd/spi-nor/spi-nor.c
>> @@ -311,6 +311,9 @@ static ssize_t spi_nor_spimem_read_data(
>>                            SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>>                            SPI_MEM_OP_DATA_IN(len, buf, 1));
>>
>> +       if (nor->dirmap.rdesc)
>> +               return spi_mem_dirmap_read(nor->dirmap.rdesc, from, len, buf);
>> +
>>         /* get transfer protocols. */
>>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
>>         op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
>> @@ -360,6 +363,9 @@ static ssize_t spi_nor_spimem_write_data
>>                            SPI_MEM_OP_NO_DUMMY,
>>                            SPI_MEM_OP_DATA_OUT(len, buf, 1));
>>
>> +       if (nor->dirmap.wdesc)
> 
> This check is always true.

   Not really, the rdesc/wdesc pointers are NULL during probing:

spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi-nor spi0.0: Failed to parse optional parameter table: ff81                  
spi_nor_spimem_read_data(): nor->dirmap.rdesc = 0000000000000000                
spi-nor spi0.0: s25fs512s (65536 Kbytes)                                        
11 fixed-partitions partitions found on MTD device spi0.0                       
Creating 11 MTD partitions on "spi0.0":                                         
0x000000000000-0x000000040000 : "bootparam"                                     
0x000000040000-0x0000000c0000 : "cr7"                                           
0x0000000c0000-0x000000140000 : "cert_header_sa3"                               
0x000000140000-0x000000180000 : "bl2"                                           
0x000000180000-0x0000001c0000 : "cert_header_sa6"                               
0x0000001c0000-0x000000620000 : "bl31"                                          
0x000000640000-0x000000700000 : "uboot"                                         
0x000000700000-0x000000740000 : "uboot-env"                                     
0x000000740000-0x0000007c0000 : "dtb"                                           
0x0000007c0000-0x000001bc0000 : "kernel"                                        
0x000001bc0000-0x000004000000 : "user"                                          

   Perhaps the order of calls during probe should be changed?

> The dirmap API is available just for the spi-mem
> drivers, and we are already in the nor->spimem case.
> 
>> +               return spi_mem_dirmap_write(nor->dirmap.wdesc, to, len, buf);
>> +
> This doesn't guarantee that the buffer is DMA-able. You should instead modify
> the spi_nor_spimem_xfer_data() method.

   Still looking into this...
 
> Cheers,
> ta

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
