Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E2CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ra5l2QOtaogcdVIQzbGul0QrxteAavs90KpVIoB2pi4=; b=LarO0kWvMndavQ
	bLJvcHhrypZiVAa81GJfgIHVjtCYL7GSk1qpUa98i466pIo+DTcdElrbe4y+90LtsFb5USu8Bg1/T
	9JCbnrsPJDkxej4nVlGbXH7NhBbL4iq3Mhz5xnGg07LEQ6d1J3dSmMFzBfLZ7/WB7xwkgPCCfTfpb
	YFTmGtl7RQ0FjCq0OqhRf1fpAubUrnNcQV4as0OT2e3beKO40XjhvLIDz7oo9ilFSWVRys2zEvmt/
	YeOLu1RRcI2fHadt118nXp2VTAboO/ah/P9j7XqUkm993qJLYwCbOUcMxmQsVZ6/qtH8Y9QA4Karl
	lWWMGrQUyOGjGnEg7DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbH4-0001Eb-KJ; Wed, 27 Apr 2022 06:35:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbGz-00019p-1k
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 06:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651041336; x=1682577336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Nh8gr+j8PIS4a6uEBdySVfsm1eBzEcmOE1S4GNkvUsM=;
 b=TJ+F5J+NsMNgsEukiUdaXvZThD4SLsCR/wW1DXnQstQ+dnvGpQ5UEWzL
 Vy1pbotgmqOkv8ctZsZTs1fGHySPI7BU/4dL1E4MvcTkHn0Uhfv4uOmcd
 l+vO9PUclmi7S9pso7R+bvf3C1QvXypDaUTLnTmnCJKBBzQKD05obeEDt
 4bZy3s0h62XxIq5yzDnCL0WCSBV820IUo2AoVcPF6YfBFK9c/UX4v8btN
 0y1hVdIF79rdhYESC4gpkqHOD2JSpw8KGTFucAj1R/zqMehsrI5XNkmqR
 8gCWqIA0ZFVGX6LLqbnh0aNxy+tAid1QFDh4iZ5bhhbt7d8w0EutipqGa g==;
X-IronPort-AV: E=Sophos;i="5.90,292,1643698800"; d="scan'208";a="93693266"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Apr 2022 23:35:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Apr 2022 23:35:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 26 Apr 2022 23:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGUkipIqzXYFhpEABpCez+Twkon17mUrglIeuvReepXjQlsGpb6IGlxbldDrQSMNbZvKou25dAEHt+eu9Lf5qM9+vwpUyFvmmlrzeOtckpEFMxyDI/i7sm9JLRSQcgZVen9WIg8+SU65PLhW6qK77s1eXLLdS931qnWBGOmOvknM7QpRPuM93rvk9uHKdcZ0u0dZysVSP3qb9cjAWvtqk3Fr/mUAby/NIKhLl4yD+8JrIZfEaZBTIodUdVxlyC7ZljXquLfzUFme0MAo/H1kQitqAEHOs4O07MwEahbV49ljeLD6vvgy/rE5OH4c+6aQN1tKEJQBkfNnnoTO6OwIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh8gr+j8PIS4a6uEBdySVfsm1eBzEcmOE1S4GNkvUsM=;
 b=cvQxMRY3Agw5UfAV3i5DZcCevgv05Ak3eBrbn3GcN68ePHlAiNA8wgiWLlUjIpv6m+zCsJcasPKuYO1Gf+W9ii+DULyjxgxDfEvTWCGB29WfE4BSvm65z6/ydPN2TLU9rmsA4l9Vbi1tVpq2OZzutBQ9NAlN6u4R5jHN/WZ7nNcv6LHvxxcew7mug+VqhyzQATNU8oLxczLPIuLa9QmW/0fbRAR/BtzkWrJch/1RMBmHRZHjbjAFS1Aiqnk9/q7vfHr9cLAW7kUIQk33NhhwiMktyk+2svUU2GvTmtPm7f/Vb1SZCLjVSvT/HA6iGnYqesdv9qp1eQAqG815UXTWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh8gr+j8PIS4a6uEBdySVfsm1eBzEcmOE1S4GNkvUsM=;
 b=l3ujC9IsSwMRdOHmL08eqdPxxGFOh+imULsPqx3DHr51cI5aDJ9LtslLoX4bc6EjgyN2k90duATcK335e2NkNrnLkOBlDDYbuW3+md5GxolZxMF2nzrlK0cnDXZNfTBjXAUGoGPEXroRnWUyR4CXpGzxmgrIURv4+pCysnZX0h0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 06:35:28 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 06:35:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>
