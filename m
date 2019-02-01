Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216F0C282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 14:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A2620870
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 14:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sPHm9ZYB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pA4DnOpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A2620870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ItQm7Pkg9aUGCgdKCaKsB06Gtme6Y8KElyS7Dm1x/8=; b=sPHm9ZYBKaXJVW
	fflkGTDFk5zxU85IDVAmGJ9m3wU8+fTSLAIDKw0CWGgOpS6TFXSkX6ZEDxfu9cJB5nDBLMcvwLftw
	MSNIXTQHshKVxCfKv8PLrkiWfdBUqp7TbHL0qTkrtL9MXjTGPJl0HVslkUMmuhFx5u9Z+5GoATB0P
	kwfQ4MrxZ2uk/XYJTcejiXxiBckU+zmK/O7W2JtWa4SR8IGL5YkCt0ShC0WhGNzXdJt4DJl3RKFLO
	WLKDK06gSInMjRe4XMVBvYpF+XnXIz0xX0TckXjS65UrvTT00aNWnTzNPIL0Yld2qfXJiIxn3TScs
	aZMJSPAim3fjh4y4BU5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpa2Z-0007S9-Qx; Fri, 01 Feb 2019 14:43:35 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpa2R-0007RL-06; Fri, 01 Feb 2019 14:43:29 +0000
X-IronPort-AV: E=Sophos;i="5.56,549,1539673200"; d="scan'208";a="26032028"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 01 Feb 2019 07:43:22 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 1 Feb 2019 07:43:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXjBO4r1Ndv1n4EYS1f7eGRa4lF+0zWT9KgdPUIAsyI=;
 b=pA4DnOpZMe4kReF5hsZ1GRxlWR9R+A34SmS1lSjY105EUzEkjkWc9PumkGjuJIPw57ZnHagnQyKlpBWFIYUFiGdtXPqWj0muG2bj2Muyv2uEozTNcT/4sVX5lrt0un0jxaRhsJT2racVwhcTNOdFSnWJN7f1kIqxA+nUscGcueI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1841.namprd11.prod.outlook.com (10.175.99.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Fri, 1 Feb 2019 14:43:18 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.017; Fri, 1 Feb 2019
 14:43:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 10/10] spi: atmel-quadspi: add support for sam9x60 qspi
 controller
Thread-Topic: [PATCH v2 10/10] spi: atmel-quadspi: add support for sam9x60
 qspi controller
Thread-Index: AQHUuYA85AgiqORGIUCz49OB4RqXzKXJkgKAgAD0mICAAH9LgA==
Date: Fri, 1 Feb 2019 14:43:18 +0000
Message-ID: <af691fb9-e972-5590-77f7-754bc1018b05@microchip.com>
References: <20190131161515.21605-1-tudor.ambarus@microchip.com>
 <20190131161515.21605-11-tudor.ambarus@microchip.com>
 <20190131173207.56481a42@bbrezillon>
 <947f148d-3fd8-4e7d-4301-9d67715fbf7d@microchip.com>
In-Reply-To: <947f148d-3fd8-4e7d-4301-9d67715fbf7d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0052.eurprd03.prod.outlook.com
 (2603:10a6:803:50::23) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1841;
 6:xVEO7lrbliwBLnDQ2K45x84/MPEa2g6kg3HqaYQRDKqIWxUXOf2fMssg8RTf93Zywf9MmXgWUG54QAxrB4mr3fUn9gsLEvQ0riux8Q7bnd+5Ss+1WPRiicQ1l1ydPR4G1iZRAnU+Q+lxs2O2xuhWdrAX7tCvyEK0zYkKcHGnrSr+hc9JcdzlwliRaqFRzu4jS0HXcfiKDdKeNGhD8kvTUWVhfwOaRZtGk0m6koWJ9wPriXnOHbRsOB8a+lhpoEyq2ESUct7uCsTW7dpmxByac+E2BAVom8A5yShNhCBZWRv/tj7jBaQ7F3ZwHCoCXR4sTmfOkJmyqk8RrJatUsaBLETG5rsU2f/f+I57HsE1P86Y+9fAChokQr0hu6UQI2vmmF8gZWbdK1hS4CajZxX3DWwTxEmN6zF80JTjCl4lqnbaV6/oRE47VrN2TPJsGmqWmzg2nMcvyvM8Cxgz43YIFA==;
 5:BUf9DC5QVicmX6Aa1ULAyqCapzJ/TndfDxUs2+oPDHzwgfMaxvBGbh9Bm+jNfTWpRWl5r1LBtHjhl4huihqqlSq3n4AxhIuNRkr64oZu5Gz+G5lLzM4Bw2nE6QCN1xcEewaTIM7d9yCDjmXMa/vLzuSsRkaw6jMe2xIEqRAV7ucanhfppEGUAGJ3A2QVoQFPhFqIvcmGaSPxLerC54F4Ew==;
 7:5BZDVsxYROJnVAWJObuXLTdWqxGW8hSBVGes5Z1huv+MDwn75sx+8DmIxTTe9mKbuBxI4IQiOnD8GgYrZ/P1ue9D6GzS5bnlG+2ahhQ8r8keHcP4wij4+2Jjrb4uF8bSwDnHUg05WzwSLh7ek11Gwg==
