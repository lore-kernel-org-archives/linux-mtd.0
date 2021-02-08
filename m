Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD078C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:59:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE0964E6E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 11:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE0964E6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QKlq/IphvTb0CBQsMG2+52QysghtYDApV7rFpsMIyMw=; b=zIjoWZT20Y1rNxuoHOJDFidrC
	BwuNPREHDFX1ek4wxy39DTMHtIDJGHRjz0tNQYvV/VK4bp3PkgsCGqrhLSs7xI6q13dJkGCnmPud6
	/n5aB0iJZVB/36D7u+WJcJJ3vnD/UoKrma3SOr4L4YHxf3lTKm6AIa27APelwaZhdg5GwuL/g/C73
	3zzTslPbu1UzddWp6+JSVh3pzPuUhV+atG5TgnFdQOEse79CovmIkAg1zi+S/cHhbyV4ZxTNf6e97
	2fNx98RYFOavm2LOxRP5Olzp8TjfTL2OjOnQ+afWBoPoHCa2zKBAhDsmLwq4RGwaE5gAEcrnE5mK7
	nP6tD7PwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95CT-0004gD-Lg; Mon, 08 Feb 2021 11:59:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95CQ-0004fQ-B6
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 11:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612785566; x=1644321566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aDrpuNgcXzO1r7l59ezzLmvCA9AdVsvjpVuHXu7qd7U=;
 b=Qgy4qjouK0Lgz/3H9/JOiTkcfrzQuiSdm7n9HJMiOoDx7prgk8R8+8GA
 nvbRMHF3c8sOgwpHRLRFlVJJh3jd2zuABx/VTurUhqvOqC+YZ3UdetV8q
 d1NQjzEBkUEMgQxM3k01Mv10Y83nM7tOB2tkS2kwqQ9fFlkJtK/VxGcJd
 x6LSCZQqVoszjgrhaSHZMONNI55L9aB7+0fNI3kxwnWVf21vYuRlOZ2fc
 4ydzhR1sl3RZn7+07LfKdwoDEV0GGzLNQh4XEEwLjaR2Mzawu1SYZdYe0
 ZPiyTbPQl8Q23P/Nv2e2WKO7mXkugEL0Y2YKCTupJYQ3kE4YlHjIzUgz+ Q==;
IronPort-SDR: 9z7mFZWFaE1itRc0jtfTA2cXt4JbTM41fSQkOP7MTFsoeQw8eAbyD9NuLtJY0uDPbRDSlDYZAD
 NJNgdlN/0CVBwwXHt8zRddDeiPZn83hmKtxRS4ieKQjR0XURkc1MlfgKv1/B2IZ9Zi+8azuzU1
 yTEcYixuEQhl4jQ1F8n1BfBF/uvT7RAKSkrDDc9oGuuprT5o7yUvPtBAQVZPNrcP4yJZZR4CQW
 72nc1KdsEI2LVePCmj7qAhIdVuEpG6WSXz5A9CX6heB15K4js0Ql1a2YriMeWju+kf4mhq70q3
 rx8=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; d="scan'208";a="43329319"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Feb 2021 04:59:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Feb 2021 04:59:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 8 Feb 2021 04:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpWme+dhMYgsp8Fgi3D/yQxydRKb+/5WISkZC+gBOq5q4oqmo9GR5IfHOiN3EUVRom60VqcfrgWNdumSrKXdREYnvhiuWdZgzIO9HtcSP1aMFsp7Vil8vvogfLY1DJGexvwyr0hdTOV88nMixsPbmEjkJFtmFuDWx34agztoM/yyz71YEe5DpcBsX5iVy2JJtqpbYL95Lha+RJIVj2G7F/LTP8uNgCI7rTqu8aVPQ92Ry1W+3pYhFVIiCxy7hO0tjBVBI7cQCV/3GQICq2Of+CwKQtsxhYTPqfAGsze9AbHH6rP1z22EAyO09hLav70bsDxwkN0nP7Q8hpqhhbxqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDrpuNgcXzO1r7l59ezzLmvCA9AdVsvjpVuHXu7qd7U=;
 b=EM/25LQyfMgDCDaNWdEsm6wm/A9R+aMCaoU4kk3qx28WGgoM2AIr3Ya9SixKKmev3eLv/M8ZoElb3pC7LY/aGZEDLJuC4TIVEliTv8ZPJOZTfmsYBcJRioT/nlQfcP8GBaKhPbtDduE7/KhFwQpPDmjRhgUIu+J/7v5Yn+D720wcdQnn3DirxdKumj9QGOchE6wMjHfCquL/JespppOYPLyXQF7kPufsQp5PBTZpYHmZ+LORV7+QJjzE3G/8XExmRDvdBQb3Pfb0VHiIfNRmeeZu2pEv9FN9cjDTInSyX3QBf0KwegSvKMnuhDM1W60ToBaMZmZeL1Pt7w1Vmzo/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDrpuNgcXzO1r7l59ezzLmvCA9AdVsvjpVuHXu7qd7U=;
 b=i18ikWv79hahJsZ6SOvRj2LTkVP8vmduSlGatQTFX0oDzYYqC36ima67O0XlwJP3n8MOHIHL7WugMYReModqHcrQMmCyPyuBFOzX9/ZXK9FCTWJASu3V6fKIDjkeNPzebUH2JtR+D20+N1J/fGD3it9W25Re/F7QCXTfZfotAGQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 11:59:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 11:59:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: core: Add dbg msg for
 spi_nor_erase_multi_sectors()
