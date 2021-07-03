Return-Path: <SRS0=26vX=L3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB26C07E97
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:43:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3D061930
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jul 2021 16:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3D061930
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2etRh1w0QSVv92Lm6om+OlOu8Ptha6HqbZ4ereIDH3U=; b=vpWB1UWQzXHCVM
	DXvkPTR64w7UqPQ9RqmvDDiA1CwoIzuud5Nq5lHBXKL17HfpZnT2NVuXWIA2Weh4PYpvY+xCcprng
	DCeWXHlSDND9RKng5U3wSba+eUVFeIM49DM805syI46L4NEbXq5hF7mYjPHM7BxCbgd7IJ+ISEJmM
	Ekpv4pml3otLkVVXblhqaYeesedfp83KkG8+1Nf+RsFo3m2atRlJ8s6eizHh1Dl8EqAaHwmjp5ChI
	zM+2lxs6dhwdXz6Z7M5i+mlqgM7GFN+WYbp2MIhhTI9JBH3daWDgu/F+Ewo4cLkYjG28fY1gnEHO1
	PgjZyorRz9sA11bfOnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzij3-0057s3-3N; Sat, 03 Jul 2021 16:42:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lziiz-0057rZ-JY
 for linux-mtd@lists.infradead.org; Sat, 03 Jul 2021 16:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625330557; x=1656866557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zZwJZx3Y87UZMEamhRrQsMJ8sEGJwGEnInC1h0yG/Nw=;
 b=Ptgbcb1MFWoklVmyUuDmqVcxO7FVj1PkpNQn/9bU8Pe/9fdYkM+y0GN7
 V9xk7CSKj6Rl8mvVXBaJyRSFJCSuL4eK3R46ki6+c0alf/13pvWGii673
 DNKSWZexonb7IRLNpsFCHu7yNPavi1aJGxv7fp6nGl9gAqI/6L2nFwXkV
 9hXykBKbSGYuYbD5rvbjxmob/ROH3OghoZv0076PNHJhVK9hi4wueMjG1
 S9tzbvHPJL+xsaHoE3p8RRVIUZFK8VqUcYHE1wDJyvGnpoJe3em0SjQU4
 NQ6Oga94lF/Jry+Sjgum+6YqpFXRzbbyM9RCHVaHUtycCW3eIdIY4uYD/ g==;
IronPort-SDR: dQwM3YSUWaeupELenPaMSXAbmh9Xw5lvScf0YxF8WzslPdLqcN1j172yOVXavsvQ78w117xFzg
 zbEk5PPs2PWwY1m4SbwpI31jEF1oSPho1zp8z6Wt81EGgpx5dJiRn3TgKBXULKT+O2AE+oakLW
 mIjQEDB3Yi4F8EnwBWqwhASllGAyfPvZlFYr8/2X+AjWLMcLyc5Q2CLxFG587sg8RzPxkK68PZ
 0IYjYPBk9RPRVu5UCs7W2TBH7tEXEa/WdICNInFggBVhsvKqYEpqLSRyVqOWA79mDJf69yfgws
 kJ4=
