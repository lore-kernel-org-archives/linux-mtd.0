Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7388FC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:48:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0500D21741
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 16:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0IFfqoVn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mlbHRAgy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pbOSCIcT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0500D21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QdwONenwZiDGx1rNeeEG6w57+r809/EMLuz/IzJsm6M=; b=0IFfqoVnDPNTbwHciVJSxO9TE
	sGHx0CWQYQUWtJNcaPphaguUWVg/i+w6zu1ieJ9sDckCDkZQBONOos+aIHUCkq1suUXDxogPXJ7u9
	sTaqoWaktAWi+kIKsAk6PgsVhJ5UWJEFneJLLYd0ee3g95V5nSVVYRKijS46a6bKCCQnG5qKeKD2W
	pUL0xZ+N1ajJiL/TSMT1opgLsNpXOJoKbffZcoM/YByFiK13uCqWD5cqZ9et3JWNytSDPV58o0Hi6
	syx47tmbLsds80cQJj6mCy1O6qbBJtegDpJ9jwVAlveXt6c57WNR6He+nf+zufHZmHYN+atGng5sP
	3ZQmwpmhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiKQo-0002m8-0W; Thu, 26 Nov 2020 16:47:42 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiKQl-0002lW-8B
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 16:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606409259; x=1637945259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z92vN/+s1eMoJ+btIKlisjsRWB6TiJLbm43YxZFkrRY=;
 b=mlbHRAgy0R74XxzEzwmfjqnQix5WwQkdNK3tSj5v8SJxyTCeqbyAFFt9
 2KrF93k+euU5I7JXGuzOcx2JAvVtCwUeokQwc+vd5gt/eMy75AiB91F1f
 cguJHTzdWy4E2ezrC5j7Rnkjg2aColdwntE97YSxFTErn2qp27d/oiNV8
 DEQo9d0KY9ANv2LYXe8uMLpcRldTC3JZWjqXpyuavAFSc8VvbQ3wwLFjB
 vddNheA5TL8dUEQVw0oD67igK8bOdoaotPgJ3PqoWGWHWqC8A7KVf+Fo2
 6T0OzKLRjU5LYnUae51g/ZTU0DHIhxqC4rtmanGnvwpjcXRKlTmCh6f35 Q==;
