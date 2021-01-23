Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3577DC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 12:19:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8A921D95
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 12:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8A921D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=41dGsspOakHP/KqIxMVMGeelx5Pk/WxGUKvcKemqCkM=; b=SvTGkplwpV49jvZm+5LnlJJNT
	ID+rjYmfGKI7/S5nPrtriAsy2mtBJXSdpl2rOXl25KL3jmjytBn9hOcsYoelUFGkkcZXvUEeF87uV
	jKcgpaL+MvSKX+jXoIz29d5ZZmhyGAcfeN8SZG3RJMMwXJso98HC/3aC2XL4OkM1xDeDZJeS+CozV
	iDkSCYVg1Qr+K0O6YzzKyKu06QPig5/rp0vS5D5UmhzMOsK2XULYR1upSZ5NP0oNxmQ/eSUQTxRPg
	Sz7MEuxGotoiJfZOMbewOKRk5tMFkDDqN0jnpmrO/+D/LkXAlVooABr66KhWssFh6+p4ji3l1dOdE
	yMrsSRUjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3HsR-000850-Vx; Sat, 23 Jan 2021 12:18:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3HsP-00084b-1Q
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 12:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611404328; x=1642940328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nJ/o+NRhjhYmNj589NSP8NUbieKv3nM9Zwx7nL7DOSc=;
 b=k85lWzXKUpipDv7u1ahyqV7ss3blBus/aGD5so1lauK22JRlF0l+MUb4
 FNsy+2w8/nInLHUG4zCKwhyRM2kFX5DVaxVbyZBH2GbrvWn0ItAe2tioj
 Y5YBwJkZdDrU30YL1kscaK1Lh/TomhmoRHW3jgqHK5UjOKd06+10YgKX6
 kK9D8KjlTjrRB/XHPG3/lXWKkj7lYUvidXnyQdKpddtY60HaVOX+FB1RO
 popziO804mpb7IjXUPDcU8eM+CJSQ+uIZCh54+IXAL0En77QmP07+d0Tu
 OskoZkS9VzXIzujrpW37sGJAro87E0mz//cYRjBl50QyomxfpK0CKZMh+ w==;
IronPort-SDR: AhKnPlwZMp2O1pwF2cyzgCuttRuP7xOVmcVpzvmQG/pwuWINFSm0bWbtZxzGFqx6KUZJOEYNOt
 jfCuaEZ9idY9kQ5weigiunkQDgXk72BY/zAz+BkHaGXYHoVSZ8FH6NNMASHIf3qJA5nUg8WRp8
 7b1ity8qRsLk+Gy+tNZyiikv8cvAZFEqB09ad0WBUHyJAb+HtYCBkdaDtE+Qz/dHvGTOdbs/Wn
 r7N+lAC827PQ/QUJIkzJ5o/wHWv460I4Hbwdj8iK7o42qw953WAj7KlyQqTD7ILH7YLQdyaTDy
 W7E=
X-IronPort-AV: E=Sophos;i="5.79,369,1602572400"; d="scan'208";a="41475742"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jan 2021 05:18:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 23 Jan 2021 05:18:44 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sat, 23 Jan 2021 05:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHCbxIu416fwLd7I2hWUA6yf5xjBz57Ae8LycT82EjkJeijA9xlPNa05uWcgGXxA0gyheJShdLjvIhksHgqSU7oGABmhA+ecLxJmIC/B8zPUKoZY5s8FlvsL+Fd+B+PjwKE+AwUzJm5w9Yrwyv1Sy6OwhXoo3LZasmxOqycS9pdyyaP46Pi3/F6c1hcgNsOwsJvt29G7VDLeLdscl1dOByilWcbMbcJ1qFkIaS+FuLMDZeyCd5uNofGi2viyBG+CBklvrNcdysx40CiOwKAI4gPHs34icZFI480itDX6eHBzD1RQrt4RTltWQCLfGcY/+799u7CwuksRsOal7aZV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ/o+NRhjhYmNj589NSP8NUbieKv3nM9Zwx7nL7DOSc=;
 b=nVLEmXi3zeJmg21iLpmOYTjJTup2NAHdbAKrlx1u9FZeLGRazyZ+R3nvzfsNRbdqIBVjK00UcUR56XLyl6XtojYaOvC2rZigM+hJlTpalU4h2m0I8KY5Ur+p9G8NJaNZtFKaOdn1uxAhta06CF4U3vwApPK9/Eed53ivkw82mPd/q4gNnw/eyZq0jV8ggxad9gMbSPPu+XvKKAAsoxvKea/T7hKSjSsLa+J+ic/JZ2Rk3WEvgcl1rB/8kzGh2iH69NNwDuIllZPLefk90SSM0V+lXKosbFsc4E2QIDnXZJmmb/vDrdHtmALLI1ZY8YMf1W/KkQLCXnLz6fGPKHz9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJ/o+NRhjhYmNj589NSP8NUbieKv3nM9Zwx7nL7DOSc=;
 b=TVI5NDlWLFGAF9lmEmmLQkGLwCN6YKqGklgI5+e6SUZ234HS2FA17bFHsgW5dGYfxBBGaoJ0kRtiQxW3eOCj/ZwQuGMDSs8ThOs8l+S0IVOpKRkbA7p6AYDxGdJzg4jhUKJ7/IBp4JVOyecKc8GQsNQN6vgU74iDAU0Q2xwOHP0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Sat, 23 Jan
 2021 12:18:42 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.017; Sat, 23 Jan 2021
 12:18:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <liew.s.piaw@gmail.com>, <michael@walle.cc>
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Thread-Topic: [PATCH v2] mtd: spi-nor: macronix: enable 4-bit BP support for
 MX25L6405D
