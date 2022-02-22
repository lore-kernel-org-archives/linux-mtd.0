Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A3EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+poXf7G9Id+4motKlyGiMQvUS2sxR/3ZG6/R25cTw7o=; b=qMFV+Hwn49vMcj
	nDxodDxtumdzjW+WSnNwVLqrAqwvIqCAa53qdWAbEkJbotTCGeah4PYftRlkyTxV1hmRN5bLQq/ZV
	BbY0uScZiQaw0PzoA2p1zK9nyxriN8xaJjBj+HuLtOyfNyGmw7ul++Pfshu1XNjHQIvDnjs2ftOJ4
	hIm6a/VH95x7RauT951150/jw4xIRgXhG6r+Itr6L9ZYnL7QMPMDxEibhtdaYGS62FD1+iHaB4zDa
	OUUgKDWGJsBtCtHd43dNL+7o7OrJekDdOOzTCj5+2s2jhFfJ8g60Wlf5fRoptihSlGElIFmxzqChB
	3AcK/8MkNEGzOwEwwsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWOX-009wsc-89; Tue, 22 Feb 2022 14:44:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWOS-009wra-2z
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 14:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645541036; x=1677077036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BiIUcmZms5YzefP5dxsNarqwke5Fx6b7WqYKEr99ynQ=;
 b=usgX3t7gxwp3jUlkY6ecooq+j9BG7fTetTO5Mp2yzfbrCURLQhOh7+5k
 oKFFkXzGRj3rj5feSHF7ltg8S71dsg8pwpLYaiZn2KDhSuuTHlx0oDGg9
 /uu868gW0YpcIb4NEZ+85DKE5AEukeutOvRlxR8zg77rHJPqrvDqoNK1g
 kaG2hudYorjsDAwMRYLdE8CVX6r1n9KMZMaLFxJcAd9KuJfGu1K65t3W7
 3O2Ne7SbCYCVTPiCRafXB+yCK6s1dpBG93LXpLWb6IR47lN3TwfxP7bOL
 ClYnWcZRzz3SPAdGJXWa3R41B+h3bTiNweZpCpA2mayxEwQAGBAJlV+9i Q==;
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="163157998"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Feb 2022 07:43:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 22 Feb 2022 07:43:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 22 Feb 2022 07:43:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1kzznL8CHeYJCvHjc9jbAD/FgDp7WX+ed25iiEaSUKhx19MgU5OppVX547lEaUxFrb9sFz2e3poNr2+HrSl4K/C3tTJNvK8miTUQRe08aLzMwYCM1yJpMFasip8K0LC5d+f0ipPtr6Rof7wVYez6etcYO8dUgca4M4oESyiS6t7uYstd681eP+cW8EIYr9RUdqrgUxMatl7GyKJpZFZgPF+1/jYAw5yq6ne6MolyEi1jCTmxdFMTiJaSvLb3rdZBH3ar/aJQKnwg/pd0rNcoO9BP5bV059PGn3tUFO1sexvZcDp4v703hbRobrjuFDsvmfSySItpr42f3kxplMWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiIUcmZms5YzefP5dxsNarqwke5Fx6b7WqYKEr99ynQ=;
 b=UoeGnwPgi7tw1WpsGYDQJQgZmHlr4lcXmog5uFtcjbL3Zlr9z9pZXwv15apB/DX/hVISMM8FMKqHbiOLB5hndb5IL9gl8x+smg8s22totcAsvqhgL5D3Mjx4Y76HLSm3iYmAgz91MrLuWuw0QUhbzxX9+8vtB8OSDNuPQdQJBRVLmV9KPGYTh1/hgIl6bzhj4beS44l6At99yWaas9J3wZRk+SXfmvLgSBpGjVnT2tNZih8dv6gjgbu4fVURLOAqotQSEJI1Dvf+9NKNgRdczCZBI+Ah/7lXPDDMFdCry8opFTtYBZuwibJKDUfiSA1VH9ksw1WifiWseKk81S5lLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiIUcmZms5YzefP5dxsNarqwke5Fx6b7WqYKEr99ynQ=;
 b=YHwtw5DOnDuYMEvOmppzkUGJnrzTSXpNhwKVVge6ohsq2TipbQXZ5rGQikRQGmBxRSLVlIhOqdNO4K4k/QquehJMnAmETSI1cWllg74AG2/u6N/6QfN+4l/ghuAvN/buwGYRa//XevWRbhPOa987cU/lVJaphzaVgst2S12A7oM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2960.namprd11.prod.outlook.com (2603:10b6:805:d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 14:43:49 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:43:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/Dw==
