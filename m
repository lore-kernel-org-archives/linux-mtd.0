Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA77C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QfBrenRivYX6NtnrvDCSGETW2r23pdZUDu1M/mxPlk=; b=2GmBt6fPeOmOk8
	a7BxYp5TV3yFNA9JnE1xydUQEqGC0ny+XoCcT6Q1Wf+Ub2QyRxf+EgDksw4Idi6zdYadPGnCDbaxD
	F5EFXVMmCqtB2fTyw6l3/xigSaIM3yi+rEgE6MSzzbOsl7ClCV/I5sHlslJsDl5WeZp6amadMHOxe
	G40IKr/Uv9J6UulrL+kGIQ05J9tN1iaC43PJl+3YAv96Ve+MZ1kff2Mvc8obci80VHmwRL1DsEJ9A
	nKiLCjUWfEmC7jstU5jUl1zHWDo26V2j5kp71cBp98jFIofackRuz2hP6t4C9bqr5yVAhd30NnyKU
	PDu7to9Ha+O3mwVJDbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBm3-00A78Z-HU; Wed, 04 May 2022 09:58:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBjO-00A5oD-Rj
 for linux-mtd@lists.infradead.org; Wed, 04 May 2022 09:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651658139; x=1683194139;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5cUSgUWqrL8gaFVo8uVlcvzUuZKhnlJhgrN9qilBfWg=;
 b=WvjGU75eUlPlOC+ATZCGpozY6988NI78z/PUc5ktG7ef74Wdt9GGEl1i
 P2gFzk7ur+jPnvU5qxB4q4/36T9qy1H9xQtLFU+rz0zIfBywTYfsWa/6R
 RauLIN4Xnj2u+ONgSeOLCWSJd6etGwqPZ+PZgFvHXnvclz7eNhGnP0uFZ
 1YHvQxBHNZVtGSoqvsyU1iftx3QbGsZfo5UN2v7R6IUp3/L7y4PljwLmS
 NPy2dw2sGvXmMt93begBeI3za7lUljYeVK0dNMUvhdwWPgJtRPulwdcSh
 7hQIX+T4DyuF6mocrxWL+jwDo+leY6HhkY8fB4bb8JfyFql7cKkPuTEF7 w==;
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="154771505"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 May 2022 02:55:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 4 May 2022 02:55:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 4 May 2022 02:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0sB5UjFeuVdnfS8H4hGgscfhCPRiUC1fD8XlijhCbkvLoaDJ+LA6RNzmLdlbIz7pREh2B2H5eSyph7vZLEyV10qrw26Hy3MqCvx5gAMJqqFRfPjVBrMSg5gHJ2qT8IJYxJACxrKZM0D2652crwEz+1TjxnGQ5u8fWJpyoFJHHzk6lp+2aJJb2n6Dn8+M4ioHrf9SvkDEKqzWnAtzjO3fLvXd0VycuR6RYO24NnkcIVdQH/UeFTELTi3dBVx4ylVcx0e6NnBdRO67kC/ix+rpPLA2QoF+WHamVGklexhJWfe13DYLBPQzC/zQ9Se2+laolsDKxCpBG132BpKD07UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cUSgUWqrL8gaFVo8uVlcvzUuZKhnlJhgrN9qilBfWg=;
 b=R6guu9kEKII3mrY46pEQCuwqoyuEW79f0H8I7J9e2/1sTFNZR5uWcKVZvmeoAp+x5Hy7UwXaGV2F39ElGFv068Mb5rUIr8ZqBDQThvpy5gjtXUOtlYlxcLgU/I51uLCTXa+IKHCpyBsIGUsgyQYrGGdj7yklKf1bvpBF2v+C/DVBaMsofHLAx/zDFhaiO5/d28ZkwYsAG2cQZHsFy9YQ+vfFdu2mpbOGhIBh+5Pp4gMJferW8OXFvupShr/QixZux3fNlElxMZER/ZdZoyOBidTXwg7mDfU4V/VoulaJkUkpGOWT+g60BxlChicyiu2K5PshqKioT6QMEqblgc9hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cUSgUWqrL8gaFVo8uVlcvzUuZKhnlJhgrN9qilBfWg=;
 b=ENGNWWuSNtLtBW0lzhXvzuJWmGlrAs6hKkKukgLbX3PTVrzw2ucA8AJu5iEFFMy4KLdXHadTM4E2o8aOQlb46ygYTjUW75oSJG/7UJOX2+0H0TnV+AgvLdxXO1GYDmIVcDNmZl0jZ5Lb7Q/W2yAp5ZdwO8rzU/+8sk2cOi63PI0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB3356.namprd11.prod.outlook.com (2603:10b6:5:58::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 09:55:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%6]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 09:55:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v14 0/8] mtd: spi-nor: Add support for Infineon
 s25hl-t/s25hs-t
