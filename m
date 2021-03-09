Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21431C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:55:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3CB652A4
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C3CB652A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fWkW7vE/zk7mrMWvzeqyVM5FOJERk3nJ0Y9tz5R0nKY=; b=mgSj4/h8Jv+Vnl/cFoJJu69D3
	vmcoIca00iPS9oNBuDNzdb3NyeBQJgzJ8jAnqGRWUDYZt+CvBEPIaP5S2NRZgJBV0iwPiM77Q91bG
	Gft/6O9Bl5AOAn2FUsRtmxXtJC9ei6EIbcFT/65hZFuwUperXC33mn2e+Eq4XxDtA1ml+buNXfapP
	s/RjqnxypQZDdHBAlYu7KNApjMbOjR+fGNMO/Xmjs4DsJdSqwE2SIXEVTYCfV24aZI6RGiNQtO0rI
	KNZJhOh1al8xgayes3CAe4Pp41JerHvAxBLzU5yFlui83RGEJCG2BWBwEeMBKKN/QgzU1eNdBqOp9
	DtP5cOYYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJXCK-003zAY-9Q; Tue, 09 Mar 2021 07:54:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJXCF-003z9w-9r
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 07:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615276467; x=1646812467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=V3XEY9h09diZJB0G3PMMr8GAmqIV9wXGjSH+8HRPWBI=;
 b=RcpB6h0w8Pju8z+rPRNHxU69oNCiW66ACUegfUw9/s9usUsdvzLXrNrO
 CSvv3UgoFO6tHGO49fsT/sejJ05fMgC95PN5Le6xbWep1x75H7TGT7S9j
 70QxDS9muPLXuJnm2hVBVafXKFLh9nevjn2NJEPM5zZkot4RZ5xYAGtyG
 uPSNDiEZK/exvwBHNQlg1zggW74BPm3bgeBbyPyYjEGd+NuH4IkAIx/0h
 nLpK80LPdNqxpM6OV4jLmYAuO4+V9bJGj87JWSIITZxl9J3sidNkHeCX8
 uRN9qNngQ08DxEtUjUC6MTuE09aj+xgLjxQIsNM4ea+74nRjB6WZKtCUs w==;
IronPort-SDR: AFoohqm7olGtln2Zdvts+2uPk1clTLdDBCHefMirKc2RxMigA0dsWW+Jp0L5rjAOTV+g3KudDt
 VUo0TvYSI3hgrdA7lD3EIL9zoWZLMLQmCKfs2Yq95K99K7YE2D97hcMnUYGC8bi3KMzvRIeaTj
 OffwKU+o2NULYB28MIIJqjbk2J8Of28WnxAoABztd5PNrW8XVJv/XmMaURDvhHQG/W2NonPpML
 MGYU9mOaze/tvy0YaiiuAajZgW90/nSFP47a71PLG8icKm8cGYVdGEII/IJfe/1bJpLmse4MIF
 wco=
X-IronPort-AV: E=Sophos;i="5.81,234,1610434800"; d="scan'208";a="46768042"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2021 00:54:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 9 Mar 2021 00:54:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 9 Mar 2021 00:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIMcvihTuw12/8QjldCRQyyPCT2cqhoMB3BD7bIEXEaMbSaPyrTN/wMV3x415kAzJW+l2jHb7PujUJtCExarHqEnBY/0I1yWqPH4BTQTBvwB2EFHl8iw+Q82hr///qi757cCvJacRHwGje/pL/6OX/zIJ22Fr7Jo5nCMmvayHQNXYPB9lu7pflJ+eDpW0JpjLAwbmV1s0RVJJc79CVmL7yCei1rB8dSs43Z5ATH2bAScqx/VihJFN0hUDlOZUtJFZHT743FXdnSfefIAaE5fldInqXeOO00rzRgLJe0yJd5FoUkkMW92Ti6u0T81fiPuJUgL55k5gRnevhnuCxIlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3XEY9h09diZJB0G3PMMr8GAmqIV9wXGjSH+8HRPWBI=;
 b=dKg6PZbESiCSzp4LYooP/g0uviScJHQ2BowVxizg10dmRzwS0Xf2wVarMsPLDZjRrnMv1caY6VguAlZ/cwtZ4sgghQWJnFLK6JLNqENDSGAZEGUlGxIGStpGX/Vb5UgyWv2WkaRnv316YzxKh88bE5ZoSS2T9EoLqnl33j58hxMBfZsFOWdKyiNCHZRGM/dY/V6+QXl6lLVsCqUrb827y3OYMqbwK/6qwWX7F4Fn1eKJCCK7NcbEmYHDvrYrc6hSF1AZ3TOqIaHnnYJDtw4R9PxVzRAlvPqpM3m1PByBovOKWcHIwe2OVENdrZFrbt2YJ3bW2vB6w6/H53TawSxJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3XEY9h09diZJB0G3PMMr8GAmqIV9wXGjSH+8HRPWBI=;
 b=JNmeaAckCCizpvoIxzACzjO1TpHI0fMmYaqlnxUf80ioXaabl7ntoPd9ICssikJf2q7Nt8VJry/WJ8Ooox9Mvc8ZCcfEzT56Fi6WWhoSeP63g3J4SVgfT+2roA12c34I/nLIgIV3jv9yeHTNyfZRmZVg7VUvzlLka1i4CGQIsAo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 07:53:59 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 07:53:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <linux-mtd@lists.infradead.org>,
 <shuhao.mai.1990@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Thread-Topic: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Thread-Index: AQHXE9708tl+X2dVKU+02sdf6v2vAA==