Thread-Index: AQHW8YHiFrgqo+NJ502dydKbSKn4ZQ==
Date: Sat, 23 Jan 2021 12:18:41 +0000
Message-ID: <93b7f8e8-cdf4-5b09-da17-636d8fcaf0ee@microchip.com>
References: <20201208011938.GB12175@DESKTOP-8REGVGF.localdomain>
 <20201208015730.12351-1-liew.s.piaw@gmail.com>
In-Reply-To: <20201208015730.12351-1-liew.s.piaw@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfdea3f3-359e-422e-9bf6-08d8bf9905ad
x-ms-traffictypediagnostic: SA2PR11MB5177:
x-microsoft-antispam-prvs: <SA2PR11MB5177498407B6C66F846D2197F0BF9@SA2PR11MB5177.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Qnl4ysHvtERqQh1oHTylqNmCyFfN4QEP8kSnp6bTb77Mps6gFDIqTFpi39QaQhRNTqBYH2MZI2eRXW2Rih3oVrb8rAVnxAG/x94vaCrDG7AjDtPh4kBe5zsFEpS2t64M4aIpX59at+LkDO1SvdReNQFl4SGWvcj70W766RNh50u4SnIDuMIiCTbnjGJ5UjnRhqevmomXh4c7JpVpfvtDURixZZ//xz4Yc/Sa0I+81iQAFeSO7NoyeTCUBYxVv0GxTgHJ5pqNGlrNaA3oDj9hEoIPR871QRdEv0EXVOpjl3HocL/hU6+V0BLT/6ocE5JgLexNHW4f86vOXBq0F4hXO1LmZNzwhkRSE21E4y9gdiDW7y9OmcYMMLZboQJNdA2xwyZ+wCAUZxjRdtQd5sn+ASB+aj4ASsNQmBWL5aKUfRobDkMErAtXBJsU3CXIBJuV7X9gjiNXXrt/sROKhUiFlme6yJV6EYmGLBIQiYgbBxYTYtXM7/6Xhu5mnspO0YajwgztXcCKGRNMFJZOYSRE0Oi3dqis2R8l6jEu43T5DwQ/tGeSnVIAuU/94CIRFIN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(39860400002)(396003)(66574015)(316002)(8676002)(54906003)(110136005)(6486002)(36756003)(31686004)(83380400001)(86362001)(26005)(66556008)(64756008)(66446008)(8936002)(66476007)(186003)(2906002)(66946007)(6506007)(2616005)(91956017)(53546011)(71200400001)(76116006)(31696002)(966005)(5660300002)(4326008)(478600001)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?emh4MnFYSGh5djdPK3J1NUlnUTRRRWxXNXhFaERHbGQvVUdDSGp3dVM5T3g2?=
 =?utf-8?B?OXNqZmJUWUlCWVliSTlNUmxGYndHaXlKSTROQ05QNHJwbEprcDBKWEtpcnNh?=
 =?utf-8?B?bGtiYXZ5Tm80cXovRDdnclA5K09VQnY5NE1tZURydmhNKzREM3VnS2lob2dT?=
 =?utf-8?B?VWlmckt4YmlFbEV4NWJEb20vUkY5WmxuWmlsVENPY01JSktBdStCY2pCOEZM?=
 =?utf-8?B?OCttb29pbGY2UjRvUkFvVjJDV2hpQ1JuYW04M0RON2hMUDBjSFJMK3l3VmZq?=
 =?utf-8?B?R3FLMlN6QVFMcWpMelJCVnE2TG5Ra2FMZ1JqWFRRbXlQdmd1cjRQL09oOWJo?=
 =?utf-8?B?QWczNjVOa0dGSFhwY215cklpQjc3WTlCajRJRi9FR2tJaEdPSTczSkZEUm9t?=
 =?utf-8?B?S3cvSjJjY1poT2lRMzJVY0ZnUTlaSnBHMlgzRk5TdXd0ZVN5NXUwSm5jMFQr?=
 =?utf-8?B?ejZrcnZrRDFBd0E5a2R1UTQ0YnRieU1LUzZQZ3FhUkhOY3g3TkJOaGZlTFRM?=
 =?utf-8?B?Wk54Sk1pUDlkeTZWZHpaQVk1Uk5JMXIvNXpRd0JSTzJYdFRkT25IY0VtTFRT?=
 =?utf-8?B?eFFzZ1ZZQzI1WTgzejl1ZDczaHFyNThlQXNIRHZYZGhVbUczbkwrWmJWQ2lI?=
 =?utf-8?B?UEZxcGFyZHZoL01EVWtqTVhJdm9HLy9GTmUvR0JzelJIWXBsZ3BFMnpTZ3JJ?=
 =?utf-8?B?blMwSzZKVHgwSjc1Sk5WaEk2K0E3NEtaZytGQkNOdkd2UWlQeDB2d2xuc2Z5?=
 =?utf-8?B?cjY4VU9TdDljSnpkMnpTd05Rdzc0YnVndnRYNnByQnY0OUpIVVRMTGJVNU5E?=
 =?utf-8?B?UUJOWEZlWXI3ZlJWMStGTHVjL0lFWUhGSFlaT29tVlFnRlNmd0FTV2RVNXNH?=
 =?utf-8?B?UEtnSVZxNkltUFdEUTJvb1hUSkx6eWtBa1Bmd2lLREcrOWl0cVBxaElVcUdr?=
 =?utf-8?B?a2hyTjJNT21mSnY5c1RuL2o4U1VXZmRseVA0UG05RzRUaWhsV01LRjZ6UUcw?=
 =?utf-8?B?aXpHOXRaeXV5YWRoaDVCd1NhVG1BbXRPQ3FuWGZ3dG81TEgzc3Vncnh2Nlc4?=
 =?utf-8?B?bzJ1UEplRGJva0U1NFZZbVZOM2twYWxNcUhacG5EQVJxU2VMN3ZPT292M2J4?=
 =?utf-8?B?RmVmamx1dXRZN01rMldaTVdocVl3YWk2WEcxR1RzWndtMnJIQlo2dVVhaXBM?=
 =?utf-8?B?cFlHUGhIUmpqYkd1NHRCNC9lUXg0UzNxTU55VDZiRDhPblc2QndKZ0Vkdzhl?=
 =?utf-8?B?Z1pVWGMrTEFYMG9UMGN1STNySjlCRXd1S0p4RE1CL0dkbVVHdHEwMUYwT1JZ?=
 =?utf-8?B?d0pvamRpOUFmQWRhQXFDNzlQSjRNTFlkdmh0KzRjeUV1dEl0TWhRSHY0VzZW?=
 =?utf-8?Q?kK2vv7U6RGxUW/t+Q/VFmZrBgwt1vPFg=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <FE7B95B050859E49B4149B1753724281@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdea3f3-359e-422e-9bf6-08d8bf9905ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2021 12:18:41.5984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPBoNJdOEUCbwrtNSq59lS2wsTGFCPEppost8X5RNK5wA3U0b3YmvWCRXL5FZvson1J+QAc++MW1mtbgXsjiC53SUdjeXHBInJ90RKsYgTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_071849_475734_47C83F0E 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sieng,

