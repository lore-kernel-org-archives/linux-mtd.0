Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8161DC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 11:12:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F956024A
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 11:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F956024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sbTOHdVaAmcZtJ+DkSvlM28lTaAlTq0eFIEyGajFXc4=; b=iXbQyJnVTW685mW7ZdmW0QJOF
	tJ3gGLyUMxbTziYneZ1yXSSmRlZOJlkHtxioSbz0CTH27QDtazEfkdJjiAqUt1lfoxnCPQPL1wA06
	XGn04+k5VUfsiQL4Cfj9zlQ488L6JZ1aUUgdvnmFPW2O5TIgOwF72SRlvxOxsy4MbT16zncnkj99v
	VBRo8SKE7XROnA6ODXQttH2iZuprpyZrkjK1f4Cg4yWrqsnbjcbUvSI8IjF9TqFvBAvHbBHe5rJTB
	NFxEPsBIFQhhnZUhkMG5AFpvw4+kDl8GqpFChiZokSVmo5bwV+IE66/mhEuREnXb36n3gkDWszv0e
	N5awY5vbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGgSd-0007IL-Nc; Mon, 01 Mar 2021 11:11:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGgSa-0007Hd-UE
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 11:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614597093; x=1646133093;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lePKTXRziET9bV5W+el9Yzzr0MlNn9bHmftsy8BBDqs=;
 b=qPK5fzS4FZ8Ma1P/+kLE8gUPXDyLSxtFBCXlm+xCbtjAZsdKUA2hP1qR
 2mD+4mwhwuSvBeXaUdamAVQgm9WA+SEX/eRp3lZ/OnSEHGsOvJQXE7RX/
 MFffpS2K6hHtVW08oHwybc3ZDQPYUwhQZ9d6qUEs+WxVOCmrJ6CU2ESlb
 hkAsAvWvFUKHE+b+6ruzdCJXRrWutz1+w8quhNtgkfkmPPD2ide3kcqri
 3bvdeYP5Ex3DOoVknll6NzxTCKa43aV65Wv0hb4/h0IzMdaQ/DyDE0DO8
 Df+lrvWOedshEXZoln+fcqcYMpvbQ9zZTJ7uKPXNm4S6uu7CU2D8e609P g==;
IronPort-SDR: 064/giT7OqKFSbtkKhxYG1kKugPAwlRWwIVdEt+AEYLRUiaW42I/kjI3NdJF/nvjK4PF0vvS2k
 Tk7KdKJBm0epS0RaYBgRxh14UqQ/+CTC7Ur+UlTsAEbdN9OdekZYbmIGGhvyt9i36mW1MIwa1v
 fm4KmJ8hDY1oyvdYTQIt1Fl82knFHqBGvTaxmOmiAt6J6vySnvA6+tq8LFpfKU1zGVgB+16ahI
 Y3fj1u9KmAXdkCWMrXQD7IjJU5GzFpUW+8QLx5WNZ0nwIFerKfaFNPO/mJj2Pri2L3Nm0KVt1H
 R4k=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="110977629"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 04:11:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 04:11:29 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 1 Mar 2021 04:11:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4SgWSxCK0f9BtHjotGt2Ls8a1FZMXBgzNhXmQb/XTtnWZGsrH11CJAUpPv6baabiZOHn5sRKwZykqeey+J7yvTwN/lcs9gkajc8Z2lhKE0WAX3qTfbdxNHYFVJivlMb8zsGVd6uKpJzDW/LwtWcN1AhtyUHnLqR6/kVwpCFE7UU6BbfsW4K8aLCs8eC46bas458yU4i+PzR+Kty02A1nzhkFtuEP6opgnC1JeU9OZ6J2Wlbp1LuKMaPz0Xt342hn8cDFCI3CzAbi6fIIYt6ovlYpUSuptcGq0/94jmdEdvYAQePXV339T+HtBlDubCSrMuwnHX2Uy3CStx+5/9Gfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lePKTXRziET9bV5W+el9Yzzr0MlNn9bHmftsy8BBDqs=;
 b=WrHpdbi83lLGzcXdRZ81yH0fP1oX+t5K62N+dLzvKalAZebxdJGHQrydYNjuipbQXyE7UbESu4UAm0GdG5Pl8Fx//i5/mEOV9CsPezVSaT0RafIe5FRNR0xW8p6WDMk3mHQqgZsGkU7vOd+S34QI1ZfJXaErMjGb7U2A0229QYpFQVszZYvM1JELUsLS3vKez7AkI4WrfdTJwjLpMCb8aw91e+psCb3sORbRtQJzrHGqHYBj9RlPGMn3z2Jm5UpaWbaHjf1gkAmTd59IIOMTm5kZ4ujC0AzH3y43ci5E8JB2oaamBwjoi1vpa3vaepRj9cqzceNR2sZBAJYYx1D8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lePKTXRziET9bV5W+el9Yzzr0MlNn9bHmftsy8BBDqs=;
 b=QaeCOoGt5YKunyEigUQjKlxzu+3wxx5zlqpB3cfIJfS0kaNlzOU56CV72J97llkZpmcVAMD6wuaF0CObpJQToV97n35d7u4ApU7qYCMSWissawvAKPYQupozHuWWeEdZYPpEELIfmDItbC0K00lVk7Yiuse1JExSP/vN47a5QYY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 11:11:23 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 11:11:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <heiko.thiery@gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Mon, 1 Mar 2021 11:11:23 +0000
