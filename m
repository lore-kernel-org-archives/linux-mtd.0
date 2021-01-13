Return-Path: <SRS0=RLHh=GQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F9EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:05:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1599023359
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1599023359
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PabUGQY7bSDnM6XUnHt+d1dTEUbuCVwDLZ/HN30d4bM=; b=jNnG8CVCtvapran9tPjELzSOp
	/8wzE1nlCQHQniRoGVovWdnjtOl/fHAOZdpyiBUECZyDmKAD5QOi69mOVV7DFzZvXA7T7uNVhytaQ
	kkB9iGkUPwWZF1vP4D4Uk/1XP9yVUxW5bv/HijR3kYpAYTlpsVTv8JhzzrekDfj+ln71h+rqq2ZgZ
	+iQcsEmfbrRlOJjdOjtrcGrxJ8yKxORzsHSZkwO8rKzlW1S3jvh5G5122YGvdOQ6a2VE0EK0ltoS9
	rmEgJxs4VfLbaFOdWc+dlD/z8OKCUl90VN4RNFoHtQAt3xmm7N1QZJiFPF+CI2XYi51cVZiXbbFc7
	UxKTmzhUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzd10-0003oZ-HQ; Wed, 13 Jan 2021 10:04:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzd0v-0003n0-2B
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2021 10:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1610532269; x=1642068269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NbrNl6jM+58/rAfZlQX87o+TG3oF0FNnNFgM11Nhezo=;
 b=ZRZrQOe6ioLb+ZxpGPJWQOCP85cpqGCOsUTqmbiJRvtwe1xdQluq7SSn
 GVBAF7FKJt4FrEVzuddHpVnC9m4wbN8LhLo40rwglOwHFQ6uGeZETKhma
 +I/TPcgXq0JG7SaAe1+UXn4ED2Liu0G+qh1XQGDa0PkqX4CT/My0CJoOf
 WIiYlB7OzmerWuCZrQN9XKvSvXKQciVqijLCUvmJ8O1VU1zhLrgyuhWbH
 sXHh+HEVFkMJXtfwleBWIsflSgX3EFG15zAYPIdwTJCux8I7OhuTFvAcq
 4KVJimI29gHhbgo53vtruFg0LAwGnz/hCm+kWerAhIqpRaliVzwU0z95s Q==;
IronPort-SDR: cmW0t425olZEYnol8aQh/lfCG2vTa9gG/ZEkLVRuFUZxL4LC/9gUZ+xdP9j13P7lpO6xS9dsMa
 JkdLRU0DmJxM/fxdIS0faVLJt2zaaoMqHRRUsJVQgOOM8BrK33r4/YXuX4BYIKCvOKcj0zx1Bb
 Xc6hYRRlB5cVKCD0KmgCXQ5rmG+EHO6vvzA1GC+JpC8YhIUjw0lZNyyrJhMLJxCZOyqsyNf98+
 tYB7lmpkRE4J14/93nLX71CaDKKHKgf8nEja1CzS1NtcaMq5rA72wN+qsVp0Xs2O9XLPINlS9M
 eOw=
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="105814783"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jan 2021 03:04:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 13 Jan 2021 03:04:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 13 Jan 2021 03:04:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLbCkcadDRr1JywSiJV89ANFPKoK/HzAfQ4pn287FnsaJaURs4vK1bhqk7cjVp4c65J4k+/5tb4OeoZUAd4QCW/popWpn6g0kytT4zEJ8WTvZmH72oUoXw3+cq5ng7ZAPN0wiQkRMawrPizkfMsZoYZj4Ffo/OWvTg5XQFNwnzLGC7haI+tdiccdhRHWTyOf+C7ETGUoGToQdz7SSKE/GfqrS+okcnnndhrnuWPECZrBABaP+6hwfRjQQWcMDRUwgwhrTH/yncZhvSYj3sqBxw/EGJE1wPcn5xeE3yKy1jSJ3QhwI68EIz9BHyPcy9JOV5tonGFP+XVqOTpzA7/Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbrNl6jM+58/rAfZlQX87o+TG3oF0FNnNFgM11Nhezo=;
 b=Ncqbtz60YNf58omcxQ1w7elUKR/JuC4kSwJf9vGzLOpnUZE0OecC3FB/4Npbojbr6m4erzvyDPPRgoJMxKjlEa48K7WdodHa5t34vysLgx8R6Hg3q+G8UpOWy7CLAMXZxeOpZC9cAZMvH51knwPXlbPJmu52aN2jwDi/lQaK7CFtAfIkBzG8UAWySPEWppLFyA+9TDANZNuL1eDdfPqVxPxXG52G7b58TES2tTwRCrkFdZulE1oUgrqIGFKg8f26UDlfCgf6DiZWjhm0rRJCODAQo3JayzMMju3z1TQ4dc9gAi1jHHovHa3kbqSfiWkkABcTvyZyRTF03Ff3+htKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbrNl6jM+58/rAfZlQX87o+TG3oF0FNnNFgM11Nhezo=;
 b=EsiqwwaMrOIDEE8nJVqmss4pXyjsW9U1bF1yb91xInNBdMXABCpgKShYJtfmEAA9IZ46FHR2Fuyaqbu1Kyt4vC8lUhb7+H/H3I00USUnIALnKNFQn7BHbqCF4fSOrXHQz01kRjZFHMOnBnqEoFS9Bl+/gkVD0IOWntCWWOhofxY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 10:04:23 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 10:04:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bmeng.cn@gmail.com>, <jagan@amarulasolutions.com>, <vigneshr@ti.com>
