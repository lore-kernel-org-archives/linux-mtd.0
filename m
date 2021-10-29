Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24020C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:51:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96C560F22
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 18:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D96C560F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siC/5q+OSWGcFHDbuh6iIddF80FjSj9Prqk2MJpOF0k=; b=4JVQROcpBWDMCB
	KZyzsstVR6ifUVxGEXn4fnFx/XKO5e0PdHEgfVnKB9C8Z2Rvy05AfHZmtHGnruBkeCIFc8RfoG8bS
	1DUmYSEuHMgROmu6eAlPuXJq7Vx78+drI36xJTMal2b43/8rpYkBSgPJlDvBRvmOywM7fVNnIB9z7
	Tem8ZXKta0RE2TVNA/n7zoTG5MiWfu1Ht/YVfG5RCC2nKv7gnokvxyZsLRZ62flkh2dYl3T7UOXNk
	EaicngE/4Tc55r8gyX4ile01fovxdzlTr7q6BF8ERjEjtqjgvfP4E7au1uv4ycG0gMwzk4MNdPHXo
	jby66uLXL5KAL6LHvMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgWxY-00BrNN-RB; Fri, 29 Oct 2021 18:50:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgViZ-00BaMl-QU; Fri, 29 Oct 2021 17:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528663; x=1667064663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lxZGdvaaIBo1MxoHj2gbPJGM2LzQCECPdmiTqQ1XV1k=;
 b=ED4pBbnVO54dZkoFca2znW5yz1YVRIdgwL85cDcC6vmIpS5LBDGk4Mnh
 sgA/DhY9Z2an9/b5anEFz7Bd1ZvURHAu7qT757Z6YskbOzp2aXQZSq7Yo
 CPWj9ecrBRSA2cV1zdAewZVNOObzzU8TYGvZp14bhcFNkm9zir73qJaH5
 WAGEWY6tHEqVzUn7vJ9nvGnlky3LoG7FTqP0GulCwOKj+piM272PxEx3K
 4SDiNRfwVf54kDkzXcjJKt5crHonOFGBBqwkcp3MhcJfAwzDkUdoIASTk
 O4Pvf0D4FLKpro0KqUi/Ss7WrGOaERW5lTcDgez03FFymKbE8NYeP4DLH g==;
