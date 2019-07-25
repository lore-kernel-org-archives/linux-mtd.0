Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60814C7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:17:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325B82238C
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 13:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PplbooID";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="B+P558ps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325B82238C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ko7S3dU26M5LqfyVuPMe3BriwDCYo+IQu5twUKSwZ38=; b=PplbooID2+qKLc
	6Kc1SoU93KV4cLhyINq/hMsJ2YihO2PQhTBgaHPT299FWxw0sfR8kIzriP1YRNLSauXfGq5OoSnc9
	cbi9BSp4oy69nkfUDEzJnQWOychL1W3xU6o+hnNFnq4zXOXQpSGGyC9LS9YlxrKsfJypmtfKHfg9Q
	pkkYSFDEQIhpbddBZ4iP7ZtKHSdMry1M4hf4onW/wJ25u2rxr4+llLTXdhuvjlFEANXrQ6y0t/PJt
	m2ViurSdaTwqU+UOpG9ZTrvggI+OygG7njtc3UZ6HewkszCMtocr33j7ekBD9XsoKDhsPu5dRlOXU
	B5yN68HNQkrs4Ar7SH4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqdcb-0006eE-LN; Thu, 25 Jul 2019 13:17:25 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqdcW-0006cB-R6
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 13:17:23 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: plo3Lj8MazJ4guJ4NFcRGKBp4+rYb7FQA68/v4oA5hn4Km4/Dmvwvwy+ixmpuNg5PwUsgWjnS2
 USihOoj92JRhmygI6UloQSdJUAA4wvZKY6It7BOyvdYbZHK5FmzPQwjKaprq18DnBEmQV8YvLM
 gPzIOctSitVIFYlu4Dvs3SIw5XSBght3HPt5rQnd2slHoJ7zRYTNDErmtjzVRWOIw8VWz//Wod
 UCF4x06fq9YNm+pXP4/yf4+kpXAZK0DMhTjpO/cdCwJOUzN6H8GfDOPEefOOwKuYC89zwzpeOd
 wI4=
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="44117967"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 06:17:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 06:17:11 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 25 Jul 2019 06:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhcFHCxof1dYAEFIL5YEDOUCMjEPpLWibrc7nj34i+n6AzOY7xuyE1Gspp61mGkI2GEVemRdw1z775HW2Fg3+j7kAXZGQt0zCZgUIc7PqdfX3/iTn9mFJm8kcjGHotdLS6BWEjtz7vB+YlTRRqzFGI6HKmOiGGA2gXA2b+ih4FxfqixseI0sSGdCASebGp4NvNz29LrhEf5OQnj6xUzzOvbiI4U8/lTONTwSAtyCO+/Q9XUqV5X2FTSzn7mKJIPwL9dXiK5RUuj9xOBourL0jgiKaxgRsxi81FHbzk1Ry+SFpSLAE3EeZ+j3MJzr/ybZeZ6VuyOHQTk3jx2S0XwcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ePatnRnuOgsVTPfbzNLFcZ66DrMF4D7r5ahieMaY6c=;
 b=R6rlJYbb/0cA+UgNO84BRkLnOSEi6kMzzBLRnndlaaRrZznIEJ1jIvTeEp85xieKGK/uTld+xrqM7hjUJTc54ZwS74J0Lwg6i9tfrHswYiOw65LyHym9d4YR/QPvHYhpE6IZULnQI5HucPrSwTQu/f8ct1NpsKGpd7+OCCOPKTVQaceeYFgMHMmuHYSCMvObrUXZS/TgeFLDuC/Ju9x8rmOzZcIl211El1fIRP/t67CLBCybcgrTje0cADrz5sNRzIPOol/IgYdLG3jhNmObSR2ojpzwPfHGoQLiwCRSFCXolDbBjGbTBCi/QLVKbx5eMtVnrziEo1lbk/8SXT6Pow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ePatnRnuOgsVTPfbzNLFcZ66DrMF4D7r5ahieMaY6c=;
 b=B+P558psmzuncmf+B6OVz77D7XN+USO3ZteQl14SKd/0RGnCFLCYHwyamcHF3uAUyjmaS5PxACajWZnDCJvG0yrWygwqbJLhaxAfhdQSpfH4RqyT3D+ogif7nQJlQm2xopjFXAPyoNcKYfIcYAEKGiQpjbdq2nw2nBeVBOZr+nc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1859.namprd11.prod.outlook.com (10.175.100.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 13:17:07 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 13:17:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVPtFNjfEG9DN44ESnRp+H/g0b8qbbN92AgAAWBICAAAr8AA==
Date: Thu, 25 Jul 2019 13:17:07 +0000
Message-ID: <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
 <20190725143745.634efcd6@collabora.com>
In-Reply-To: <20190725143745.634efcd6@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0083.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::27) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f647d79f-793f-4132-7a58-08d71102648f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1859; 
x-ms-traffictypediagnostic: BN6PR11MB1859:
x-microsoft-antispam-prvs: <BN6PR11MB18590558889801CE20041B8AF0C10@BN6PR11MB1859.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(366004)(199004)(189003)(7736002)(81156014)(86362001)(256004)(5660300002)(25786009)(316002)(305945005)(53936002)(14454004)(8676002)(11346002)(6512007)(31686004)(68736007)(71200400001)(71190400001)(14444005)(66446008)(8936002)(81166006)(6486002)(2616005)(446003)(6436002)(99286004)(36756003)(6246003)(476003)(186003)(6116002)(486006)(4326008)(3846002)(53546011)(6916009)(229853002)(26005)(66066001)(6506007)(386003)(64756008)(66556008)(54906003)(2906002)(52116002)(76176011)(66476007)(31696002)(478600001)(102836004)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1859;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5AkjtPV/nh0XigMxVj+zVFnZzf+xDH/SbVIOY2aFv//79frrYDp9IiaqArlvoaacwwudts8jcDyzlpwZU2qBEN6drTRdDx7W5wDbLlfQC2JM8jUC4d2sPZc96acolLwqTB/Sl2asHevmFxajLuOZG/cEN6OdKwmfKMgh9uC7kh5x+1yWFVXKJNc1lBLdIMVRkQLbyj0rSNrJlB6v/nk4+dAZCo6DD/gxZEXEiQ5wp9QKfGCJKbJRCZVk0aW4FPP6fRl0YsbYaC8QdA3HvrYUWSGElJMiqF5IdhHrQmKjl3qMDMxx2SLBaqu0ohmnEZO+glbG9oOS9SutQ4ZrHyX7rxuRGDK2wCRQyNBS46GQWj5TaxlQrliB3vml4GCEtE+d9/C6GnGIXuisr3nl5RCwGaJ/DEwGE2VlPOtwxU+xtdg=
Content-ID: <34675E6787204C46BA007C05FBD382FD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f647d79f-793f-4132-7a58-08d71102648f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:17:07.4594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_061721_695142_42914B77 
X-CRM114-Status: GOOD (  22.48  )
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
Cc: yogeshnarayan.gaur@nxp.com, vigneshr@ti.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Boris,

