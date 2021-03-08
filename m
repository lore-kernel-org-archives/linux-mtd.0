Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C988C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 04:55:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDF636514C
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 04:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDF636514C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JHWXZOml7RApIw2XRWToYc38o9I4DXgL7rZIbb0HJVA=; b=lUui+7gtjVrZ/ztUaW5rW0UzP
	4+SE8mQ5a2fsHzS2pjhrXAEPKiJ48pHzVWAP3WTPojuig6AULdwpRoKU/dgWldlPWnLwkuKb2bjbN
	+TOzo+kM+yee9P1yV4gQ1L8hoYBs1BtHDm6IspN0wIsLys7s8gT4hZMt4EtEgmGOlII9/Qdoeia85
	SurfHHPu5x/McNFBSNft+DoXrQlRgBN4u3+QMEnqfnZ0sp5ov4R/yd6HgMQN0gSAQX3mcNmmiFzK7
	W7L2bbcoOilWxqlf6xF8qdu01wH07E6F9N8WtHS6plpsfNwOAjBU/2vSEpz6XJru/lm68HVZFLY19
	Tn/1kzC/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ7tz-00FAjr-QS; Mon, 08 Mar 2021 04:53:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ7tu-00FAhf-7I
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 04:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615179230; x=1646715230;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Fy82VTg1b9UgSHROYy3MNBU5Ey//eRNqWzTMT+AmKKo=;
 b=O4k3/AqarGK0oDXhZtbgwKTA9v2EpyAAgU0uod/B7s1zuslqjRG4tG+B
 +5fRASlcf+cXmfVDZGgKKHXMivc5Cj46jzzX4esPTNireOIBNyUVeR3+g
 0UyuyQgP+UUnOGupOgQQYBJtx/XFc1P1GACU+xsS0WEm+OOtQkS0dYFX7
 2kEzIKWCp3gI4L104q1qpr/DSxWiQT1FDYtjVLFlGUOBIj/wr3EKJ39wq
 FA1fYn0rYo2vYEhzfIhoCowH6OLkqt5eYXxRCpQJ9rAZX8dxBhiI1A+4v
 fJl6WJ3UraaYNJc/iVkZ8n5xO5jbrb+hO89x+ciAYQPSELUTLOc+EzKDs w==;
IronPort-SDR: QYKw6EQwJnD2tfmCqkg1U6+n6En/Qty2Waby9MZIldsuxCdWfE9J0Ll6myz9RjzNj6FGqhBTW+
 W766JFIsA9oML8W8WjMfx1zbwn9eRr8m2v9u98wZWo9rxpl42zB3BFFP2xT3CK7n0+E/7jAib/
 9wFBVLaQQuu8X29pQj7211RyIhN/ZH51+o8O1lSrtDekKCjd+RbYsiaT0NVXPtyN/iluP9eG/X
 cEVHCcIMH3/ix3+uhTteRgDUJSrBntwtZimJFyK0Nw6jXl0UlOTN5uegKSg0SVCsQu6Urjyjpz
 ZF4=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="109100072"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 21:53:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 21:53:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 7 Mar 2021 21:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbSG3SYf7FMqzYU1Cz4K6CHnMRL0Ub+H6f9Zlu+RssHgAZNKGx9ikGsFpSEVau1EuuXX7Lgt6lXKzkdgxU6B7Uv5XbANj0nujLPSUpWII2DwE+fQ8ZWWtY3uwOpDwnNMpQWL/PGrFEFVoXcS+zJiDA32FXjhnIxdFWMMO+KJUv8cRfpkIycjsBrqazYIW8sZb1aekSEdYUnqDKv41zRQNgVWa8/kx3IOIir0WZ4J6JfrclqDDLkbcCKy0M9m+xe4deCDVGBEkiFNs9hRCiqiJcyOnTN6p3GGidcBPS2aS6KPsgl40Ev0ceIpahAj4Xq+8imn8ZhRsgEA7lbT7nHNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy82VTg1b9UgSHROYy3MNBU5Ey//eRNqWzTMT+AmKKo=;
 b=JHniblLEqnKHBOxc/AFN4InhvbR/sEeEgzfR5N7s32hs706qV2QXczNmFNQ8DyWiEb0XKZNNlt4lKBr1rszmbucXSG69Y08lI66u6XQnco/LFoyJKHYuT2bZF/qSyawZJoy7G9He4UUjA8MWLAogMuJlkn7gswb3R1Jsa00Ny50HSMSCRrkwcoM3yJIOrB98O43fnnJPhetqOKW15caOXSXstnN4o6oE668oQOzCV+YpdBKfxNKCRUqvHnWiVCecgD4wAGJXI55JYoSvVakyP+OzTl+WbWjfd+tH+2Idxnq+QYuXsMrQY63u4n69W2eqzQHlC5JeiBAyxkNPeexRLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy82VTg1b9UgSHROYy3MNBU5Ey//eRNqWzTMT+AmKKo=;
 b=QchAuIaabm/H/I1Ykm6GTT6cISHOCDqWfltheqOj0pZlgyZVsuZGdUIkrxXogOhs8LsjnwzU+ht7r1j8RCYX0elerW2XycC0qI6xKhaJ8P1RlNBz500WrwEJwM3mhRc+pS0aU/uu105YeuI4xM35quPOlUVX45cT5sXYyfUrZgw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 8 Mar
 2021 04:53:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 04:53:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mbriand@witekio.com>, <p.yadav@ti.com>
