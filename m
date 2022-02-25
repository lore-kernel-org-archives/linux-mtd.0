Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6947C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw5969C9QOwxtCVNY46WdIv5NTGfVymFwgIOyu8ArwI=; b=KLhVuCEByseLPc
	m8xUP38OPVYBWU+nLI7YJmI2HdXwJUaVSo2WJPeuOZVQgUArZvrxADxbhpkMVr+45yip4/jGEoR1x
	5vCL4nBT0Imxk7VGvm5wYV2E45BTvadwL+DN/VYWxJMKB5GEPiHsoop1oIZ6RZ/qjXthlcPWQapX2
	B/buDVGdl1feBGK1yWRuxSig7Dqx+ndWzGu3lP9GNZvJhrsO6nTBujmVs5j++hr1EsfPIOMPPdJka
	ikswkP/a9BurTH0in+e2TwTYI412GLmRNVj2w76VLdQJddmE9IEmoIj5CZdPNCcWmPo0voaEoGrTO
	nm+osTQ6M3c3+VctpEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNayc-005EZo-CG; Fri, 25 Feb 2022 13:49:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNamB-0059jw-G5
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 13:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645796212; x=1677332212;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7V3ggF1yBSXwMiX4Q/wRXsifU8BBIRHjqwi4cg3s8cI=;
 b=p3uxM9/Y/bNp/5m8qS2WaHvoWNmM8noqodj30JDbDagXNj88+p5O6tui
 o+mFU6T5GaQmqDkDnP8ZMnea/jHALB4lvvifH7ACleOwK2YadS6s45YtS
 NKNxO5/n6cdqyoMcfiGyHXtRaNFdsrA2khPB/SS/jWFiwIJwGPHoW385F
 XtmtDY+YbdbM2cQXutWNACao1VFu7d/iWXTOWdZMkZ6d+vbxKXK1GHuWo
 4mQEqQZJ37npASgKKek6W4Jxf0VMMIGyaU8YmNS/aQN2IRp4qMp3hdnDH
 83SewCVzEjnjPWaU3JYRg85JCSfeoubHg4uM/k1IZfA0GsNTK+UJAw2E5 A==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="154414921"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 06:36:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 06:36:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 25 Feb 2022 06:36:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEyT7/QtwsFh9TSjbcJa0PA4lcpfvEsVj5j9xuPqM9lmBUj1L23rq19ulRQXgmE+C+RamEb0Fc4Ycekbm2ksRf7pHVY20Yk31pCq4pORg2TosCGdi7EKPCmYWFaJrPnIWFvf9mlEaKMuyI2ALwzs4ZfdnGXiWcIEoi+5N6nX/vB9ByP+LaeysagnYIeRk+jyA2T9dHwXbz2ZmVZaLhQ6OoEAzFP2ZpfiRmnpiG9II8T78A8QOkh0mRCUbsaGycLPyp+yONgd3X1+lsdoOPNGXf8g8VeUTw0bJHu0zgYQ1lqDZUTC0hvhyNPnn5/qe+p8Pt+cqlMyY5XOQNwA2pHxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V3ggF1yBSXwMiX4Q/wRXsifU8BBIRHjqwi4cg3s8cI=;
 b=RFeGrFWqo0Pex+NqrTmLta0LZIDlNPHEb0oqz5qLv8dvGXbjbTWoOi+Ym4zAE4kqO+TKMnAJNCuBc+6cLi17UI3igz4jRi52BMA1LyeqnHt0fj2aIbIGd+YOQ02vETznCTZXynf8sH78PHZAr3Q+YgGB8jlMIZ6tqQqfUNQJxIAoe5/GITdbOBnqNcmGRKf6foNS7vJwrCpqbNkqu6jG/dOqQu5O8kBB9JXnKR/HLM670O+9Rf2LwxerOMqqIBdQTCfzoNQqS6RlAEnx6k9tATPWAP9eTJbduyHK74KeXQsR2HWtG6HlriJHK4oy3r8Tm1F+RdnIz/d3B/83UIGa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V3ggF1yBSXwMiX4Q/wRXsifU8BBIRHjqwi4cg3s8cI=;
 b=BezevGkEG6Vp7O2+KgFEP93dPVEWJh7rypujNGEaWDvRPm/htUJfPz0tYwvKDo9XymuhYzMCW3thoIA5VPJmlLNekF5bhUtO1/Q1ox9a69n/IXoKeErif4HiMAAC20Du1MCP0b+5OmGJllbuU4LMKH97GmHea1lEwUw7NvSahck=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Fri, 25 Feb
 2022 13:36:48 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 13:36:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Topic: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Index: AQHYKkx/rOWxu2o8UkShyaiFUyzsraykROAA
