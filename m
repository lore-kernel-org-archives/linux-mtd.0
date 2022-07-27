Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638D2C04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVbEJ3m/h/XLdsBNsoaKzqrkEAJt2TYKH/EdXBRH0mo=; b=qwwWfdeSQwPzNc
	A3MJ5gIRpcMOhGBJDkE8sJlq0O01Q7b6rN1ZL5WqOrjKLeIVpTW6BjVkEdUVfdWBYaW5X/2fzXxFA
	Wb35HEGUpzHZtB7iLPwtgKUB2xWmu4D9Q9PKxdvjRwxM7SNQHbEuse4kKhvGKYx1rtMQT2tiCIn4y
	Nv/GOzT0BesO1lPDm+tCAbi1VfEQ/dSNxq4byhePKxwSQZ0f2NxrJwnTXREhO/vplEjNgMwwFR0BS
	wLZCtQx/dr/6ogzD/eO7wZEHpyNzPEHFa7lrtBsA4WHLMBW2ncLQ0MZG72QrQframV7FWQ30rqoZA
	QqsTLDX4VnyL3Xe1RiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgm2-00DrVL-Bg; Wed, 27 Jul 2022 13:08:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGglz-00DrSz-1D
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 13:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658927303; x=1690463303;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KEJoqRDqcIylgpMGvO1LKxvV0ICDVZxDauL0JegBMn4=;
  b=sHLaBvn3Dqn8ynbwAH/HoG2urNiFRjZgFLTblxSUN77GcvbOe50aCMQM
   1F1I+2EB02LV+QcFo65ktajODsLRhi/BjcSCN8rAV35phvpcuRMlVqxE/
   drhiO1rHaubKdZvOp60QjrcqmE4xTIwIUj7w8iEUFhs2zzBJKZOYxDTAL
   66G8UG8imEFt6cobRX6snCtSe5FGnHhVsg/2CRXeVLN3zVxO7SnFjMCme
   SXgHoMOjXaXrJKC3TXSfOJIjFQ66004le3EoaYOa9d9IdQVzPojerjaLW
   3w1SzZx9l3xyBJrlgHLpaYFFD1prW+ZELwSDSGJJgamLLFA4Tb7AjU4GX
   g==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="173834997"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 06:08:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 06:08:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 27 Jul 2022 06:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5STQP2qHtSDegstsV1cfga5BnUSOtWC0gpiUiGxQbNRKTCX4RbcBUEabPOReYCt81Qc4YmaBpYXLDaESGCYHT1JVsvZUJoiCHgOW+3DR4CXnr09CYcDFydzaBsdGscz5ityYIHjf2ox1OnOpBmPwnwE6QsYHIKje/kfATlzjjBHn+zmlQg6MuqgbHlp/UKOR6fqhXnwBahim8UstMcE5SrXHYQ642u5Kzhncn8t76tMDStnBBAj/s3YaqvKaoN9XOcsRrk/aAelkB8koPiiykuNrVbPdQc+FMppnRvK0j9Kc1mnyq/eiFtWa+MPCPge++OKs6wq1xd4Q5340qv9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEJoqRDqcIylgpMGvO1LKxvV0ICDVZxDauL0JegBMn4=;
 b=Te4zIFbwqg1UZfgBIdlztuy/YGoJzBmf/O0fV0aMQ7ieD+n3aqw0Z+zBw2S7nDOrPxyc+xW59TKKJa2WEBF0Y0DkqxnEUtykzymiqbUZs6gpocGW1264c6UYPQmATyXfYwlsyreM2DveOjvABetGO/VdjZnUDEKPP+TZdDzuFp3331knOOyT4gLk28d6CzqreT0t9gEd4Bourg8U0y/y8YPgXtrSVcJyG0108zLvsNvtXJ7mgbAAw7MNqQwCZCm/dUbbHfYddgRclHwEqz+3o8Kd2+Nl5Zc6NfmR6OBvswFS2vPEzDZb8gI3UFP0bS1nw9LrXtDMH+u1by6yTkHSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEJoqRDqcIylgpMGvO1LKxvV0ICDVZxDauL0JegBMn4=;
 b=dQCKU/v3N4iN1sZRErXHDhEAS4entM+FplXX5Z+F6uBTSY4z5b2Mgtuke8ktwjJbU4+hny7GPMJCWGwX7UMBj+R5a1OWp3bmN6mBUIWcenHrIsIluB0kb9JWd49xNApWQR9B9pzq5Q5ZcgqjnweEU5SVYSTLSIUEXZLff9WH76s=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 13:08:17 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Wed, 27 Jul 2022
 13:08:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <tkuw584924@gmail.com>, <Takahiro.Kuwano@infineon.com>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 7/7] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v17 7/7] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYobjaTF+QMtjZN025YatHuF/ufK2SMGwA
