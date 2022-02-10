Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9/D22fQpYQ34Zf8SXLzprHhpZ5nglG1DCkWbAEEv+0=; b=bkTyHIm1vPUww9
	bZTnfWWLxIkjeCr84dsRjtijxx1ipH8JeDiUTZJzzBSQHCj+QHJhMY9xksJ65V/PsYf7n5VRUJmHl
	8xE+z34bqtP0TNVW4SWW4ZMIvDibamX1hyO5CU0As7xHjjSDwGWYveL6YnD+7Kml4fRDBkLX016XF
	sUNChRD2z+yZ3MwBREppSS4nyTn4K/oDoS/hOtv1/BgKcI843CtLGFXFodBanDfh0XmEq+5fKdppd
	/ngxhfjWAfRAuqpy8jQUmF8vn5y5a1sM8uUYCwmyPMyezp9gegVZ13uZgTx5BkLI6XUpfkC3imdlR
	WjlOtHen0J0VpqN4O5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzhW-002LRW-HD; Thu, 10 Feb 2022 03:00:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzhS-002LQn-BQ
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644462050; x=1675998050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6zlUx1DcQullhsU56aJhgAnpYomuJ++9pPJo42TQyTs=;
 b=I69rwHOggSP++4bpjprpOovDGW23L6kZEmG1VxdKFfcFcyZFnxLEbQmn
 /sRDPcTk5yv2C8/J9EMdrFLlhb7+793jfOwsDTlx+ecKfHJdc43aU3exd
 NaUEDFxpf6IGcxwKiYsiIPPU7WGcHras/v5z0ftQWV0bSQ6ZcxxwCLAsn
 6lvsQpN3rj80xYqBGy0x+Mzf0D0Ef9GMe/iThPDp2QXTVVMqqupeQ6oJw
 gm1fSTqOIsCLebNkgrP3p9uil1fSw9Unv90FW00t+2BWfaorl85nCJnaP
 veuP6Cs+t+rJp2Em6jyetxJP5k5Vl39Mx+UQGrIewL2+pnbnfF5hdxJWM A==;
IronPort-SDR: a8sy+UminCmNyd0fxGMprSHA36xMIMm20O9W7k0b6C9hFdrzblOBYnTbTgubeaYCIrRPCWz5Cv
 P518T5HxwTk3qAPoAdGxCjh5oMiirL1zOECHBtraJrEpXqtu8CRD63X5UQIXw53iE4Cjd9wIfq
 3gCV8OLuu2hn8elI7NzDjpntHEnn1evl3B6KYzc2iKFs4Fs/XQveMA9mZui609l7QYncws1OSs
 Ghau83AflTNsdo6VruotArraAl4T58SHacwJzQkYBQOYR8WgbtTlOqcf1Lwe/fkt/SeecTUk2X
 TJ9vybysNlZdN4MY1bqdiyWI
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="148219404"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:00:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:00:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG0kKnWbjBdoPIuQNIYs6Y+Jp7qFNAGOCHbdOB0jxqGtugz2rjKuIPvgp0fd0uPDtGTAB6HzH1QioCp1S5R98+A9rCNbYn6fMghaReUJmz7T6QIVmWHx6RXo+fJwRdmUohLQcQpL72MxQZK9o7jq9mBoNKtNYz5pSInqGwj6yzhz/Kg2jNcZeKiCsjfPUdKLURmhAf9nfYz89aIOmkhjJt6o79pwyhsodZsYDKYJS+QEzhD9660hRUGcQXc9OZV/tH6d2n4eBUou62zno76Oa8HkeNe+sIKK9TG0bZTph+76kXEWF77pTmP2XIaLdKbYAzgWoNPdECe2uyxEbt/c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zlUx1DcQullhsU56aJhgAnpYomuJ++9pPJo42TQyTs=;
 b=MUe6rsWRicQgFrPmao90UYD5uMmB0POdQortNWogqc/SvWtLmIzAFkNoHC3jZK3zKrKhhJ7sw6Itoks/Iak5MvrL5PhQOdKbTo9ZL/do2xvwgo7kMlB1Fak8cdhlwxM0T1yClgcb3vlvfdDo5nD4+gA5Bv5gIoD2nLx88nfN6vcKxU0ARZSP9yDC1Lre0cKLFwEkLsdHJEZHHNVn6b+1mIBF3CwwsFP3PUyw7zHdszIHCq1WbLRGFWxcUo/WFoHrq5PV29jKU3J2JHiXj+sWTvYfvHV9C66jAxpukGjyhujEvo1x5aLWWOs7wLeak5juDES7ulXpjRHG91rggR6MRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zlUx1DcQullhsU56aJhgAnpYomuJ++9pPJo42TQyTs=;
 b=Ia7gqBznr0RLVBIgwD5zROY6HC8fCv6Qokrn582GNWg9z7dCb0+oT8FlAdvT35GenBEmUDerSJ8PvOse6zB8iIxlaJeZVZqnJTLjucHyzfbB1061b18HVCJxiAyaEbZQrKbMgbX+NFRV6PoAuRBtxssNKXsiRHPjainFYsNBuKw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:00:38 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:00:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 02/14] mtd: spi-nor: slightly refactor the
 spi_nor_setup()