IronPort-SDR: C+DZfwVqkn48I0vw1rYXCijdF9wTTzc5kSU7AoZMhnNwroFV4WBdzkdh3m0CXAGQsTHO3NUAr0
 imBDV//86ygB5VnHf/Vv9UL+f4DHluFgkAz+NdCJC2spgFabT/jSf8CVfrSE7UuFVMO3ehOBN+
 5mTGAxuv/GHrW85sXFLP6Czz7YqfovtJfS5hqc7u2bLFJR3MtQa57q5RRSXOkewNgJEai/re+A
 4utxapq3EyAYPciR/wv2fb3OU9cYL3TxxEJ/SkL1QFcxkV+zQHyyrBwdwG22m705FnjXtrXcHR
 v2s=
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; d="scan'208";a="105154114"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2020 09:47:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 26 Nov 2020 09:47:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 26 Nov 2020 09:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi2yR7qFm5ub4Mhnh1mEqEP5PwzXYQXuUbLpICKnlaKbmwpIr/8IbSccXmu0FjvzwVEtoWpAgrhG0PyKTlyrMYOlf4ODDCRxhOKnDor0IAEjM2y0/qM5nyzb1D/36BfYNNAeu/tFdxSxtEl2qTbnfk/kG04dTNgTim2cWuS78hfHrC4sEHv1UunC+j7UO1EkcGNdSy45RlVy47Wwk3TbL/HdvnTgpkuLJD03z7CpEdx2ZzwMZKex2UeCxZ/QaQod36/KbSYHtLzmo+6o/d98KHyw7zTLxt6dsLCxO2iyLjRW/SSVeSahylPHnMfJnIivMG+ItLRG2CHAvx6gPRrVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z92vN/+s1eMoJ+btIKlisjsRWB6TiJLbm43YxZFkrRY=;
 b=OQY9iPn2S8/+DRPj2PuvjmrFj9rETKBniv6QxiKjVVXrBgQUQTi1UhaSZB5CZ3oanmveLUGnnr0/c7T3ryRa5LVMT5l/IjtjIu3O1poNAK3PUL4vjna93L8VKoTIEzV7MWuJy0CFBBo9mXgdyAdoSuIk9pr0hd/thA2jAqA+LXIp4wI5MrDkH0F3Rfs9cYDGMiG/LFI7M/tNvNP/WZcQMUMKUb1hP8BZZzFawSOYITkBNfWWCJ1GS9X78edWVTFAJmhnhSOak0veVmE6EnW6CWEF+Ku/BfTaFjwdAIPZs7ODKySpVL7VPFw9bTSVh61vGvYcmul6+AV8FF2oOuX+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z92vN/+s1eMoJ+btIKlisjsRWB6TiJLbm43YxZFkrRY=;
 b=pbOSCIcTag4105Xu45ARFxg5sDAadw5cv33DXPBPM5wvaqEw674KDdsZxpnw/KGG+okcEuuy2mBBYXdyyjN7LyRusxFLBmERoKR17SwRGdCjjQ8bNzlRej9Nh/NBXmF4codxVDvVnVF8eeBKpFwsMoWxrM7skgpiiEFLuz1GNmI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 26 Nov
 2020 16:47:36 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.021; Thu, 26 Nov 2020
 16:47:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v5 3/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Topic: [PATCH v5 3/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Index: AQHWwyV9Mln+2AGpp0CZylv8vNNFfw==
Date: Thu, 26 Nov 2020 16:47:36 +0000
Message-ID: <897d0205-b4c1-b5a7-6034-d0d7144c0868@microchip.com>
References: <20201003153235.29762-1-michael@walle.cc>
 <20201003153235.29762-4-michael@walle.cc>
 <e9437b3e-de44-7b17-df2c-6a8502b48ca4@microchip.com>
 <f6344b9cb5c61c3bfd075e231b708269@walle.cc>
In-Reply-To: <f6344b9cb5c61c3bfd075e231b708269@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ebb3d17-7395-4f0b-a618-08d8922afadd
x-ms-traffictypediagnostic: SA2PR11MB5164:
x-microsoft-antispam-prvs: <SA2PR11MB51646EE3D04E1AADD993A5F6F0F90@SA2PR11MB5164.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:546;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BjxcdTAwV0Oec7dIsix91mwumLtTevi92ruHdLln22+P2a33NKIyklmG5DMm/q6AblmlqBwNlTInHqSpehUlIY+DuCgrpmmTkZxC3naqR5SXUXxrpgQGDCl7a2cVMOfdX6Vq4X2YRBuc37twknzzqHck8eURx4a2AR3A6oyVJpDZQ3rcfEvT+VzNpw3YbC5JPdZ0rt2mXxN+ERRt8d3ucHcH7CcBwGQYHge4IQCRb6ZZxhaUyZjnAiqzGmgLx94+C7MAtqlulA+wlY61hw8JAY1u1lkp7yiVi9BFtvXH5CCQoWLbtRAzRostM6EfJt9boGP6+0N0i9RonOWFFpe0akqxGIBIpXRHpAfMeZxeYxGoBHvjoMGnJvWLCrOU1beF8+xt5P2kSWd/b8NxwDDwAqbohWCXFR0z6gPZCv1ovCCXRs+zuwQXq0B9520ShFGWjJeNjp2CiLt22S8fcp3Ggg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(71200400001)(6916009)(64756008)(31696002)(5660300002)(66476007)(76116006)(66446008)(66946007)(4326008)(36756003)(86362001)(66556008)(83380400001)(6486002)(6512007)(54906003)(2906002)(478600001)(316002)(2616005)(186003)(8676002)(8936002)(966005)(53546011)(31686004)(26005)(4744005)(6506007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TU84bjdiYXhOd2NXRVM2bXF6TUV5aVFkTUx6V3lGckF4U0RSTDJUc1UwL3Rq?=
 =?utf-8?B?NHhuWDQwVUhjeTAzOTM4TFRzR3N5bW5oNEhOYTNlNnE5TGcxRTd1WWRhdEpW?=
 =?utf-8?B?eFJLYmRPdGg2YlJmMXh5clI2dmdDaUhHT0dJaG5FYXpoRmYrTlZDcGh5SmZ1?=
 =?utf-8?B?NXdmRkN6UlBrM2ZlYjFsTnF0dlFuV0hnenlrRXVvRjFlM3ZoR3huV0ZzNWg3?=
 =?utf-8?B?SlVFTGdrbUlnY1VqNGpEZUF2Q290MDZOeUhoQW9PdGRPUjFpeE1xUWxVR053?=
 =?utf-8?B?cjB0L1k5dkhMTy9RMGhUNFgwYTdVaXpmTGtFNEdPSHVoYnRheVJ1T1pCVlBX?=
 =?utf-8?B?K2tPaGcxOTh2VFBQT28vV0RDaFlscWxJTmIxdS9LRDZoUUVYZ0VsOHJibG9Y?=
 =?utf-8?B?Tm9BUUdvdkcyeXI3RTRsQ0VLSzVLbVNMaThRYVhicUtNY0hlamVQOFhLd3Az?=
 =?utf-8?B?VEJTWG41NklxZjVCOU1OZUp6ZUVFdXlzc2FsYzFXQVFyOXVYZ1pKZE9DTjNQ?=
 =?utf-8?B?SjkySEtWUWM3ZC9UenpVMFNTbzMrN0pBMEpNNDNXWXhDZElidEhsOXRPOENw?=
 =?utf-8?B?NUFycVhibzMvd1BhV05iTkRtZXZNNzhOTEs2VUhDRUxUbWw4RVV3dHFNMnQ5?=
 =?utf-8?B?YUViYlJTYXVyTWM4RHRmUGw5L3Z0UnpwVWFVbzNZWGhpVmVZb1V0ckJHZnE4?=
 =?utf-8?B?RnJEWmtHa2diUm04eXJQRlhSaWRocHZwT2pWOW9RaVdaQ2FtOVYrMjI1b2tu?=
 =?utf-8?B?L2hlcHNud2tHVFFYazJIOHJjd1hmWC8vWWc3cUxrUEdRT292bUlraHUzL1pj?=
 =?utf-8?B?VkxoZjJiTmhKalJlOHdLWk1WYkxFWUZScHZDK01qMGg4dkFEYjFlSngwdW5R?=
 =?utf-8?B?YU84bFU2bVgyRUM0QUxkRnV1c3A2S0c4ZlJ3dTAzZnBaaEc3OHRWN3NaOXVI?=
 =?utf-8?B?VFFadFBtUHcrZVFUNkxCSjZBeldkczJuYnNtME8rOTdVZU1WQVA1RUYrQ09S?=
 =?utf-8?B?dXdQbkp4THRXYTAvUDFIU0t5MWNTWlhUNStKbHFxME9DQ1MwK01zRE83ZVpL?=
 =?utf-8?B?dWJuTXN1L3loa1k1bUQ0SUVvazZYRWNsVG5sVUgvNVdxUHBpcG5sWFdwR1Ir?=
 =?utf-8?B?dXIvbGJzcG9uTldJQy9VUnphWmJhWk12bER0MVpla2xLa0MwRTczUnFxcWd5?=
 =?utf-8?B?SnVieWswdjFOcWU1TWcxR3Rhc2l4RWNVZ05tNndtVEw2ejdPUWhuY202VE56?=
 =?utf-8?B?d25NT1VVaU1tQ3BJV0RsbEt5Mml2djhzOVZTYlBuRk5pS1pwZWpWN2l0WU1T?=
 =?utf-8?Q?Fh5z1On9uhWh0=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F0BC1D7E5DFF9C4980BAE3A4E393794F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebb3d17-7395-4f0b-a618-08d8922afadd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 16:47:36.7320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNgMcqtpb89KUzFTphPgw/0sCURMgD/ictlPaGx6qBs+SZGG8SfnWCXWeZJsdJfYz4p5sY+G81T+Fbd4qQvIl046I3MdWAbpFXV2rsfa0TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_114739_457236_3F35A33B 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/25/20 8:52 PM, Michael Walle wrote:
>> Looks like BP3 is needed here.
> 
> https://ww1.microchip.com/downloads/en/DeviceDoc/20005036C.pdf
> 
> agreed. But again cannot test it. Would add it as a seperate patch
> to this series. (or leave it like it is)

Separate patch for the TB/BP3 bits is fine. We should add a fixes tag
for the patch that introduced the bug:
commit 3e0930f109e76 ("mtd: spi-nor: Rework the disabling of block write protection")

cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
