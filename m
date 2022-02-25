Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE6C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC+lRDP+Ssgj3wVwdm45U4WSiffJT6fipXGFvymAYEw=; b=uRXOV/Bx2QtE/9
	g3NM3U8IMkyUtBCiyzmFQOOii/CZv/PZpxTYhcEjnZjqG75BB5V/SJ6lznWwKFH80GHDAxAZG4gXz
	btgyrNjJVUjaLG7f80BWg/PH+71acREccNPRnPokJdQBawoNTkNV//xlCwhgOBLGoAG1BopLdtjaj
	+nCOO4r7KE2gwC4py4PizDJ9/wUsQjSs9fGavHe/1Ku4zYNqqA3sAxoQe2EPuyye1RXozdAzhPoZe
	CLLIA/hThtPQP6iPxOSpHyp8wfZVi+zPvKjWoc3e8xOsWmE+P91QL7egxihxfj7etFQwUqndhpfFR
	XpsYN1EDTXmrGE4SXbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVAo-003cry-1x; Fri, 25 Feb 2022 07:37:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVAj-003cpE-Di
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 07:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645774669; x=1677310669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ugLsTPLK7UzFzbPqyrSRh9mgvR94StXkqAlzsDbrOoM=;
 b=N5IN+UemE1EJSZl/mm6V4VCmLk8MvCBguHeuUw+B5kElODAzJtd7KaqI
 0kKsK80heC2RGs2IaJyPYc2DekqAiPl18z9JcDCksfEXNUoNmmWMEpEIY
 V5WgLs1vw1ejkT001PaImek3Y6oue/FHq8TnfqScWVquZD77flbIFbBOr
 x7YkHoR24kRte01Xi+AL55zcOcygqZ8/+ZwvkFflJhJXg8S3QXhnJ4myW
 v/el+R35QKO0fZhHd4Nx9dZA0YeKd4YvdArRCbibk7nJBGa6BoH1z6Ms3
 nTtRNDL3P7ukYzGwpbTE9DBmePnCW1oSn2BjJxwrkX9HJX2UrwKgDcsZz A==;
X-IronPort-AV: E=Sophos;i="5.90,135,1643698800"; d="scan'208";a="163618068"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 00:37:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 00:37:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 00:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgcCHVOV0XG8xEiz7N4GlBLlRZoX0NuIx5UrJhz5UAvlxPXqngSvMb6S6ArlaJYk9ZzkiB/5NngoHg1Rzz2L1rOPBm75b1uQTX/UODillI8ejvAyiSVaah7h/SHdHsaQfmFMBTSHo1teRieoYA1rpI4GsrebAqSe4CBxSOdbJEc4ZNnBrEHykMl1f0169qNU2zRVA5IA0FY+q4bVA9K9MvBm9/Ad/YBJJHznCHlGq/m9J/yP9SLlgrngWmoszoMOOVudn8saRT0pQfycq1m1eHovwSHAL+NV7vuFivEfuNL2JxtZEGm+2L8+7BzK9WOxF6gp+8fdLEmyCmO1QatUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugLsTPLK7UzFzbPqyrSRh9mgvR94StXkqAlzsDbrOoM=;
 b=Xq/f6SFK15XDlZipr4Eqg1bC+kn9zWEm3vd0cs/d2ZURzWfUGGRE/zN4Ll4jI7ndwDweNSCTtZhfv35E9WHu1/CmSyU80Cr70I5B0jUKIcoxt1PEwF/BYm0k+R2Jjcm6brTlyiUhppHNRwyY8YMrdCRLG5yYo6mppKQCP/G1GX47uw5Ctl6W0H/pVvVza8haBt55GYe06pBULZE74Ahzj4zMqVE3SY0oKkS/ZU2JW1HfvkJPjRwow0r17Wu1vJNHV3XPNKX/2Yn6AmqLYW6BhU/SDeyT3hKeNVK018MqKr1DwBpnWfA9gkjYiUtKXKgN3rpTVsMgP/f+KPRGNguxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugLsTPLK7UzFzbPqyrSRh9mgvR94StXkqAlzsDbrOoM=;
 b=RVhcF8w7xIaWvI44ygvE7JGhW9H/XGLaqkOHOwghpAKPY1LA2bLOWIdSLZAwq8tXvWWRrQjZLvQC9JCNb9GY1nn/9IxQYK8TdPUpcPFRMYytR6T1xk49UC3AA0Dp0wqEU8vmGY5FTF2kO1I0s+kRmS+ogiqoaN/QgMHo9/tqkz8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 07:37:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 07:37:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Thread-Topic: [PATCH 2/3] mtd: spi-nor: micron-st: Rework
 spi_nor_micron_octal_dtr_enable()
