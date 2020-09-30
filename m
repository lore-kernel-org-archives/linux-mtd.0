Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842D0C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:33:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 104DE2075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RuepfMT2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Jn8+cFdx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="vYFoj2au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 104DE2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hs7aZB/h8M7S5YoT5tEST3KrFHVsL186pQIWF1SlobM=; b=RuepfMT2q8gva0eLaDAgVaXQI
	O7Etr2QwED/JPtmsKwK3StfkxBG3sBhT6JPXXHybvelkWUCnEwbNjMMwgLCapLaqM5teJ4qij8cma
	X8h5oz+NFHPCahaLZ2epiHbGuSjmijbuf3eYP5DoJRBi96/35uRg9noU4w7qvadN2FJUsEXh1gmze
	/L2NRgGqeAIWC4xICUHsCFtgSzS8ulLvdnZqYjXWRv6+n8/Z1HZOfMX5qgePTNI33N392JpUg5nJR
	DWE8vDZezu9PGDd1gr4pjNY8FsX3qUR8BTeg0o8WQPDstyY2mtbZJpGm0PlsivZp6v+tGvc+FaBhe
	d8MbnLomw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWc8-00010Q-Ua; Wed, 30 Sep 2020 07:33:25 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWbm-0000qd-AU
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601451182; x=1632987182;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kW+mA5tDuHwJrs37XUczN24DFwh4b5o6HcrlfxzocZc=;
 b=Jn8+cFdxy7/RN+Lkx3oogixH8JE+SzbOXA4fPpWxpIVMuuhJzfwqt2W4
 FFnsMBDOVD4+KWyd1GdIFDJVgo+qDok4O0CsGyWvDmKEsLEZQ2cuknzau
 p8rL+RN+7obDPTN7j48s5udaXYfvCENbfCx/bjwPmx+KP6vM2Bw30ulzR
 qWTqEFK+9CLQoZj8+NVzClmDHZFQgv2c9FmSd5iPP8mfwt5ExW9v5C1G2
 rJ9Zpctab00CF1pAGWtVxxw1BwXZ0KrbqrBZIPH+jI0FBiXUVUVBmOZg4
 aa4ekScHULxx4AJrgjN2qc5BrAPIFGNeh/g86Tu6dhCcs0DJwG8E/igEG A==;