Thread-Topic: [PATCH v14 0/8] mtd: spi-nor: Add support for Infineon
 s25hl-t/s25hs-t
Thread-Index: AQHYX50V4Vhv3i5QMUK5C5jDiwJn1w==
Date: Wed, 4 May 2022 09:55:28 +0000
Message-ID: <97eb7ddc-aa41-b452-9537-fa6713e474c7@microchip.com>
References: <20220503081627.341870-1-tudor.ambarus@microchip.com>
 <4fa61e90-89e1-ae68-abb6-ed50c5c09308@gmail.com>
In-Reply-To: <4fa61e90-89e1-ae68-abb6-ed50c5c09308@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59fe6c44-e150-48e5-4e4c-08da2db4385d
x-ms-traffictypediagnostic: DM6PR11MB3356:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3356045E7C24ED3F1122F0A9F0C39@DM6PR11MB3356.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fF5kNgFW4Pw0V3GDbtGbj7peq+X1ann+r+bK1OOhA6liJ1xa9HS7xi1IxHkYwg+ihS4dv1oomWil334HwKb1JnXEdbhOQX0b3hhP2mheiN2SaF+11/IkTF7WGMdtt4rvUp6yAf3A6sAOgy5FiOawq7vuPcdPMTU0gIEsAUn3rfMcjXsgS+aLV9fP1Te4iNp3mLnHPgKEDu1lRuvDjyYOJY1w11rA5coWB7cu034Eh8Gg6P5Bfi3ImPyfq5BuNQPZ36DqnhvWODHIuoNuDFFj7mPHQ4TqHWsAI/R5TlGEFbij2ubIuxOlQaUmBP2PkiCd6PlgVRH8s+AsG6R+RJhpqvH4267QaI1vo8qu3e1ZjvwCeDHDhCbxDFpWeyCKPH1O89mB2IzQAuBqwYin+otZj3C8m4XzznK5IpBZPZm3/lENEPya1nYPEjREGwJps0pccd0o7KBQXtXdOEgxSoZ/g5m1ZIsrK0xhOaUOlBNb60aHe86qBDa5Ik+CbwUTVlsr1yDhqpi9ga0Wc2diVvnzDw2PTHbocMsGsQxFzakj75DQtCVctB/MYWPvDPFVCTjDKlWQ35hKSnqWLe38fEEXVGu/3MVJAnaNjiKx7bNUoA6EE25syxljb1HgsN2aFLT2HptEdzCKJwH+oBFYjhqtmJNNZe90haZhpAKQBkt28g7ZzHQgU5hTPEstX+Vw6/sItJUCKldXj/W412QtsAwXS7qchDzq05ybSoaOHqw+TDvcaNuoeVzMI9pSJK53Mkgp+43O+dCOj7EbvWZvEBt9zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6486002)(508600001)(31696002)(71200400001)(53546011)(122000001)(26005)(6506007)(6512007)(38100700002)(38070700005)(66946007)(66556008)(186003)(66476007)(316002)(2906002)(91956017)(4744005)(5660300002)(36756003)(76116006)(8936002)(54906003)(31686004)(110136005)(4326008)(66446008)(64756008)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmFwWVc1cUpKR2hKQUtuY05CRE5LQitxWE1IemN1eUUvdUMzd0NrY1JDUXRr?=
 =?utf-8?B?T0pNcWFvcFJxOEswOGVOZHI0SFNXdnVUaU1zSzFVZGJNZmk0UTl0NGFoQm5h?=
 =?utf-8?B?Y1gyRFFsZlVvbE00WkFxQ3RidjFxdU83THZXWFNtZDZIVXVKeCs2bGNRRC9E?=
 =?utf-8?B?M295eUVjYThaZlVNbzdZeSs2YzN2QmFyQkM0MnhwZzZFNDJlUGcwYkZKbEhW?=
 =?utf-8?B?SmNrSUdsM1ByaDA0WFJtUjdUUW9Id2c0L0RXQzcvNXVGRUQ3Q2VTSTFDQzJk?=
 =?utf-8?B?Wm1VbjdqVTZwNUJUTk9RZGt3bk81RDE0bThhbDNvRkl3UjM5amhrY2tsYzcz?=
 =?utf-8?B?U29XK2pxcGRqOFpYVWxCSUZRb2IwRDgxdTJZeEZSQVV0VitEbS9Uc2xMWEVh?=
 =?utf-8?B?VDdFVjNwc3NrbnMyMTRZT3dPMTIxQlQ4elVkU0dKdUI5OWZJSXptWm0ybDFO?=
 =?utf-8?B?T2VnUmoxNGpydFJKdVRBOVVmM2NkR09hZy9pMUY0b0VrY3RFNmptb3NsdDhj?=
 =?utf-8?B?Z0NvelZlV0kwNWYvVXphU2Eweng3aXUrOVBaazg2clJMdUh4dGpoQ2Zxb056?=
 =?utf-8?B?NjZTd3JRaVVoN3VrMjRNd0RVL2J5UTNscVI3UmpEamhZSE8vR0ZtQ0pxVjBX?=
 =?utf-8?B?RWdxSm94U0ZXVnZ3VFNhQVZkQnZYUEtoeU5NRzFWcjU5SWNWd3RtdjFEZThY?=
 =?utf-8?B?TnVkd0hWcTdMKzEvWXFEUlVUQVRYRWVZamUwK0JkamZpMWR1VmRqV3YyOHRl?=
 =?utf-8?B?WlNCcU5Fakd5NzFoQmF6Z0xmMjVMNTIrTzhURHh2UFZOL2x5cmljOGRXdUdW?=
 =?utf-8?B?Z3UzR1RxbXI5KzBXbmxaTVNyWTd6M2RPYjlLS2VUL3p0K1BpQ1h1aHVZaUl6?=
 =?utf-8?B?ZmhYV05tMUZSU0R5QUpFSjdIZmRER0o5TElXZ0JuQ016NjFmZHZuZUF4NnhB?=
 =?utf-8?B?TENJK0tRTCtTaFBpbkdoM1YvaWlxS2l1Um5PSXV0NzMwSUQ1bklLK1QxZzJO?=
 =?utf-8?B?OExndU9VN1l2TWl4dXRBVXNROThzU2ZMaFl3SHVzQmJGZm5DSk1LbW1icUJ3?=
 =?utf-8?B?bEE2QkZQU2ZVOEQyWnBHYXZWQlpUOG5haGZDalV5cU1tSDZVc1lqdStRVGwr?=
 =?utf-8?B?eU9IQVIwRXIyYjlBckNBWXBIOEZwb2lONDh0Mi9wdm9zTzNqbFhtVjVLLzN6?=
 =?utf-8?B?Q0pTSEk4a3R4QjdYVHFCc1NEODRCcW9pRXNvSzFtbG1mWExFMVM0eWVpMVNT?=
 =?utf-8?B?U2l2VTFhK1ZIOTUvU0hjbnN0T2p2dDJ5K3grMGhHS3hMclJXWGk0eVVnRzZr?=
 =?utf-8?B?TCtTcHNNNDgrYVQ2Sm45cVdwaVZ1OWFEa3NyMHN5WmczRVVTZ3o4VmU1dGZi?=
 =?utf-8?B?eGRXVWN0c0R0eFFwV1AzVjM2a1V5UlNsZkdUYUhpN0dueU0vSkJkdTBUSVk4?=
 =?utf-8?B?TGFjOEcwL25kNExNTnlYelU5UjFOdHkzUEhkTHRMR2RDR3VwaGxxSUhtRDZE?=
 =?utf-8?B?b3hlOEhuNTVCWU90Znh0MUZETGxhVGl6cDZsNG80aThzL0R1ekdGT041Z0Rt?=
 =?utf-8?B?VENDYkhCWnJYakFXK1NyNWdXUVkyTDlYU2xRSldvQjloaTNvVHY0NTM1UHpE?=
 =?utf-8?B?RjJOOXoxbzFXOHJmZGhxMHFSSHpaYURHYlpzZElUK1NDVE12SHRDVGw0NjFk?=
 =?utf-8?B?Q2xZd2NrRmtwcnVvdkJXZmd3U3JubFYwL0EyN2RCVlJsUlNtWUhZMnp5Tk1z?=
 =?utf-8?B?dWpUdHFEbWVSM0VXOU5OMmFvbnBDeWxmd2J4VER6cnQ2TndoWDB6cGM4QTl6?=
 =?utf-8?B?WUcxcll4RWw3WU1jUFRZNzNrUCtoNXJyY0l5WGFPQTAxNW42QkNYbHh3TmhK?=
 =?utf-8?B?UWNIVDVFTmc0Nms1cjd6dHFIRkc2VWs5WDBiNGJOcVNpNVpUSVVmNE5oWHhY?=
 =?utf-8?B?MGlzWFhSVDBNRTloSWhUUzhLN1VsWUwvdkpCT2xWQ0tBNTREMmRjU3pwTEd6?=
 =?utf-8?B?RDRCQmZ1UTBBTHovN2hHdlN0dVpIWnJWQ1FwM2J5STYwQUhXY2NNdGNFOW1D?=
 =?utf-8?B?MWFRMmtrQWRKeVhPbTBSSEdGQVU2c0tqOU5pdkF1cXNDUHhrU2ZTQ05TL3Rh?=
 =?utf-8?B?Wk1sS2JPU3pyeFZoWHFQZlppbFNQKytLdjFQSjRCbmVQYUUvb3VKMUJZWEpk?=
 =?utf-8?B?S1UvSURqSGVvUkZkUUtucmZ5SEhvanRYNmpjeHdUNllORnZrR3ZGbFRZcE15?=
 =?utf-8?B?QWQrOCtlNFVVMzUzYXMvbm1zTU5pTHpBcFduLzJXUEc0TDJmdVl6NFhqTzZH?=
 =?utf-8?B?TXdDVkJmNEd4VUdhZGVobG5NcUg1eWVnamJYSis2QTFIUldvYUZ2UlZFUklr?=
 =?utf-8?Q?xs6W4gANR/8Yq2Hw=3D?=
Content-ID: <ECCC90750AEF3945A0C8BFAFFF961819@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe6c44-e150-48e5-4e4c-08da2db4385d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 09:55:28.9035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drbmn23Dfg8jzsmdUZkq0EX+HWe+L3GdEbWaWzCPk2ZOuGiYGO7kzbj+FEgQ8YZYj5KROXREEZ4eSo83xx+vBaz6/xB9heGEYakBbMdZaXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_025539_234446_1F1E2746 
X-CRM114-Status: GOOD (  11.79  )
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

On 5/4/22 10:56, Takahiro Kuwano wrote:
>> Hi, Takahiro,
>>
>> Would you please test this series? It's only compiled tested on my side.
>>
>> Cheers,
>> ta
>>
> Hi Tudor,
> 
> With the fix in patch 8/8, the series works well on my side too.

Cool, thanks! Let's wait for Michael's and Pratyush's review before submitting
a new version for that small change. I'll be out of office next week, please
send a new version once you get their approval.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
