Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290EC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOLaVpg3Xmwh21/rMA8W9vaNEk2woPEMFQ0yR3O25fk=; b=gegrDhbq7oPjds
	s1iM9aIJatvD4N185pZpPx5kC3ePGppPIey6ALZwoeYR4R0J/rJ06lpFr/Cft0DBblLw1HOwIV87b
	8dZay+d5/XNSeMvnv5zaxTi715YTB4HfzIT50+pp0C21zYI7P21D5h60B/cJe9X9rFlcwEGNTMtBd
	5Y5r5AScZTLPfbjv1P0B0SGEDjogrDLpPttICWh956adldHkf+hB+waswU9uyDT7YhH+ShHXUnkF9
	cs5+7mp5D/bpnnrifmicSD5zPKxhpYfqm6EbU7vvcHMiqm7sKk5n1wA5TV1M4Lwan8t9upWiCEBWg
	t1rmL7iDbUby/geV79Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myEIw-00AewI-KC; Fri, 17 Dec 2021 14:33:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myEIr-00Aev9-Di
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 14:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639751625; x=1671287625;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W4EFdD14k7CAOfJjr8Fy0Py/MoAJjllMQcpGhlPH24s=;
 b=LPNzuCqoaJ+QhzuRPhXlLqYY+GGYcp8CXwq3/piT5MQOpZaWTxhzcK5s
 uf2SqZO3WmlAGfA5fk+VYAF3L+hHPekKiPlDjMkdMcv7kJeh2JwsgbESL
 j9L50FmnR/Fdh9oQtTizlfSO4hCWUXQ3IxjUc9+qoebod0XTAQM9hMKET
 fuO1Kd0GGDv+MN3aIeamTthi01BaFfMRd5/aD8myS5YuIFB1NDGNZeei6
 9LUdFs+OuzSN/1M729Ntv8CFZh2H04ZNZhmA127VtKLZ2MWQKJE6eTfP2
 wDSGuyK61pPij/cwfoA+HgKd/3hIELdtVfJnBg/GYzqQ9qt6mzLVAuIzf w==;