On 12/8/20 3:57 AM, Sieng Piaw Liew wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Enable 4-bit Block Protect support for MX256405D and its variants using
> the same ID.
> 
> Tested on Innacom W3400V6 router with MX25L6406E chip.
> https://github.com/openwrt/openwrt/pull/3501
> 
> Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
> ---
> Changes in v2:
> - Add SPI_NOR_HAS_LOCK which SPI_NOR_4BIT_BP required.
> 
>  drivers/mtd/spi-nor/macronix.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203abaac229..033ede381673 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -42,7 +42,9 @@ static const struct flash_info macronix_parts[] = {
>         { "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
>         { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>         { "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
> +       { "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_HAS_LOCK |
> +                             SPI_NOR_4BIT_BP) },

I've read again the datasheet[1], and to me it looks like we
don't support the locking scheme for this flash.
What mx25l6405d calls BP3, we refer to as Top/Bottom support (TB bit).
The problem that I see is that mx25l6405d uses some kind of twisted
TB bit.

For example, for BP3=1, BP2=0, BP1=0, BP0=1, the flash's datasheet
states that the lower half blocks are protected (0th-63th), while in 
our code we would expect that just the lower first two blocks to be
protected (0th and 1st). We need new support for this flash.

Cheers,
ta

[1] https://www.macronix.com/Lists/Datasheet/Attachments/7309/MX25L6405D,%203V,%2064Mb,%20v1.5.pdf

>         { "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
>         { "mx25u3235f",  INFO(0xc22536, 0, 64 * 1024,  64,
>                               SECT_4K | SPI_NOR_DUAL_READ |
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
