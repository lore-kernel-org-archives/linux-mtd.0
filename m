Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E3C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:54:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801B065141
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801B065141
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nsnXTcLM9NEdWLQUGE5G0DZpBBb/1PUUi7YmduxG7aY=; b=IByN1EuSehdGn1tclb2MeBOU+
	AyZRU2RAi+9Po54iBIkTLMWZC0cPDwQ0+53af/E5QVMwVFdikFd4pot3OCL1LqvJao9PdbBaDEhjq
	/44bBr0tR3/eilC6Z/305qwnXCkWGuOjgp24sF2aiSkeVvpZv7wKrM9n24qe5bLDn3I4DsonI8AV9
	5AokalaNAbFtS9IT4dZuFpgDVYj3glrCV4ra+eTlLCCPcOoQ0OsTKQCkcUkm0cnDc16CpNKRRmYeK
	fb1BmBSLLzrYaZsMZYTbWsK0HWF0W5vDFCgMY8swwUSLSxAImDSnAFEkaUkCyLnd4DW8ydRhBUpJe
	0u6fDyPqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8pf-00FMuT-Dh; Mon, 08 Mar 2021 05:53:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8mw-00FLuf-3j
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615182642; x=1646718642;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YlrqTLrcFvcHLbqeJL1Kfpt5W7t02xaP6nyWhU0kYTI=;
 b=CMCvnnuwInm+IHriu/uEegGUiOvPVhYK/IJHGmY5QbpSX12zCYcLuJi7
 NpXNjfhtBVD330dzoYFkv9M+FdOANCvEeUObpnBJpMtnmJDGpt6ZmkvQa
 YmDMN0WnczlLTqsUTn1E0tLz/ia3oAL0wtjhIM3EnLYWS6y0UpAGkNhxY
 Kih5KvhO4Wo3Xe5SJ/Rd7U7pKXo1txIFkEgpI1bbdyPS2e0IMLwI/ZUnE
 Zo7HmYPof84vLmexz9MQW4VS0JTa/5mmrwKMwgQvmWz2Pt/3VC3ay8nKu
 a7ZqRU0qqyripgPzH5ZvT65FgQ02xyzcuiugwJZU0RHQOFPomnaf8jskU g==;
