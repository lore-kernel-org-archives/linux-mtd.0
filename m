Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C3CC7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 14:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7F721901
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 14:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbFDmWya";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="2oHVYr0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7F721901
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQncLuCIWPSk3bOUA7tYuDDtdMiyFztviNLjylytQ50=; b=HbFDmWyaoS7mzf
	4iV02X3vQBKA1lVDn4TVr61BhYRpgyYBLRR7Te+DAjEqs8+bN7Lv1Qb9iEZegt/fw1iy2kTUdbA1L
	qZMdbDoucX9KjyTGjhmVDDVqhLD6VOd+WDkkn/UtTLX7Lv0N5LFAoAAECm35/rEHuB2CM4y5w3Y7R
	04Nlk1tvr1w2q45fhY/DSF6m1mmiVuzHBhDP0AWGnf2fV3sjw0nXo9qMRUW4321hWgsHQ2P7hFtgc
	yvSDw9ZfiBM8fIytJvWjqY/h8q/JG8wP6FSE3jJECzBQzfysJ24TFWDoGLAbb1rS8ewnPvvorfxzH
	Kpjz2es+qt+pmTSi6bmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqer5-0000ie-87; Thu, 25 Jul 2019 14:36:27 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqeqy-0000hW-Vt
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 14:36:25 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: STe+EqR4tjGsKO3ciSI1tN40a7ghv45PRkZn1j6z+lYUTLJE/9mC3eaSejWH0MATMJ8hHMEjsE
 Kp+ZoiRS6QGlxTMXSnjUVRndvZtqqG2UCjTS+4HhdxviASTvEfK85e0HtVUTuOf2kWPtvf7TFI
 pJneUtzPTZ/tCgpgGSaIC0MKWyidl0fQq0JzPiYO+JW71Nm078v6KWythpCFySSxIoKcrJhcBh
 Ik0GClxTJs9Ol/uT65T/UCM8/kkCQpjXnSNaa213pmUHq7s2vZNrpZQZzT79ycFhtYZtF5K2Aw
 thQ=
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; d="scan'208";a="42759783"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 07:36:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 07:36:18 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 25 Jul 2019 07:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G32GolzXEOQJJCW8CVsH1Q6KBxUD2VqUhsoTWyY9CzNH8vxMZ0VFEe+gFc1DRYkRk8EAju+R27uCPkjKiDZxwLlDZ3KGWBTfnusGwb22azzb3t/VxO0bTE1FkxzNblo5NzgVjb93o46iCVBTmFdoP3MtYKuOOdoH+qnYMh3qVeEyaMIJJ4oSENoqYrHvmucgSkkmbhWGvCoT0I5fzIuHZFUo8dD/LQavp/tIYDj1mjnRxIFktlZMpgDbf6WQoq/Wg1IzpjssKmTHFZdOQb74/8nl6BbGf0sbRtcS6fip1+AbepGiP5tOG7b2uq1PYOJMKKJcALeSwzote5hQ+/0VeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVDg29X+TOMsPl9jT4p6XeudCzr2b9o+A7IclwhEJZs=;
 b=J5z9z3pVKE9oXJ6hufo66qU9akL3zGcW/2tc8xq2wPNiA4U3pvb4OejoMA6yWUlcwmOo2g+9w9E+Ur1202v07XFuyzWUjjk8ltFYqTCDjqUbuq1TZBtNhTpuNurh3fX4I2VT4ewFP0YgMOQ8+ATDw8eEg0x8fRt25sj+Xe7CIzkr8PW8D+1RQfbXbdBtXEHl1N0cUJkYCYzoBEFuuHQo4B0tXt2gEw2xoNgURfb0mkX6OE6EMV5/bjPFHunkX+p8WH45XLJzZTggYTMAJufAdSLT1Yq5AUWelW/0MjJ7eTVCAasL35fLMrcuQ9qxmGcpflzU2NEX9TMXyuBG/wmEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVDg29X+TOMsPl9jT4p6XeudCzr2b9o+A7IclwhEJZs=;
 b=2oHVYr0aIBHazqSOeI9fERt67F2mgfQhjDMWbbE+qDDe+kQWbhLbdlsscnyOcBnOKYIVxpxanAuZ7UzdT/NgRCzLSbnY/k7NOq8RkPu0HeDh4MCrqnr7piHx3n6/mBgmm8S6i9OeIqc9pF3BvDgU9Ca2sqDnZT9FEXTjeC5FcRY=
