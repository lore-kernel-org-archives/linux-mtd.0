Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EBFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKLNAdOrrFdkXGZF3rt5tRwLXyY/E54rjbnscduoMJY=; b=Gn+24oYS9jPKXG
	vH2GjM50f+vJxoEM6wuGGsArhAuts44xtGWuSJrsPrxrt3f6WmWEUxb6j/ChYxPH0/NGSheiMrQmk
	hGq6MGMPUNoBJVy798Ses57/mQvVkdAntgXK7OWovjvgwDimau8hmc/edfwm+BrQ1o9fPaRkmtz13
	JTv0ReVwyrH4S/n3TDT6oB4Tn1cbbFD/BWPQuuoqwEC7+dDUVZ48CU/3yQW0lVbbxVY2Qx2PTIg+0
	cOzY6ZyHr6rZZaxc9MTQ2sgFeEvROf/ZHl1/+xbNr6v0o+bHAqBTkQW7rh5xYLWOzESKi2QRQxYN3
	5d2yD6ElFIYGdbkcJPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVdE-009lrl-HQ; Tue, 22 Feb 2022 13:55:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVdA-009lqU-JK
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 13:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645538104; x=1677074104;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uldgvdHXTnJZsKDLYASWNlXiCDLPAn6yccUPyf1zXoA=;
 b=Fh1Eiq18wyOqG+z8/YA8s+V9c9vTX/8PBMNftL0u2QrSjNaZUmRkIBUM
 1/3nf0cI0UjphSHlMYK/nQjGeVv/ktmc7nUX42h16ez154E+b7puZmPNR
 UfqOvkuGrVBU1Yt9BhgRhtPxPrFaOfAefaAcU3OzWgK+44IaqStDlvgpu
 hIZwsU5hLHYyELzaNoqcyL2x3lQO+PRFcyt6O7h6b1c8hHVFz6TUaRAMN
 U49jcIbAYF+nxDWe0lEPD2X8XU7k+3jcR7N09WeehPeK+STOxXdPmr8lO
 DD6gzgU7rHtWErBbaJKyWR9NtUdp069oYO/CW6yA9q1aMo16M+rxxB7P9 w==;
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="154431387"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Feb 2022 06:55:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 22 Feb 2022 06:55:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 22 Feb 2022 06:55:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiNmtGJFfhNpl9W5TqeII3IGH6WfGShUaA6rTRMwLVl//xj/QCVlecnG3LTEIkF5TkeXls+0B23CGjP3yx6lNkrusMk4/hfduZWZdHYPagk4BIL9JeKuDrziH9TcervNAz9zTzejc/6VFDP9U1kIv9WHsNyeOX4fuOLqD9NJaF9LA6LYS1vilpTbRKCfsWym7uYuuWXfiL3FKqFlWbOY+C3NSnzHoSjt75QRXHN4HJIGV4V2UptlzxEVChSv3mpyYsPUx9I4rSqDrGfzhrAgQc2pdkvEa6zeJE3h5FkprvLH2lAGMMVA2mTVWXWskMqfe+5iCrwRnyJRit+5OiwOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uldgvdHXTnJZsKDLYASWNlXiCDLPAn6yccUPyf1zXoA=;
 b=lYQF18umx6GCzYIveaJsk/zNqq1pVDNW8DOgo0YsN36HZPl030W3u9PRtWfNlDwXJp/gz3LdJxJxU3e8PXg6nSJBkbn22N6S7ILMBFUJlw/mPEO9bDSwY6Ecd+ISaRTCZMaViueqD4pVCaxtz7a7L/PyUovaCWoR2XVFt5GGo7VtwDftXXZL0KrqD+hPG2q55jsCBfa2a5a9qKcYv9LLsIfj1PuzAr7Oix85XGLuTaswo20zm0jPqs52RsZgdtjRzXbkZDo/2zW7aJTfeDg4qOGU9u/w/mxRJQ3bmvnW57/wjty7FrH51PK7yzdLgj8kQVdOf8q7mriAmWv6Sr80Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uldgvdHXTnJZsKDLYASWNlXiCDLPAn6yccUPyf1zXoA=;
 b=EXDg6DB7FEGGCy4ZirCBnSiglcXc3EVhp2zgwkEe2DYF/qGQCHAmj9wmeKLTJUFhStAp8JkbEKHvSW6/G3tFHwvvdpObEOM+buaqLL/f772ekMQaAMCyAeCqJtiHEho30bB5Tn73c6IgE/Ws52Aj1LN+EDwrEnWrxiqcYb20G6c=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB3355.namprd11.prod.outlook.com (2603:10b6:5:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 13:54:56 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%4]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 13:54:56 +0000
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
Date: Tue, 22 Feb 2022 13:54:56 +0000
Message-ID: <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
In-Reply-To: <44f655d027b49b87065915f6ba2744d2@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bea5d7c-8deb-4a24-9ff9-08d9f60ae89d
x-ms-traffictypediagnostic: DM6PR11MB3355:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3355B23CB37E390DC4CF999FF03B9@DM6PR11MB3355.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Of6xv/ba4ETF+ZBH43feUyVQGod6tKYLiQGOI/pLBC5s75X0twCGTgi3r5mlEKbgTRxzLccR90hQsfEqtGCu2BYdJl3nRNZd5jON2RtmHtY1lKTos0Sc9TrRWKwqdC1Mc4YdnxjOWhXX7v6rZF5ppck2sWb/J+6RSH8OkqLmXtwx4tl0zm+sC9IozN2270qlGfRLuMQ8SUyPizooElUB2H4GLBzLqnrtVrBRn0+JP1OZwi4AbYPrpL8xbU8iW8ZnjKzXVElcc+24EZLPxBWK9uyyr715JeDmh/y9FVQlCj4KSm1+535Fwcr3qwHv/JTJQEt9SexX0UgUUtElLg33hrme20os+McRxUvT/aLmm380UdPlQ4REHR6KsbjlogXO0TTS5hjYbhVQbEtE2+4wKp9ERsi3O/ywNStA99oJEPtUKDoNbjoSrj9I0LvVjBrl4woYbxbi4n06IwgQ1ybJVXspZQ/Zfm4qKVCl8v8cGRluOyp6COND6luWzAPg+shy4InpYzRFibm+W2EK1xEMH8yqWZC/+p7YtzI7scw3zgVrzReaX/jSMIsyTba62cEyfDmhK7e45DY8btSYy+2VAq5H/7cPMjPz148pJ8XplBChZY/FMPcatB1tDMiXLqg4xOnI1gUEe6bFrZneKQMdhfd10PoU3IovAT+lwHwZ0Z8ca1nsDvmWRFAudi1cVwtfeA/5+mWdqIGOtU5HTWMqQBWMXc0abSx9ODsT6OgjVliaZdWMVVR+i3dtEfCsYlYGTuX8eLD4OOEQuIV54a7t+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6506007)(2906002)(7416002)(6916009)(54906003)(53546011)(31686004)(8936002)(36756003)(5660300002)(91956017)(6486002)(2616005)(8676002)(38070700005)(4326008)(26005)(64756008)(66556008)(66946007)(66476007)(76116006)(66446008)(71200400001)(38100700002)(6512007)(86362001)(31696002)(316002)(186003)(508600001)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzZtUmhHdnZFQnRzRjVkalpLb0RMYkh0U1lnT2sxTjJtelN0MUh2SkJuYktt?=
 =?utf-8?B?V2ZJbFJqWE4xTmRxTmozUE03aGVBRTVac0JXdHk3c24zQWgvbS95b2JwRWlX?=
 =?utf-8?B?S3BEL0k0eW5wc2x0U0RIVDRqWWdqbGV3S1R3elRCVGxtcFRmSGVNQ2dhT2l3?=
 =?utf-8?B?RlBlamVxU05rUHdrSllZQ2MwR0tQS2JDcFdJK0pBcDhBUk1sb1pwalF3L2d1?=
 =?utf-8?B?S012WTBuR3BBdFRucHVHWm5UWWlObG9rLzU1OFhOQlJqMThFTTFjZU5FWDhl?=
 =?utf-8?B?U1AxNXBkekd4M1VIaDFJVzg0TFdLU2t1TnVCMUNxSU1Wd1lnM2dOQ29ZbVZn?=
 =?utf-8?B?ZjhzTTBWL3VLZDdWU0UvaTNNNEZkUFhEOWdYWVBhWEt1aVltTkNzTEVjY1V2?=
 =?utf-8?B?NWg0Q3l6WFNESnlKNDY5d2VGMVVhbng1SWtGSUxQOG82NjY4anBPNTVUOEpZ?=
 =?utf-8?B?bndhVDh6Yk1iQXZMSHJUUEE0VkpFNXdyN0VhbjRMbDhaMEJFZFBDV0ZtaVBN?=
 =?utf-8?B?UU12dlY4TXZtNmxVL3Q1MURDeG9RaW9Ba1owZjgrNG1HdkNNNGx0UTBTOVdh?=
 =?utf-8?B?dXhaZGRSaHl1WG5YS0NjTHlNVDN3Mm9FaWtzWTdTWkVMc3g5dFlxNGhWSlBT?=
 =?utf-8?B?bThUaWxncjc5a2I5UTlQVHVUR2N5NElGc2dkUjhLWTR5cGloVm9IaFNMYkdW?=
 =?utf-8?B?S3UrQVhLYlY5NnREQ2xReHhqRndmaFYvNlk0OE1ObU5HSjNPWWVIeHAxdmRO?=
 =?utf-8?B?RzNHRlVpanZ1UzMzT2w1M0hGUllWOG8wRnovQlJMNkg1VU9ZUHY1emlJZ05t?=
 =?utf-8?B?LzlmTjRPcUI2T0tCK2h3SjVsdlZONlNhUWRHNW1jK2JZMWZmdnExcHh1UFBu?=
 =?utf-8?B?SzhLVkJCeHFyOEwzeXBjNzgrYkVBT3F5K0UzaXhmbTd5dk5lRlcxU1RiaElD?=
 =?utf-8?B?UXQ1QWt5SHpkSUZ6aVZydGViU0dpN29ONUFHdDhBaWFvOTZWUzUxVGp3SHhh?=
 =?utf-8?B?VmZ3WEowd21pbUFMYlJlMUhBbS9DWlJwTTRWTlI3MU5vdm5VNGlBZkZ0QXdn?=
 =?utf-8?B?UUV5UCtyUlEwSi9MNjZtNG9FL3pPN0pKUEw4N2pzQ29TeGQ5RE8vbEhGZEgr?=
 =?utf-8?B?TkprSzJVSmxJc0ZoYnUvWGFkUWhRVEk1eWhyTUN6TXBNVXBLYmZKNVdyOUFJ?=
 =?utf-8?B?QldzajBJbHdjem5teWRuOTNRYkxwMVN4K0hBai8zUzgzNHE5NWtFTko4ZXpZ?=
 =?utf-8?B?ekFObHRMY3JNZFU2SG1TVUc5MkM3WXJqU1c2TS9pTlZOR1ROejNlTnRNZktj?=
 =?utf-8?B?cktRNVJ5KzVmc2tpWDNKdlpML003aHZGYjZTQSthWVFDR3VsVlJVeXNsTFlE?=
 =?utf-8?B?TldFN1h3cjRhOExpTEU3WjJ1L2M1QXRQdERTQnRNeHJlZ0V2WEl1UEVMT1Rz?=
 =?utf-8?B?d2xpaEtzQmZzb01TL0JVYy9HWG0rRFQreS9pSkxXOEN5Qy96MVpaSStmWUVJ?=
 =?utf-8?B?Nm1rU3RPWGdTSG14Mk9xbE9VMnd3M1RJUzdxMHBVY2dXczFUQ0ZZenBKWXVX?=
 =?utf-8?B?Z3RqTXM5aXhKSy9LSnZKSkZxZFl6bGV6Y0pIMXNRVUNUUzJUMzVZNG1uQUhj?=
 =?utf-8?B?T3V0SUs1eU4zbUlRVUVqdUhIS1krZVZpTElLdHhGM3d2bkVSdzAxbjZBbEMw?=
 =?utf-8?B?NTg0aUY2RCt4UFgwRHZKV2JiMUo2VzZnVTBLNzArSWQ1WXNWangzWldjekkz?=
 =?utf-8?B?UUVKWktuR0tLbnlNSkhvTDVZOGtZZWg0VldVU3YzVkJOYmowN0VWL2VmM3k0?=
 =?utf-8?B?MitkSVdXSHRtaDUvczArVnl6N05LN1dIOE03UitkOXNaTlQ2dzZJaHRBUjgr?=
 =?utf-8?B?UzcwVVNjWjZPNjRhVEZPcW9EdU1JQzZZbHZhVzYyUWlYUmRtQXM1ZGQzUFVV?=
 =?utf-8?B?OEs3RFh4M3ozejhKc0xjQ05tSkxiS2RxMHUzTm5ydmtBSm9FWEhWRENEbzMr?=
 =?utf-8?B?VGRxT2YrQSt1dDVwa01FbTNTVE9wZWRxaG9PaXd1M0tCSFlycHdid1RqeUkx?=
 =?utf-8?B?NWxoZFo1NW9mVGtWR3J5VEZwa3QvSmpUc0lDdlpqVTU3aTlaOVBzT1JBd0tI?=
 =?utf-8?B?U1NhS0p6R3lCL3U3YmhrcEd3aGo0MngxeU9PRUwyZXI0amQxWXNFdUhiV2pX?=
 =?utf-8?B?Ynd1dzF4UXFlRVJCSTY4eXZ3YVhBSUhDQkNjVmR1aFo0UDVTNEFYU0UzcEs1?=
 =?utf-8?B?YldRMm5FTGcxQ0wxeCtrdGozWGhRPT0=?=