Subject: Re: spi-nor dummy bytes for fast read command
Thread-Topic: spi-nor dummy bytes for fast read command
Thread-Index: AQHW6ZN3k1m/E+RiH0C4Pz8kWT/+KQ==
Date: Wed, 13 Jan 2021 10:04:23 +0000
Message-ID: <6396018a-485f-6eb4-7742-bdb5c4335ed4@microchip.com>
References: <CAEUhbmUXiwiuPXHkAcfFQeNkp9xZk3gfCi+oVKSr2MF+5C44Zg@mail.gmail.com>
In-Reply-To: <CAEUhbmUXiwiuPXHkAcfFQeNkp9xZk3gfCi+oVKSr2MF+5C44Zg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 788aad0e-1312-4bfd-3cd6-08d8b7aa9a52
x-ms-traffictypediagnostic: SA2PR11MB5033:
x-microsoft-antispam-prvs: <SA2PR11MB50330A48AC4F739FEA43DDB9F0A90@SA2PR11MB5033.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q2lo20oYhs12E2TTz5EOm6JxMA0F7gWRor+HIHDMa7l9pTdCkq9BXwHfVymFalPItGZisLhJJmk4gfURqLX1mDjw8RRizLfPYHWEYsVFw0+C7zFWI2QG0N2z6BnPo0JZY4jnsCdq6zy4VaVMkC6F5G/Jm3fSfpfa9H9OjqtJEv/pMB6CtQTQ7bNynq1NudTks5uL5rzpML/XsJt5rwDfnoPwed9Qmwuf527OoYH2pUIyDCDakONWFigtrzJkdzJfrRyCetei3/wTXKZ5TNLDr/d6og9bJYeZ+6QDoQkDr3VJHJMMsK/SMvlyT8wZ2aKLUBbNn6Gtp8ufodMqaJ1kqcNqERfyMwyds8z+OfWQ4dINkHSaGQNqwRT2I4Payo9yjRHhHlT0zu0TfG8uUUyeeYrc0dBjQdBvcyiwtbvwwczRKXRZJaoqWgeT8UdS5ucAxPW20qs7LLCOnIQGMafnypxgbB2F1+rwcciGayV5Cz8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(6486002)(6506007)(8936002)(6512007)(478600001)(66556008)(4326008)(71200400001)(54906003)(91956017)(31696002)(76116006)(110136005)(36756003)(31686004)(26005)(8676002)(186003)(53546011)(2616005)(5660300002)(86362001)(2906002)(316002)(66476007)(64756008)(66946007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?L3l5SnpncHgycW5adlMwdmJSMStHM0pHNzFvU1Mrak9CNFhReFU3QlFBbXQv?=
 =?utf-8?B?amFwRWZGc1NqU25PaVJXNlUxakFzU3dYeVNqYVNnYk0xUjJQYnFCSlRQcXR4?=
 =?utf-8?B?eHhqME5PTXhCem9WdHl1ZUR2S0VseGZ1ZUxOL0dkMWNGK1JXTzhaUk03YlY4?=
 =?utf-8?B?ekdnL0tkWmpCSnhaVEo5MUxCR1FvY0NNSWRhNzVDUGNwaVJQOGJVZHk1eXBT?=
 =?utf-8?B?VExLTlVvRXljZWdUcHNiZFQxR0p3MmROMGwrRHlJcUF2Vm1YS3cwL1F3MGlY?=
 =?utf-8?B?c05QbTZ4OWR2VDVRWlcySTByWm9Na3VRa2l3ZWEwRFl3cFVJWmRFMHh1Q1Qw?=
 =?utf-8?B?L3BHZkpTOXdseFgwTHhkMGRvOS80N2xqSHNUUVBpNVBtMGZpNWhyUDNKdGVP?=
 =?utf-8?B?czNDeGV1UVJWck9YKy9OQVdKdSsvaFB4L1pRdFRJQkQ5KzN1eG1tZXFKejdt?=
 =?utf-8?B?V3lJNHRMdlA5Q2xWdlZpa1dEOVhNeFJLUFQ2U2dyNVEvRFJyY280dmN6RGhD?=
 =?utf-8?B?SFBKdmVoUGVJS0dUbUFQYU9wQ1p5QlNGeSs2WTYwNm41WC80SURaS1Z1eTUw?=
 =?utf-8?B?NEMwcW1uV1NtMFlqT3VBellhSmIzVVExdjZ3UGJxOE0zL2J2UTNFN0NEaXd6?=
 =?utf-8?B?dWo5ZGJvd2NDZGtGVXFNQU0wKzZjMnpxUGptQWxHWmx0Q3NOWVVObkRwVHdZ?=
 =?utf-8?B?WkI1RC9aYy9ZNDJnTUQ1MDg3NGxIUkNDUEhWaXN5UGtrZkZuS0ZNV0dhZXhB?=
 =?utf-8?B?bklsZ1AwNUl3VnlPN0xuQTRDaUc2MGNKRDg4VGJqRGdkMUFza1h4THErZmtN?=
 =?utf-8?B?RERraGRsaHkzc1JzNXorOU8rSlh4UWJ6YkY5RzdNVUZGQU1XTXhoT005VUtX?=
 =?utf-8?B?TTVhOXJ5THoxU1dYbzduWWd4aGpJR1FGa040Zk5CRXk5UzlsbG5EWXpTVWVS?=
 =?utf-8?B?SWxBSlNtWld3M0tGZk50RTUwNUNnQjRjWk1DcGUvZytENmdpR1JGR1M3MmRB?=
 =?utf-8?B?OGlQbHpna09OdjdYTG9LZkxVYVlxSkNiaVVDblduV2lzblVvUThRQk1mdXdt?=
 =?utf-8?B?c3RBanRjNmFsMEpmYmpoR0puUFVsVmpaaWRKU1NoeWpGa01uWVB0aTY3bFFG?=
 =?utf-8?B?N2VjRlB2QmZYdVlUc2xQT003L3QzVVV1bVhDM3ZrREZuWkc0ckxqUVFlRDBH?=
 =?utf-8?B?TDBhMVNqRVdVeko4bXU0NWJnSHdiMXhJTHhHRWVqRXBGZUhzbmJjeGlwWU9B?=
 =?utf-8?B?Q1RhbjlqL1EzbWs1N0JTOVZCOENldFJ4NnZsQjdQTHl3N2xEU1hvU3M3TWVx?=
 =?utf-8?Q?4vQRtLyVRHvZA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F1DBBE804D9CC14B9ECE3C5997C92A57@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788aad0e-1312-4bfd-3cd6-08d8b7aa9a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 10:04:23.2945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DENz9Fi0rRyWuBFINCU317tAJ9noKvofAgRKFKDmSmMn+FisigZE5OjU8dZ9sMrD3ioXmJHGYhnavOnCKTbBkBpAUVLgmv3MHlwrv7Kd8AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_050429_269763_7C231A0B 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 1/13/21 4:06 AM, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,

Hi,

> 
> It seems both U-Boot and Linux kernel spi-nor drivers have the same
> assumption on dummy cycles required in a fast read command.
> 
> In U-Boot spi_nor_read_data(), there is a logic to calculate the dummy
> bytes needed for fast read command:
> 
>     /* convert the dummy cycles to the number of bytes */
>     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> 
> This logic assumes the (nor->read_dummy * op.dummy.buswidth) is a
> multiple of 8, otherwise this won't work.
> 
> In Linux, the same logic exists in spi_nor_spimem_read_data().
> 
> Note on most flashes this is not a problem, however on some flashes
> the dummy cycles for the fast read command is configurable. If the
> dummy cycle is configured to some odd value which makes this
> assumption false, then we get a non-working driver.
> 

Right. We should use dummy cycles directly and get rid of the
dummy bytes logic. I have this in my todo queue for linux.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