CC: <vigneshr@ti.com>, <bbrezillon@kernel.org>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix out of bound array access
Thread-Topic: [PATCH] mtd: spi-nor: sfdp: Fix out of bound array access
Thread-Index: AQHXE9cCL0q2/sedikm1K07/izxd/w==
Date: Mon, 8 Mar 2021 04:53:42 +0000
Message-ID: <5585fd98-3aa3-e95c-e3c1-d3e434deed73@microchip.com>
References: <20210212154717.362233-1-mbriand@witekio.com>
 <20210215151414.6542yhluvx3yvbia@ti.com>
 <20210219075056.GB3519372@WIPC17090108>
In-Reply-To: <20210219075056.GB3519372@WIPC17090108>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: witekio.com; dkim=none (message not signed)
 header.d=none;witekio.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 882faa0d-fd28-4187-360a-08d8e1ee25a8
x-ms-traffictypediagnostic: SA0PR11MB4655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB46551BE2BAF7C92481C84428F0939@SA0PR11MB4655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:171;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Um7lw3Vb1m+vJlPdj4Smn+V52rpEQp05MMOxeTbS8sGgac0Bz49hpdoLldWhAyOU+n/3GAx26Tzy8H8HCB3R3eqpnGLidFQ26qzbBxXwK0nch8AKl9NwNU30Vxvt1uAqGwwtLGmnZjhPEoJWWtDq9su1OjS/0FTDrJXBk5KR/3AJd+qhQU+Lht3UE4GuSMQEJdAZUnWikK9D+cLVK7GzITEpcK6q7avl1oMILHmsjncgXJPh7zS1jj5V9wP3WxkydYGvIbmq+qfR3Pw7iZU35WhbE/nHHcRTZTxMge2LE7oH4xQfQFIb94eXvgv1UJld7zVnBzWpdO7brQnX+aMRoF6k8FyWadKnXPFGZsTCMmX1b21Mdg3hL5L1f5ritjjJL+pFz9YMuQa4k9zNCZE3lAGpcuVDtqy10ufGanMm5p+WBfdidQoAbSVv8E9woKL0EpVZHREMaV5wGX8CnIwi8sVAmTqc5Tk6DkUl6nAnFEhOm4QaDejQp/h74QniyFIf2EVtTZYToPWEdtDYS64p1L9+AHaYLMGbTBmPmeBEaE+DrgdIPOZDxSBIVDEDihVn4Tp8eSAl50JNnsFXfRCg+RioFfdchYNuC6xJXcIBg3feEV3RYjG/GzpuqVuNKqMG96mXyvkhn5LBnBowqLdnmT40tdgOv7082n9LGJ0rab+HOgWVWmJR+cySm1pMhGim
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(36756003)(26005)(6512007)(316002)(186003)(31686004)(66446008)(2616005)(31696002)(6486002)(86362001)(4326008)(2906002)(5660300002)(4744005)(66476007)(66946007)(66556008)(478600001)(71200400001)(91956017)(53546011)(76116006)(6506007)(8936002)(54906003)(8676002)(64756008)(110136005)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QnhYZmQ4RXlWNTljN0c4Q3dlaFF4bFFRSHdoMUNnQXYyb1hmN0hST1FCd28z?=
 =?utf-8?B?WFpnTTJDZ2k1bmpubUcveFh3TWVBMWo3cXVBaXNUNXRNcW8vcmNMa2ZRdSt5?=
 =?utf-8?B?bFRLYzhuS1dna1FuaUV2b1RtaGtJNVRFT0dEbG1kUm1XWktOS0Y4QlQrZjFS?=
 =?utf-8?B?Q294Qlk0eGNGWWR1RGY5Mnp3VmUxMkI1dlI3cEVZdWszcXlyUEp1MDRnT2dC?=
 =?utf-8?B?Vk5lUXZRL0F6SzZWSVg1ZEl4dFJYSE8xZmZvZkZMN1FpRjVaYUlhd1FBUmNM?=
 =?utf-8?B?M1kxVk9iK1JPZTR4SGM2OUhYeFFUMWtuTGZmc1RsVExUTmcxWndDRjdKdVNB?=
 =?utf-8?B?YnN0V2R4SnkzemQ5Snh2MkhPNVBTUUNUejdWbkxadEZoNW81WUN0emRmZG1t?=
 =?utf-8?B?WnBUclBYZ3VtOU9nVzZxaHRMSGVRTE1tVU01UllpN0tTQ2VUWjhGdkpKMDg1?=
 =?utf-8?B?YVNKc2IvMWpFa3locFU3T1JISTB1TFFFSFBSY0NLQ2Q0a3dIZlBXaFB0MjFJ?=
 =?utf-8?B?K0JVRHBKbTBaeFNFb3NhMWpCTGNWUlk0SE9PYndYM1kvM1JzUmJtaGJuY0F1?=
 =?utf-8?B?ZjU4V21pSjZMN2NKZGs3bHVRZGFrT0YyK3VFSmFleEt4NGI0dWZEaElEQlJx?=
 =?utf-8?B?eXJSZDRMa0lVVE9Qa1lGRkx3RitSam51emlLMkF5ejVHV05xQ0p6cC9jY1Fa?=
 =?utf-8?B?VytscG1KRUh5VGlyY2pHZGJZeXcvQ2FpWGZjS0tWRldGYityVFNFTnJVNWZY?=
 =?utf-8?B?NmgvcGNzWGhNaFFiay9ZS3Z0SlQ4cHAzTW84UTRqb0Q4NkZyV0NnODJrV3BC?=
 =?utf-8?B?dndqeXd5d1k2UFNXaHVySlJvMGl6WHNvaWhuSXcwVW1rWmFkaHA2UWJ4aHh3?=
 =?utf-8?B?Z0oybEd4NlVheWdPOUhSaHlPelZIT0hYUUNxd0hzV1FQRCsyZUZCM2NkTzB1?=
 =?utf-8?B?d1ZDNTdNMjRWSEZ2dG9Wb3UzRFVTTWc5K1BYOXhrY05NTHF3R2FFeXFaYkk5?=
 =?utf-8?B?cUJuSDlQZlNtWms1ZDBXc3RYY3lQbDY4a0s5dFVicVNBd1F0UFZnTVZlU3kv?=
 =?utf-8?B?RFI2TTJ0bGZvT3dYenAvR0RPVjhUQW9DbFl6cCt1bGtTaUVZUTcwQkNVaDhs?=
 =?utf-8?B?K29YVExmYnl5MHczaGN2NjFSV0JIZmpQd0NwUFRLcHB3UVdVUnpyak80ckNp?=
 =?utf-8?B?eTRpSmxlWVhLSXRKR1ZkR0xYUkJDSHY3WWplN1ZGMHBXU1kvb0hJS0lGR3Jz?=
 =?utf-8?B?Y0F5Vmd4NDB3WlkvUDFtWDlubVVrdEEwd3U1UzBVS0pGZStoSjVkbnJJYzRo?=
 =?utf-8?B?d1pBcDFTdWh0a01WM3MyazMrcktyR1hEbW92OFBTaXZ6N0MvV21pQkFqempT?=
 =?utf-8?B?Y2ZRaEdSVlZqcS9tNVNZVGNKUmZFQi9ZQ01KN1lsK0UrQ0UvWWV4TXIrQzZn?=
 =?utf-8?B?aHUwTy9ISWZNVDgwaDIxMWk0U2h0UjJVazNhSi9qUE5GTU9XSDZyOHhaRVo2?=
 =?utf-8?B?L3JSeVRzREVScnN0TzltdHdzZFpabnh6Qkk4NDVHeDJ3RzBDK0FCSk9mWVJm?=
 =?utf-8?B?dkxBSytNUWJRc2kzYTlQcmVRRDVUUkMwbDA2R1lkbzdwbytQQmhoeHcySHBJ?=
 =?utf-8?B?dmdLWEVKNXU5WWhaYWJtZDdLUUJ4ZjU4ajJ3NmQ1dXZXOXlIc3drTkVQZXM4?=
 =?utf-8?B?V1FmUmtNN0NuanVmZ3ZCbktPRmMvbDJ5TzN2TUxMT1JDWVJGM1ViZmFJVXJT?=
 =?utf-8?Q?Q4pPrnhUJ/QYULab2g=3D?=
Content-ID: <939F80B1CECAD04CB74DA863B1994CDA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882faa0d-fd28-4187-360a-08d8e1ee25a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2021 04:53:42.2126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUpdte6GwPUxAYlz4PAzerUgNK+cOEsOpu++eloKJszEP2epAJ3LLt6VWCjkHcA5IopR5ab6suyi5GAyytMW2hA3fWhsUzD9H7YfZL+kqq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_045350_937458_32AF432F 
X-CRM114-Status: GOOD (  10.78  )
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

On 2/19/21 9:50 AM, Mathieu Dubois-Briand wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> I just came across this commit (9166f4af32db) in spi-nor/for-5.12:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/for-5.12&id=9166f4af32db74e1544a2149aef231ff24515ea3.
> 
> So I believe this patch isn't needed anymore.
> 

That's true. Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
