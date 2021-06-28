Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5446C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836FF6199B
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 836FF6199B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dySQ7uPxS/nY9NVER+CztE3q73AEa6obwi6ohgS3M8s=; b=qJdLlYiWmaN2G0
	BlEsAetF2XVh6p2Fb7qJWi7JMal4RMWOwEmmLwQqYy54qD/r+NyLvo6lrIPdVr89rTgr3BVy3znE6
	ABiCIQZyyps/1+BuGQBP4TLhxuCExsc5TLcwvQnjbsnyIrUVNzSg1E0h4Z91wCCgvMkdjBSr95IzM
	tZhRRTD1EKxvaJ65qyKdWcJ9d2gmuTUxPv5TIuWvrzgFiSFwNXJlwJK3GCf7F1Ch7ff2wFNXSTCEo
	loyeYFmwPe0JZjZWuCMoAeeBuoZbbjxTtzpGH+7YwvEpZyPBmnlPO93hEwgG6wZ8FFKNfOkHh0O11
	SZmxPG7zEkceWUfDj3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxjtH-006qE6-Qu; Mon, 28 Jun 2021 05:33:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxjtA-006qC3-Ff
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 05:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624858376; x=1656394376;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=er3tUoRAvpifyFydVfMEPkJk0AANhBYjyArdE3f+TSI=;
 b=aRlKUD+uB1+4Vk2Osd16xPzK+3rYRlscUEmI4Te/+UTVfD1G/5K4Qanz
 npbISOb1j5zUkJ+8P+ami7tewZsUM9uMQ4w05Vg9qy9YKAtwcrR/IICx6
 ppg4iKStouyL1PDyVyY0AqvtaC5J9zV7E31od+45R+UERD4rn03tBF6r/
 CXoTd7zdNPssq2+Pct2C0sJ/My68BNLGpa8eS91gqtiVYaWywDZpX3Y27
 17zJFNQWYFrtNsyrNhKZlQ7gW70b2C5UuBSEALoCuFcBc7Dd/m7bOtS7U
 vvT+tjexl+dFFwg27ARDE3HHgAFEJSMeVNq+3HB/FRkgJm4bVUIPqjh70 w==;