CC: <Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <p.yadav@ti.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYVWvv68wo3t3IT0asmq5tmkva9A==
Date: Wed, 27 Apr 2022 06:35:28 +0000
Message-ID: <02f53c95-d6c1-9238-6499-a29e8d6359c4@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
 <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
 <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
 <5a7ba92487dcb1f776b76dcf069fbdf5@walle.cc>
 <1ffd057e-c66a-7704-4434-1584bf9be701@microchip.com>
 <aea77eb7-4cc9-c93c-8c45-241dd24773a3@gmail.com>
 <29e04234-3cdc-ff52-ca9b-2055464c3861@gmail.com>
In-Reply-To: <29e04234-3cdc-ff52-ca9b-2055464c3861@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 412b460c-1c55-421d-818d-08da28181ea0
x-ms-traffictypediagnostic: CO1PR11MB5170:EE_
x-microsoft-antispam-prvs: <CO1PR11MB5170DB4DC28B7B31271A8262F0FA9@CO1PR11MB5170.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VLMbTeJRsftUJQkpfa9kzJOO4XGc3mvSlYHXhtP28c6dVPwTkm29bZ70u/Yb7v1e0gvJNC7nQHyhHAueJkJlaSWqvEEpTqxeskCregtc1aQujFx+MofZl6CyupnYumBI53nSwczEDiffFg+Jhh48S02439FVDr4ah3pac1MZvEY5jmj0OGhcS4E2fqlrvff1VlF+Zprry4f0koeqQBIJomsGjbkIplmDLGQjxVxRMQG0xRnMTqwh+OpWXiS46gdlZpzze04LzPjXgI3jn+Zu73q4gS3j4nGZ1EQH7CGQQb4J0EFi4gW76yHt2sjKruvG7bywpKFVHKJ/jvZLhdvzho+mRXf3kCWM3cIA3B0daQfuBkh8/QX2ET7w6Wsfq90i4fzMEzDfjeA9rXLMdmY8SYrIHd7OjxiskKYxcUWqj0AlulsD1scrjAeJqmo0qmhh0zJe3zHNbkI7WiVbASQeBS3TDK393tOnM+piR1lo4JCmIj7W9fAVkMpYZGV/XrMpdifiM1XS1E5zuTStE1Qr+7r9Imd03Xf95RjeW22gQbVlRcbMJkCocB6KANJiGOPTLIk5gPRPLPHdsOipwk32vrMYYULzYdSkwtOFkiI7hMFG918oxJwRKImMNjQiPFt47Y+1FQmj95BJ+0a5fN1JmGWTvqs6RRzCu0RQHh1mkS66p7OTBXQtu+FScd1+p/B45r+va1r65oQx/Ab2AXO3ib0oXmGZGL1aPNyoisMfmsOJCvmlcweCKbQUbcEz8t5rl+3ZBbqJmgnJmM1Dm2rE0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(38100700002)(76116006)(38070700005)(5660300002)(66556008)(66946007)(66446008)(66476007)(26005)(6512007)(2906002)(83380400001)(8936002)(508600001)(31686004)(8676002)(4326008)(36756003)(64756008)(6486002)(86362001)(91956017)(31696002)(71200400001)(2616005)(122000001)(54906003)(186003)(316002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNOd2RBSGhLUWhKY0NISXZzTEVKQ0Fjc3VtTG5PZW9JY1QwTFdJandyU2xz?=
 =?utf-8?B?TEtRUW5McCtlQUpyTm5mWk03d2lqNjBnQWlweGtFMk5qN2J2VmxxSjZUeEJj?=
 =?utf-8?B?M1VURzhiN2FlQTBrNmZCeVNLN3RLS2ZOYVh0RmNOUXByaWhnZlJiSG9RZTZk?=
 =?utf-8?B?cEs1eG9td3NFemNVSjZaZWU4bmJkRzdGVzhPYXZKNEk3U0hZYW8vbHZEdmhk?=
 =?utf-8?B?SS9BNXBmRE1hVGVpZmpDTnQvNUU2MmMzZUQ4WktRTWVBSCtoaDVyWm45L2t2?=
 =?utf-8?B?SzNhd1pTMmxRb09JL3ZpQXMwTUR3MlFDbTVDTkFRQVZQWkV0dzFNQm16NGtM?=
 =?utf-8?B?c0xTUnRtd1Q2UmJoSUZ3ZzhOamw4QjI1QndUY3VYKzJ1T2ZLNk1IZFMyYnlB?=
 =?utf-8?B?dDR1c0czOGNxbW11MWRUWWxuZkQwNDRkdW9HNUtZMlJMSkRDTVhaUEdNM2dj?=
 =?utf-8?B?d1BKZFdNU3ZEWGlHUEZkSWhPSjZaZ1FIRW1oRnRtQ0hzVEEwTTcwakZCUk53?=
 =?utf-8?B?T3VsK2FyNnRtSVBkTUh0Z0srZm1HWDNkRS9lZE9NQXR6R3V1SElscmNYOWg5?=
 =?utf-8?B?U1FTZW5uTmFINFBuZytzaHVqNWRlK2lYd2d3azVIY2tWbnFGUGN2WDJHUU9t?=
 =?utf-8?B?bEhXTmZjOERoc0ZYU2YveDNPR3lDbTBSYW9jR2M3YlJKSlV1WnVZcnJJV1ZN?=
 =?utf-8?B?eHBnYVM2YThUT0xUU2ROS1djMHZkUUJwU29MaXF3VTlNUTJOa0t6bkp3Nmc1?=
 =?utf-8?B?azgxZjZrKytuaVRCSSs1bFNXaGF2VkdrcXk3MkpxZDVvbDhQcnY2US84ZkpX?=
 =?utf-8?B?WFhhWFRONk5BM2ZmMFJ1dGljaXZhTGZ4VmdtMjFDajN4SjBKbGdOSkRGSjBr?=
 =?utf-8?B?U0JqSllab0FOUm9qeElwY2tUMGp2N3hLTXpQK2hmK1RGdmFYcjRwNmdFTFNV?=
 =?utf-8?B?ODJ4QnFVeFNJQ2JFbzNBWVBqSmIyMjdQeWlibUVPeFFmZmkwenNNdDNPZW0y?=
 =?utf-8?B?MWFqM2ROdTNtUUwwdmp4SWtMZWlVcHRsN3VBVm1lMzBDc3dYbU9FNDlGRnBC?=
 =?utf-8?B?dWswbUdUdW5lNko0Q2NjbFFnbHE2TnRlck9haHpZNXBsaXBiM01YSTlzaGZ2?=
 =?utf-8?B?dHNkbU1GRDgvc0JNMGp0R3hLUHdieEkrczRpaHZ1dXh3aHNDYitKQTlBbEMr?=
 =?utf-8?B?TWxpcTZtZ2h0N05UNDdQN2ZyTVc4cEU5UmlJb3ptdkgzWjNqY3g0c1NYUVRw?=
 =?utf-8?B?cmt0bXFhUzViMS9rUHNPcmk2VkU4ZkQ3OU1KQzJFMWVBd3FLSGhadnJ2Rjhq?=
 =?utf-8?B?WVdNYmRpWGgzYjBLU0FHeHV6Q21tZUlGTGdtRWd1a1B1MTFWc3NkVy82RFpw?=
 =?utf-8?B?UkQ4U0czVzRBSTFBZVlUNTFOcFFWTUhYcldkNVBJRXo1WnBYQmNRcmdhc3hy?=
 =?utf-8?B?VTRqczZKL1pFbkphaVFaRE1LRDZxcjN3U0ZCRHAyd3d1dElob2k4OEVTMUpV?=
 =?utf-8?B?dU5ZQWdsb0ZnTDlzN3RSeDllM1JoRXU4SHQwVWljNjRnRzNkWm5HWlRtMloy?=
 =?utf-8?B?eE8vUnY0Y215bUYzL3hQY2psU2JrTFJ1SGJRWENUNk4yZDBVcC9uTHJYdU04?=
 =?utf-8?B?ZmZWeks5RWNXUkl5RDNhTEYyR2NQV0VTbDNlR1F1YnRVUW8rdlJBN0lzOSt0?=
 =?utf-8?B?QmNiZEdBLzl6Qk55Vk9ETVBGVi9JWlNJL2hoNjkrSzk5YW5VK2NqYlBIYWFu?=
 =?utf-8?B?ak50bFFTV3dHK2lsSFpmMEgyVnFqZDdmUWhFeTNEUjkvM2dIRWQyV0xoakNz?=
 =?utf-8?B?ZUk1QjJ4NnJCK3NlM1VGa2lkRVcyUE1WeW1ZVFppdkxDMDNXSG0yZnVRaEtq?=
 =?utf-8?B?V2w0NXRDRGFvT3Z3V05GOVhyL0FRVjh5Sk5jVGpEeThyQ2l1SjE1WHRaWGd4?=
 =?utf-8?B?cGJlZlZZSVMyMGMyaTNrTFpZSFRRaEx3Mm0rTkFkZTdCK3VOWnB5d2tycTVB?=
 =?utf-8?B?ZFFvcXN0NmpYWjlkTnR2SFVudmZhSENRRGxGZFBJaVM3Zit3YlNQLzlVV2FQ?=
 =?utf-8?B?akZOcncwK0dpTzNjOUY5eXJrQ01pb0piV3g1Q3Z2Q3NUTXlZRXlzSWxMd21l?=
 =?utf-8?B?U3pvVFlyTG9WNFRlK0Exb2x6cU1JNzhqa3hwUCs1c0VTMFg4bng4YnhjemRO?=
 =?utf-8?B?WXVRbUluOEgxeUl5WDJSdnkzTXdtK2dMRXo3NFM0cUVLMjlKM05qUWUwZU4x?=
 =?utf-8?B?U2V3REp3R0ZuUkt0M09iN0NkVm5FTnY2SDAyZ0JlQ0tSN0crS2g5N2tLZWd6?=
 =?utf-8?B?RGpyZi9ZWnN6OW9iRmNWSkR0a2p4K0NWQkpXQTZsUkxUU3VYeEhQUi9jeGVo?=
 =?utf-8?Q?uO568yX8ZeSKa+3o=3D?=
Content-ID: <1A95F0AF126A324D9466B0ADDC203E4B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412b460c-1c55-421d-818d-08da28181ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 06:35:28.4183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tywrcYEHrT4H5MBjRIsdNhXSTpfxY7byc8m8DlNmiuNU/ojCB4q2haupMCk0IG2Dq+p9b9iIU7TFNBk1KrkjUE1uH+jLViU/VqZpE3uMiPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_233537_227043_26D9726E 
X-CRM114-Status: GOOD (  23.02  )
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

On 4/27/22 07:16, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 4/21/2022 11:26 PM, Takahiro Kuwano wrote:
>>
>>
>> On 4/21/2022 10:56 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/21/22 16:42, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Am 2022-04-21 15:13, schrieb Tudor.Ambarus@microchip.com:
>>>>
>>>>>> If the parsing wouldn't change any runtime parameters we wouldn't
>>>>>> have this problem at all. no?
>>>>>
>>>>> It doesn't change, _but_ it sets the correct number of address nbytes.
>>>>
>>>> It changes nor->addr_width which might be used for all commands
>>>
>>> no, it _sets_ the nor->addr_width. nor->addr_width is initialized only
>>> in BFPT, where BFPT is present. No change done.
>>>
>>>> except the read_sfdp_data(). It changes it before we are entering
>>>> the 4 byte mode. Also parse_sfdp changes the opcodes. It seems this
>>>> was the reason for the SNOR_F_HAS_4BAIT flag in the first place,
>>>> so the core doesn't convert the opcodes again.
>>>>
>>>>>> The parse_sfdp() should only change members of struct
>>>>>> spi_nor_flash_parameters, the caller will then decide if they
>>>>>> should be used and more imporantly *when* they should be used.
>>>>>
>>>>> this would mean introducing a nor->params->addr_nbytes, which
>>>>> is redundant with SNOR_F_HAS_4BAIT.
>>>>
>>>> So? The SFDP table has both information, I don't see a problem
>>>> with that. And I'm not sure they are redunant, I think a flash
>>>> can have 4 byte addresses and no 4BAIT table.
>>>
>>> right, but this is not something that we are addressing right now.
>>>>
>>>> And if it would be redundant why do we need that empty
>>>> case below..
>>>>
>>>>>> Then you can do the sane thing in spi_nor_set_addr_width():
>>>>>> setting the addr_width.
>>>>>>
>>>>>> Right now it's:
>>>>>>
>>>>>> +static int spi_nor_set_addr_width(struct spi_nor *nor)
>>>>>> +{
>>>>>> +       if (nor->flags & SNOR_F_HAS_4BAIT)
>>>>>> +               nor->addr_width = 4;
>>>>>> +
>>>>>> +       if (nor->addr_width) {
>>>>>> +               /* already configured from SFDP */
>>>>>> +       }
>>>>>> ..
>>>>
>>>> here.
>>>>
>>>>>>
>>>>>> Sometimes it will set addr_width, sometimes it will not be set
>>>>>> and every once in a while 4byte mode is determined by SFDP but
>>>>>> it is not configured (SNOR_F_HAS_4BAIT).
>>>>>
>>>>> which is good! we prefer using 4b opcodes than entering 4byte address
>>>>> mode.
>>>>
>>>> You didn't understand my point. All the assignments of addr_width
>>>> are clustered around in the code. Why can't we have them in a common
>>>
>>> set in bfpt and then at updated at flash init. It's not spread
>>> throughout the code.
>>>
>>>> place. We even have this place already: spi_nor_set_addr_width().
>>>> Also you could probably get rid of that "don't change opcodes
>>>> if SNOR_F_HAS_4BAIT is set" thingy if the parsing code wouldn't
>>>> change the opcodes but returns the parsed ones for the core
>>>> to decide what to use. With the benefit of better readability
>>>> and lesser bugs.
>>>>
>>>
>>> I think I understood you from the beginning. Both approaches are fine
>>> IMO, but seems that you care about yours, so let's implement your
>>> suggestion. Takahiro, will you handle it, or do you want me to do it?
>>>
>> I want you to do it, please.
>>
> Do you plan to help on another implementation shortly?

yes. I think sometime this week, I'm a little busy right now.

> Or can we go with this one for now?

No, let's implement Michael's suggestion from the start.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