Date: Tue, 22 Feb 2022 14:43:48 +0000
Message-ID: <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
In-Reply-To: <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f283ad0-530c-4213-246f-08d9f611bc9f
x-ms-traffictypediagnostic: SN6PR11MB2960:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2960B978F5B76CF5515C80FAF03B9@SN6PR11MB2960.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /HHkAMVm5eh6Dlsez8OpPbIYBEjjbMwmIUnWRJjrumWUULx3Z8/bldAj13xXcZbLg/69BFds0QmwXHw8vouG6GbidGH5RkF2ZpPVkFB27PYtbbui15E8irJ9VNUXr+GtycVCIFyUOjtnKo4GXMvwjAWzE2S0zuuTcQ6nbeODubAwRxDKsOeeVILxYJOLCmnsjYUCZZ3ptSv0HS8YSYEs8q5s7KEf8KTSM2rlwhjqclGejJnYWt0nymZ4gOr5erfhAnm3qMQuMmVLA3XUsckXtMN3YMHfuT9PxQVyCSRg6c6IbwBDl7O/PtLe5kYZ1uI6S9DlKb4/OLJA/7tcT1RLAKv/axTGOlsVuA3kiNPyAQZaKUm3GPJpKEofFvh1gnh3troxI9PcdJwoAzUfeQ44Hr9bax7kcLFuwk4JxCobbVbu+jyUlQbZI7o+GZQqnOqFRLDIYHBiEpIT1tf0yVb6L0gqm4AIe1j7kcQS73y2n8vRY8jftEQ7AjhU/3FsdcPmgVknrOHnNaRzdXK12nZ/fB4MTz0HIGzbPZqsdDFzYOBV0G4nSKGlZXynvE/brcILReTQ2yp1G6kcyeApBFeqRt1ZIfarc6u73rDqTHLJnMOAVPRE7stRae47m4qVJH+49W9IHF7nRrxtOqSt0MDP5UA6RRx+8nhHdeNKEnsOeof7+F7tWb8TZqJ/XUQdalzV6h0tBpZz0O8WZJoCD0EHAECBhRnn/YVECbTbecp4CZe6mHPUAn0VL2l6MzLJyqWVnHt1Pf2VOya5WBHgMC3Cyg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(91956017)(76116006)(6506007)(31686004)(122000001)(53546011)(508600001)(26005)(7416002)(6486002)(186003)(71200400001)(5660300002)(86362001)(31696002)(2616005)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(38070700005)(38100700002)(2906002)(54906003)(6916009)(83380400001)(6512007)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bExNdmZUNDk0dkVqdldBM2dRL1dGaHJmTHphem1FZENFcEFaTnpNRFdXRElj?=
 =?utf-8?B?VE82ZkdUWGI3QkY0QnJkcUt5aTN4dmd4aEYzOXdhcEFiSnNVdm11WjNHekdD?=
 =?utf-8?B?SEp4bWpGNGtYR3FHWW1RSHRkUVZPbjVWaUxKQTFzWVRlQTFRV3NKdnJQZkhW?=
 =?utf-8?B?am5sM1d1MWR4N3RRS0RKMW9veXlDYlNoMUhYUXp5VjNza1F0QjVlczJFRkp1?=
 =?utf-8?B?UHpFM0pJMXZWM1p3RkprVGNZSE1DQ3VyVXFpdEN5Z2Z0V0hRN0s2b3lHMHlS?=
 =?utf-8?B?YVRpOW5oTU9YSW5pM2wyQ0NFTEs1dkM2dFUrTmlKVzFVK0xpU0Izd05XaW52?=
 =?utf-8?B?dE5wRSsyQ3g2VVNraHlUTkhUR2pOTzBSRURrbkpYUmVxNGxBNnorSTNZNko1?=
 =?utf-8?B?NG9SNnU1dkppWHJDdnFlemdOSURCQmErTUM1aWpXZjdvc0pleFgvSXozOFZZ?=
 =?utf-8?B?R2xJNWlUSkhza2UvWWVudXlZbEhUMEV5UENBbzc3U0Q0THdtZTI5Ry9mQThZ?=
 =?utf-8?B?WWxFbWQrdkFDTy9qd2k2RlFVRGhkVXpEb2NVNzlPZ0xYcnFWWXpGUlRoaVRB?=
 =?utf-8?B?NDVFYUhXWFlEMmY1TWRWV1Fua2E5YkVJbzZpV0NpUnA0cUhNQzhmNzlsWlYv?=
 =?utf-8?B?dHFsYnBwT2dnVzZoaUIyNys3dzV4SDNxZkE0NU5uYmd6bWZHV1lCdmVNdEts?=
 =?utf-8?B?NzY0MGNUejZDbEtjU00wWEc2b0pjMEdValdHaWU4b0grTVpWSFc2MlJYQnh2?=
 =?utf-8?B?VTM5RENTazU5RzJ5ODhkZlZQdS9ZcG5adUJENXRRN3pWMzFiYXl5V0VUMi9q?=
 =?utf-8?B?QmswOTFKZkFlRmpqZTlvRVM4cmlhaTNxbytDUzQwY2JqOHRWeVBDV0FxUFlZ?=
 =?utf-8?B?NmE5Q2pqUkFNNUZaeEhKaEhzSWtkN2dsTlp5NVpEVlo5U2VVOXhsdDFtRmMz?=
 =?utf-8?B?YWFKNVRRaDRDQW1WeEpOQTlma3dxUVVRaUtWbWpMdW5nZXlVelZzWXQ4NU05?=
 =?utf-8?B?aGR0bjdqMUtyVThsK0FOVUM0QXpTY3hVd0lCTE43ZnR2OUppT0hwSlAxZlo1?=
 =?utf-8?B?NXppNVR2TGJLYnQydkNyNkVvMHZoYWJ2YU1mV04vWW9UcWl3cWhHYTkzMitz?=
 =?utf-8?B?T3htTHdEUEVlTzl1MGExME4ySkh3amVWL0pCVlY1UHQ2dHVBZWxvNExDc3py?=
 =?utf-8?B?Uk5CemdFanJCZzVRT212VFVXYmZpZHFtU2JSY2F6aEJkV1U1WFRCMncyV2tp?=
 =?utf-8?B?NUF2UVA0bVJxS0ZtUUZUUXRPNnhKVGtDbms4OVJwQTM2ckdzZkF3aGhsa3JH?=
 =?utf-8?B?OUlVOUE2dGlFTDVuNFpoVDR1NjFnbVFJRlZTRHI0N0VLbXN0RFowZ29ObEhK?=
 =?utf-8?B?WCtKRFJhelg5NjdyZWp5UFo3QVpUdnpJUEh0NDkxai93N1V3b3o3NVpyUDNQ?=
 =?utf-8?B?WWxJcG94U1pKdy9MZEsxTk52STBNN3N0eVRWYnFPb3lYb2tHc3dWaVdBU3Zi?=
 =?utf-8?B?WEVSaDBWY2d6cjcrV3NyMlZac0ZpTlpJOVNQQURuRzZtcG9ScUJYWk5Ca2xq?=
 =?utf-8?B?NzNQdnFnQlNCcDJUbWI4b3N2WHhiUEd1UW9acGc5OWZsRWkvbXRrQkwxOEw5?=
 =?utf-8?B?dUNuc2M0UVRKMTZPdkozRVhEcUw0eUxJTGFWOUt4eThMd25kSkwvcnhoU0ZH?=
 =?utf-8?B?ZlpFZ2NUb204djlmcllWVHZ5dks4MFlTRnhqeU9Xb3lyS2FpWXROeFdBaEZj?=
 =?utf-8?B?VlI0aE1selZMYVloQzRVdmhhOTRkTytXY04wMXA4KzRqMkZxMnVQNWZRcU5V?=
 =?utf-8?B?NCsrT0l0Ky9sdFFLa29zU2VDWXVaSzZtclBEV1pvdUU4ZmxJUUFPVXhldjNL?=
 =?utf-8?B?VUo5SXlUZ2NjM3JVQUN6TmZkUXAvSml1TDdLcWdKK2VOMmFYZjZ0Q0IrYUxE?=
 =?utf-8?B?YS8raTJCZ29CdStkd0FlU2pyNEdPZE5VQlhabVhhRVpNcW5rQ0pucDhQVlFK?=
 =?utf-8?B?aTlwWWNVbDVRL2dXUm5BZCtHYTJQczB4TStGcnJrTzZtRldTZUxoRDhCTTRQ?=
 =?utf-8?B?LzJHUEdHWlNOKzNJVW1EV01YUE0zNUlTWE53Vnd1emR2Vlh0WlFnRFM2YUUv?=
 =?utf-8?B?UXgrTlNRNXpBa0FQd090U08vdnpjbmh2NlVkSWwwV1VOdUlueEMzVXFnMUt1?=
 =?utf-8?B?aWZidUE3RTFOcjMzc0x5QWZFRCtJWkw0VGtLMk40a29BWjZBY1kya0U2M1ht?=
 =?utf-8?B?OHc0SVlNMkVQVXhYTWRKK2diVnJRPT0=?=