Message-ID: <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
In-Reply-To: <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 434056ac-c650-417f-e45c-08d8dca2bffe
x-ms-traffictypediagnostic: SA2PR11MB4985:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4985CEC1F930AA7155A4781FF09A9@SA2PR11MB4985.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWjRbvzKVUVaoYZkS6hY8IQfCOUxAyCwrL4RznDW7EOMCTSGqxCd3BzDUfqEJ8jszBvYQEEnP1Kwz70BFEtOKc/pkP1j2+J5VzoUctWv48nYlb6Pw+/fIkSzNYiKvcBSzprOmv+yA8VQJkg3VJsky8Cu7wB8RiakQI3DzGgNvNzbHr5LQmVHk8loPuApAJhULWXrJ9wnHhtnhvhgAvxE/tBu9wmhijetdu5qoe6aZNS7nh1CeUoZgfasYtEk3OIUW2ch7Dyqr8QK8dJxvQPoqWjOgrtWS9odf1L6dKvR5S/uJpQk36UKvhbVfKM9L+HOKmxSveYa7X96GypqgNCdrJmFN6XIAUFdlMyEbXT1LgOevpfhFiD5lAUCl/tY8PQsCJgMeTs7HQnaKi4yKcVpvPEaF+0MsfT6TwK5H633Ll/p/fBzlVN4RJnB25uk/5icspacZQd6Ac0lhlDiRzA2BI/KqF/K9NQJkV4c1LBVHkt0I5qHhwDzDm2rrBEPGzt+IPhONVtQcYWXkLNr2Ds3i9Qn7fWljYAPPo//gmyGzq0pipsgOIQzxT0hkhRMuj6eEmOkbkakreQpqkTwBtqKm6u4D3tCA8pXNZ39KnNi/yI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(136003)(376002)(396003)(31686004)(4326008)(8936002)(186003)(86362001)(26005)(5660300002)(31696002)(64756008)(36756003)(66476007)(66556008)(76116006)(66946007)(71200400001)(91956017)(66446008)(6512007)(478600001)(316002)(54906003)(83380400001)(110136005)(6506007)(2616005)(8676002)(6486002)(53546011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dVdIR2wvSTU1QTh1azkrZklJbUdMZURQajV1M0tXbmNHa0VnZHhiMjdLVHdH?=
 =?utf-8?B?eVg4WDg2MnhpVVRKZlRFc1hKd2FvcDRpc2ZEdGJha3VYcmhoaVRBQ09CRSs5?=
 =?utf-8?B?RW5jazVWZW1zcjhYWDFUblM0cmpQZ0cwcVNOTWZWbmcxQ2pyQ3RFVVk0WEZZ?=
 =?utf-8?B?NXprbzFrMnZwTUJZWkVnN2JqNWFwMG12WGNNeStVb2Q5dVNRaUk5WklPYTE3?=
 =?utf-8?B?TVFnSEhmU1hJVDRhS052VjJwQ2YyeXY3a3EyRTBKbWZWS0dEYm14V1RDWnMy?=
 =?utf-8?B?Y2tZS3lnV1hTR3lPSEdNc0RCdjAyOVlEMW12U2RJSENrajZrbGRwV2Y3WHc3?=
 =?utf-8?B?QXZsMExBM2k4MDcwWE52eTlZcXlyUlFnZnFCWnZxREl0NEg0amRzZkVMQk8y?=
 =?utf-8?B?V1krTHZwTFRtZURjbnJQQ0dHMzY0TmZuNEJVQlg0UDJraFNpZWVYSGJ5c2xa?=
 =?utf-8?B?TURqZDFEUjk2WHB6KzFKcDh5S21RZ1FRdFR4NzNWV2lLTVNtRXNmWTZFNkxK?=
 =?utf-8?B?SzBRei9VeVFvWmx4K2J3NUtNN3lTSi94bjQyMERuSy9vcTFKbHBKdDlXdWY4?=
 =?utf-8?B?T3NET3B2cVNROVNkTmQ5bUN0U2p0VlRXRnFibWs4UzYxR1ZGeG5sZis5anFn?=
 =?utf-8?B?T3RvY3JyZm1SbzJhYmY0eFh3K2RXVnp6cW1SYld3NXlzSjBlUEU3b3JrZnYy?=
 =?utf-8?B?SEtYRTZpTFhWcTV6NTB6SDR4ejgwbW1ZVFU3U2s4WXJvVmJPMmZDL2tTMTAv?=
 =?utf-8?B?WjB6RFBabjB0ZzU1VEV4RTZvSW1TdW1OK01MVG9ObjhRUWcrUFI3a25HcmhE?=
 =?utf-8?B?aVJyYmNnNGszNDM1SFVsYW1VeXRRYkM0QjA5MVgwZ0lDYWd6WDd5QW5oQzMv?=
 =?utf-8?B?cHZreHp6SW5MYkVTMnFMVkg0NXp1dzRYcHBhNGhIQVJneEkrTEcvaGcvRFZG?=
 =?utf-8?B?dXIrL3l1U0hDRFZBeVFkS0Rzdm51WFQxZkd3V1Q2RGZ5UHZwRXZiNVRVZGZ5?=
 =?utf-8?B?SnltV25TUXJDWHpmTkM5akh0WnQyYllrQzVkZ2doUmdkUHp2S2s5ZFFhMktk?=
 =?utf-8?B?Yk1xYUlSaWF0RWVpTHNBUkxHU01DY0ZFdGcwSlFBVUwxODN0ZGhLZG1jS3d0?=
 =?utf-8?B?bnZzai9oRWxuUmZCQVlxTGxXVzZzKzhxZTI2aWRId2dSTENZbTVJc3ZudjJr?=
 =?utf-8?B?VXRmd1ppL0xpSm4zRVdSVko0Z0xTbHc1QmJxd1B2VkxRd3dEWkkzQnMxazJN?=
 =?utf-8?B?bWUyVXZORHZzMEhzUllVeHZRNzMrREZWeThUM2JoN1RyKzU5UkFFNVgzZ3VI?=
 =?utf-8?B?M0M1ZjQ2N09zb2NoYktuSTlzc01qZlREcStVNVFBQnlaVzVzRzVGVTNjbTZB?=
 =?utf-8?B?RFBrUktxN2VGdnN0cG8wbU5IM0lGRjRjUWx6SGtoTURMbGw5bFV5bWVSdEhN?=
 =?utf-8?B?NFFjNm1QUVoraHBvMFhaSWJVYjV1dG90V0Q4RUprQVVpTkRJTklyYUc4WTVP?=
 =?utf-8?B?ODZHdXF6czFVUTZvNmJnTEd4NXpYVFZKbFQrUUgrbGRqbVR3Ynk2dGVrMFFO?=
 =?utf-8?B?aS9RUXN3QlZNV0tvRWRUTUNuSXQzUHY1RExoSDJROHYyemFWUE96WUwvM21B?=
 =?utf-8?B?L1hzK3JYSWIzZmwvRWlsbjU1SVBiMWYwN20rMWNLSlpxbHRydm9jUEtMWVdy?=
 =?utf-8?B?cmJZcHdXSVROamxMQ0g4VkxxdlYvQzQ4eWhQeEJTdHhsbU5TUFNHN2hBcTR6?=
 =?utf-8?Q?jYm4vNTFI/nWoIYXUg=3D?=
