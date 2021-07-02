Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BDDC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:04:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D99061186
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 14:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D99061186
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDZhaJipyg+gdGm3arnBX1SP711N6S9DYrVPDVRbFNc=; b=qa1oK5HJLT22vY
	jFF7BG2/1zsUWm1HfWBy3Bv4GjILgcyPa7h0tJVMvKDgeF5ru/oDeMPFhFn20qmfL1AOJsdnvYdo4
	HYblfHDMDtLr9AblPZ/Pa7369XvsnS5htJHm1QyzLN//ssCLfKpNg1W17VPVLhCU33lqpuX7PGxdY
	WMyK0Cq0kpszBbrQVXvk8FnygA1Ut6he5BVCoSKc9xujmh2pUa0+ydQX1AkNNClNCoHLDTMDvyUMD
	iH3A1Rrz4Nv5ALAoucj9lhFZmlhXO3ZUjU9O17Rn7b6mB/qkT5/gda+rOMRos62Qkc9/xESHl5SP+
	KcXyYzoSLwhHnjt90/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJm1-003EV1-VL; Fri, 02 Jul 2021 14:04:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJlv-003EUV-G0
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 14:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625234639; x=1656770639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8XMgA3OWJ5ZbneDDhrQ9tEKFrg/4pbpuIM1gESzzHVc=;
 b=tiO+UyCbO13j1LaoEBtPZzBhb5HJ3sNIfAszvdkpA5X0A94l1M5uCTPI
 fSWtjVNMSGaogKgsshSYeDGjglaELkUamUurflmp3CQlqx+3t3X5mLxvk
 qqVizCB6n3KG/va94/ZepM0Uy7T3Q9gOl1NnpWjHp38nRjDPkfmPZ9R01
 R3L+vvrN4SrNiUZjtz0aNmC5N+dS+72ZbdqVkXnDsnGdtpwyXbjjINaJ9
 IrRV0HHLubUY5pEewyFwnEEYyi8u9ZIWkme3ckNLsx1yWSQIF3RutCMjG
 6SEpm+SkpNMC3QACk57azrUBF/8ZMVwIsL0AbJR6Sia0qXRQktqvDgfbj A==;
IronPort-SDR: Ajxv7+I4TBcYxqq9WNT5duubmaifcdBVKYC8mULiGv0d6vMSMGvpWH2V4zC0xHOFkHrBBvouzC
 inxs3O6We8BiHOSfCKjHNAn2oaWFnH79ldv4YEggXGtZeiL7SD0VD8294CandI8EH9lxwMArAs
 aNVXyjoH1ErBtYsh4FDA97WBgrwjbTWC80qlpykF502LjPieTaqarVHGojuVUVrhFytB2CeNB3
 4EFbVgegUoIRl1XieHtHHCcRDaEoye9TXdRkzy4ZdR0nWhvm33xzdwD9ZIiEtbuXI5aRY4qtJL
 F8A=
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="127480638"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2021 07:03:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 07:03:58 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 2 Jul 2021 07:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfK7oHAGxAunrGTv49bTyZNLFk6RwmwFnM4AWZbr8bslMDCPqotAzKzA2o2FMJnfio8KBFx1kfvut9g8cYrAWDDyjh3RFn6j1fVhvTgqQyzwXXwkwd2GN1qA1o1rnfUVMWuES0e894436Ku628LSDmhv0XcXE9v3EnupBkJSPBf1ecvUBF+tLS83noQ/HnWGM2Npi6zQOk4dWn7hqXL3A2kwK0JUxkbmPA1fy+hwvcOpRA8MimdG8bBYonw8J1Bxgl3+CAPTceqCjIwtHyVmEAJmVVGnzgycNhi2SEqQxZixHdlKVsXo1uWLkWgNJerHYqEHTBfan5/iNew6HVDztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XMgA3OWJ5ZbneDDhrQ9tEKFrg/4pbpuIM1gESzzHVc=;
 b=FPEPoKHoTIo45xxdKqnUToUslA83eax5xZXdwdSiYCPmLwf+Kg8ZJRCCY8af2ZrjLXPEWAD+c9p5I4af4DZf9WCDfWEkdGpaAgxPVACCix3std5/bMJTH1jVGRkfKo/aAfPjkWNMXy+f5PfpQs0NYysme1+NSC3uiORPOtnhY8vN7SMcWt4R8Ieb1TKWyd9D0aMQRxjNfh6MUuXxA7eqSf+8hnxX0/ethDTg2Jtr9s9eom+b/C4bXCwWb1oG1aM6VvFOu0xW018myCmspDPwZ66hnAzDx7EVhVUyydKRca8smOVvsIQVctsD2B8mk5CxsBIwpOjNGdvACgvw9Je01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XMgA3OWJ5ZbneDDhrQ9tEKFrg/4pbpuIM1gESzzHVc=;
 b=HdCOioktG2ANuhUsj/Ocx8L6C2uofbnz2a1dAbeQUCVxTu4LA0CaSQA+D0EVqOt04bwJPTzfmwGLV2Mn/wLRjZ+b29vPpfj8PjGRDXphPYrcOinv86PP7J7vwQ4tvSpPhKQWDlmxKfznThtoTbkCh/6px1jxnKGUtX++jtxjHjA=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 2 Jul
 2021 14:03:55 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.024; Fri, 2 Jul 2021
 14:03:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Thread-Topic: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
