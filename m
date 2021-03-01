Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2F4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:10:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF5C601FE
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDF5C601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1J8Li7xTx3315p3pajwNy+5ySVgjQqsk2nZ1Uzj9F5k=; b=PaRshd2/VUYcu3qY3emjJLgaw
	ccFojWL9Hhx6Y/z1dFoNzNpKKcK3s/1GxTOIUik9h/FDKlooQyw9D1sWIG+GDK5TKXfCNrgCBoI7O
	R9xagglWJ45GTvzQawYq+bss9S392n743+x978qYje093KLiTgM/QYO1tNg2t9QP5cRcUaoi4JMx5
	HCsW6uUxu28DTrNqiogfh+oJdzfBXSMRrVnRu58QFSWdhcfYq4mmtoS6At4lr1ThWTX6oNa9UEPCO
	fZbnDj9FXulJ1JxE+A02hCJayWAOtNo2NXVUYUqt1R39LtvWROW5q0/0LEKospihvi1h2nKDDyPSA
	TAT4M3D5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjEv-0005TI-2G; Mon, 01 Mar 2021 14:09:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjEr-0005S5-RJ
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 14:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614607773; x=1646143773;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t49pLYc3Hei7F24PNKdZhDEWQXx0oPBouVhX+ub7FP8=;
 b=B0wHsf+INYjWH5So4bK3R3OwvzELFwJSjb12D0ELRBEvzgX05lHGtpbE
 XChCWe9rUkeQIHLcK0+R82kfuoHC+52KMeVDiJNlZ98LoQYps9SaWoAYH
 /IR20k5CZUHCPumT3bSZzMSFk2hujrYs4M0BUYzXTgyVkrGv40CSqXYOk
 qSgAOWsqBAoXk+m/CBfEM9WsJ3LUr+oWecEgxjFSXIjjrWXkMoPaojF0Y
 XKsbduK8oq440U+MszxOPZtfMwzcrXMgvPtqYzWYxmtJLDxleypS3xauk
 RnnCpfFkoFt61LQ7jwXk7SG88jLOoft6IpLiJUVIEgVLODdrKORENgMk6 A==;
IronPort-SDR: aISzTXX/sm/4j1lSc1sQBV48XWyJyxgsBO3zqRAo2G9qB++O4QQc1eJ0uLAV+qJ+giEPGgvIXg
 ZIfnVbcPWnsUBtWtkdvRC4nb+/tSiyCUzNfw5DQP+ZfW6SESj0LMzpFYo0n+ZJ7cIn5how+/Fc
 Wko3TR3rVqk5X/mSWvhZi3LC+qWB3ZFHW3uyLsljZMOlHDSEYzivOtiRz7ZStYclR9nQ19zYPQ
 1NEuGo19mQc9nyJzodclCHvlrXSWT53qgEAvYr2PBev30fsg0OClTJBbeDFi2VBk5xv31lwFLk
 2OY=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="108299354"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 07:09:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 07:09:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 1 Mar 2021 07:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep5e99Yj6CEKBMkAS+FGSltx4VrSlmKOmR/EdM3dbYeTVd1lel7oM3y9ci6wIERD67DZQktCv0PniKRTi6ghyrtXj7rxXGFkVBohzmdAQx0SpKFxYeQhbGjMWJ3xEzj6jFCy66QpFP1t7yI8vf/oJODrshmU5hLx6FqR6x11LM9TL/iv56wyCCWGXZdn9G8xeNWF+/a4q6dvuCtBxGLqVGSBMRoIKLwJ+/g3f71/UtUN49U1vYWXvaIAG4Gjgpl81hHD4oxwrbAiq9yt+ZPhizWdO+sfpPc8RPwWGUhsJGMrk/5h0j/9vgFDMd8inPk1J87evrxMxQq9Hj2S15DtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t49pLYc3Hei7F24PNKdZhDEWQXx0oPBouVhX+ub7FP8=;
 b=nt/j/GvN/FdNFyFQ5CHlUFJ+p5gcCNcJKh43CBLpeSksdI2Ce8SjU+7d2aJ33ux5OYzqipYmgbLbV0Pjo+h6vvspXLMI8emnygxr9x0bnJGB7udAT7Wss1DVzoS5bcbfgaJwFLc0VnbV1xYBjXW2Q8Weq6wJaBGpvzAawl07gRTyzaYmULnLw783nZRn9Y9h7yurJ0CV9VtOw/4ZUGo1vRsYpzKMvU4DACz3+L8o3HpaEWVoLAzQjHkd8fE3Sfk9SsmRAtKlOzvLo5G/9ohwRH1dJSPMjRLWilVKo+cHqTHCVN7Xd8e+431MsyKQ5uJBG61lCqsTnzIhA38CwYvkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t49pLYc3Hei7F24PNKdZhDEWQXx0oPBouVhX+ub7FP8=;
 b=NRpStrZTbs6G8c1A2+wmLkxwXdIRjyHCIMvgRpqB+an8HKSQVC0m8MpPw5p1nzp+HdaGGi8makK+ifeOqCoJLnscUi4ziP/Gd5lzXDIpiOGhamxMZO7RgHQsfDxFLuc+a7Dy8JunskosqbL8QXEddS/vjyWFj4hMgbpl+9V7yHQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 1 Mar
 2021 14:09:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 14:09:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Mon, 1 Mar 2021 14:09:22 +0000