Content-ID: <4C1F69B34AB26647A2FA033FC4CC5E80@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434056ac-c650-417f-e45c-08d8dca2bffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 11:11:23.5626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTJC3s4ARONIY1XLmBYjnnDjumi5fkYmT92GDhjKHvkQE5UuEfGxZV18tk9Tb0CSLfy9m9xa5fh6l/ZBSSX7UGV8lSvtZYUvKs0qs1VPoFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_061133_272952_1FC94BBE 
X-CRM114-Status: GOOD (  20.97  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/1/21 12:52 PM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> On 2/28/21 3:22 AM, Heiko Thiery wrote:
> 
> [...]
>>>>> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
>>>>> +                                        * that share the same JEDEC-ID, but
>>>>> +                                        * where a flash defines the SFDP tables
>>>>> +                                        * and the other doesn't.
>>>>> +                                        */
>>>>>
>>>>>         /* Part specific fixup hooks. */
>>>>>         const struct spi_nor_fixups *fixups;
>>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>>>>> index 9203abaac229..1ebce775eae4 100644
>>>>> --- a/drivers/mtd/spi-nor/macronix.c
>>>>> +++ b/drivers/mtd/spi-nor/macronix.c
>>>>> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
>>>>>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
>>>>>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
>>>>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>>>> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
>>>>> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
>>>>> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
>>>>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>>>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
>>>>>                               SECT_4K | SPI_NOR_DUAL_READ |
>>>>
>>>> I tried your patch and it works like expected. I can now read the
>>>> whole flash in ~2sec while without that it was ~6sec.
>>>>
>>>> # time dd if=/dev/mtd0 of=dump.bin
>>>> 32768+0 records in
>>>> 32768+0 records out
>>>> real 0m 2.08s
>>>> user 0m 0.01s
>>>> sys 0m 2.06s
>>>>
>>>> vs.
>>>>
>>>> # time dd if=/dev/mtd0 of=dump.bin
>>>> 32768+0 records in
>>>> 32768+0 records out
>>>> real 0m 6.16s
>>>> user 0m 0.05s
>>>> sys 0m 6.09s
>>>>
>>>>
>>>
>>> Great, thanks!
>>>
>>>> Should I prepare a patch with that change or will you do?
>>>
>>> Let's wait for a few days, so others can intervene. I'd like to
>>> clarify what's happening on mx66l51235l too.
>>
>> Since a few days have passed and no one has commented, I would like to
>> bring up the subject again.
>>
>> I can send a patch for the changes you suggested. What do you think?
>>
> 
> Why not have a single entry for mx66l51235l/mx25l12805d with superset
> capabilities declared. And then use info->fixups->post_sfdp() to fixup
> capabilities for mx66l51235l based on absence of SFDP tables?

do you mean to add SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ flags in order to
trigger the SFDP parsing and then to undo the read init that is done in
spi_nor_info_init_params()? Too much hustle.

> 
> SPI_NOR_AIM_SFDP seems redundant to me. SPI NOR Framework should anyway
> be using SFDP for detecting flash capabilities and away from flash_info
> based static data.

Yeah, that's what I suggested a bit earlier in the thread. To first try to
detect the caps by parsing SFDP and then if SFDP not supported then to do
the static init via the flash flags. I'll have to check the implications,
it will impact every flash.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