IronPort-SDR: gcJxmluK6D1J0LuJgmEV1p7VFFXVF+OSr5mypzh3fh474c8P3Xcf8CYVbCz37BBjDnjm92fshk
 7KtklFgaBNv9FftCR8sK9HgZ1pWXrNsYO1BkWMGMEtLtgwFh7rnBCTsrs6wtjrHTkDGrdLhtvN
 NXNIMOnzvh+z9AlG1QUbLzyMn3NsuE9rt/XgR4D/0Qod7J+iqnSSQqj9sZHDv1FXcst9GIEOFl
 kacV9D0HqUGDXQcr2Ku+bxeeFATCXz/HlUZq98TLQLQdiNuDA1gCyEUTDm7u1iM4+YoOarna/e
 n28=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="126279648"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2021 22:32:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 27 Jun 2021 22:32:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 27 Jun 2021 22:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWO5b2XPzXYZiWWtjaIx0jDOjstOIcbPpR+BgBR18efvuWLrvu+HhP4QecY5GOFY6W76U9ZYvxAdaagLpFzP2ry0OM6M1/ROFKkDSHRyf84tM7celMs5SthuBA6e9arZxXeDW4YArq6K7zqq2wLUXQ9Ucfi1htzt9Ctqyq6sePndytH0L8eyY7eUXtd9fMQOBgjwz+amY4BYMzteGBV7Nb8ENRqReKakHji5Bibit/kv/9vdiCyJYwfntE9eFWJHb3eWKCN4qxAgbae6A1MbOuLbDSZHN1o1Z5lxKw+ohnA7x7nkEDlSklWVGYKuSH0tBgvvH47YZnLaTmnKpic5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er3tUoRAvpifyFydVfMEPkJk0AANhBYjyArdE3f+TSI=;
 b=kyzoMJ0le7iOlz14CPwE0h8rkQ5G/VIsht3W2kZmk7K8uRFsWimE1MUKcz3khsCPPHRdY304RdzKvQXl3Td+yVVVRjtf4H3YOOk1GWoCXXbhBhSmCPayusEdvXfOD7Se8QPhpBdRJ26hIntAf8MNuUwJ5tlpZ/HasJovIubhmWdqemZV5ZEJkczDKztqx+gG0YGFZV35UqpLZ846P5C7stUHYHX+/pWkKSre9byOCoPxJBehzgmu7k7NvRC1LibCWTLn8fSQ5wNPUPNIqtOFnEZBJVEQetuigKKSsan8e7ZDHz3L7PBVpoGuiDfBwAobvF7RmrUYt0xLUQ5IVXU8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=er3tUoRAvpifyFydVfMEPkJk0AANhBYjyArdE3f+TSI=;
 b=CRW/Z1AC4sBcQYqN7B9vUHlee7SavYz1yK1u3yc08394GCMyYtCMbdcX8bXDnymmQE/Oj2/ur/20b+WzMmuTmLxrdWwLG0ucem3dljPodm8goiMFqZb/lF8l8nSTcZJFExh+tk/29xf7GgmRRQXYwYw8vnY66vsGiavBwco2fcM=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB5208.namprd11.prod.outlook.com (2603:10b6:510:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 05:32:52 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:32:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <code@reto-schneider.ch>
CC: <linux-mtd@lists.infradead.org>, <sr@denx.de>,
 <reto.schneider@husqvarnagroup.com>, <miquel.raynal@bootlin.com>,
 <p.yadav@ti.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Topic: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Index: AQHXa98JhBHIVrQioUm7jO1Sivr3QA==
Date: Mon, 28 Jun 2021 05:32:51 +0000
Message-ID: <e3f4aa39-b70c-4684-a1d4-2f1930d54bb0@microchip.com>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
In-Reply-To: <1ba367f93650cb65122acd32fb4a4159@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40d5b240-d76b-42d4-24ee-08d939f62c83
x-ms-traffictypediagnostic: PH0PR11MB5208:
x-microsoft-antispam-prvs: <PH0PR11MB52087A79D98ACE0B8D82E60EF0039@PH0PR11MB5208.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lknJYQ8Lz/G0gnVTi9QF1WDe+/oWmorP6E2nlcBE7zeIcaqtiRRGz7/ldkiHlVw0VqQYLsRDePXK9z/jT0DTATHCbIlBoimw8QvIXxJbeRuULbmVCz9IViiKKg2HS6Yu/88qVJlNeS4uq2NGd72tms8uhTPwPhMqZLQfHdVp9qSypVGf4o5pve6yjNztE1eMG99m1jn8nNDXIrMyTY4Df55M9IM4I7Whi9Pt9gLoqXOVhbqpIoKTYkjOn1bMzav+B2T4BluGxvI6DapeHElFWqNWbK7dWykpp7D5VDIX5o+n92VmXrR1/gJCOYJOp7TK4k1K2O04F4wLqjTjYEBoxZGMcecHgv9xFA9tebvUse818IfINp2AyPh1F1uMuenkgq0cWb/Dmvc1zRCKcYwkM0IFARVG7uC8B4xXfddIlJmQ3ubE0UrPBm/Qz4dVRXCl1RYKRU1fqMQ+JYrDsjTI1/VFtMgl8t7affKrB7drJW+BOKEQgdMkkm1+o8jAGc4m3Lanb/Kr2bGO4ITBOX6Fqs8LoNYlSAya6N4btMV9DMGc0GkhW0zCJjXTBgfzwJsJ84lTU4tfvcKFLUSmxNhR/WvmnmpKUKspozmY4JRELBREs0XrrvxizgnfgD/b/659td1LfHPI469LkpLp53UQnLPCVw8fy9DDUeVQAap1mKPkVT7bxOO3p5/Q9ppYKb/8P9egll2Qa+MHm0T7jWy7pNks01s+/bBjCsEWrjKzE9LCBp1P65YEUIonxYUEVSsx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(376002)(366004)(346002)(76116006)(91956017)(53546011)(6506007)(186003)(6486002)(38100700002)(6512007)(122000001)(54906003)(66946007)(36756003)(7416002)(8936002)(86362001)(316002)(4744005)(26005)(66556008)(64756008)(83380400001)(66446008)(2906002)(31686004)(110136005)(2616005)(8676002)(5660300002)(4326008)(478600001)(31696002)(66476007)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3Bna3BSWkZVdlI2cVBaem1iSi8ybWovVnNueU5zOEJxOGxuc0lyYi82dFc5?=
 =?utf-8?B?bVZaM1NvV29Gdm1GaUI1WEVGekEvOUNxSldjUE9Ja1FvTndsTTBvbUtrZTlE?=
 =?utf-8?B?L3pMME9PRU9qZ2Z3UWtsV0Z1UHJxOXRvei9pVy9odVh5MXpSQVdMbDVPQU1D?=
 =?utf-8?B?eWgrQktWZ2tCRU5PUTRpT2dSdXBhKy9oNUp5Z0Z4Y2ttREVpcWFmdU5UN1hW?=
 =?utf-8?B?R1plM2NDSlhYUFFxMXRJUnJldXBNOHhNckNZa0l3ZUUzZHNHQ2tDaXBTQSt6?=
 =?utf-8?B?U1NIbGx1blZnMkQxNVUrdm9QNmJKNU5Vd3VYOEZTN0lSQXI3ajZQQTRFYlNy?=
 =?utf-8?B?aXBBekdCOU1WYWFYaUVLdlQvblFVQVdOMlUvWTZVL1dHRDcwMVdHTWFMYVVw?=
 =?utf-8?B?cDY4cURkOHhCQitZQmp0OUZWNjF6cDZFMGdaalRiYXRoME85QTc1Nkx0aENu?=
 =?utf-8?B?UGVlSVpwWTFUR0JNZk8zNmh1Mm9vQ3ZGZXRCZnh2bmE2QlFOUzlTMzVWL1Bi?=
 =?utf-8?B?Rm1RV1BoYlg4bXdpa2NucmVYOUVzcW9XNjFxOVluN25xRTNudVVVVzRnN2ZK?=
 =?utf-8?B?L3M4OTA2akZTeFc5SEJmUk5BeUNvWExHRkZ3dEN3V0JtMXU0Ryt2YjhBWElL?=
 =?utf-8?B?WUwyWjFoNWQ4aFRtRHdwZzVUcVpGR2Qya3JvU1YwaGhwaGNkaFowNGV5MkxW?=
 =?utf-8?B?K0U0eWFpUFc2b2VqZ0EvTnhKWXE0MTlPbjgxeXRLMmFUQ3V6REQ4bW9KYUZ2?=
 =?utf-8?B?VWtsL2lhNVlCenpTeHY4QkJyemNFeENDQXRmLzdCNjl6MlAzRWhhdWxLVE5l?=
 =?utf-8?B?WTlGNkhTcVRsS2ZuTkE3OTZJcVJxbGRhVTRvWk5XUSs2U2hUY3o2QUNOdXdH?=
 =?utf-8?B?clVveVJQUTBqSFc1NXRVL1NrUTNYUXViVWVoUCsxY3paaVgza1FlVUdqajB5?=
 =?utf-8?B?b2Y0UTcvREhHMXdVWHlxYlBHdWQ0akgvTURSM3dIQVdVL3ZsTmN0ckVhUGlx?=
 =?utf-8?B?WU5EUUJNN3VXUThubDhUcjd6VGxCUHBQTUdSRU5XS1VtVGlsQ3psTXplOUw1?=
 =?utf-8?B?N1Bnc3YxU0UrQmw4NnQzSG1BZ2pGa0NuT0ZMSkZvRHJobGl3ZVl4a2wwcmJj?=
 =?utf-8?B?dmJPbkE4VmN2SzRpanlIOXE0R0VocmY4aWdwMG5oK1IxS2xVNkFMRE1Rd1Bx?=
 =?utf-8?B?bFRqaHBCMGZOR2w4R25COC9VZm04aVFUeEdEV0YxbEFtVXFoWXZ0MDllZnBC?=
 =?utf-8?B?R0NENi9PNThuT0NqZWpnZGUvWVZXcHpZaUt4YklOZGQ5amdDeU5LRXdQc3lJ?=
 =?utf-8?B?SnpuMUlBWEJzTU5xRHZLZ0tqeEkwdVhrVmdkSmovSFFaVWZWQU9ESW1pLytC?=
 =?utf-8?B?OVFZK25JVW1DN2JFZ3NtMjdDcjQ1elo1QmlIMzBoK1VTdGR1amhKZkNjUGJs?=
 =?utf-8?B?OXFCTVlHYTQ3R0lTdjNyY0Z0dGNMWS8vMUlIcUFPY2taa3hTNFRsZTViUkE3?=
 =?utf-8?B?YzExWTlBOVBEM1FrRVJVL2IzekFpNGgzeE95N1hKYmFHQk9rL29WbTRtVWNQ?=
 =?utf-8?B?ajE0VEoyak10dm15L0NzRU4zbW92K3N2d2hIb2ljaUFiKzBVRU8zWHhEM3BD?=
 =?utf-8?B?WGlCQ3Z6elRndUdSa3VsUnVpRG93ZERKUWtYdVN5dyt5Z29VQW5BVTZDWm8v?=
 =?utf-8?B?WWZKREU4STFWdVRMVFZ0TmI5bVVzMGx6Zk96aEQ3cC9ud0kxU2dRRjYyQ3NV?=
 =?utf-8?Q?M+2N5rLSH8DaWs3/aY=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <9482A8769B7CF14F8196EE82A0FC2DF6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d5b240-d76b-42d4-24ee-08d939f62c83
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 05:32:51.9941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mH1hVgXGwsPOXHqaPmo2GA5bHon0PKO7pcO5cKVEE0xwtHSIKZltCzqWALTh90KFdmutl4zBldxp3dVJt9w+ytijVnO112oXWzBpyERT+UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_223256_609286_64B533E7 
X-CRM114-Status: GOOD (  11.41  )
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

Hi, Reto,

On 6/14/21 9:56 AM, Michael Walle wrote:
> 
> NB. XMC ignores the continuation codes and this particular device will
> collide with M25PE64/M45PE64. Although I couldn't find any datasheet,
> so I don't know if these devices actually exist.

Would you please dump more bytes of ID when reading it? Maybe they put the
manufacturer continuation codes, after the manufacturer ID and the flash ID.
Or maybe they defined an extended ID, let's see what's there.

Also, does this flash has a vendor specific table? Check the JEDEC Standard No. 216D.01,
section "6.3.3 Definition of Parameter ID Field". Parameter IDS with "An MSB of 01h though
7Fh indicates a Vendor Owned table and provides the bank number of a JEDEC JEP106 assigned
Manufacturer ID." We may get the bank number from there.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