x-ms-office365-filtering-correlation-id: 19a49ad3-bcd8-49de-ef9a-08d688539ace
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1841; 
x-ms-traffictypediagnostic: BN6PR11MB1841:
x-microsoft-antispam-prvs: <BN6PR11MB1841634D6C67632F42F5CE52F0920@BN6PR11MB1841.namprd11.prod.outlook.com>
x-forefront-prvs: 09352FD734
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(396003)(366004)(199004)(189003)(2501003)(386003)(7416002)(68736007)(76176011)(102836004)(6116002)(3846002)(6916009)(11346002)(31696002)(6246003)(476003)(7736002)(6506007)(53546011)(446003)(316002)(53936002)(2616005)(486006)(26005)(86362001)(305945005)(186003)(256004)(36756003)(54906003)(99286004)(93886005)(14454004)(2906002)(4326008)(6436002)(71200400001)(71190400001)(8676002)(25786009)(478600001)(1730700003)(5640700003)(8936002)(72206003)(229853002)(52116002)(106356001)(2351001)(6486002)(31686004)(105586002)(97736004)(81156014)(66066001)(81166006)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1841;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u36L+Y9IVERvihAAV+qxZ11DAh4uopZO91ctDonmfo0aKlv8u7AHDI6NEbMZ5lcMJQv7wS+FWgISGkcZZhNUBaoQgs2P2smvcC2mvMwWBmjKqayaJ0i/lmWHQA+83JYd5AiEAgWkzIbTr847ruBJBZF48D62gCXONgnPDscMxR926DGjwVV4dl86w/jjKF77UBmcGNNXyosy+gbCiCvE0NxYIt8yDadoGIdYlJy50MGJBrRMSMvLR661dJYX/dQuYRn1Q9NYE4/n29uwYEGtDiK1Vo+3GZpppSBgl2s57M0gG8C4FUbpk/I2XwVVmnOj1kqLqklPBKtQm0eHj4UcCXe6GJXXpSdDBF6saQzcrKmL8kz6iOwblDUiqr0Q6e+g0JKIbaWIwnE6luYK4kdoRcJ2sC1s+TbXvZcaxOpy/OI=
Content-ID: <B1A32B394A61DF4C8AD769D0FF5E83AD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a49ad3-bcd8-49de-ef9a-08d688539ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2019 14:43:16.1904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1841
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_064327_082741_4556D1C9 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/01/2019 09:07 AM, Tudor.Ambarus@microchip.com wrote:

cut

>>> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c

cut

>>> +static int atmel_sam9x60_qspi_set_cfg(void __iomem *base,
>>> +				      const struct spi_mem_op *op,
>>> +				      struct atmel_qspi_cfg *cfg)
>>> +{
>>> +	int ret = atmel_qspi_set_mode(cfg, op);
>>> +
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = atmel_qspi_set_address_mode(cfg, op);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	cfg->ifr |= QSPI_IFR_INSTEN;
>>> +	cfg->icr |= QSPI_ICR_INST(op->cmd.opcode);
>>> +
>>> +	/* Set data enable */
>>> +	if (op->data.nbytes)
>>> +		cfg->ifr |= QSPI_IFR_DATAEN;
>>> +
>>> +	if (!op->addr.nbytes) {
>>> +		cfg->ifr |= QSPI_IFR_TFRTYP_TRSFR_REG;
>>> +		if (op->data.dir == SPI_MEM_DATA_OUT)
>>> +			cfg->ifr |= QSPI_IFR_APBTFRTYP_WRITE;
>>> +		else
>>> +			cfg->ifr |= QSPI_IFR_APBTFRTYP_READ;
>>> +	} else {
>>> +		cfg->ifr |= QSPI_IFR_TFRTYP_TRSFR_MEM;
>>
>> Can you try doing only regular transfers and let me know if it still
>> works. Support for mem transfers can then be added along with dirmap
>> support.
> 
> should work. Will try and let you know.

you were right, it works. I will let mem transfer logic for dirmap support.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