On 07/25/2019 03:37 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Thu, 25 Jul 2019 11:19:06 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>>> + */
>>> +static int spi_nor_exec_op(struct spi_nor *nor, struct spi_mem_op *op,
>>> +			   u64 *addr, void *buf, size_t len)
>>> +{
>>> +	int ret;
>>> +	bool usebouncebuf = false;  
>>
>> I don't think we need a bounce buffer for regs. What is the maximum size that we
>> read/write regs, SPI_NOR_MAX_CMD_SIZE(8)?
>>
>> In spi-nor.c the maximum length that we pass to nor->read_reg()/write_reg() is
>> SPI_NOR_MAX_ID_LEN(6).
>>
>> I can provide a patch to always use nor->cmd_buf when reading/writing regs so
>> you respin the series on top of it, if you feel the same.
>>
>> With nor->cmd_buf this function will be reduced to the following:
>>
>> static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
>> {
>> 	if (!op || (op->data.nbytes && !nor->cmd_buf))
>> 		return -EINVAL;
>>
>> 	return spi_mem_exec_op(nor->spimem, op);
>> }
> 
> Well, I don't think that's a good idea. ->cmd_buf is an array in the
> middle of the spi_nor struct, which means it won't be aligned on a
> cache line and you'll have to be extra careful not to touch the spi_nor
> fields when calling spi_mem_exec_op(). Might work, but I wouldn't take
> the risk if I were you.
> 

u8 cmd_buf[SPI_NOR_MAX_CMD_SIZE] ____cacheline_aligned;

Does this help?

> Another option would be to allocate ->cmd_buf with kmalloc() instead of
> having it defined as a static array.
> 
>>
>> spi_nor_exec_op() always received a NULL addr, let's get rid of it. We won't
>> need buf anymore and you can retrieve the length from op->data.nbytes. Now that
>> we trimmed the arguments, I think I would get rid of the
>> spi_nor_data/nodata_op() wrappers and use spi_nor_spimem_xfer_reg() directly.
> 
> I think I added the addr param for a good reason (probably to support
> Octo mode cmds that take an address parameter). This being said, I
> agree with you, we should just pass everything through the op parameter
> (including the address if we ever need to add one).
> 
> 
>>> +
>>> +/**
>>> + * spi_nor_spimem_xfer_data() - helper function to read/write data to
>>> + *                              flash's memory region
>>> + * @nor:        pointer to 'struct spi_nor'
>>> + * @op:         pointer to 'struct spi_mem_op' template for transfer
>>> + * @proto:      protocol to be used for transfer
>>> + *
>>> + * Return: number of bytes transferred on success, -errno otherwise
>>> + */
>>> +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
>>> +					struct spi_mem_op *op,
>>> +					enum spi_nor_protocol proto)
>>> +{
>>> +	bool usebouncebuf = false;  
>>
>> declare bool at the end to avoid stack padding.
> 
> But it breaks the reverse-xmas-tree formatting :-).
> 
>>
>>> +	void *rdbuf = NULL;
>>> +	const void *buf;  
>>
>> you can get rid of rdbuf and buf if you pass buf as argument.
> 
> Hm, passing the buffer to send data from/receive data into is already
> part of the spi_mem_op definition process (which is done in the caller
> of this func) so why bother passing an extra arg to the function.
> Note that you had the exact opposite argument for the
> spi_nor_spimem_xfer_reg() prototype you suggested above (which I
> agree with BTW) :P.

