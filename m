Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86EBC433B4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:53:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF9061245
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF9061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YQiBHA8G0TjfDwcD1Ckh+rCvJoIROPX/sivmH4elQUc=; b=TLh7qcmWIE/iQuQEtvwqDSV0d
	FvokKmxKdDzgJ3Az5tPr8K9CRL+//Utgn64mHJwzgvZa1vZrjzOwFZ2B0X80to82LW05qt8AurhiZ
	IUjGc1O3x0CIU1btTdW8KQzvoh6R4jJMyOD5FXJhiO1Xp4KWhU+7JBOkMcAZ2Uf3/AMkAuKxhoehh
	u2hbTrLoTiCCBewaC6L4Os9m2fykKQLXNNCO4F0jql6GCS0fz23a3cMlKFOo2I6FQ2kiyz5AC/WU4
	TRPXgYyGaqXyXYi8UMCFSfTIfyDaJ5Q7trLrMvJJendIYz7MFbwM7G27HFiJiNDAgiYLxUw9PhUCi
	KNfESbimA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTKyA-00Gzaw-6v; Mon, 05 Apr 2021 08:52:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTKy1-00GzZw-FY
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 08:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617612737; x=1649148737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6CyQPfW7pwrIetjTDOStvLw1sGI1NjPo+o/TwR9wS10=;
 b=lDtCvLIENAVpoXN0M3HH92P1V3EypeVc82sUTuv+8pj9VOmcl8ROZQAU
 S/TLy8yNWvEN7Bvz4dbRhk78dsmD4CDt8JpjsKw1rHLugo9XXskeBVABC
 /C5JG//tKCd9jpC+ovSWUpU/53FBi0OvesxwuUR3xuZmUS+2hmtFoWj6G
 9v2BHCGe8+qrJBTSmdQV3o8nphv6CELiV9YdHTNeLyWZiMhUYCPbHsgPY
 ST8ClyjWkBU58OxFZru1YyG2uf4ua+fDjm86MIWjn70yEL51oakJSW3/b
 jALwfUVjo5V3iOls1bzBcgqGRy/y1GerjQJfnYCapoSq3mhxmEDcJdNoV g==;
IronPort-SDR: 8/+8/2tUVqCNd7RmsMh4GJUHceNilXWQOmETVSdQXhogw7usmmRaDCGP3jFFVoBSxmRQ4VrLRH
 pAoBTFJpYbQSL38TR2J0U1MdiisS97f3vmEtBcMnpVDojKkCoamDH+ODv5oMxYIqMkG7H92bvv
 PR3E1wmsgoMs44yvp/NvHtE3GzIOzyenP6YXbHbUfW/C6i/Hkj6hhhSP9KyRUHX5+A+niuTlzf
 kvCyGVHAnlJclRUtmcHe4x5gLyqG51DbNmbCuuiIIy8/nnEhrRSs68XSYesyKYYXSDBgqT9rOt
 puo=
