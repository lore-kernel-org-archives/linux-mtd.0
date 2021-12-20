Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MCnqCrSGQZFfAsVuqZAqMn45RwmkziqYkdXvnGLolOE=; b=EWyOtBCtSRUEE4
	Hz8gBsFpahuzSa5qZ8TlGdB3JpbaI9SnR7FcZW1jp9Yrt5jcW248mg975yy3goKNmvTJVHav9/j5O
	jtm5xFlTRHNjiehqZa4QbGXo/A+56q5ohk2UfnoWtCHNEj4MwBkYoqRAZsCXEqzolm2aCNmSUUz8H
	QkdBp9/tBFnVWwTfQgjuv03kRyKAtb7k/8uZ1xaEjk9JBISU2LqdiSSMOpviGD44zAYtscipL2EKS
	NWNYBnqQKb3mhYR4Znx3SjRaYPP6QmzxiA5kcaOtNj+128+oUxqIteju4DnvMnqBfUaVSlQapPXse
	SVv76vT9etE9vrcEgnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzF5a-001QYK-Sr; Mon, 20 Dec 2021 09:36:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzF5X-001QXW-Se
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 09:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639992972; x=1671528972;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=FKSztVjiv589riosq7qatiRuLwA5RYcueSMdUEBGpH8=;
 b=g44M3nEsKHlr6VnXT5HkqhlDjopTHMF+szYmlwyb5rQZg+Ec0s6TXNPq
 YFchrr+t4/sSBfC4dXcaImmouZuPN/3V6jSpEAUtXHgOjdBLZgkFLzhZ5
 BeudLELyefhHG/E9w2LyvZF9OjocwH5MOVX+wGnTXp77FPoKShlhbhiyM
 z/HSC7jjgMjmZcOYekLXRJxBd0zfbvFi2HeujkCDX9rKPheJbutc3oVXW
 ijk0FJLXLXyjDOb+6KekYMrpGr0Y/l1eloy7SKHZDqVcgKjpUR4gZb2d3
 uezMMYa2aL8z+ZbdDYnLcA2DgL9tBYeOFvVqqu6oD/0ZtR3IwaOY/ywzm Q==;
IronPort-SDR: qDmsc2Y4uiq3/GYzyDkGA4T17WoOCU3skV/sOIABwOuHzrgO4083LfMrcT2RTGRCkrY6AMAAvE
 v6pGE6imb7XVUiKAbBH5pH3ZjeW5fSfulEs++/24lhq3NH28uhpEKj+X1k4NWiP/LyzdX7vcWF
 QI4ZQH/omIPZIHodpvzBfYCad5vwRzzgb3M0gd0VZDPikfUkWlfSJzCUGVn8DxI1SIF+aKFjUM
 vGp690FEQDlDegIe1dYWsTSYwS40z0UmGYRaZchgffMHRNtha8enO/7WFVeFteUOI7LRJiJHW7
 4RSkEVNAaPb+IQtM2sF0IF2A
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="147220830"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 02:36:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 02:36:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Dec 2021 02:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaRUbmEcfdWat3s5kVRtq3oSK7uol1CqxPAkBki+X+UxsYjjzhwuu+JHlmhflaWBCxjwVzcD6V1Q2atGmT0Hyj5Rt4XLRIcoNPCU7xOQfeX3G+7s9omLsBb8FRiXVzX6W43Wk9WU5886Y0lZJcYOEQKYxVztoWn+cMIwjGA20VhJEYVgPRKPVS0pWlNyTO8XZt4QpjXhp+pDb3FIJFlYb+cX2NlhiNl8aQCVNdAXLMHdLeesRbZlL/DEEIRfC11zuQer6sY6ui2uoX8V346K4tzo8Ir7KhS8P/RgFTT5TRNeFV0i7Lr3j/FHl/VxvF5hJYagLxpZEai3gyTId8FhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKSztVjiv589riosq7qatiRuLwA5RYcueSMdUEBGpH8=;
 b=UKYqUhjaXRHTkKJzmYh5TCx1impTSCG1Lt2Tv5Cl/L7iBpZaz+8T1F9CxR830gw0pmklNX/LygjUb6buZzcI26WxWy+nPQJiVcCx4vYrhEF3tCh6Ph0KgYm60F/gidTBrKgsMRtpsE0s7NMKu7p6dRZ1Iar7UdkuReGlhcDSmxC/2nk7U1mKHjHvwTAvO/e/8TyImZKb+RniLhxIJJUV1tMTBesDzJ3HU5TEpj0HX5Ci+Y5YQHvYUPBi2hTnRTUFHLj5KW+LJeJlvHC7VcvGgk5dNNCEk84pv/wRE7kI5JM7Srr6zSFW+QlLs64OPYkEsjo/OXzpz2LR3Kv/N3ItPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKSztVjiv589riosq7qatiRuLwA5RYcueSMdUEBGpH8=;
 b=gsE56wjb15/OJdYjga5t1IY0orm85OYe6BbAzODQhb6A45XVQHuWsevAUE0JrsIbDGMR6pp6eKbTqUgZYYY/Ee8bg0zHDGvyrzwnD/R14qPDeOsP7bbcxH9c8tBeFweeDOwgnCHeLAKnh95Je1aMxGKDsVlKL6gCF7w1X3ichTk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 09:36:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 09:36:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Takahiro.Kuwano@infineon.com>, <juliensu@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>, <beanhuo@micron.com>,
 <shiva.linuxworks@gmail.com>, <sshivamurthy@micron.com>