Thread-Index: AQHYKhqU1EtHoqYkC0WREGE3qo7uQA==
Date: Fri, 25 Feb 2022 07:37:45 +0000
Message-ID: <3ea0d41e-e82b-dc28-b35d-11f07809e102@microchip.com>
References: <20220210023334.408926-1-tudor.ambarus@microchip.com>
 <20220210023334.408926-3-tudor.ambarus@microchip.com>
 <20220224195139.i4kjbnhgthwtcaet@ti.com>
In-Reply-To: <20220224195139.i4kjbnhgthwtcaet@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c17383c-809d-4fa5-11b7-08d9f831b6cf
x-ms-traffictypediagnostic: SA2PR11MB5068:EE_
x-microsoft-antispam-prvs: <SA2PR11MB5068592443FC2A64BA2CF083F03E9@SA2PR11MB5068.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPdCvJ4fau73+CekCH4CESMK0z0KeduIajyDgJq3GK/xk6FkVMFzk6y1d5jP2251ENIwi/q1PRBjOCTYKN35atyPuX65J4+dhDL0I4btqw08YGVyQC27qtmXJPZjYa3oYkh+1/zFfTfdGgSxYW6c4NuwORKvUdiQqvXtDxAMY53KpV0AacGs4Akc6+xGwqeblFuLTUoLl2PilKcauB7/q1GgEM4QJNPOPgj6zhqikZXMWlEdR8lz5+buxEi0gNRpIokrj+7uqiZ9h9xHgHxM1TJx3IneFcR9bZuh0CiNfw5RTKC6dcL678ZtkjGB/VYjZ3+rOxWBJTpSRmWWhiAk7pXHuByqPi9Ts1wUl0GOIZuQwTjg3N3kbFTl4yEiSvP3hYNUQoXKf6FH6EyDQwy83c36JG9Y+E88kD+Aq28ujdJvFPiGcPHPwGChGJLmjZ8aS99wnyDV3931kaZESBZzY2wrMddvpdv1KdohzzdAPzIB/fHReHAf9UcUHVTy6sJSNGaIFzVQ3WxdMPslccExH4LhkeMP2fpVw3bvoAjoY2yXrUfei6pq5tQ0zySdrP1lgz5Tm1W2OSQihYuAv/crXkurPoFQnC2LAIg6iA9ONrnUolWolQWnZwJoYuO/7djWd52ygM8BHUVYo6AFD75QyZWAdo7utIt7KdTfroFf/rlPnDoIN8eIhJsZ13ixFUodP56arRZ76fAi5YVLNwbnkesj8sSyJkRz1iz6FrIMK/Qed9iU6y38JfzKtubcP4xKVjnWmsONsQz//26OZpNyWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(71200400001)(2906002)(6506007)(38100700002)(6916009)(31696002)(7416002)(38070700005)(122000001)(86362001)(508600001)(31686004)(6486002)(36756003)(316002)(6512007)(2616005)(186003)(26005)(54906003)(83380400001)(66946007)(66556008)(66476007)(66446008)(76116006)(8936002)(64756008)(4326008)(8676002)(91956017)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVJRRmRrRE40eXVHZXhLTDJ4cldHUXlxSHpkQURUb2Q2ZWVIeW5oTUJMaTdZ?=
 =?utf-8?B?OEgyWllvZEE3KzlJbEExRW5sMGE0RnBKRzNydGF3YVRQSGFyZkpwNDVwSVZU?=
 =?utf-8?B?VkwrcDRCUW00VUgrZ1hKclFFU0loNjNxeEh5VEVWeWplWFBzaWNOS3ljS2Z6?=
 =?utf-8?B?enpPVWx2b1JVQlVNd2J0Uk95MXI5MmFocEwrWi9TeGJmYmxKRWNuSkJUMzZD?=
 =?utf-8?B?Sm4zUHRvbW1ocy9Ubko3MG5XU1ZTb05TRUk4cHllbFVtaDVSVTN6SGw0RXRr?=
 =?utf-8?B?OEYrL3NKN2V0VDNFb2M4Tkk0RVFPeTFtbVhuMTlDU01xUFd2ZDBUWU81dG1O?=
 =?utf-8?B?OTFWZGFreEhpZ0JNNnY5aUZDbFdTdFB4aHpTVklWclp3NExXZnl3Y0UraHAx?=
 =?utf-8?B?a1FBNURqMHMzai9DYTJwb2hTTkpwcUw2NHB5V2RVV3RndERyMkdscGlHc3Ew?=
 =?utf-8?B?amZnUWdCK3U2M0ZKNWFIU293bFpaelVFZlo0OWRJTU92azc1Ukw0RDJITTFH?=
 =?utf-8?B?cVBMTnhaWTlTa2lqQW9MeEh6aE10RDhUaVFudHhtQmJwNXRXZzJQNm56Wllr?=
 =?utf-8?B?bDhCZm5xSEV3ZXRLRUIzcyswMW15YXJqenJlNW1XNTE1NzMzdHJteXFwbWN1?=
 =?utf-8?B?OXM2dzF1MG4rejdIVndFckpOWmJabkhXYkJvWUhVTytxYWl0dGtBbGFnMHUw?=
 =?utf-8?B?d2YvM25KTFBrblV3L294Mm8xWTFyTThXb0x5NUtZUkp1QTdZVi95eGc5cXdM?=
 =?utf-8?B?Y1c0WTRRbm9HMmU2eWgwdm9wQmZQU0l3QVRPZlJqRTJ3YkVTYkxqanRnaFlt?=
 =?utf-8?B?T0tQL1QzZ3lzcHdjVUJZYkU4U0JIZ2Jnbmo2bHZwQVBvUWxSRXRuQ1VzN3hO?=
 =?utf-8?B?TG4weXpnTEpiTkxKZGx6cWJQTWo5bFRDMnl5djZLRXg5Qy9CZlRteFY5NHhl?=
 =?utf-8?B?OWVYYUhZNTd1T3dGZHgwZ2JBK01RYjV3dnJsMkFZNG9oOVBRUlF5eUN5T2tL?=
 =?utf-8?B?VmszZjliaTFIM2wxMmwxdzZhbW5aanh4Z1htVFpDWUs3WVZQU1BCK0pVMUc3?=
 =?utf-8?B?UGxkRThQYVdHMTE1OFhyekxFUWk5ek1OVkNmKzU4K081dVhjNkZBTEJzSmhp?=
 =?utf-8?B?ZWhoT2ZtdXJBWnpMTlJFMS91RnhHY0lnRGRaQVdBUzFuSGZPbE52UEdkckxE?=
 =?utf-8?B?dG54Vkg1QXN2bkllQjlPZk5Hdit6Qk5sTDRQckF1bUxpWGdaVzZzYUZ1N3Vh?=
 =?utf-8?B?S0Rna0F3cUNWOFcvZjdpM0x1MS9Bakc4Vkx5UWRDUHlEckV3YlF4Z29PYXl3?=
 =?utf-8?B?dkxMVXg1Um1lOTl4VmdYUE8vcm84ZlppSVhFcWR0OFFvUk9rdVpPUWJFaEwy?=
 =?utf-8?B?TmVLeldqNEkzbDAxZzZUMWFNMFlFcFo2VDhhV3hMc0RWMlhtOFlDVlUwa3Qw?=
 =?utf-8?B?NlpRM1dLdThjVmxvQjNmRHIrbDdLR0xpY2tLUlVjdno1eHRpTWdDdVFRZnlB?=
 =?utf-8?B?YXRsWTBkdnAwQmZ5Tmh5Yi9QS0wvaVFYdjFlMXZUSzVxM0M3ZEFuR2JsMkRU?=
 =?utf-8?B?QVdUOWJYMVczSkZXNm81ZWNXZGpRYzdmN0V4Mk9ielhmSlZBUXhVMldXR2dF?=
 =?utf-8?B?cFpGZEFFWHFMOHhiaHVrVEN4ODVKSnFkck9ydlFlaVgxZE8rNGQzTUpFbXg2?=
 =?utf-8?B?QlBpU0JzU2FEZUpNWWZFWmxvQWwyZnBIeUhMa2tjTWNlNkNpdy9wbkRvY2dZ?=
 =?utf-8?B?VFpibkczU20xNDVaOU5BY3FzaDFTVDBkWXVpSGdVaGlPTEFGdHNaeHRWcGZw?=
 =?utf-8?B?MnpINFgrTjJXS2c3ejJyVkFlTU1Pc2c3SStKbUYycHBjK0VpZGFTSzF6bTJl?=
 =?utf-8?B?M0ZtdER0bnQrOXBXU050bnpTSThVTzNneTZlRHJyY1VsdGtPVi9vVHo0VmdK?=
 =?utf-8?B?eWNwaG5ESHE1ay9qdC9nK0g4bjlMa1VHVTA1NVhBUFRJM3BlTzlpa0tYcHhu?=
 =?utf-8?B?aGRwZTgzT2hVRHIzN1FCZmppU05UcDVmRS9KQ1k3aXMzT1ZQbjVrS0hNYjRK?=
 =?utf-8?B?emx6dnNPUWlzRWdNMmszRGNJVWVXWUVGK2EydU85WkVHbFRGYXY2SWl4OVNS?=
 =?utf-8?B?MDkxWGl4VkV2MkU3THFHSTUzZzVaUjAvOFVkNzZJeUZaL0dibnNFZml2a1N5?=
 =?utf-8?B?WDAzL3YzZ2lIVUpnVWxPQ3BaN3YrRDBsT0RYNHc5NHNNUzQyZ1IyUmVBZjI5?=
 =?utf-8?B?c3hab29IRGdieUk5Q2ZMWndFYjBnPT0=?=
