Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10C0C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:41:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029CA60FD8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 09:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029CA60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvdFspuz4vEytKqlZdkCsw7+8G9u7kfm0OFX8ho3llc=; b=K+MLcUPiU50d1DZRRE6ruedXy
	UrcCTz+cJ9M9rb3H/0FslgiuZq/b2kS08bH025uukXobCRcKtvdedrx+VEBpEbqGNSIewqMVl14tM
	qbnUteY0F/VdU9VH1hAfZ56qi7nUkHb43+Q463mTuA3honUQA5KKle898G1mapfmFW59kK27/1dIH
	/COYm+EJM+g2n4f2Mwi348WwD3Nvtf4mA5l+bxeprVB2Mw7l/FF/vmZI1axurM2KRlUt3EiYrXlxC
	SBSxgzsC6uJg18f2hmGSiaNZ1DHNQbydL8XFIqGhkY8nikAArI7E6EN71ZS50k53bfLc7qXOCr6S/
	msC15HGBw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyUL-00FZvu-Aw; Thu, 15 Apr 2021 09:40:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTu-00FZj6-GL
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 09:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Description;
 bh=sPwn4HEq1WK7iMEpwZ+/SimoL7kOkgjD5Sdwr9CFE/Q=; b=meOHEma8sjNUIFZn2ZDCZks0e+
 Mm0f+zyI9k+ef19PpaJQgTjkOsLyAYq9BoRquQUKVFAfXY31f0qsU6TlX43P67M37m9vUG1xKR3Lg
 q20FAmE/NPRSwOHF8XN4PDMKHYNiaCTj8G1tsX8vTMVPowRQq58L2wQgas764Afcv6M3oXcJ+N6Du
 uYLSo/57Gtq1Wz/YA0Db9CK2illiVqpzYVzgR4PRTwaTj/J2fTXrviBpcjdPYdN1LwQeYaib1nP6H
 sCW4wzdPL0pXgFs7vUNWYNbcENEdJQwdLA0zPAVEt2dn8OQgnwrRvoDemsozBIJ/xfPVylna/PCXz
 TSTUZt6Q==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTp-008R2Z-Cz
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 09:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618479609; x=1650015609;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sPwn4HEq1WK7iMEpwZ+/SimoL7kOkgjD5Sdwr9CFE/Q=;
 b=Zt/HNRPuy6qYkly85d5qoldzLlW9JRnTkVrsyTQ9eZu6zwHZeXunzp2/
 pUrCOz6d9es+kkTDP6YiFJPNcUHK5uDEWH63HvyzzQ3khIWb5AwELOsUI
 pMgggwSacSTasS4Ot37lYB6lU9Dln981C4idlGj4yywc+KYLzzP8LH82l
 9jHZCf3jgJU6IzNlljkRSIFgnKMFu5cs59VAJBpcPtvfetzYjJ1U8C2DG
 IUjjQCw7pY2KyBKNLoKnyKd2NJfLwsyEflobfe3A/ub3duGIIHJ4r8cP7
 RwvxB6mr3RYqPlDdFXLGR0EeTJESco+D1KycrNiJBheyPR8uSxPp1AVz3 A==;
IronPort-SDR: GiDxG3062ie45LzOymCEBDrtznCk1tC6SqkQxcdKce1Nbm33wErpb062kBjurah+IErKdANzH5
 bsuoJIOYIheehqTxK4pXNqeh/Lh8gOE526+YIQ1QUkhIsLa4ADOlwL1TY63XcqBLG4pUQjscM+
 2mFQyAM4E3rpv7qlizXFaYb3r/ZY5M558KFz2mZxfWnHpvUd1C7IzVXz+XFu71s3l6Nnsko3Wn
 Cl4NUHqPslBieCpRVmtW1/aIRtruvCcEm5YdGoOYeQQnzXr/CRV5rhPAkSVuPjTXkepbO/wlxv
 Hrc=
