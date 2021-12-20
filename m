Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C4FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwyWLRVmqi89iup57bRQfc3nQHNoqjiJdyAri4UsVCo=; b=yAElWJWTYz88WK
	ntlksSyaTw591W1FW89kVI/sqvzWrQooce7PbPA3VAHFuh/Fj29khjOFYNTRGC5aGPMJeP/eBYxTo
	/uFwoMWwBIjn6ysePaAC+FG+l6uI7fMaN/iO/dM494ppUcae7wO0CcuHl5KZ6JRlTbNRxx5fW5HxO
	YrLhT12Rz3AtHKRj2FECTiZNBrUs13vZm4KC00Xc2kkL3NCSz7pgyO6yO8a++S0tLLjSK7jFVZqPj
	ED+bDyJCQgmY8bqFdI80dZRH38A1DAwoos0X7W5Qc+0eIAtAlcQ69AIkTu2m8KdijMny/GNfA/rC4
	z9M/+lgE0Xd6LvtR08cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzGq2-001zkt-4P; Mon, 20 Dec 2021 11:28:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzGpw-001zhF-3D
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 11:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639999692; x=1671535692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=64OtZyjH2l7XAvSzONI7xXWFB8dZgNc6ZlQ7p0FbD0Y=;
 b=NLeUMXouYkDL3oVAun4lsJ/Ewth7nLA5f2CGl8U8UJWOLbUJ4QgpeuCJ
 25iQ1MCDJJH3CyPHAPEZ3Mgx7qwLZp41B1iVghDrhLNQDXUB3NiZeHEV4
 /D+oQNxmqhT5iU93Dk4ngccbiFssdK5QdsMrXLGbCVAukezY32Zp4Wcu+
 C6Ro5EDJkzGPMcgEBY4D9rLZ9VuaZM/7q/AbMZl3M1QloY7c/+4tvnAGl
 wpmF+etWdHcUe3c2NZutfJqfuY/xu31lB/pLBpzDpz1TiBAL1WvARo7BX
 5zppHO1pV2EdVU4l+rvvviWwQGB+UHYHmCY7gbp0y+Qz95ptku+mOeYnW g==;
