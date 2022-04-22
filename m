Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9317EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 06:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHwoUzD/ThlNISrU96JmzMdjoaxL/Lp6oq+M6GE+XXU=; b=JG6rF1BgpOXz2n
	dzhk88zRC2A49pKBfp+ZWXtxuxnnglPvsKeLDS7vh6kg9rkcME4ZDkgw9qvu+VadFx8ZPaz+5PMC4
	G1CH3ZAX81WRv+83iHBVtTBGjYBjdCAWqTTp7Z901GlT85MrNfgw+AMQS/TYGw5S+QEblKCR3hJZc
	OUPxTcne/MlMLspIWPr4vQIci7Wp/vtmfC8ILAYNHEa4xRtTiHARCIOgfRvwx8Y9LvpdVx44nwLFi
	GWx+LgEz/YQnxB7Lzb9cOuz1hN5A+YB9e7uv1O/FvUaDW+gDV0MtZyQ7k172atOvsVwAfBWz4nUp9
	yKoLZervrp5aAeunyWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmpD-00GYyU-HX; Fri, 22 Apr 2022 06:31:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmjP-00GWMG-Vv
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 06:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650608727; x=1682144727;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zQ5nd1DsJj93TuVCUHWwhbP8PghaVcgRWfFVBCOGQqU=;
 b=hsbCnS99xxoqMWXFgMaN+R11hs072kf0k3fcHpI3FAW//8L80U+RdO6o
 kuRMm0ap/6HwKo4sE2K+nkYnYlSZ7yt3YuenCvnaLbp45VC3dyj3lNrHw
 kuD9TphlXPC+IRaswGZsTMzEyF/QbHREmpK92uxT0odyZa+wiqc8tIlf/
 8lF+2z6yS7GYVNZk9mI5qloZxGwM6m6fn4YJaAR3DjaJJjsytOUkIRj/7
 aBHkBLsHfML5506rcN06mWlwUxbt2purie1E/rDBf8zZb9JLp9Oq6SVaH
 e0u1mOahPvG0BBsVBP4e5NRSXIy1FcC2HrGzwR4Q4wGsGW5CSnGKaUpF4 A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643698800"; d="scan'208";a="170529630"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 23:25:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 23:25:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 23:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZz9gRXXcc23nJNcl03BLqszZAxUeAqmqLSQVIJvPlbRQgoh0xrKE49UF/WOftJspISiQaJo7b9s8VPlxVRj09l8cpRKZr76JXaJNwPN0HTIGk0I2RMTGSV67W2dW8EJosL2+mDTM6KhSmfp74mr3JCAC5R54RBDWH/0Wdpj0SdekKw3mFPtPbvUf+DaGcoEJ+o07/+FtlGUgidHrKEqyaHQBtEHfXfS8vF54GoSGh8i2VXdzGbCA+CLgmZWwkvMjEiwxAgGXXeTuFBgojW1u/wKoHoF9EOcSLB11e5MQWpJHSmvBCwnrT7ygR8DIi1VpMH/m8ka99Klf6bGDfqRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ5nd1DsJj93TuVCUHWwhbP8PghaVcgRWfFVBCOGQqU=;
 b=IUBbVl0o9QWXYeHwh8eEDRD8EB7jw6mGWADGrGNW6+DG+BckRWoQBhUPWiapjd1Ebobjh2Ir44j5HkZOTc2/8CCSDjvZm8Sp0q/nj+uWeGHYgqrn1jmoH5W2XrbDzq7ws0Gt4Z3dOFd70M20A2u+jAkauL4c5D/i71a3hhtw42mWPArdYCOvBQFk+d+Ph2O4lAfpUYbRIfyaKQtzwErjy/uVBZn34FUPfIy2mK2w2hQovlYRQh2rf/C5xS/iMcBqa99FgVE2lOgvitvOIDhzggj0O3QdZHzi8Pg+CbvsUOg0F4jz+948SJ43uU02jA3UWNaR19LT7yvWCXJKiJRB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQ5nd1DsJj93TuVCUHWwhbP8PghaVcgRWfFVBCOGQqU=;
 b=LOeUeLt4irgg7oc1UAvIMIc2rGg/iHmQ/NFMonH4LUuDBE7Nh+sV7Ss7hNdUD13m3TAj7cRBdMAHrQ9wSG/xCKd9h1S/xR/dkLTpIxxtk7q18/ybffi+V2Lu5mpzUEmycW9wL2Ia7Pz4LFwkkajSCWLf5AFKLZUeELWrj/E6dC0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB3001.namprd11.prod.outlook.com (2603:10b6:5:6e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 06:25:19 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 06:25:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bjorn@mork.no>
CC: <miquel.raynal@bootlin.com>, <ezequiel@vanguardiasur.com.ar>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Thread-Topic: [PATCH] mtdblock: warn if opened on NAND
Thread-Index: AQHYVYv4fJtjUnDJ3E6qWDTepFd7AQ==
Date: Fri, 22 Apr 2022 06:25:19 +0000
Message-ID: <d5c1a7f9-5ae3-4c89-9dd8-939ef4e08c72@microchip.com>
References: <20220328161108.87757-1-bjorn@mork.no>
 <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com>
 <877d7io0a1.fsf@miraculix.mork.no>
In-Reply-To: <877d7io0a1.fsf@miraculix.mork.no>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fec613f2-57b9-4ac7-8226-08da2428df59
x-ms-traffictypediagnostic: DM6PR11MB3001:EE_
x-microsoft-antispam-prvs: <DM6PR11MB300164B9B4B6711B2BF129ECF0F79@DM6PR11MB3001.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LhnfupfHz8csY6dmYcRLB3Ugtxhesj7Dw/7iO3eg+7/+UFuS9EHKOk4BPdJr57Hh96OlyP/x8EJQHUdRn+FiyQz/YO9DHLBZ3vCcKleDmkWMz+8qlmyT5ZKThkRqvjmUakWWUOegvD3G6q5Yx3bZ5KIiIajVXww7DJ9+JFIoe/iqIRsAbmmKAlFnbbl4cQvg2r1TDLnMFULwKhlwH9xywiqlbPAAeprev4+uvjeyYvr6o1LNPkzH2uNtS/b8me63rDSRcNaNrkrJBUZawshk79z+gxKUQZWTv62b5B8HTS13q4rfhHCIHjez4iCZ2WPeT3QEp2vaYc7lmpnqXWwPqu8bG4tuisHdFhru+mMf14P9tzC4qFPH8l/+5/gPiwI9UrFppYfRjRbsbjfcDGy5lTGPYqUowR+kIH0kJjjqLVfmYzq8GibAiOiNpMAtwoA+ebkS0WNvFy9taBxN+zumkZTfoEjsbMJz4eREFPkveOcIhhLDoRZZxsSv0Kc1HOfGo8n8K9dAyf748BuY+JfnENLdbJ8261+ibtrBfkjXaBTsXbBCBT8wCVzr+Vn2Z8AIgSusz0YBnmtmiihNtJ2oBwJoimr3CDrVUxhS8MVNa8qaEs5NzbIYjSZ5W/rZm7TGnSL6Xx+1PfHjJukbUBZly2egLXVhQ8BP3L3NOplLR/tzB1w7oUjVE0MbBhhe6o6SEwQscZJYBV8MLiWGu6sOD6W5lE+qMrf0Uk5QfF4B33d/TIzfxZJZFEo9e7fC9Fwjr61tpjoYaEfDdi1nc42MHPD+Fb+cMnh/KHC7yMoMXs5n9AOcy+DxyS1eja5dOXzvSQr/ZIz/WCxlPG4+y1ygU2QYJjwHHWZPpSGyFsq7vHg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66574015)(2616005)(66556008)(186003)(508600001)(31696002)(966005)(71200400001)(86362001)(66476007)(8676002)(76116006)(36756003)(91956017)(4326008)(31686004)(66446008)(5660300002)(64756008)(66946007)(6916009)(6486002)(316002)(8936002)(2906002)(122000001)(38070700005)(26005)(38100700002)(54906003)(6512007)(83380400001)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzh4RmVSOUc2QVFwV0lYajQ2STQ1Wm5VTFJaU012L1NjZjliVXFCRzdJZm1L?=
 =?utf-8?B?YjlZSWpydVFLUXY2Q1kwUWJ5UVhVVmt3cENLU0hONlJjemtyekFJTWFHa2JR?=
 =?utf-8?B?V1pJOTFSK2tVaXFpQm5zV0tmQy9Fc2tNTkorWnJDVW5oNXpBQ3BKajRmSlUy?=
 =?utf-8?B?cGtkM2lHbDVLZkJYWi9hQzNSL1JBQlQzMFByVVlhKzJ2eWFqWjBYVWF1aFRD?=
 =?utf-8?B?OFNhbHI1LzJFVU1EMVlqbUxBN3BLRTNoVEZxSGt0ZXltcDZ4ZldxdnorSTYx?=
 =?utf-8?B?ZUlac1dxSW1CS3YzOGRSMDVqa2g2NWN6TUExNUtZZ3d6VGxIL2hDdkdCVFRx?=
 =?utf-8?B?SnJPQkRaeC9xclN2cWx0Ujl5SmhlMnk2eFZ4L1IzenZNNkNWZzI2SDBObGMr?=
 =?utf-8?B?MVBNUzF3WEpkejhSZE5nRWgvS1AvZVdvSm5wN3FVL3k0SGtDWGN4ZXU1UFFV?=
 =?utf-8?B?WnVTVjM4VlpESVdXUS96Nmpyc3VBakgvaXhsLy96MFNtbGZkY1MzQ0hyem1B?=
 =?utf-8?B?d2FiTEtLNzE1ZTd2QkZaYzMxK29nRnVBdXNISlMxUGlwWHloZXNYU2NNSE95?=
 =?utf-8?B?a3dLa0sxVFhnaEdrWVlmeGxxZG83dVdYY2NKSmpLYWRndFpkWS9RMGg0Qm1t?=
 =?utf-8?B?OUJ6dWphdXlZY0k3TFVxNFNrL2t0VEJFS1BuWGVKdFh0QlM1WjA1VVBvZmV4?=
 =?utf-8?B?eUcyaTFNWmRBRlRPT2NWaUhoa001TmxIWUMvOWl2WUdhRVhpSGFDRmJkY0Zt?=
 =?utf-8?B?dndyQUphNUVRbWo2OHBUR09qeGRFblRVcnZhdGszb1BQekJVT3dZenluRUlq?=
 =?utf-8?B?NkE1d1hWSVpxRGNCWnN3RFZNcDA1dHZQWkdZM3JuaFpIY0FVZzB3RGdQU1d0?=
 =?utf-8?B?N1ZnUUNZK0xmNGY3L2p4R0RHU3RmNm9hVHpNUTl2U2RWYndab1NkNldoci9x?=
 =?utf-8?B?YmR0WHRxVWIrWmhmbVhWeTJJa0xyc1RHdUY2NDV2dzZTejdxandnallhbEw1?=
 =?utf-8?B?eFNaNE1sdVJITkZJcFgvUUdra0VUdVMxR1dSUVVaT3FUQXJSOGx0VVdlZm1D?=
 =?utf-8?B?YkRFQVhuNFV6bG9sVW9CTU5NenJidkFqWERuSldPMVJyckZEY1NNVEZYaWlG?=
 =?utf-8?B?aGtaMkExeVhPQzQ3S1dUSGxkeVM1dzExaEdSamZBYUlyU2Y5OFBDZmhOVjNM?=
 =?utf-8?B?ZTRXeDdkaE5ZOGJnRktzVkhCNzhuWExaN2RCRlRETjdtSGp2Q0FTdXlKOGJs?=
 =?utf-8?B?dENDQ1dOZUplcncvbmY2VkVXOXhxWngwS2ZGZFpBdW1qbW5ZR3Z6bHg0cjl2?=
 =?utf-8?B?ZFBIeFliYXlGZkxTc1hJMVAzZ2cwSHEvb1A5ek1WYm85UFFmdlQrcUM0bWZJ?=
 =?utf-8?B?UzZJbjJpbnZkaEFBeitRZmtGZ0t2ZWxnOWRGNzNFcGk2VHN3RHNoRVd5MWli?=
 =?utf-8?B?ek1Ed3VtRGVQSXN1QVFvZTM5RmNicDJVY0tmbnNGdXBZQVBpNm9RcTVWL2Mv?=
 =?utf-8?B?dDZoeGRFbXppNncyMHVBQ1J5ZjIvSG8vbDNicGlhZXpTNnBXVFpwcXFIODJZ?=
 =?utf-8?B?VnVsaHhrN3VKZEtsMEp3azBvM0dOMGNkdHMyN0VzZ2VieTJxQWxLWTRmYkVS?=
 =?utf-8?B?N3NmU1NpWmlnRzh3Znd5alphcTRFV2pFbmx6V2lTY3NsUGFvWlArekpDS0R6?=
 =?utf-8?B?OWJGeWJvS3FnVzgrdmQ5NEV1dmcxTE5WQklEWHN3ZGg2SkNPU1pBRHoyaHIw?=
 =?utf-8?B?S0xGZjBVL0kxSURIYVRvSHhPckp3UitNeklYTWV3c1FKWFEyQzh3UEdHK2Rq?=
 =?utf-8?B?NDF3bWI0MTBlaEdQdk1HVFJUb1hCNjdVUG9HbU5IbkhUbUdmSUkva2JXK2cw?=
 =?utf-8?B?ZDgwd05sbFEyaXh2WkNEbGM1QjlRM1d0RUpxMTFCZDFjSU9ocDJNektWTkxh?=
 =?utf-8?B?TzZUajJGMzROMktLdEhXOTk0bkVZTEx1bXA3cFRQditHaENjbmpVRXhkZEVM?=
 =?utf-8?B?SHNzTnRkTEQvdHQrT0g5MXl6eUNTUE1kcXUxUVdsZ0ZwOU00UFMrV0Raem1U?=
 =?utf-8?B?UkdaL1ZmeTBwd2xxL2xPcGZuT2h5QXB3UXlRQ1hSai9XZzUvaDlOOTFVRUlq?=
 =?utf-8?B?a3BYR09rREhaZDM0am9ZZVhxNzR6WDg0ZmZqanF3VWZ4Zy9WY1ExeE9NWHI1?=
 =?utf-8?B?MDVVVFoxcXNlMjVVODk0SUkyZ0orcEFJY3huVGowYUlPUlpRUXRKZk4vaWxW?=
 =?utf-8?B?YVVmdTU1TTkyd1pUcmxqdHJpU1BnenprLzg4bERyajFzZFd5THRCUERDNm9v?=
 =?utf-8?B?VjdHamFtT2VzTWJZK2FyQjJhU2JTMHo1TWhBOEdZeWVSOW5LNjVSNU1jdy9G?=
 =?utf-8?Q?HSGlI9nzCZPlkYac=3D?=
