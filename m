Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0D9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WunK7dcWU+J1jBvoX2DI7sApmaqItVNd4CqZOyEPrgU=; b=0CWt/Pr4yaxEZD
	2R+lrmoYRg158OPDDKBYGrz60czDYUC3oBBMumghn/1A3TR3wxjnmkL/U86x3E6hdto68PWyWv4IK
	emm9GsvX/3/BWYoRq/BjlZN70GXhPeGrFt/69FzbF4V/BqXgiaphFa9z+JB1rhpKpC+3UhdNfMvz2
	RB/5zlIQrnZj8o6KXMy6856Ls3TOBu0tkyzo/cvylyYJMDl0nbwUOZtydVbo/wzFskDopJTYeN+a4
	9IFijVyNK8zS2KhKkvMvyZgSGpAVzXggPskfH3yjk0hXLiVQWAr5o8hLlh0RkJzogST/kuytyFE02
	4Qxh/KNGV5p+r2LrkPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnNP-006omp-Rz; Thu, 03 Mar 2022 15:28:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnNL-006olG-Jr; Thu, 03 Mar 2022 15:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646321299; x=1677857299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TmWl9GuiYO9cXEK4aWhfHreDMJOB6/o4xgx90gaXA84=;
 b=ykNztsKarvMzGW4+0Oi+NNlC5G8fgbH33PJXK2rzoGm0fzDfR6vA9ou+
 hLInjJzCyeJQ7Et4SBRt5t7+SGvv0yFklfo8Qdo0ADGRryLta9mk788Bo
 ElqGjU/p75fHQUcqIoWWFc/sSMwaT/RmMgHScPdcKz79KB+JhigHjy7Ke
 GJEeTgsLe6IJ5t2PX2bURvE5QIpQUzyxuSCxR07Lf0jolF9rWYE/7cjBu
 Xu3d+pPsqVa1hSa3AFyAOKgOntF9+bVNRQsmLaeq7j8dzkVQ+0BJB5zf8
 3xi/nuilJ4tynalLiGh7wlgZaY/UD0YFFsX8OzMeGYXnP7jOE3YU20Dqx Q==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; d="scan'208";a="164400213"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 08:28:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 08:28:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 3 Mar 2022 08:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOG5NGL5jgrkh3lJ2EW2zZKW6RAU7/5W9rSqr70p6IYvTa2BhOZch0wz2b/YSSiSXRTNNcZqScVPb62t4o05KCeaa4u18oh3lOuAzqVWomTHPjvD4xVb7XHC2WtEqPLxmPfbmfsu8ZHCetKYOpbeQ//yKE2782edagBhD2rzh9YCciL6PAWeCA4nIz/HIzrgcx/FMQ3fPsMl8U5PfFSBy0z18tdYCW2a18qfKrvArlTtQ97zyOV+Y/f/IumxlsLOZX46zlc9OOYC5JnsHGZzbRDp3Y5a6goHiZ98o0V4OkulZ3Wlt5NUvmB7Dt6lgJRNMGg5RUlCKD0354K4JVzEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmWl9GuiYO9cXEK4aWhfHreDMJOB6/o4xgx90gaXA84=;
 b=J3DB4Ror9sd/39o3Tn/vWt5ADuDusWxTFC+xqQO2XcNsK2aICfQEAYwIPlk0oDMXQJsHPFZWSYJ9vOqcZZVSsHQurOrLVd7uanKScTcDFR5iGKuOz+VZ+zpaJBthtF3hRT0dwaMmvtkDA/25T9DRw2dll127QwiOxjcPulSmcCWp6nDhCNyeBC5cxaY70WZhl2N/S0QX8v1jQN8q4JocxCj7QE+jQQSqxQBgDaizjjCEafRXYoq99jG0FyvfsMbfU4PIsOZnzHJsg/jEy5X6i3nmbv5ou4HoJOFcFy6PT/QdDciLDSl27hqDkXvwYBJ25KpekkXnmpGXJZe5f4couw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmWl9GuiYO9cXEK4aWhfHreDMJOB6/o4xgx90gaXA84=;
 b=ncgNGvJk1U7SK+aw5bHq4ZAC6WzNAQ8RybXALb9oegfNEXIssRK0pewDDtO9kbvjR9dAwWGd7eEY2d0DkZVr0mk6/y0NEX6RgoKlmL889CRYtY/5sghphhbb+R/I2bJt6vBaFmohab44VUZqlF0iv2OOS/ClWgxiUbzkKFvqePw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4096.namprd11.prod.outlook.com (2603:10b6:208:138::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:28:16 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 15:28:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Topic: [PATCH v4 3/6] mtd: spi-nor: macronix: Handle ID collision b/w
 MX25L3233F and MX25L3205D
Thread-Index: AQHYLxNMl8kMKtyI+kCoNw9FsSFeXg==
Date: Thu, 3 Mar 2022 15:28:15 +0000
Message-ID: <d6e3dae6-fc46-1697-e496-33ab11469807@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-4-tudor.ambarus@microchip.com>
 <67810d13180a2718ad7ccc28815d2894@walle.cc>
In-Reply-To: <67810d13180a2718ad7ccc28815d2894@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8b7352-be60-49da-f6fd-08d9fd2a700c
x-ms-traffictypediagnostic: MN2PR11MB4096:EE_
x-microsoft-antispam-prvs: <MN2PR11MB409670305FB94D06CC9497AEF0049@MN2PR11MB4096.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AcbvuM6T2vfvPMtiJIMBmxhTJuGZZTAoGld7FAG+DyDa4fl9PvYXqPeYgRp6MiRzGkUZ0YIvWK5L9gCaRVMxC2nM7dBiCK0HSWM71ofptyEmd517q94EMMLMXzt093Mzpmw0Ywzp2TvesaXEHfLXlhsy6EqmlRhVEnkvBkdam6fESdCI9+jqRgWzVzbxGLDttWwkLP0zVNtn1VaR6bZg+IvU+OvQZ5YlW9IZsOSMahBj1grD4V6KsgYQtoOjRmuYcujofn0hTI1/6b+mZ2457HsyPxbU7PzZzQbMRbo+eDxeu2bTKxtpPvKyzLkUCT6hckBqmeOOnLArHIJDFhLawf+QUj34BK+gkV8TziogPU+E647Ge4MC+NGyG7DgmRQ51TaUTAO9mRWrEqPxRag22RjvrGAYhqMFMNawdqud3EK+wv1ziMQxe28K3sQVDd697stxnyO4Vd3EooEixpqC44p08WgrRr1mBGlCT71d4h5omnxHpHB5y7tP8lQMqmNTRnHGP43k7lzsJfazoLEJPmEipH9s3UzqjTVa/zKhvpUspMc15Rd914WfgY107AQ7aWrXqncKBRqf8m8hqigdVFp31sml7FmTqX9Ho71M5D9/ddxTpZ9d+Y2kBT5EYAqLfD6fhq0GT26BFNW7nL+OPq9HKev3zLEAI3aKYCD5/9UfMBU0d0nr6iSONl0Bkrrh+uTRhQMWm6cX+O5a0emt8IO23My1rtAtZYeKpYh3xZ2/udDBVCJ3exz/12M1hTf/7WKyIQ2RGTM5EU+05BGTDV8ZfVIJjCQZBwvoFzIQlfIjOJcFvqrTmSNYFBYoEndkp/0HCYbJ0Aq1x1y96zKZRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(54906003)(7416002)(6916009)(316002)(36756003)(8936002)(2906002)(4326008)(76116006)(66946007)(91956017)(64756008)(8676002)(66446008)(66476007)(66556008)(508600001)(5660300002)(71200400001)(122000001)(6506007)(6512007)(31696002)(53546011)(86362001)(31686004)(83380400001)(186003)(26005)(6486002)(2616005)(107886003)(38070700005)(43740500002)(45980500001)(414714003)(473944003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3lrdDBydjN0bzJuZVM3bGRzQTVOczhGQW9oY3JvZUw5Y2V6RjVPZ0xHWkp4?=
 =?utf-8?B?ZUZXdS8zR1pKRkJjbW5Oc09qd05ZRlJDcGxiUUozaDJ1dUkyV0YrV3NuVFBi?=
 =?utf-8?B?UXlhc0trbFAwY0VNL1U5VUl6bnlXWisrV0pVcDgwWktoTW5qZ016MzJYbStT?=
 =?utf-8?B?UWMvZjNJWEhUcnZzSE5scENGeFJQKzZvNUdubTQ5TXcyWTNzK01iQTh5MU43?=
 =?utf-8?B?K0YrVDk1OWZuK3p0Y1NrUGRBM2pkRE1MYU9WWE9QRWJ2d3lJNW9RK0V5UVZI?=
 =?utf-8?B?RG1MWG52STF1aWlXb0lMeS9GVFVxWnVoTnNKUjJWS1ZvTm11c1F0bmx6bHo5?=
 =?utf-8?B?VU5qN0N3KzhqRXBMR1hzL0diaG42SjlxWG9uRjRRVytaOWNzUDBYMjZyK0dl?=
 =?utf-8?B?bnZBWWd3WThtKzFtdURrOG91aS9OMVRPVmc3UFYzbS92SWN3dlJpMTdPRmhN?=
 =?utf-8?B?akVPdkpETEZ6UTdoVHRtZnFrbzBKMGEzOTEyRm5BTTdPWWhzbDcxZ3dyamVP?=
 =?utf-8?B?SitQR3JISnVEd0MvbERTM3hacXBTMFhoS1d4aHk0UklKRWZUdmpwVWZiVmhV?=
 =?utf-8?B?MXd5MzkrVldBWUpEWE5OM0IwU1Z3bEhRUG14MHhoOVNLa05abjluS0kxMU1s?=
 =?utf-8?B?Q3VqZFBWc0RFWXQ3L0JrMzdzY0pkcGdkNkdJTVRWUHNPMzlaM1JYYW9iaGdn?=
 =?utf-8?B?YTQxVzAxd1V6Wmpzazc2RzV2cmZ1NnQ0b1Bvem1qS3dZTDJwcUlNSTJMZ3c2?=
 =?utf-8?B?c1VacGtPeHdmbXcxd0ZXOVZoVnp5OURGZ3E1K2pUY2lnK25GRG5EMWFyVUNC?=
 =?utf-8?B?U21qWmp0eVZPZ1BhdFlzaGJmaTNrUnIxMDIrVjhHTWU5QTd6VE9Ob1AzVElH?=
 =?utf-8?B?OTVOcGJYajNsWElYWTZab0xLd1dzc3hBbmJabmxMWmFCQU4rOUxMeWsvc1hM?=
 =?utf-8?B?dFhLeDNmVUMxaE41VmsvZVFVWTlHdkp5cC9DWEx6L2lvb1pjRFAzRVE0VTlj?=
 =?utf-8?B?NGNJc3ErVGlyNHpGSEg2aEdWTzlRZm9xNE5hS2FQWDhKZk1DY0RmSVJscDZk?=
 =?utf-8?B?cDhCa2tzLzJGMlk1RUhkRHBBbDltZEpxSDE0bnFyNkdUMkVtbkNOeHdWY1p0?=
 =?utf-8?B?UGd5Vmxsd1lrT3BoSjRFQ1VaazFGdTg5VjNnbEY5MncxZWs2NzM1aFRCUVNx?=
 =?utf-8?B?UTVuK3V3UXc2ejhWd1ZYYUZRMU91VDRnMEh1WllMUUladGpIL25FZEpET2dN?=
 =?utf-8?B?TGs2QitTZldJclc4T2xVSE85SXlhTmZEakh4bHJOVEVQSHFIMlAyMWNOVmtM?=
 =?utf-8?B?TzZ2bmFFUWI2MHliT2YzemdOYlhQNm1US3I1M1lZMkRWRkplS1lyQ1BvaEhz?=
 =?utf-8?B?N3BaUGY3eHkvTFhQU3IrUzF0NEszVUN4M2kySVNzemZSc2RBckdRL3dOMXRm?=
 =?utf-8?B?VmdDdHQrYk5obHBQeFViZ0F4eTRsdEVMbjVHemNRRXNqSWpSZE9jNFdtY2lD?=
 =?utf-8?B?Zld2aXF5dFFUdjdMRHFDbGFuSmpjcVgreXRuaGpSMm5yYjFscVM0MFR1RHdL?=
 =?utf-8?B?ejZLOVpIQjZqTjFKT0pTTVBXQUI3dWVBNkE5QTJqQ0Y5Rll3ckpKZXU0cXRp?=
 =?utf-8?B?ZEcwa0t3RjIveEZlWVFRallYdGZtMG1WQ1ZyTmh1QXlXdnNlbDNTdDFURFhz?=
 =?utf-8?B?bDFId1JzY1RyRERXR2oyanJvNElhWjYwbVVjQmdHangyOGZPVmQvMDBLbndm?=
 =?utf-8?B?bXl6Y01ua2RqUTBxdUdTQW1WOFNqYjg1SUI3WXBmRlgvRWErSWJmVUN2bk5L?=
 =?utf-8?B?TVpxQ1U4RjBhTkhxV2N6OVlzUVpieGlXM2cwUlpvNFlpUlBETzlhdTBHNG5j?=
 =?utf-8?B?cjZsdGs5ZU9mY3YyOUtMUFlBdDNHK0tWaVZlUDZjeTV5WE11V255Z202L1Vz?=
 =?utf-8?B?Q3hxaEFuT3czR0dBdEs3Wm9ZY1dLcUo5dkhTZUpBa2w3R2FndVRiZElLb21z?=
 =?utf-8?B?YmF3alNidFdJaVcrTUkvd2xNSmJGRk1TTkR1ZG1CODJNUkkvcytUZkZFQk4x?=
 =?utf-8?B?TnRaV05iUGNDcjhxTVJUdjJHbUNtd0pJZGlMYWVyOERObmhsWDhJUE5zWEFC?=
 =?utf-8?B?QTkwb1pWa0tESFM5bllwdFZ1eVdyYmgyNkl5K0dYeXdRSXQ5ckFjUmJaOFdm?=
 =?utf-8?B?MHFrM3d1U09OMzBWclIvSGtFaFY4UjFsTjVST2t4QXdLektrdFB3Wm4rdlVW?=
 =?utf-8?B?M0tKUitWd0lva0Z6cFhWblc0Zmx3PT0=?=
Content-ID: <50A1EDD98AA1A947A151FAEB033BDF6E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8b7352-be60-49da-f6fd-08d9fd2a700c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:28:15.9206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OhBkXAEybFdRHXjL3VRwjYtV4vJjurMXSKuxTuOlLaMX10y7WT4YOWtsksBEdUuuaTg/HN97OuR5lnlPhySlQi0c+TsAQxxFQKmXKdl8/WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_072819_756066_68185990 
X-CRM114-Status: GOOD (  21.97  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xLzIyIDIzOjU3LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDItMjggMTQ6NDUsIHNjaHJpZWIgVHVk
b3IgQW1iYXJ1czoNCj4+IE1hY3Jvbml4IGhhcyBhIGJhZCBoYWJiaXQgb2YgcmV1c2luZyBmbGFz
aCBJRHMuIFdoaWxlIE1YMjVMMzIzM0YNCj4+IHN1cHBvcnRzDQo+PiBSRFNGRFAgb3Bjb2RlLCBN
WDI1TDMyMDVEIGRvZXMgbm90IHN1cHBvcnQgaXQgYW5kIGRvZXMgbm90IHJlY29tbWVuZA0KPj4g
aXNzdWluZyBvcGNvZGVzIHRoYXQgYXJlIG5vdCBzdXBwb3J0ZWQgKCJJdCBpcyBub3QgcmVjb21t
ZW5kZWQgdG8gYWRvcHQNCj4+IGFueSBvdGhlciBjb2RlIG5vdCBpbiB0aGUgY29tbWFuZCBkZWZp
bml0aW9uIHRhYmxlLCB3aGljaCB3aWxsDQo+PiBwb3RlbnRpYWxseQ0KPj4gZW50ZXIgdGhlIGhp
ZGRlbiBtb2RlLiIpLg0KPj4NCj4+IFdlIHRlc3RlZCB0aGUgUkRTRkRQIG9uIHRoZSBNWDI1TDMy
MDVEIGFuZCB0aGUgY29uY2x1c2lvbiBpcyB0aGF0IHRoZQ0KPj4gZmxhc2ggZGlkbid0IHJlcGx5
IGFueXRoaW5nLiBHaXZlbiB0aGF0IGl0IGlzIHVubGlrZWx5IHRoYXQgUkRTRkRQIHdpbGwNCj4+
IGNhdXNlIGFueSBwcm9ibGVtcyBmb3IgdGhlIG9sZCBNWDI1TDMyMDVELCBkaWZmZXJlbnRpYXRl
IGJldHdlZW4gdGhlDQo+PiB0d28NCj4+IGZsYXNoZXMgYnkgcGFyc2luZyBTRkRQLg0KPj4NCj4+
IFRlc3RlZCBNWDI1TDMyMzNGLiBHZW5lcmF0ZWQgYSAyNTYgS2J5dGUgcmFuZG9tIGRhdGEgYW5k
IGRpZCBhbiBlcmFzZSwNCj4+IHdyaXRlLCByZWFkIGJhY2sgYW5kIGNvbXBhcmUgdGVzdC4gVGhl
IGZsYXNoIHVzZXMgZm9yIHJlYWRzDQo+PiBTUElOT1JfT1BfUkVBRF8xXzRfNCAweGViLCBmb3Ig
ZXJhc2VzIFNQSU5PUl9PUF9CRV80SyAweDIwLCBhbmQgZm9yDQo+PiB3cml0ZXMNCj4+IFNQSU5P
Ul9PUF9QUCAweDAyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9y
LmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+IEFja2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cC55
YWRhdkB0aS5jb20+DQo+PiAtLS0NCj4+ICPCoCBjYXQNCj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9y
bS9haGIvYWhiOmFwYi9mMDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9y
L2plZGVjX2lkDQo+PiBjMjIwMTYNCj4+ICMgY2F0DQo+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0v
YWhiL2FoYjphcGIvZjAwMjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvc3BpLW5vci9t
YW51ZmFjdHVyZXINCj4+IG1hY3Jvbml4DQo+PiAjIGNhdA0KPj4gL3N5cy9kZXZpY2VzL3BsYXRm
b3JtL2FoYi9haGI6YXBiL2YwMDIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1u
b3IvcGFydG5hbWUNCj4+IG14MjVsMzIzM2YNCj4+ICMgY2F0DQo+PiAvc3lzL2RldmljZXMvcGxh
dGZvcm0vYWhiL2FoYjphcGIvZjAwMjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvc3Bp
LW5vci9zZmRwDQo+PiA+IG14MjVsMzIzM2Ytc2ZkcA0KPj4NCj4+DQo+PiAjIHh4ZCAtcCBteDI1
bDMyMzNmLXNmZHANCj4+IDUzNDY0NDUwMDAwMTAxZmYwMDAwMDEwOTMwMDAwMGZmYzIwMDAxMDQ2
MDAwMDBmZmZmZmZmZmZmZmZmZg0KPj4gZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZTUyMGYxZmZmZmZmZmYwMTQ0ZWIwODZiDQo+PiAwODNiMDRiYmVlZmZmZmZmZmZmZjAwZmZm
ZmZmMDBmZjBjMjAwZjUyMTBkODAwZmZmZmZmZmZmZmZmZmYNCj4+IGZmZmZmZmZmZmZmZjAwMzY1
MDI2OWNmOTc3NjRmZWNmZmZmZmZmZmZmZmZmDQo+IA0KPiBJcyBxdWFkIGVuYWJsZSB3b3JraW5n
IG9yIGhhcyB0aGlzIHRoZSBzYW1lIHByb2JsZW0gYXMNCj4gdGhlIG1hY3Jvbml4IGZsYXNoIGlu
IHBhdGNoIDQ/IEp1ZGdpbmcgYnkgdGhlIGxlbmd0aCBvZiB0aGUgU0ZEUA0KPiB0aGlzIGFsc28g
bGFja3MgdGhlIHJlcXVpcmVkIGluZm9ybWF0aW9uIHRvIHNlbGVjdCBhbg0KPiBhcHByb3ByaWF0
ZSBlbmFibGUgbWV0aG9kLiBJIGhhdmVuJ3QgaGFkIGNsb3NlciBsb29rIHRob3VnaC4NCg0KaXQg
d29ya2VkLCB5ZXMuIEFzIEkgc3BlY2lmaWVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgSSB0ZXN0
ZWQgaXQgYW5kIGl0IHVzZWQNClNQSU5PUl9PUF9SRUFEXzFfNF80IDB4ZWIgb3Bjb2RlIGZvciBy
ZWFkcy4NCg0KPiANCj4+DQo+PiAjIHNoYTFzdW0gbXgyNWwzMjMzZi1zZmRwDQo+PiAxYjZlMGY3
NWI0YTZkMDhkNTcwMDgyOTkyNDU1YWZmYTcyYjJkYzgxwqAgbXgyNWwzMjMzZi1zZmRwDQo+Pg0K
Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrLQ0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMN
Cj4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jDQo+PiBpbmRleCBkODFhNGNiMjgx
MmIuLjI3NTRiYmVmM2QyZSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFj
cm9uaXguYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jDQo+PiBAQCAt
OCw2ICs4LDI0IEBADQo+Pg0KPj4gwqAjaW5jbHVkZSAiY29yZS5oIg0KPj4NCj4+ICtzdGF0aWMg
aW50IG14MjVsMzIwNWRfcG9zdF9iZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IHN0cnVjdCBzZmRwX3BhcmFtZXRlcl9oZWFkZXIgKmJmcHRfaGVhZGVyLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnN0IHN0cnVjdCBzZmRwX2JmcHQgKmJmcHQpDQo+PiArew0KPj4gK8KgwqDCoMKgIC8qDQo+PiAr
wqDCoMKgwqDCoCAqIE1hY3Jvbml4IGhhcyBhIGJhZCBoYWJpdCBvZiByZXVzaW5nIGZsYXNoIElE
czogTVgyNUwzMjMzRiBjb2xsaWRlcw0KPj4gK8KgwqDCoMKgwqAgKiB3aXRoIE1YMjVMMzIwNUQu
IE1YMjVMMzIzM0YgZGVmaW5lcyBTRkRQIHRhYmxlcywgd2hpbGUgdGhlIG9sZGVyDQo+PiArwqDC
oMKgwqDCoCAqIHZhcmlhbnQgZG9lcyBub3QuDQo+PiArwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDC
oMKgIG5vci0+bmFtZSA9ICJteDI1bDMyMzNmIjsNCj4+ICsNCj4+ICvCoMKgwqDCoCByZXR1cm4g
MDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBt
eDI1bDMyMDVkX2ZpeHVwcyA9IHsNCj4+ICvCoMKgwqDCoCAucG9zdF9iZnB0ID0gbXgyNWwzMjA1
ZF9wb3N0X2JmcHRfZml4dXBzLA0KPj4gK307DQo+PiArDQo+PiDCoHN0YXRpYyBpbnQNCj4+IMKg
bXgyNWwyNTYzNV9wb3N0X2JmcHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IsDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1
Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwNCj4+IEBAIC00NCw3ICs2Miwx
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gbWFjcm9uaXhfbm9yX3BhcnRzW10N
Cj4+ID0gew0KPj4gwqDCoMKgwqDCoCB7ICJteDI1bDE2MDZlIizCoCBJTkZPKDB4YzIyMDE1LCAw
LCA2NCAqIDEwMjQswqAgMzIpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOT19TRkRQ
X0ZMQUdTKFNFQ1RfNEspIH0sDQo+PiDCoMKgwqDCoMKgIHsgIm14MjVsMzIwNWQiLMKgIElORk8o
MHhjMjIwMTYsIDAsIDY0ICogMTAyNCzCoCA2NCkNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTk9fU0ZEUF9GTEFHUyhTRUNUXzRLKSB9LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiBJRCBjb2xsaXNpb24gd2l0aCBteDI1bDMyMzNmLiAqLw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBQQVJTRV9TRkRQDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5PX1NG
RFBfRkxBR1MoU0VDVF80SykNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZpeHVwcyA9
ICZteDI1bDMyMDVkX2ZpeHVwcyB9LA0KPj4gwqDCoMKgwqDCoCB7ICJteDI1bDMyNTVlIizCoCBJ
TkZPKDB4YzI5ZTE2LCAwLCA2NCAqIDEwMjQswqAgNjQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBOT19TRkRQX0ZMQUdTKFNFQ1RfNEspIH0sDQo+PiDCoMKgwqDCoMKgIHsgIm14MjVs
NjQwNWQiLMKgIElORk8oMHhjMjIwMTcsIDAsIDY0ICogMTAyNCwgMTI4KQ0KPiANCj4gLW1pY2hh
ZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
