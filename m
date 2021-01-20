Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1268DC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:03:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A703023357
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 13:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A703023357
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=11znLK2vKNb7vIf1HcIc6DRxPA/LhnZVzoNEd38+ajA=; b=sYi/q0xtpvJejf8P3Ym6rEhln
	DGQyjBTy876fiV2S9fS7Tq2ADW90gYOEMnkIhaNT7scDY4zV1Jrr8wYa3VQhXdgJaOKkri6+gnxl6
	s3V+kTqX+xAqiXw4wsmc1iMM3xGjpViJPWJoMmr0+HwiNBuBZpN3UGotC5lnyz30TUpTcBt93CHkJ
	QrNCiBi1bAq7BJIEqSMfOw9rdYyGjozQtGXywKon8qK5R59Q3+JGMbHQjv+VeEWDMWPSvlf9nsljZ
	7xKzt/tZWZ5kO7GOI/oIFV9ByJUDf00fOJvg8uVuEL2WnJ9UpnppEv+9iUP9juvhernWdU1+x8pDD
	qjRD2aL6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2D75-0004kL-PN; Wed, 20 Jan 2021 13:01:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2D6u-0004h1-9D
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 13:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611147680; x=1642683680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ko7QCuwmq9bNdGreJfT++lxR6TP9DRj7cL/m9AN3qQ4=;
 b=S9KjIDFKjaqocOyU1NA2zyymZScWE7J1PnnSYvjy33ybZ5Wr5+7pbiV0
 YErzaRDnENHILv3T6R1gc1+4zLOfAJr/0k4+fCsi9KD6BlXXmeTKyd87i
 tI/CrxXmdPp2H+DVFOcHIip7UffZCVAYvh1dFIGfkPeAFozfIEIlcAGGy
 vK5ErS6wdew0c8W+dPjEDZ+pcaUYprfKXF6jAqVICvTsq7ekJFtKQfFli
 90dzzotgO2gk8quemICs7uwzVgaThv+DYdMEO1Jg14fntQvzZvHGyHd8E
 3zsfIK+vJe3b4oSnSnKAl1gV5aQI9XfFuE1REYe+DFStP0Ubn7R8yKmW0 Q==;
