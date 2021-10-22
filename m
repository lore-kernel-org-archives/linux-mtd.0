Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F11C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15DC6101C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B15DC6101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R54wy8rC/jtKLRj9IW+fAj9spS9y14bNN9K8i9/C+dY=; b=lSizVGkCueccch
	WANC+6RWT6Bt4LwsX4lIhLiNs8yy5mudf02EgeenR0B1Gv3mNR/df9hj2qfKivVsBAVRUhnnYFDUx
	PMHM8Qj6PHeP8a/vHrB8HS6X0q4qOFnwm0qPH8X6CfkBUSObU2yfbC9hkyVzoYSQI0Wf20rXL7IXA
	8ePOsv4eraTdKMs172YMOIcvJQMOUF49QujIRymkG3PyEraKFd9BIxLmAJXq8Np+D12AISgg9rBVv
	2yzZ3oVgqMY11+iU8Mf4QiQS3rx47fBaPSy7IVuCmGEMvGTeALLC8PkVjH20w9udbrX8lZ9ueHrbo
	PEUKc9qvvR+Um9IIP9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdu5F-00Ayuk-OQ; Fri, 22 Oct 2021 12:55:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdu0x-00AxeR-RQ; Fri, 22 Oct 2021 12:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634907076; x=1666443076;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+1njioxl0eSh/GMwpGAIys90EGrJAjYwyjktyc7fOjU=;
 b=CPmcKFE5e/Ga7tlNbrPmqvrEMHfZUfScaEc92PhNBGMLj0llU5fojqDn
 tPlI6FUxU+Mxvc/xOUwUE4Y+ylOrGujw/7nouvEWHbCp4xuXWCz+cqCS+
 /ZJt5QDjA1rPIteLx3SXVjrrnCsoT1RBA2J0q8Tn0h3NUrIK8Hr6uzAY6
 S+plHJFbVZ/FewJv0Iald6viRcXx/W7VFFMcdi8Fzof2FkqfyqiHOCNiS
 lUEcQG1lCaXKEsp6sVUMzUye3/dBhoyinqeYRBZUJ25tGMj055J9j4Olb
 iUxntqQj16xYcjfVV+HXVhrFKOPIP3tPm8HHyvH54Br+t34K/Nna8hsLz Q==;
