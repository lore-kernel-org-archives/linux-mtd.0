Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FB1C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 06:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCuwTTS54tmvQyfNC2xkzp026Ybnnmz64UtmbICi6gw=; b=I9lG5aew90Jg/+
	NO6WMwI8V04xNXwT8J9awewbjQfX4HmaK7YJ2qGGjhxKmohleWZkzHahuaALh8XKNuh9ZWtq9d0HP
	hHjgPpKfuDmXKxJrqDb44M7dl936R99BqdpCZKoRhV9Nl/GE9WOtjSaHYyKLFl9/RBwOVm39Aj8E/
	e2KXK+BxtgElZVA3QhNUyWihlc579ZNKISwtsc2zQjMetUnRZ2CDUZCqquDnHqHbuXYvu4jx1Lg5i
	lVz8CTIWOmV4NopqrvR6WRkCysFepIgMiZHu60gI89/eem+9Nt/ZZZSRaDjVJfRF3ebBwAYboCTLS
	6AhuzwQodBCwh/WLQa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgjX-005fKj-I9; Tue, 19 Jul 2022 06:29:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgjS-005fJa-OK
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 06:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658212162; x=1689748162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4v432h4KswnzyKqtipbimarmF9e7Mqa3M3b9Czy0JZY=;
  b=HQ2bbZUQ4/bxvetkG0mGx+d42YA6Ej2JTpT3+N8kztbRbBebMGiyXHeR
   /oNKN5NXolE/p1HjRfzPQ8QVl4GIwQC4WuUizxzYbB6jnvAGyyoepV3qg
   vfrL5siTu98rwtmtapeE1WrTNCDL2Zu4VrQtPAxn7S+BobiNPG5u/dzI6
   zFjTxKlMSatwDv5OxsMuh1hy7yq9uo1QAbnYHTx5lvW/gsu7vS1Adtwyg
   W03TYCg7VK5u0X5ax/5ns6BFUY1sEfo4GnqJSoLX8y4OJKxcg9ScWYhbi
   SoIQZG8b2ouaRPDTO9nkpchX9JW+6TGfuM1VEpJzbYYd+REwuNjr81hVB
   A==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="105073978"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 23:29:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 23:29:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 23:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adIOIdWhGeqJbYFx+TKl2tybniPm3gOuobuv3cmSZO3nw3MtrIjGVUPqpORDQ1AwE0Sx22RN2IS0o2zEBTKJ9/UzaxkDau0rzBoz36F2T5BQrXvkJI1QKpUaHf8ZBujotzpIQPp0ntT70x1vIkTp3aEAR1+1ZNAvJZYhsAyLuZTKsHzxOAVObq3QLYNEndlkeSYypEJTL3lgss0hZ7tQWItpIOmJiXkGtro/oNz1KFCVeW6HCZPZ/eTy6h0dFwIlU4G9V7OSzL0ot9aEq8w97GfnUpKBFgfmfOvr5fvNdW7ttaSI0BA4GprJ5GXQsmg+HfR+ns9xvv15xHhKQKrfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4v432h4KswnzyKqtipbimarmF9e7Mqa3M3b9Czy0JZY=;
 b=juQ29O5+l7JfxZ++eFr4zeGeZCHL9X2wLK/9NugDYaKVXCWQNaZyA9cg1+w/Tzupr+adY1BkZXaAoaNBBGd1avEI5U6RKfQwSgbgxW06K91IsY/08Fi60X2raMXj40Wz6vG2YTb0MbuKQQH0CzhD//vdknHNE4lfRAJDcbQPjNFPfa/f2SH53JWWG/etks3p9DsmYoF7Le0T+t/jHvUOJ508rQFWM0d+ubXlAUnXnCWwsT2z3CGZP9GO+IMOznHJBFMSdjAYfM5tKm4/WuFhbilUkS5/cueegSeCC8qj+qcFrv1BPwOsB0uF7hcWF5iQQK1cw0wsotvtiThqmpwoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4v432h4KswnzyKqtipbimarmF9e7Mqa3M3b9Czy0JZY=;
 b=PetPPrU0ys37ww90vUisSI7+48XQ7+lXnemV2qugnXPejdsHPmpQNaFg0tUl6k8ACDI+sPSZ0VrX+A/XdSY4EieAR2JRF5FrlMK20svzGxx+7Y7oly9zfFpsdN+ObyO3Fvpt+2glZcdZBGoiRGUNnW2gUPyj8m93T4UJxWQQO+g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3813.namprd11.prod.outlook.com (2603:10b6:a03:ff::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 06:29:08 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:29:08 +0000
From: <Conor.Dooley@microchip.com>
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>
CC: <tudor.ambarus@gmail.com>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <michael@walle.cc>
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org email
Thread-Topic: [PATCH] MAINTAINERS: Use my kernel.org email
Thread-Index: AQHYmzjZwPx3+h4lsE+Zp+/GIkBDAA==
Date: Tue, 19 Jul 2022 06:29:07 +0000
Message-ID: <6b9a2433-12de-eee4-02a0-3cf9ea8843e4@microchip.com>
References: <20220718151243.1149442-1-p.yadav@ti.com>
 <165820520992.90015.1804934724521244853.b4-ty@gmail.com>
In-Reply-To: <165820520992.90015.1804934724521244853.b4-ty@gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d70726e9-52c2-4234-99b4-08da694ffc1e
x-ms-traffictypediagnostic: BYAPR11MB3813:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xZ4fv8tShoC/V2N/krydXtjHU71v/6+tcrmgyJVVHt398lC2QeByM3+lI3dqfCcrXtRXQksahGOZN5Oo3axZFrrBJXFmgzOKAsTohoxzgoYf2vEJCAQKseIR7SsJL0cL+3TMEaGkEyEdWSFiri0mrkVUQNphAaXCHU8pyLaHtGJMiFvaXKqeyuveOqQliZaLUj1qKf6xyTwjZ9T1+4PKiU99nbhrHRKzos2iELOKOs5ts1faTzX3BWVHm3EysAUJGo4nHh6dz+DJF37ZpueTdPo9KvowLJvwFWtzH5hpnplo2SYZ26W3VCpAAHaHuMWQJyBa7CIaI39l0cUkhYtNRLnV5+MH0PNyF6K+k/P2d9j+YAz9khk/n9xfubG+AAN2nojXgIL2+IMq6ucAi8BbBt3G4nlXipPozIWKjqwKHu2QZ/FX0zpUzL17IzP2gpjruP5Jm/KG9doTpwB3Ce3YM3uLMfGaMUDLUU8NdSoMaKl/7nLA3dRrXBG0A/A2Ig5RcjY5x6bwNGmREZEWTq5BAmFMNv39shECTkrQJFMDK6PLN7xw89sZnpTY0Guf1zjAS28+0oF193qK7dVOHJAiUebuF8UBivSAjh54k5aem+A8Y1PTXbmS/3NgZsrgHUkMd2TjKI3shz1tc+fkRRZsCkisFGQvVWDrAQwX+jRjOyTtPM4XZAZLQK8UIt1ScaKEZezGLzLzMlWeb5UNnXY9vlpTGa3ILep8WlACgYOEE8TqxQebF9W2EXrP0pd9YvRiZR1FAyJo9bDp2duMDmZzXvS9hO8U64gMXppjwiUgRUgOmEdNNnUv0lVOOaIBuEY+JwW6q+dePNYyEt11P0CUnnzssKj/EUX7lP8b/JMVl4+djRz+rjyYmUb9sD8eew3S1CdQhI8nNuDbOHxeRSHU3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(366004)(346002)(376002)(2906002)(31686004)(36756003)(5660300002)(8936002)(186003)(31696002)(86362001)(4744005)(4326008)(64756008)(66556008)(316002)(66476007)(8676002)(91956017)(76116006)(66446008)(6506007)(2616005)(26005)(53546011)(966005)(6486002)(41300700001)(6512007)(54906003)(110136005)(66946007)(38070700005)(122000001)(478600001)(38100700002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUFsSU9uY1dNYWlpTlhtZ3lFd3E2Z2dSKzJMSC9vWks1clZEcjZ0T0hQaTNS?=
 =?utf-8?B?a1NEMjJpVlVqdGMxQjNGeXBBemJnTFNyYUxXV1VyT1YrNFhuQ1haVVR2M1hR?=
 =?utf-8?B?NGxyQnNFdnV6QXlheFNLU2dHa1lHeStsQTRvWUZQR3RFaUZXUVFhSWpEMW40?=
 =?utf-8?B?aDBSYko5MWM2NGRvSHJZdm5yaGdXQyttWjNDK0U5S09vQmR0aHMzbjZhZ1Y5?=
 =?utf-8?B?UXBITTZwOXo5Z3c2b1pScy9kVm1udFRtVDRTRUZNUFlhWFFlcXEwcVRDRUJK?=
 =?utf-8?B?UEJrd09NNmFBYXVFSUxrV1RjVXdwL09jcFpNb0t5TE5ZK011SEp0ei80WXRX?=
 =?utf-8?B?OXZJQmVsWnJ6NHVLMy9Od3BBN3MyZkNCKzVkeFB3ZGlKL2dmYVRmeHhrTUdr?=
 =?utf-8?B?MUpGRnR2SkdyTUgrN0NUalgvM3JhQWVuU0pGa2NPQXUwM0hJSXUzKzF3Y1dV?=
 =?utf-8?B?NWhndzVyeEhMckQrcSttaHU1UlMwcU9WYzltZlpSSHBnTHJCUnZnRENDZ2Ni?=
 =?utf-8?B?NVZxTTNCVXJTSFR4Z2FJVVozVFVHYWpGNTBQTmtHaldFTURnSFZwV2lmSWdQ?=
 =?utf-8?B?NExZaHRERXlJZHhBT09qUVY5R0pjOE5Qb0VGaHp4bjVuS3R3azJHUDZIS1FH?=
 =?utf-8?B?MWd2dmtTbU9mZk83RUcxelJzZEhrTTZxSmpTMEl6c2w2QzVzazhjTVc1Zk9h?=
 =?utf-8?B?RWVpUEtPVllsUnNjelBXSE9YbHZ5YUxNQjg2ZXRNcE5ZWGpheno2anQvQUF4?=
 =?utf-8?B?SHdRWEgvTkZuTXVVejc5NUcvTFpNY2p6bGszbFhpeDVwOGppOXJ3Z0pPdFhH?=
 =?utf-8?B?UnliS3VBV2JVRC9sRTI0ZXc5Yzlkb08xWkJGWmtvaHdkRWFsRWVtenJ6QVZw?=
 =?utf-8?B?aEUyZHIyd3FLQTJyYnlXa3dRV0d1UHBueVF3NTVBNzY3NVR4enUxQXkyV3Fy?=
 =?utf-8?B?R1VDVlRkdGIvc2xxZU5pYnh2U0V5cjUvZnpET3JZTlppeHkyM3lkRWhNc1dH?=
 =?utf-8?B?Yzd2QlJXelQ0OVRtcFk3eDc4cys1K0RaSGFRc0JjMEV3VWZzd2t1Zzc1RGJZ?=
 =?utf-8?B?N3MvSlJNY3RiRHN5T2xDM0JmaW9ybWVTVUh1T3ZiZmZWT1hvQytWWldEcElH?=
 =?utf-8?B?Y3Rpb2lwMVJqSFBxbEdJa2wzSTFxanVQcmZnSEJXckZZc1ZjSmRKdktma0pQ?=
 =?utf-8?B?aXZacGZCeFdOcURuSzE1NmtQenhuQVQzTlg3Rit4UzNjVlMwZEZvVzV4cFdZ?=
 =?utf-8?B?TFB5cFM1ZERqcVFQSmF6bGFkN05IMVVsQnNDQTYrb1RPTXBtQWYreWhXbmVr?=
 =?utf-8?B?NFhjNVY4UnBuM2h1NUVnejJVVld1Q3JSb2d6cTFxdlJJWDh2SDd5UE9jUHYz?=
 =?utf-8?B?WUxLeEticTBqUk44MlJJQ1Q4Q3ZUK2xlZmhQM3FvUldPenJBemRQaHJDY3Vl?=
 =?utf-8?B?VU1zMTE3RnowaHVrZ2dYR3M1bWRPUndDQlN1eHpzUWZndERPdXN1QUZCdWJq?=
 =?utf-8?B?MklTVUdUc1YwdW9iOXlONHozdTNZanpNZy9veENuUm1NempBMzBtdURKbGxk?=
 =?utf-8?B?c2FBK2dSQzJ0ZjNuc2Z6OXRWK3V5SVhLWHhvaVNXd253ak9EQjNNRHFMV20y?=
 =?utf-8?B?Vk9wcElONGhETGxLWkN6NjZLcHB1TDUrSldIN1NlY1N5SnJaSEk0OEN2elhs?=
 =?utf-8?B?MUUzV0Q5UmJqOXNuY0FNaVRYMEdMdlFiNVFpdWRGWjRaeFF5S1NaOTBTelBl?=
 =?utf-8?B?cHFZQkZBZ0hrSms1Z2FxczMyU0hmOFFuWDFidjV4UlVSbU5lYkFiY0R6U3Nh?=
 =?utf-8?B?OVhVVm9EMk5xemYrSk00a25zV3hPempKZ292dE9QSVI0T2RoeW9jMEZLK0dD?=
 =?utf-8?B?U3BEV0NWUGk4QUpGZTQxb2NwMUJLb1FjMjVDenl6clpTazV6TzAyVTZ5STRx?=
 =?utf-8?B?cVBnSWE2SVFWYm1tV2VVb0U4NmRkZWZMcFJTOFpUTDNwZ01Iek5PQ1N5QkE4?=
 =?utf-8?B?allsanVGZnBwNjU5TGZvK1FtSnRxVDltZVpFSjEvdGxhbGNYR0VkeVovMktO?=
 =?utf-8?B?SXkwNXUxYWpXZmdENUxQM1JRc3JWaUxaRyt1UzNnanU4a1VnOWVTNHllTkk3?=
 =?utf-8?Q?Emev+45aVgiXIUGlfD5bg73Ro?=
Content-ID: <212DBE6E9AA4FA4BAC1B1A9F7D9211ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70726e9-52c2-4234-99b4-08da694ffc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 06:29:07.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iU5haB40N7LUEyZOlKB1pTa5pqb/c7Xk3wVJLerHGHPrJyeCuMuDFiZX846HSky4mwwCcip/E96iuY69pLnnbAlA2S+k5M50yhr66XfBiuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_232922_879721_7B2EBF63 
X-CRM114-Status: UNSURE (   9.71  )
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

On 19/07/2022 05:34, Tudor Ambarus wrote:
> From: Tudor Ambarus <tudor.ambarus@gmail.com>
> 
> On Mon, 18 Jul 2022 20:42:43 +0530, Pratyush Yadav wrote:
>> Use the kernel.org email I have for reviewing patches.
>>
>>
> 
> Applied to spi-nor/next, thanks!
> 
> [1/1] MAINTAINERS: Use my kernel.org email
>        https://git.kernel.org/mtd/c/7de3074b218f
> 

Hey Tudor,
Just FYI that link does not resolve to an object.
Forget to push?
Thanks,
Conor.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