IronPort-SDR: Y/Pk0valm5NkAN+xGJqLo94397GS2QwlTRDldMe+Te0ObGHwRf3/lpEbD1xCznuASKcIjeXs6B
 Xo/wz1Gy5uwbMl9JZkQVlzlQqTv8nxrycOK+6AWUrJNLpU2YSZZTvAOaHedj3Hh6aOeNYgfzf4
 odAIiVJIxy5As0boq0YEljEH66N2bP5l7ooql1FGlEw0kUyfag19ccASF+M3PSqud893Azgii9
 b2jxxOUpB6R7jX539B+8mPwBcEPda68QEHyd8nThW1HoykiY+cY9b7fpmEu7Z8LzzKOYwM6cjD
 vjriI2JljauLF7k2zeA2QBdV
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="147229152"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 04:28:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 04:28:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Dec 2021 04:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrlUzhh9de3fGeBwSn4lNGOYtrtDd4D0UEbqWG5jsuHQ7fKLa7aEiqz0ZxQ7Qplo170zJJ6IEDLAJXlFZU2EilD24Pj4t6rlSdBngLS97dJw117IlhJlImkZqWBKvApAuhWoHspBNe/nqgo86fsJVdSdF/YTA8efI/UVdk8nUPgikzvHppVZ5cH0dFFD5B7x0e/xwian1NXOl9Rxoc8C58Mxbrm4KfUeuCZfMl49cJ9SaKIEE5hazL2TBBekHIBUVszUNsLVtL/JyDvCva5TFR6CthggutOjHDDaLRei8JLx3nSwgBvqxXVRKyuZHyOOSQxnfM3UgeXaWJk/1zJcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64OtZyjH2l7XAvSzONI7xXWFB8dZgNc6ZlQ7p0FbD0Y=;
 b=N2DRgXorhzlF2eUoBPsP4v1VBdg3vUX6iN1Q8Ba2r8fesKOSq1waHVQK26EBH/K52tYXdgz9UQdeQTW2o31CB7Om+G2drNc8K5eq/uCCFvlww2BRoOSF7PawCOPMEgIv1OG7hyWOkduYt/+CAx2UL/87F5o4k+GZOndJnstE6RVpe6G8vH1xQpWzeLNaY+MFfAEo5/ftHhJKMub2hXyrvlBE0IVBW1LNlUj46utyy82ANpUWxzQBiDlP0AMvShAN5hxwNaIKT8qpleUDcbuKzztP4SLvpVWf7R+Dgd3a8e4ElQAGHbJEBQDTlV4Rb9HdZqZUHzsWdD6WGLVBzWav9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64OtZyjH2l7XAvSzONI7xXWFB8dZgNc6ZlQ7p0FbD0Y=;
 b=cfkUqcWIZs2mInGql07FN5rcLWa0ZR1qn2Vt9k3UyIU7JShq+08qatxQAzDsdxMbLmKvSNvXw9wYwcTYtHsZ3ahf+WuwoU5QeEIliXKHZT47oa9nFpATTBMYiMIM35VctMlfUvhpsYfrUwtxDDQR2qqXSkStnKN7VTdaKXrluYg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3248.namprd11.prod.outlook.com (2603:10b6:805:c4::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Mon, 20 Dec
 2021 11:28:01 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:28:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH v2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Thread-Index: AQHX867zGrsgvJvvRkumR0zAW0g6cQ==
Date: Mon, 20 Dec 2021 11:28:01 +0000
Message-ID: <88db4d69-e983-a359-ad50-9981e465b1fa@microchip.com>
References: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
 <0cabce03-bc22-eb3d-fa77-a1f5f787784d@microchip.com>
 <08d6657c-afa9-8739-196b-1e66d802e614@nokia.com>
In-Reply-To: <08d6657c-afa9-8739-196b-1e66d802e614@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3be2f7f-a8ab-4647-e772-08d9c3abc830
x-ms-traffictypediagnostic: SN6PR11MB3248:EE_
x-microsoft-antispam-prvs: <SN6PR11MB32484226B9B728E7834BDA6AF07B9@SN6PR11MB3248.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59zW2gj8oyRrtNGlzLFtCNd6rtLYNLVNs0K9PungJb6SZjez+2FnCsI2bUuRYn5DDcqPKTX09vT6xYKYs9YTcgQ/AQs+bugdSsmhOwvAwHyYeRTqXFzcV2nUZpJ5/m8US8+hNJLuV5ibmstKMdTNUD2OnLxRZ01rj6CaeaZa+5QpHYB0pzvEUQDfNPHGo+ZrRJz8Ixmg+JZ92TbRB/mjtdmALp9EaLbCG2DO/eZeFpIVFRT7rzw/MhmQxroC7/Re3e3neWAdR1ZJ6X7eTama2DO32y0tZ3f2GRdkT22f5AfnljELdMEnn+7eE5DCj3q3kWERZy7OzCC/szyUHIYSpxiJspddtt6KnlqD5FPYqlGXS7jP1phxo4TvARoTpMU4aIcrVJmIJX0vYVjvBIFfB/x3Ji/L4QHVC6XvK8Oglz0U0mLn5+1d2uqYr5HHwvq44alPldzH88G1yzWsPzsOz4oR1sJtoGJ/5mM9mSRuhIFyjsAUVr7glwLGdJrkxkv/qUhRsc+Kq8QmpKvSWmnT/5I5qga8jTTxwZk/Zb5BknbsbWKP/SYkAS4Xjv+E5Av0y8Fq/gj2t0GNWJw3EQb9zsMmIcBAb9quW0034hY504eMM/k9W8PZh+Ux7b9/jgTrfDp7YDfmdhTukuOt9Pvr0bvifrekeqny+KeBYiaLLCSSbKC0/5cv664/mYNXkvwuKK7SlzkA0IqKdHon9j8JsG4dPhSU928a+N+GtkPg2AdY55VneWYYFR7eTVVAqtz9G1YEZTsKsYVS3vWsjcRH9xFktmiftQX4PCz0uDOW5cIOIOXxSjsONMFz5aXwvXbp9ihaP/rd69qKT6v+o4UGO3ZTYUGZsi7Gwduz+KDMXJDCqtMJs3dFJRBkVLqOmDCtz8pqjXtQj2TaoEWKpsrRqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(86362001)(2616005)(38070700005)(38100700002)(508600001)(122000001)(31686004)(36756003)(966005)(2906002)(186003)(83380400001)(6506007)(53546011)(71200400001)(66446008)(31696002)(6486002)(66556008)(66476007)(64756008)(6512007)(26005)(66946007)(76116006)(91956017)(8936002)(54906003)(110136005)(8676002)(4326008)(296002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmgrV3hvZFczVkxRdTJ0c0J5c2Znc0dGMGRFUzhIVWRSamRCU2ZUTlZRbnZo?=
 =?utf-8?B?Z1VOSXgrUmN0RHBMQ1dTNzNWNUFSdHhrMmN1eG1BOFBLaXJnd1pLUnFHNnV1?=
 =?utf-8?B?d01CbWx1UmtJQzFuVkN2NVAvaGV4ODZDQkh2Y3IvWlpIS2xNM1BEdk02QzBm?=
 =?utf-8?B?OUx2U1dNZUFJdG80ZFlMc3cyVzVBRzVRMlRLeVRac1FOMGtjaDFkQ25LSkFk?=
 =?utf-8?B?MmZOODJOdnppUzhJVnRuV1ZHMzY2dFlMenA0KzdWMzZNVE9nOWZ0b2xIeWc1?=
 =?utf-8?B?emI1dENkODBOK3JCRml1MUUyY25FMDE0L2J5VEVoNS9ZL3FIcGxCZ1lNc1Uv?=
 =?utf-8?B?ZkFsWGZiSjQrOXZvb3FzVEw3SFNIQk95RGVFWWR4QUtadUdVVWpsNUNqK2xl?=
 =?utf-8?B?U0pNK1g4dmJGcEJJaS82NzlObDlxajhZSnlvMnJ3MTFFaXFqcUlwRlZpYi9q?=
 =?utf-8?B?a050M0J4RnBRanJWc2k0Q0VJTTZqUW1CeUxQdWRJKzV2UzBUUExtbDJtNHRh?=
 =?utf-8?B?NTM0dXRINkI2SWYyUTNQRmFGMzNRVGt1T2dtMHlxc0ZrMGNlYTdzcGJaVUVk?=
 =?utf-8?B?NWJ3ODBtTGRRbDl5eHJTUXhNUE9ySkZxWXhscjY0TXByMzlYOVpBV1QvK2du?=
 =?utf-8?B?WlVlZ3ZKOWRQbnNVbGpvQW9iL1p6S3ZMQlk0SHN4aUFFWjJlQ29WV2NOUkRH?=
 =?utf-8?B?TjFqVzBjQmtOR3Z6SFRiUU8zeTVvMUhiN0p0QlNUWDBSMDJGdkFDenNscDFn?=
 =?utf-8?B?S3VrN0JJMjQ2dm1qOVdNZW53Ris3WlFnK1N4a0czUnUrcDN3ejVmMHM4TUNn?=
 =?utf-8?B?WHdmbmU3VisrREhaRFMzQnRvSEhWbmdZQ09Hcko0aHowd2RWZUt6UUExV29k?=
 =?utf-8?B?MjNuQ0Rwd054MVpraUxmL3BmRTg3RFdGZ29mM1dMMnZsOVZyWTVnR3hQeXQw?=
 =?utf-8?B?MHhPekR6WjNaM2NxTWhkZWVCTXg0dkl6dncwQmVrejZ3V1dYOGRINkkycXNh?=
 =?utf-8?B?aFQ3Q1FOUWhMNE8zdmU2Qkx1bnBtU0JqbFl0UGFLbmNPWTRmdVV1WnRHMGJz?=
 =?utf-8?B?dmlmekhsZE14VmRiL2tPUDEwZTUwYTJyOFNUdlZpaDVOb21OUDZITG1XK2p4?=
 =?utf-8?B?ejFvVWIzcUtQTGw0NklJRVVLRmVwb1ZwMHpNTXRPRVpFbW42NzZiRUxDNGJJ?=
 =?utf-8?B?aXh3cTVMeUxGUlVLUklUMHJvNk9aRDJBMFEyNXQzbjhmUDFlTDNWYmEyaVhB?=
 =?utf-8?B?MWtaL1ptTlc3UFRSMnB4anR4REhteDIwQk9tSFBpUWNtUm9mWlNUUmJEWUVJ?=
 =?utf-8?B?UzBEcTdRU01oWCtqYzM0SXhXbHZneXpLWVJHcVNlcjRKN0J5L3ZjbUlVYXV6?=
 =?utf-8?B?SVI0WlBlZ2FISmpwSS9rUVZsY2dCSm15anZjSjdIYS9wSnF1bGRtTEpBSEVu?=
 =?utf-8?B?dGpzcXJiYURlU0RRU1JRZ3Q0SThEbzNuNGxlYktWQTRuYTlCbVh4aG82T01s?=
 =?utf-8?B?dXhxTndQbHpGQnBUMEVwWklSeXcxU29MaVFCYkhmc0w4SnFaVXBNTFk1bWc5?=
 =?utf-8?B?aFNOT1l0UXl3NFZLVVBmUnhlVER3NkVkaEpVeXFwVW1vYnZWcGhpRWxKbHJi?=
 =?utf-8?B?a1F0QkJGU3VEYlBaOGs5U2hBWjZ6WlZ2dFB0T3lkdzF6UFBJUUFjUFIwRHRP?=
 =?utf-8?B?dFpnZzVRNlFQSjExREJ4U1JsQ0NhVURJc1JPa1pZdkluL29HdTFEdHU1Q2Jx?=
 =?utf-8?B?aXlJY3ZOOFpscHlDZ1d4Z2YyWkJtWDcwRHMzYmF3bnVOOVBteWw3aEcvNFFm?=
 =?utf-8?B?c3BjYnMvZUt5M2JxZ29qUlprenRBd3B6SllsK1JuY3NBNXV2blgvYUlPY3E5?=
 =?utf-8?B?U0JuaWVkU3VRKzFkSUJOeUpNd2Vvb0tDOG9oakZFcnl0UkJxcVJJVHJhNGNi?=
 =?utf-8?B?OFJVVXRGQTdtbWkxTlVnRDdvK0kyT0hGS1RrSnBpV0hYM1FkWW1JcHBMSURY?=
 =?utf-8?B?OFV4TU8zZGRmQ056enZrS08xOEw5SldpdG9FK09jRmdMbDhXWFd0WVRBNkwx?=
 =?utf-8?B?TEtiTVhIclJNZ1NsaDNEREhpUjZWQlphd3BYdVdnTGNEcGJWNEdSQ21vMkZj?=
 =?utf-8?B?QUxjb1hnV01ZdlZMdURBR3c5MWpaUE9WRFYwdUFnUE9jZW55UzNONjBTM1gz?=
 =?utf-8?B?bDFDZ29ONERNV2Jid1luVHBLZlNnT1NVcEhaM0U4amkzY20zTXRCQlRZYmJG?=
 =?utf-8?B?MWduUC80Y2lwbGNYNzVkbXFWa2FRPT0=?=
Content-ID: <B257F56D80DBD641B514057339AED7D9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3be2f7f-a8ab-4647-e772-08d9c3abc830
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 11:28:01.4012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VSbBpQ1YipkNRkr24gwnCDaxUPZzk4tstzhHU3GSyWvggGQY66YVHSBhpD+Dr92z9Ea6ZlH/4NhuqWFyrW52AaZzA8qq9tauf5YYBsrYhMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_032812_209343_67BB06A6 
X-CRM114-Status: GOOD (  26.64  )
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

On 12/20/21 11:46 AM, Alexander Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Tudor,

Hi!

> 
> On 18/12/2021 02:31, Tudor.Ambarus@microchip.com wrote:
>>> Erase can be zeroed in spi_nor_parse_4bait() or
>>> spi_nor_init_non_uniform_erase_map(). In practice it happened with
>>> mt25qu256a, which supports 4K, 32K, 64K erases with 3b address commands,
>>> but only 4K and 64K erase with 4b address commands.
>>
>> :D
>>
>>>
>>> Fixes: dc92843159a7 ("mtd: spi-nor: fix erase_type array to indicate current map conf")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>> ---
>>> Changes in v2:
>>> erase->opcode -> erase->size
>>>
>>>  drivers/mtd/spi-nor/core.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 88dd090..183ea9d 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -1400,6 +1400,8 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
>>>                         continue;
>>>
>>>                 erase = &map->erase_type[i];
>>> +               if (!erase->size)
>>> +                       continue;
>>
>> I need a bit of context here. Does mt25qu256a has a uniform erase layout?
> 
> You caught me, the bug will not be visible with this flash type without the patch
> which has been ignored for long time:
> https://www.spinics.net/lists/linux-mtd/msg11510.html

Sorry about this, I don't see it in patchwork, it probably has its status changed.
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=

Next time when you feel a patch is not deserving the attention it needs,
feel free to resend it with "RESEND PATCH" in the commit's subject.

Will you resend it? Do the upper layers complain if you use the best erase sequence?
Have you tried ubifs on top of your ignored patch?

> 
> I however run the above patch because of the reasons described in the commit message.
> Nevertheless, the bug fixed now remains a bug no matter what triggers it.

I'm not yet convinced that this is the best way to fix it. Should we update
the erase mask to cover this case?

Cheers,
ta
> 
>> i.e. Does your flash has sectors of more than one size or does not allow
>> the 4K and 64K erase types to be applied on all sectors in the 4B case?
>> If no, you should have been in the spi_nor_has_uniform_erase() case, and
>> if this case does not suit you, maybe we should update the code for this
>> specific case instead.
>>
>> On a short look I see that this flash defines just BFPT and 4BAIT table,
>> so no SMPT. It looks like you're forcing the flash to behave as it had defined
>> SMPT. Am I wrong?
>>
>> Also, should we update the region's erase mask instead and mask out the
>> unsupported erase type? I would love to hear more about your use case.
> 
> --
> Best regards,
> Alexander Sverdlin.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