IronPort-SDR: K8shPqW3SwWKDSuNTFzWVimYH6Uvexoo6AOk9hrW0DTqE8U3fKuskUGnvm3WmQC3lhu7zfOTfP
 HAEj3Tu03D0NtyoCj5ZPs+HJju/25xXrZvlpEC5HF7oLGnQwkEd1LSNJeZaTwWdbC2CcefCU6c
 6SwpstjXylsvExdsfI2Rd15eLp8u2LHUmVNXJQrlS6Kqa3Sr0fpKF0AHuf8zYkuxMqbmu8FgtM
 RCFRqRwg7oTKb02vGQBt2P4PZ96zaH4+EylkuSkUYA6gvppjyAV28jfqgxvws4Mp5/PkttEQVW
 8JxLVdG5OU8iQHthcWJbERwJ
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="140745829"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 05:51:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 05:51:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 05:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6+d0P6lksJ3BpUd1pkLyatc31ApoIsnr05WWiZs3W8bjlkFqVKYgmELMGmRHrgJOA+ZdTFF2VnyHMXCSxdnEEqtpSxCLW+Di1mmzMs+ryMjUMpx5zGmByPPemtWlDWai0b/CIGPxQncCAcdHDGwi6AzJqwsfqTeCkVBqIRy/oshl46YNn/atfJEqOIzawEyy0aSdssBTgJxFO9It+8nBlyBRCyxsFM4nfTq4wsO6u4Lia3isKRiVLWfw3VaTRz6uwJzak8TDv7uxlfE7OdTqM6meBQc/HvBK7I63fbipfAkMNDpIBAVGuhFKbXFsQWbpXd1miRXN1xOfZXw3VpUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1njioxl0eSh/GMwpGAIys90EGrJAjYwyjktyc7fOjU=;
 b=Vg3GhDNlrJQ+V+O86n74RQL4gwhnOoyMbCJivUqMPVTSaaAq0hkKBjyeD+LCY9cIao4xG+/YSpmMDC98TDE4Nv2OzCBRtplehha+w9r8++L1ChclikPdVLq45wBNEzdpLnd274RvQ6h9iGio3tM5Yp3eb76O78E80/Dv3axEFv/IiCgfO+v5pNHGAYuDE8hr90UkWKFQIBpsM/46CdhHjsCljbG6y+ka7eDzgCa6aaev2yjtYEt/9Jsvk76Poory7mG/YeM9+udAB4my/zMeCW8TUHF7Qd+v1NONIDy2DaPEDCCchSITkhJHMgWZJaiEyHiAoi5uVm3b5Mrh0LsxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1njioxl0eSh/GMwpGAIys90EGrJAjYwyjktyc7fOjU=;
 b=E3RPtkT/hCjbnwD6FTZzcn2BiYSQnz4j0fe3p5V/D2uUxmavoXKqFWGaW+zv0T5DIHO7d51kNmw9QiLSupe/Y14BJH7d8h6FSuTIHr3PH9iQGqMgZGvD+/11PvVDKzn8UL3QXDoHreccEfwwAPlxOY9GldvhuFZwjBWfgq0DG74=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2831.namprd11.prod.outlook.com (2603:10b6:805:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 12:51:04 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 12:51:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme for
 setting mtd_info fields
Thread-Topic: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme
 for setting mtd_info fields
Thread-Index: AQHXx0N5rlK8gQtwg0iBL129ZDcJxg==
Date: Fri, 22 Oct 2021 12:51:04 +0000
Message-ID: <7d264652-abcb-b317-7745-36995deff003@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-23-tudor.ambarus@microchip.com>
 <4c0ac0a3efa3075e77260185767c8554@walle.cc>
In-Reply-To: <4c0ac0a3efa3075e77260185767c8554@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf12b8f3-0b05-4d3e-3430-08d9955a9c2d
x-ms-traffictypediagnostic: SN6PR11MB2831:
x-microsoft-antispam-prvs: <SN6PR11MB283112A690F24E683506653FF0809@SN6PR11MB2831.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xmPSjPff9yCVI5eOsfidOZ7z+7o3XK+9ZZNtKTdnzTPnldyz9NoLiuk2S+KOgQ3QccSnTggTT2MZJuzWl2oxkamjLVlD4qKyHg3lBBDuvkEma4KfWj1LZti/F1KwgEnss+zbUOFWGa5skPP/04fb91P3OhWK0fbCNVnGNRHhvcfKLaLXanDoMeHpk2PqLjprNqt//5o1x/u6SbQQHAT7nlgmt+gOItYMVxre+QgSsbZJRvIlNtvypuLQVdHPzc8uqSpE2ng1IVYQSFqqASd9wmXHsx2leUkxlaQcjuZ/i1lnUdE7wwZVHGBRhW7k6DbRdk4tt2cc2EbwALqFbNCtfYNXIzT93CrwPotI3pA380OJX8pzoMJ7FouXFaeWTFRdeKdl+8yqiakf/JbzS1PbCVlwzGecCO5YTnUurkDoCBZe/ZlCFc7m9OHedUCtCx7t7ZsdUqc5Td/yfOQDLw1d/RYYolyBetrNfvnYlLdhRFiayJ4/rZI3Q1bjRi0jy5VTwqc4KkibXMNJhAi121/aWN4xGJGIOC4WMr4PIUaU+hGO3/MrOySiDPTMBgc1UIYYwkrhAQkfM2tpKHQbYXbRKEcBk+3lIVQWLgvRKXpX8fgdpf3X+jURZUPM7mqxsk5yuXTGVoC+yuWDTsjtqV2Y4ftqnFQ/A137bAIK1nWfI2XVg8ipy4ozUpRJBvtfqV15n/PvontrHTO4TLxP6zG5IjK8d0kFJxFlt+7n5/qKKqk6ozZH6S7q15i5JXi6G5H/ehxZg49tHoE/GBQ2/UO0Nw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(186003)(6512007)(38100700002)(4744005)(86362001)(53546011)(122000001)(8676002)(31686004)(66946007)(2906002)(26005)(38070700005)(66476007)(107886003)(91956017)(6916009)(508600001)(31696002)(6486002)(66556008)(5660300002)(7416002)(4326008)(6506007)(8936002)(64756008)(76116006)(71200400001)(66446008)(36756003)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjNsc0VqL2JEQnhpR284SDhsZnVIUjlGelRLZ3JwNkpKWUZOWmJ0N2hwTFIy?=
 =?utf-8?B?NFlHWVkzUStlbFNvY1h0cXZsQWNMSVI2ZWY3enhqQ3FEeDJNRmpFYWdkZVc3?=
 =?utf-8?B?R1F5TTdkMUdHR2dNcm9FYzZ0WjhlRCtFdlFNY1AzVkpVMmIra2VPZWljeXpG?=
 =?utf-8?B?dzFiRU5tSFYwNXRzS2tMOU02ZjRTRnMzbVp1S05wOG12dTA5dzlEQnZtMGlt?=
 =?utf-8?B?U04ybjNlVmV0SlQzMTlwL0wrRUxtcVU2T2NQMnlPelNkbUpXTjVyd3lYTmdH?=
 =?utf-8?B?ckROQVJUZXB3TzU1TzJjZ0tOV0dVbkhhcjh0aWdacUJobEtwMkQwUUxwMVkr?=
 =?utf-8?B?b2NCRXVsazN2cy9xUGVDWkNtNElhQ3ROdDU0M2p3NTIyY050bm1BemoxK09y?=
 =?utf-8?B?YnlyTklEblQ4OHhPUmNYOUdFTXhMZHFhdGxyRGs3end2RXNjU1NNa0NOeE0v?=
 =?utf-8?B?clluUXVaV29jSDcwNEkvZkR0MWllWSsyQ2VFb1lCME5MRWFQejNNNWR5elIr?=
 =?utf-8?B?NDhIV29qSWlKaXBrZEIxNmVSb3piVE5aQ05vNVBMdWtXdlJqZjN4QWxwM2FJ?=
 =?utf-8?B?TjcxZ3UxeUVoVmg0MFpWekMzdWxsOXhsamluYjMrSVFlTmRjODdQSGcrK3I5?=
 =?utf-8?B?Umk2dTRTcmJpS3dudGZBYWFOdGhuWkhVWjV0Y1ZwS2dHMmYvWEt6R1YvSjhh?=
 =?utf-8?B?WUNzeW5qSU9wRlBJT3hCMUZZOUhRcjZwZnZZeGgrNjZjelZOTmtPZVk0TnND?=
 =?utf-8?B?V0pHWFlnMzhTeVIzeVZsUTFXdGwzWDlaSWZEVTVqMjh5VVlIRG1HcDFKZkoy?=
 =?utf-8?B?ZEhwcWcxTHNuSkxVUzQyVUh3Qk5IRHZLNHBGTjBibXpWbGwybWNpaURSelJR?=
 =?utf-8?B?THhpSDZodVJ6anhiTHRlWEZQWUJoYzk4dUNTUVJHdiszdUtqYzlVSkUwekl5?=
 =?utf-8?B?cUt6VnFGNEU2NTQ2SkdibERBYVY4bVB5ZFExZVVENlNpaWNYckp3eEViTG5j?=
 =?utf-8?B?ZnIwODZGcnQwVjZjS1pjd1J6VjByUHBCU0ZpbENVa1VjZVBleWgwQ3FZZzdh?=
 =?utf-8?B?UnNHUHV5a1hJVDV6bVVZTCt3SmxuU3k1cXZIaGVNNnpocy9NQzhlV1N5VUZN?=
 =?utf-8?B?akZVN0dseFo1bEt2TFNiSEdaQVNvanlnYlRXTUx6L0NHcEsrcjVwaXBXWHlo?=
 =?utf-8?B?NERPeWFPaVQ1T21aeDBjOWNsbnJHK1Boa1BIWm5EV09KV1dmUGlReGsvYzBL?=
 =?utf-8?B?cVhCZXVvT3lMWW01RjZCcXpJNjd5d0E5YzJ6dEp6anZ3UjhLcFpEdDJXT1lx?=
 =?utf-8?B?Y1Q1NlErSkRHWFozSGpXOTM0WHIydEhDMHBnU1dlQ1VpQWhsZ3hDSmdCSi8z?=
 =?utf-8?B?aWhWTmF2bklPczFjQjNzaml3MklJV0ZDSkowMkwvamEwd2EvMlZZdEFVbHJy?=
 =?utf-8?B?QVl4UG52WTcyK1pEWXo1S1g3bHFGKzNONnFYQ1QzbHIvbG8rbytWamJUSVBK?=
 =?utf-8?B?MmZaS0N4UXBpTWhPcEs0bm9NbHF1WUdtS3BNdUNiWkFlZUF0TVNuRmlZdG9a?=
 =?utf-8?B?Ni80Rnk0R2dsTDBtWktkQUZ3K3ZOSGE3OTFBWUZjQlBsN2l2cmxNN3pQdGhR?=
 =?utf-8?B?ek4yZ05GWExmc0RaTGNmQ2lYS0UzcmlINFk5K2hQSm8wWG1lT2luaHo2NUJD?=
 =?utf-8?B?emVDTVoxRGd2VTMwUUlqTjZudG8yb0x6ak9OdEQxWkVVcjJQRnNoMTJHMURL?=
 =?utf-8?Q?59rf3vK1BAdpdIBIlo=3D?=
Content-ID: <74D4E8E95DBEE54BB2312D91C5448292@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf12b8f3-0b05-4d3e-3430-08d9955a9c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 12:51:04.8364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_055115_952290_2E81E4BD 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/22/21 2:57 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-07-27 06:52, schrieb Tudor Ambarus:
>> The functions names are self explanatory, get rid of the comment
>> for the OTP function.
> 
> Mhh. I see, this partly addresses my comments to the previous patch.
> Maybe it would have been better to have this squashed into one
> commit :p

one thing per patch

> 
> But my main concern remains: what if we need more that just
> the mtd callbacks assigments. Basically we loose the otp_init()
> call.

        if (WARN_ON(!is_power_of_2(spi_nor_otp_region_len(nor))))               
                return;

is there just to avoid setting the mtd function pointers when OTP
region length is not power of 2. This is not an init, just a check,
so for the moment I see it ok to have it in spi_nor_set_mtd_otp_ops().

If some OTP init is required we'll introduce it.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