Message-ID: <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
In-Reply-To: <99f92851b9ee95d01564ae01c56085eb@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f27fee2-7ce5-449b-985a-08d8dcbb9d51
x-ms-traffictypediagnostic: SA2PR11MB5130:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5130F97C29F5C7453D859C3EF09A9@SA2PR11MB5130.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zKMYXE/SwTcwayJLf7RilunTRGgyrDn5YWgqBInz3PJoFDUxxPYruwr3bgByi5TEO7ZwwHL3aVR4cpmhrRBHBxOP8DXmx3AVwQli4VH3tR9y8zhp/DtH7n+hkcKUzEP3twCzU0cOJm3Ubc9PVJDXmyf6rUBA1JX7MhbM7zRXK/HAqaH5PqQxYRj8Pbrbc7ca/6hg45Urh0CKfsE6vBUP8K/wXVbkgTB70jbw6Z251zMrJDOHZaom4BaKXdIstN5X7e+3HE2PtYzxU4nMGSqstaiksmnsy7h4mKElUskFyeuKyq5zu1fKoxBoObHMRThWZjyOgDOXXUB68JI4UQTQycXdrEYQCk4eYvtAEOkbA9oz0aKTMZa+uNHP0EaHpzZPB0If3O8VqG4JPqK/9CaDSKNI96DX0CcUisRAv6eME0b0IdLLCxjsNXIZk0ZL5swC38RYJ6Br0DZleUUT4UBUdgTSkZiGCUzWg1lwvmJAZnSVzQzviwdvLV+9s4y9AMIKLqHi1YNwMRwEtqcSz3ss8GshrhzhBEeAJXiIDbFXLcNYVFzQawAPzERaaBCOlCEIr+8hPomapfxDSFLfcBXUmQ5K5/QsD4JVKc1LqWCnALQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(186003)(36756003)(110136005)(54906003)(4326008)(478600001)(31696002)(71200400001)(86362001)(316002)(26005)(6512007)(31686004)(8936002)(6486002)(5660300002)(66556008)(66476007)(66946007)(91956017)(64756008)(66446008)(76116006)(8676002)(83380400001)(2906002)(53546011)(6506007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?U3pLLzZmTExZM05URDZrQlNHRGxYbFR0K2NldURvWlJTb2tiN1c4Y3NFZDBO?=
 =?utf-8?B?OU5LcFVjTkxpRXhTc0MxS2VRZmxSUkNQT1JqcGx4dGxCL2RGRVBnc0IwYWJ2?=
 =?utf-8?B?c3IwSkV1SVhuTGN4V2hUVVJXWitPcEZyY05hTFFvS2s1Y0kvOTdSSysvNGRB?=
 =?utf-8?B?QW5BV0ROdWFDZDFFSzVDNUE0ZkdBNjVteW9KaVJzanNHekphRjhqL2pQSzA0?=
 =?utf-8?B?VS9oa1poeW9UR1A3OWsyc2YxdWR4OXV3V2M3b045aXBCMEZPMnRHVllyR3Bq?=
 =?utf-8?B?V0hCRlJxZGp3ajR4TUUyWnZSVE8wZ2JtMEdEMm5LMUl4andCbXVqSURmRzh3?=
 =?utf-8?B?bzYwMGJyTzkvU2VIUDdUTnk2WFRvTGJ5cjYyeVVzcjJCTklLOEtBVUh6MTdI?=
 =?utf-8?B?UU9LQmxnU2lja3JlcDI2eTRrU3U3cVNzMXlXcVBhUk90NXBCVHpOWXF5MWNK?=
 =?utf-8?B?bTBYVWlsLzlidHVGL1dJWFRIdjU4VTJscm8wZzZleU1yQk1LUjhlNzRSblZF?=
 =?utf-8?B?YVpQYTJMclQyWE5BYkNZTWN5M3NOdWdFdVZ0OUJQMEZhd2VEeWVrMTlIbnZG?=
 =?utf-8?B?UVJpQyt1UTU1WkhzaUhyMmtqK2Y1SmwwVkJtUm8xYlE2djNIbFlpR2VjUW1F?=
 =?utf-8?B?VXZaQXB4WU5YNUxPdnBnQW1HeGhEbEkxU1QxODh5R3pSMldqREd0VEpBOVUw?=
 =?utf-8?B?WW8vSlRyNDR2WWNFS1JZUVlWOVV1RDhGSmY3MDU3UWtUei90MndXS2tSSFlG?=
 =?utf-8?B?K0wrRGJHcmdEbTgxazdvbHJCZEtIM0pCR082WjdtK2FnU1luTDJZRER0NmMx?=
 =?utf-8?B?UnZJTUhpdXpNN3p6SkJJMmE5cXB4THRiWHFZQUREZmwvcGpwaldST3BrZzdP?=
 =?utf-8?B?bFY5b2Y1T1NLWnUxZjhpOENuUlNWYTRWM3VEbmIwNnM0djN4dnhBTVhGTEVI?=
 =?utf-8?B?TS9vZVFuQUNjQW1Dci9oTXcrNDVWenhUWU1vdFhSY3BEb1h2WWg5Uk9GK05H?=
 =?utf-8?B?d0VrVC9iYTJPT3FXTWhwM1pLVFMra2xUREZqbzJOaHZuZkFua0o0NTUvSTZN?=
 =?utf-8?B?bjhJS1NnVTNaTldkZFphMmtUY1p6M3pXUjdrWkRQOWxHMW1LQzZwb0wrYjRY?=
 =?utf-8?B?L0plNUErTVpWTVhlaXdrOUM1NThBblp0M0xjRDBoRDVKaVJMSDd0SExWeVBo?=
 =?utf-8?B?cGVjczZSTXd3eDZrdXBtYlF2eU83YmJPN3N6Tmg3dmw5T3RCUEE3OUUxME9p?=
 =?utf-8?B?dURWeEJaZUZkcnNFVU0wUVV3UlNvQTE2WFVGZndqUm9aa3dlSC9TY2IxQjdi?=
 =?utf-8?B?ZnlzOUNuTndIN0tibk9SdHdlUXBITmVsOVRtYjFmNVQ5bmxJSGNIam9oTVpC?=
 =?utf-8?B?OUhlRXlYSjJJdWkybHE4YkJoSjUraURqOGtqU0tMaHY3TXJicGFmWE9iRHdG?=
 =?utf-8?B?R2RnVVpScGZKcndJTnZZWWQ4VWhpUVBMVlV3WWVVN2RLcEc4SVdoT0VNQzlo?=
 =?utf-8?B?L1IwTStSMUVFRjM1V2p2VEU4ODJHSklvLzFaQ3NRSHdSY0hEZ08wd3oyb0U1?=
 =?utf-8?B?ZUlEc0xmakVySjdBWlhMWm5ndHBRUGN1SFFFMG1HQzhjcytTRkNJa2IwVWpp?=
 =?utf-8?B?eUVYSWx4eU5XMkZmdGdoM0k1V29XM2ZJaG5aeUxFMjNlQmJCeHdYL1NLVkxo?=
 =?utf-8?B?RzdwZk9ucURkQVFPaTA3cld2cUxlRC9Zd00vZ1kyc2VmMlR5aVJvQlNmSHgz?=
 =?utf-8?Q?JdKitLBd1WU2IM3glY=3D?=
Content-ID: <7EF6A766A5A18945A549254FF779D817@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f27fee2-7ce5-449b-985a-08d8dcbb9d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 14:09:22.8056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVugJbeYHsJEr3rRMQ6OmHPnDF2eRybjbIwiAYC5rLgXv9XbQd2Lxq/4LVDS0vTP5kny8x9yxXclZ8642l01iMcSlpe3ZaouF8APB2nPquE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_090934_049159_50AC4C31 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xLzIxIDM6NTAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gMjAyMS0wMy0wMSAxNDozNiwgc2NocmllYiBQ
cmF0eXVzaCBZYWRhdjoNCj4+IEkgdGhpbmsgcHJpbnRpbmcgdGhlIGNvcnJlY3QgZmxhc2ggbmFt
ZSBpcyBzb21ld2hhdCBpbXBvcnRhbnQuIE90aGVyDQo+PiB0aGFuIHRoZSBoYW5kZnVsIG9mIHBl
b3BsZSB3aG8gYXJlIHJlYWRpbmcgdGhpcyB0aHJlYWQsIGZldyB3b3VsZCBrbm93DQo+PiB0aGF0
IFNQSSBOT1IgY2FsbHMgbXgyNWwxMjgzNWYgYXMgbXgyNWwxMjgwNWQgb3IgdmljZSB2ZXJzYS4g
VGhpcyBjYW4NCj4+IGNhdXNlIGEgbG90IG9mIGNvbmZ1c2lvbiBhbW9uZyBwZW9wbGUgdHJ5aW5n
IHRvIGRlYnVnIGFueSBpc3N1ZXMuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzIGtpbmQg
b2YgYSBtZXNzLiBJZiBtdWx0aXBsZSBmbGFzaCBkZXZpY2VzDQo+IHNoYXJlIHRoZSBzYW1lIGlk
LCBpdCBzZWVtcyB0byBiZSBmaXJzdCBjb21lIGZpcnN0IHNlcnZlLiBUaGUga2VybmVsDQo+IHdp
bGwgcHJpbnQgdGhlIG5hbWUgd2hpY2ggd2FzIGludHJvZHVjZWQgZmlyc3QuDQo+IA0KPiBUaGlz
IGlzbid0IHRoZSBvbmx5IGZsYXNoIHdoaWNoIGlzIGFmZmVjdGVkLiBIYXZlIGEgbG9vayBhdA0K
PiDCoCBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYw0KPiBUaGVyZSBhcmUgYWxsIGtpbmQg
b2YgZmxhc2ggbmFtZXMsIHNvbWUgb2YgdGhlbSBhcmUgbm90IGV2ZW4gZXhpc3RpbmcNCj4gYXMg
dGhpcyBwYXJ0aWN1bGFyIHN0cmluZywgZWcuIHRha2UgdzI1cTY0andtLCBpdHMgYWN0dWFsbHkg
IldpbmJvbmQNCj4gVzI1UTY0SlctSU0gb3IgVzI1UTY0SlctSk0iLg0KPiANCj4gU28geWVzLCBp
dCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgc3VjaCBhIHRoaW5nLCBidXQgZm9yIG5vdywgSSB3aWxs
DQo+IHRha2UgdGhlIGtlcm5lbCBvdXRwdXQgYXMgYSByb3VnaCBlc3RpbWF0aW9uIHdoYXQgbWln
aHQgcmVhbGx5IGJlDQo+IHVzZWQgb24gdGhlIGJvYXJkLg0KPiANCg0KSG93IGFib3V0IG5hbWlu
ZyB0aGVtIHNvbWV0aGluZyBsaWtlICJ1cGRhdGVkLWZsYXNoLW5hbWUgfHwgZmlyc3QtbmFtZSIu
DQpBbnl3YXksIHRoZXNlIGFyZSBqdXN0IHdvcmthcm91bmRzLiBNYW51ZmFjdHVyZXJzIHNob3Vs
ZG4ndCB1c2UgdGhlIHNhbWUNCkpFREVDIElEIGZvciBuZXcgZmxhc2hlcy4gVGhleSBzaG91bGQg
YXQgbGVhc3QgYWRkIGFuIGV4dGVuZGVkIElELg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
