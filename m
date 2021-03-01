Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55F7C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 15:26:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42060614A5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 15:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42060614A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xoDZNU8UWTSYaE3XKGv8/rSHrK0a190QZsPSbEH10KA=; b=toc2I8s1FfcYR/Hg6ssbbGt64
	XbhwFPPYlwcuCQEOKO8sE07fTyXKeUc3dRbSH+NNC+KRxArLXuaJKoO+VNwAdocIVwgcRLrJ4hNWy
	Fv/cc52DpxCB9DgeTYPKKThSu4EINJGrzTQpjV1DeESXkXVnF3nxWBMyyTs87oMkEnUvpYwGzcjeC
	5vMcUwJUnqubpMKJLTRTjnMQ5Ia/IzgWnHzVs6mR948rQrYO4/eqEsV0eGiBFu8nzo0LxI4HnJOhP
	jJlY0/4gG5NQGxxDUm3zVwlTYpPrtGwUmulyC+yZ2Cb+wspmbcqed8vX8tESfUGU3F/H2/0KvAh8Y
	AYw8X74oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGkQh-0003UL-0i; Mon, 01 Mar 2021 15:25:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGkQe-0003TX-4g
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 15:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614612348; x=1646148348;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lO0ABQfIvXZTEv13PAcDOlzByk2haxRusvZkB8fEgSE=;
 b=JM8+jZo2hifJq0VPvK6YDi4Wdku0kMHCpc7/PMBLl1VJma0w0t9wI2SR
 t3w9jM+Y//M8WbHgOKnD/j9Dm/QoBWX3WLc1xrXkGpw9ZUd9vGNd3UF3f
 1dIYP7DANKo5QodPHcYwizf7j/4uv1vydDWT9jFATnF19lEluN3BE/21/
 fjNGXe6Qxp4H0OX8zlPpSktUNVF4NVe9iHSs7W67JyqkZjfcgd6xYg1F+
 G53QMUBWmPbu6JtO9eZFr+eGA/OZsxDtHJEA4ycn805gxuS+1Xirg621j
 yIvfRqbLJwR6n7AqfiT7Mb/bR/C/71IQIo8pWkxFnzE/BdhRgm6aQOLNW w==;
IronPort-SDR: IHXmym9EQuvfw87HkYI8StPA1kAFsOF7y3uoWodE1M3xRGgA27ErMfOh4YtUNPwvXf1JlELQ2B
 ax54UGhb4snfszblqGyhl04IeRy0tlaht8O5V3p5F/1yVO7jLX4HCp/kAtVe9HhlLo9t19xhUw
 gna2s7zxK0ru6pSXpUGlxBHoaY7I6SoPGXv37BU0eUyEGJvG/vXf4y9YDxlFGlI+haWpLaALZK
 2/ju7LN8TwPLcCXPn4UvkFvwLvNNqPQJqCsmIngQH42aBTJUbwwP2OCNe6jeN3csvRVTieLZLo
 BJc=