Date: Tue, 9 Mar 2021 07:53:59 +0000
Message-ID: <8833cce1-a843-9b56-53ed-e9a2fd42d990@microchip.com>
References: <20210213151047.11700-1-mail@david-bauer.net>
 <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
 <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
In-Reply-To: <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: david-bauer.net; dkim=none (message not signed)
 header.d=none;david-bauer.net; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c43d5251-38dd-432c-0247-08d8e2d07fd7
x-ms-traffictypediagnostic: SA0PR11MB4655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4655D0E206B6283B36EF13EDF0929@SA0PR11MB4655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6qvEC9b97aywSL5YS/75Ug2gg3OuFnz51kp0us6wgtWhGWBoIAi3laWj7GMTEzZJB6nd6Y7lLpHXNKb5lC7bfOFqslgf31U3PX8hK6eeVYLbPQUFxiWaCvmHeacHAIN6fh/9sME1xJLwhU/YdtuqbaKDaT1f5LUg5EUnNUQEUgDaRCE07vkApZO/Axs+wurnI17srEYdAwtQ/0VZ8s5Mp8IH5fbNa+0Zg3TAtULtIbVHPcqEXj+JTMBAAnfRv8583bOCYSR7srfWBcZMaZGl1LujXO0NsFCzlzmUnv2dgHQlTStLiqXAph24rRWCClqEyo/FMG36l0Sta6ruKJlzVHfrfflulHhDTBS5T0z5uQSjga0xxuf1clGwZpf3Guueud1gpidiGERK/DsOOURD0LUyJm4etbs/yrbr6nsKqtQyTj/Fvt/b8vIMyO5xB5Ssir2ydJgFq6cr2BlwjD47aWpVMcWwINZIyNwV3pw7Oc4mpKHPhaqz1GcFkR1ls2SmQCbS0XfeK1MgJxT//D9I9fP66NoPGxQZkykrf9z5g9JTZSmUN2if067k77cwIARjnYFrjI5AujsT2qEP2lMeS0wt1xOkET8Ta2KVv+iaSmwR7AyMhsBlGM+yUW4ZyWrHv3rRbXLQMprzkBT2crzW87bEns1a1h5wJXxT0oXNl3dWaLYKzjxgg+GigZ13ibD2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(376002)(346002)(366004)(6512007)(26005)(2616005)(316002)(966005)(66446008)(186003)(31696002)(6486002)(31686004)(83380400001)(66476007)(2906002)(5660300002)(36756003)(4326008)(66946007)(478600001)(6506007)(91956017)(76116006)(8936002)(53546011)(64756008)(8676002)(110136005)(71200400001)(66556008)(86362001)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UnFEMW42MHhFMTdTODEzS1VNbjFIOE9LT2RXWUJpSFlJdGVBeUhkTWFMaXg0?=
 =?utf-8?B?SFR6WVA4c21Yb3A2RkRIOENPWktjeU01aS92TFBxcHJPdld5S2pySnNJTlcx?=
 =?utf-8?B?U1NIaXJUWnNOM0dJcnFXL3lyNWFUY2lqLzJlK3NxVXdxYXNHeWx4ajlzTlp0?=
 =?utf-8?B?Qm84Vy92bTBxZkRKVEFYL3hFKzJWT1U1MkhLQzNvb2tiM1lNb1dKSVNGaERh?=
 =?utf-8?B?RTBvbHR0cjdyUSt1ZHlIMnJqd29JTEIwZVluQkJqM3puOVhJZThIenQ1SkJn?=
 =?utf-8?B?NUhYTEZGWkRWOTBRcFRWNlF5Z3E0UWVRdXZJdTdpelZ3Q2FKZ1JLLzlVZ0lz?=
 =?utf-8?B?ZEt0TnRsbndGQVJUK29aUW5lVkRMa0hJbTkrZnVQRzZQdnZFNW1mcWpCeWVZ?=
 =?utf-8?B?dWNTREVVdmt0bEdkLzlOZnRwZmVwYThPcFFGdk5PUnc1UlZvd2tjS3ZhZExK?=
 =?utf-8?B?dHlpeGJRajB3VXF3clFTbFlUc3pxVVdLbllmTkhXWFpFclVGWHRDWEZZeCtT?=
 =?utf-8?B?L0JUYzJrWCthS0xWQlVOaHVNQXJLM0FsTE5Zc0ZBSllRSGhRRU83QkpVNlJn?=
 =?utf-8?B?R0NkNFI2YjNGYTVtMDlZR2s2TDhZOFhOVW92S09XOG81dU1xUHo0Y0FiTzZ3?=
 =?utf-8?B?a3piaFF2cW1zYWVRemR3WEwvQkpoV3duVTh5UlZScXI5NlE4VSsvejJxVDRj?=
 =?utf-8?B?ZUJFY3NwR015N2k2MHJFVE1acEp6NGVIcmZVeXBlTDBEcytpNVJlSWdIeFFL?=
 =?utf-8?B?c2RIbng1cktBZ1ByU04ycjdSZkNzU2podzVUbVpBS2crOVMrT0xyUVN4ME4w?=
 =?utf-8?B?UElVa2prQXlBM0QrbVNBMTd6WVNPOHlpK3Ixc2xaZVRkTHdXVDcyd0FPTi9z?=
 =?utf-8?B?N0tIUUx4bXFRakNDeGZ2ZHRJVTdvMzZ0UUd1WmFVNStqZWpvVDUwVWpQSGFO?=
 =?utf-8?B?Q2xCS0o2R0hUcmNoT1RvMHgxWWJkQXBGaWNoOWJhaUIwOTlRUWtrS3M1MUtJ?=
 =?utf-8?B?Nm1sMW1EZFI4ZlVhQnJXWUVFV3ZiK2xrbWJnYzlTaVlCWW0zUzJidkNyZW4y?=
 =?utf-8?B?aDdmWHkzbTE2THJGWUc3SWtmdHlLRnJHZC81NEliNWorcW9KNG1YenlOZlFN?=
 =?utf-8?B?Vlk2ZWZMN09ST3JzT1M4cXMvTGo4bWtKa1htVkNYL0VMcE9yMmM0SVgzaUJi?=
 =?utf-8?B?aFJEVHpsd1VLZzJLMzRVckhqblNPb2VLZHFieVJLVXNaZUNyZDN0ajAxOVBJ?=
 =?utf-8?B?ZHlHSUxMQWswZ1k0c09lSEFLamYwaWRXTDZMRzIwbU5vcUtWSnVoV3hJci9I?=
 =?utf-8?B?eVNxNlNGWjFkUFYwQ2NEeGREY25KSE9IeE41KytuZ0dDK2FwYVMrY29ESUJo?=
 =?utf-8?B?cDhtc1F4NE9GdVgyQ1FHWU80aWdSV3ZRM01rcDV4Z2xBbldLdGJIQ1dhTDdh?=
 =?utf-8?B?Z1l4emhEcFlFNXYrZ1Q2SVo3WmlFeFlQUFh0aUtic29QYzkwdkxSNE42d1Iv?=
 =?utf-8?B?cEZ6NmVMdGplMDUvKzhhMVdEVFRmdCtKSGtFYlBmQStCVFZVYjcrYlF4RVVa?=
 =?utf-8?B?cHZGL2F4dTU2c3F4dFhNYVlmQndNVVhncmpFZUZ4K3ZZSVk3MWR0VE9GeXQ2?=
 =?utf-8?B?UVhwSE04MFd4TE00Tk8wV2FUTzBUYWZkZ2RPWnQzdE45bHFBNGY5WG0rNldM?=
 =?utf-8?B?ZDZYc2gvOUZYcnQ4U3R2eEhNZnNudVN1S0diTTB5QmNkNk02b0lmVmtqVUE5?=
 =?utf-8?Q?yFbznezaM3lJjJy780=3D?=