IronPort-SDR: GfRStNoqip+WWDGv0tepRfhfp/5z7s0dYFWX/064Mp0S+SIAjfm8rTrfrBZUK0rPucqNNFciMh
 8tqsRk80KWkTROzMyJM0WUgT/pOmkWePo45/VvWDntyJZv+7QmxETTM9vZJBrv8gNOwpRqSbZR
 AhS1Qpkakuu+XbZvle785BpetOoDjboZtTxcDdEIsJ7MmkRNzyIN7JSUypHvlDeS549AWQ0eZW
 32FO5paPVKKwni+NTJvO6CTmQArz63lAaPu/TtGDVRjCiQSM+WjF8Eek1dkmHpwQ2u+Ylf6P2y
 9Mk=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="41084717"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 06:01:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 06:01:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 20 Jan 2021 06:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xbv+tAo/gXXl5kecF5NTAzu741BatR6d7fc3eKo4Ear+zjXjwvt4IKXB+mQRccxr//9aZzWNwlyCZNuDY6DsHOziUW1yj9gNeAZpVDFqOX9/fCaCj/EP1YBLa5vHu5xiwh2e7Xw8Ql65Ylyvb8vWAe7yAqa/CArYawhigIpYU4irQP+YbHlGX7EdyE+murlNjlK433tD0RAL6Kt7vICmoLTbX+kOGiIkkvfds2tgsZ8P2LHVrerHaKUvFu+6erfCi+Sbu0VU3DfSCDbJE+HkYhOkw7zTtBwQHnlxnQUoX8owAxaFJW+NiUoQG305pazqCvJgebgMBDdDtHDFD4ZArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko7QCuwmq9bNdGreJfT++lxR6TP9DRj7cL/m9AN3qQ4=;
 b=WpSpfBDj2vupp6YoGj4PMW2rrYLifTWR5FhtxCl2M3a1pHXah2Hbj3y3zwpPG/tfl+knriwYSrxaS0nWPMEs+LiZbcagCdULsL2M5rSlcEk2j7S+s1GbVljDDLO8Il9J8GI1kaMXfr/AfZj020Ya6nYdqFkboCaGZjibISUiPp8MlX0WimpJyFhIDMZd4WC++GTwlyDhDqCwDfO9xNuxmHltxm+PLsQwN4XGCOjvheb2cULVByxeDcoisM3O9AKQUC9oMlCYxY4ba/QTfuIGm6lRTeEk9zO8ucnIlyv/MIjTIcha9wQjYJV7g0HyMyTg6eiQAoAejN8IBGFyWB61Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko7QCuwmq9bNdGreJfT++lxR6TP9DRj7cL/m9AN3qQ4=;
 b=RxKXYxDMPZ3xXQ4wTMwaJwluD4h+UqBJPkRZ6+CoyabwgQNqO5LDom2S++v6gFCWnT2IO+PB8EenxbPc+wizvaxvsDg48PISsmoZRAfZXSe7cDlb5yFlhc+mQRYHTQVPBqpCOF8K5rUQCpI3Ix0NYDAbHahT+HowAKxJ1UL34UA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3022.namprd11.prod.outlook.com (2603:10b6:805:d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 13:01:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 13:01:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add Global Block Unlock command
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add Global Block Unlock command
Thread-Index: AQHW7yxU3WhLNs6mLUyHYoFQKCUecQ==
Date: Wed, 20 Jan 2021 13:01:13 +0000
Message-ID: <f7577368-9466-b9f8-6f18-5be6fb9c3859@microchip.com>
References: <20210120105411.254890-1-tudor.ambarus@microchip.com>
 <20210120122431.csvnwlb4ihqbuvoq@ti.com>
In-Reply-To: <20210120122431.csvnwlb4ihqbuvoq@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6d72a93-ebb1-42a9-d9c0-08d8bd437735
x-ms-traffictypediagnostic: SN6PR11MB3022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB302261AF2BAF84D9753D8129F0A20@SN6PR11MB3022.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s1+mTMSVlfj9+g9jFBviBRPvxViUkO0R0Sj3J9VMGeq0AXADXqxvJWpKHSXCJGy3rBJ1vCD6lSAr0TW4VdGkP0BN0TZ00jO+r5fHghjMS2Ay3+S2+Vs0ElQtpv2gbKECdI3TR0iKFXSRxlnPh66QDw44RsvpWNARruaq6wXemQaclgqI4+D6A9CcizxGN3pGvnWWC/6yUf7o/R+WxxENx2Pbxz26DeDKKWB89Mgaw+vjRMpZKhJbz9HTiZgAJ9I5Qkdu4t0DS8VEyWZ46bkKwl/6xtv3RUlaZMGzYPcbviYMBDxCoh7iWhftg81H3ORLnJjKlpnxsoCKQXvpWAgsRtoIOzJJ1pPW0PVrrYNd9+PoeoWEw7cN1jKhq7CAAD3G9WePaS1286uodYgOYbWB0BfNIp3EPeoH8gFGI5Ll0tmnrIgnrTAqibAkZ8gUwcPC7vrUlM7YMvf1ofK66jA62YNe01ErfrLMAs8ETPz034g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(376002)(136003)(396003)(26005)(2906002)(71200400001)(91956017)(86362001)(8936002)(53546011)(76116006)(316002)(66556008)(66946007)(64756008)(66476007)(54906003)(6506007)(36756003)(6512007)(31696002)(186003)(31686004)(6486002)(83380400001)(66446008)(8676002)(5660300002)(4326008)(478600001)(2616005)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFhKN3hGZ1ZNdGUyZjRpUW9GNXZqcjFYUU5BU1A0Zy82YjhocWxHNFM0VGpm?=
 =?utf-8?B?REgwY0pmaFBVdmhuVnpYay90R01IbTh2MFdTNS8vOHpIaHM3Nmp5aDlCV1Nx?=
 =?utf-8?B?czR1bFpRRnJnYlI5Q0YrNHZld2ZrRU9QM0taemJFMldWSWNMMkdPb2wrRmN1?=
 =?utf-8?B?YTYvaUN1NGxNYmZISFRZamg4RGlYYlpnUXlGbTd2bkhjZWRraWU2UlBvOEFp?=
 =?utf-8?B?Tm5RaTh4YXJqSkdJdm0ycWNnajFkVVZLQmVUNWtLZUsrNFM5L2l2T2xSV09X?=
 =?utf-8?B?S1JqUlFvY3lZK3Z2RFprWlo5b0R4UHV2M2xMd0pXL2VxOUx0N0hLVDd4Yk9D?=
 =?utf-8?B?V0JHUFNvS3loM28zRm1rV25pK0FzZCtKMHV5QnlWMnVnVFZsTVo2L0VKNFJZ?=
 =?utf-8?B?NmpaZk8xamZKMGhjaTB6bHI0WUI2d0NBeU1jSjkrb2VmdWdQUllxcVpIRVN5?=
 =?utf-8?B?M1RLdVYzWjU2R1BJaVczY0pPT0pFeEZsMnFMc05MNDBuY3dIbnpyamFaZklN?=
 =?utf-8?B?VWRCRjIvZ2ZCYVpzeTBMaDZvVmpRdGVFSk1BNDl4ck54Nk9QMzFpbzQzWEM5?=
 =?utf-8?B?WjZlWlJGVU9WRCtMUGR0SHRuQXo1bVpkSlVCdk93K3F5TVZDTG1lL1hmMG9v?=
 =?utf-8?B?UXc5QkFLd2ZPRWFUeCtIMG1FcXh3c01tWjkxSjkxTGthNzNSQnVsMVB4aXR1?=
 =?utf-8?B?RG1TVStSMk00UFBWYjQ5VDZ1UjBpYkRSaE5NTlJvUkJ2V0toNTFTWWNvN3pp?=
 =?utf-8?B?TGhscnJRYUQvWUxURjVzSnBWM0VMRjV3NHZnWXp1UjVNYjVaby9Za1VkVE9i?=
 =?utf-8?B?Vm5VdWlYYXc2RFlyMy9VVTBGbzdRR2dMU0taRXhkQ2JxeDFDVlhleDM0OG5l?=
 =?utf-8?B?clZjS2EwYjJ5MTgzczdtcGFicUl6MEhpdjJtU1c4d2RKTnZqK2M0SWNXWk0y?=
 =?utf-8?B?WG5NQ0NoNVQvWHpHcTU0RnhZSXBCQ25XdUR1ZS9seDR1NmxZWU1BMm9aVHpa?=
 =?utf-8?B?WTIwWVNuQ251cFpIc3o5b1pNMFBLVWkrdWE3S0cvbloyem5LOTVxMFlxR1VO?=
 =?utf-8?B?VlY3eTAyd2phVzFOdHZmakVUdGJzY20xQXRpUDFJSFQvdVoxYkxnMmE0aE5M?=
 =?utf-8?B?OEZzaE9udUp0Zm5HTEd4L3FrSlNWY1pDMGQySm5Fa2JHY1BnUnY1YXpYNGZI?=
 =?utf-8?B?eVBtd2pyWFNid2orMXhtYnVJNmhuSTFwOElhNXZPZDZLdDJ6QUxseXhBQU9y?=
 =?utf-8?B?b3VLU1lZV3lleFlzQW5ieU5XclJUN3dRVS96Mm5KeGhVM0dST1BvTmd0dER3?=
 =?utf-8?B?cnhEenhURU0vOXp0cjdGcVVMY0JwS3ZQZkhUTENrcFZhTkM4eStSN25sVVlm?=
 =?utf-8?Q?AJQTSoVf8vX+sqwTmOROiTL+s3OYQURA=3D?=
Content-ID: <FEAEC17F428E534CB88DE8DA30154724@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d72a93-ebb1-42a9-d9c0-08d8bd437735
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 13:01:13.2684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXJ12syHxiFXWH6IvzivUOKW1d9uDqyeQriNs2YyVmu2gf3I8x2zl6eBBrDx85xf0lL5Wlo16FmWUX1P1cR8brkJ11lVtbBHS2ZCL2nnUqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_080120_621236_736425E5 
X-CRM114-Status: GOOD (  24.16  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 Kavyasree.Kotagiri@microchip.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/20/21 2:29 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi, Pratyush,

Thanks for reviewing this.

> 
> On 20/01/21 12:54PM, Tudor Ambarus wrote:
>> The Global Block Unlock command has different names depending
>> on the manufacturer, but always the same command value: 0x98.
>> Macronix's MX25U12835F names it Gang Block Unlock, Winbound's
>> W25Q128FV names it Global Block Unlock and Microchip's
>> SST26VF064B names it Global Block Protection Unlock.
>>
>> Used in the Individual Block Protection mode, which is mutual
> 
> Nitpick: s/mutual/mutually/
> 
>> exclusive with the Block Protection mode (BP0-3).
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 35 +++++++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/core.h  |  1 +
>>  include/linux/mtd/spi-nor.h |  1 +
>>  3 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 20df44b753da..cb275608cb7f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -853,6 +853,41 @@ int spi_nor_wait_till_ready(struct spi_nor *nor)
>>                                                   DEFAULT_READY_WAIT_JIFFIES);
>>  }
>>
>> +/**
>> + * spi_nor_global_block_unlock() - Unlock Global Block Protection.
>> + * @nor:     pointer to 'struct spi_nor'.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +int spi_nor_global_block_unlock(struct spi_nor *nor)
>> +{
>> +     int ret;
>> +
>> +     ret = spi_nor_write_enable(nor);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (nor->spimem) {
>> +             struct spi_mem_op op =
>> +                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_GBULK, 1),
> 
> Set the buswidth to 0...
> 
>> +                                SPI_MEM_OP_NO_ADDR,
>> +                                SPI_MEM_OP_NO_DUMMY,
>> +                                SPI_MEM_OP_NO_DATA);
> 
> ... and run the op through spi_nor_spimem_setup_op().

Right, I thought that SPINOR_OP_GBULK is available just in single SPI
mode, but I see it can be issued in QPI mode as well. Will change.

Cheers,
ta
> 
> With this fixed,
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
>> +
>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>> +     } else {
>> +             ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_GBULK,
>> +                                                    NULL, 0);
>> +     }
>> +
>> +     if (ret) {
>> +             dev_dbg(nor->dev, "error %d on Global Block Unlock\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return spi_nor_wait_till_ready(nor);
>> +}
>> +
>>  /**
>>   * spi_nor_write_sr() - Write the Status Register.
>>   * @nor:     pointer to 'struct spi_nor'.
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index d631ee299de3..eb26796db026 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -434,6 +434,7 @@ int spi_nor_write_disable(struct spi_nor *nor);
>>  int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
>>  int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
>>  int spi_nor_wait_till_ready(struct spi_nor *nor);
>> +int spi_nor_global_block_unlock(struct spi_nor *nor);
>>  int spi_nor_lock_and_prep(struct spi_nor *nor);
>>  void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index d13958de6d8a..a0d572855444 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -53,6 +53,7 @@
>>  #define SPINOR_OP_WREAR              0xc5    /* Write Extended Address Register */
>>  #define SPINOR_OP_SRSTEN     0x66    /* Software Reset Enable */
>>  #define SPINOR_OP_SRST               0x99    /* Software Reset */
>> +#define SPINOR_OP_GBULK              0x98    /* Global Block Unlock */
>>
>>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>>  #define SPINOR_OP_READ_4B    0x13    /* Read data bytes (low frequency) */
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments India
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