X-IronPort-AV: E=Sophos;i="5.81,215,1610434800"; d="scan'208";a="111497866"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2021 08:25:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 08:25:44 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 1 Mar 2021 08:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJe+brE/MKZ1ViTHdj1CRHXtnDbwx9Zk3Q3imIw3s7lIKhWTH/RoWMvfoY7hNcaYc3Y65jHen2q4yGLhZNE8U9h3LqVUWQU15zG56Dsfb6xeN3NofQH9ITtJorRz/W2OSBESCoKl9fp8tqEztjkqNXnfSDP7b09lV6psyibOm1+uQXnxkjvitS4Zsahk43qpTpAZdfIenokg30VHAry04cvb0XdFIbwZD0ZDkXLAMGxzfol9Sd27LkaLU8N6Ynua60ejbIusrZFpEBeDQyhbcRP546xcKOWQconi012PzH+bP1NxZV5zI9/MaoxgIdtQ4fiUeW1w23qxP1R9BXfVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO0ABQfIvXZTEv13PAcDOlzByk2haxRusvZkB8fEgSE=;
 b=b0uryoKMES1rgHtX80OrOYKmJXOIn2+EwitERvXYcF3DNzsauaaDwRrRp6bKpVMczk57M0OGj3lzUNAAy9KP3gqV4nksbl+klwsydfM/dyeNrMbooGb8yzTljl9XvRnTxxb+F0tceqsDJgSnxUaiO2iDuJju4Jh9OGz1IGcGNYDkfShh1R+d+IcFjHb9VHCF5h6n+UWkGmWIGk5A7KzP1D2a1RhEj7chYE243ICjNsdbV+l2eTrv7kfLsGSBncaBtXKmYDVWsOIw4uyotdIrV2P7BX2wH/7pOKrelUDSBdS5vtUQo2Qv4H9uPFAMRfu564FvVTJhDUHHYSAUKvS1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lO0ABQfIvXZTEv13PAcDOlzByk2haxRusvZkB8fEgSE=;
 b=VbRyidee3HlrPrYFuOODZJBXOt6dP175ylfVFcy01JrOGV3QlrCM/Hck82RGf5PMtPCZ8cdGtO1+4cOy+HmjEGzLyQgzX5HSxdZ5pTtmeRWTjlGaJw/keen0oTQfxpLAgyo5T6ZgFfmaGRe1QETNZhSmpeUyU0Dtof4ibbe/zEc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 15:25:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 15:25:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Mon, 1 Mar 2021 15:25:42 +0000