Content-ID: <2453CBA63CFBF441AF1AF8BB9B8E66E9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f283ad0-530c-4213-246f-08d9f611bc9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 14:43:48.8434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+WlTUpG1M3CBY7L/tW2Aa9FIjrq+z6C7ZDek/W82IDgFTbQOQuOu5kfvBrRbIRmWo7Dr4vEvCRbVG9X+M0gDh0Q8SvAqnW9hidBI13peJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_064356_169518_8E89417B 
X-CRM114-Status: GOOD (  19.03  )
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

On 2/22/22 16:27, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
>> On 2/22/22 16:13, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>>> On 2/21/22 09:44, Michael Walle wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>> know
>>>>> the content is safe
>>>>>
>>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>>>> Fortunately there are controllers
>>>>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>>>>> Provide
>>>>>> a way for the upper layers to specify the byte order in DTR mode.
>>>>>
>>>>> Are there any patches for the atmel-quadspi yet? What happens if
>>>>
>>>> not public, but will publish them these days.
>>>>
>>>>> the controller doesn't support it? Will there be a software
>>>>> fallback?
>>>>
>>>> no need for a fallback, the controller can ignore
>>>> op->data.dtr_bswap16
>>>> if
>>>> it can't swap bytes.
>>>
>>> I don't understand. If the controller doesn't swap the 16bit values,
>>> you will read the wrong content, no?
>>>
>>
>> In linux no, because macronix swaps bytes on a 2 byte boundary both on
>> reads and on page program. The problem is when you mix 8D-8D-8D mode
>> and
>> 1-1-1 mode along the boot stages. Let's assume you write all boot
>> binaries
>> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when
>> u-boot
>> will try to get the kernel it will fail, as the flash swaps the bytes
>> compared
>> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1
>> mode and
>> when reaching u-boot you will read D1 D0 D3 D2 and it will mess the
>> kernel image.
> 
> But you have to consider also 3rd parties, like an external programmer
> or

Why? If you use the same mode when reading and writing, everything is fine.
I'm not sure what's your suggestion here.

> another OS. So, there has to be *one correct* way of writing/reading
> these
> bytes.
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