Date: Fri, 25 Feb 2022 13:36:48 +0000
Message-ID: <5becc6cf-5931-5206-70d3-a643245de4b3@microchip.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-12-michael@walle.cc>
 <5c2ba6a0-a06b-d4dd-d503-1ddfa76f9be4@microchip.com>
In-Reply-To: <5c2ba6a0-a06b-d4dd-d503-1ddfa76f9be4@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12ddad2a-d71f-45c7-fe0f-08d9f863df99
x-ms-traffictypediagnostic: PH0PR11MB4822:EE_
x-microsoft-antispam-prvs: <PH0PR11MB482287A3125B97D4D27FBAD7F03E9@PH0PR11MB4822.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNAso4zPKm6rsrV1zpeG4WXvtqQTPyCRQ89ZGq/d9de01vjA9T6WRnWPNKuc2pIafe95asHosd35CeXDwAzUX0Vuy15M6SfFlE6RiWlY6Udqc2Ok/L6sQQN5hY8gszOwApTbrEldYZ00dZ/nUE8doqtGX0/FYK53aUJ3oBBUNWFVyyNltqZY+m2F8peIOBvRELC2gDsOlwcMhl3dOcnNqVSD5IlvPzfI+FYgp2H5P9cCZR9Lfx6Eskm3jM0E5RQZHI7TquL6hGfNzajRBYT75E42tKKEkmCAEuNqHCCHBhfA7vupFZYFvkubdszqz6RkFfOiR1GY9dxMbp6kSmfD1QcFqfPg2mPtzMVpwdPIr7i2+hENynG6+vTF1++snG/Z1wmHi07MutA7ZIxoOjmoSKNOAsf45V+MLyPS3CWWshO8LWAEB5SbqF1prww2N+0lLNV/RBWlQLbIAX3ohibrbDgSmiMujkarIr/Y4OnpG4E/46xwIdj8NAK4hrrs4sjLXX1Yl2rTZJ+nU1gFOYPSYz+hspdMWPG/II/5XUrSx5tklifcSxC5l3dzkSw/5qzmsT8PLI+iM+PYzfq6CsfQgee1qqfEiKWS9b6ofS7RemIQU3pEFNjeCSA9asjBFDmXPW9tz1XUCK0ttWmarLrEMuLjvnZNgdU4fnNo8dndBZHv7E0RkI14lehZD3HqcEjyKGUNMvjjD2jrZHPd+DumHf09rHsTlHaIad1WGE4j6zwtuHnXWN0KGFGrPOVEXG2aGj6aebzsHyTvxctKerRVNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(186003)(54906003)(110136005)(31686004)(316002)(6486002)(38070700005)(26005)(31696002)(86362001)(36756003)(8676002)(6512007)(91956017)(66946007)(4326008)(71200400001)(53546011)(76116006)(64756008)(83380400001)(66556008)(122000001)(2906002)(66476007)(66446008)(6506007)(38100700002)(508600001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3d1Qk03aU1FNWFnTkJmTi81RWhiRXUyYUZZRVd2OWJuU1NKeWo3OWk4ZXpw?=
 =?utf-8?B?RWhKUjNMZEZZZlNYVktkVThHek1EOUFPeUFKTlc0Y2JMNHJnS243dzJ4WWhP?=
 =?utf-8?B?WEduUTFNYXJNMk9yOG9lOWU5ODlqOEZOU00vTm5wbDNMZS9CVFZsQ3NacE45?=
 =?utf-8?B?Uy9ydDdkb2NnclluMVhnMktUWjM0NXBibHkwT2tMMGxJMXVLRmVMSkswZHVz?=
 =?utf-8?B?V1Rka3krU3EvMDd2VVJCZjBmVXgvc0UzcGFSeHdvVFlUT2owZHZiYjAzNTdo?=
 =?utf-8?B?ZDFkVFFDWTkzV3FqT3VIa2svdHlHTmx6KzNkK2xGQXJkMkxVTXczdmJMcDQ4?=
 =?utf-8?B?Mm1xOTNxUHZrMHFjL2xGR0kzZVhURjYxMnYxY0VTWHQ5VGdKYXhENVlCR0p6?=
 =?utf-8?B?ZVpZYzllRnRpN2xFWFdWbzhaZzRtTElmWjVpeFE3UFhvOGo3enhLNFNlT1F3?=
 =?utf-8?B?cDV5dEhFRzhxbithaFNQR2NzcFV4VjZwVWpqKzR4TWlJenZsd2l4eXpYbFlq?=
 =?utf-8?B?QkFPaEcvZG5pYXV6cC90TVVwaGRsUDA5UXFHRzZnbjFLdVl1RnRuTU5DbnJa?=
 =?utf-8?B?c3JLZlUxUklMNk1rN0hsa1llbjcrQmxDblAvemtZL3RCSU1makNTRGNkeDZR?=
 =?utf-8?B?SlhIWDZzRDk4WnlhUlhwYS9IZ3g1T3ZkOUsxd3BHR2ViL01QYkZ6b0VLME92?=
 =?utf-8?B?ZklraEhQbVdhMUVZdXpiN29DRVd2Y29aQWZ0RnJvUHJHZFFQMUxySXdyQitk?=
 =?utf-8?B?aFNub0ZFeEY2MXlQRmVTZERFMmszWk14UEdFb3FKcnliVUpTaFdrRzUzdWZu?=
 =?utf-8?B?djdnU1VpUm1CK1ZOTnh0cjFTQ1BwVWMwNnNKSEJpNnA0TENRZGN1TG1PZVNX?=
 =?utf-8?B?dHV1QjUrV2VqcXJDRWRaZUxTa2tvMllIYW9BT2dZMitpSmw0c1NWcDZYMmZi?=
 =?utf-8?B?ejd3cjY3bGtDdkhYODNsNCt4NUNzRENNaG01YVN2dTdrdmYzUDdtcm85NFVw?=
 =?utf-8?B?cE9xVkY2ZEduTGcxam0wUTFFL3JBY1ZkRjZQdFR1NUVPMmptME00N1prU25i?=
 =?utf-8?B?aTAxTFlPZk5MR2hSVmRrcndlM0ltTHg1STMxU01VMjZmeVBWSUp4L3RsWGNm?=
 =?utf-8?B?ZVlmditQUmJHMFZTUWU3N2VSLy9tRWFZcEJPZWdTSXdBSWhVK21tYzhNTXMv?=
 =?utf-8?B?VmxFSTl3N25UditFQVNwRG9vUGh5TzZKTGIxQWxwZmtPSERoWEpESVBUbk1p?=
 =?utf-8?B?MEErYUdRWktKektCb0xBMlgrTmFoK21XeU56SklPbVYzMU03eEF0ZU5tWTBX?=
 =?utf-8?B?UEJnbUxDdzZMcjAvSmhSOVJtK2RHWTF3UVdYRVpZNVY0anlVbzIrZmEzNDlE?=
 =?utf-8?B?b212aUdQbkxVZkdXNjhwSS95MUxCSFVicWwwTkh3RUJtSGcwd0lQOFl6NHdm?=
 =?utf-8?B?OVpIYldhTzRrZUUreXVpallwZ1BWUnBaVS8wN2hZOENWVFFISThNL3Yxem54?=
 =?utf-8?B?ZmtURnZwK2lJeEE2ZFYyaTdPZjQwenAxRWtobmFsbXpyQVZtT3h6OE5GVWNt?=
 =?utf-8?B?c3pDOXBSOHBoL3B0ME41VXFhM2FESmNTOXpJU0h5ckd5UVd2c1lTUDNyQkU5?=
 =?utf-8?B?MWRBZ3JEMllmK2oxemUvQnFIOGZnTDdtQThocG9CeU53MEJUN0hBVVRtaGlm?=
 =?utf-8?B?Y1FjcitxRWhTRlJhS0tZZEU1T21kY09hV2NTQ3hJSjFqbEk1aXJqYmR2aHhI?=
 =?utf-8?B?MlhxN0xBTDI1Ukc2QytsdVNma0FneGpNcndvOVp1cFVZWmtEeEFudVVQenFK?=
 =?utf-8?B?QW1lNllpQ2RqajBYQ2k3ZEtkQzhuaGJ0TUs5MHJXZitRMmtBNHY4cEcvM1M5?=
 =?utf-8?B?SXJ6aXYvTnljYTZjVmpjdThOa3pLTDdlaThUUW96NDJka0Jua1lZSGVObSts?=
 =?utf-8?B?QTVWempkaGxEN0FhYW5NWkpsV21uUkdoeW5zVFhYeDl2ZXh1VVphRVJOUHIv?=
 =?utf-8?B?VmIwbzZ1MWs1UzBqbkpBM0xOT3AxSXk3VXpOZkZkVG1pVDROM3ZMVm1icXRH?=
 =?utf-8?B?alNvMkFQOFRxT0J3N2M2L3ZtdEJUWmxSOVJVNDh0TzBmOWcyTllvYXkzbzhr?=
 =?utf-8?B?dW4zRGxjclpvWUI2aHkrMDNxSzVLajJHT3g4U2NPYXVYQ1ptdTI3ZkhveVRW?=
 =?utf-8?B?a0I0ZjY1UWVDVWdmbmVzUGZYT1RSaUQ0Q0VuWitQeW5QemdMN2RlNFlybkxN?=
 =?utf-8?B?ZGtpTDF1VjRCeVNRNjhOYWYwVmVRPT0=?=
Content-ID: <83C54C662CB94745BD3C6D6039AFAE18@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ddad2a-d71f-45c7-fe0f-08d9f863df99
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 13:36:48.5717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xE0szrfjo2rMgAonAHSCdYHff5XOjo8jbDFdVUoaZ0Eml0o3eCrnIX+yFpUQJklzbwelgTm/PFzjlGivyUnrv3qu8vUQPuxklJng+lxerpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_053651_598162_8713A460 
X-CRM114-Status: GOOD (  15.75  )
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

On 2/25/22 15:35, Tudor Ambarus wrote:
> On 2/23/22 15:43, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> To avoid name clashes unify all the function and static object names and
>> use one of the following prefixes which should be sufficiently unique:
>>  - <vendor>_nor_
>>  - <flash_family>_nor_
>>  - <flash_part>_
>>
>> There are no functional changes.
>>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Acked-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 34 ++++++++++++++++-----------------
>>  1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index bb95b1aabf74..7a68f2ad3ea1 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -17,7 +17,7 @@
>>  #define SPINOR_MT_OCT_DTR      0xe7    /* Enable Octal DTR. */
>>  #define SPINOR_MT_EXSPI                0xff    /* Enable Extended SPI (default) */
>>
>> -static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>> +static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>  {
>>         struct spi_mem_op op;
>>         u8 *buf = nor->bouncebuf;
>> @@ -102,7 +102,7 @@ static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>
>>  static void mt35xu512aba_default_init(struct spi_nor *nor)
>>  {
>> -       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
>> +       nor->params->octal_dtr_enable = micron_st_nor_octal_dtr_enable;
>>  }
>>
>>  static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
>> @@ -130,7 +130,7 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
>>         .post_sfdp = mt35xu512aba_post_sfdp_fixup,
>>  };
>>
>> -static const struct flash_info micron_parts[] = {
>> +static const struct flash_info micron_nor_parts[] = {
>>         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
>>                 FLAGS(USE_FSR)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
>> @@ -143,7 +143,7 @@ static const struct flash_info micron_parts[] = {
>>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>>  };
>>
>> -static const struct flash_info st_parts[] = {
>> +static const struct flash_info st_nor_parts[] = {
>>         { "n25q016a",    INFO(0x20bb15, 0, 64 * 1024,   32)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
>>         { "n25q032",     INFO(0x20ba16, 0, 64 * 1024,   64)
>> @@ -250,15 +250,15 @@ static const struct flash_info st_parts[] = {
>>  };
>>
>>  /**
>> - * st_micron_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
>> - * flashes.
>> + * micron_st_nor_set_4byte_addr_mode() - Set 4-byte address mode for ST and
>> + * Micron flashes.
>>   * @nor:       pointer to 'struct spi_nor'.
>>   * @enable:    true to enter the 4-byte address mode, false to exit the 4-byte
>>   *             address mode.
>>   *
>>   * Return: 0 on success, -errno otherwise.
>>   */
>> -static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>> +static int micron_st_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>>  {
>>         int ret;
>>
>> @@ -273,28 +273,28 @@ static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>>         return spi_nor_write_disable(nor);
>>  }
>>
>> -static void micron_st_default_init(struct spi_nor *nor)
>> +static void micron_st_nor_default_init(struct spi_nor *nor)
>>  {
>>         nor->flags |= SNOR_F_HAS_LOCK;
>>         nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>>         nor->params->quad_enable = NULL;
>> -       nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
>> +       nor->params->set_4byte_addr_mode = micron_st_nor_set_4byte_addr_mode;
>>  }
>>
>> -static const struct spi_nor_fixups micron_st_fixups = {
>> -       .default_init = micron_st_default_init,
>> +static const struct spi_nor_fixups micron_st_nor_fixups = {
>> +       .default_init = micron_st_nor_default_init,
>>  };
>>
>>  const struct spi_nor_manufacturer spi_nor_micron = {
>>         .name = "micron",
>> -       .parts = micron_parts,
>> -       .nparts = ARRAY_SIZE(micron_parts),
>> -       .fixups = &micron_st_fixups,
>> +       .parts = micron_nor_parts,
>> +       .nparts = ARRAY_SIZE(micron_nor_parts),
>> +       .fixups = &micron_st_nor_fixups,
>>  };
>>
>>  const struct spi_nor_manufacturer spi_nor_st = {
>>         .name = "st",
>> -       .parts = st_parts,
>> -       .nparts = ARRAY_SIZE(st_parts),
>> -       .fixups = &micron_st_fixups,
>> +       .parts = st_nor_parts,
> 
> you have st_nor here
> 
>> +       .nparts = ARRAY_SIZE(st_nor_parts),
>> +       .fixups = &micron_st_nor_fixups,
> 
> and here micron_st, it confuses me.

Oh, it's because micron_st_nor_fixups is used by both micron and st
parts. Let me revisit.

> 
> Any idea when should we use just st, or just micron or micron_st?
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