Received: from CH2PR11MB4438.namprd11.prod.outlook.com (10.186.149.223) by
 CH2PR11MB4406.namprd11.prod.outlook.com (10.186.148.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 14:36:15 +0000
Received: from CH2PR11MB4438.namprd11.prod.outlook.com
 ([fe80::a9cc:45df:96cb:4b81]) by CH2PR11MB4438.namprd11.prod.outlook.com
 ([fe80::a9cc:45df:96cb:4b81%4]) with mapi id 15.20.2073.017; Thu, 25 Jul 2019
 14:36:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVPtFNjfEG9DN44ESnRp+H/g0b8qbbN92AgAAWBICAAAr8AIAADB2AgAAJ/oA=
Date: Thu, 25 Jul 2019 14:36:15 +0000
Message-ID: <c914178b-cf81-4be2-044e-67d1ab8aebf7@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
 <20190725143745.634efcd6@collabora.com>
 <dbb33973-bb6f-9a01-b821-693387aff98a@microchip.com>
 <20190725160025.2d8e24f8@collabora.com>
In-Reply-To: <20190725160025.2d8e24f8@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0342.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::18) To CH2PR11MB4438.namprd11.prod.outlook.com
 (2603:10b6:610:4a::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7ce33c0-7fa0-478a-3b9b-08d7110d7281
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR11MB4406; 
x-ms-traffictypediagnostic: CH2PR11MB4406:
x-microsoft-antispam-prvs: <CH2PR11MB4406DDB09C368C44B7B6302BF0C10@CH2PR11MB4406.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(366004)(376002)(136003)(199004)(189003)(3846002)(486006)(6436002)(99286004)(478600001)(25786009)(14444005)(6512007)(305945005)(2616005)(53936002)(6486002)(6116002)(8936002)(66066001)(14454004)(316002)(11346002)(52116002)(7736002)(86362001)(446003)(256004)(26005)(31696002)(102836004)(36756003)(71190400001)(6506007)(5660300002)(76176011)(66556008)(4326008)(68736007)(71200400001)(66946007)(31686004)(66476007)(53546011)(229853002)(386003)(81156014)(54906003)(81166006)(186003)(6246003)(2906002)(8676002)(476003)(66446008)(6916009)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR11MB4406;
 H:CH2PR11MB4438.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LLrYEtsyadIEI3JqhgoB0L7hmxlnJ9We/zKINDCQGjCiE4W/W38DBABe06uVqYfmeqnOBpdgy0Z8fNDpoqEoKIPYRbHh8f9B5SjV2QmP4sxH3ZPh2GxuFvAYwFyCPCCC9NMENy7V09gAx8qH4r1qEg2eBvK8UNcHsEZC4g1vkeImExFz67Hn/plsWCO85P1aX98vuZHiBfOwt9kWvYTC+5dhAYDBoGSfUhsvanCurwgcYSiqtR6Vej3+W4trKoRGABdQms3O/rBjAkneJi/7uKkpOPkFuNZiRbotWFQl3poaqeok1qYs9oiNamKph+Br1FuoQRSf0f5RiFwwOi+VczFP/e2jtbMA1VgcNKbWDrGYHUCfGRpP7Sc3YsA9FUsRuaQvqt0vk/HZB2u2UweMT/m302ud69A2HxLGL1TgffE=
Content-ID: <4A992AA3DB7E764085110CE1E8E9F327@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ce33c0-7fa0-478a-3b9b-08d7110d7281
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 14:36:15.0824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_073621_259351_4D9F9CC8 
X-CRM114-Status: GOOD (  19.44  )
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



On 07/25/2019 05:00 PM, Boris Brezillon wrote:
> External E-Mail
> 
> 
> On Thu, 25 Jul 2019 13:17:07 +0000
> <Tudor.Ambarus@microchip.com> wrote:
> 
>> Hi, Boris,
>>
>> On 07/25/2019 03:37 PM, Boris Brezillon wrote:
>>> External E-Mail
>>>
>>>
>>> On Thu, 25 Jul 2019 11:19:06 +0000
>>> <Tudor.Ambarus@microchip.com> wrote:
>>>   
>>>>> + */
>>>>> +static int spi_nor_exec_op(struct spi_nor *nor, struct spi_mem_op *op,
>>>>> +			   u64 *addr, void *buf, size_t len)
>>>>> +{
>>>>> +	int ret;
>>>>> +	bool usebouncebuf = false;    
>>>>
>>>> I don't think we need a bounce buffer for regs. What is the maximum size that we
>>>> read/write regs, SPI_NOR_MAX_CMD_SIZE(8)?
>>>>
>>>> In spi-nor.c the maximum length that we pass to nor->read_reg()/write_reg() is
>>>> SPI_NOR_MAX_ID_LEN(6).
>>>>
>>>> I can provide a patch to always use nor->cmd_buf when reading/writing regs so
>>>> you respin the series on top of it, if you feel the same.
>>>>
>>>> With nor->cmd_buf this function will be reduced to the following:
>>>>
>>>> static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
>>>> {
>>>> 	if (!op || (op->data.nbytes && !nor->cmd_buf))
>>>> 		return -EINVAL;
>>>>
>>>> 	return spi_mem_exec_op(nor->spimem, op);
>>>> }  
>>>
>>> Well, I don't think that's a good idea. ->cmd_buf is an array in the
>>> middle of the spi_nor struct, which means it won't be aligned on a
>>> cache line and you'll have to be extra careful not to touch the spi_nor
>>> fields when calling spi_mem_exec_op(). Might work, but I wouldn't take
>>> the risk if I were you.
>>>   
>>
>> u8 cmd_buf[SPI_NOR_MAX_CMD_SIZE] ____cacheline_aligned;
>>
>> Does this help?
> 
> I guess you'll also need one on the following field to guarantee that
> cmd_buf is covering the whole cache line. TBH, I really prefer the
> option of allocating ->cmd_buf.

agreed.

> 
>>
>>> Another option would be to allocate ->cmd_buf with kmalloc() instead of
>>> having it defined as a static array.
>>>   
>>>>
>>>> spi_nor_exec_op() always received a NULL addr, let's get rid of it. We won't
>>>> need buf anymore and you can retrieve the length from op->data.nbytes. Now that
>>>> we trimmed the arguments, I think I would get rid of the
>>>> spi_nor_data/nodata_op() wrappers and use spi_nor_spimem_xfer_reg() directly.  
>>>
>>> I think I added the addr param for a good reason (probably to support
>>> Octo mode cmds that take an address parameter). This being said, I
>>> agree with you, we should just pass everything through the op parameter
>>> (including the address if we ever need to add one).
>>>
>>>   
>>>>> +
>>>>> +/**
>>>>> + * spi_nor_spimem_xfer_data() - helper function to read/write data to
>>>>> + *                              flash's memory region
>>>>> + * @nor:        pointer to 'struct spi_nor'
>>>>> + * @op:         pointer to 'struct spi_mem_op' template for transfer
>>>>> + * @proto:      protocol to be used for transfer
>>>>> + *
>>>>> + * Return: number of bytes transferred on success, -errno otherwise
>>>>> + */
>>>>> +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
>>>>> +					struct spi_mem_op *op,
>>>>> +					enum spi_nor_protocol proto)
>>>>> +{
>>>>> +	bool usebouncebuf = false;    
>>>>
>>>> declare bool at the end to avoid stack padding.  
>>>
>>> But it breaks the reverse-xmas-tree formatting :-).
>>>   
>>>>  
>>>>> +	void *rdbuf = NULL;
>>>>> +	const void *buf;    
>>>>
>>>> you can get rid of rdbuf and buf if you pass buf as argument.  
>>>
>>> Hm, passing the buffer to send data from/receive data into is already
>>> part of the spi_mem_op definition process (which is done in the caller
>>> of this func) so why bother passing an extra arg to the function.
>>> Note that you had the exact opposite argument for the
>>> spi_nor_spimem_xfer_reg() prototype you suggested above (which I
>>> agree with BTW) :P.  
>>
>> In order to avoid if clauses like "if (op->data.dir == SPI_MEM_DATA_IN)". You
>> can't use op->data.buf directly, the *out const qualifier can be discarded.
> 
> Not entirely sure why you think this is important to avoid that
> test (looks like a micro-optimization to me), but if you really want to
> have a non-const buffer, just use the one pointed by op->data.buf.in
> (buf is a union so both in and out point to the same thing). Note that
> we'd need a comment explaining why this is safe to do that, because
> bypassing constness constraints is usually a bad thing.

No need for a buf argument, I missed that the const qualifier will be discarded
when passing the pointer. We'll keep the function as it is, with the amend that
the "enum spi_nor_protocol proto" will be removed from the arguments.

Thanks for jumping in,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
