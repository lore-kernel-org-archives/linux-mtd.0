Return-Path: <SRS0=YEqx=46=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A11FC10DCE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 06:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02412072F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2020 06:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="apXYlFWu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mfUBslo5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02412072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD6oqxKQuWjoD/MU4mS1V1l1qeWJjBoMJ9GnZCc92g0=; b=apXYlFWurizhZr
	FaKa63OesspTgpQTa7RNdyfUxGT5uPLFmNxCs0C9neVDxyFQgWWAm9r5hYbJY4ua6hsb094u5vjmg
	k+IbF+u/oJ8ypDDj+oBWq0qhxcaZRYeLztYSk3bydopQO7x2/WgJjF0vfunSR71zHY8MU+DYc4BZ2
	Q93QDKdrx7Ws6k2h1ZJuZuTxlfJ1OCYrew4NonxYeB6rMHGFRYdRup4o4ltoJXJXXsLHVHHZmDmT+
	fMsLqUcndjx+9BXBFhLts5sCgXtXmrMwmE6wFPPf3qbJhpCQrlSWnbh2hxkcC+zlpYfQnkRGkfvAc
	zY8f5bLHRwML+1JGZBZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCdRd-0003Sc-AD; Fri, 13 Mar 2020 06:05:17 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCdRZ-0003RP-Nb; Fri, 13 Mar 2020 06:05:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02D64RVG082531;
 Fri, 13 Mar 2020 01:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584079467;
 bh=vV1m4ipHbEcjDNG4CCj7hTEXa79TbXMFs2L4A48lc2U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mfUBslo5TSJh2eSnf7KSk/FglJiy/UUACwvkd1PZehbMiBP+SOdDjllPmHp1iD5tP
 GciZb4L06sqC+4DD9ETAwsh/vQ10LqQz588dN6F0swFU3xbxfi8ndvonzVAj61Z26w
 fkZcaWe52pGoASlkjY9TtE9yyO6oFiQWQY8cAI6s=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02D64RHi005130
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Mar 2020 01:04:27 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 01:04:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 01:04:27 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02D64Gxu117651;
 Fri, 13 Mar 2020 01:04:18 -0500
Subject: Re: [PATCH 01/23] mtd: spi-nor: Stop prefixing generic functions with
 a manufacturer name
To: <Tudor.Ambarus@microchip.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>
References: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
 <20200302180730.1886678-2-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <91394111-cbd6-c24e-485d-88fcd6825dc7@ti.com>
Date: Fri, 13 Mar 2020 11:34:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200302180730.1886678-2-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_230513_876115_1601132B 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, thor.thayer@linux.intel.com,
 jethro@fortanix.com, rfontana@redhat.com, miquel.raynal@bootlin.com,
 opensource@jilayne.com, richard@nod.at, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, joel@jms.id.au, nishkadg.linux@gmail.com,
 john.garry@huawei.com, vz@mleia.com, alexander.sverdlin@nokia.com,
 matthias.bgg@gmail.com, tglx@linutronix.de, swboyd@chromium.org,
 mika.westerberg@linux.intel.com, allison@lohutok.net,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 michael@walle.cc, ludovic.barre@st.com, linux-mediatek@lists.infradead.org,
 info@metux.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/03/20 11:37 pm, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <bbrezillon@kernel.org>
> 
> Replace the manufacturer prefix by something describing more precisely
> what those functions do.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> [tudor.ambarus@microchip.com: prepend spi_nor_ to all modified methods.]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 88 ++++++++++++++++++-----------------
>  1 file changed, 45 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index caf0c109cca0..b15e262765e1 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -568,14 +568,15 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
>  }
>  
>  /**
> - * macronix_set_4byte() - Set 4-byte address mode for Macronix flashes.
> + * spi_nor_en4_ex4_set_4byte() - Enter/Exit 4-byte mode for Macronix like
> + * flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int macronix_set_4byte(struct spi_nor *nor, bool enable)
> +static int spi_nor_en4_ex4_set_4byte(struct spi_nor *nor, bool enable)


Sounds a bit weird, how about simplifying this to:

	spi_nor_set_4byte_addr_mode()

Or if you want to be specific:

	spi_nor_en_ex_4byte_addr_mode()

>  {
>  	int ret;
>  
> @@ -604,14 +605,15 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
>  }
>  
>  /**
> - * st_micron_set_4byte() - Set 4-byte address mode for ST and Micron flashes.
> + * spi_nor_en4_ex4_wen_set_4byte() - Set 4-byte address mode for ST and Micron
> + * flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @enable:	true to enter the 4-byte address mode, false to exit the 4-byte
>   *		address mode.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
> +static int spi_nor_en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)


Unrelated to this patch itself, but can we just have one set_4byte
variant that uses WREN and drop the other one?
I expect sending WREN should be harmless even for cmds that don't expect
one.

Rest looks good to me.

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
