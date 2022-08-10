Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA77DC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cEEdsi1H+XU8kEv2N6vdhD0e+8/UTnl9Lop/MVIMJWQ=; b=WT9xyfGS4uFFKu
	DAfNR3n7r2z8vv9rT9r0sNfTkDx9uMSa1IP0v8gTc2Kp89E9N8u/z1eNAyv7GSuIAvIdOqjggLw9u
	lNtHG0IXbPI3j80DJgLKNPm55lxKKk4xY0rsmwHfmQ4bjURy/OTk9ujS2rh5UhXXjHGxW1XzcBOvD
	0h0Hn11F6No/1DeVHVp/YJZMo/bEa81uM8JH6qCvI+7GrkbSXlUCO4B7997ZnM06uWWeysmdFBTTS
	VFCYe4gdJRTE+F4U5NYY1a8yrZjO9X0n1nO+9KbbNCLnz1bQGKkal1blXGOryC0gueuYpBvBJRe+f
	QhIpy32wtpDpYckktN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLh1b-00AjYC-8U; Wed, 10 Aug 2022 08:25:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLh1Z-00AjXc-3Q
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 08:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660119908; x=1691655908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=enKEeCmnBtnB4DpPADfdTznOpxGVUtmYAfJmaVsJ1JA=;
  b=CN21MGhTF1q35MPvU0xaMaJdzrl6mo77vbmhf939ya0Ev2Yqa2d/yge1
   IR/w06Q1NgzN5pS7hrCe5iZHqSdelHY7ScWEzie50EoHTj0jX3gMx92JC
   jT/G9sq3BpIXYPwuJVuhMBLTqXbt+I9hcirgA+p8R2vw7W82oDx9jT0pC
   dWdVxeuoGJzLKNBolKHwCVDf2zUY2t25sXSR5kJAfBMyXqsgXFJUS6TR8
   u1+Kpo6nhBt/zeTc7DL9pJy8Y8DvcDByKZMUM9g/FPuYhD5jhho5D/jci
   jiQByQOh0IkbLBu69fZN4lMuFsiIwg+JDQL+1Pt9ejsW0ousWxxZee3lL
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="108378679"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 01:25:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 01:25:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 01:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/8feKUbnUxwB3lDDrFCHHA1kXYujeCBj305qZ9AgpdhcGd1fKN0co/GQ+teLjp68Am0dVwWYR8sZZedV3J9/Iy9VjTZLTP//ZrHN4h+RfBc8u7985SJ8MphN6hKdrq8Fg391jMWzmqLIbtbKd6Jm51Pgj7Smc/SidjoLZ+AoqRXFr0xQZZSJxFTTJXCMJLN+YySmnAhfgB1gPAkRU5VhAYYCIA06i1qAFeN4naFiadDIrUb7quxwiFteujzd5MrVqOGA2CmiArpBoTct+yYXQZbQ7y4VJ8ebuQoMNl8T90VHwbAwxd6v390bIGeFb6Gl8mnOJDSY4cvCaMP4pqm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enKEeCmnBtnB4DpPADfdTznOpxGVUtmYAfJmaVsJ1JA=;
 b=MG/UCMSKTDlXptMK9j7kqR/mELaz0qJI4Scyi44KJpnt8Kq4oWSw/rWj9MBw8r+gSrHiBD3Y+VXL3yV29p3AtQ9TqFjnXG9LzPYoUF+QgemzhtSxP8DU7dzYAtgz4Bx0WHgE5e/Fi0JRnfEIyWBCv2rzRSbS2XkqUosVS3yucTPsjWHJclsQ37kvl2WU+2wLZAcKHJ+XTzWn8cedHqNBJmgWhUCkQr37xsHSYvgmf/Y5kGJZ2n54OQzeWOqpAx1byI1l/CjtS4SWJdO6WaRxlroUB15ZsZ5FBtPN2Uh0/3GddGDtlLT5oL0BkJPDshfF2JmNwppmmhmcSmgFzpmhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enKEeCmnBtnB4DpPADfdTznOpxGVUtmYAfJmaVsJ1JA=;
 b=t08Eq4WQZMsDTSGZfJL4OFidIS4wIwEtzZWonHSG/y/m8cJcsc24xXovyVPJrZm0PhWY+8Ec2vur4NzxJaVzDiT/vI8rLV6UrniPBsAsYYW9pDBnPx+ORJlLWWv1PZ3tILAStEDn4B0n7ms6EM+ZJPybmpd0ucK/3t+x8wnS53I=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Wed, 10 Aug 2022 08:25:02 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 08:25:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <greentime.hu@sifive.com>, <jude.onyenegecha@sifive.com>,
	<william.salmon@sifive.com>, <adnan.chowdhury@sifive.com>,
	<ben.dooks@sifive.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Topic: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Index: AQHYrJASR2XJCCWNYkmLP3pHpwj/WK2nzD6A