IronPort-SDR: gzKxEdRxRvu4okcrU+gIkjYRRKkJJyw4PrlBgab2iIoVExQsFevMDV4aXRUQuPJ9iSt07tKzWG
 oe1ZIaUwXEoUl1egTH4m1jWKYFOcAa/yGSRpG0VW4LA8ezg74pnBN+1C7+/T2sY955lmlOLVM0
 7LFe44KAEbW1beAx/HodNOsfi0eG/UL61RrPNvi2UMGmdRbTR7ELfKpU7iIJYMQF9bzbhraTf+
 eeQ8AuACdDYWwI2sfX/WDMh2NqcJXzjgre2M8LvCkSMyS6ITnFhiLYUqPXLVaJozd5L5HSxLuE
 ovIy3TsVl22O9X6aaWQ0UNe1
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="142184158"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:31:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:31:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 29 Oct 2021 10:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilGOfKguZluzpUzz0lNGAuQD90aKhqrJ3w52LaDqE680zNhHKCkmabB1nZocrBI+r0DDQLjHdYKT3NAiyl79VkD5Dci2hwsOxlxlaLuuPGSAt64qatusgh0ZsW+iQpEht9Sl99sU+p+F6Xc69xeg+ySBF5X3MNCjZHlVl+mEmQFOyiUAMpx/X7bs2BInfvQe3M9dVQQpUcS1eMQxu9ixjvX21aLzNRMU1i/D+CsoctZ9H9MQUH4/80rEe9sqF027XAXn1VMBw8ElFNEGGrrjqVzFUq2ZklevYNJUa3yo2/xWh/VlF+GjHU2U18B7NW559OWaC65Vh6tgPxZlVC1xEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxZGdvaaIBo1MxoHj2gbPJGM2LzQCECPdmiTqQ1XV1k=;
 b=mGXCLo763DV5d7XpL3RXN/+7O2k0OlZCSrvpfPeG/a1MLbnobv5L1H3/3JdGBwZBx9jk/eMCWUTPADDA4hIiY+eK+18XxuBZAXMeQsfG3LWc4ZtUc5a9qEK5+YAkqxc+USRjqY9ZeMie63dx9E9g146TnwubnIeVQMPPLLxPrwEI6mbCHeu37Zc63zR3LkbCwB+PsQrjg5lRtEIcofLTw2q/0EeJ21+/AQxZPam5oIDuK/lzFVWUp2NIIaHsJK5A8VGYFSTUSWlbNOMxTaiY31wXA640VZnPIsx3UT+4KPVexdAXC8NsVcUjBE4CY7jE9w/dfgFq3Ndl1oYXjRaRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxZGdvaaIBo1MxoHj2gbPJGM2LzQCECPdmiTqQ1XV1k=;
 b=Zka0ZKM0jAli8zz/sVW6IlB4jeWeqhx3dGQd26PkNQ50mBDu7W8E0032nVh17fjLkJZWS3Fz3JK9I3Oa9aCianbKdYHa9WVGZowzH1V1HLLkRryQiGK3O2qm7XDJgx6fjoUmqLGamZTrj+lVhnBXc0JBjCOinj/xK3tMSQotJp0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2830.namprd11.prod.outlook.com (2603:10b6:805:57::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 17:31:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 17:31:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash based
 on SFDP
Thread-Topic: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash
 based on SFDP
Thread-Index: AQHXzOq9F5LGRzZw3UGPWta7Y8R7tw==
Date: Fri, 29 Oct 2021 17:31:00 +0000
Message-ID: <11ac4016-94ad-39ce-e845-0324543065fa@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-21-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-21-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bed98be9-b302-4de2-12e3-08d99b01dffb
x-ms-traffictypediagnostic: SN6PR11MB2830:
x-microsoft-antispam-prvs: <SN6PR11MB2830639ED866269CC58F81A7F0879@SN6PR11MB2830.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IWMc9ZLRuWK4AnPCiwPH5K/MgDWX1EDV+J3My8Auy8MaRBFQXiY6E9tKjDQaJdEiCrr+O1AmOcxipG6BFgeO1mCioOO9ohM+Xd6Ji+366NqzT5axUgMJ6bcK2Ihg8OwoW44XSz176hdv3na5WheNv423MdbmULz2fUOsJ4c8NlqehRely+UsZbwQxmI8LpS2lix69UHKk66nAA9fXCvAJk48hGbJPqBLv7KZq9k/gYnVUYk76NrX9tH0NqP5+erCxv4tfx0t9hK6iBKEMqNBb7UhrX1BIJu9pBtcr2rzKvAd6vs9cICA6Pv6FFncq8YOjtvzozjSdngLY/2Xym+KKSTGapRrJD/sIdESdnXRosBlyXMmakF2k7ZLQpzahbEclKuJ4mYrVlhydpko+O0C7prGRJZmHw/JUvWAzWhvyy3tnuCTnKUqCsPa5CSLMpFMTnTXI4dqQhkNRuRB3j25T/gI16rzrb/3ySeTNAPbJkjIbp4f2bS8RccbCX8MrDQuYIyt9KKSoidSu54g3lvA465ngzAHt3QgxmALpIyaj6gizmmY75keqKrtFghBaspKE46PrtHHPNos8ePNqcQ8/MAwE25y/vWtJCZEDPVR0Ug9eHzUfMOEsl3C5GqEmOw0GudVkPzrcPnUmzTKL3gkJ7iQM/fl3aryPb+AzbHkq1bybCqediWduhGLkhOYX+S7ZM+YEx0ElcHm87CYmpSBe7QAULG07ZBSbkXBvkmUtCB1F9BoMieRSvP/ix3dXwskCftvHmfmQfA564ObY9gkIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(26005)(8936002)(38100700002)(110136005)(122000001)(186003)(107886003)(2616005)(31696002)(83380400001)(6506007)(2906002)(8676002)(86362001)(508600001)(6486002)(6512007)(36756003)(66556008)(71200400001)(4326008)(5660300002)(7416002)(316002)(31686004)(66476007)(66946007)(76116006)(64756008)(66446008)(54906003)(91956017)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlkxZnVxa05tYTZBT0pWZGg2NG5lSkdNcmYxby9DOTdsTG5STlJaR3FteDVJ?=
 =?utf-8?B?bXhDaWdDSk93WWJKdldkcEE3UW9iNWxSUGg5RmFZU2h3ZUIveDltUzJRb0Nv?=
 =?utf-8?B?NXpPb1FEeGQxaEZWRXl0R1I0YkNwdUVqa0ZRSS85am9vN1I0eDBtWjF6bzgv?=
 =?utf-8?B?K2I0TDg3VG9MSHdmSURnbjFWLzJiZytrOEVTdE5acFd5aUhsM2JCVVpNbHEw?=
 =?utf-8?B?M3haRGpZelpVWTB0Vk5ocmJHMGxYOGczWEdxYVNLODFlN1FOWi92eVNJb2tE?=
 =?utf-8?B?bWg5ZXRDNHNFTGNsTFRWbHlhZ0UwNHhmb0x1dzRPVDE2K1MyajBzVFBCK05K?=
 =?utf-8?B?Rml6Njg2NktKVmNJMDNLUlpMM0M2blFPaVoxU09USTFyM1FrVm1LOG9FdWhZ?=
 =?utf-8?B?aXhCM1ZzL0FJQjY2ajE5UUtxVVIyV2hUbnNHRENDaGpuL2FiSHVzKzR1R2hT?=
 =?utf-8?B?QmVyV2liMGF6RTNGbVlPRDZLSUFiaDRxTTUvU0MrZEc0ajZ2dHBwN1g0ZENm?=
 =?utf-8?B?bG5IQWhtank2cklEdFRBTzZOclJURG00Q3JMQnQ5Um04OUZRandqVWgva0d1?=
 =?utf-8?B?U1lwYkZGVzBpbHZoS0lNUUdTYzMrKzBpbHNlMmhiM0c2ay9IV08xeWUvWlMv?=
 =?utf-8?B?RWFkbjlMMWJNWlQyNFZLTGFkT0k4bXVNK0tYWFFxY2VIdVpaRGx3blhWajhz?=
 =?utf-8?B?alc4dzZYclRQbUZJdjdSN2VtdzlhS25lS2VyWURYUkFYWldlQ09wOGIraGo1?=
 =?utf-8?B?TDFQcCtLTW0wWDVrVzhQUWRJZy9qNmtySG9HTzJBd0tsQ0FKRi8yamxrcity?=
 =?utf-8?B?b0dtcGFxd2p1UFV0QmFSUzV5Z3o0VnpNUjRNQWtJTTFXZENab1pQbE5zNHNp?=
 =?utf-8?B?bWJ1TTE3ZkxSdGQ3TnlnblRaMDgyWlQ4Q1FvWEpLbGsrS3FzcVEwNWpHMXV4?=
 =?utf-8?B?QWFlODZpejZHVnBqY2J5UitVc25xYXRNNDgySUo0VXJ6ZFIwbVBNODhsdHRL?=
 =?utf-8?B?Y2RnQkJSdklBeWVKZnJXV2NCYmpuYlczU080REVvS2NmNzd6aEdacmhJaVRi?=
 =?utf-8?B?cStraXp3VUVVYm1jTFJDbnJCcVBCVEpuaEZjNVpXNjdLRG1RbVk2YjlhelZw?=
 =?utf-8?B?SHJXK1VMY0hNejdpaSt2WkVzbFkwd2I1TGowTWJrdEJXMnhyWFp3UjByck9U?=
 =?utf-8?B?NHI1MlQ0S0NFelhyN2k2blFtMDZIZGpGREhXL0ViVStkdmpCOGtOQkVscGY2?=
 =?utf-8?B?U205dk5hbDFDbDBVd2J5ZHhmWExrVXBBZUNGdGhWMVFjZGV5dGJiL1NpUnhn?=
 =?utf-8?B?WU02R0FKcnBxc25SbWdwUUFEbmtsZVNZdjFDb0M0NmJUSWY4SS9mUWtlcEw4?=
 =?utf-8?B?ZGd3MllqODZVekpqaUV4MERVVC9pMUQ5WmlncG5NeEpmMHcrTk9VNzJOU0dD?=
 =?utf-8?B?TkVsZzkyR1JNZGplbHZNUTVzMEhDUVpVMDVXTUk1WVBTTUVxZk5lRERJOXN3?=
 =?utf-8?B?bnRTNUV0dFZKcnR2dldFK2xRK1l3SEFkMHhSYkR3MjBubjVBbit4aTl0Mm1F?=
 =?utf-8?B?ZnVPN21WVkltQW5BUEJ1K3N3TmwyU0hrK1ltOE0zeitld2t1V2FWaU5WL3RY?=
 =?utf-8?B?Z0kvY2o5OUhNZDRXRFNpVTN6eW4rb2RMajFncFV1TW5zVWJPU3lLVWxNVlM4?=
 =?utf-8?B?N1pQYTNuMWt3ZnByeWg3WDlWalYrV1RvYWViYkJwZWhZYzh2d0hmdkdYaHNa?=
 =?utf-8?B?dURURVEreVpNeENRY0VkNDQzZWdRaTU3cHF0NENVR1JiVE1aZk5IS0VJbVY4?=
 =?utf-8?B?NEtZQ29VUVRDZWZYNWZDd3dGQ2VNOFpvTjVjcWwrNHRXUDdWK0Jha1R4U0dY?=
 =?utf-8?B?ZklTeTc0ZUVHZXE4N1FyWkREL1BpalV1cmxiTVlXREd1N0d5Y3o3Y0lOVzFV?=
 =?utf-8?B?LzFZVVljM1B0NlNOaUE0TldNRTRQdVNwWFZEWUhYenl2ZnVaZzNlRUwrR3gr?=
 =?utf-8?B?OCt1VnQ5bEt2aHZ6R0lQY3Q3b1d3NkhmU2d5YXkyQ2NuNXB2SmZBRjRJc1VV?=
 =?utf-8?B?R0Fub2l1bldjWWp0UTVyQUpEYnRPdFQyVnNqSXZQb0o3ZDVydGpCUmo4RDdi?=
 =?utf-8?B?bndIOTB4N2V2ajlMNW1ZWW1KdHZkbnpqN2V0NVhRT3oxYk5TZ0hKZlFWQVdu?=
 =?utf-8?B?ZlVMVGlTMnFza1JqZ1VWbjFLc3QybFQ3bHpXSXg2MXQ1WGsxdlBBK2s5dS96?=
 =?utf-8?B?SUdCaDJaR3ExeURTeXpoYkJGdzN3PT0=?=
Content-ID: <FF93E20D3A9F114CA855101C1A59D0E6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed98be9-b302-4de2-12e3-08d99b01dffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:31:00.3566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0a8CnTG5DYMJnPw3LVoaB9ZrCsTqW4gyw4bEvsZZJ68T9IbxEVjtg5VcRrp84QccOlyHplk1z9zhd9PiNkb3/VfeHVp2QswSi3H5iag+vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103103_966028_D2BC9816 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Get rid of the static initialization of the flash parameters and
> init them when parsing SFDP.
> Generated a 256 Kbyte random data and did an erase, write, read back
> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
> for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
bf2643
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
sst
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
sst26vf064b
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > sst26vf064b-sfdp
root@sama5d2-xplained:~# hexdump sst26vf064b-sfdp 
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 0081 0601 0100 ff00 00bf 1801 0200 0100
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20fd fff1 ffff 03ff eb44 6b08 3b08 bb80
0000040 fffe ffff ffff ff00 ffff 0b44 200c d80d
0000050 d80f d810 9120 2448 6f80 811d 0fed 3877
0000060 b030 b030 fff7 ffff c229 ff5c 30f0 80c0
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000100 00ff ff04 7ff3 0000 7ff5 0000 fff9 007d
0000110 7ff5 0000 7ff3 0000 ffff ffff ffff ffff
0000120 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000200 26bf ff43 5fb9 fffd f230 f360 ff32 120a
0000210 4623 0fff 3219 190f ff19 ffff ffff ffff
0000220 6600 3899 05ff 3501 0406 3202 30b0 4272
0000230 e88d 8898 85a5 9fc0 5aaf ffff ec06 0c06
0000240 0300 0b08 ffff ffff 07ff ffff 0202 06ff
0000250 0003 fdfd 0704 fc00 0003 fefe 0202 0e07
0000260

>  drivers/mtd/spi-nor/sst.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