Thread-Index: AQHXa+EuiIQT9G152ESjtz/PC67AC6svvm6A
Date: Fri, 2 Jul 2021 14:03:55 +0000
Message-ID: <a0b94408-947a-a3ba-8685-8249e754eafb@microchip.com>
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
 <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
 <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
 <b650bf50-0a66-e772-5ebb-5336fa818e02@david-bauer.net>
 <88451011-067b-ffd0-fd21-985a08a5aee0@microchip.com>
In-Reply-To: <88451011-067b-ffd0-fd21-985a08a5aee0@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: david-bauer.net; dkim=none (message not signed)
 header.d=none;david-bauer.net; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15d1ff53-a27b-410a-8beb-08d93d623b2a
x-ms-traffictypediagnostic: PH0PR11MB5045:
x-microsoft-antispam-prvs: <PH0PR11MB5045071DCB5E36170705A2F6F01F9@PH0PR11MB5045.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ri7N2HkoCBRKpKKAhMpM9c2PP6TDmUtdpCYLU5RwGMnpb6tkh8uOWPMOdsjhEtObZjWgP7RIqqVHv9bAf8XpI6rHRCl/ZuB/v+SKJ9gqhIAFNrC83ygLd0qHE8WdAsFJ9CI8yvkm/8YfFvCOWtugoS2g+lzgXa6JR2bYTVOvCZoti3Jihw4uxNPP+Bk831VqV3IAdmX7GscdkIuEFvbQ5l08ZNf3K8t0lFINw9ClSGJZlPAW20LqoBtJww9xiMJSNLi8pCGbPD5J38T/FiKG2cs+lpWUFzTcehgML6O0k0shZGM2VFdnV3uVxYLnuRZDwPjW8c0FPqbrJ8lYeAdrMY2lBxS+7UALmf50Y7f5iRsDi9RwWeSu3/WBtHFE1x/mSIBGax3C56nG80Qowe0uRBtkVYphEqgJyPPxPFN55HPed9pSMW3Su5tCQxrAFifSweeKaq4SJSbvNsFgKnyV4Gvdlm4a+qTxhW+zCeVzhUOFNDFCSfVV/oMVuvIpjkEZru60hymtO/BnJCB12vP4/DtVcbMMPZwFW2CKS/ir+l2NAMW+u/Lxq2UeMwWEEi8K7CydlLFeFEYDBSsDOYKxSvbqW/nvjNMuZHp6PJiiGIpBUIBriUNeYgb0WMhwq7o67qxgyam9EABpgujzmpmd88VnfhfB2nMLrGOyP6C2w4upqvJVFOU68b9eanAmIrHGsWh7hntL3H80jV5sonJugcOOY48LwDgVE4HZefLgqm5S1S6JaDlKvRz3RbV7wx/8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(39860400002)(376002)(346002)(136003)(396003)(366004)(4326008)(91956017)(8676002)(26005)(5660300002)(6512007)(66446008)(64756008)(66946007)(8936002)(86362001)(66556008)(31696002)(2906002)(76116006)(66476007)(122000001)(54906003)(38100700002)(36756003)(2616005)(6506007)(53546011)(83380400001)(316002)(110136005)(31686004)(478600001)(6486002)(71200400001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGRsYlJrUWE4RjZCU21QeEcwaHRVa3g4M08wek1HcEhMdXFtSkdiVmRDaUNk?=
 =?utf-8?B?amV2MzZVTi9UNG10WEdtOENXd2ZNZ3ZONUJrdUNOSTVVOGZKRU5SYnhYT1BW?=
 =?utf-8?B?Q3J1aE5TZVVqN3Bjd045c0RmRVpraUhYUDZCVnV6c2Zrb3dtS1hGd2t4MkJQ?=
 =?utf-8?B?clIzeERlMnl2UGYzaWk0YzdXREJ3Yit2cVd6TlBTekdDUC9uZXNKa0hydlE5?=
 =?utf-8?B?am9Ic3NJTWE0ZFRrN2FnL0ZGUENIOE9SSjYxVmd3QUlWbHBFb3dwOS9INGVh?=
 =?utf-8?B?UzM0UEU4dkNHVU9DOHZRcmNVUTNTYmNESnJQMU9UQ3dQV01NckRxWExzZmpC?=
 =?utf-8?B?cXpKU2diQW1LV3daUG54b2FBbG9LSUd3MThlVE94QVhuRm1tbFdtc3lGayt2?=
 =?utf-8?B?NUNubzdTV1psZGtkbzkxRW1WeFBKMnh3UTBxU1h4RFBPQXJORWhQRXdVQmo3?=
 =?utf-8?B?OXB5ZnlMV0R0ZGt1Y3ZrU1p0aThRWklkZm9mK1NnNkRpZDlDVHpsV2k2cmNQ?=
 =?utf-8?B?Um03UnRkT0h5ZFpncys1UlNVSnFmNUgzNmljY1VXeEVSQ04xVG5PSVV0WEpZ?=
 =?utf-8?B?VlR5L0lHSVhzdGdtKytrcFpieVErT1hIdGlCRVIyYmRjZTRZaEdyS0lXRjds?=
 =?utf-8?B?L0QvaXhTZm9JU0o2cnJPWjdVZnBSd3R6MG9FQmJNVzFTM1pjRmYxTkdBSUxI?=
 =?utf-8?B?SE5CVGs2cy9BaWNXRXIrY2NPZ0FYZTlnS1dzbXUrbEo1QmRxYkRKc0J4eE9K?=
 =?utf-8?B?a3ZwdTE0cnJoYmNjUURvRk9GUlNjZk1lczhuV1l4Uy8wVTJlTDJIQTFYeTZP?=
 =?utf-8?B?cm9iRG9EdjJEak9nWEh6cFA1V0dvU3V5MzhRSnczTjdGTytLUXJaNEd4YWw4?=
 =?utf-8?B?SEcyUnZ4S2Z5d1NjY0FEOGRSbmNQTEhGazhuck9tYUgrdDNPYVp1eUhOc1ZF?=
 =?utf-8?B?dG5rRFNneVNqQlhNSXM2OUdHMWg4UjVQKytFQ3JkMDlsTEJ4V3RQcVRLV05N?=
 =?utf-8?B?REpXcXVLaGlONGxMVEFLSDFsalRjRHhTbjFvV0E3RmUwYWRIYVdUVXhZZmxV?=
 =?utf-8?B?ZzhmcnBwOUFqL3dxVDc4YnpnL2NSY29Jb2E4L2FPeHR3L0ZFaW1IeXlUT0s2?=
 =?utf-8?B?VFB4NWtoN20wK0pQeVBlSnZtYWEybkRFOVA4QWdrcmFnSWVCZGN2RkVRd0dC?=
 =?utf-8?B?SzJCT0hYMkFaeEdFampDeVJ3eGFpK3dPVjQxMEMwZ3NKTElWK1FBbkQ2OXRB?=
 =?utf-8?B?Ry9OalZZVlE0SU5PVTFRTmNQcnRPUFZmUDVHM0xFOWIxeTBmWmJjNmFNbDd1?=
 =?utf-8?B?aEk2TkdXSUFmTGVqSjFoVjk3SDBHcm9YY3JYZ0NMcThCMHlSWk12dHVKdmF0?=
 =?utf-8?B?R2pHK2ltZmp4RzhDcUdzWFQyUFFBelZ2ZmlCaSs1UDB2VFhKdnU3RFpOcmNY?=
 =?utf-8?B?YnNsemRCQW9IdXRDVURkaUVMTWFMWmdwSWlrMXl3YThndGJISGx5MjhQYmp1?=
 =?utf-8?B?Rkd3QmZzVGIyN1Q0dmVTMlArVE0wSWxBalRZM2V4YURNVzcyNE9VS2VjTDBO?=
 =?utf-8?B?c2hKRVlkNnZRVU4rM1dTMUo3MTZxeDk4dXN0T0xCeUxhbmYvVC9JdS9adGN4?=
 =?utf-8?B?SnZqS2hPNUtOM0p4WGY2VkVvMVBIb3l1d3pEeWE5OFovNkJiNzFwU0Vxa3Ra?=
 =?utf-8?B?cWFxYnExbjNhb3IzV1lmWTZLaFdBdU5ENUY0YkM4TFhqTzMvblBNUm9idzU4?=
 =?utf-8?Q?Iy9BYW+ZEYie+BNn84=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <BD64E1EB9B5BB248BBB1718113F585DD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d1ff53-a27b-410a-8beb-08d93d623b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 14:03:55.7313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UP4EHD8jJLMfgwydHWGYSV5Z79MvG/VGgpOsWUQTm+UX6AubPKSGmfIU/9YkTm5IoHdoGw5SNDo72NamiF3K+gVZ8VXOrZNVp9FWR/eZlZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_070359_594932_1C155357 
X-CRM114-Status: GOOD (  27.23  )
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

On 6/28/21 8:48 AM, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 5/18/21 10:39 PM, David Bauer wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Michael,
>>
>> Sorry for the late reply, was not feeling well past week.
>>
>> On 5/10/21 1:22 PM, Michael Walle wrote:
>>> Hi David,
>>>
>>> Am 2021-05-10 13:04, schrieb David Bauer:
>>>> On 5/10/21 12:56 PM, Michael Walle wrote:
>>>>> Am 2021-05-10 12:27, schrieb David Bauer:
>>>>>> On 5/10/21 11:35 AM, Michael Walle wrote:
>>>>>>> Am 2021-05-10 11:28, schrieb David Bauer:
>>>>>>>> On 5/10/21 10:00 AM, Michael Walle wrote
>>>>>>>>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>>> +static const struct flash_info bohong_parts[] = {
>>>>>>>>>> +    /* BoHong Microelectronics */
>>>>>>>>>> +    { "bh25q128as", INFO(0x684018, 0, 64 * 1024, 256,
>>>>>>>>>
>>>>>>>>> I couldn't find "BoHong" in JEP106BC. 0x68 (without continuation codes)
>>>>>>>>> is "Convex Computer". So this is wrong. OTOH I'm not sure, how many
>>>>>>>>> SPI flashes "convex computer" have, if any ;) This company was brought
>>>>>>>>> by HP in the end.
>>>>>>>>>
>>>>>>>>> In any case, this patch depends on how we handle continuation codes or
>>>>>>>>> if we can handle them at all. Or if this flash just lie about its
>>>>>>>>> manufacturer id and don't and CC.
>>>>>>>>
>>>>>>>> First of all, BoHong and Boya microelectronics seems to be the same
>>>>>>>> company, as their datasheets seem to copy each other. There's not much
>>>>>>>> information about either of both, so I'd say that's a fair assumption.
>>>>>>>>
>>>>>>>> Regarding the continuation codes, Boya is listed in bank nine, however
>>>>>>>> in this case I should currently read an all 0x7f ID shouldn't I?
>>>>>>>
>>>>>>> I'd guess so, yes.
>>>>>>>
>>>>>>>> The datasheet also only specifies 3 bytes as a return value for
>>>>>>>> register 0x9fh :(
>>>>>>>
>>>>>>> Yeah. So, this flash falls into the same category "simply hijacks
>>>>>>> a manuf id" as all the other flashes.
>>>>>>
>>>>>> From a quick check, this is also be the case for GigaDevices and XMC.
>>>>>>
>>>>>> My spontaneous idea would be to extend support for JEDEC IDs to read
>>>>>> the up to 9 banks of the vendor ID and fix up the existing offenders.
>>>>>
>>>>> you mean gigadevices and xmc? I'd presume they are also lacking the
>>>>> continuation bytes.
>>>>
>>>> Correct, same story with them.
>>>>
>>>>>
>>>>>> To not break existing boards, we could either skip the continuation
>>>>>> bytes of the kernel ID definitions for all flash chips or flag the
>>>>>> already existing ones and only perform this on such flagged chips.
>>>>>>
>>>>>> Personally, I'd say that only performing this on existing chips would
>>>>>> be better, as new vendors with this violation scheme might probably
>>>>>> appear and cause conflicts.
>>>>>>
>>>>>> As we still lack auto detection for new chips with that, configuring
>>>>>> the flash chip used with the chip name via DT would allow to set the
>>>>>> exact chip used and also validate if the manufacturer / product after
>>>>>> the continuation bits matches the one read from the chip.
>>>>>>
>>>>>> What do you think?
>>>>>
>>>>> If you'd ask me, unless there is a real world conflict, I'd just go
>>>>> ahead and add them as is. If there is a conflict we'd need to find
>>>>> a per device resolution for it.
>>>>
>>>> Okay, I'll resend a v2 with the removed copyright then.
>>>
>>> Could you also apply my SFDP patch [1] and send the dump (if there
>>> is any)? Unfortunately, I can't think of a good way to do that along
>>> with the patch and if this in some way regarded as copyrighted material.
>>> So feel free to send it to me privately. I'm starting to build a
>>> database.
>>
>> Bad news, I'm not able to get a SFDP with your patches, as the SFDP extraction
>> fails at the version check.
>>
>> Is there anything else I can try?
>>
> 
> So no SFDP data?
> Have you tried to read more of ID bytes, maybe there's an extended ID? Please
> dump 15 bytes of ID.

what's the difference between by25q128as and bh25q128as? I see they share the
same flash ID.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
