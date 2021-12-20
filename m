Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69717C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 11:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIbT3Z8VGgjXdUijOpNImoHzTuNrcaUhY1Fajvfprig=; b=AovWw3yl+fd15S
	EyJqAse2CbrC7lLWHYudhFqP9eW8/+m1fV4x1PbIh2PxczmhOJr4yT5Z00nwcL6+zPwUEIlKMDDcP
	iDVcqS1rO9kcv9v02YWah2/F7PvQXCCuhhmH/vzlJRxYuD49YWgxob2VAdlj82lZD9wr1kvGR4Ee1
	uXqcu7eRaa28fkFnRqkJ+GpFAjAoCVbOVnr70IciqBZfX70jwM9cpDeMjebvVCUAF8h2VHsOPwjam
	Wvwwd+r82VDf3WcOwpP5Pl7R6ZrSQJnEVVB8G0Gmh1isTEcU7JBvmBb89znghabPYKkDMmX1A0jiV
	b384Z87eBLGAZ8g4ESog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzGUU-001nzf-9P; Mon, 20 Dec 2021 11:06:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzGUR-001nyc-IL
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 11:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639998359; x=1671534359;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/dkBK00CHDWc7Ho1tZFqTIuxmccHeJC77O9hZb012eI=;
 b=glodXKYDypNjngq3R+owLMiq4ZLGQ6b7csLKwElytQLxGfNb9IT9jOGs
 9lICwH+YG9KPwJd55grvTBL/CGKIg+tZiOKRvjr9zcbe+FoKWf4V7bS5E
 a5Zs31efWcP0M6IOgaG8DPYg4UM3oAAx5ZQe0ne7A179OJbJaRqQzT1ym
 xYzphVtHLrTJg/nSPIMUitxU4yiijUcibbQNAmPNeygVyFH8WyLEjx78V
 Lnz1KaCTgm8ndFcpcNZUnk3qbLkTR9SFT4nHb+cjJcjwqShdGfql5IPEa
 1OBZzIjQzoqImxc95y36pQuBNM/eeBXfUbg0Rep9asx9dWcL37lJeb+Iu Q==;
IronPort-SDR: Rezeg8UEL5dT6Jr3MgCbevbJ1wQdkwWUyU4Fa485/I6m8VkuYFyj2dA7Ax9SgMCv0lBCqkilCs
 zWy0ER96f2NSyIMJukhYheRV02i22VWYF0rEBwJS4TImlFuiALsXLKmIDk0e0eNEfxNiwgJmoZ
 ZjfGBaJdEEQMl9ZwaaQNF0FQA3+s4UgJ+J9U7WQNHQZ8RYcwqYuqOMMCxwy+IRsKXXcnMra+MY
 zBiMQ4xSSVk4MXu+aTDQy0B3BXJUZpUHKpU5i45JkPhGPwgBecPqC4uvjgiv6MDtODsWB0+QeA
 pvWHCoo0dBf9IRsItDRHVzXn
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="142964290"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 04:05:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 04:05:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Dec 2021 04:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eawtJH0uFozxrnXHNqHFiDQGFb1E0zHp+GjSg30b7H5Pt0AJ8CD+XmGNWjVFGxG/PBNH0mdVww3lwbyyHAwxwmgY9EfIxrYofBGh+pe6m7Kgx0NMTBcWa4pXaJKqDDfb34RY7ciOYc5vh47f+XdlK8xvthmeKf3cEjoZ6AsMHw51fu+6V9itGV0IXh4DSLxFsJwFZXAMIqvFAxt9W/SHAVlmknPUIZWxPM+B0e028tOo9b9sEpDYc4sftoEyOPfo0k6cUTdtt+Qn+foK7e4Al9ibkZAs5/54BuvQUt9QuzjMnU98x/AzKmCtgrlNKWLk4KGZ7YFpY32b5CrveLZOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dkBK00CHDWc7Ho1tZFqTIuxmccHeJC77O9hZb012eI=;
 b=BMFvQx/3xEFHJgvslVAZZDH7rQtgVDwMQAn4E6CFn61N80XXVHqlMOfKTt9oS4SOFNzWUb4LD7Y4OLTdkvK3rLg7Lw4tQ40bVPp25kUheDgb+nfDoUxzr+vxECF4UHVP/ttLzitVXZ6qWqrjNpa74N/44epc3dlRMv2zpLcl3uAN6e8kvr70t35nhGg1/E+YfBxEC6Ax14YFzIVav/vdYrz0aLgNpMj3IBEgtjB28fPUDNkfN7qmtoX/QDVweNGYQ+5XyehaY6pAbFzo7kfaGFzO0C2nmpFc61SkCLni7/7v9rvFfWEiIl3Hj+U7YKPBhXlegn8KfkjsiDKsvODBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dkBK00CHDWc7Ho1tZFqTIuxmccHeJC77O9hZb012eI=;
 b=h/cda6d22Azv57H5IhAQscYduLpqvnWZV9DHkTg1caUdXC4RYzeLrpLh4TODWO7qJX5G0V9b8JYnkSwDSZN7jsMBDdUROMRR5J0VuaMSlMlaspAGYflrEKyCqP5103KH1D71jFsbi+6yUyjIaRy8sThn/m+aZGE8HeblOckwAr8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 11:05:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 11:05:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: macronix: Add support for
 mx66lm1g45g
