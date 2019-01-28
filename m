Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E3FC282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 04:57:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A83A20870
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 04:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sVPGZow/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A83A20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N7Nx0UOnvhIzdQF+0XNfygaR+oL8fFo8IDd4fcm8SzM=; b=sVPGZow/zdlmndYB6Fyd62qLJ
	kNk0lpaHhI1aMfUKOBU3ZhqxQas6T0c9/xBBzwBoLDwcvmCqsdZRLKtjl+Rqp94+c+SM6KZEAtCw+
	uLsRKXWwaqziJbal9T+ZBLkwFs0U/+ZXrQwS+wvPsboa3c5I/s9lq4OANUGFw0vgNrSh3HsGLZo0r
	saXT1zWs7TBhws/+q0aISAZUcCOfhSG6oOTXEVpXbmFTNLBYIdeuPIOPGdj83chphh5ULHmAnaShb
	mlq0yOO5lDjNclq2/dO0PqHlljOByEqUYtKF0ORnFlkGAS6H+/tjNiy1H+SkLU9PnW6BkMwOc8tQi
	26MqB8Sfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnyzC-0005Lt-DQ; Mon, 28 Jan 2019 04:57:30 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnyz9-0005La-B8
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 04:57:28 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2019 20:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,532,1539673200"; d="scan'208";a="113155840"
Received: from mandalpu-mobl.gar.corp.intel.com (HELO [10.66.97.14])
 ([10.66.97.14])
 by orsmga008.jf.intel.com with ESMTP; 27 Jan 2019 20:57:22 -0800
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
To: Tudor.Ambarus@microchip.com, f.blogs@napier.co.nz,
 boris.brezillon@bootlin.com
References: <20181214021516.43609-1-purna.chandra.mandal@intel.com>
 <c627314d-fdf6-7e69-7c54-03a513f563fc@microchip.com>
From: "Mandal, Purna Chandra" <purna.chandra.mandal@intel.com>
Message-ID: <76066a83-1cd2-5baf-1930-c290f66e73ba@intel.com>
Date: Mon, 28 Jan 2019 10:27:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <c627314d-fdf6-7e69-7c54-03a513f563fc@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_205727_400461_08D5E199 
X-CRM114-Status: GOOD (  21.64  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 21-Jan-19 3:07 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Purna,
> 
> On 12/14/2018 04:15 AM, Purna Chandra Mandal wrote:
>> cadence-quadspi controller allows upto eight bytes of data to be transferred
>> in software Triggered Instruction generator (STIG) mode of operation. Lower
>> 4 bytes are written through writedatalower and upper 4 bytes by
>> writedataupper register.
> 
> Is this supported by all versions of the IP?
> 
Yes, it is supported on all versions of IP.
>>
>> This patch allows all the 8 bytes to be written.
>>
>> Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
>> ---
>>
>>   drivers/mtd/spi-nor/cadence-quadspi.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>> index 04cedd3a2bf6..990934387fea 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -420,7 +420,7 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>>   	unsigned int data;
> 
> I know that this is not your change, but data should be u32 and not unsigned
> int. reg too ... probably one should submit a patch to change this, I see that
> the same error is done in cqspi_command_read().
ack. will be done in separate patch.
> 
>>   	int ret;
>>   
>> -	if (n_tx > 4 || (n_tx && !txbuf)) {
>> +	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
>>   		dev_err(nor->dev,
>>   			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
>>   			n_tx, txbuf);
>> @@ -435,8 +435,13 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
>>   		data = 0;>  		memcpy(&data, txbuf, n_tx);
> 
> You should limit what is copied in data, similar to what is done in
> cqspi_command_read():
> 
> write_len = (n_tx > 4) ? 4 : n_tx;
> memcpy(&data, txbuf, write_len);
> txbuf += write_len;
ack.
> 
> 
> 
>>   		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
>> -	}
>>   
>> +		if (n_tx > 4) {
>> +			data = 0;
> and then:
> write_len = n_tx - 4;
> memcpy(&data, txbuf, write_len);
> 
ack.
> Cheers,
> ta
> 
>> +			memcpy(&data, txbuf + 4, n_tx - 4);
>> +			writel(data, reg_base + CQSPI_REG_CMDWRITEDATAUPPER);
>> +		}
>> +	}
>>   	ret = cqspi_exec_flash_cmd(cqspi, reg);
>>   	return ret;
>>   }
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