Content-ID: <BD62D1DF1D201540BFF6FA2A981F3591@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bea5d7c-8deb-4a24-9ff9-08d9f60ae89d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 13:54:56.1591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 284d6/vAz09FuIbD7zFIQcems3q6NMLD+2YXFxXuIVMgXi0eN75vrKCOYSu1sA34vC1bWZK9Pzb3+F6wFC2Z2HfI3maMTuoKySMQSHFMu5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_055504_757902_CC19A8CE 
X-CRM114-Status: GOOD (  16.36  )
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

On 2/21/22 09:44, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>> Fortunately there are controllers
>> that can swap back the bytes at runtime, fixing the endiannesses.
>> Provide
>> a way for the upper layers to specify the byte order in DTR mode.
> 
> Are there any patches for the atmel-quadspi yet? What happens if

not public, but will publish them these days.

> the controller doesn't support it? Will there be a software fallback?

no need for a fallback, the controller can ignore op->data.dtr_bswap16 if
it can't swap bytes.

Here's the changes that enable this on atmel-quadspi:

Author: Tudor Ambarus <tudor.ambarus@microchip.com>
Date:   Thu Feb 17 10:48:10 2022 +0200

    spi: atmel-quadspi: Set endianness on 8D-8D-8D mode according to the flash requirements
    
    Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
    The byte order of 16-bit words is swapped when read or write written in
    8D-8D-8D mode compared to STR modes. Set the endianness flash requirements
    to avoid endianness problems during boot stages.
    
    Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index a4ba94ce84f1..c4a3963f7c84 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -697,6 +697,8 @@ static int atmel_qspi_sama7g5_set_cfg(struct atmel_qspi *aq,
                ifr |= QSPI_IFR_DDREN;
                if (op->cmd.dtr)
                        ifr |= QSPI_IFR_DDRCMDEN;
+               if (op->data.dtr_bswap16)
+                       ifr |= QSPI_IFR_END;
 
                ifr |= QSPI_IFR_DQSEN;
        }




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