IronPort-SDR: zYxPCK0+n+kX1cRRecT4ePm7Vgx3SFt+s4ShsoUcZD1vxTtwHwIdejinz0Ap7i90i9xancT8Lk
 v1Y9hK07cSGhxGgBf1orMKIcw/dqPXs3QSB91QQwwTYqSy5Mn9NydMmn2qrubBqO+PTJ5gThvO
 jLSRBenJNXpku5xs0NIFHWw7nDbaSTmWgsaRMzOz+lqHOBOU9uCywcLxTnAyZBZAzJ5qB1x4/7
 3Lq9aQEspZ5LbSOqYrU2XzlCKwOZuz+TgRT9LPUoArhX/EpQrsqiJ+jVtfbqb/3TQX4UNqpHMg
 Pw4=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="46617482"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 22:50:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 22:50:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 7 Mar 2021 22:50:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBQVnVMk9eT2kBN0vWwI6C5WbptYzUD8jYQWoFXMxdmr6uqyCorNlOwJADIVlZf9ktyb68/bkRKzn2sBy0lG9ZSPhd8l8YtHn3pK73zGlOFzp/QVcbeJxxpUsKB+c5p0QDtOVT1uO6r3fAGcLEocTAUxF3OhV3m7sGmjf5c+oBs+U1nptEmP+TwBF2V1Knf6MNQIX8/wgcWgrwrhu7kstEjdaDDtW268uWJXVzgZA0+Qyvlw5im2j1EDuuWM+d9tLEm/opVFD2C2um3XTto6Nxcl2UnYvk3fK8jxcbUCvRf3fyN09CN/JBp/T/n5EqTNMyk3jXhT/NBcvuQywiHIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlrqTLrcFvcHLbqeJL1Kfpt5W7t02xaP6nyWhU0kYTI=;
 b=Ai/PKkviebSBjl5/koemBFr9gkT7f+q7JqBH2tqCN6Hh+sl1X5AMQ7NTFA34B4Pfd+yrFaK3rAU6j1vOGMTFuaNsM0aXBvLEWCI+qddm7fB3iU7FKhS4fwZ0vXTZXqC6T5Er/PlS6WfLmqEeQqlyfq+ICZUTjOu9y7VH/oiRKdIxFDRgvJUfnLJ7MDhEyNmEicqO8GZ2CX/iAaLEiLXL/fzWJAiGJcV9SmexQXMYi9MKKEgwn71zRbIsBGRgRXEstgjok0WlLCTyulo9VYutTMm5FqzisbkpXpLnGUzbKgWgSNkdnd+dpTPhCxyf2oZzvg4p73K7dik02HrsrDKS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlrqTLrcFvcHLbqeJL1Kfpt5W7t02xaP6nyWhU0kYTI=;
 b=EbPwkiDesPCE+mTyPS5UvVK5yY0/7BZOxnshS5uxf3FSJvG/AMJFH1tO0549quY8xEQVSHbkFRlC4YplYjsAkkF7NX/Jg7MMISJIrXfzSS8Qf6Jq2Do3OiBbvqEBJkpTw6g3TzjiokbSUmE3uBaUprf6uG6KGaWloiq5m8AnPbA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3535.namprd11.prod.outlook.com (2603:10b6:805:ce::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 05:50:34 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 05:50:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <linux-mtd@lists.infradead.org>,
 <shuhao.mai.1990@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Thread-Topic: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
Thread-Index: AQHXE9708tl+X2dVKU+02sdf6v2vAA==
Date: Mon, 8 Mar 2021 05:50:34 +0000
Message-ID: <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
References: <20210213151047.11700-1-mail@david-bauer.net>
In-Reply-To: <20210213151047.11700-1-mail@david-bauer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: david-bauer.net; dkim=none (message not signed)
 header.d=none;david-bauer.net; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ded4eb8-3c18-4ce3-5ba6-08d8e1f61758
x-ms-traffictypediagnostic: SN6PR11MB3535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB35351DBDFC3A9DBED914EB4CF0939@SN6PR11MB3535.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RgIkTfpTn/9/T2uZ1+EUeEkn2YqsmmDDUjcFKTZzYE290bI5wf0DLedXZZ6Y+f5l1CFqOrlWCPxXmPR/InI6OGhvNB1tFhvjI72FGCQ3f63dtXqwqLuzGwJSo6w5tHWuuoUpXabA+SQ8NGdSnbIunZ49DH4wNqI1MbIiAbg4ugf6SMOAqhAfOfeyjT2lYbkEgRsZfa61INtz1xZCLQfyMJB/lNTi9QcOfrAWqagKM9GEKa2YNi7UN0aUgvkJgR7WWWnHn4K1EHwu5s7CHqju7jKtoh9WjIiXWu3LyKWWtoYoFzftGdC4qLqicm8Q0D8maYg3arruG0WTbX0gbc0yg/QesWlRDJJmbpI4ahI1q5YRdtluzGj/yvq+uq1gNDv0m216zhAtlN+fNy276pBvWRmxYazsUynKrGRJL6YhmAFjzSyDnvdPKRW4g9uUoWTe1KCoabpDKc4DVocR5TkTcgeeOZ0mFcAwD65kb6bAU7YAajvKzEKh+h7OWRn7b8sQYOV/DZWmnkO4hSJEXwg6qR7gj3Pj0/IOsIymlyo2cxKC/eKjE1RALWqPMgPvl3YsQfKipyejJaVWxXCYE9i/axmAtcMdjrY/VQYKIPJWrm/n5GAJlcCAINEk7YU6ZqoCMv6VvXw9Yq0AHVCUNZ+bXjdPKRLN6MJwKitIJwlv/c3gxe33FVyuyQMbEusW9dh2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(39860400002)(136003)(26005)(2616005)(86362001)(8676002)(8936002)(186003)(66946007)(66556008)(64756008)(6506007)(2906002)(36756003)(53546011)(110136005)(316002)(31686004)(76116006)(54906003)(83380400001)(66476007)(31696002)(966005)(71200400001)(5660300002)(6486002)(478600001)(4326008)(66446008)(6512007)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QWJDZnZFS2VIZURmTldCY255QWdxV1pmSTQ4RDIzVE8yQXU4RHdxdUNqb1No?=
 =?utf-8?B?YStLSkhSQmlyMFJNcm1mdHo2U3lLSGdpYVBQa0xpcEphWmV6eWFZN291aWxT?=
 =?utf-8?B?OWNvcjkzTUR5dHdMaWNsbGU2S004VS8zWi90MThqZk8vQlRyVDEzNC90d1Nt?=
 =?utf-8?B?clcrWmttOFFsU3ZUQUFHR0EvU0VZbFhBdkdEMjVOakt0L3pvWUdRblB0YzRC?=
 =?utf-8?B?Y2RtSFZua0wzRnZmNWFURGtCTmF0WUZvVFJWS3JBdFdPQkV1ZXA4VW5vajBw?=
 =?utf-8?B?NzhaM2ZUSFVEbkxsUXBJRU5LVVpOaXBUeXNPUmdQSTJqNm44Vi9CQkd5Z3E0?=
 =?utf-8?B?Si9QTTNEc2ZDMTFFRVhvM3ZCR1NRc0w5Z3U3czNMQ3RyZUxMYWkrTjhHaDFp?=
 =?utf-8?B?SUpEdFdXek1lUW5veC80LzZHcGFtSWFFRkVlNVRPVHlIeUd5RThXU3dkSEta?=
 =?utf-8?B?d2hDSE9FYWVNWTBHSm81RmFtT21HUSs2NTM0dXp4QWl3Q3VuSmFDVW5CS3FS?=
 =?utf-8?B?NzhNa1VFdHBNMGlRcjAzZjFNSFcvSGRVNTlGeU9aeTkxQTV6UDA4S1Nzbldu?=
 =?utf-8?B?TGFFR1E3OWk2UktldGwwWUJsaWFwQnl0NGZlTkdmMnBYNjZlb1h5bWo5S0dl?=
 =?utf-8?B?K0pzay9OcVBqZzFZOVZrS29ZSng4b0RYakRnNkUxMmgyL2dlTHFKTjJuZm9V?=
 =?utf-8?B?Sm45c01taW1jR1BnTTVYMkJuWXNsQ3U1dG82VEI4UXBRbXBIclh0cDRBQXpW?=
 =?utf-8?B?UVRNVHVTV2pjVlhMc0Z5MDd4enJMQ2F2RFRTand5aktrWS92Z2V2SmlmdU1H?=
 =?utf-8?B?UWUxQjY0ZjhVNFVldGNDSEJiQnhDUFZNemU4cDBBcElkNFhYcXZkVzlGTnE4?=
 =?utf-8?B?Q25KYU9CTHVORHpITHRpcTJDeVY4N0UxZnR0UlZmVFBmTk9rSy9UbWh2YzVL?=
 =?utf-8?B?aTM0YW04dEt2eG9RUHFJc3kwKy9OR1Q2cU9TU29rNWVTbUlzdVNBWDhlNFpy?=
 =?utf-8?B?Wi9QbmNZYUVnK0VoK3BEOFFOYUh2TW93MWhiQkRrVjNtV0hYMEE4TWpRa3A2?=
 =?utf-8?B?d2FmeDNObzRTT3BwUkpMUGM2N2QvQ1ZpdWhmUHJ5Y1BvaEhCdWRyYVlzWVJ4?=
 =?utf-8?B?ak5OYk0ya3U4NXduL3pjRElCbWlhVUpTVmxKVGxpSmx2QWdXS2V0VDh0L0do?=
 =?utf-8?B?WFovbjR3dkNOcThzRW5GcFhDWVVPaHBmMkRFRVVwR3ZJWWRJRVhGY3lzWkhC?=
 =?utf-8?B?dk43aXdwUzZMcytrT3NvcjhNUHhzVlV0bG1oNEhCK3NxTTdMVFVYOVl0Q1pS?=
 =?utf-8?B?R3dMckxJcXdFWXhaS0tQaURnOFVGTEIzRmVueFZ0VDBCWGJRRytzU2tsWWlj?=
 =?utf-8?B?UTN5UWpDNmFmcEg2eHd1TUJZa3lybTdveE5PUnZiSFNCMy9hbXZ2VitYU3FS?=
 =?utf-8?B?Nm1JQ3ZXcmlQK0U4M3ltQ1hScnNZMjZSM0lsbzU1bkJoNHc0ZEtaSFQyNmJy?=
 =?utf-8?B?RHVJbjlNWGdGZ2pNcCtTdmtHbjB5dkNZT2k4WDRQb0FpSzBlekN0WG80ODBE?=
 =?utf-8?B?ZTFZczlScFJLSzA4MFk1a1NvaFB2T0JvUVFZQVJIL0dtVW94WnhlU0d1alpC?=
 =?utf-8?B?Z29NZlo1dWNKcnlrcUlPNmlqalQwMTM1SnJ6OEVmb0FGTUY1MFppOUQ3RG4y?=
 =?utf-8?B?bWR4ZVl4aTBsbmVNRUR5cndIc2l0dnIvd3lodFl4MFMwaXdRSjU1R2tlRUw5?=
 =?utf-8?Q?Wr0xC/XZ/0ETrLaO18=3D?=
Content-ID: <3802838FCA9D804DA486B14899156A80@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ded4eb8-3c18-4ce3-5ba6-08d8e1f61758
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2021 05:50:34.1491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30nGZvV9NVLFHR4D1LLZc8vBa1q5K9Jd62AI14+NJo6Qr4DXbgBmgrEqYsRAIGhzNX9xX0RP4EbQFgTELFRjj61FnOIp8SK36u68sY8RWUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_055043_393575_9C8A5475 
X-CRM114-Status: GOOD (  19.31  )
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

On 2/13/21 5:10 PM, David Bauer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
> sectors as well as block protection and Dual-/Quad-read.
> 
> Tested on: Ubiquiti UniFi 6 LR
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

David, I'll take Shuhao's patch because he sent it first:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/

Would you make an incremental patch on top op Shuhao's, to add the
locking support?

Shuhao, can you please test the locking ops with mtd-utils?


> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index e5dfa786f190..49d0d7993368 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -95,6 +95,10 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +       { "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024,
> +                           SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ |
> +                           SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
> +                           SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },

Looks good. Let's put these flags in some king of order:

SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
SPI_NOR_4BIT_BP

Cheers,
ta


>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  };
> --
> 2.30.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