X-IronPort-AV: E=Sophos;i="5.82,223,1613458800"; d="scan'208";a="113679139"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2021 02:40:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 02:40:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 15 Apr 2021 02:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2AYyrSiVVwXt2nsbCQc1c/6uTT9Gb1j36BN9cwaVOZpZF0DZvP3WnUNiI1yxGzRWiLoSqkPTFL1mA1ZcoMQeVx37UQcbEYY7OCh5M1LD6slSK67IfSwr7wajpRRrRdkXFQSBHkZQVWhdx9vLxUCXWaI5neGpvX2dbbg6qhF6aIr7sLNiaBG4TPVqwrKBeurQPJK4RIJnZHF6veScido5TCAKCgvL/Iu0UYqjeTMmGu1k+nBnulumvATFLD5z+lzT0sJ11hyKy/hHMZ6Ff29Ln/Oxhmj6LL0mEHHeIytSkxg9oJHUp1RQP+lNwNO2XkDe9/H1OwYdc6qVSQF0Ajsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPwn4HEq1WK7iMEpwZ+/SimoL7kOkgjD5Sdwr9CFE/Q=;
 b=IDzSXEwkQFOy7vKSEr/BO/8Nq6MRPdpBxm9n+P4JoKFonmtaBrXFt+EmPODVr/6r/wPWD9MMI5Att3DmdwbuHt2Ullr36uewbapNAxbO33XGRSjlfwO81NgY4N9dlG4isr9z+1Q/rtQXIRGZg3ZcEXzOp+/O3Y1FRbbIpXxxHqc57NSdZQTfBKyG1dSWd6uXXtIxwzeBNa9j4RjNvDykJMPGdvdMCdW+Qz++yt41pww9DU7IEL9R9nIUiObUCwEWYeSxFJYG/G5W6A2YfkwmC6Iv8aLn+B+WM/ueXSZ/7XGIfOvH+A2SQYu1NsGH8sJj4fa3Et/9jcp8GkmSytzmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPwn4HEq1WK7iMEpwZ+/SimoL7kOkgjD5Sdwr9CFE/Q=;
 b=fpKlCw6DV5cqQ4yRi3+Nf9aw2Grdlbful/94C8wDyoDjdCLrG3u8/aW/rd8H5s6mTZzn+ZtTsglMiRyfWqBplrG+T25fuezpxGL0fkCuTqHAd6Kl/EaifsktPizalDCaDkiPi5yuG45UYC3j2s4G0zHbCznjlr26MlRicsJNHsw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3488.namprd11.prod.outlook.com (2603:10b6:805:b8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 09:40:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 09:40:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sr@denx.de>, <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>
Subject: Re: MT25Q Advanced Sector Protection support
Thread-Topic: MT25Q Advanced Sector Protection support
Thread-Index: AQHXMdtPCUvJuRIbpk+8HakBSSVVoQ==
Date: Thu, 15 Apr 2021 09:40:05 +0000
Message-ID: <72427f10-4a3a-a0a4-f429-6638f9d428d0@microchip.com>
References: <f59dc821-22fe-27cf-b93d-147709d64983@denx.de>
In-Reply-To: <f59dc821-22fe-27cf-b93d-147709d64983@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7f7e141-7b05-4e25-44d5-08d8fff27320
x-ms-traffictypediagnostic: SN6PR11MB3488:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3488B3A081F74D23CC48DF9AF04D9@SN6PR11MB3488.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXLzyE9Y4YPBT90Kjk7leo+qWcEeOy5SADI8BHwnElSytqRu3FWAkYFFHtwFmh3ntIH7Gkuyz/QLUBhHIMEjbeEvIuLg2ampoq1g5liGGeoYvAw8quKxTD1aiahtRb65IH2KvLufh+8JrhNXcj3BptDhJvKF8Q5jGgLU+EvuyjVGv9Wxo95O5zwTDEqGK4u5jHFIzFKg9vmkoVl1mK3Ij/2/jsQZKPF5anEPLlML2Ldj+179M7aEInbBGJC0BiTmw7O8sDeW3m99oJ/WH5ERh5kXCZ65tu0xu4rxJRB3TTJs052yqzH09yoPfmj22cbIe6CQPEutmi+7B4zxY3sCkRmiep7yPqip5WCmusRGU1sGAlXmFlfGrlV199ALdvrhKwBTgfviA3pMAILH0P6K0+x+mQgo3mOydHLmFasutnP6GTeHKtnD3LF0HT8Q3+sPgv57v/LzS7iG4b4PFUxQ4u6KYvYL/BApTfp0PldXRDN1VrhktgAN/VcoOQTz9GCLSNl/0Ccg9As1otoHZM1WTb03TNiLhWlvUpcBsmcaYv3TPbotTd5ZS+aEHsUYMyvRLQtKcsMiZzFl7puMZO829NBR3qAUirl9NNlDzEzjpzfqrx3InUsEbcKx1XNLf+oICAsqslvxd3WjWCL2jyL/3V6ibRHRDGmjAiwPSsbW1mDy5S4PVf5q1Hsj1c/pv8RO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(39860400002)(396003)(316002)(478600001)(66446008)(186003)(8676002)(6512007)(5660300002)(76116006)(8936002)(86362001)(2616005)(66946007)(64756008)(110136005)(6486002)(91956017)(66556008)(66476007)(71200400001)(38100700002)(53546011)(122000001)(83380400001)(36756003)(6506007)(2906002)(31696002)(31686004)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TnhxMkdBR2ttYXNyWDNJZ09NMUZSUG1OQ0hyZWZnN1ZTY3FMQm05cVhSaVZD?=
 =?utf-8?B?Z3c1VXE4c2dxbEc2UWxTNXpVeEtHZnRsWG9iQlAxMmJ3WnpxKzQyT01xMXQ3?=
 =?utf-8?B?TksrR0xXZ25ndkNBODlHY1NjNlhPOWYyaGFRd3BkVFBFcDZHaVNvRGxxQ3Qw?=
 =?utf-8?B?eXFYMWhhb2ZUOVFORWRQWEtLd3QyUVh6YUk2ZVNPVmE2NkxWaUdtNk1JQStZ?=
 =?utf-8?B?MTFFUmtwYTlEWUszOER0R003MGU4R0JZRU1BRGRQRU5qV2JheUZjeDJ4N1RI?=
 =?utf-8?B?L2h5amFJZy83WDI2blFockJkUkFIcHlXSGFnK2Vjc2dyRExUTlVsU1d1alpn?=
 =?utf-8?B?N2o4cE0vUTZxM0tUYWprVm9FenlMMUx6WUVTQjgvb2JaRVFIL1V6VEdLaFRP?=
 =?utf-8?B?Vm50anRZdDhEZ2hDN1J2R2Q2SlJTbC9Ycy9SaDUyYzBpUE5WcVJXSk1TeHZQ?=
 =?utf-8?B?RlkvV3JKNXFDb0gyV0J6RWQ4Y21CZHNDamdUNmI1TlMzc25WdGpoZTRyMmtq?=
 =?utf-8?B?VlpPdGFSNmhDZjYzaWE2WXZTN3RkWVJORmFyMWRHYnBUZXdIUkljN1Y5M3ZR?=
 =?utf-8?B?TlZhQUJaRkxnVnFtY3g2WEY2WWZ6Z0doQjNkUmRXdk9wVVBVOWxaRDd3eHVy?=
 =?utf-8?B?RWs5WFRPdjJoN0YyTTFyclNvb0lCQUR4WEg5RjVxaHd6RjBwRHl4K2xYdzlM?=
 =?utf-8?B?YU4xTTgwcVNCZ242WEkvV1dQZDBpK3RqSG9Hc1M0V1diWU85TmpVYTlnRmx3?=
 =?utf-8?B?ZW1vRXhUcFk0eE5zK1J4UEJERDN5QmZ6cW9KVmpsSmxXZ2huNjArVmFrbG8r?=
 =?utf-8?B?QzZHbE81REh0aDZzNGJ6WlhEVUxpSGNUWU5VOUo5OGxtMkpDMXIycHJCMmxZ?=
 =?utf-8?B?eTFMdSt5OVRBUnJQOTdMUGp6RTlHT2QzNW56Nm5UUjcxdWh0b3lJcndyYnp0?=
 =?utf-8?B?WS9rVzl2cFpRMXhXYVRIdHpKbHBhVEMyajR5TUdBOUtDYmt3TjdEQ3RIWUV1?=
 =?utf-8?B?czd3QktSUnVkVEdVcnFobk9UVXVBdzdwdG1ZeGk0bjcyd2xYQ3U4Q3ZOVWRU?=
 =?utf-8?B?WTI1SGpJQ0VoYUEzOGxBRnZ5N1IwelVCRGRua1hTQ2Rnb3gzVzhCTE9WRXI2?=
 =?utf-8?B?ZGYvZVZxRTNOTHpQUW10b2JWRzB2bXM0Q2dsUks0emdVMUNnbW5NWDlNR1dj?=
 =?utf-8?B?R04zVDhWcWdUMGVzbFV0STJTbXFzZUR0cHNvV0ZGQzM0bkwzRVdKRjgvQWZn?=
 =?utf-8?B?RUovMHAxNURZMVFOVlhnL0x1VGZWT3EwSm41MkVhc2l1aFY0TzF3UkNFWjJ6?=
 =?utf-8?B?ZS8xUzZoaFNTRXpmM2N6eXJLM2tCVkxIMnJRdjBLdDlIZzlzcWtqa2lvS0Zj?=
 =?utf-8?B?QUFsVGZ2S3JCV3d0QnVtQ2RTeGFzTmZPd2ZZdGxNa1dBczlkOVg5QnpFaWpS?=
 =?utf-8?B?RmJwa1ZZM3NaajR3ZTB4QlYzZEhTSS9xQTRTUHptZmFqQ3dXQzRIZjV3Ni91?=
 =?utf-8?B?MVRkMWg3UWpBQWQySWU2MGZ4bzR6SERmUVN5dTlpUmdoaWJOZ3h4U3YrbVM1?=
 =?utf-8?B?MHVucnhIaVd1QnFDMVBPZlJkYzhrOEhSN2FHZ0Eyb29GTXl0TVlYUGtndWxF?=
 =?utf-8?B?OU5xcmZKWWR4d3VsRXRCRVZJQXBNWTZGSW83SVFuakc2OUNHNlJRN2t1S1Q3?=
 =?utf-8?B?TjBHaDV6OUJ3RkQxYmtFS2ttTXVHa1NaMDFaRWZBbFViNVM5bmZnZGpHWmh1?=
 =?utf-8?Q?e8iZgNsWauRkowoJtA=3D?=
Content-ID: <94C0B5225822A645A2CC32AE084C3CD5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f7e141-7b05-4e25-44d5-08d8fff27320
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 09:40:05.0124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Q92QaMM7t74NI6Jgck9pvLhNnFmQnjPRF0G98qY2k1wUoMVLei3gWjbjrqetwM6bUkwOUC8Wd/YCgim/HiQ1oqVqpKr2Qi2ptAoNHl6JV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3488
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024009_584945_5BB48B4E 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNC8xNS8yMSAxMjoyMCBQTSwgU3RlZmFuIFJvZXNlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpLA0KDQpIaSwNCg0KPiANCj4gSSdtIHJpZ2h0
IG5vdyB3b3JraW5nIG9uIGEgYm9hcmQgZXF1aXBwZWQgd2l0aCBhbiBNVDI1UVUxMjhBQkExRVNF
Lg0KPiBBbmQgYWZ0ZXIgZG9pbmcgc29tZSBpbnRlbnNpdmUgUVNQSSBOT1IgdGVzdHMsIG9uZSBz
ZWN0b3IgKGF0IDB4NDAwMDApDQo+IHNlZW1zIHRvIGJlIHBlcm1hbmVudGx5IGxvY2tlZC4gVGhl
IG5vcm1hbCB1bmxvY2tpbmcgZG9lcyBub3Qgc2VlbSB0bw0KPiBoZWxwOg0KPiANCj4gIyBmbGFz
aF9lcmFzZWFsbCAtdSAvZGV2L210ZDANCg0KaGF2ZSB5b3UgdHJpZWQgdG8gdW5sb2NrIGl0IGJl
Zm9yZSBlcmFzaW5nPyBZb3UgY2FuIHVzZSBmbGFzaF91bmxvY2suDQoNCj4gZmxhc2hfZXJhc2Vh
bGwgaGFzIGJlZW4gcmVwbGFjZWQgYnkgYGZsYXNoX2VyYXNlIDxtdGRkZXY+IDAgMGA7IHBsZWFz
ZQ0KPiB1c2UgaXQNCj4gRXJhc2luZyA2NCBLaWJ5dGUgQCA0MDAwMCAtLSAyMiAlIGNvbXBsZXRl
IGxpYm10ZDogZXJyb3IhOiBNRU1FUkFTRTY0DQo+IGlvY3RsIGZhaWxlZCBmb3IgZXJhc2VibG9j
ayA0IChtdGQwKQ0KPiDCoMKgwqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3Ip
DQo+IGZsYXNoX2VyYXNlOiBlcnJvciE6IC9kZXYvbXRkMDogTVREIEVyYXNlIGZhaWx1cmUNCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm9yIDUgKElucHV0L291dHB1dCBlcnJvcikNCj4g
RXJhc2luZyA2NCBLaWJ5dGUgQCAxMTAwMDAgLS0gMTAwICUgY29tcGxldGUNCj4gDQo+IE15IGJl
c3QgZ3Vlc3MgcmlnaHQgbm93IGlzIHRoYXQgc29tZWhvdyB0aGUgbm9udm9sYXRpbGUgbG9ja2lu
ZyB2aWEgdGhlDQo+IGFkdmFuY2VkIHNlY3RvciBwcm90ZWN0aW9uIGlzIGFjdGl2ZSBhbmQgbG9j
a2luZyB0aGlzIHNlY3Rvci4NCj4gDQo+IERvZXMgYW55b25lIGhhdmUgc29tZSBpZGVhcyBvbiBo
b3cgdG8gY29udGludWUgaGVyZT8gSXMgdGhlcmUgc29tZQ0KDQpJZiBpdCdzIGluZGVlZCBhYm91
dCB0aGUgaW5kaXZpZHVhbCBibG9jayBwcm90ZWN0aW9uLCB5b3UnbGwgaGF2ZSB0bw0KcmVhZCB0
aGUgcmVnaXN0ZXIgdGhhdCBkZXNjcmliZXMgd2hpY2ggcmVnaXN0ZXJzIGFyZSBsb2NrZWQuDQoN
Cj4gb25nb2luZyB3b3JrIHRvIHN1cHBvcnQgdGhlIE1pY3JvbiBhZHZhbmNlZCBzZWN0b3IgcHJv
dGVjdGlvbiBpbiBMaW51eD8NCg0KSSdtIGFkZGluZyBzdXBwb3J0IGZvciBpbmRpdmlkdWFsIGJs
b2NrIHByb3RlY3Rpb24gb24gc3N0MjYgZmxhc2hlcywNCndoaWNoIHNob3VsZCBiZSBzaW1pbGFy
Lg0KDQpDaGVlcnMsDQp0YQ0KDQo+IE9yIGRpZCBJIG1pc3Mgc29tZXRoaW5nIHRyaXZpYWwgcGVy
aGFwcz8NCj4gDQo+IFRoYW5rcywNCj4gU3RlZmFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