In order to avoid if clauses like "if (op->data.dir == SPI_MEM_DATA_IN)". You
can't use op->data.buf directly, the *out const qualifier can be discarded.

pointer to buf was not needed in spi_nor_spimem_xfer_reg(), we could use
nor->cmd_buf.

> 
>>
>>> +	int ret;
>>> +
>>> +	/* get transfer protocols. */
>>> +	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
>>> +	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>> +	op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
>>> +
>>> +	if (op->data.dir == SPI_MEM_DATA_IN)
>>> +		buf = op->data.buf.in;
>>> +	else
>>> +		buf = op->data.buf.out;
>>> +
>>> +	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
>>> +		usebouncebuf = true;
>>> +
>>> +	if (usebouncebuf) {
>>> +		if (op->data.nbytes > nor->bouncebuf_size)
>>> +			op->data.nbytes = nor->bouncebuf_size;
>>> +
>>> +		if (op->data.dir == SPI_MEM_DATA_IN) {
>>> +			rdbuf = op->data.buf.in;
>>> +			op->data.buf.in = nor->bouncebuf;
>>> +		} else {
>>> +			op->data.buf.out = nor->bouncebuf;
>>> +			memcpy(nor->bouncebuf, buf,
>>> +			       op->data.nbytes);
>>> +		}
>>> +	}
>>> +
>>> +	ret = spi_mem_adjust_op_size(nor->spimem, op);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = spi_mem_exec_op(nor->spimem, op);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
>>> +		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
>>> +
>>> +	return op->data.nbytes;
>>> +}
>>> +
>>> +/**
>>> + * spi_nor_spimem_read_data() - read data from flash's memory region via
>>> + *                              spi-mem
>>> + * @nor:        pointer to 'struct spi_nor'
>>> + * @ofs:        offset to read from
>>> + * @len:        number of bytes to read
>>> + * @buf:        pointer to dst buffer
>>> + *
>>> + * Return: number of bytes read successfully, -errno otherwise
>>> + */
>>> +static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t ofs,  
>>
>> s/ofs/from? both flash and buf may have offsets, "from" better indicates that
>> the offset is associated with the flash.
> 
> The semantic is well documented in the doc just above the function, but
> I have the feeling that you're in 'nitpick' mode, so I'll just let you
> pick the one you prefer :).

Not my intention. struct mtd_info and struct spi_nor use "from" when referring
to the offset from where to read in the read() calls. Just consistency reasons.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