CC: <michael@walle.cc>, <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>
Subject: How does an SPI NOR handle a single byte write in Octal DTR mode?
Thread-Topic: How does an SPI NOR handle a single byte write in Octal DTR mode?
Thread-Index: AQHX9YUCb2dXkbQCykKyR80l6lA8LQ==
Date: Mon, 20 Dec 2021 09:36:05 +0000
Message-ID: <f593ded7-6cb1-7645-a0b4-dc20b5576d1d@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a8ce3b8-6e90-46a4-8006-08d9c39c250f
x-ms-traffictypediagnostic: SA2PR11MB5065:EE_
x-microsoft-antispam-prvs: <SA2PR11MB5065E0AEB7046B3F5756D3CEF07B9@SA2PR11MB5065.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5UsxGPBoQ9R/Dlmh/GF1VgRpLVyuafmyjkT/Cc5B2IusskawzYOwiQjz+nTOyj4/8g/dSw2Uvx6wPmEJ4TWDy6b1IVdAD9Cd/pZ+45DXCcvtfuMeble8VAQrQzvLZar9qnj3WODGJz4jprjYCnQKhQTGsYRQqXJoQbmjI5556Fzpwvf/TyDcSb5VvPEkimj91iYEaZkny6tIi1syFCXCd3LAV31ZHRwdYQJ7YSWfhbAk52ouOoctblEVKsU6AlVUu6I+OdsJ5tIT79AWw5JNSLbz2ytTTrLKvBZW4ZyYO35Up+F7du/OVASNMOfUeoupklDRhpJI43mhXAHfoRa1uaMxooBaBfp7Cw3Xo6cMtOd7wgik+nsLQ7rcJJxU+L75cxbEcn4HbnF47jBJwd2p1gk47vYcKDxYMEYaf+iYNvMiAs4AEwsT5/9IVLbj+pPJecechpTh1Sa0VgDv/HFlPFxUMHMRrvTALPz2PKXLlsl1MMlo22y1huXWbtNNMAin6mxqtUoEJMQkEqrWa0FMaDfFXZu+eWptaPa24K4EnvgRHnPOd3Ng1qxZve/At1nLCl8rsFA0Dkd9P97lxUs6EV9e68g4kPjL8m8d01haZWB6BGoO+amsHyB3MBlnFum5+vl0UYgCoRCyDe3EqbU6zywy4H8d3agJxSaaF+YfdXbKU5ditnl9TFysX2ZvdLIJzMLZRewL7cMFLyjOLrzW7nCee/9VI05vAbG8pUc2puU8Q2msx/0fDZb0O1ffRlnE8+Ld/mBeRbBAT8DQWrr96WGuXLC5iFaLZOWSLFWJuLl11ISv5MOPiJGG1dhApVauq0BBvae6jJaoQLJV9xFp4xg2rn3sKuaB17ebkrMR5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(71200400001)(5660300002)(86362001)(26005)(7416002)(91956017)(76116006)(66946007)(8676002)(6506007)(31686004)(4326008)(316002)(83380400001)(6512007)(64756008)(66446008)(110136005)(54906003)(8936002)(66556008)(6486002)(966005)(66476007)(4744005)(122000001)(38100700002)(508600001)(31696002)(36756003)(38070700005)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkdLRnpYOHRpbUZ0TUc0YTlzT3ZSSU9xeHA5b0NiRG1McUxjcFNVS1BUeDZn?=
 =?utf-8?B?am9LREpHQ0pVazdkNkFsYi9DNDV6QlZralY5a2JONThhbUhlNnBZRHVFZzBD?=
 =?utf-8?B?enJVc2RjdUFxL0F0ZC9lZUJoR2t6QWpyVlRYY2svTnFsRFhFQ2pGUDROSXBS?=
 =?utf-8?B?TCs2K0taaGdDYkRFV203cURmajh0dkFVVXBkMlFHODAvN0wwL01USzNtNi9s?=
 =?utf-8?B?RlZxbFIrbDdRTklrNG0yU0ljSDJkelZEams3dWQwQ1JEa2paREs4aFBROWpk?=
 =?utf-8?B?ZUFCYjFtU0xYK256S3ZOU3ZkZmc2Vm1GSkV6dUJUbTV6K3NTN0xQQ2cwYUIw?=
 =?utf-8?B?aW16MlE5QmprdzcyV2FkQWx6SUhRMWxVOTNhNXhUWUN2aHcwcllqUkQzZENz?=
 =?utf-8?B?cW1na05DTmpueC93a1I0VzVZbHJOVGZrYjU3R3p0OGVtVnFYckZ4a3kzaHNh?=
 =?utf-8?B?bW1Za3QwQSsyVm01VWVlWEQvczFIeFo3MUdZbzFkREdZZHZmZkMvVE5OckIr?=
 =?utf-8?B?YWNRWG9SbXJQT2ZtbStZQTR1K2NHZTZ5WHAxalJWajVrWUFoTThQNFJ2enZZ?=
 =?utf-8?B?R21MalV2dFZnOVdUb1JCVFlXM3NVWkc1VmUyemlEaU5DK1NmZ1lQRS9QajMr?=
 =?utf-8?B?T1dnTnZOcmEzMUYrbkFKcTJSYmNOblR2MkErVVFUVEhLdS8yd0JVNE1DWHhP?=
 =?utf-8?B?TFo2bktZZGtLY0ZsUnFyZWw2MndVY1lXUWF4RnJmMzZRU09IZTlVaHZPM0lQ?=
 =?utf-8?B?Y1phTzB4WTI5WXkzR2E4V0x3dVZXQ1RwNFRhVFNQOHI5eXE5L3J5QkJRYUlY?=
 =?utf-8?B?WndQSGdHdzhXYUIyOXp4WEJVQkNycXdlT2d3M0ljMm1rVE1rVjQ3TEJ3dkg1?=
 =?utf-8?B?djFYTENEQklqVTJQaUpWMzFMSnVTZy9PQjRJV2hqeDJRaE96eVNWc3JRcnJh?=
 =?utf-8?B?c1MxZHk3WjA0cnpDVWQwRThNdk1TdHBsMVcxSWVHZVY5ZitVcVNnR2RnN3Fx?=
 =?utf-8?B?dytGZEtuY2gvQ29uTEt1TkxUYmRXNHF6U21PSTRqSXdrcG40MnpUZmt6VlE2?=
 =?utf-8?B?QzJFc0w2ZzFaVm56aUh2WWpmTXdwVWJ6cWVTdlBpUXc5ekZYWjd2R045RWhB?=
 =?utf-8?B?RTJzK05zc2V4Z2FFbEJRNDU4K3F4WTlZVlZMU2lZaEY2M25iSmhqaXB2Qnps?=
 =?utf-8?B?NHJWekd3azc2b1FrWTBuS21UZWE3RkhOckJ1dmJEM3h1aWNzMTl1cmxDL2pF?=
 =?utf-8?B?OXVhVEZyTEZZV0psNHVIRkFJYUxnck9wb083Uk9TcTVJbW9YZTdsTS9EOVdK?=
 =?utf-8?B?MHZ4dW4rVkxkQ0w0eGNZeG1TNDZ6QTk5VDI2Y25zNkdJZXNNWHYyRW5oTEk5?=
 =?utf-8?B?UnkwalQvQzRHMFRDMzNZaTBYUVB2Myt4bU9MZjJyNnBQaHdFQ2dOZW95ekZ2?=
 =?utf-8?B?Nng3dHlGS2RXUDZkUCtFZXl3L05LSTBrbVo1NEkyVjFxRmJ2aEJLZU1TQWdj?=
 =?utf-8?B?d2VJYjdLMlNIMkg5NllwUGRYZzVCeldRWGJwUzAwSlRSUmhFanpwLzBDZzJM?=
 =?utf-8?B?ODVYWlhPN2kxRjRzMUIvMHI5YzNlVmx3Q3RJY3VmOWlibndxV0hodkR1d21x?=
 =?utf-8?B?OWhVTXpFblNhY0JRZ1FwdkpWbWFFR3VBeHRGZ25KTlVoWld2N0k5UTR6Wncz?=
 =?utf-8?B?TmxYdjFuYzZVWlRxaFVuR1hVTC9Rc29sV3pSQ0s4dmZicld1U1hKK0xRSnZq?=
 =?utf-8?B?eW8zZ3NjdUd0M2owcHcrdW5UMmhyb0hJeExGYnNSc0xXOEtUaTI3ejY0Q1Ni?=
 =?utf-8?B?N056WCtZRWRmeXhrbkU3clVNRDdoakRkdFMwdFBJSzE5L2RXb3RubUNiMEtK?=
 =?utf-8?B?Vjd0aGZCSVdvYklsc3dwL1FPcGdjQ1hJRUd2ZHpzYTBVVmtMSXcrVXBPanNw?=
 =?utf-8?B?NUIrZlFFQlFQdHhJSjVSQTZBYmpUNjRGL3lQL2EzR2tRbzJqVDkvTTBzcm5j?=
 =?utf-8?B?dWtBLzRkN0p0akdJUmM0VUdYV1JQUmNLVkw2NkZrYW10SGg4azYrRWVwdkpU?=
 =?utf-8?B?WC9yVkp2dmZMY0lRdzhDcXcrUjVTVnhJcytzM3k2Ym0rbGtMWTBHbkhZRm5t?=
 =?utf-8?B?clpGc2duTXBqRDl4Wk1PL2d6ZjJxY3hncHQ4S3pKcUhkb2s5cHhBWXFyd1oz?=
 =?utf-8?B?MHRBaWFwSWwzNEppandHdmZWTGh1aWRMbFFSUi9vOGRBbWRla3Q5aGVzTkNl?=
 =?utf-8?B?b0VjVEJ0UStUbXRWY3lUOWkvREJBPT0=?=
Content-ID: <B231650EAF12AB4BA11AF4229F835484@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8ce3b8-6e90-46a4-8006-08d9c39c250f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 09:36:05.2538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5ycm7Cs0uUNnjuPHmKm+A/W/zZLq0ido7ndrEndolCeAyPdNG9dnCwcHEtD6tvB3N3XXlEI6mwR8tDCgCrTJbdAP5m9+SD3J5bLbVkgnJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_013612_067291_641C643D 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

Hello,

We're trying to understand how flashes handle single byte writes in
Octal DTR mode, and since we haven't found this info in the datasheets
that we read, you're our only hope. Can you shed some light and let us
now:
1/  Do the flashes ignore the second byte in Octal DTR mode? Are we forced
to first read the byte that we want to update together with the second byte,
so that when writing in Octal DTR mode to write the 2nd byte that we've just
read, so that we don't change its value?
2/ Can reads or writes start at an odd address in 8D-8D-8D mode? Pratyush
proposed something at:
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=246518
Are the assumptions correct in the patch set?

Feel free to forward this to anyone interested. Thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