Date: Wed, 27 Jul 2022 13:08:16 +0000
Message-ID: <1df29ef1-8849-976d-81bd-44864fe765c3@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-8-tudor.ambarus@microchip.com>
 <a79ffcc34f8da3f7439b0fb72fb93084@walle.cc>
 <96563607-44da-df4d-3ab1-cd538b4816c5@microchip.com>
In-Reply-To: <96563607-44da-df4d-3ab1-cd538b4816c5@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f1e98b1-6aff-48d9-1e00-08da6fd11223
x-ms-traffictypediagnostic: BL1PR11MB5240:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v30UREy8xEANA6FMsT9wzBKxcMWJIRVsXAVWkNl81O6lYXdhpYShIjSK7N1rrYKF1IqJ5Necmqf9/qV2x53A80xE8HF4D6GmQZ1gDExqCBTLWaeIl5wX7Fi/FZA08s6ttQKcinIsoDzfvVYD74MeN2nHUbMLsZKD7ymR6XpZYA1HeUT27XDSBzt+Jd2bmfecBT2jkqSMZIkFH6Im03lIOlHWmly60ffVvmDlQPbJtDm43oxZZYHZcS3Wy+0y2rmpZD8LjUHI5wbwExZJAj4Q64YuoOdijvcugrBq+0h7BgFhpUK6YiuyhFfoXzC0x6Q73wQPXLThYKK9/f1MfLLxFOROA+GlM0/IB4uUg3FarxDJcaZYK/8sk4WnFs/zHo3bXLaa66iSLFE3k19kZ/kthH8rDcdysm38lfTZr63G8GfNxn1Z+yf7hcbNJHH7YTIccpmeKu0VuN9IIx5X1p+T5B31gtdl+OKtt9Y89OnhdsESsHlDv/0pBU2TGavqcyz40SedA4E2G30I9RPrgWvtSc53yH4E15/bfOwdz5FbBH4Gi3p2TSzEoi4WpDpoin31GHejcPzs4UuOb4CEv9VewN8mtdIY2KVSW40RguhXhupMWUdj1YYnEKkKQhXwihsNh7wV72kHsk8xGZEghn3mERDCcvahzKOkFL87x6/KMUIcln1nt1fT/pllLlFji29BfIP3FcpVBE4vJdoNuu9CM3FFe4Dqd9WfGWv9FJDyDEeopNwZ0Qpe6bJQ4/zx84sdPwYp79/4Qv+MYuHG9NsjlZnsKwgsWg9JNtrcMNwo1hsdLUhH5bJgbsjA90Y2gp/cUNAGR4wCY6UFTHq/gTxLrbJVzf0Cb2ovN9A37I4BMMcNguFUHfm4T62jKPWIm6ENqJXYwA/WzfJ71TRvWyG0Zg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(346002)(366004)(376002)(8676002)(91956017)(76116006)(66556008)(64756008)(66946007)(66446008)(4326008)(36756003)(5660300002)(38070700005)(66476007)(6486002)(8936002)(2906002)(122000001)(38100700002)(2616005)(966005)(478600001)(31696002)(316002)(41300700001)(71200400001)(186003)(6512007)(6506007)(86362001)(53546011)(26005)(6916009)(54906003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXh5bFhodzdkN3Zlb1QzS2lxa3BQRzdoc2lBOHdBNFVER2FrYnJCR3cvWlRt?=
 =?utf-8?B?a0FpY2RlSTRndmREZjJjdTdzeTFBUS9TU3NJVndrU3hPNUZuT2VTdE8zQUk0?=
 =?utf-8?B?YmJMa1JwWWVhbVdyQU1ycDB6Wmt2b1FNSmtFbkMwMm1uamFnWkJQM3lBSm1S?=
 =?utf-8?B?VnF5VTdVblpzYWErY3ZxbUtQQzhuRjc5UnU3cWwzcjVvMmtkMFlhb3hocDVa?=
 =?utf-8?B?Ull2cWNyT1IxWFhQQUJjTHZ0RWROd1dRTk9MZGYzODdRSk5KYjY2c2lLZGo0?=
 =?utf-8?B?c3cvTG9Ndm1LSXM0YU15azVWbTJkL0JqeG1WU3k1d00yVzVUTkZoYUtyVXBV?=
 =?utf-8?B?YlhNRmFibkdSaDZGaHB0VWlCM1FIQ25tRHE0NnNVUFpJN2pJVDRwUWVNMWNW?=
 =?utf-8?B?ck55cWdVTHBoS2tYZURCOU9YbkJoMDcxYjZjSjErMG1LakZ5dmMzTVcvWnZS?=
 =?utf-8?B?OFMybTlHbmcwNmtKRzhDS3I1U29yQnlmZU9NZHllR01ZRk15Z3gxTk5MNGdD?=
 =?utf-8?B?YU8zbDJkK3VOUXB0dC8yRUlUaDZLL1krc25NaTRRdFNrRk12Wjl1ckRwdnRx?=
 =?utf-8?B?UmNmRGFiZzB4TjRERmYxUHZQWTNiU2RiZzA5cW5BbXFwMlh2di92VzVBYnhj?=
 =?utf-8?B?V3BNWUpOZkZmOHFZK2xEMEplM2tEUnFwNDB4WHZReWlXRmhLMllUZjl1YWVQ?=
 =?utf-8?B?NkJBOHJlYWZVV2ZJVnZlS29sV0VQK2labUh4Y1J0dUhjclJHUHhJRWdDTXdq?=
 =?utf-8?B?S1ErRThBTkJ5T2ZXVE16aEd5SEJMOXdJc3kzd3JEM1V2elhpQjlDd3BQd296?=
 =?utf-8?B?VmRqTml3alcwMm85cm5XTTFRU010bHp2eWo5MFVHVXRkNWpBUjJKMkh3WFVy?=
 =?utf-8?B?M3pQQ3o5QWQ0TnFTdDJqTzBJL01SWHEvaXFQb2JjNkE4T2hyVUdsRU5yRi9P?=
 =?utf-8?B?Nmk1K0JMTHRONDNpdmZHU0JEbndQRTU3c091R3pCZ1NRTDBZZ0VpVXZYUFJU?=
 =?utf-8?B?VXg0Y3RxQm9yUDNSWkFFbW10THNubS8yQlBPSDRzNWFHRTd0Qm9mUVJYQWhM?=
 =?utf-8?B?bk9uNm5wM2NzcFFMU25rdnorcFlaNmFLUjlHdFQxeEZhQnhwTDNtNjc1amdH?=
 =?utf-8?B?eDNyU0wzWXRtY2V6MWNCd0VBUFNBdEdvUXRuQS9nUHQ2d2xZS3BDNjR0cGt4?=
 =?utf-8?B?cXduVVV2YzBFRFdGR0NxZ2xqbEhwYm9iWDY4Y2JKMnM4MG9KejZPdFlIUkVI?=
 =?utf-8?B?M1VRaGVkeFY1dHNNVkFzbGhrUUJLcVQ5RU9lMmFSdWtiNnNFSldEVHQxT0VM?=
 =?utf-8?B?NEk2QVRGdTVFZUZ1QnZWMElKQ1lKUm5Cd3RJclJOdk1RT0NmMUZHZU1sbnNE?=
 =?utf-8?B?b3FzZnR6c1F4MThJcEJGZXVtUDI2SkJGVFhkYXg5c3ZPMUhGMTFnZEJZZlNh?=
 =?utf-8?B?K296ajVDbFd6Wi95cXI3TjFxVTlZSnJzRS9FT29sbGpyUmtOV205Vm1MUzVm?=
 =?utf-8?B?c3ZJZHQ2RzhkU25vbEwxNUdxZjExZWZYNTVNZ2V3K3FXdmpVODJNbHJLamN0?=
 =?utf-8?B?MHo1QUd6SlJ4SUVIMUgxZ0FFdHhTVVlCT3NvUkRZT1NqaDdLVVgzL2V5YkRx?=
 =?utf-8?B?dExudGZkTHJqNmhWNFVLNTdJeVZyRkVOYmxhL3YyY1ZKdThEa0lnY0JlVFNH?=
 =?utf-8?B?MEhSQ0tZdk1DL2M2NGwza1EwQjJkNVkydjdSNUhCclhGQk1jNERuNG5waE1S?=
 =?utf-8?B?WlJDdG1LNWt5dVp1SEZ3VWNPczdQbzdmVU1ZcDFwbEg5SEFXb1NxYXdLc2py?=
 =?utf-8?B?NjBJOTRtRE9Qb084SzBzMkxua2ZhV3B6YlNZeXkxMERHelUwUTZ3c1gxdUJk?=
 =?utf-8?B?ck5SbkVkaUlTVVlmdVJ2bVY1dG45cklTVkJBWmE3SWxFTEtqN2lkOWpva3Bu?=
 =?utf-8?B?RzYxT1JnZThKUHZVRGJRTktBNkk5Rk1DK2UzTlRGa1h4bWh5SVV4VDJBVWQr?=
 =?utf-8?B?NmVySVJnT0dSMWtFRlRZOHVhOEU3VmYxNUJhS2tueGhlZzRjUlMrSFlxdndF?=
 =?utf-8?B?cWpRSXV6aWNZZno4aWo0d3BZUE81bnJBVWJQV0xCd2dEVjRVQmZxeGtienlL?=
 =?utf-8?Q?gOAFtTQxeI7hqqKZRjxi5A1tW?=
Content-ID: <0DAC4926A8EDEE4BB41A7AF6D4DB691E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1e98b1-6aff-48d9-1e00-08da6fd11223
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 13:08:16.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtkoCL7oQseOtYfSCufcKGW5+vYVpyhVw9K4PGaoEDIcfMs479fak7q30AdHUkftLif3rmBxB3ppt2HYClt8phdMxHgp6muAmDzh/zfx9BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_060823_161620_8A9D2EFB 
X-CRM114-Status: GOOD (  16.24  )
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

On 7/27/22 16:00, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/27/22 14:18, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Am 2022-07-25 11:25, schrieb Tudor Ambarus:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>
>>> These Infineon chips support volatile version of configuration
>>> registers
>>> and it is recommended to update volatile registers in the field
>>> application
>>> due to a risk of the non-volatile registers corruption by power
>>> interrupt.
>>> Add support for volatile QE bit.
>>>
>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>> uniform sector sizes are supported. This is due to missing or incorrect
>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>> followed up as needed.
>>>
>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 132 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 132 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c
>>> b/drivers/mtd/spi-nor/spansion.c
>>> index 60e41e1a9a92..0f5b9e81719f 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -14,6 +14,8 @@
>>>  #define SPINOR_OP_CLSR               0x30    /* Clear status register 1 */
>>>  #define SPINOR_OP_RD_ANY_REG                 0x65    /* Read any register */
>>>  #define SPINOR_OP_WR_ANY_REG                 0x71    /* Write any register */
>>> +#define SPINOR_REG_CYPRESS_CFR1V             0x00800002
>>> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN     BIT(1)  /* Quad Enable */
>>>  #define SPINOR_REG_CYPRESS_CFR2V             0x00800003
>>>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24        0xb
>>>  #define SPINOR_REG_CYPRESS_CFR3V             0x00800004
>>> @@ -113,6 +115,68 @@ static int cypress_nor_octal_dtr_dis(struct
>>> spi_nor *nor)
>>>       return 0;
>>>  }
>>>
>>> +/**
>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in
>>> volatile
>>> + *                                      register.
>>> + * @nor:     pointer to a 'struct spi_nor'
>>> + *
>>> + * It is recommended to update volatile registers in the field
>>> application due
>>> + * to a risk of the non-volatile registers corruption by power
>>> interrupt. This
>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the
>>> Quad Enable
>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash
>>> programmer
>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1
>>> volatile is
>>> + * also set during Flash power-up.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>> +{
>>> +     struct spi_mem_op op;
>>> +     u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
>>> +     u8 cfr1v_written;
>>> +     int ret;
>>> +
>>> +     op = (struct spi_mem_op)
>>> +             CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
>>> +                                       SPINOR_REG_CYPRESS_CFR1V,
>>> +                                       nor->bouncebuf);
>>> +
>>> +     ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
>>> +             return 0;
>>> +
>>> +     /* Update the Quad Enable bit. */
>>> +     nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
>>> +     op = (struct spi_mem_op)
>>> +             CYPRESS_NOR_WR_ANY_REG_OP(addr_mode_nbytes,
>>> +                                       SPINOR_REG_CYPRESS_CFR1V, 1,
>>> +                                       nor->bouncebuf);
>>> +     ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     cfr1v_written = nor->bouncebuf[0];
>>> +
>>> +     /* Read back and check it. */
>>> +     op = (struct spi_mem_op)
>>> +             CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
>>> +                                       SPINOR_REG_CYPRESS_CFR1V,
>>> +                                       nor->bouncebuf);
>>> +     ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (nor->bouncebuf[0] != cfr1v_written) {
>>> +             dev_err(nor->dev, "CFR1: Read back test failed\n");
>>> +             return -EIO;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  /**
>>>   * cypress_nor_set_page_size() - Set page size which corresponds to
>>> the flash
>>>   *                               configuration.
>>> @@ -143,6 +207,58 @@ static int cypress_nor_set_page_size(struct
>>> spi_nor *nor)
>>>       return 0;
>>>  }
>>>
>>> +static int
>>> +s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
>>> +                     const struct sfdp_parameter_header *bfpt_header,
>>> +                     const struct sfdp_bfpt *bfpt)
>>> +{
>>> +     /* Replace Quad Enable with volatile version */
>>> +     nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>> +
>>> +     return cypress_nor_set_page_size(nor);
>>> +}
>>> +
>>> +static void s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
>>> +{
>>> +     struct spi_nor_erase_type *erase_type =
>>> +                                     nor->params->erase_map.erase_type;
>>> +     int i;

here should have been unsigned int i;
>>> +
>>> +     /*
>>> +      * In some parts, 3byte erase opcodes are advertised by 4BAIT.
>>> +      * Convert them to 4byte erase opcodes.
>>> +      */
>>> +     for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
>>> +             switch (erase_type[i].opcode) {
>>> +             case SPINOR_OP_SE:
>>> +                     erase_type[i].opcode = SPINOR_OP_SE_4B;
>>> +                     break;
>>> +             case SPINOR_OP_BE_4K:
>>> +                     erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
>>> +                     break;
>>> +             default:
>>> +                     break;
>>> +             }
>>> +     }
>>> +}
>>> +
>>> +static void s25hx_t_late_init(struct spi_nor *nor)
>>> +{
>>> +     struct spi_nor_flash_parameter *params = nor->params;
>>> +
>>> +     /* Fast Read 4B requires mode cycles */
>>> +     params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>> +
>>> +     /* The writesize should be ECC data unit size */
>>> +     params->writesize = 16;
>>> +}
>>> +
>>> +static struct spi_nor_fixups s25hx_t_fixups = {
>>> +     .post_bfpt = s25hx_t_post_bfpt_fixup,
>>> +     .post_sfdp = s25hx_t_post_sfdp_fixup,
>>> +     .late_init = s25hx_t_late_init,
>>> +};
>>> +
>>>  /**
>>>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress
>>> flashes.
>>>   * @nor:             pointer to a 'struct spi_nor'
>>> @@ -319,6 +435,22 @@ static const struct flash_info
>>> spansion_nor_parts[] = {
>>>       { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>>>               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>>               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>> +     { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>>
>> I know I'm really late, but would this also work with
>> { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 0, 0)
>>                PARSE_SFDP
>>
>> It seems the former patch will figure out the page size anyway.
> 
> That's sector_size and n_sectors. Probably works, but we'd have
> to change it anyway when the SNOR_ID3 patch is integrated. Plus, it may

maybe SFDP_INFO and SFDP_INFO6 instead of SNOR_ID3?

> confuse people as using zero values for these parameters will make
> BP protection fail. I'd queue this as it is, and we'll ping Takahiro to
> give us a Tested-by tag when converting all these to SNOR_ID3.
> 
> If it sounds fair to you, I'm happy to receive your R-b tag.
> 
> Thanks again for taking the time to review these.
> --
> Cheers,
> ta
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