Thread-Topic: [PATCH v1 02/14] mtd: spi-nor: slightly refactor the
 spi_nor_setup()
Thread-Index: AQHYHiphPQSfofc8m0+TtNX2dRXljw==
Date: Thu, 10 Feb 2022 03:00:37 +0000
Message-ID: <f4a7a2c2-579c-f558-3d85-cf0709a6060c@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-3-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0137dea9-0c1a-44da-254b-08d9ec4183d2
x-ms-traffictypediagnostic: BL1PR11MB5255:EE_
x-microsoft-antispam-prvs: <BL1PR11MB52558AF9A12BFE047A9F0C89F02F9@BL1PR11MB5255.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WtasleHLSufO4erkyHXtlL+L+xH0Wr9kUW3OBikDgNE6NB0s/939KkRHq6buEIlCkjuc3e9ovxdUHGAd7HrxYdmSGzTtsONxN4RMoVbCEu6dJn6ltWxr5QtOYag5JxEpMR0f9ptNEKZNIS4WpVTTOHRN1WS6HAjQ/Jr6TMl2JHNy7Ydif+AsLqAJ6PMWnv9LxPBzGBOUdD5Z/RJlBXc2fOWhFJrdMMCqBE4PHFHdo4qyYBk5JI8ECd0verTjCpdgDXIlsBEwdWbbrgCEL/VpjfyoXiGe4NvcCnn0XmD3vYg8eGNLWhJvarb42O+sBd5heTCBvkxYoKywQnaYLaaPWu7QIeRBXO9zEUr42yNUWJngNHnrqtv/4TU/IRvBZYvRnmij+33IVS5VNlPMpgEEOZGAl6LBmP9IoJRICkKmNy/4rUoW8DDJrFyb95Yg/ZRvcwJg3BkniSqHv7a0goXg+EEoSiUP1KFTueWntpnazT2tayrSecq+ZpA701AUBlff/QMomAw9RulwpfCkrtihx3XEqsQQXcjn724rbMBD4cDaY+/P9pz4Bg39ZCLybMTv/VEmTB5Ca3SnrF6SsoQqQqEXa36hH2usLziyhPIqHapxEVqLPmBX2QyLW1cXNOd90G69yPh7eeILKvshLhZWVxPuDpsd6qOg15GDFvQUue/X2Xb6GJceyhr+mgSpXs0lBvGhDqFEKJAFqyytCLIy5HR/5OtyJ3DhFwfFwN/DnxxErFBSrZPeZc33Mc7hQC8TSm2SuiO0uFOKvk4wfqpn8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(6486002)(54906003)(83380400001)(38070700005)(76116006)(316002)(26005)(2906002)(186003)(2616005)(110136005)(31686004)(122000001)(8676002)(6512007)(5660300002)(86362001)(508600001)(31696002)(66476007)(71200400001)(64756008)(38100700002)(36756003)(91956017)(53546011)(6506007)(8936002)(66446008)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEV6ZGtjNmNTWDFDSFQyK0xSVjdYSG5mMXZYRitGTDFwZ01tUm9PMWlUUjlP?=
 =?utf-8?B?Q1E2anFCcyt5Y3kyYlNxamhtVFFsU2NZUG9Ia0tLdVlMTC8rUWV1cEZma1dY?=
 =?utf-8?B?WGl4dHNXS1hiN0ZTSk9QbDh5UTRhRFpyWC9maUQzak1vTlNBWXppWWNKalVD?=
 =?utf-8?B?YWNEYkdKcDB1SFJHVTlQNW80VEtyTTIvSUo0cHlvK3lLKzJ4aVVEbGlmcFlu?=
 =?utf-8?B?VnhISG1hT2ZHMHV5YUF6TEM5S2dqZ3NEblh6MnNvN3VWUHVhMm1ZeU41eGdD?=
 =?utf-8?B?b3hYekUxTVhwOUhCWW5nc1NLNytJUDBZc0FmWk5FQWNaNGloZENmUzVXWGlp?=
 =?utf-8?B?bXA3dHpZaCtnWVNOTnM4bE5BcnEvYUtYNTNwQTNNMGRMMmNEcTlrNlAxRFI1?=
 =?utf-8?B?dytwS0pENmw0c2tZQ2NYMFlZcUwwVGFGRWlUN0pZb0lSeU1jVThWL1N6akQ4?=
 =?utf-8?B?UHhvUURiZm5sUUxRanJxdWpCUDJ4Rmw5NWNXd3NzRlRLMTBRa2Y1em5rdTJr?=
 =?utf-8?B?c04yYnpDMWxRajF5Yk41Z1hiL3NmQ1JTQk90dTZWYTMwTEdBaXp3UzhtcWxD?=
 =?utf-8?B?NEFPWVJVdm8xVUk5ZzJ6L0pUV21PSkZmbi9JZVJhdGk2QWJieWNuSjYvMjcx?=
 =?utf-8?B?c0Q3b3M1Qm1yanZiRllxYVhLdVhZVkdVbmltOCtYaWw0TkVxbHpNMG05Q3Zj?=
 =?utf-8?B?NnE4ME1QMHo4cWFnclB2d1g3TFhCNFpXMUNqTmZ2RWlGa2tHWm1XZzgvTlB0?=
 =?utf-8?B?by85M3h6NU5uQTdBRW1XbkRpNHZrV29hT3VhM3lEL3BxSUd2WmhzMG9ZUGRj?=
 =?utf-8?B?eGZKZDVTZ0ZXS3pPRXpDQVArOHNqZHo1ZmkyaG8wVjhxemFvNm85clhGSUVp?=
 =?utf-8?B?L3dOUXJraDZycll4V3d1L3REVjZnWmZBalJyOCtxK1R5WXNVd0RvOGtjbzhp?=
 =?utf-8?B?cWxyWUF3Nm5ZSG1JY2JsbE02VW5Qc1U2WUtybUtTeUlLbU9IZzJTWGtac251?=
 =?utf-8?B?TE1BaEwrL3hldUdFOExTYk5oN3dycnhBSHMyTWdQWUFtZUVsY3diTm45bnpl?=
 =?utf-8?B?WHVIRDgvQTdNeWZCT2NQR3VRdGFZWG9UTkhta1ArMStLenV5bTBHV29RdHV5?=
 =?utf-8?B?NHludWV6dngrNGhNZmQwSHR4a3Z2TmMraWt6b3FreGdqdVRya0pVa3hlc3ov?=
 =?utf-8?B?WWtsbnZLZmJTS0pZWmkvWDBPaXFVYWQ4SlRVN3NMU2pNbE94dU0rMC9jNmNL?=
 =?utf-8?B?OGZINUd3eEUwZklXZjY3WFp4Qm9nWEMxWDVGOVlQM1drN0QyaTFRMHduZzZx?=
 =?utf-8?B?UTdyOWU3QUxibndxallCWEtxeXBCbm5kWmhQcWxrdzBhWU4vQXJacStRTTlO?=
 =?utf-8?B?eWZVbE84dDFyS2QvR0x1NDJ6ZUFuL0g0N3FLN0xVMmQvVmRyNElGeFBuWTRy?=
 =?utf-8?B?UTloUW96UEYrSkVQRmFjK0JUWXR2RnZoOTB2YnNodGxnc00yQTNiTkRJMzRs?=
 =?utf-8?B?eVpmMGlFMlFOenZkS2RyM3RDNDVmcTYzUnZzTms2ZXRVNUVCRTJTUnBpaVdE?=
 =?utf-8?B?TEpUL1ZHc1d4akNTQ2NNblVIMVE1Zk5KNC9MSnJENzVCS01JL24vQWVVVDZ3?=
 =?utf-8?B?U1QwYWRSSE1weDgydzR6ZG0yNEdsektVRFhKd0xtMnN5NHArK1lWY1Z2NFpl?=
 =?utf-8?B?Z1hqcGJYRm5udTBYWnFLTzVKOExock9MWm13TXFJYlQ1aXFpQVFVQi84NzBC?=
 =?utf-8?B?SG9BRm9BMkVtbjNIMERTcXpkWWFiNlN6M2dHKzR2Z240UG1TQXB5NzE5R3Np?=
 =?utf-8?B?OG1vSnd6TjZ5TExlcGw5WlFaYmREODhOWHAzZE5ONHRwTm93U0pmcEQ5YjJK?=
 =?utf-8?B?Mnk2Z01WZ3Z6VGtyYjVyNkpTSjZOWXF3N3Y3S3FHUUZNUnVFODhxalhoVGZU?=
 =?utf-8?B?SjYxaTZHb0RUS3ZSc0ozVWdTSzBZWWI5SWdnZm5aZmRxWXBFYTI4ZjVlQnFF?=
 =?utf-8?B?bHJYVXJmVlcrNW9sMmNGaERxRzhvVzFncy96R2NvME9tTUMxdlpLYXlZTlhk?=
 =?utf-8?B?dnNobTNBeUhYZFYwczNUbGpIemkwcGF2aWpUdkFUek9pQ1BJODYvU3R6Vld1?=
 =?utf-8?B?NTVFYUJwQTB5c0Q5NmhFYUQ2citSSkVjSjBpRzAyZ1hzWm5rK1Z1N0tpSkx5?=
 =?utf-8?B?Q2NIa1lTRDZ4WWZIOGFmYjVlNmhKMzdrV2QvNXpNVitmcFFVdzRyeEFPUG9N?=
 =?utf-8?B?VHpLWkVMSmZ4UzZHMnVibWZNTmV3PT0=?=