Content-ID: <0D00B18BC7D64D4EA269EEA7E27907B2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43d5251-38dd-432c-0247-08d8e2d07fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 07:53:59.7672 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvWXd/tBuEAHMAvqrypXet8wWmcbDEeCQXlF9rDs8L6LITH/gS6LnAsoFxab3ag71FFWUCxhQmYNsm6S2wTF0UEq+4PkPJyzYT0PLJIJzqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_075427_715415_8BB00E89 
X-CRM114-Status: GOOD (  17.56  )
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

On 3/8/21 8:03 PM, David Bauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 3/8/21 6:50 AM, Tudor.Ambarus@microchip.com wrote:
>> On 2/13/21 5:10 PM, David Bauer wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
>>> sectors as well as block protection and Dual-/Quad-read.
>>>
>>> Tested on: Ubiquiti UniFi 6 LR
>>>
>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>
>> David, I'll take Shuhao's patch because he sent it first:
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/
> 
> Fine with me, I have not found this patch :)
> 
>>
>> Would you make an incremental patch on top op Shuhao's, to add the
>> locking support?
> 
> Sure, It's necessary for the board (UniFi 6 LR), as the bootloader locks the flash on boot.

Is it necessary to unlock the flash at boot time?
You can unlock the flash from user-space, using mtd-utils.

Have you tried to lock/unlock portions of the flash using mtd-utils,
and check if what was locked corresponds to what the datasheet indicates?

> 
> I'll send a new patch for the lock support.
> 
Great, thanks!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
