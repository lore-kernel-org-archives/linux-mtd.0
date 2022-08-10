Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BAC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQA+efWQr4uzqQDuemri3SO+UqtaCR1x1pTfZFxLx90=; b=QvtCauCwKiFjlN
	wcYk4qx8vgeCANsFgSF0dbk9gllJKVDHbCHDtPDiGU18a97sDYbFx6XDuoCbQ6qNvluzkN6gu382c
	0LtdeMA7rGkKi+7ASgrz4tXnELizY3a4gjTRM7cVByamp1eQ4PhPzAxqApx369UXElha38VfxyAKO
	Z7OKxTP/OHEmAbet3TqYGbrKRQbp296K/CGj361wHHpvCJTex3rtnWc0A4yrFJiboMIEPCyyBw3H3
	gVL3hvsZ7QQm6GaAAbNBfU8oGhcoYDai6/w8/GlAqz6obYJqgTUQae3YuC/rbM7ppjDwPwEdj3zjM
	cE3/rApx/msibjZYZ4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLotJ-00D2d0-Fu; Wed, 10 Aug 2022 16:49:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLotD-00D2Z9-TM
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 16:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660150143; x=1691686143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RqYhuYAFwiekwC6dZDPy2ZSf0SaR3zZvk79QqfwFq9o=;
  b=kNoTMvZociYemRlJWUGIOZTP1qModuvzrLk+/kzurIMPevLnf3Ox2sDu
   P4J5eDbBBkMzQ57tolxBTNh88GFi84vb71cBUvpsODVnxkkE4MFpPkFr3
   ySZEoUXvsDgmGpzSWtCqPgI4uYt07BA1cOcoHxoXBUoWoZL5Qh4frJXyB
   U4cPhfKohR5qhB5/XufaAMfeIV23qoWgrkDwCPy36ObpZ/dGe3grVeGHB
   /UC1cZAzxqcY2TjW4l2TadUmJtWmYSg30ls7yIM7U224g0d4Qec11V7NY
   JMoZzGxlHoJOrfskJ9kj7j7kZySk0Xf8caan5o8BLUvkCyL3C5XWdA4Q+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108455320"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 09:49:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 09:49:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 10 Aug 2022 09:49:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRrV1Lft5n/4ipjLKhy//26G/qU2GvIH8yolOQdflozm2MdzoyD+HaWo2TipnwVNv2VJEF9GvReNmodBXno9hsV1mK6tcsd7NX+7byEccII6fLymjR+p3z01zBDeInM34m5lBvotw95wHJ3KNQft0CaNFYqHUxHcjtIb42GVYBZ0NInGG4qgkhTb6pMIRH5aIIRA20jkEvTspBI/wTsGvF2OUbwT6G1sKG4jmfl7jBKvJZMtyCtVj+r/iaP7Yk+X9c0zzzLTKGxCuSmPl1XFd8g5NXAWWizfigRDlL6RArWLsW6X9AbJtNOsS8cDZfOVtdRQj2uwSxH4BcbQ7sIo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqYhuYAFwiekwC6dZDPy2ZSf0SaR3zZvk79QqfwFq9o=;
 b=LBuQ1OfQ2i/5ar56ROJGCkP6t+NWNAFu+9RCBrSTuTw7+msz+XI1Pi3mzur7WFZrfU43WybzcxHvbkWdG09Ow5yjGR5e7ip9UjygbF94B4kK5R3cPpNtOiSdrzUrTSG8oX0wAJ4bU+KdEA4x2o9aYiutT6yzEOutS+9SZOU90PV1cie6kfO7pwXbSHSn2RJ0Z+h+ML3CzQa0vdOrOlFmvuxDDA7/eucXtWV54jea7AYIOugeWUu9QVm65qQeD+o6PLXXidb/za0yXqHNrg7UD6Oyvuf5NRbJ47mnGvN6hQkuCDPhCInMTCnlRDIZ5myvzVzRqzD29aIlA/VL0JM4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqYhuYAFwiekwC6dZDPy2ZSf0SaR3zZvk79QqfwFq9o=;
 b=l5b3nQAUxwbJcWBjL/JXrSvvv8LRQjGkqI8XRD+BNH1qZIxeGHclSG5u9KVRSaJkR/n4tawmQV8ywLeU47jpLpVTrVuIdIlAFYkwuONWqAe1eP9GjNdbbdwOQSMkieQOUM33eXwp8f7c6/MkLYL5klAAHHX+4QP9WxLv8t7GRso=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Wed, 10 Aug 2022 16:48:51 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5525.011; Wed, 10 Aug 2022
 16:48:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <greentime.hu@sifive.com>,
	<jude.onyenegecha@sifive.com>, <william.salmon@sifive.com>,
	<adnan.chowdhury@sifive.com>, <ben.dooks@sifive.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Topic: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Index: AQHYrJASR2XJCCWNYkmLP3pHpwj/WA==