Content-ID: <3EB0FEA5CA649F4C8E70873838793EA0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0137dea9-0c1a-44da-254b-08d9ec4183d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:00:37.7627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lZaxFC/7/TD+G+BbBa4Anny5vKPTGwAHRezxm4dXk8wYCQasXJCBlvQqwnpLmzvpjrOQeWunK9Lbp96S+FEE0pCp/GlpW3aQNVXAYoEW/Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_190050_631159_818CFE6E 
X-CRM114-Status: GOOD (  24.96  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Instead of always using a function pointer (and initializing it to our
> default), just call the default function if the flash didn't set its own
> one. That will make the call flow easier to follow.
> 
> Also mark the parameter as optional now.

what should be done in the future?

> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 10 +++++-----
>  drivers/mtd/spi-nor/core.h |  8 ++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f05ece6018dc..c8cc906cf771 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2532,11 +2532,12 @@ static int spi_nor_setup(struct spi_nor *nor,
>  {
>         int ret;
> 
> -       if (nor->params->setup) {
> +       if (nor->params->setup)
>                 ret = nor->params->setup(nor, hwcaps);
> -               if (ret)
> -                       return ret;
> -       }
> +       else
> +               ret = spi_nor_default_setup(nor, hwcaps);
> +       if (ret)
> +               return ret;
> 
>         return spi_nor_set_addr_width(nor);
>  }
> @@ -2786,7 +2787,6 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
> 
>         params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>         params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
> -       params->setup = spi_nor_default_setup;
>         params->otp.org = &info->otp_org;
> 
>         /* Default to 16-bit Write Status (01h) Command */
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index c6578d3f598b..10f478547dc2 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -257,10 +257,10 @@ struct spi_nor_otp {
>   * @convert_addr:      converts an absolute address into something the flash
>   *                      will understand. Particularly useful when pagesize is
>   *                      not a power-of-2.
> - * @setup:              configures the SPI NOR memory. Useful for SPI NOR
> - *                      flashes that have peculiarities to the SPI NOR standard
> - *                      e.g. different opcodes, specific address calculation,
> - *                      page size, etc.
> + * @setup:             (optional) configures the SPI NOR memory. Useful for
> + *                     SPI NOR flashes that have peculiarities to the SPI NOR
> + *                     standard e.g. different opcodes, specific address
> + *                     calculation, page size, etc.
>   * @locking_ops:       SPI NOR locking methods.
>   */
>  struct spi_nor_flash_parameter {
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