Date: Wed, 10 Aug 2022 08:25:01 +0000
Message-ID: <498c33a8-014f-e542-f143-cba5760fafdd@microchip.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-3-sudip.mukherjee@sifive.com>
 <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
In-Reply-To: <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18cb6606-8666-481a-1baa-08da7aa9d214
x-ms-traffictypediagnostic: DM6PR11MB4676:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MfHB1Tz0FnupqAEaBWNgHnl9u4UFSMmmjLFNtoCqC2a9uoJjccRs8OhfIQRE33v0cwOn5UubgnC813At5quGbyHXeg3RULrDaX7jLjaN8bHFKaPKXDl37jsaO/NpEWyVAdtm6h/Y11jyRce0ScToYd+IHQlFGpHHe5zWvYpeLTTykTFQVgJJ9vjH1t9gshzMGZBesNn1llP1h7U0AcZCPfzdSFoWfroQv/JTXXo/OXZB5DbzNQ75qcOfg7ymJ5eG379/u/k9dgkoHQfvobOhdbrSg2zfqF7loWUhR4GTib74b6Aw1F/ggtEy+XJg9l78ZVJprIHGOO3yZzYVP9ch+iO6nkTjQi1NFhkm35BXlpMVAc9f/pPZC/ZCwfZRqZuGDphesE7m89oSkUBkwstKdaRu4KTuOhZL2odBRFpabXATxAYOetERH3Wwf5VbKZSW03PnXyNpcTDLU/m+yQRwiTschwN84+1aCuii+eFHtpKPk0WSpjRHbxj8Cfj5oPVkzuQa3WIbPdSSi+QXQW5MQRxik+WrgSiJqEVmrP9J6F5I52JGDqCQTVbjpNIc1qvzPri37ESJuqgnP7bt9HQdAsONNdf555UWRdWTASeONBpMReQ1yxl3LX7HOZ1f286bRveXYQfV+akR4mN6pd6qsobh7aPUKDZ8Iy499act5p7pT7pygWq16UinuPbqricL7DgxO7dCAQhHdT1oLnVMw6AzlDIhu2gg8S0YkJsFhe95rK2eZfyhTDcC/fIytwvpK+wBmJmqp6IScckfzVZLiAVme7yMzBxQsDDcVaE+rMral+k5FQZO65ZQq3BS0UokiCcn1XJHvUNHsF2PadZEP1nk8cl7BUDs/+/Gu1cUrQ8ZSpB0PtWz51JGPKIRTAFvIv8xU9MMYUG1RJ120UZNntV03vMUDUYEWDpzv+Ni/F8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(366004)(39860400002)(376002)(36756003)(53546011)(122000001)(5660300002)(186003)(7416002)(2906002)(38100700002)(2616005)(6506007)(6512007)(8676002)(66556008)(316002)(66446008)(64756008)(966005)(66946007)(76116006)(31696002)(71200400001)(86362001)(54906003)(110136005)(4326008)(26005)(91956017)(8936002)(31686004)(38070700005)(41300700001)(478600001)(66476007)(6486002)(43740500002)(45980500001)(352734003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejBWeGQ0cUtoaXVXaTd2VWh1TUNHN1dqRWcreUFNTnEydVRSdWxidTlPNVRF?=
 =?utf-8?B?V01DL09Od2o5THRtbFM3RHE4dkViNFkraXhSMDNzaGl0NHF3NUY1d3oxK0hR?=
 =?utf-8?B?MktuOThOaHBVOTNXWHVvWkg4VDhKQjZJNnhnaHZXM3d4VURaVEJtdkpiMGNn?=
 =?utf-8?B?T0YwcVJJbnpsbEt0ODY3YmtXeHZ3eURad3RoZStKT3JsbHpwdmF1VFRUa3Zx?=
 =?utf-8?B?R2hMMWhuZVJFQWgycFpwQkExZGxhNm5iU051Y3RyWk9wUHBjbDdPMzcrT2Mz?=
 =?utf-8?B?Tlp2WnYxQWZ3ZjZjNkJ0dG14S1dKUmowRGdsMDdGZkQwdFdueGs5bUdjVlpC?=
 =?utf-8?B?azB3YXZ5eG1vOXhZdm1TUzJoNkZROWh1WjN4RUJGZ1dCYWlYaDRPVmFiQndZ?=
 =?utf-8?B?MndlaFoyU2l1WkphcS93K080ajZxaEhibXBGbnYxWm5rNmZna3FvYjh4VG9m?=
 =?utf-8?B?SjNJSU54MjNTWkp6UmVyMWEyZ2V2TWI1M204a2o1cDNxU1J3YTRWZG9xdWc4?=
 =?utf-8?B?VzBSSG9nNlRieUw5YVVLUVVhVlNrbmhYMnlXRENMb2cvWWIxRGxZaUYrWG8r?=
 =?utf-8?B?WXA4ZzZ3S1FVTktGMDhudGQ4N3ZtekFHaUU3UzlXKzNlUVo2bmhnOGFGWm5h?=
 =?utf-8?B?WVBrK2xac05BVmdxVk1yNFF3R3BST2QwN1hWTXlQS1htVjVoWm92dmFlSkx2?=
 =?utf-8?B?b25KMG40RVhaYXVROWRCZnZBVnhBZEJDSUZaVXF5NlU3Y2NaWFBZcVNtK0Ft?=
 =?utf-8?B?UVIydHJ6SUFnRTVrWUVmVGMvQnc4YU5FNmE2MUJDSlBycXVibU92ZS92clp1?=
 =?utf-8?B?SGpsa2RaWTNTV0NrZklEeXNxYk90MUoweGRaRVJ2Tk5OMnBFUU1lV3BtQnVO?=
 =?utf-8?B?TmxpQU9lSUREdDFvcllOZCtzOUxrQzFZYkJPWFR1WUtaRFBzOTV1ZkJhT2w0?=
 =?utf-8?B?OTNEeEZOZm9Ua0E1ODlpblJyeXFJU2pQSGlsejBzdzBSYmNIdW90VmtlMDdI?=
 =?utf-8?B?ODBGS3UwcG5MM25XV29zNld1Wk5PVkNTa0xzakVLa0NoUnRhSUF1NWExcUsy?=
 =?utf-8?B?WVJBWDV4MVYrS1ZIR09aNzBQYUZtdG1YRnRqdlVQU20rSmlncytpeFMwVVZU?=
 =?utf-8?B?ellvNkhIKy95bGpoV0wvNFdoTlRuWXJNWnVuOGNaZTh2YWNIZTk3eHIzZ2ZO?=
 =?utf-8?B?a09zNFBqREFVbkNxMXlRZ3lSUzZxaHA1UXkwWFl1VkVyRmpmR0xhZ2FBZmJN?=
 =?utf-8?B?MFBTYkhuOEZGSXNWTW96a1BnZzRNOWVIS3lCU25JeEtnaGp2N1pGK1ltakZO?=
 =?utf-8?B?RGJ2UEpUR3VBYVpsZzJ1RWs0TUo4ZUhaZ1ZaZjBGbjl0b3RQby9nUElqK1ZG?=
 =?utf-8?B?di9EQnp5aFpvMlJFK2hMMExBaVVzNjIzUVQxbVRsTXdaTi9IQ0UrajB6Q0gw?=
 =?utf-8?B?Q3lHQTNwTUlianV1UUZSdjY3eUxxazBhbmZOVmNvR0N5MjdUOC9MSUZWUWsx?=
 =?utf-8?B?TUpZUE9ucVpNOVkwMlJtK2Z5L29CUnFVcXVnQmdPWFQ0UnRuRlRzZVNlWFNo?=
 =?utf-8?B?Vk1GOHNpbXhKaFU5TGhFU0dITUE5cjVySDFSTXhPdW9maFBLWUxqRjZHaEsy?=
 =?utf-8?B?SG5BTlB0YlNrWmFNMzNEMGt2R3ZKZnJlL0lVT01JblZLdGpldjUzWHlMVGdO?=
 =?utf-8?B?M0plZ2hYV2Z4UFE1REtwREFXVjBLbGUvNko4UXozRnYwVEVuOGJYMTlaWm5r?=
 =?utf-8?B?UDRNR1ZqSGlMelkwanVUK2hHN3JPN0hsa1NKSEVaQ2FPd2NIbGIwWnk3OHBk?=
 =?utf-8?B?VFRiT1BMRzJUaVZvQ0Y3YVpLeTVIWVVhNGpzaTNjYklsaWNWM0VzdWtWZmNp?=
 =?utf-8?B?TXhndDdlakdoRmdDK1lxWDlnRURKbm0zRHloNmQ2MEp3dTAvUktYYi9pamk3?=
 =?utf-8?B?U0tCakxVeHVmQm9hdWxWUnhjL1FyZmRCWmZPdTZUd3o1RTVtS1NBbmFzaHNP?=
 =?utf-8?B?Y2krYmwyQWNwQ1hhaWpjUXFTT2RZdmdpMGNtT0RuNUpVVFJyandFYWhySllM?=
 =?utf-8?B?d1p5enJJOENhYXByNnkvUFRUenlzb3RCektLOE9aSGFxZlhuaVRNQVVLYlFS?=
 =?utf-8?B?Yzd4R29SSDZDYWI2ckp5TGNLS2tLckVYMHFoSkpRRnlyQ2kxSE5zUDBhOWhP?=
 =?utf-8?B?TkE9PQ==?=
Content-ID: <7FAE8904AA9E564B822E388538B064D4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cb6606-8666-481a-1baa-08da7aa9d214
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 08:25:01.8785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tpp4cLNkEIPg/p6qLy0HXAJmlG2y02SVHHhkmNF0ogE7/dsIUQ2uIf0WUyivgehnEwr35KFZD4WakRCZpHnO/PVa9eCh9SMHKXSexyPpbwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_012509_255643_6E4A281B 
X-CRM114-Status: GOOD (  23.90  )
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

On 8/10/22 11:06, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/9/22 23:14, Sudip Mukherjee wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> SFDP table of some flash chips do not advertise support of Quad Input
>> Page Program even though it has support. Use fixup flags and add hardware
>> cap for these chips.
>>
>> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 9 +++++++++
>>  drivers/mtd/spi-nor/core.h | 2 ++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f2c64006f8d7..7542404332a5 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1962,6 +1962,12 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>>         if (nor->flags & SNOR_F_BROKEN_RESET)
>>                 *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
>>
>> +       if (nor->flags & SNOR_F_HAS_QUAD_PP) {
>> +               *hwcaps |= SNOR_HWCAPS_PP_1_1_4;
>> +               spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
>> +                                       SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
>> +       }
> 
> setting SPINOR_OP_PP_1_1_4 should be done in spi_nor_late_init_params().
> spi_nor_late_init_params() is used to adjust the ops supported by the flash

^ s/spi_nor_late_init_params/spi_nor_spimem_adjust_hwcaps

> with the ones supported by the controller.
> 
>> +
>>         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
>>                 int rdidx, ppidx;
>>
>> @@ -2446,6 +2452,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>>
>>         if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
>>                 nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>> +
>> +       if (fixup_flags & SPI_NOR_QUAD_PP)
>> +               nor->flags |= SNOR_F_HAS_QUAD_PP;
>>  }
>>
>>  /**
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 85b0cf254e97..7dbdf16a67b4 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -130,6 +130,7 @@ enum spi_nor_option_flags {
>>         SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
>>         SNOR_F_SOFT_RESET       = BIT(12),
>>         SNOR_F_SWP_IS_VOLATILE  = BIT(13),
>> +       SNOR_F_HAS_QUAD_PP      = BIT(14),
> 
> you won't need this
>>  };
>>
>>  struct spi_nor_read_command {
>> @@ -520,6 +521,7 @@ struct flash_info {
>>         u8 fixup_flags;
>>  #define SPI_NOR_4B_OPCODES             BIT(0)
>>  #define SPI_NOR_IO_MODE_EN_VOLATILE    BIT(1)
>> +#define SPI_NOR_QUAD_PP                        BIT(2)
> 
> No, as I previously said, SPI_NOR_QUAD_PP should be declared as a
> info->flags, not as info->fixup_flags.
> 
>>
>>         u8 mfr_flags;
>>
>> --
>> 2.30.2
>>
> 
> 
> --
> Cheers,
> ta
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
