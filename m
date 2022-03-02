Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD011C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zp2UU03kc01/JuGdxD4UHQzjcH6xV9UxfAC3x8uXuV4=; b=1eu7RetsRXkeFi
	ly2kY1OibztcUyIGimY1kWkFCWfnbOKoIGqwpaVJTCfPCjzIrkAsxjRa11ghZ1/qHU6JQQXNikZfu
	ox15QCeYRlNpfiRkCBmMM8vDEvTpasW9C/UcQD/h6vXhEkpWPZmyS0JmXc/II9vvyOJIb/EmgqAr5
	dbLMuw3f4qG1kupqBCZy3LUD9Uj6WMgRFBYDFBWGCVacOMuN4gb60mklvRJpha5qibeCyniciUjEk
	8RBIcfmMT3a8vuska39B+NUKsz0LLbJmsz2E/OMJoz5tFrQ60Yml7kltCb/QPwH9C4hgFa+u0LREb
	xcIibSaj3yBTRF8Ngong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPLp5-002Csi-SM; Wed, 02 Mar 2022 10:03:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPLp2-002CrY-12
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 10:03:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222A2vmS063787;
 Wed, 2 Mar 2022 04:02:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1646215377;
 bh=kzmAL4ny+b45rxh4hmDCUUkeFdO+HSD8mHyPXmdqx28=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jP/E/dCOqyWe+EM99Tf5536jGnNFwZFtO+EukKIujh7KfhMoZiOWoPWxWUucTveM5
 0o44PJtBJsGIO4nsSo/rRHL+ESqLTr0DIgX8M2MeWsSsEfJS8woKhzJwUm154fNRic
 8em28FYVPjiu1Xil631fwUzWDzrBjhXfvghoVeew=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222A2vJD092066
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Mar 2022 04:02:57 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 04:02:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 04:02:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222A2uoV112376;
 Wed, 2 Mar 2022 04:02:56 -0600
Date: Wed, 2 Mar 2022 15:32:55 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 1/4] spi: spi-mem: Allow specifying the byte order in DTR
 mode
Message-ID: <20220302100255.gseqjbdyxrgmt3zf@ti.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218145900.1440045-2-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_020304_225835_341F81CC 
X-CRM114-Status: GOOD (  24.76  )
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

Hi Tudor,

I'm reviewing the code here. I still have not thought through the 
discussion about Kconfig option yet.

On 18/02/22 04:58PM, Tudor Ambarus wrote:
> There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
> when configured in DTR mode. The byte order of 16-bit words is swapped

s/DTR mode/ Octal DTR mode/

I don't think this would apply to a 4D-4D-4D flash since it would only 
transmit one byte per clock cycle.

> when read or written in Double Transfer Rate (DTR) mode compared to
> Single Transfer Rate (STR) mode. If one writes D0 D1 D2 D3 bytes using
> 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will read back
> D1 D0 D3 D2. Swapping the bytes is a bad design decision because this may
> introduce some endianness problems. It can affect the boot sequence if the
> entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1 mode.
> Fortunately there are controllers that can swap back the bytes at runtime,
> fixing the endiannesses. Provide a way for the upper layers to specify the
> byte order in DTR mode.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  include/linux/spi/spi-mem.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 85e2ff7b840d..e1878417420c 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>   * @data.buswidth: number of IO lanes used to send/receive the data
>   * @data.dtr: whether the data should be sent in DTR mode or not
> + * @data.dtr_bswap16: whether the byte order of 16-bit words is swapped when
> + *		      read or written in DTR mode compared to STR mode.
>   * @data.dir: direction of the transfer
>   * @data.nbytes: number of data bytes to send/receive. Can be zero if the
>   *		 operation does not involve transferring data
> @@ -119,6 +121,7 @@ struct spi_mem_op {
>  	struct {
>  		u8 buswidth;
>  		u8 dtr : 1;
> +		u8 dtr_bswap16 : 1;

You also need to add this capability to spi_controller_mem_caps and 
update spi_mem_default_supports_op() to check for it.

>  		enum spi_mem_data_dir dir;
>  		unsigned int nbytes;
>  		union {
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