X-IronPort-AV: E=Sophos;i="5.81,306,1610434800"; d="scan'208";a="109661374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Apr 2021 01:52:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 01:52:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 5 Apr 2021 01:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVEtjAnwMq+7oFFuLzAVYmdQjqgIMSBK76xDverQDRTIevSwGMdhlQwANMlWP08EuiIArhdRhytSzmI9LcKzLAFIFI/TIjlJj77olG7tLSMKvcdzOzrbdLZZciPerVfn07fyzqty2fTpC9d/gsFJpGNRIKM92VAkHqC51f2DnSFiXxcVnZpmEtVYy+E4q9KlSxBQR5H0HcqZNypfCCHDZK/ATjsLBGam9Cd/FMUiV9se9kVEKyFWXcOttN69IPa6jEjW/gB7ZP4Gb7Cm1CAWlmXOkY0IlUo23SEdQUhwl2XQPNRjxRzzpwk1/qPyrXIwJmKA1zVfmJOlrI02/SsllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CyQPfW7pwrIetjTDOStvLw1sGI1NjPo+o/TwR9wS10=;
 b=mvS404zK/9nrqcPEhCJv8ET0MI5Bv0L1A1bri9oK4mM4m73SbK3tSgZap/lpsZQPeJT/sUKVso/TBMGVvusiEPFJnwc0+4DjYUzI1CZD84m5Tz++Jck+HgfKow2dJXqyBa2Zin2deM/yAzKitB1cqMpNH6N9SJwKKw6wmWt4g/5oKho5MV8eVMVP00+zDJZSXcCYSYQc7ixVbmseQYjJzUH1v3lq2tebLLOx0urJw0HszioYG2Dzf6tazn2k75PWtjInlaf86qB07GnVUVkroo2zqa+6crUoKNIjbP8nvvksS1utemr1zxdWGi38NCcq4BBLeY0cbbKn/k+7FIieYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CyQPfW7pwrIetjTDOStvLw1sGI1NjPo+o/TwR9wS10=;
 b=Dio07oMfuueW/2KV28DAw8qvNYAISx7Ii/RIJPSLTi32uAbI1HegwCX+pbfF5Fbm03LblmfPjXrgB5LDjRkx7BTYG+ojhB/ZX6zlC+wOe9LP5YFl/OpZhbNIj25N6fCaZnKxl7oQVoHMeUrSMvur2T5xkGkdWx+UJRslLqcEM70=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2685.namprd11.prod.outlook.com (2603:10b6:805:58::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Mon, 5 Apr
 2021 08:52:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 08:52:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <macromorgan@hotmail.com>, <linux-mtd@lists.infradead.org>,
 <vigneshr@ti.com>, <andreas@rammhold.de>, <figgyc@figgyc.uk>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Topic: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Thread-Index: AQHXKfj2Ve6ILG5rqk67W5iaVE1elQ==
Date: Mon, 5 Apr 2021 08:52:11 +0000
Message-ID: <9930cb45-cd30-9cc5-c099-7cc547ec60d5@microchip.com>
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: hotmail.com; dkim=none (message not signed)
 header.d=none;hotmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b46ee78-9bb4-4471-e6e4-08d8f8101a07
x-ms-traffictypediagnostic: SN6PR11MB2685:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB268580A8A27599C5F4D76622F0779@SN6PR11MB2685.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uUm1DRaT1sfRMQUcnbadbuEVVeDu5BRWaXWOjnCN5Fb84Pm+VYctC1goWmRmtfztRSC4ucbhOXcMLM3ZlsGiNJiS3J20wpRAE2vS0vb2CIkbOwL95NwNnd48XDnd3xkeG43ood2Ww9ZV6zVrAibcM0M0eqEmvorAH8aH1/SrUAeByAVuojMsRfoC3pCLid+O/R2bQKp5kJnUc9rF9UP/L8ZLGyaHBlsGdewUSaWTb96BXDs0r7Gh506nwUyDZupKHANZ4rpprXj940x8s1kcf9jkmxF1AT9sp/ZsnZ0i4IcaXO1fyIeNmRE6MJ7QyuKZk11+CbdUmN4GYOMnoZ7JdZxpseUMiXGUQYS9w1zrrYn7SC+FO9tR3FmUOW3Co1vaXGnzkJJA4e4S2Z9QKo2X1qSrOv0aADPueXwOJ3FBNthCsVqxubolhd+nJp6KvxCpMLSlKe09Q8tG8BJLWpl6pXHsipn0PrvlQdsxVdIxLIs7XrnwiJ5WZTdvz6iSoqc82lZotZZ2m0ezUakpybNj4demdJmxkg9gLKkOrSJTc9oYFpk+hwOdHIDb0zQdgbnqTJUk5zcsblgryMKpvIBpYpd1RyEtMn44ZLsDVSHCsHM6bIT4MYIpF6hDFzuXeXo+LXGYJnDhLyIDrc0H7F3JKuM7wUncV4rj05yuhvEBeXz8edFsJzrULTCmtT4864PNBEfOxWdwKoW3IuVjqd/cakjMZ6zjuvJdPfaDE8W4+/ChSI7XO24UVkAFffqjMEYXxZjECGNetubfb0iJeV3M0IE0flCRpzT8iWrPo8Fsd3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(366004)(376002)(346002)(396003)(76116006)(6512007)(966005)(91956017)(66946007)(64756008)(66556008)(66476007)(66446008)(86362001)(110136005)(5660300002)(6486002)(54906003)(8936002)(38100700001)(478600001)(83380400001)(2616005)(31696002)(71200400001)(36756003)(53546011)(6506007)(26005)(31686004)(2906002)(8676002)(186003)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cGYrTGNzdERNZW5TeVUrWklud2RmQUh6RG1nZkl6M2s5SFlLQlVUQ3RsNGt5?=
 =?utf-8?B?T1dSOTJaemhzcFAwQngzT3JwV3pES2xTTmY3R2dRUm9TTEtCU3BOMlA1T0NP?=
 =?utf-8?B?aEkvVmkwaXczaHZhamVYZlNnSnFHSG9SazlsUjJzZWpTcWlQbG5OYms1aDdV?=
 =?utf-8?B?aEM4SmwxS2lMN1dybUZYSllVcXQ0RmtmcGlDc3QyaTRPdG9YSGFsL2lNK3N4?=
 =?utf-8?B?bCs0VGhDMkU4SEFBR3FSWExiZmMxTkNQOFIzc2lMazhKZndtTXExcEJvR25T?=
 =?utf-8?B?eUlHeGZGdWxqLy9hSVYvcDQycUlGMmRidnMwd3YwSlB4ajBFN01yY0dOL0Jn?=
 =?utf-8?B?MUY0R2sxcG1QcHkxTTZFUUNCd0xPRzFMY2RuZEhSWUtybzJsMFpvOWcwclQ1?=
 =?utf-8?B?L3g5VGpOTWxyby8wODl5eXdianloVmcrUThpKzRsZFl5Qi9TOU9ETTJnT045?=
 =?utf-8?B?T3NuOW9GbzlxNjVyaEgyK0hoRjc4WURHSVhDdXNzMGNQSkdGTkpUYjJWVnhF?=
 =?utf-8?B?ekhZV2JidHAwMVdqUGZBZUtTRnM2QjRlRFQ4U0lDbGdnbm8rdUgxb2dKL05T?=
 =?utf-8?B?Q3RYQWp6VlpEUXNEejUrbHh5UTh6ZnRUMXphQUxSakVIQU9kbFdsMWdoMEhu?=
 =?utf-8?B?U1Q4ViswYWwvV3oyUmtXZ0JVYkRnTFk5MGh2VTJLbllhZDc2RWh2THgxQlBU?=
 =?utf-8?B?czhMN20xMk9HL0FuemVrYlFaSVc3TjlvaG1TNk1VTFhaY2hLSzlUVHQzTmVm?=
 =?utf-8?B?dzhRT1h3a0hWZEhqSHFPRjJFRzQxSi9WUFA3M09yUXN6ZFVUTFRieWh6V213?=
 =?utf-8?B?Qyt5Y2JGaEpkYzNmRVZ5MHBlSkNPT2pSYmFqM3kveTR5V3FPUzQwUkVxdldR?=
 =?utf-8?B?cE9rUXNYb0RVNDBKQXRZOE9MRUVyeXVaQk1UbUQzVkJpcFlUaG1nd1czc0RY?=
 =?utf-8?B?ZFhiTEUwZDM5cWs3aTdyQVRNMDlKNzFYL09BUGNSb0wxUUJBT0NuYkdwVGE3?=
 =?utf-8?B?VnpWcWFaZEVXZ0lhNDQ3dmZRMEx3Z2ZoRzRvQWJLRS9Wc0dBOHFWQ2xlVW04?=
 =?utf-8?B?ZklOVThZc1J5S2FnK0R3RXhpd3JTaUVRdTBsU2FHaGNpK3kvNEowb0lKSHdB?=
 =?utf-8?B?b3BWVG5EQytYajVVTytUU2V0ekRqcjhYRWVQSTJPMFBDRS9hbG4vYUlZYXZi?=
 =?utf-8?B?ZG9oKzhFdFNIRXo4dlhzVjRvRVowMldkT2dPYWEwamNXL094M3FCSEdDb1Fr?=
 =?utf-8?B?aUFHSlBGQjl6Vit5aDRldlNXeHpHTkd6WEZ6VXVqQnFTVytNK3VVMWJOMHJM?=
 =?utf-8?B?dHJGallWdjIxNGx4LzBvRXk1SzlwQ2JQNEZOUEgzK3pYM21UNng3WTdVRG5T?=
 =?utf-8?B?RWdxWkFHTVpmRCs3TlRZL2NpOUhWZUd0K2c4WUU5TlVhRmluR1lFU2VwUzUz?=
 =?utf-8?B?RGxBUlYzS3hDWmpYT09FckUwV0g3Qk0yd2IwVTIrR0VZd3pWYjJMeHRLeWFJ?=
 =?utf-8?B?TTFvSGRCbzNTSUZNRWZ1Z2tuellrYVFzMG1HMkZCNDBLcVRrNFVIbzhGZTIx?=
 =?utf-8?B?emZUdnBnZng2eUxkcFY1R1FzSk5NL2RMaDBNdVdDYk9yWFJEQTlZb3JVTzA3?=
 =?utf-8?B?RVpNQzh6QjRkd3JOTmdBZ3Bzc3BPL011b2VSQ3RBamxwQUYvdXVoeWpFR3dY?=
 =?utf-8?B?UXgwbFFsc0tpS3pjd0VtK2xJWnlJSzNJV1VWbzRNZVBCTjdESERGNlk1cWxt?=
 =?utf-8?Q?vhczqu1spcwEwGOzRk=3D?=
Content-ID: <CDDABFBE76530543949DF40D16922E4D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b46ee78-9bb4-4471-e6e4-08d8f8101a07
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 08:52:11.1959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhBjijIiPCtH/UQjU4ZSm4ErxOngfxq1pE5NG4Gh4ME2qdZ4hmwFWfevRSj+K3ms6lXRTkXaUI4y/jPRqaMrskxCfWsTYS9qivcDa3EWWpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_095219_680960_AFB149F7 
X-CRM114-Status: GOOD (  27.49  )
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

Hi,

On 4/2/21 11:15 PM, Chris Morgan wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for a new vendor (XTX) along with a new chip from the
> vendor (XT25F128B). This chip is used in the Odroid Go Advance,
> and has been tested extensively using the spi-gpio driver, as it
> is connected to a serial flash controller that is not currently
> supported (but the pins can be repurposed to GPIO). Read, write, and
> erase all work as expected.
> 
> Datasheet can be found here:
> https://datasheet.lcsc.com/szlcsc/2005251034_XTX-XT25F128BSSIGT_C558844.pdf
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris, we're trying to figure out how to deal with the continuation codes.
Discussions on going at:
https://lkml.org/lkml/2021/2/7/223
https://www.spinics.net/lists/kernel/msg3808260.html

> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/xtx.c    | 24 ++++++++++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/xtx.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 653923896205..3f7a52d7fa0b 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -17,6 +17,7 @@ spi-nor-objs                  += sst.o
>  spi-nor-objs                   += winbond.o
>  spi-nor-objs                   += xilinx.o
>  spi-nor-objs                   += xmc.o
> +spi-nor-objs                   += xtx.o
>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> 
>  obj-$(CONFIG_MTD_SPI_NOR)      += controllers/
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..9a89ec473e4b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2215,6 +2215,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>         &spi_nor_winbond,
>         &spi_nor_xilinx,
>         &spi_nor_xmc,
> +       &spi_nor_xtx,
>  };
> 
>  static const struct flash_info *
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..ee0e45eaffcd 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -425,6 +425,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
>  extern const struct spi_nor_manufacturer spi_nor_winbond;
>  extern const struct spi_nor_manufacturer spi_nor_xilinx;
>  extern const struct spi_nor_manufacturer spi_nor_xmc;
> +extern const struct spi_nor_manufacturer spi_nor_xtx;
> 
>  void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>                              struct spi_mem_op *op,
> diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
> new file mode 100644
> index 000000000000..4eec737e94c7
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/xtx.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021, Chris Morgan <macromorgan@hotmail.com>
> + * Based on XMC SPI NOR module
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info xtx_parts[] = {
> +       /* XTX (XTX Technology Limited) */
> +       { "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256,
> +                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_xtx = {
> +       .name = "xtx",
> +       .parts = xtx_parts,
> +       .nparts = ARRAY_SIZE(xtx_parts),
> +};
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