Thread-Index: AQHX80ML08Rm+S6s0UW0k/rjmom+8Q==
Date: Mon, 20 Dec 2021 11:05:47 +0000
Message-ID: <dac4db71-1f4b-13df-da9b-bedc2c0c2d4a@microchip.com>
References: <20211209190436.401946-1-tudor.ambarus@microchip.com>
 <20211209190436.401946-2-tudor.ambarus@microchip.com>
 <20211217113810.mzqrwf6vxfniggn3@ti.com>
 <c94a306d-a71f-6465-bb3d-d9e6ae55148b@microchip.com>
 <20211220101639.ycdz4twnhhp5bvlj@ti.com>
In-Reply-To: <20211220101639.ycdz4twnhhp5bvlj@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d119e2de-9af9-4240-e4f1-08d9c3a8acfe
x-ms-traffictypediagnostic: SA2PR11MB4907:EE_
x-microsoft-antispam-prvs: <SA2PR11MB49074C1BD544EECBEDD3F85FF07B9@SA2PR11MB4907.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2YI/4wCyHcwktqJNqipiN4jfiseCYbDU0GjxPpdvz7Qh1edstHXbccBFCzigc+eluYBhnenYWjQxd2ZV9L76l4RnGxgN7QF+fdb57EhT6Cio+BoDiqL0zUwM/R1vAA1leOHE4u/t/jIh2paO5GGSE3CQUDdhuVKxsMwMwIXVuMAFQZ9G3n4t49XjxcHJoP33RiPyGFp+Suln9QEPUpJ5G9A89W0L0bDowIq1b3wr9NW8g/1e+/GaiupHxAadQT9tJJlrqTr6HCGOHWeAToaZ4ZsKqxH0i/WK/N+XoPKdENDuk1Lu0JtBY4JfyQKXZfA0bZA6/VzvkfMonLnJjTbLs+xS341Eb/a0qgnTy3NkO/tX06dnekgbKb3ncSth9Z8cSlM7I133VrAQ2W3LLEX2FjUc3lYADpLpsthc/F5dDuULB4lq/CQ0elfzYcmaaF7xHTJbnOxMCTfSUqdVOqqaFKfz7z57ultk3klt09PA5mhW/CTIK6m15CCjfPIlKty4vS8fN8Yc9SXLNkO4WtpxjgRST2R+cIGPg4ApV9H8yFOdun45g1SqABVGeZqW1pBL9oVCeKBySzgrD6TENNA+tWJXf3Bj/TVU6TRvvMdffYmb1eM7zDdTvdSR0DNVSqlOvb83OGLnOWLRxx4FNQr/OtIm+tO7QNMF41Ih7XVz2rOoAZimA60sT4QVL27enSWRK8Jq+cHpmpaWQfvtpq+XjlyjzP12SGHkFzZdlx5FnU8K3Jym5u71e0O40dlLZoL9bdF7upI1kVQFxxCu7ZpPkMOLJJuGm1D+pL+6MZvawLMDfp5q7aBZxWgKjTpBb58k8U+Qvy8uVhvePzS/4e7Jrehle/M9BITrcRXBKdB6sO3KA1/vQsvvsiCiMqu4OBMJylpATwMhoXfm/tLAmwtieqN95fkRDkgnmAswaLP3zhI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(6506007)(186003)(6512007)(508600001)(966005)(4326008)(31696002)(316002)(26005)(53546011)(2906002)(54906003)(6486002)(8676002)(8936002)(71200400001)(2616005)(6916009)(5660300002)(122000001)(86362001)(36756003)(38100700002)(66476007)(66446008)(66556008)(64756008)(66946007)(38070700005)(83380400001)(76116006)(91956017)(138113003)(98903001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OC85WGpNYkVwSlpIeDZmM2h1S29SK1E3aG8yV0xGYU9uNExUN3llWDI1aHo3?=
 =?utf-8?B?cE5RNEsxOHRQbk81YlN0SGE2ZWFlOTFsUXhsOUJyOGRPL0oyODVoeWFKbStE?=
 =?utf-8?B?Y2U1VFRmQVJESzRsWnc3Z1ZZcTY2TTBMMElYN3lycjcxTlZjMW9NSkk0dmxK?=
 =?utf-8?B?YUdqUThZL2YvVUxMcjl2WDE0aWRqVVIxdFVZVUNFV0M1MmdIamIzVTBHRDd6?=
 =?utf-8?B?L1FpanhjUmEyc0QwNTRIaGpRRTNvRGQydHhOYWxncGpzZ28wZmxmVlpGMXAr?=
 =?utf-8?B?MXBvSjZhSHFqZi9oaUNRenJkT0NjRWRSR1NDK1hDMDl5Snl0MG1kc3k0U0s2?=
 =?utf-8?B?Y3dkSXhEZk1RRDNtYzBEMHNxT0g3OWFjY3pLbWFFK0d3ZjNFeEZiYzBrOUU2?=
 =?utf-8?B?RnIrSWlDaWVXcVdiWE1ZZzNFUDQ1Z3FDTWlrNHlQUDJEK0V6UmNVZFZKU0JV?=
 =?utf-8?B?ZERRMkQ4OVRPUTNFaktvVm9DQ1N3Zm1kaGM1UXcya1cyZ3lLelRSZG1MZFg0?=
 =?utf-8?B?MXZ5dW4xMHo0d3lDME1MODNsT04wdkx3eTg0S2VCdVQxTnBFR1RKY1FhRmZH?=
 =?utf-8?B?bW9RVEVIeE56VGhpd3FJS0N3TThQcE5BMEFqV3V5TTlLaWNFWXlZV2puaHFh?=
 =?utf-8?B?QkZ4VUFlTTYxQXhBR3RpZEFxZEhBN1A0NTc3OVF3TStWSkhtdG8xMlZJOHUv?=
 =?utf-8?B?azJwbUpUc0p1dTlBTExIMUtndXlOYjN6TU1UUEVPa3RYMGk0Q3NDR2tPaHll?=
 =?utf-8?B?dHV0NG52ZDRjeGE4WHIyUXk1c3pqSUdoZUFEZU9KYWpqdHV2WWwwUHlmbTJH?=
 =?utf-8?B?aU15K3pGNm5YSUlOWWdBMlQ3NFF3cGFKU0VtclZObm55bkNDOW1yaHlNZUxo?=
 =?utf-8?B?RmMyRnR4aGZ2dVFwMjRMTTUrb1ZFcXJ2Y0YvT0xBVzdqcVQ4dlhNbklySU5y?=
 =?utf-8?B?RU11NXNNRW93N3R2RUZLcG5Rd3BOZWI1ZzlveHcxZmF5Y0gycU96YU44bVlv?=
 =?utf-8?B?cTB6THJRVW9vNFdUY1FFblkybm00TEtselF5KzBVNmFmSEhlYWJ3WWZhK0s5?=
 =?utf-8?B?OXFKSzMzUVdodDhDTFRCOVVNSVRIREFYYmVSVU1PQ1pVaDA1eUJyL0FDaUh6?=
 =?utf-8?B?NGlaVDVWcHpwM0s5TzNhclY0cDRiT3VCRXdHaE9UUmpBZlo4ZExwaXJic3dp?=
 =?utf-8?B?R2pMYTN5M2lWdW9rcWxOeDBJcmk4N1JtY1V6QTFGTnQzVnRjYmlncW9xNUZw?=
 =?utf-8?B?cFY2bWtOSnZKQWl6dGlLbDYxQm5VMHh4ZEdZN2J1OVNYVGdtbW1GYXBRUE84?=
 =?utf-8?B?MTk1eUw5RW1EWDAwNXh3ZGV6cklaNzJ2bUtvbmNKeElRb0s1ekNGUEhrVCto?=
 =?utf-8?B?c3hzaHF6R29seit6RFdaNUdnaXJTdFpVUzVKRHpWeWFqc3hGclpxWEVkek5i?=
 =?utf-8?B?QjA4QnU2Y0NMbW1tc2hvWGxwTEtpV0JSdFdGNGFwTE1RL3JtQ0JSREZHa1Jk?=
 =?utf-8?B?QnNDMFA3REtDQkZpN2xNT1Jmd2g4VzJsenVSRm8wc1B1N2s5NUJ4UDV3TTQw?=
 =?utf-8?B?bkdWTkZINjVkbkZYMnJ2SUdvbm14WU1ucXhZYlNXTmRNb1IyUHFpTjYvVmpp?=
 =?utf-8?B?NjFORFY4ZGJiWVFzb1A2dEhsMUFMb3F5MXV6MkxjS1A3MEx2M3AzY2trMk1q?=
 =?utf-8?B?Zzl6QzMwcG5ZYnNQcWJnR3ZzNm1FSnRJMmR2YWhEMTJrUWJYcUtQM3hYM0dL?=
 =?utf-8?B?OHlXQWRDUUFHR3M5dVBhOG1GM25adHhRaXBBMkE2dkczSkdWSFlBMHNkay9N?=
 =?utf-8?B?YnBHVkpzdldvNHpJZFNJSGZyaDdmUzJXMk5aTHFLZXZvRTE4WEFQK2Z2WWln?=
 =?utf-8?B?dkJTNGZIRFI5TkNnUEwzc09qeExkVlQxd3A3QXVMWjFHNEduRzZiMEwrbnE5?=
 =?utf-8?B?V1ZkUHV0UnlKbFo5cjhZWXpkMWVTbzZqVmdyMTJaMHd4THhFUTZmYm9DVzNQ?=
 =?utf-8?B?aURYNjcrODJxQVhNd1ZCMks1andHaWFZdkUrNTRSTiswSnNkemxqdTI2aEZO?=
 =?utf-8?B?NkdSNE0wN1VhZktpTERVYzNORnFNdHgvemFFVG5XQlZRS1U1czVjeWdEYzF6?=
 =?utf-8?B?Sk5TVHBjWjArUWV3RDhPVFFUN0RvYkVoYlkzZGtETWNWQmVVUlA3MVVNWVpt?=
 =?utf-8?B?UEUzaUpRUVc1NXd2dDZsZXh1K2JHNXJhOUsrbEx5ek52TkkxeTJRVCtWSTRQ?=
 =?utf-8?B?SnhtYkxJNjliRG8vbUczSHJ5SDZBPT0=?=
Content-ID: <2B822C4C10942845A59BB759A628D35D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d119e2de-9af9-4240-e4f1-08d9c3a8acfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 11:05:47.3246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X1ENeqF3t/Fj9uD8tz8qlMTIEIpRABzWexUEPLZvAI1ZqFI0yRBr9moc1igJMEY4+7CwY9VuLFgwreDOBom4cPC0CtdAx9cODfpxfPI4Lic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_030559_822910_E9193920 
X-CRM114-Status: GOOD (  20.32  )
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

On 12/20/21 12:16 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 17/12/21 12:38PM, Tudor.Ambarus@microchip.com wrote:
>> On 12/17/21 1:38 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 09/12/21 09:04PM, Tudor Ambarus wrote:
>>>> mx66lm1g45g supports just 1-1-1, 8-8-8 and 8d-8d-8d modes. There are
>>>> versions of mx66lm1g45g which do not support SFDP, thus use
>>>> SPI_NOR_SKIP_SFDP. The RDID command issued through the octal peripheral
>>>> interface outputs data always in STR mode for whatever reason. Since
>>>
>>> Huh! I hope this is a mistake from the chip designers, because if it
>>> isn't they need a stern talking-to ;-)
>>>
>>>> 8d-8d-8s is not common, avoid reading the ID when enabling the octal dtr
>>>> mode. Instead, read back the CR2 to check if the switch was successful.
>>>> Tested in 1-1-1 and 8d-8d-8d modes using sama7g5 QSPI IP.
>>>
>>> Datasheet?
>>
>> MX66LM1G45G datasheet:
>> https://www.macronix.com/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf
> 
> Thanks.
> 
> I see that the RDID waveform holds each byte of the ID for a whole clock
> cycle. So you would read ab ab cd cd ef ef. I've seen this before
> somewhere, and sure enough, digging through my inbox I've found this
> patch [0]. In this read ID is performed but only alternate bytes are
> compared since they are repeated. I think you should do the same. I feel
> like reading/comparing 3 bytes is more "robust".

I didn't want to do the 8D-8D-8S readID because I'm not sure if macronix
generalizes 8D-8D-8S for all its octal flashes. Since 8D-8D-8S is odd,
I felt that reading CR2 is safer. But maybe we'll follow the read CR2
approach when the need arises, so I'll follow Zhengxun's proposal.
> 
> BTW, this patch series also adds support for mx66lm1g45g. You might want
> to use this as reference.
> 
> [0] https://lore.kernel.org/all/20210812150135.4005-2-zhengxunli.mxic@gmail.com/
> 

Right. I will rework it's 01/15 patch and keep Zhengxunli as author, I assume
Zhengxunli sent the proposal before me.

ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