Thread-Topic: [PATCH 2/2] mtd: spi-nor: core: Add dbg msg for
 spi_nor_erase_multi_sectors()
Thread-Index: AQHW/hHVEpKn2JTJa0aWCwOGb8xJSw==
Date: Mon, 8 Feb 2021 11:59:22 +0000
Message-ID: <b6865143-f52a-c63b-dbe6-bc6de480c74e@microchip.com>
References: <20210205135253.675793-1-tudor.ambarus@microchip.com>
 <20210205135253.675793-2-tudor.ambarus@microchip.com>
 <20210208114125.5bmdvywjcruvhu7a@ti.com>
In-Reply-To: <20210208114125.5bmdvywjcruvhu7a@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e17f2ef9-9e1f-4a6f-ae01-08d8cc28f919
x-ms-traffictypediagnostic: SN6PR11MB2622:
x-microsoft-antispam-prvs: <SN6PR11MB2622CF75D10EBEA802C58C3EF08F9@SN6PR11MB2622.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vrfRq9A9sKQvvTPxCXFcMalWk4tTmbUnChfhynot8X0lfaZRNwYfdzmHCjncLMD/nctby3Z/aj9e4AEzxknh+iii4x0e8rZVORt9dKGnl9gIvFRtbXxEQNEkCWZKNxi65GuhnoRQkirAuQvXQslavzOUjrS1N3CxFjDQQQXuPhahuJpbFT7mglZhJtIocfgjTwkAuxjUe38jfse+NdIJd9L9lOKCwt4zYBcVCw4jC2cnBh51Nouhs/1wxRS10tmMMWS5C4q/8CQdzWMvKfi/8Ut+3r+W35urkn1/Oby+l4F0VMgPRi778XWGZr81fW9ZE7rv0R5Qaho3TcSTQoMx7/VSYK4lck51waIar8gJZvBc7NIefCtS3mVImmHECaLNnvxRYaIhxMDLB8ridNMPo4eapp3LlCqdq678rCaLbLfNA7m7KpMcoGLrekBecX8WSJk55J4MrlOvN2zuwlcPSfDVKCAym3bLd57S2utlR0CcdJq0Cr6wwchwCPHwe2xb3NZL8I/mfXWLHP96GGwAIdowId+CCGoOHcRtvLGTKX+r8fndgjIsBwklcnN+/qLF6jraQ3IZRrjcPGsEQT7FIswtyklCOt5qXEiv1yZcmxU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(366004)(136003)(64756008)(66446008)(316002)(36756003)(2616005)(8676002)(66946007)(83380400001)(86362001)(91956017)(6512007)(6486002)(66556008)(66476007)(2906002)(6916009)(76116006)(478600001)(4326008)(5660300002)(6506007)(53546011)(31696002)(8936002)(71200400001)(54906003)(26005)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZUmFCMYtdMlYsB33Wmwwb4WlkipqXaOo9qfALVVgpoBzZzHShBU4S7IOF1dWmi1RTbVjEO4NvdA2U2Fvdt3Jc6F4go7TJJhySzFMIuFZQo+jtAZSk1qijFinPTrrFxO3ycYXBNC4uoBaHdeVKtDLNe4HtZWWqU0qE39E1P3Eg62Qmtgj+aE0HMnDyvx/taXHUdddxFTeJAztYjlvnXErJ8IHLVixyWA9rrEDubJ4KvkBMHYYXtn6zPGoUWAWwvb3Twg2CsQTfE70EsBLNWfWt+8J/REVk4ObsTniS8Dnw7VGPjWRbqwSahwhFvRUH6vUE+H7ddbzUI/+gMKDim1jDVL/fWAJK4HNu483qxu2Fe3QK1G0KtYU1QW96NeGlobOR44hHbqBfmjpTyLNoNbP1Nf76qxpF0TufyHcjvjHWBAiuph91lsWXV/GEBvbFcgCpcBj9IuB8FcdvXelgJOF5bGe7t44Cofzk2ZL7yB+rwyEYah828nKgif0WjGg9k/BkqjnynuvRAuyWYZ2KfALcUpKWFj+IVDwngfSeuNRb4+2c4UHrru/aJ0m9oKh8iLVA+cupdFYldjlmEY7I1H919LGUdOT3ttQeHR5bgSA/KdiNEK+hIGq7wwT/djSb1T72BufamU4oxkeEnC7bX6aNv0HnjiaMwjY2MKit7lUfD1cgRLJp5OorAdaWR6j/YTswuc+5EJfimzjk+kcMVR8Vdyo1zzArHADkdckDkcgBgs=
x-ms-exchange-transport-forked: True
Content-ID: <295DA42BE74BDA45A0B84CADB53BA301@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e17f2ef9-9e1f-4a6f-ae01-08d8cc28f919
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 11:59:22.2206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZ9DUsbpBqy7uVCmE3kjO+WIINgJ4NBoV+4RGoKa3E1XktzsDjJKGNa8eOHaGN7oa6u3sfiQxob7+pf82aCLz2q1kmXRgx2FxzC2fwarnSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_065926_718228_DEA8254B 
X-CRM114-Status: GOOD (  17.75  )
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
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Takahiro.Kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/8/21 1:41 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 05/02/21 03:52PM, Tudor Ambarus wrote:
>> Useful when debugging non-uniform erase.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index bcaa161bc7db..7401c60b53e6 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1622,6 +1622,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>>                       if (ret)
>>                               goto destroy_erase_cmd_list;
>>
>> +                     dev_dbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %d\n",
>> +                             cmd->size, cmd->opcode, cmd->count);
>> +
> 
> I don't like the position of this debug message. This prints cmd->count
> _after_ the erase is done but _before_ cmd->count is updated. It might

oh, yes.

> end up giving some wrong or misleading information. Can you either move
> it before the start of the erase or after all the bookkeeping is done?

Before the start of the erase sounds good, but still inside the while,
so that we catch each executed command. And maybe I'll change dev_dbg
to dev_vdbg. I'll made my mind before v2.

Cheers,
ta
> 
>>                       addr += cmd->size;
>>                       cmd->count--;
>>               }
>> --
>> 2.25.1
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