Content-ID: <CCBAED3C3D647141A1988CA3121F0AC1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c17383c-809d-4fa5-11b7-08d9f831b6cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 07:37:45.2640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wybsaemQFiadMtO88D9j7/gsZwvyWfYaqVisCaSpfPOzWByeeLNIMfSwzA01/j09ZSit8/cBFoKGkH1bXmtmQ9xyia9GeF+u4MgOssbfLhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_233749_592685_DC196798 
X-CRM114-Status: GOOD (  17.30  )
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

On 2/24/22 21:51, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 10/02/22 04:33AM, Tudor Ambarus wrote:
>> Introduce template operation to remove code duplication.
>> Split spi_nor_micron_octal_dtr_enable() in spi_nor_micron_octal_dtr_en()
>> and spi_nor_micron_octal_dtr_dis() as it no longer made sense to try to
>> keep everything alltogether: too many "if (enable)" throughout the code,
>> which made the code difficult to follow.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 105 +++++++++++++++++---------------
>>  1 file changed, 55 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 7f66b5943ceb..013aa6a52737 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -17,73 +17,72 @@
>>  #define SPINOR_MT_OCT_DTR    0xe7    /* Enable Octal DTR. */
>>  #define SPINOR_MT_EXSPI              0xff    /* Enable Extended SPI (default) */
>>
>> -static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>> +/* Micron ST SPI NOR flash operations. */
>> +#define SPI_NOR_MICRON_WR_ANY_REG_OP(naddr, addr, ndata, buf)                \
> 
> Should change function and variable names based on mwalle's patches
> (assuming you agree with that scheme). MICRON_NOR_WR_ANY_REG_OP?