Date: Wed, 10 Aug 2022 16:48:51 +0000
Message-ID: <d380a6e8-6666-1c0c-109a-3f8449fb7f02@microchip.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-3-sudip.mukherjee@sifive.com>
 <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
 <CAHyZL-dgrGu3z4ySy_EdG7KdZwU+DHdo8nH=+Go_nGZUZYFq_A@mail.gmail.com>
In-Reply-To: <CAHyZL-dgrGu3z4ySy_EdG7KdZwU+DHdo8nH=+Go_nGZUZYFq_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 597e29d5-72a8-4d15-cb70-08da7af03419
x-ms-traffictypediagnostic: CO1PR11MB5092:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VN52UD9CUSkHM8sHUq2VuZ2iZhGDR+NQLfUbRH3DEyjYbayLvGQ4aw6e3ei2B9bZO7G/FkyqSJ1TO3YWIE31VybVU/BcbnIT0UeihX/XKv4MVyPObffWy0NVp30g3p61/MslR4XnrldP2HPv02FNIzdieQtqIpJlSl1uSAYb9kGGpNoiU2btnb7i6lV+1/A/1qv7PyGDcmkXNQEu0FvlvPmCHW/LHuLMJGJwsKi3rr8gCuFhScWQdqiGGUv2ogeFpz1itvp5+uMsEN9yBgpKyox/dwf/zu8SBuUL51T6y7WdaH+xNqA+LsspWQZKCi01Go60FYEYE27I4kc1kHRf9twOH1XvpgklGD1OzajDofY2fcfQXxihWZYrE8U/gidyINpLF3d1YMe+i/OtJYzxORULf8/1DGdhIFY5g4ZrDIibUZJQzdb5IRxUsYm1H9HJ+2RvEjdMNw5ZhwQc/NWdkdyDkx/yZFgBuyhxNwkNzMGhRVi0ybTWKhNHLCIrdhLD7FXnnWBd742GC0RHb2OmMCV68Dg/fmcs+GfmCkUZecslcSwHahnYeleFj/eSJBah/r1RIkzVI1QexGS2dq4927kw2/nNYqcel0PCulepN3rLtOST/bK75nZqjOdW9IUYKG+L46m4giKrTgs8kvh8zoWI3+lYdxYGiui7GKTG2gTUgnBEdQhfAftK5Sxwq0nLgJr7TqYf6FYdqjbZ6d7eveDG9aqLC3suFrKoNGilqBlAn1rDt70UuRAmPXJ6J1Ojc/6l3lsUncErwa2dQVBdzRMPTLHP0zD9644jVtj/32c9VrrJaMpRyZtybdyKXdIqd+TgyKOsR6mF6vbvIYxm/N67cABRkyX/ZzqslnvLFUiXnI1cNq1lUNWtC9OTtUMxTYtFzpilj88ULr1S6ZVqIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(136003)(396003)(478600001)(38070700005)(71200400001)(41300700001)(6486002)(966005)(26005)(6512007)(6506007)(86362001)(31696002)(53546011)(2616005)(186003)(31686004)(54906003)(91956017)(8676002)(76116006)(4326008)(66476007)(64756008)(66556008)(66446008)(36756003)(5660300002)(66946007)(6916009)(316002)(8936002)(38100700002)(122000001)(2906002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anQ2SkNSUi9SOFBoSzBFMGgrcDVzZHduSndCNkE4MklqNDViTVk4UW9HZ281?=
 =?utf-8?B?VnJaSVNCcWJWd2lOcXhFdEN3T1BRa1d5a2tEMnRDWC9kbS9hcDUvQmZiYjBC?=
 =?utf-8?B?b05WV0hsS3QvanFRYmZWZzlDYk5ycHZmZFNPaDV3VnFUdURheVF2bDlKeW9r?=
 =?utf-8?B?L1pORnNMeUZrUkVkMmphRFluWmF1RUM5R0VnU0ZiZXpkaVlOQm4vMCtpaG11?=
 =?utf-8?B?OHFqMUhRSHVRTWVzdFIyWXZDM1V2K09nM1FqY0hYOHhYbGJJOS9ySDROZk0x?=
 =?utf-8?B?b2RoOEJQOTBNWjBOYi9xc0t6cmJxZmNLSTVGQ0pZVnNDNGhsY29GS1RSZFNM?=
 =?utf-8?B?Q1d3TEZGMG1lTUhQaEk0YXFkN1BXQ3RvVkNpR3lib2NuRDZDa01VV2EwT3Vi?=
 =?utf-8?B?Y2EweGNhaEVyK2FXMWJHSU1ydCtyT1NwdGM0K3NQQm8rTXRERDNBNmJIVGRa?=
 =?utf-8?B?TDJ3UWFvUk0ycVorRlczUEUxOTBnejEyYkhyamIvSjRhMzI4VWhleWtKcXlV?=
 =?utf-8?B?WDJ6R3JkY2grbFNpZFpoZ3FnRkxxUzlJOTFCS1RxU0dhNUt3eWRycG1TcU4y?=
 =?utf-8?B?cUROK3grS28xeGpubVhVbFpROWh6Mno2UHdRSGtySTJId2JxTVF4YTdjMDdD?=
 =?utf-8?B?Rm5WbHN6T3Q0MkdnbXVyem1TQWxaQk1kbXNUd3p2NjB6VTRtVklBQkpoMlR0?=
 =?utf-8?B?R1VOR0tRc2k3Qk9MWnJyMkJLdmtSRFVBSldQcmFtdFIwRmJQKzdydTRITFFS?=
 =?utf-8?B?aitzZ0lTQjNtNTRaMFNGMWp4N05WR3g2SE5FRDFTMmhldmtXbmhSNStCSDhh?=
 =?utf-8?B?aGZNN1pQSkR6SHFWSkF5Y1I5di9TRkxlNFdRZk9YN3pVbW1YcDlmaFNlUzV2?=
 =?utf-8?B?WlFCeHo5anVFdDdhRzU4WVpVSEc5VllZTzUycW1aTHFtVnhmc201YVR5V2pw?=
 =?utf-8?B?SVBOeXUreW5GeExHVE9INkxPdmlINXVVaHZybzdyaXZoN2hFeFJDTmJVS0RY?=
 =?utf-8?B?YzNZKytrVU5SdnJPNzkvLysrSFMwcnBQWTN4MTA4WkZhZWE2V20xNVg1S0hi?=
 =?utf-8?B?aDdJd1A0cmc1YzRYTThvWW9iSnBjeGlqRzJmV0E2bEg0bUNhNitVbmc1YSt1?=
 =?utf-8?B?eVZrU1p3WDlmekd4T2crS004TmRXUG5UZE4vUkxpWHE2bEdUMlRxd2M0U2JX?=
 =?utf-8?B?b0o0bTIyL1p6Rk5uZmQxYVIzeXM2SDZJT0pBa0M5U0RXdUlVR1d0blBjYmp3?=
 =?utf-8?B?cWFPTGgwcHJwakc3SHI0TktxQVlhN3ZXUy9lZk9lRHpLV2Qvem41NG1LRlA4?=
 =?utf-8?B?WkFTSnFHVTVoQmVUcXpRejJFU0NGeVF2UTNDa09ISXFmY2I3djFWUDYwL2Vw?=
 =?utf-8?B?WTZrcXM3V1FRNjRZcmUyNkdBQUpaMlJveGcwV0xjL0d2Y3B5ak1lUlAxZFVY?=
 =?utf-8?B?QmR0UVRnRldZQTN0b2ZwL2lSUmJrZzlibUtkcU9PNjVOQnA1VG5NaDZVenJS?=
 =?utf-8?B?eU5uWEpVQTlYUi9IaHVnUThOaGJrdkNBdHZPSlVYUjFFcXo3SHhKOFFnZGdm?=
 =?utf-8?B?Rkkvbkd0cm9VWk5MWTBEc3RlZktzbWdDc25WMFQ0Zm9jTzlwTG8wbTBRMjQ4?=
 =?utf-8?B?TVhlZGZXSE5Vd3g4QTdvNTdjczRYODdwdGpJWHNaYlF0dnhIc0FyU1plN1NG?=
 =?utf-8?B?OWFyNm5vQVdkUDlPcDArNGxCRFNtQlhST2VST0NlUDhRVFFpYW8zTjhVajNa?=
 =?utf-8?B?cENCZEh5dEVEdER1R280NHlhYlpqWm9IVFBzYnVxYVBvZ2VqOTA2L3hXN2Vt?=
 =?utf-8?B?VExPTTdFekpwRHU5aDc5YXo4QjdRUzN6eUVVbUJETTlKVmJjNng1eDVSVVNj?=
 =?utf-8?B?SmxNVWJESEtsVU1CUWFjSzFwbS9EQnNlYkZkdUxPdFFYZ1R0L1JYdGhxZXZJ?=
 =?utf-8?B?OS9ZMXRHWXcrbFpyY0pFalNvRTMwaUNhZlQ5Tml0MDYyM0FlbWFJVmNsdmtY?=
 =?utf-8?B?YTNVbEIyV1VackhWOHIyOHFpY2Z6b0IzUFBWT2d3MldTRjc3ZGxxcjhwMldL?=
 =?utf-8?B?SU1qMzlCb3dqNTVDQ0s0elc2OGdBOGtPV0pLODZ0ZmNxUHpzcm9id1pkOENY?=
 =?utf-8?B?dW95eFJmczkzdzBmcTRYT3NycTArazM3VG1zTXZMc2d5YUtTdE4wOGVpd0h4?=
 =?utf-8?B?dUE9PQ==?=
Content-ID: <9E084B5C3EDCEA47A601D3BA8290DAF1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597e29d5-72a8-4d15-cb70-08da7af03419
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 16:48:51.0567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FH2aMhBLwYjkFlUM+Gv5JC1d514FBhfScX08258MMthuPIPF9y5eSJ61OXtkrukGt7hR96iDqzm/xQncATmQGUCBMbZRO9UycUB6PBwYxzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_094904_350027_B42FC7E6 
X-CRM114-Status: GOOD (  17.98  )
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

On 8/10/22 18:14, Sudip Mukherjee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Aug 10, 2022 at 9:06 AM <Tudor.Ambarus@microchip.com> wrote:
>>
>> On 8/9/22 23:14, Sudip Mukherjee wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> SFDP table of some flash chips do not advertise support of Quad Input
>>> Page Program even though it has support. Use fixup flags and add hardware
>>> cap for these chips.
>>>
> 
> <snip>
> 
>>> @@ -520,6 +521,7 @@ struct flash_info {
>>>         u8 fixup_flags;
>>>  #define SPI_NOR_4B_OPCODES             BIT(0)
>>>  #define SPI_NOR_IO_MODE_EN_VOLATILE    BIT(1)
>>> +#define SPI_NOR_QUAD_PP                        BIT(2)
>>
>> No, as I previously said, SPI_NOR_QUAD_PP should be declared as a
>> info->flags, not as info->fixup_flags.
> 
> Sorry, I was confused as info->fixup_flags says "it indicates support
> that can be discovered via SFDP ideally, but can not be discovered
> for this particular flash because the SFDP table that indicates this
> support is not defined by the flash."
> 
Right, I've just sent a patch addressing this, hopefully is clearer now.
Check it here:
https://lore.kernel.org/linux-mtd/20220810155924.1366072-1-tudor.ambarus@microchip.com/T/#u
> --
> Regards
> Sudip


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