Content-ID: <2B9B8BD6D3ACA846B0D32FFAFA97957B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec613f2-57b9-4ac7-8226-08da2428df59
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 06:25:19.0355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDtaxVzbg1QKF/YgdfILoayMtMqVw6idRtTQpScxei9WdW7J9BrKxe9UIDZEVIQFWv1VZs2+152u1NUk69bglttxJYrcfRe34iJpHeZ39pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_232528_305269_49F1798E 
X-CRM114-Status: GOOD (  37.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEJqw7hybiwNCg0KT24gNC8yMS8yMiAxOTo0MywgQmrDuHJuIE1vcmsgd3JvdGU6DQo+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gPFR1ZG9yLkFtYmFydXNAbWlj
cm9jaGlwLmNvbT4gd3JpdGVzOg0KPiANCj4+IEkgZG9uJ3Qgc2VlIHRoaXMgYXMgYSBmaXgsIHlv
dSBqdXN0IG1hc2sgb3V0IHRoZSB3YXJuaW5nLCB5b3UgYXNzdW1lDQo+PiB0aGF0IG10ZGJsb2Nr
IGlzIG5vdCB1c2VkDQo+IA0KPiBObywgSSBkb24ndC4gIE5vIHJlYWwgd2FybmluZ3MgYXJlIG1h
c2tlZC4gIE9ubHkgYm9ndXMgd2FybmluZ3MuDQo+IA0KPiBJIG1ha2Ugbm8gYXNzdW1wdGlvbiBh
Ym91dCBtdGRibG9jayB1c2FnZS4gSSBtb3ZlZCB0aGUgd2FybmluZyB0byBvcGVuKCkNCj4gc28g
dGhhdCB0aGUgZHJpdmVyIGNvbXBsYWlucyB3aGVuIGEgTkFORCBtdGRibG9jayBwYXJ0aXRpb24g
aXMgbW91bnRlZC4NCj4gSSBhbSBzdXJlIHRoaXMgZG9lcyBoYXBwZW4gZnJvbSB0aW1lIHRvIHRp
bWUsIGFuZCBhZ3JlZSAxMDAlIHRoYXQgYQ0KPiB3YXJuaW5nIGlzIGFwcHJvcHJpYXRlIGluIHRo
b3NlIGNhc2VzLg0KPiANCj4gQ29tbWl0IGUwNzQwM2E4YzZiZSBpcyBiYXNlZCBvbiB0d28gZmFs
c2UgYXNzdW1wdGlvbnM6DQo+IDEpIHRoZSBwcmVzZW5jZSBvZiB0aGUgbXRkYmxvY2sgZHJpdmVy
IGlzIGEgcHJvYmxlbQ0KDQpJdCBpcyBhIHByb2JsZW0uIFVzaW5nIGl0IHdpbGwgd2VhciBvdXQg
cGFydHMgb2YgeW91ciByYXcgZmxhc2ggcmVsYXRpdmVseQ0KZmFzdC4gVGhlcmUncyBubyB3ZWFy
LWxldmVsaW5nIHdpdGggbXRkYmxvY2suIElNTyBtdGRibG9jayBzaG91bGQgYmUgdXNlZA0KanVz
dCBmb3IgdGVzdGluZyBwdXJwb3NlcyBtYXliZSwgb3IgZm9yIGNhc2VzIHdoZXJlIHVzZXJzIGFy
ZSBmb3JjZWQgdG8NCnVzZSB3cml0ZSBjYXBhYmxlIGJsb2NrLWJhc2VkIEZpbGUgU3lzdGVtcyAt
IHdoaWNoIGlzIHN0aWxsIHdyb25nIGluIG15DQpvcGluaW9uLg0KDQo+IDIpIGFsbCBwYXJ0aXRp
b25zIHdpbGwgYmUgbW91bnRlZCBhcyBtdGRibG9jayBkZXZpY2VzDQoNCkluZGVlZCwgd2Ugc2hv
dWxkIHByaW50IG9ubHkgYSBtZXNzYWdlLCBub3Qgb25lIGZvciBlYWNoIHBhcnRpdGlvbi4gRXZl
biBzbywNCndlYXJpbmcgb3V0IHBhcnRzIG9mIGEgcGFydGl0aW9uIGRhbWFnZXMgeW91ciByYXcg
Zmxhc2guDQoNCj4gDQo+IEV4dGVuc2l2ZSBsb2cgbm9pc2UgaXMgYSBwcm9ibGVtIGZvciBlbmQg
dXNlcnMuICBXZSBjYW4gb2J2aW91c2x5IGFyZ3VlDQo+IGlmIGl0IGlzIGEgYnVnIG9yIG5vdC4g
IEkgY2xhaW0gdGhhdCBpdCBpcyBiZWNhdXNlIHJlYWwgd2FybmluZ3MgZHJvd24NCj4gaW4gdGhl
IG5vaXNlLCBtYWtpbmcgcmVhbCBidWdzIG11Y2ggaGFyZGVyIHRvIHNwb3QuDQo+IA0KPj4gYnV0
IHlvdSBzdGlsbCBrZWVwIGl0IGluIHlvdXIgY29uZmlnLCB3aGljaA0KPj4gaXMgd3JvbmcuIFlv
dSBzaG91bGQgaW5zdGVhZCB1cGRhdGUgeW91ciBjb25maWcsIHJlbW92ZSBtdGRibG9jaywgYW5k
DQo+PiBmaXggdGhlIGNhdXNlIGlmIGl0J3MgcG9zc2libGUuDQo+IA0KPiBTbyBpZiB5b3UgaGF2
ZSBhIGRldmljZSB3aXRoIGJvdGggTk9SIGFuZCBOQU5EIGZsYXNoLCB0aGVuIHdoYXQ/ICBOb3QN
Cj4gdGhhdCB1bnVzdWFsLg0KDQpTb3JyeSwgSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgYXJndW1l
bnQuIEJvdGggTkFORCBhbmQgTk9SIGZsYXNoZXMgd2lsbA0Kd2VhciBvdXQgaWYgdXNpbmcgbXRk
YmxvY2suIE5BTkQgd2lsbCB3ZWFyIGZhc3RlciB0aGFuIE5PUiwgYnV0IE5PUiBpcw0Kc3RpbGwg
YWZmZWN0ZWQuDQoNCj4gDQo+Pj4gc3RhcnQgbm90aWNpbmcgbm93IHRoYXQgT3BlbldydCBpcyBt
b3ZpbmcgdG8gNS4xNS4gIEFzIHlvdSBtYXkgb3INCj4+PiBub3Qga25vdywgT3BlbldydCB1bmNv
bmRpdGlvbmFsbHkgaW5jbHVkZXMgbXRkYmxvY2sgd2hldGhlciB0aGUNCj4+PiB0YXJnZXQgaXMg
TkFORCBvciBOT1IuICBTbyB0aGlzIHdpbGwgY2F1c2UgbG90cyBvZiBub2lzZSBvbiBhbnkNCj4+
DQo+PiBXaHkgZG9lcyBPcGVud3J0IGluY2x1ZGUgbXRkYmxvY2s/DQo+IA0KPiBJIGRvbid0IGtu
b3cgYW5kIEkgZG9uJ3Qgc3BlYWsgZm9yIE9wZW5XcnQsIGJlaW5nIG9ubHkgYW4gZW5kIHVzZXIu
ICBCdXQNCj4gSSBhc3N1bWUgaXQncyBiZWNhdXNlIE9wZW5XcnQgYnVpbGRzIHNlbWktZ2VuZXJp
YyBpbWFnZXMgZm9yIGJvdGggTk9SDQo+IGFuZCBOQU5EIGRldmljZXMsIGFzIHdlbGwgYXMgZGV2
aWNlcyB3aXRoIGJvdGggZmxhc2ggdHlwZXMuIFRoZXkgYXJlDQoNCk5laXRoZXIgTk9SLCBub3Ig
TkFORCBzaG91bGQgdXNlIG10ZGJsb2NrIHRvIGVuYWJsZSB3cml0ZS1jYXBhYmxlDQpibG9jay1i
YXNlZCBGaWxlIFN5c3RlbXMgaW4gcHJvZHVjdGlvbi4gUmF3IGZsYXNoZXMgc2hvdWxkIGJlIGhh
bmRsZWQNCndpdGggVUJJIGluc3RlYWQuDQoNCj4gYWxzbyB0cnlpbmcgdG8gbWFpbnRhaW4gZmxh
c2ggbGF5b3V0IGNvbXBhdGliaWxsdHkgd2l0aCBPRU0gZmlybXdhcmUsDQo+IHdoaWNoIG9mdGVu
IGRvZXMgcmVhbGx5IHN0dXBpZCB0aGluZ3MuDQo+IA0KPiBTdXJlLCBPcGVuV3J0IGNvdWxkIHBy
b2JhYmx5IHN0cmlwIG10ZGJsb2NrIGZyb20gTkFORCBvbmx5IGRldmljZXMuIEJ1dA0KPiBJIGd1
ZXNzIHRoZSBwcmlvcml0eSBpcyBsb3cgc2luY2UgaXQgZG9lc24ndCBmaXggYW55IHByb2JsZW0s
IGFuZCBpdA0KPiB3aWxsIGNvbXBsaWNhdGUgdGhlaXIgYnVpbGQgc2xpZ2h0bHkuIEknbSBzdXJl
IHBhdGNoZXMgYXJlIHdlbGNvbWUNCj4gdGhvdWdoLg0KPiANCj4+IEkgaGF2ZSBlbmNvdW50ZXJl
ZCB0aGVzZSBtZXNzYWdlcyBpbiBzb21lIGNvbmZpZ3MgdGhhdCBJJ20gdXNpbmcgYW5kIEkNCj4+
IGVuZGVkIHVwIGNsZWFuaW5nIHRoZW0uIFRoZXNlIG1lc3NhZ2VzIGhlbHBlZCBtZSBpZGVudGlm
eSB0aGUgcHJvYmxlbSBhbmQNCj4+IHVsdGltYXRlbHkgdG8gZml4IGl0LiBMZXQncyBnaXZlIG90
aGVycyB0aGUgY2hhbmNlIHRvIGRvIHRoZSBzYW1lLg0KPiANCj4gT3RoZXJzIHdpbGwgc3RpbGwg
Z2V0IHRoZSB3YXJuaW5nIGlmZiB0aGVyZSBpcyBhIHByb2JsZW0uDQoNCkl0IGlzIGEgcHJvYmxl
bSBpbiBteSBvcGluaW9uLiBZb3VyIGZsYXNoIHdpbGwgYmUgaXJyZXZlcnNpYmx5IGRhbWFnZWQN
CnJlYWxseSBmYXN0IGlmIHVzaW5nIG10ZGJsb2NrLg0KDQo+IA0KPiBUaGUgZml4IGlzIHRvIHBy
ZXZlbnQgd2FybmluZ3Mgd2hlbiB0aGVyZSBpc24ndCBvbmUuICBJZiB5b3Ugd2FybiAyMDANCj4g
dGltZXMgKHdoaWNoIElNSE8gaXMgYSBsb3cgZXN0aW1hdGUgaGVyZSkgZm9yIGV2ZXJ5IHJlYWwg
cHJvYmxlbSwgdGhlbg0KPiBubyBvbmUgd2lsbCBjYXJlIGluIHRoZSBlbmQuICJPaCwgaXQncyBq
dXN0IG10ZGJsb2NrIHdoaW5pbmcgYWdhaW4uICBJdA0KPiBkb2VzIHRoYXQgYWxsIHRoZSB0aW1l
Ig0KPiANCg0KSSBhZ3JlZSB3ZSBzaG91bGQgaW1wcm92ZSB0aGlzIGFuZCBwYXNzIGEgc2luZ2xl
IHdhcm5pbmcuIEkgd291bGQgbGlrZSB0bw0Kc3RpbGwgaGF2ZSB0aGlzIHdhcm5pbmcgYXQgYm9v
dCBpZiBwb3NzaWJsZS4gSSBndWVzcyBwZW9wbGUgaGF2ZSB0aGUNCm10ZGJsb2NrIGNvbmZpZyBp
biB0aGVpciBkZWZjb25maWdzLCBidXQgbmV2ZXIgdXNlIG10ZGJsb2NrLCBhdCBsZWFzdCB0aGF0
DQp3YXMgbXkgY2FzZS4gSGF2aW5nIHRoYXQgd2FybmluZyB3aWxsIGdpdmUgdGhlbSB0aGUgY2hh
bmNlIHRvIGZpeCB0aGVpcg0KZGVmY29uZmlncy4NCg0KQnR3LCBzb21ldGhpbmcgc2ltaWxhciB3
YXMgZGlzY3Vzc2VkIGF0Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC84NzY5ODI0MTQu
Mzg2NzkuMTYzNTI3NDg5MjA5OS5KYXZhTWFpbC56aW1icmFAbm9kLmF0Lw0KDQpDaGVlcnMsDQp0
YQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