yes, will do.

> 
>> +     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 0),          \
>> +                SPI_MEM_OP_ADDR(naddr, addr, 0),                     \
>> +                SPI_MEM_OP_NO_DUMMY,                                 \
>> +                SPI_MEM_OP_DATA_OUT(ndata, buf, 0))
>> +
>> +static int spi_nor_micron_octal_dtr_en(struct spi_nor *nor)
> 
> micron_nor_octal_dtr_en(). Same for other functions.
> 
>>  {
>>       struct spi_mem_op op;
>>       u8 *buf = nor->bouncebuf;
>>       int ret;
>>
>> -     if (enable) {
>> -             /* Use 20 dummy cycles for memory array reads. */
>> -             ret = spi_nor_write_enable(nor);
>> -             if (ret)
>> -                     return ret;
>> -
>> -             *buf = 20;
>> -             op = (struct spi_mem_op)
>> -                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
>> -                                SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
>> -                                SPI_MEM_OP_NO_DUMMY,
>> -                                SPI_MEM_OP_DATA_OUT(1, buf, 1));
>> -
>> -             ret = spi_mem_exec_op(nor->spimem, &op);
>> -             if (ret)
>> -                     return ret;
>> +     /* Use 20 dummy cycles for memory array reads. */
>> +     *buf = 20;
>> +     op = (struct spi_mem_op)
>> +             SPI_NOR_MICRON_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR1V, 1, buf);
>> +     ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
>> +     if (ret)
>> +             return ret;
>> +     ret = spi_nor_wait_till_ready(nor);
>> +     if (ret)
>> +             return ret;
>>
>> -             ret = spi_nor_wait_till_ready(nor);
>> -             if (ret)
>> -                     return ret;
>> -     }
>> +     buf[0] = SPINOR_MT_OCT_DTR;
>> +     op = (struct spi_mem_op)
>> +             SPI_NOR_MICRON_WR_ANY_REG_OP(3, SPINOR_REG_MT_CFR0V, 1, buf);
>> +     ret = spi_nor_write_reg(nor, &op, nor->reg_proto);
>> +     if (ret)
>> +             return ret;
>>
>> -     ret = spi_nor_write_enable(nor);
>> +     /* Read flash ID to make sure the switch was successful. */
>> +     ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
>>       if (ret)
>>               return ret;
>>
>> -     if (enable) {
>> -             buf[0] = SPINOR_MT_OCT_DTR;
>> -     } else {
>> -             /*
>> -              * The register is 1-byte wide, but 1-byte transactions are not
>> -              * allowed in 8D-8D-8D mode. The next register is the dummy
>> -              * cycle configuration register. Since the transaction needs to
>> -              * be at least 2 bytes wide, set the next register to its
>> -              * default value. This also makes sense because the value was
>> -              * changed when enabling 8D-8D-8D mode, it should be reset when
>> -              * disabling.
>> -              */
>> -             buf[0] = SPINOR_MT_EXSPI;
>> -             buf[1] = SPINOR_REG_MT_CFR1V_DEF;
>> -     }
>> +     if (memcmp(buf, nor->info->id, nor->info->id_len))
>> +             return -EINVAL;
>>
>> -     op = (struct spi_mem_op)
>> -             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
>> -                        SPI_MEM_OP_ADDR(enable ? 3 : 4,
>> -                                        SPINOR_REG_MT_CFR0V, 1),
>> -                        SPI_MEM_OP_NO_DUMMY,
>> -                        SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
>> +     return 0;
>> +}
>>
>> -     if (!enable)
>> -             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> +static int spi_nor_micron_octal_dtr_dis(struct spi_nor *nor)
>> +{
>> +     struct spi_mem_op op;
>> +     u8 *buf = nor->bouncebuf;
>> +     int ret;
>>
>> -     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     /*
>> +      * The register is 1-byte wide, but 1-byte transactions are not allowed
>> +      * in 8D-8D-8D mode. The next register is the dummy cycle configuration
>> +      * register. Since the transaction needs to be at least 2 bytes wide,
>> +      * set the next register to its default value. This also makes sense
>> +      * because the value was changed when enabling 8D-8D-8D mode, it should
>> +      * be reset when disabling.
>> +      */
>> +     buf[0] = SPINOR_MT_EXSPI;
>> +     buf[1] = SPINOR_REG_MT_CFR1V_DEF;
>> +     op = (struct spi_mem_op)
>> +             SPI_NOR_MICRON_WR_ANY_REG_OP(4, SPINOR_REG_MT_CFR0V, 2, buf);
>> +     ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_8_8_8_DTR);
>>       if (ret)
>>               return ret;
>>
>>       /* Read flash ID to make sure the switch was successful. */
>> -     if (enable)
>> -             ret = spi_nor_read_id(nor, 0, 8, buf, SNOR_PROTO_8_8_8_DTR);
>> -     else
>> -             ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);
>> +     ret = spi_nor_read_id(nor, 0, 0, buf, nor->reg_proto);
> 
> nor->reg_proto is not updated yet. It will be updated _after_ this
> function completes. So you would end up calling read ID in 8D-8D-8D
> mode, which would be bogus.
> 
> I tried with Micron MT35XU512ABA. Enable works fine, but disable fails
> (it succeeds in reality but the function is unable to verify that)
> because of this. Changing nor->reg_proto to SNOR_PROTO_1_1_1 fixes it.
> 
> Looks like the problem is not introduced by this patch though. It seems
> to come from patch 5 of your mx66 series. I see the same with the
> Cypress flash too but I have not tested it yet.

okay, thanks, I'll take a look. Thanks for doing the testing!

Cheers,
ta
> 
>>       if (ret)
>>               return ret;
>>
>> @@ -93,6 +92,12 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>       return 0;
>>  }
>>
>> +static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>> +{
>> +     return enable ? spi_nor_micron_octal_dtr_en(nor) :
>> +                     spi_nor_micron_octal_dtr_dis(nor);
>> +}
>> +
>>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>>  {
>>       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