Message-ID: <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
In-Reply-To: <729a56daea261808db672472e47d8c20@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d48dcf26-6dc3-4aee-d43e-08d8dcc646f1
x-ms-traffictypediagnostic: SA2PR11MB5131:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB51318CB6146E532DBD8E1AF2F09A9@SA2PR11MB5131.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k1jKbkuq7+T50cvaIDX6Kcdk68XNHKTFEiX20gDfbMsCMkiTGCUcF4goM1ciPiaoyjZS7GjKAll1yhWQGywnCBJLmcAey/0x+Z0ezV1GC6I9RpRzayX0WqlIQTPQY/Ao68VEhl145sx+1loew4GrBKT08E6nB7WCR5KVx7S0DwZMQ7yEC1TefdXHZsuXFFgWmDoMnq61c3/aqI/PJ675I22yNqsIAFF0pOPGMenOvSRpfs+CKjs7pyyVdpCm0+Klyhu6svcLof+jTvKf2V9Fh2QylpVt0R1OSYRJhJomKbwqXLJ0NnJyogoq/F2A987Xb9CNKjiYUc4yfDMzX2MCzGbVHuehHPOlDo6aUvdhafI75Kh8sJETS2C5zNhC0fTjQ1sfIdbe5kOFWIHqh3APBMIalaN4qj6wCPSGyAnKlCt6mS7etClsGPYnXSfWbxK9QeoSDPmAj0IeH0Zmf68d1bXeJ6Tek1JXDcJYKGJx+ycYaEOTcv4/I+kUZCc1AEuYPtP/R6RtXdPaIZNdHJL4XTt9Ph535qnPySGHHRlKPRZ6TKjQQqqQepQwkd7l9VQRlbZo5m02aPa2jy2Q7uabv2vT0eE6Q/3QEERJJbTsVfI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(8936002)(8676002)(6916009)(2906002)(2616005)(5660300002)(71200400001)(6512007)(4326008)(186003)(6486002)(26005)(54906003)(76116006)(91956017)(31686004)(36756003)(316002)(66946007)(31696002)(86362001)(66446008)(64756008)(66476007)(66556008)(6506007)(53546011)(83380400001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eWhCaXp1NlkrNFNXTGMwUGd1cDA4Unhwejg5MFlybFB0V2ZzWDhmNmp5MjVS?=
 =?utf-8?B?U09FM2RLZmozYWw1bituVnBpMFNzOFY1UDV4c2JvMC8rb2FCUkRySXBsK2N6?=
 =?utf-8?B?b25YdXhMUzhJYm5HYWkyS0hOb0pjVTdDN01vQ2JoZU5pQ3BkT1NsTVJyQ0ZS?=
 =?utf-8?B?cmdrUXlndVJxaHZlb2x1cSs0UTlwS2RmQUhoVWtTdkRJWUswN2w4T09PdEh6?=
 =?utf-8?B?YlNacnNockxjbW0vUXhBVDhNSkRsdGlmODZJL1YyVDZyNEUyUGh2U3dwNi9I?=
 =?utf-8?B?aU5ycWJ4SWQvanFjdGp4THc4TXBvYU1DYTZDVUVjU3JhSUZVRVR6T3BlRElZ?=
 =?utf-8?B?NGR5MXQ1ZEFML2ZCdFBvM0UyWFVTdnQ0dGRuUm1aM0pieWs2V2RFZUF2MmZ3?=
 =?utf-8?B?Sy93N1NBbFNoYXZqYnVONC9YVjJEajVXd3hKK0Y1S1lqaS8xSG0zZHdCU1Nr?=
 =?utf-8?B?QUlpb2NhTkN1bG5qQW15TTJNWEFuNGIrOXFRZ3BzR0Ezd2s0TnRLdWhOMm9D?=
 =?utf-8?B?SS83MHlpRkw4akQvb3h6L2JjeFp1cngxdk5RL0pGLzBFcWZCYTNxSDl3SmZj?=
 =?utf-8?B?dnR4dm5ZZHhxT0w5QTJ2MzM0ZXFQcXZNUTNjV014OVpqKytGdkVjcUxkbytB?=
 =?utf-8?B?V3FqMjQyOWJJd3pId2JBTzMydXk5Mi9kOHdPRHczaWVDTjdzSVZqbXlpUjBJ?=
 =?utf-8?B?aDFGWFdvV0dwajVJYmRkYjVpdUJKNmFlM2dKaU5MampWWkR1QmhtOTliMHFR?=
 =?utf-8?B?RzgvQmUzaE9vQmE1Um9WVEd0OGFGb2pPM2NFTDNxa3oxZEsrbVpjeEhxeXI4?=
 =?utf-8?B?TTh4amU0ZlY1aEdNSTRJVDNDOG1LbWtGeVMwWHlwNUFiMzk0cG5sQ0M2SkpP?=
 =?utf-8?B?RzVjemtJaFY4WnNmNHZYYTUwMURhRVZOTjFCUTdqVXpMUHBwaVRVL3VsTXlV?=
 =?utf-8?B?K3huWXVlYTJjbElUc3NTNTFyWkpydmh5dEo2S2wyK2xVeDd6MVM2cTJIYTRS?=
 =?utf-8?B?bTZsQit5SUpQTHc3d1FSTkxPVmp6Mkh5b24rcEJQMnZOVGdjMUxJa0g5d0px?=
 =?utf-8?B?bWgvYXZwcHJ2Z0hINTVFNHZJbzZSMnFaakpOQXk3VUZkNnhabzBQT2c5VWVa?=
 =?utf-8?B?YTZMa3RVVnp4QXVBY0toSi9LL255M1lDYWJUTmRGS0YwbXdaRnhlL0tkeHR2?=
 =?utf-8?B?aHhqaVZXZTJXdjluU05wZnZ6cHFIMWN0cGV5a3VEamo5U0lSQXZDdTVNRkkr?=
 =?utf-8?B?VGZ5TzJYZXo1VTVHc3BwUlZpSlB6MjJueE9hald0Z2hIOCttRHd1YkJhM1Ez?=
 =?utf-8?B?dm1tbnhxUFdiOTB0S2lKQmpZbUk2SFovdHBiaDArOFZjbGxKMVZka28ra2hT?=
 =?utf-8?B?QTVQZURPS3doWng0eGlvTWlMT3ZRd013T3hXdUlPbUlmTUptN1lwYzdOeVpq?=
 =?utf-8?B?NFIvWG5YM1FFT08vY29PT3YycmRycGxBWmtRTjNWVlNmZ1cyd2JqYlRwUnF4?=
 =?utf-8?B?SjB0bkNUOGxpZHZ1TUpSMHlLVUxDL2FNWjNSbXFlWS9qc3pCTm5Sb0NCRGhK?=
 =?utf-8?B?eVdwbE9mQ1NDKys1ZEIvUjFJTmJTcDlMdXdBNmp5RVQyaHB1K3hST2J5UE5s?=
 =?utf-8?B?c1k4OU1BSGZreU1IWmN6clIrWVB2UnVHMS93RjJML0w4cXpqL0ZPMmhLT3ZW?=
 =?utf-8?B?U0lOUE5VYlpTQUlRTnVJcWd6UVZ6QjZZdm8yYS96d0pPMzBSUk41VTVDWExW?=
 =?utf-8?Q?vkVtrsY+8+ql/ppRRw=3D?=
Content-ID: <B703DBDFF9B5784CB72F52939B3EC648@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48dcf26-6dc3-4aee-d43e-08d8dcc646f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 15:25:42.3788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJcl8Oph6UOBvPieQxEMCqU4sC1ASpvGkyjV3y1DN19767u7G0UnHM0r7NJkemItFz2WPld5ZpUUBoLfzT19/KXSzwN8ZM67CYv1De7MZLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_102548_502208_01BEC926 
X-CRM114-Status: GOOD (  18.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, p.yadav@ti.com,
 zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xLzIxIDQ6NDIgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gMjAyMS0wMy0wMSAxNTowOSwgc2NocmllYiBU
dWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206DQo+PiBPbiAzLzEvMjEgMzo1MCBQTSwgTWljaGFl
bCBXYWxsZSB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93DQo+Pj4gdGhlIGNvbnRlbnQgaXMgc2Fm
ZQ0KPj4+DQo+Pj4gQW0gMjAyMS0wMy0wMSAxNDozNiwgc2NocmllYiBQcmF0eXVzaCBZYWRhdjoN
Cj4+Pj4gSSB0aGluayBwcmludGluZyB0aGUgY29ycmVjdCBmbGFzaCBuYW1lIGlzIHNvbWV3aGF0
IGltcG9ydGFudC4gT3RoZXINCj4+Pj4gdGhhbiB0aGUgaGFuZGZ1bCBvZiBwZW9wbGUgd2hvIGFy
ZSByZWFkaW5nIHRoaXMgdGhyZWFkLCBmZXcgd291bGQNCj4+Pj4ga25vdw0KPj4+PiB0aGF0IFNQ
SSBOT1IgY2FsbHMgbXgyNWwxMjgzNWYgYXMgbXgyNWwxMjgwNWQgb3IgdmljZSB2ZXJzYS4gVGhp
cyBjYW4NCj4+Pj4gY2F1c2UgYSBsb3Qgb2YgY29uZnVzaW9uIGFtb25nIHBlb3BsZSB0cnlpbmcg
dG8gZGVidWcgYW55IGlzc3Vlcy4NCj4+Pg0KPj4+IFVuZm9ydHVuYXRlbHksIHRoaXMgaXMga2lu
ZCBvZiBhIG1lc3MuIElmIG11bHRpcGxlIGZsYXNoIGRldmljZXMNCj4+PiBzaGFyZSB0aGUgc2Ft
ZSBpZCwgaXQgc2VlbXMgdG8gYmUgZmlyc3QgY29tZSBmaXJzdCBzZXJ2ZS4gVGhlIGtlcm5lbA0K
Pj4+IHdpbGwgcHJpbnQgdGhlIG5hbWUgd2hpY2ggd2FzIGludHJvZHVjZWQgZmlyc3QuDQo+Pj4N
Cj4+PiBUaGlzIGlzbid0IHRoZSBvbmx5IGZsYXNoIHdoaWNoIGlzIGFmZmVjdGVkLiBIYXZlIGEg
bG9vayBhdA0KPj4+IMKgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jDQo+Pj4gVGhlcmUg
YXJlIGFsbCBraW5kIG9mIGZsYXNoIG5hbWVzLCBzb21lIG9mIHRoZW0gYXJlIG5vdCBldmVuIGV4
aXN0aW5nDQo+Pj4gYXMgdGhpcyBwYXJ0aWN1bGFyIHN0cmluZywgZWcuIHRha2UgdzI1cTY0andt
LCBpdHMgYWN0dWFsbHkgIldpbmJvbmQNCj4+PiBXMjVRNjRKVy1JTSBvciBXMjVRNjRKVy1KTSIu
DQo+Pj4NCj4+PiBTbyB5ZXMsIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBzdWNoIGEgdGhpbmcs
IGJ1dCBmb3Igbm93LCBJIHdpbGwNCj4+PiB0YWtlIHRoZSBrZXJuZWwgb3V0cHV0IGFzIGEgcm91
Z2ggZXN0aW1hdGlvbiB3aGF0IG1pZ2h0IHJlYWxseSBiZQ0KPj4+IHVzZWQgb24gdGhlIGJvYXJk
Lg0KPj4+DQo+Pg0KPj4gSG93IGFib3V0IG5hbWluZyB0aGVtIHNvbWV0aGluZyBsaWtlICJ1cGRh
dGVkLWZsYXNoLW5hbWUgfHwNCj4+IGZpcnN0LW5hbWUiLg0KPj4gQW55d2F5LCB0aGVzZSBhcmUg
anVzdCB3b3JrYXJvdW5kcy4gTWFudWZhY3R1cmVycyBzaG91bGRuJ3QgdXNlIHRoZQ0KPj4gc2Ft
ZQ0KPj4gSkVERUMgSUQgZm9yIG5ldyBmbGFzaGVzLiBUaGV5IHNob3VsZCBhdCBsZWFzdCBhZGQg
YW4gZXh0ZW5kZWQgSUQuDQo+IA0KPiBNaCwgd2hhdCBhYm91dCBhIGxpc3Qgb2YgbmFtZXM/IEkg
bWVhbiB5ZXMgaXQgaXMgYSB3b3JrYXJvdW5kLCBidXQNCj4gdGhlcmUgaXMgYWN0dWFsIGhhcmR3
YXJlIGRvaW5nIHRoaXMsIHNvIElNSE8gbGludXggaGFzIHRvIGRlYWwgd2l0aA0KPiBpdCBpbiBz
b21lIHdheS4gT1RPSCB0aGF0IGxpc3QgbWlnaHQgYmUgbG9uZyBhbmQgZG9lc24ndCBsb29rIGdv
b2QNCj4gaW4gZG1lc2cgKG9yIHdoZXJldmVyIHRoYXQgc3RyaW5nIG1pZ2h0IGJlIHVzZWQpLg0K
PiANCj4gSXQgbWlnaHQgY29tZSBpbiBoYW5keSB0byBoYXZlIGEgbWVjaGFuaXNtIGluIHBsYWNl
IGlmIHNvbWVvbmUNCj4gcmVhbGx5IGNhcmVzIGFib3V0IGl0IHRob3VnaC4NCj4gDQoNCkEgbGlz
dCBvZiBuYW1lcyB3aXRoIGRpZmZlcmVudGlhdGlvbiBhdCBydW4tdGltZSwgd2hlcmUgcG9zc2li
bGUsDQpzb3VuZHMgZ29vZC4gT3RoZXJ3aXNlIHdlJ2xsIHN0aWNrIHRvIGEgZGVmYXVsdCBuYW1l
LCB3aGF0ZXZlciB0aGF0DQp3aWxsIGJlLiBEbyB5b3UgY2FyZSB0byBzY3JhdGNoIGEgcGF0Y2gg
Zm9yIHRoZSBsaXN0IG9mIG5hbWVzIGlkZWE/DQoNCldlJ2xsIHN0aWxsIGhhdmUgYSBzaW5nbGUg
Zmxhc2ggZW50cnksIHdpdGggYSBsaXN0IG9mIG5hbWVzLCBhbmQgd2UNCnN0aWxsIG5lZWQgdG8g
ZWl0aGVyIGRvIHRoZSBTRkRQIGRldGVjdGlvbiBmaXJzdCwgb3IgdG8gdHJpZ2dlciB0aGUNClNG
RFAgZGV0ZWN0aW9uIHdpdGggYW4gZXhwbGljaXQgZmxhc2ggaW5mbyBmbGFnLiBJJ2xsIGZvbGxv
dyBQcmF0eXVzaCdzDQpzdGVwcyBhbmQgZXZhbHVhdGUgdGhlICJkZXRlY3QgU0ZEUCBmaXJzdCIg
aWRlYS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