IronPort-SDR: EekUeQBw7qShLR/f8u148YdmYIieZ8E3Sm33rOhJt6WkPVsZVssHf+4NOJwxEIKzx/1lf0K6DV
 Pf3pNJyeawHLqraPTbNDvKD/zY7adjcThjbfGyELagcCf+OC9deBPb+8roQtEQZxxP8w4/Ubtt
 ENfjwMdzkef441lk9vgv5fyjYd6h6yllfwc9HE0GrGRqeuRi1jGfFlky/vIRlsVyX4DSjF897o
 JXO9/plvhV88jDr5+bVpw+V/2n6R+wUW5IevIismGCtJ/A9lI9jv+pTqxeTJUwx0Tqly6dHPMm
 4ewlBCrL7UpJe0AhWO4ErcRH
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140138051"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 07:33:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 07:33:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 07:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxLu4PwXEBHixLJCB5rZfj5aLPX/vGF1AXpXjhk/tpQBhShgRprgJVUGL43vV9R7YgN35rbP61V56JeyIXWTVigVaqrjyhVSOZIU5ov+gY3ktTY19NwLjuzjxPg/SUsBPjqWrCz0KlHAhajfgeZCERHMq8sjiw0cVIwdTKGMAUU24h3c/h5bHBRB2kFc7PM06qQWI+d2rQDyXWsNwhjjkgwAjOMWawvGwgXXjFKXYXYbUjtCVSqn4l3WYKotaxsX24vf+cu630Ae0g+pbiF3n+IEUyZEJHm9ZRGVXizxWm1XwiLcAzbZgHcw8T9RoOs+/GduUjyDR8dBKn7GZIQXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4EFdD14k7CAOfJjr8Fy0Py/MoAJjllMQcpGhlPH24s=;
 b=AHruQhN7hXAXrHnvUEDadeskTzG03jjRBQxkbk8NZ1ztywEoEztyhFMS1YGQqT2BsZKox6TzXvUdHty/mTzDlx+xgttgpGW3o0anSS+gS/aPsjpZRx+zKohyktjPK4GwHcf2HrG4KPPxbYQh8RMGMBA+JDuv1dxZj0qEpuoyDKeXtFT0I8sazkYnAGSSDuqwfT9XtEtcP7JTZSWRxkqonV9pjF++fNttjMzg27nLaD8WGTOf0X0+ab6+SYLW/2sg7NnMOnYKLAFUtpPY0MiJr8vCYTFKZ+yZUDaXJbK6yFsViTXEQIp8tmcvRkN2k09rPo5B0uGOFtFMp+BCmcY/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4EFdD14k7CAOfJjr8Fy0Py/MoAJjllMQcpGhlPH24s=;
 b=pYEFbzuN4DvV+Wx4qSDaGWP7ZBoRNEJ19mqhp2zNdvUFNB3BEmV7GPywADiskAaHrAZpFJgE4kF+WRJKRqYh2lVnoYxI7GroY7r50G6LWTQfDiY7i2oeMZvOFlleaeYJi2xza1QWmgt11azwwY3VF+LsX2ncG3ycMza72fvYPDM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2877.namprd11.prod.outlook.com (2603:10b6:805:5b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 14:33:37 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 14:33:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Topic: [PATCH v3 2/2] mtd: spi-nor: macronix: Add support for
 mx66lm1g45g
Thread-Index: AQHX81MTOnr/og5W1EWkrumbO9U2zQ==
Date: Fri, 17 Dec 2021 14:33:37 +0000
Message-ID: <8f196323-d8b1-8f10-dee7-f958560ddeac@microchip.com>
References: <20211217134442.497950-1-tudor.ambarus@microchip.com>
 <20211217134442.497950-2-tudor.ambarus@microchip.com>
In-Reply-To: <20211217134442.497950-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6703402d-4a84-4310-9801-08d9c16a369c
x-ms-traffictypediagnostic: SN6PR11MB2877:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2877DE79E7AB8B4CA7042569F0789@SN6PR11MB2877.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QO0UzxkHNq7nQHvcMVWA2aqsBml8DZO8axLqNF2+lJONhBL16cI/BijIsY4j90KLJ6+lkBdloiFu93JCofHWIHdjUjCXpDDRj6whLl0dV7k278IclGnsE4hOrZtDO7QueSnw0q6z7jZDV9j9BeXgHL834tDBCjm1A/9MWEMrerqXSkCLS4vRuFBaQNMfxMxSt54t2kleLj+HsyEyLwvnb2BNdVrZjOworBi5R9t80/azbrGA2Fn7YLUugFjpifLwC/5pSosZOIwY7qIfYtiCyswevLVFmhdjPWFKmVP+nHyRb4hCQXyoIioKmdVK5Zy5IX8abhy9Kt5ZXOzJvgAL06d7pFuBRTYlwUBceNt3ZpMscgJ05aXvDnNSAJ7ObrDYxubmbnX2UwNnaSwJPL5OX4XLceE424fWNg4kdznT0lTBQzCECgL6WLladSU6aEGw9SRVbFsk+8ZMh8vn0NQ9wNP5LUWR0G4h6mEkAlsFncOGsUvlOJt6l02tBL4GsqKWgBAW3wo5N4AEVfyWLFkJ/Gd30kra1SoxDbWh1ONC4oGXpw/3hVfUoM/rG2gvrIwhik6RZGDCP6wsx5ZyuTW/qXnbm0dx/FkKqaSNo1A98wZAVgBD2WBBtp/Ktzs8zuiswGYC2nn5N85AqD3V48iAJKNsziU0c+U4ye0WX+Bp8p9eDsSbkIWBIeQ6TWRj44pOFZV5XsUqIMxb5HvRpFycJz0dT3Jstv5czvCq/06wwFHLezNb0GFMyWWS73NPwcB3X2hB1l6KTem2HO7ubqNwPYSf6/BshJSaRaWW2zjnzAhaLGwWuRAWdnldcwwdsW63dtGkQ2NzOCatEFZgn78qzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(31686004)(186003)(36756003)(26005)(66476007)(91956017)(66446008)(64756008)(110136005)(76116006)(66556008)(66946007)(53546011)(38070700005)(38100700002)(316002)(86362001)(508600001)(54906003)(8676002)(2906002)(31696002)(6506007)(6512007)(5660300002)(6486002)(4326008)(2616005)(71200400001)(122000001)(138113003)(98903001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2IraDNpZTI4VUU1VDRjWWo3T0w5RjQzSG1OUXFoa3E0bWF6K3F2SGJMUi9G?=
 =?utf-8?B?QUVOZnBUUlBFOXZLb3lTRlJUT3FTcHJnWkFic3BYRThGSnkzWmlraVJtcjZq?=
 =?utf-8?B?VHh0ejFrNUNEcTJpOHplRGI2dVRiT1dKWk5wN0NOMkhleFcyWllNMkFDM1JI?=
 =?utf-8?B?cHZoN2cxQ1VqMXpzRS9zUVpRMUFmZGdFMGlzUDZmVENia0R0R0paanVBV0Fy?=
 =?utf-8?B?ZnBDUnIxZnVWSDN2NmREMEU3R05wNUFQYUVYSWFaWklRL29zS1dUSHFxWGR5?=
 =?utf-8?B?a3l1THV0ODZZNEE3UW1nZ1BSU0FCOG9uNzgrSlRHTC9Sb2ZDQXRQZXF2VHVw?=
 =?utf-8?B?OG9xMW8raTlPR01vdFA2aHE0QUEwZitxSWFEaDZObHU2MUR2Y1k0eVZBUFph?=
 =?utf-8?B?K2hnUmtUWnAvZFRXRjJOZXgvSitaenJoU2lQSkZYeW5aNXQ3K1VRZU5ETUI5?=
 =?utf-8?B?QkVWcVRBZXFXczlMams0WFRrZWlpeU0xTVlpdWc0WnZSdWJCMXF5bmRycnJN?=
 =?utf-8?B?S3ZsUWx3aVBMRGZKOXRIWVJSR2czK2ZXUCt0K0N0RTZNZFMwaWx4QS9XaWRo?=
 =?utf-8?B?clhTRVRIcGE2NjBSTlBKMlJsV3ZoYVU5bFd2TlY3M2lLTWxaTlFweDZKcEVm?=
 =?utf-8?B?WGZ0dVdBaUx5cndHcXpLdmg0SVkvbkV6L3Fwb2EzTXpNUmZZVDRhWkNNSlFJ?=
 =?utf-8?B?Nm9na2d0TEhEcExiOWVpbzdpR1ZwNTdDQS9UUzRXNHl1Z2NwZFVmWlpXaEpv?=
 =?utf-8?B?NjRnR04vdE10eFBQNUpUWkVpTWE1cmgzSjFTVkVtTzlnSWJVMmNyVlJYa3Mz?=
 =?utf-8?B?cWJVYk51NTZJbHVqbkdMYXllUmhzRmVPck12ZU0zYjRFTkY2bm45ZEx0TzUz?=
 =?utf-8?B?a2FCaVJJYmJaTmt6eWhhYm1Td25FMnR4Qlp4NnlIZ0ZZRzJNRXVXekFIUU1u?=
 =?utf-8?B?MVltWkEzZ2NWT2NtUnpCUVVBcWI1U241dHBWV0VlaWh1VVRYaFZmdkVXQmF0?=
 =?utf-8?B?Q1ZkbC90LzFxeGVrTklSUnNyNVNvdXNTdlNoYjF0Tm5TblhiVmoraWNzTGRR?=
 =?utf-8?B?RGVZclhpREgxWFU3TUQ5dTJDbjhvaDNBNFFDSU5OeEtVODN2TGRkY09UUzg5?=
 =?utf-8?B?eFh6b2xHd0tsUjBjQ0tNZjhnTElabVNVdDErSjdxaE1QVWN3MFBMZk9zOHFO?=
 =?utf-8?B?eDFERG5uYXVpSmh2YXlLY3E0WUh1TTNKdm9xUUs2SXVWZ3ppYzVwV1pKUDhl?=
 =?utf-8?B?Rm13U29iUVBCTlMyZ2lMWUYwMmJZcitNanJzQkV5dlFUNTU5RlFXd000L1hR?=
 =?utf-8?B?OGFwWFN6bDFSczFIY0FUWmhwZ2ZCUytrQjREZWNPTGQ0cDBaUGJGdWNuS0RR?=
 =?utf-8?B?eXdqWWwvZ3FXbDE4WUxzSWJMak42bUI0Y1V1UERCb1hvTW5NR3JIbGZtRWRW?=
 =?utf-8?B?VS8xTmRJbzVkOThZOEZHUnJnRS9DYjJka2w2a05sQVVrdWVJWEtXd1ZndkZD?=
 =?utf-8?B?QVdMVHNzR2puZ0l4TkFjMEppQ000T3NaRU8yWUhMRzBPUXdBNUtFZW42V2I3?=
 =?utf-8?B?aEdTeFp0ci9JRnZaSHUvb0RueEZQQ2FZY1ZhOG80OHY5c0k1UnFFbTJxeU4w?=
 =?utf-8?B?U1ZlTWNtVXVySmdxNnRSWmhNdTlUU2dsQ0VVR2NseEdBVUtKYVJLaFVKZG9G?=
 =?utf-8?B?eldlU2ordURpU0kxV2hvOHkyMFNOS2ljQ2ZjbGdkTjNmQnUzYXFnRlNzdWJn?=
 =?utf-8?B?a2IyTldNZVB1a1BWWWJCczNQKzl6Y0xSZXNXOEZqU29obWRjMENjbU9uRE5j?=
 =?utf-8?B?dXRheGhkYmYwNHUwNWl3Qll4T3pwdzFRS29BQk5jSlpVczhZc3I2YW9QNU51?=
 =?utf-8?B?UnFKdzg2ckNBdWROS3BvVVZ4TFR5V2tMcjVaU2F5Rk5mTnd1L1NNT08rMnhZ?=
 =?utf-8?B?cHJkRitaZVZLajRtemJOb2N1S201YldXNzFHWStTVEtORGZBT2R2WUJJVEdL?=
 =?utf-8?B?SE1PdFJtenVaSHR5N1BpWllPQm5mdEpWN3FsYVVRUUdKSWRHYXF5L2h6YzQr?=
 =?utf-8?B?NGxybENlOVJZZnVobVc0d3dLYkhoT01uc0l2NVphVnlCMXpXOElWMXIxZDVq?=
 =?utf-8?B?K3VsdjRvT1VXUkcveVpsdDM3TXFuS0k3d3lWRks3RFNuRFh2SDFRM29xcmJD?=
 =?utf-8?B?R2l0YjZqY3BIeGJZdTBjQ0diWXg2RU9NK0E4R0RJd04rWmNXOS9OMmNaZGZj?=
 =?utf-8?B?cG9obUlHR2QzdklHdzBUdG9VTHlBPT0=?=
Content-ID: <628552FBEEECD34C85CCBCE5BECB8B50@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6703402d-4a84-4310-9801-08d9c16a369c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 14:33:37.5895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHNIl78xnARPKO/ThtkOE6OovLbv/HZqKHrIBkIZ/GgZM0h9c4z8nbj8f6wYYknMZHvtKNBaQr6wPzUS3q4nXbwwXLIEWnsgaeDQTvXagNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_063345_645628_F228B5FF 
X-CRM114-Status: GOOD (  28.67  )
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

On 12/17/21 3:44 PM, Tudor Ambarus wrote:
> mx66lm1g45g supports just 1-1-1, 8-8-8 and 8d-8d-8d modes. There are
> versions of mx66lm1g45g which do not support SFDP, thus use
> SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
> interface outputs data always in STR mode for whatever reason. Since
> 8d-8d-8s is not common, avoid reading the ID when enabling the octal dtr
> mode. Instead, read back the CR2 to check if the switch was successful.
> Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v3:
> - resend the patch, this time prefixed with v3
> - drop setting of dummy cycles, use the default value
> - avoid odd lengths in octal dtr mode
> - s/8d-8d-8d/8D-8D-8D
> 
> v2: SPI_NOR_SOFT_RESET as a FIXUP_FLAG
> 
> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> c2853b
> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> macronix
> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/partname
> mx66lm1g45g
> # cat /sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> cat: can't open '/sys/devices/platform/soc/e080c000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp': No such file or directory
> 
>  drivers/mtd/spi-nor/macronix.c | 96 ++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 67aaa83038b6..4c672deb1d1c 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -32,6 +32,95 @@ static struct spi_nor_fixups mx25l25635_fixups = {
>  	.post_bfpt = mx25l25635_post_bfpt_fixups,
>  };
>  
> +#define SPINOR_OP_READ_CR2		0x71
> +#define SPINOR_OP_WRITE_CR2		0x72
> +#define SPINOR_OP_MX_DTR_RD		0xee
> +
> +#define SPINOR_REG_CR2_MODE_ADDR	0
> +#define SPINOR_REG_CR2_DTR_OPI_ENABLE	BIT(1)
> +#define SPINOR_REG_CR2_SPI		0
> +
> +static int spi_nor_macronix_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +	u8 *buf = nor->bouncebuf;
> +	struct spi_mem_op op;
> +	int ret;
> +
> +	/* Set/unset the octal and DTR enable bits. */
> +	if (enable) {
> +		buf[0] = SPINOR_REG_CR2_DTR_OPI_ENABLE;
> +	} else {
> +		/*
> +		 * The register is one byte wide, but the one byte transactions
> +		 * are not allowed in 8D-8D-8D mode. Since there is no register
> +		 * at the next location, just initialize the value to zero and
> +		 * let the transaction go on.
> +		 */

actually CR2 is indexed by address, from 00000000h to 80000000h. And macronix states
that "All addresses not shown in the table must keep value unchanged.". So I should
maybe read what's at address one, and when disabling octal to use the value read,
so that I don't change undefined values. Meh.


> +		buf[0] = SPINOR_REG_CR2_SPI;
> +		buf[1] = 0;
> +	}
> +
> +	op = (struct spi_mem_op)
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRITE_CR2, 1),
> +			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
> +			   SPI_MEM_OP_NO_DUMMY,
> +			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
> +	if (!enable)
> +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +	ret = spi_nor_write_enable(nor);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		return ret;
> +
> +	/* Read back CR2 to make sure the switch was successful. */
> +	op = (struct spi_mem_op)
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_READ_CR2, 1),
> +			   SPI_MEM_OP_ADDR(4, SPINOR_REG_CR2_MODE_ADDR, 1),
> +			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
> +			   SPI_MEM_OP_DATA_IN(enable ? 2 : 1, buf, 1));
> +	if (enable)
> +		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +	ret = spi_mem_exec_op(nor->spimem, &op);
> +	if (ret)
> +		return ret;
> +
> +	if (enable) {
> +		if (buf[0] != SPINOR_REG_CR2_DTR_OPI_ENABLE) {
> +			dev_dbg(nor->dev, "Failed to enable 8D-8D-8D mode.\n");
> +			return -EINVAL;
> +		}
> +	} else if (buf[0] != SPINOR_REG_CR2_SPI) {
> +		dev_dbg(nor->dev, "Failed to disable 8D-8D-8D mode.\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mx66lm1g45g_late_init(struct spi_nor *nor)
> +{
> +	nor->params->octal_dtr_enable = spi_nor_macronix_octal_dtr_enable;
> +
> +	/* Set the Fast Read settings. */
> +	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +				  0, 20, SPINOR_OP_MX_DTR_RD,
> +				  SNOR_PROTO_8_8_8_DTR);
> +
> +	nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
> +	nor->params->rdsr_dummy = 4;
> +	nor->params->rdsr_addr_nbytes = 4;
> +}
> +
> +static struct spi_nor_fixups mx66lm1g45g_fixups = {
> +	.late_init = mx66lm1g45g_late_init,
> +};
> +
>  static const struct flash_info macronix_parts[] = {
>  	/* Macronix */
>  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1)
> @@ -100,6 +189,13 @@ static const struct flash_info macronix_parts[] = {
>  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +	{ "mx66lm1g45g", INFO(0xc2853b, 0, 64 * 1024, 2048)
> +		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SECT_4K |
> +			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
> +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE |
> +			    SPI_NOR_SOFT_RESET)
> +		.fixups = &mx66lm1g45g_fixups,
> +	},
>  };
>  
>  static void macronix_default_init(struct spi_nor *nor)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