IronPort-SDR: H2JaYZWc1L/8iTv4iKVOuXlPiQV699ElqEa8uNxyjzYFhJpCtUzGCQLYLWTtVnLbwAA0DO98qX
 b7gzbWFJLKTcbrej6orAiy+Oi+71FoOnKwxpCrpRHwxSQ+frZRAAC6P8i1VKmL+DoCp9X6xcWZ
 b1ijlvJBf0MosJ3y1ECbUZ0BjPHy9yqOHr/IB789quEPmgfLNP7sekCrG2S5vLsG8OGemJ85tW
 Jv0ojOGSTdwxZUf7tErMo9P6DwQQkHbgsNDpogTenm+QBsOjLohHH6f6TUVKW1Iwy3UzwAF6Oe
 FwM=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="93698148"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 00:33:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 00:32:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 30 Sep 2020 00:32:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNmz6z85lcK8xHmZg6yzLi0iwou+KlPNMxQVa7pFo7Hqg34LJNglpzovKudkC++tgGil/TmQNnQlP7FNro/ZRyFFKSDBYudDTEUF/QJMEcs3qsSMaGL7YXvQe3xKfN9g63btEpoZ7qHK3SreZdwbq6atRQrTlDVYjR9gv6ueCy4v7puqLprvZyl+lakzgRemQ/G0VKR+zB01uInrQkR3Gr3dsw3aKekKZKLTMUDSuSxclJgEDFv0OwHJ1zXApbubtKQYmKHa9QRo9tf05FQ5Mosq7b1Tj4rHEkkFWaKJRLd5a1NIDK8znScwQZe0YOdyY44kfkwQnOqj7AdWHR1dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW+mA5tDuHwJrs37XUczN24DFwh4b5o6HcrlfxzocZc=;
 b=LaP04VdPj8CbcBw9N+ug3DWOkz1GLtj/nH+1e1n0QElQYexNILAqiQQR/vwXs/u901c75OMvbObm0jS2DIRkwEH01ONV2Xr9La7pzTw9/WFe8kEAPLVms/qfMDMBfu46B4an0nylgCigb0xn4qQReKr3GFDzpb5WjvXnyyb9fQ0Bq1iovuPq+cI5XuPjbavrmKS2waB7dvk2zaLFWbdiiFuyzOBX424UpLjWPs+WFAoMkZ4ziPvv1wqTBUrpOG7BMfrORQL5qQ2niaM2u8tY+LF2QZMucpfRsRtoHW/A9UA6mnNcMi8gSI0znZGT0PKdvuE2G6nXx0Q7axWYVsOKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW+mA5tDuHwJrs37XUczN24DFwh4b5o6HcrlfxzocZc=;
 b=vYFoj2auch7AgcDV5TobHZn52TOV90GFumVRnYK+2X02CBhqoWhXLgAkISg06VHBIdq0RqzQbC3LvrBe54JDhXBpI1cr9uEiYlGFrhQVDv6bMk4jSeqp9KSa4RO0lSr+cO5Ss9Fvm7+BtRkpHzAgHTwTNI1FUBndQ21LVkfO5pQ=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4236.namprd11.prod.outlook.com (2603:10b6:5:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Wed, 30 Sep
 2020 07:32:58 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 07:32:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 11/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Topic: [PATCH v13 11/15] mtd: spi-nor: core: perform a Soft Reset on
 shutdown
Thread-Index: AQHWlvvqDbIicWrKq0y8e3oO7kFq9w==
Date: Wed, 30 Sep 2020 07:32:58 +0000
Message-ID: <a32450dc-8db3-597c-34b0-68632ac27184@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-12-p.yadav@ti.com>
 <20200929130838.4hfa2y3qoxissdus@ti.com>
In-Reply-To: <20200929130838.4hfa2y3qoxissdus@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 952ec13c-121b-43d0-5f8d-08d865130db9
x-ms-traffictypediagnostic: DM6PR11MB4236:
x-microsoft-antispam-prvs: <DM6PR11MB423657E658BD0974F57AE153F0330@DM6PR11MB4236.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fpB4Zt4ze0MLQZZF9pqM5vDnDnwdiStZSOLI19J1i3VjTPkIMcCAAn1XZd6C1Dm2h9cybbWnvaG4F7gQUNwzzS8QiH2hjWaXjLTw3LfK0T7uvyCaGJuJ442LQDeChIxJX6TxNsFfGhv8bxm5MWc8UuDCu42ZOtVSQhyILAvLuKa6/TEbeONVzukTdPk35NAYmnMSR500XgEFtj0RoM5yTM9p5lZgY6OnRfIArV9PJ0h6uGUYxzdzquXaQM05xQQtSbtwlrfHb9h61RJKkItSvgLxCZvPzFAony4O07hiBTypBvtosQYeQQ6vSCGpuoB+N0UT+Gr3DWrsDfPGib5g4ypkU954Tkzhjokq9/lZnm7jZMemzX8TbZV0PpIptYUlmkgPyTy5hbZtdHQYA5taL6/rHa3Y/BnfSs1N8iUp2hCMNVfzMLMnh0I5TJHEZJ8i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(376002)(396003)(346002)(8676002)(54906003)(66556008)(4326008)(66446008)(64756008)(66476007)(31696002)(53546011)(6506007)(8936002)(66946007)(71200400001)(36756003)(26005)(76116006)(478600001)(86362001)(186003)(5660300002)(6486002)(83380400001)(6512007)(91956017)(110136005)(2906002)(31686004)(2616005)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cs7Xp3NIZRq+DObVDCbHJxfgsGo3dOneC7IvA3DzOuW+ntXAJJgXxXa8zYK5JASWZGw/b3Tk0/KIytX0QIzwGQXGxS/lUQcESKm0I6zQ10+z1mf6CRm8CWISL/HGzApii7g+6/PoOWRTgsNctAdu6YxQ7ylFRoyaSoBWfNFaoPrkYPS4NTlLHdMZnPXBQK3PY0iYfAD5J1z8U3192+upH76/3GWuOcN/krQX7hG+DaXJE/jcfx5QJsOqiXdejuyQZCmuzX0TBrR03OZTejdbz6WdRKXVmU9VlZDfNU3g2cVsIpyEM2bm4OSTCNAn5vVbc7DLrPQOaqTERL49TxXNRWsiykKLNrXYmkltO/GOJkagnz5awj2/FhEH08qd50Kc60GrdaGDaZm/zYo5zCUggt6stJMQn6NT5IBDusqF5OK/AEVSyHRyo/2P005Jgm6lLumGIxy3S7bFrXxEiyfPJymce8TS0344Fc6OLV2eOIXChXajue4e/Lrb+m0QJWDCoqSfwnVnyaRKDxEHNF11X0HGADivbHIPAsPHfhgjNOu/ZJKNNOWP+2sVJ47xUQ21w/QqRkXQolhwJ8UIdCjGcSnIwmq1pN5cYcCWkq+5/LbYYOl7dFNgapYNtLwSPPIpbECW1aZm74WAvyhiqli/jA==
x-ms-exchange-transport-forked: True
Content-ID: <FB8B893A61DF5A47A026EA948B66750D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952ec13c-121b-43d0-5f8d-08d865130db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 07:32:58.0712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mp5Hf5TOFT0JBE/kb3XT81tNX6rbo3zg4EXtoHs7Eh2DBn7f+WzptpOscXtkUDUI/+gp9MhIHAi+DZDjgjeCCB38UeVit4fx97cqN6HmQpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_033302_545728_20C62CC2 
X-CRM114-Status: GOOD (  25.10  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/29/20 4:08 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 16/09/20 06:14PM, Pratyush Yadav wrote:
>> Perform a Soft Reset on shutdown on flashes that support it so that the
>> flash can be reset to its initial state and any configurations made by
>> spi-nor (given that they're only done in volatile registers) will be
>> reset. This will hand back the flash in pristine state for any further
>> operations on it.
>>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 41 +++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/spi-nor.h |  2 ++
>>  2 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 6ee93544d72f..853dfa02f0de 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -40,6 +40,9 @@
>>
>>  #define SPI_NOR_MAX_ADDR_WIDTH       4
>>
>> +#define SPI_NOR_SRST_SLEEP_MIN 200
>> +#define SPI_NOR_SRST_SLEEP_MAX 400
>> +
>>  /**
>>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>>   *                      extension type.
>> @@ -3174,6 +3177,41 @@ static int spi_nor_init(struct spi_nor *nor)
>>       return 0;
>>  }
>>
>> +static void spi_nor_soft_reset(struct spi_nor *nor)
>> +{
>> +     struct spi_mem_op op;
>> +     int ret;
>> +
>> +     op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRSTEN, 8),

can we avoid the cast?

> 
> The buswidth used here should be 1 instead of 8. It makes no difference
> in practice because the call to spi_nor_spimem_setup_op() immediately
> after will over-write it to the correct value anyway, but let's follow
> the style followed throughout the rest of the codebase. Will fix in the
> next version.

or you can just set the buswidth to 0 so that the reader rises his eyebrow
and search for where it is updated. If you like it better you'll have to change
throughout the entire code base, maybe in 4/15 where setup_op is introduced.

> 
>> +                     SPI_MEM_OP_NO_DUMMY,
>> +                     SPI_MEM_OP_NO_ADDR,
>> +                     SPI_MEM_OP_NO_DATA);
>> +     spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);

Still not a big fan of this, but we can update the op init later on. How
about some new lines around spi_nor_spimem_setup_op()? First time I read
the code I haven't seen it.

>> +     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     if (ret) {
>> +             dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>> +             return;
>> +     }
>> +
>> +     op = (struct spi_mem_op)SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SRST, 8),
> 
> Same here.
> 
>> +                     SPI_MEM_OP_NO_DUMMY,
>> +                     SPI_MEM_OP_NO_ADDR,
>> +                     SPI_MEM_OP_NO_DATA);
>> +     spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>> +     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     if (ret) {
>> +             dev_warn(nor->dev, "Software reset failed: %d\n", ret);
>> +             return;
>> +     }
>> +
>> +     /*
>> +      * Software Reset is not instant, and the delay varies from flash to
>> +      * flash. Looking at a few flashes, most range somewhere below 100
>> +      * microseconds. So, sleep for a range of 200-400 us.
>> +      */
>> +     usleep_range(SPI_NOR_SRST_SLEEP_MIN, SPI_NOR_SRST_SLEEP_MAX);
>> +}
>> +
>>  /* mtd resume handler */
>>  static void spi_nor_resume(struct mtd_info *mtd)
>>  {
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments India
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