X-IronPort-AV: E=Sophos;i="5.83,322,1616482800"; d="scan'208";a="61060121"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2021 09:42:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 3 Jul 2021 09:42:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sat, 3 Jul 2021 09:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQAPLgnvO2liRqzk2rJoBJGCQAiRFPizv30SX8vVzwRZqrDz+EJxhKGIZNClcYAm9QJuoD9gGpGIOx9qjaPF1hm2FIyvbtO0jixCK+wYXNxZZYLB37DIleJYheeHNUspZefwpadQYrDRu63o9WIR9bkt3J5dq0c+2+m5kpUNewd5dbHFKBa1W5hYNAYYBdoF27vjJmiiAiWEWeFcwMe5fZvRf3QkH6Nx8X9/33Jyv7fFMMQhwu9vh870bcrkAdXbnWPDNbNCf0cpE8v9gfuG4mbVlYV0BMBIcuWfUeUPeiA+Crg2SkaASMmmLB2Zu2QuGxJiSfuXjGySwInEZch01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZwJZx3Y87UZMEamhRrQsMJ8sEGJwGEnInC1h0yG/Nw=;
 b=ofAlNVN+Sm/2L+JIEIV9sLvZ+oZ1IRlHNjA9F5+d9CgvdvGrJltt3McIRpfaTLZ8+W4spMG6gMKfPWlnF+ZTBCOYjnP53qFNt4gZ58zbgtiHvpCVXqwgj39khJpgzXqCqIRq+ZLwEy0++ouOw8u5aMSeScLsUCZLX9sFmPCpqED8RAkGoTJA/MqFexJMNkxOfBKgeCdbDVD1yBNvd+SVgD1ODFzL3DW9NwLbC3M2ymeEt+OkSkA0Or+FyZwwVcGiJIZ98k4mX9JJySh07eHJgKZ3cAqntEOFSoYbZNUG9aLAL93EyvYT6PW0q24aG59gDZ5Fm/ws0UAfqII7U/CDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZwJZx3Y87UZMEamhRrQsMJ8sEGJwGEnInC1h0yG/Nw=;
 b=efD//sk10k+yIea5sPa0atP8ZZ3Sq41cRb7sR0lTBEpN5MSUnvKKdCSuiAcQBByf/krx2N5N1V9TopdYnvtajY3T2bEiDntIIq70Cw1NmaMyKcyM7QYQh9z8FFQVzvWNGcSU//pVkhxiRJ9d++3TCH66CEdhhORGBNf1of59Yro=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.30; Sat, 3 Jul
 2021 16:42:30 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.024; Sat, 3 Jul 2021
 16:42:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux@roeck-us.net>
Subject: Re: [PATCH] mtd: core: handle flashes without OTP gracefully
Thread-Topic: [PATCH] mtd: core: handle flashes without OTP gracefully
Thread-Index: AQHXb/GoAw4bbVO2W0KjeZydMqxv/w==
Date: Sat, 3 Jul 2021 16:42:30 +0000
Message-ID: <8da3d84e-dfbf-2030-98b4-148362d22f52@microchip.com>
References: <20210702093841.32307-1-michael@walle.cc>
 <9bb2acac-aeb8-d2b2-8df0-9acfd972ec5d@microchip.com>
 <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
