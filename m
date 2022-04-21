Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFA5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m22k8079fzDAlgzluJX5lgU2Yoap2bGraBiSb5hGI1g=; b=lnB6tS7OZJoPyA
	qOt4yExC5h43gCkvkGFKTD5fpQMyVwp1kjpHtOjA4/MffLTmcjQqhcxOu4G+KrxC/lYuW8sTZHbT1
	657POsYxwjozMbWgioiGpYc5kurkOecvjPR96Kl9QJAeH8Iitm/6qECEyx4H5gRZoilT9OsD3jZTG
	qvyORCIXIEhcR+SbeURhOMT5Vs15gjCfsYB3IwVvMWgLZ9DyEsm+0E/C5rcccaohgQQqRR40zGLiq
	7Toq9MF4N6K4dmLAumfYDRrAhDwszsqPObLvX789yKaRCQrDAJrh85DhZtH+KE0ElrPGXxG+ogSwe
	nhBUwEQgtb7mSGg/mowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXmy-00DlsO-IU; Thu, 21 Apr 2022 14:28:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXmr-00DlnH-Ql
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 14:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650551281; x=1682087281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ejrzBK2u2oRQdovc8IZ+rwjdl+bsFjbOMWoZYyYreu4=;
 b=e5ZzWTmxsEQt98aaHcksByIHB5criDIOEk1Leon8Paw0yvSBOSeXUjma
 5Uf+CyXRVYGgReGJ4ls1uL+rmvWpTU04R5UihKVBveLxPuqpEhn0yIN9n
 M0YRwF5CH16m1GSy3j1umdFXQ9vv12pCy0rG+Xs/RL5yfU28761h9Qnz5
 sXdEMjseO33q2MJdk313LSBx8RTc3DKGxptA5BBPAe6LQm2qjw94LZLnW
 zpCUrcc1AZeVQh6zR8SZI3eCd/0/vfEE5iPN/qBn+X729v7vCjEzGCKDl
 TuAd7u/iEbvgllm2GW0DkyqCRBCdmqqGNiaBW86kpbI9ICq8FLS4vmPTm Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="93109164"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 07:28:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 07:27:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 07:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BseXAppR+/KXaYqZyodTRdAj+h8By3IuaAidAWzeU4PxDvrRNy2bwmPeUql8Sfj3Wy17vRMarHle8ActFZjYqiDECxQ50sL4TTGWhWuO8cCipKHZbnUt4AVlWgLEK6mXovIiGRw4LH2xWiYMZV3edSDRIURRVap5Yg0FYzwlGSuSkWDwmozOBtgE9Dngw3N0s+/pAlYye9625MubYAt/yTFXF6GtVUFaoEUx5pc5b2/4A6GQeyNTd/rm3LHW/u1BxVpd4LuaPCoTQ3bCB5IWWRwNgJ/rdohR5WQTbBNOCMRft2cbWCNol3sEPa3+cjVnqCvG0OHtsp9eM3w/w1m6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejrzBK2u2oRQdovc8IZ+rwjdl+bsFjbOMWoZYyYreu4=;
 b=IfxrJRFuqVKJRM56UxmtkW/j9FT9Uje+cvX/sVP9r2iwMt5b7tz5GmymCJWBT44QkOPk4rDJ5bshF8NrA/z5NaKKYMXZSofKGU6QfwsYOqlgFbaxw/mF3+VwSEdAT3XZBDzcuHhJzKCGcaudRhTBcLBR8ukKm8R5Cf2ckn1esoBmtC0TcFfyEOK/5umKj2fBhCMucwt7EuYAqqrIewwacJ91loZMN23Z0rj7CjQ7dgzDI0lxHYGbieGaRZpL9R8zH/l8DpOPt1dJgB+gNI0FzZHDVwAPfaivjeiv6Mn9q9wbrKrgKTREzQZbpTZKhacOUQ7eTgSH7sXReqw4Mfq9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejrzBK2u2oRQdovc8IZ+rwjdl+bsFjbOMWoZYyYreu4=;
 b=u42ONJmsl7xIT9sDTiwKWd11jEq3kCza7pdggrwYAXuv5lke2YFBnAKwlXl8LHA/AjaCGOexvbekZQho2E9gmPX3dtCTd1zXP0DiqDPSX9MxJFmCqS4rXUO9g4pIg7K+SKNAhP2U/qbB4qzq07eDX1qUlSm/xkx9JjgG5cwx56k=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB1901.namprd11.prod.outlook.com (2603:10b6:300:110::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 14:27:48 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:27:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bjorn@mork.no>, <miquel.raynal@bootlin.com>
CC: <ezequiel@vanguardiasur.com.ar>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtdblock: warn if opened on NAND
Thread-Topic: [PATCH] mtdblock: warn if opened on NAND
Thread-Index: AQHYVYv4fJtjUnDJ3E6qWDTepFd7AQ==
Date: Thu, 21 Apr 2022 14:27:47 +0000
Message-ID: <c98f728f-2fef-6174-714e-0d31ebe4c43c@microchip.com>
References: <20220328161108.87757-1-bjorn@mork.no>
In-Reply-To: <20220328161108.87757-1-bjorn@mork.no>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50d55ebc-f3db-48d4-8f6c-08da23a31baa
x-ms-traffictypediagnostic: MWHPR11MB1901:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1901BCA8D440607FB0A16663F0F49@MWHPR11MB1901.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7sHzUJspj20u2WYYGC1Z3nOU/S8hFyz14jWGVglbVavBlSWAJ1Zk/alfyiBTJnkYuOmyreJ9t9ILhXvEDReSSVawgqMcGsmA4Wv9Zu8MuuwkBnnRmu/zQR1ETuqrLhVZMWqdjGsNzG4w7Wt7dIBsMKIs5ZGHPIHEvdnaX+/RialIIBShMga5GNfr53PYlYxtWNZyRriD3XtMtkLeZAUwUDEr535FeElfhQ9ZNTE099ap8NnTAbPe7bBnhciHynwOTKWGV7wPKDCXeqsv0pu8W6aF96wUHYyWtZ5HlkVpoRlHhtNcf08bPh7pzwlgor5KvE7cBMYKDq9XTQ59wMQtyzqD5hQphNKP5lm5IweELrvfnlgRvYvpZz+B0S5PcRzmEeCU3hSY+F48WpJZNmWIFsY0dZe8Eelv3nRijVcJKH46bHTSsAxtYKI6TA6H3NEsHA8KuvlBP/9JlhNkNF4MYnlmha4oWNQ9bxlmdLNaZNcYBzRHk8g7Z3IUMtjimYUZRpY3cX/WoVMB7/o5lvtky2H8DgQGbupeagty6BulbDom677Sbw5PMV3hwwemcZk41zoc/PtGjCHuuN7C/YH9dbZhs4CHBQbTAqY4dFarPUTBgKt+UtZE75LCJ5mG/IYdUHnvBgROu2WHA6qm7DF2lEMtBsdw2cQjppAGUyxcN2iWh7FXn5lpj9ZV0pLayAgCmMA8YBLHWM6dReNvAmDYVvdZLmU1phMtBky+056OzgVXY/zTIS3E8JmZWZKt9WZ2WAFmTi08187n82Foj0hxvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(83380400001)(31696002)(86362001)(26005)(186003)(66556008)(122000001)(71200400001)(64756008)(316002)(110136005)(76116006)(4326008)(36756003)(66476007)(91956017)(54906003)(31686004)(66946007)(66446008)(8676002)(38100700002)(508600001)(53546011)(6486002)(66574015)(6506007)(6512007)(8936002)(38070700005)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGV6WThPL3hCMzJ6ejZwenJHR1ZRUmRrVlY0bWxFaDlXNnZGQ0tFY1Bxd3h6?=
 =?utf-8?B?c1dNZU40NkhGTWtiVGw0ejFwcG9HOWR5RisrMEFOL2dmTENzSEhEMGVNbVZN?=
 =?utf-8?B?M0wzRlVpVGg4MFJDTUhjVUM1Q3ArZGtMZDB3UGRnUnd1eFJKa3QwVHV2SVdC?=
 =?utf-8?B?TDhtb1NnN0lmNkFiNWVYSlhFYnNXT05LeHh2V2ZaYS9yOHFPaU5IazF6MDlq?=
 =?utf-8?B?OW9yTFR0VFc1UGVSNkc3SzJzRXlkcm0vODJzeWp1UGN3dHo5MHQzUk1XdVJL?=
 =?utf-8?B?cUtLdHpzRWl2Z3ZCcHpYc3k4alhScHVFUG5xTTZiS2VURmtKcnFlckxaOUdP?=
 =?utf-8?B?ZTQwYTdudTcvM1lHNWFmVjBrWGFwdjhjb21lT2RKY1B4SzVyQi9RQWVyZUht?=
 =?utf-8?B?RGc1NU9SRjM0RGdzTGh0elNjWThyMzNiS3BEZnlCMWJtSHlvTlFiV0Z6T283?=
 =?utf-8?B?UDlXUTdDL0NWRjNpZWU2VGF6bkJ3V3I4VEVvRENFYVBpYXliVlBjeGQ0bFpi?=
 =?utf-8?B?RGIrNkxuRkk1ZjBwci84dGgwMVZxZStuM21BL3NpRndWSU1KSDJkeWpqZEVQ?=
 =?utf-8?B?M0EyaTArTGhSZmN5L3dYb1ZIdVRtQzJaa2dMM1dBYWgzV2MvVkV0OS9YOXVy?=
 =?utf-8?B?Ty9USDhiTHliZTh0czJrZmtiU2VSMUJsNk51ejE0TU1NMDlOaXE4ZU00Skww?=
 =?utf-8?B?RHVhcUVDdnhGTnZzS2ZzN29KZm9vZVJ1WEdWYW5EQnFLd0s3bkVaSkgzd0Zn?=
 =?utf-8?B?cG1OQkxzck5nWjVBSnBkaDRjbm1ndmtaMi9NRWIrQjFzWFpmMnQ1dzA5QnBM?=
 =?utf-8?B?MVIzeDdRd1JIVm9CSkJjVzc0Z3VySmNZbXJxcXhScmJNMDV0NFI1elZIUVdT?=
 =?utf-8?B?MzdaYmlqU0c3WWVJZS96dTZHaUJLcjlVV2pZZlAxTHdZMndVQnEzNE9kdTZR?=
 =?utf-8?B?ODBINTFKWkdwUTNLS0tiY3o1clEwL2l3NzZaSXR2N0pGeEVVdXNKZzE5cUtK?=
 =?utf-8?B?aU1JbFFiMUx1VmlhN1BCZkRCV09STGI2cXUxa3BHUUgzZWF0YWhucjE2aVFC?=
 =?utf-8?B?L0IzVlR5NWZFYkwweUNxMFNiT0U4Z0c4TjNHYzAxMS8vYW5mYUtkU2hwekNF?=
 =?utf-8?B?dVVCUXdYQ1dRV0FvdnFPU2srK0JLamZicVR4RVNiOWdMWktpbzlTMXljc05s?=
 =?utf-8?B?cmtqc0tHWjNBRVRJNm5xdVhTaVp4cU1xNTg0aE9XKzMya29lYTQwVzRHeU8v?=
 =?utf-8?B?QnROOG16WTE1Smtvb0U1MHFLSGFTOWYrQUhIdWRIbXpwUlJ4a0t6TnUyTUVN?=
 =?utf-8?B?eWhBdjF3dkxRYW5qajdTZnB1SGY2eXQ0SGx5dk9HUFR3RnhvNzZSeVFOYzZo?=
 =?utf-8?B?VUVuWjBlUXkzQXhDazlzMEVEaWc1K3I3dHR5bzRXOUVGbFZpd25FOFR2cFho?=
 =?utf-8?B?WDVLUktnQlRjbWFjSG4zdHJtTVpsUWgwK1hPZCszWlRiRnFKckR6QnBMdGRO?=
 =?utf-8?B?Q3U0ZkdnS1BjYWkzZVhZZGFNaGNEME5QSlhOYXNOeWZCanUzS0sweCtlOC93?=
 =?utf-8?B?SEkraThHclhaR2RDL1IzWnhEakEyK0MzN1FVQVNJUm1ZNG9jYWUvQ3Y2RGp3?=
 =?utf-8?B?T2g2WVZPekUxMnp5YlJ3YW5xMTBtdkRPcm5xTHZiRVE1eXEwa3JBd0tsZC9H?=
 =?utf-8?B?OFQ4UWM0R1oveVdiZmljZHcvdW00ZEFobWRCWFpOa0UrbVE3QTg0SnN5UWt0?=
 =?utf-8?B?M3FhYit1SUhyTk5EUVdsbk1PajlST0tVQzdOWGpya2ZrR2ZJaVFYMTlJTm0x?=
 =?utf-8?B?Z2luaWFnTUE5dXpSeE5tY2cwUjNycmdXc1ZvMzlzRjdIQmx2NlNQQXE2Ty9N?=
 =?utf-8?B?R2kxcndnQWxaYVkrMG94aGlzMlNTb0FyU3cxVW1Vc3ZKaWYrU3JYak9kVVNp?=
 =?utf-8?B?a1V5WU1aSEZFRFB3M3I4RHU2dlVLdEdGSW1WdEozUk1URmVIUXZMemN3YTlM?=
 =?utf-8?B?WlV3aXBqbmh2cGttUDQycjQ5RzFWVTJHTFM0QUpoSHh2eTI5Q3g1bUhyaGhl?=
 =?utf-8?B?M2dKL1Q4MGhnV3RjVUxwdmJOSlpZc0pTZExLNTFDQU04Yk5YSFRiZmN4bFBm?=
 =?utf-8?B?TVZnem5HdXdEVkRxZE5XSHU5aS8xdjF0K2hXZThRU2JrZ1N6Z21pRmdBZ2Vz?=
 =?utf-8?B?cWh0cDYzNGFxVDZwM3FNajEyc0cybzNxT2tIc3VUL3dBaWxYK2dOQklJcW5r?=
 =?utf-8?B?elJIb3NMdExFVUtIU1Vwa1JjK1JqS0FlUnJkbkxqQnNoZTdSYVBOZmpiSXov?=
 =?utf-8?B?cDNwOGw1UE9CNDhVbzk4M3o4ODJpdHRmT0l3MGk0UHlta3lZOHg3VFRhRytN?=
 =?utf-8?Q?zWEJbb4r/Fsa8bGE=3D?=
Content-ID: <9C81D72A3486E64BADC57D04022E4450@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d55ebc-f3db-48d4-8f6c-08da23a31baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 14:27:47.6994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zpuayk+sWeGEv5kbDJd73Jlgk4AD9DMrUMH/3EtiXB7hmKQVI2AzjSo8LaLJomLHzwvvifkEM/DojWLqTF2f9hqHkxFuwU+RrnqrR8l67mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_072802_271257_5848D9FA 
X-CRM114-Status: GOOD (  31.63  )
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

T24gMy8yOC8yMiAxOToxMSwgQmrDuHJuIE1vcmsgd3JvdGU6DQoNCkhpLCBCasO4cm4hDQoNCj4g
V2FybmluZyBvbiBldmVyeSB0cmFuc2xhdGVkIG10ZCBwYXJ0aXRpb24gcmVzdWx0cyBpbiBleGNl
c3NpdmUgbG9nIG5vaXNlDQo+IGlmIHRoaXMgZHJpdmVyIGlzIGxvYWRlZDoNCj4gDQo+ICAgbmFu
ZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENoaXAgSUQ6IDB4ZjENCj4g
ICBuYW5kOiBNYWNyb25peCBNWDMwTEYxRzE4QUMNCj4gICBuYW5kOiAxMjggTWlCLCBTTEMsIGVy
YXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZTogMjA0OCwgT09CIHNpemU6IDY0DQo+ICAgbXQ3
NjIxLW5hbmQgMWUwMDMwMDAubmFuZDogRUNDIHN0cmVuZ3RoIGFkanVzdGVkIHRvIDQgYml0cw0K
PiAgIHJlYWRfYmJ0OiBmb3VuZCBiYnQgYXQgYmxvY2sgMTAyMw0KPiAgIDEwIGZpeGVkLXBhcnRp
dGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIG10NzYyMS1uYW5kDQo+ICAgQ3Jl
YXRpbmcgMTAgTVREIHBhcnRpdGlvbnMgb24gIm10NzYyMS1uYW5kIjoNCj4gICAweDAwMDAwMDAw
MDAwMC0weDAwMDAwMDA4MDAwMCA6ICJCb290bG9hZGVyIg0KPiAgIG10ZGJsb2NrOiBNVEQgZGV2
aWNlICdCb290bG9hZGVyJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2Nr
IGRldmljZXMgaW5zdGVhZC4NCj4gICAweDAwMDAwMDA4MDAwMC0weDAwMDAwMDEwMDAwMCA6ICJD
b25maWciDQo+ICAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ0NvbmZpZycgaXMgTkFORCwgcGxlYXNl
IGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuDQo+ICAgMHgwMDAwMDAx
MDAwMDAtMHgwMDAwMDAxNDAwMDAgOiAiRmFjdG9yeSINCj4gICBtdGRibG9jazogTVREIGRldmlj
ZSAnRmFjdG9yeScgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIFVCSSBibG9jayBkZXZp
Y2VzIGluc3RlYWQuDQo+ICAgMHgwMDAwMDAxNDAwMDAtMHgwMDAwMDIwMDAwMDAgOiAiS2VybmVs
Ig0KPiAgIG10ZGJsb2NrOiBNVEQgZGV2aWNlICdLZXJuZWwnIGlzIE5BTkQsIHBsZWFzZSBjb25z
aWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLg0KPiAgIDB4MDAwMDAwNTQwMDAw
LTB4MDAwMDAyMDAwMDAwIDogInViaSINCj4gICBtdGRibG9jazogTVREIGRldmljZSAndWJpJyBp
cyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4N
Cj4gICAweDAwMDAwMjE0MDAwMC0weDAwMDAwNDAwMDAwMCA6ICJLZXJuZWwyIg0KPiAgIG10ZGJs
b2NrOiBNVEQgZGV2aWNlICdLZXJuZWwyJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcg
VUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4NCj4gICAweDAwMDAwNDAwMDAwMC0weDAwMDAwNDEw
MDAwMCA6ICJ3d2FuIg0KPiAgIG10ZGJsb2NrOiBNVEQgZGV2aWNlICd3d2FuJyBpcyBOQU5ELCBw
bGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmljZXMgaW5zdGVhZC4NCj4gICAweDAw
MDAwNDEwMDAwMC0weDAwMDAwNTEwMDAwMCA6ICJkYXRhIg0KPiAgIG10ZGJsb2NrOiBNVEQgZGV2
aWNlICdkYXRhJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRldmlj
ZXMgaW5zdGVhZC4NCj4gICAweDAwMDAwNTEwMDAwMC0weDAwMDAwNTIwMDAwMCA6ICJyb20tZCIN
Cj4gICBtdGRibG9jazogTVREIGRldmljZSAncm9tLWQnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRl
ciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0ZWFkLg0KPiAgIDB4MDAwMDA1MjAwMDAwLTB4
MDAwMDA1MjgwMDAwIDogInJlc2VydmUiDQo+ICAgbXRkYmxvY2s6IE1URCBkZXZpY2UgJ3Jlc2Vy
dmUnIGlzIE5BTkQsIHBsZWFzZSBjb25zaWRlciB1c2luZyBVQkkgYmxvY2sgZGV2aWNlcyBpbnN0
ZWFkLg0KPiAgIG10a19zb2NfZXRoIDFlMTAwMDAwLmV0aGVybmV0IGV0aDA6IG1lZGlhdGVrIGZy
YW1lIGVuZ2luZSBhdCAweGJlMTAwMDAwLCBpcnEgMjENCj4gDQo+IFRoaXMgaXMgbW9yZSBsaWtl
bHkgdG8gYW5ub3kgdGhhbiB0byBoZWxwIHVzZXJzIG9mIGVtYmVkZGVkIGRpc3Ryb3Mgd2hlcmUN
Cj4gdGhpcyBkcml2ZXIgaXMgZW5hYmxlZCBieSBkZWZhdWx0LiAgTWFraW5nIHRoZSBibG9ja2Rl
dnMgYXZhaWxhYmxlIGRvZXMNCj4gbm90IGltcGx5IHRoYXQgdGhleSBhcmUgaW4gdXNlLCBhbmQg
d2FybmluZyBhYm91dCBib290bG9hZGVyIHBhcnRpdGlvbnMNCj4gb3Igb3RoZXIgZGV2aWNlcyB3
aGljaCBvYnZpb3VzbHkgbmV2ZXIgd2lsbCBiZSBtb3VudGVkIGlzIG1vcmUgY29uZnVzaW5nDQo+
IHRoYW4gaGVscGZ1bC4NCj4gDQo+IE1vdmUgdGhlIHdhcm5pbmcgdG8gb3BlbigpLCB3aGVyZSBp
dCB3aWxsIGJlIG9mIG1vcmUgdXNlIC0gYWN0dWFsbHkgd2FybmluZw0KPiBhbnlvbmUgd2hvIG1v
dW50cyBhIGZpbGUgc3lzdGVtIG9uIE5BTkQgdXNpbmcgbXRkYmxvY2suDQo+IA0KPiBGaXhlczog
ZTA3NDAzYThjNmJlICgibXRkYmxvY2s6IFdhcm4gaWYgYWRkZWQgZm9yIGEgTkFORCBkZXZpY2Ui
KQ0KPiBTaWduZWQtb2ZmLWJ5OiBCasO4cm4gTW9yayA8Ympvcm5AbW9yay5ubz4NCj4gLS0tDQo+
IEkgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGFib3V0IHRoZSBtdGRibG9ja19ybyBwYXJ0IG9mIHRo
ZSBvcmlnaW5hbA0KPiBwYXRjaCBzaW5jZSBpdCBkb2Vzbid0IGhhdmUgYW4gb3BlbiBob29rLiBB
ZGRpbmcgb25lIGp1c3QgdG8gcHJpbnQNCj4gdGhpcyB3YXJuaW5nIHNlZW1zIGEgYml0IGxpa2Ug
b3ZlcmtpbGwuLi4gIE1heWJlIGp1c3QgZHJvcCB0aGUNCj4gd2FybmluZyB0aGVyZT8gV2hhdCBo
YXJtIGlzIHRoZXJlIGFjY2Vzc2luZyBOQU5EIGRldmljZXMgYW55d2F5Pw0KPiANCj4gTGVhdmlu
ZyB0aGF0IGRlY2lzaW9uIHVwIHRvIHlvdSBleHBlcnRzIDotKQ0KPiANCj4gSSdkIHJlYWxseSBs
aWtlIHRvIHNlZSB0aGlzIGZpeCBnZXQgaW50byBzdGFibGUgYmVmb3JlIHRoZSBtYXNzZXMNCg0K
SSBkb24ndCBzZWUgdGhpcyBhcyBhIGZpeCwgeW91IGp1c3QgbWFzayBvdXQgdGhlIHdhcm5pbmcs
IHlvdSBhc3N1bWUNCnRoYXQgbXRkYmxvY2sgaXMgbm90IHVzZWQgYnV0IHlvdSBzdGlsbCBrZWVw
IGl0IGluIHlvdXIgY29uZmlnLCB3aGljaA0KaXMgd3JvbmcuIFlvdSBzaG91bGQgaW5zdGVhZCB1
cGRhdGUgeW91ciBjb25maWcsIHJlbW92ZSBtdGRibG9jaywgYW5kDQpmaXggdGhlIGNhdXNlIGlm
IGl0J3MgcG9zc2libGUuDQoNCj4gc3RhcnQgbm90aWNpbmcgbm93IHRoYXQgT3BlbldydCBpcyBt
b3ZpbmcgdG8gNS4xNS4gIEFzIHlvdSBtYXkgb3INCj4gbm90IGtub3csIE9wZW5XcnQgdW5jb25k
aXRpb25hbGx5IGluY2x1ZGVzIG10ZGJsb2NrIHdoZXRoZXIgdGhlDQo+IHRhcmdldCBpcyBOQU5E
IG9yIE5PUi4gIFNvIHRoaXMgd2lsbCBjYXVzZSBsb3RzIG9mIG5vaXNlIG9uIGFueQ0KDQpXaHkg
ZG9lcyBPcGVud3J0IGluY2x1ZGUgbXRkYmxvY2s/DQoNCkkgaGF2ZSBlbmNvdW50ZXJlZCB0aGVz
ZSBtZXNzYWdlcyBpbiBzb21lIGNvbmZpZ3MgdGhhdCBJJ20gdXNpbmcgYW5kIEkNCmVuZGVkIHVw
IGNsZWFuaW5nIHRoZW0uIFRoZXNlIG1lc3NhZ2VzIGhlbHBlZCBtZSBpZGVudGlmeSB0aGUgcHJv
YmxlbSBhbmQNCnVsdGltYXRlbHkgdG8gZml4IGl0LiBMZXQncyBnaXZlIG90aGVycyB0aGUgY2hh
bmNlIHRvIGRvIHRoZSBzYW1lLg0KDQpDaGVlcnMsDQp0YQ0KPiBOQU5EIE9wZW5XcnQgZGV2aWNl
Lg0KPiANCj4gDQo+IEJqw7hybg0KPiANCj4gIGRyaXZlcnMvbXRkL210ZGJsb2NrLmMgfCA4ICsr
KystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGJsb2NrLmMgYi9kcml2ZXJzL210
ZC9tdGRibG9jay5jDQo+IGluZGV4IDAzZTNkZTNhNWQ3OS4uMWU5NGU3ZDEwYjhiIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRibG9jay5jDQo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGJs
b2NrLmMNCj4gQEAgLTI1Nyw2ICsyNTcsMTAgQEAgc3RhdGljIGludCBtdGRibG9ja19vcGVuKHN0
cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICptYmQpDQo+ICAJCXJldHVybiAwOw0KPiAgCX0NCj4gIA0K
PiArCWlmIChtdGRfdHlwZV9pc19uYW5kKG1iZC0+bXRkKSkNCj4gKwkJcHJfd2FybigiJXM6IE1U
RCBkZXZpY2UgJyVzJyBpcyBOQU5ELCBwbGVhc2UgY29uc2lkZXIgdXNpbmcgVUJJIGJsb2NrIGRl
dmljZXMgaW5zdGVhZC5cbiIsDQo+ICsJCQltYmQtPnRyLT5uYW1lLCBtYmQtPm10ZC0+bmFtZSk7
DQo+ICsNCj4gIAkvKiBPSywgaXQncyBub3Qgb3Blbi4gQ3JlYXRlIGNhY2hlIGluZm8gZm9yIGl0
ICovDQo+ICAJbXRkYmxrLT5jb3VudCA9IDE7DQo+ICAJbXV0ZXhfaW5pdCgmbXRkYmxrLT5jYWNo
ZV9tdXRleCk7DQo+IEBAIC0zMjIsMTAgKzMyNiw2IEBAIHN0YXRpYyB2b2lkIG10ZGJsb2NrX2Fk
ZF9tdGQoc3RydWN0IG10ZF9ibGt0cmFuc19vcHMgKnRyLCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkN
Cj4gIAlpZiAoIShtdGQtPmZsYWdzICYgTVREX1dSSVRFQUJMRSkpDQo+ICAJCWRldi0+bWJkLnJl
YWRvbmx5ID0gMTsNCj4gIA0KPiAtCWlmIChtdGRfdHlwZV9pc19uYW5kKG10ZCkpDQo+IC0JCXBy
X3dhcm4oIiVzOiBNVEQgZGV2aWNlICclcycgaXMgTkFORCwgcGxlYXNlIGNvbnNpZGVyIHVzaW5n
IFVCSSBibG9jayBkZXZpY2VzIGluc3RlYWQuXG4iLA0KPiAtCQkJdHItPm5hbWUsIG10ZC0+bmFt
ZSk7DQo+IC0NCj4gIAlpZiAoYWRkX210ZF9ibGt0cmFuc19kZXYoJmRldi0+bWJkKSkNCj4gIAkJ
a2ZyZWUoZGV2KTsNCj4gIH0NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