In-Reply-To: <9F46D75C-D00D-4577-A337-7411049EC7D9@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57684907-114d-46d6-0e99-08d93e418cca
x-ms-traffictypediagnostic: PH0PR11MB4885:
x-microsoft-antispam-prvs: <PH0PR11MB4885275BA8A7CD55C04B8F13F01E9@PH0PR11MB4885.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfsLPJsnXb1NWT23iWMCNr8zcmt+oFdKi2OfvQUks80VAod4WvlgJZfpxlrCSDGLZPQ9eZUfbTUiwGaGlTxjMzBQtoJdUZybzmHy/IjVaVZzPDTsD7I0A1hUlf9XdC1ZbNKnZbT+t72hmhrwJGTyj7vauBdRTdQOV++idJF553qQDJPzjyIpWgal0cJOL8XmjrAULP0GktAi1PimxqLgOwNay/C7oZcGJmN3iRnW+81CtBKWjSDKro4Kx9ZD6Vz41g6vhkSkXvbaEIqW62KzxUYjJDTmLwXHdB8/44jQUirioKvIWnu9e91RN1/AD+CuYcrN0Ru2InP84mCYHk8TuF+vff7bIv1Sbg7qLGlp7ktSc2RsK0xZzdldxCIVEdWIUuWlM/rIa5UfDhp0UxXiig5CXhsHFKHP8e/zcm50i+oj9YGX009O1gOTjeGcLmV84CM52rqHSCeb9ypuC/St+/qEwZAeiz2Y6EveuF/FJyWrwrhqj2aoLUuQSkwYB1Z/9R2NErKSEAV2GQl6uZPo9WHmC2Elm5D5AAD5sSOx66OElPPUiBFZDeOBMdEyQ6rEETLeKfsPEcrpi2X+lNtpHs0r5Nk4S3Ws5b1hnBsg267hbovzcirbwy6421B5r6INo1agWwr6KEWVNVpHdxaPrRa66/bB0LIsxrL15XoAh0K9cad3lJUVNca3sbRwaINPG+vO8TbZc8htdWZs0gglqfQsZVLOuNqX8EGdo6Fl6y3nd0YVo1oVaK4SPBfbN2/95D3TjXUXYd0sLB65hFudPq7RUB172pHGfZunEZAHskklOBcH2Za9FLRQTyDSWQIC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39850400004)(396003)(966005)(4326008)(83380400001)(2616005)(71200400001)(8676002)(31686004)(186003)(53546011)(5660300002)(6486002)(36756003)(6506007)(2906002)(110136005)(6512007)(54906003)(91956017)(76116006)(316002)(8936002)(31696002)(478600001)(26005)(66446008)(66946007)(122000001)(38100700002)(66556008)(66476007)(64756008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0IxZjVZM3JPWVR2ZHlXK25hdVQwWnNma214ckZ5Ylk2N2p4R0I4RHRPM3Rl?=
 =?utf-8?B?dFE0NHYrVnp3VzNEODJVUm1LNk9KMEppb3FXclVQUG91aytjbVQ1TTZXN2Ju?=
 =?utf-8?B?Qmt6NGZTSkxOR09HV2ZUS0xZejFpSG5JRzBhMmpnb1l0OGpaRlBVYy9PbStE?=
 =?utf-8?B?MExVdllVSHlQQmhtSCtvVW9sS2FmZGNGZTBCSjRZc3dNcjVBTjNpeTVDb1hZ?=
 =?utf-8?B?QmNKdTNQUEozTHhzbGNvOFFUR0luV0tKUmN6NmYzQVVOYzRYd2ZzeGJqSkRJ?=
 =?utf-8?B?LzJWTUFUUmxpUEt1Z0tjYjZESGpwaWJzS1JkeEllNHpNS0ZXNWZidkpHS0RP?=
 =?utf-8?B?K3VHV256Qk5CVU1xRENOTlh4S05uQXM5UDkySVhQZW41cWs0bTFDUjFCYW00?=
 =?utf-8?B?OEpHTFN0TUZaZEZDd2pBaFppM0ZGbVNJOTZtV3ZVU3NhSW80RkdkMHNnb2RR?=
 =?utf-8?B?cnFVcnJudEUzVFBMQXZTb3BGWk9pcktXMHcxVDVMM0ZoQytHamVZaU51YjQy?=
 =?utf-8?B?dHpLb1VSVUJRcjN2L2ZEY3V1dmk3bG9sUmt6REFISjJnTTVEWC9YK0tIQ2tR?=
 =?utf-8?B?ZHBVbVFWdi9CMFJKVDlJZldscGRzZkhhNWllMmZ4elJlL2g1RitOQVlQczNr?=
 =?utf-8?B?a2N0RS9wTUNIaUNVZVRjSldiajRvSi9BZ1pZcnhtSzZmNHE3ZFhqYjV4WHhT?=
 =?utf-8?B?bTBvUUs0ZmlPTmZWZTd1SGdWRFV0R01IZzBvcTQzMzE5NytURnNUQXJLaThE?=
 =?utf-8?B?dk54WXp6NmZoT2ZRYXZta1NiVzkzWHo3cE80RXVJZ1JuUTh6VTgwYVRsbnlI?=
 =?utf-8?B?K1hKd2d6elY1U1NFbmo3eDdGS3ZSRHlQOGFQVU1MbTBUQzdFazhDaXNmOTFG?=
 =?utf-8?B?T3VRRnprMElpdTlZV2U4aFd0OWY3R0Y2UXd3VDZhOVU0Q0RES3dvc2J4a3R4?=
 =?utf-8?B?OFVHSWJXNHpLNG40S0RIZWhGekRSNDdENURlTE8zc0w3K1IxQTJJVjVGZnBu?=
 =?utf-8?B?ZzdvYldKSXhGOGxiK1FHc0UxNWl3djErdWlBbFZTMDBxcU9NNWRMQ1RuNXpt?=
 =?utf-8?B?Mlk3T0tjVWdOUmMxOTBoWXFZTWNuNFVmLzRMMU56ZnhLWHJEUGZxWDFPR21N?=
 =?utf-8?B?Y2tFSEc2RjhKZGM4UkkxR1RjUGlTemFScXZCdDBQKytOU0k5R1RKM2lheFJC?=
 =?utf-8?B?c1hwdERQci9WSTAzL25HejVST013MjZVbWlBSmRDOHI0bmMzTWNCWFc3ZUk1?=
 =?utf-8?B?TFRpMStZK2RBT1hRU0swMEY0Q0tGdjlMNm14TzRWaEV3QmJKRlZJSTNFVzJa?=
 =?utf-8?B?SG9lb1VsaDF4eklzTzZuMWxidlM1NjVEeFRlRGlVYlRweWZaYmF0L2NNQWlJ?=
 =?utf-8?B?RVFZWnZ3OW5LN0l5R2g4TXFRYnF2TGtPSzJxdzRDUXFMRjA5TDFpQlA3enNO?=
 =?utf-8?B?dHM1bmJqdnFGUjhZYTRiT1QycUN2dVhDb3RnTE1DL3dXK1d3SEM4ZHliUEVq?=
 =?utf-8?B?NWdLdnNHZ0c0L2wvT0NidDF3am05MXBVWXVVbGwvUU1vU21BTUd5ajhQV2Vk?=
 =?utf-8?B?L1VmanhvaURsYXVSNVVjazIzWXh0b24vYzF4Zks3NHlwMWZaUVBOTmh5aGFW?=
 =?utf-8?B?b3M3M2doaTZsVW95MTZLNTJsNEUyekNSU0tFK0tvWDRjVHM3UnF0YjE5b0Y0?=
 =?utf-8?B?Sk80RjlPODFzYmV6b0d6aFhXVWNXTENRbVVXdjRSU3FZWkUrclVmYXU2N3hw?=
 =?utf-8?Q?sRUt4d7WIyLfJndM5E=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <17B07EA39CB175499A751327194E04B3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57684907-114d-46d6-0e99-08d93e418cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2021 16:42:30.4498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o21y8+06SmiKmnO+/G9PkEiJHe9RXZH2HemrsODZ/d8SMNDsbWAEhIXxcEmhpD97g9413aaVCQ87hYn6A0tR9OFj0mawHh2x3MR9doaOAho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_094237_871328_24A36FBB 
X-CRM114-Status: GOOD (  23.46  )
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

On 7/3/21 7:08 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 3. Juli 2021 11:56:14 MESZ schrieb Tudor.Ambarus@microchip.com:
>> On 7/2/21 12:38 PM, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>> know the content is safe
>>>
>>> There are flash drivers which registers the OTP callbacks although
>> the
>>> flash doesn't support OTP regions and return -ENODATA for these
>>> callbacks if there is no OTP. If this happens, the probe of the whole
>>
>> why do they register the OTP callback if they don't support OTP?
> 
> I don't know. But I certainly won't touch that code :p

why? :D

> 
> 
>>> flash will fail. Fix it by handling the ENODATA return code and skip
>>> the OTP region nvmem setup.
>>>
>>> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Michael Walle <michael@walle.cc>
>>> ---
>>>  drivers/mtd/mtdcore.c | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>>> index b5ccd3037788..6881d1423dd6 100644
>>> --- a/drivers/mtd/mtdcore.c
>>> +++ b/drivers/mtd/mtdcore.c
>>> @@ -880,7 +880,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>> *mtd)
>>>
>>>         if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
>>>                 size = mtd_otp_size(mtd, true);
>>> -               if (size < 0)
>>> +               /* ENODATA means there is no OTP region */
>>> +               if (size == -ENODATA)
>>
>> If no OTP data, maybe it's more appropriate for the clients to just
>> return a retlen of 0.
> 
> you mean already checking ENODATA in mtd_otp_size() and return 0. That would also make the hunk below unnecessary. I'll change it.

I've thought about:

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..9419b33d7238 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2314,7 +2314,7 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 
        /* Check that we actually have some OTP registers */
        if (!extp || !(extp->FeatureSupport & 64) || !extp->NumProtectionFields)
-               return -ENODATA;
+               return 0;

> 
> -michael
> 
>>
>>
>>> +                       size = 0;
>>> +               else if (size < 0)
>>>                         return size;
>>>
>>>                 if (size > 0) {
>>> @@ -896,7 +899,10 @@ static int mtd_otp_nvmem_add(struct mtd_info
>> *mtd)
>>>
>>>         if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
>>>                 size = mtd_otp_size(mtd, false);
>>> -               if (size < 0) {
>>> +               /* ENODATA means there is no OTP region */
>>> +               if (size == -ENODATA) {
>>> +                       size = 0;
>>> +               } else if (size < 0) {
>>>                         err = size;
>>>                         goto err;
>>>                 }
>>> --
>>> 2.20.1
>>>
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
