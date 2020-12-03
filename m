Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D19AC433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 15:09:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9152085B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 15:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D9152085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Fcgi8ULguTPjihdG9+0lE+dT2RX1DhkeT3WAiZgWK4=; b=IaFSrwtldJCvV+aasu5ea+hWW
	WLsfatWakOy9aob8y6fzxwrJ+L1MHSx4UeALYMBkywU8EU0XJ/wbaAZzjftFwQHO8akkDxJrI9YAt
	p06XiPQ5PeACBB0YOMSEstSdD5M6UwZX/iPTFvjf/cjviNToLL5ozr5Etm/fV+dIyp38zB6dSgCLA
	KrOrW1Ham33CklNdXF5PArfshSB2zCao4a8cF4VM21it4t6ecp3lyJPpa6w1L3UysWizNZYXACM9i
	+hdh6z/scHZzoQMn4kJpQYpH69BWMsnSdKeSgL9LM3ccpWFj3KdhbjKiasiUezjLCHmQHOk6jRcpD
	BFRntMsjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkqE3-0007O6-Lx; Thu, 03 Dec 2020 15:08:55 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkqE1-0007N1-0v
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 15:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607008132; x=1638544132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hatktVvAGxduhP/iDLHeSoHdg0yu8IwFJCKrtKXdNkU=;
 b=fLVBXJOMwPqzkK1AWcpdgS0VMgR+Qv/9tRN9fDMoh0zy+AXGTCSbzwQ3
 l5Gj1cOaUcGTb2CYIVA/B5CFgPhAzUSZjF3GD0zMNctWyX3nR3kIxH6lU
 n5zBE9YieO2QqRj0QfWHuXYvPvSOYFPVShef/N3w8IuYWhn1RUFddhXOY
 7Fi5jGubOZjM+ypFSYwGAi3/J94cFFPei5Zmue1vYI3q+duhXu3b/MnUH
 taRA1MODEb5L53AVbpvMJxlPplxO7AAdNIaMFa0lMfLZJWdPMyoUCVHpl
 vQFQqzWKBE9zSxZJUJz7bq51c3k1ggbIePSUsngM5ITqn6W3P7MhhL4Wp Q==;
IronPort-SDR: RdirafogSTcoEl8X3+9Nlq7p1ctQvHppQHcW+TtvuAI0aU12E+EZ5ONqU7hkorEWCYGI+KEEW0
 A6p6u4K4VHIORcTIAuSeTEcZYwPRdWF5VGv1z8erAtzFoCPZA6RLkZL2MhEZpdhWcebcf1jJuZ
 yH1Zzud2Atyp9mXdG23DnTk8eIlRPmaGBLNLXMLqv+7RGIR3Gjd3GU/9qSe/0ZQ878Cgb/d9zu
 NLJHlo2kPm/cuFO4AOPmKWL4op6EjvKj56dXyrh/xku9FFHYSLSziHmpUPKBh43e8feM3PUI4M
 Kss=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="106019743"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 08:08:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 08:08:50 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 08:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTCi+Cb9M86sg2qqxgb8oxzsiWvLe1TBsBhiRr4rXW0XTdQVS2E/6F55IkbhRl2gJarVFYXyJoEgsjkRJSCO6h2PEAacu12613eYDHJ03mkv0kidjLxWNl6ZwWa4G+cDWA4F6JYH0FQyXAUitcMqg6Zir8N8jQKWMAcMQaX3jysfV7xx5q96lyAGygp+7/nt0OPcxsISJcIHvKeahfcu+4vyuoN75dHNQjdyH5t9QhF6rE1ZixdC6j19sPUcol8tf9Mc9f0U+4mCB+1QF+0m7WfAlg/3ixMwutS4S2f0134BcVTnCp4S295ZSYF9Pq/nLgCkd31k2l/oB+E3pR4eLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hatktVvAGxduhP/iDLHeSoHdg0yu8IwFJCKrtKXdNkU=;
 b=gnS/XDb1YySzLhVmjLxkJfIHjX8OqL/cChIu6x4R/4lrSFQGCiiMtNWr1pgi2j+tgpGhhLQF3CLo4ee4RNTFdBqExuHEaM8GB2792rnOvGQEP4h5uJ4JYImEaIqUiyExRiIJYl5/3rHS2Ju1/lyhiA0P6DCgFMDzw7Jb7Ogb6KCVhQ+3+phC58+K4Pq7BQ2ForYUvQGVgq3Vq1TOMTtsPoFZHAjzlsOcyNntoZv1hzXyFcG/v6pNXF/OVUF9h4ft3mG+7+3hroB44ToA5PcybeQNS31km3cSt0wquu4sjQ4e5EnM0G3N4w5d1HFft2HXFfeTUEcK8/NqPJkxYzT8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hatktVvAGxduhP/iDLHeSoHdg0yu8IwFJCKrtKXdNkU=;
 b=H5XAVbm4qn02wJb0YttES1vcWj5eG4dTeKQi7e2h9Oxej7OGfaw2H7w4ezwllKsufil5XpxbcHvpkeh4+sY5O4cGLT3qEVzyqdOTIisf248bEKNJSNZrl7ZE/7o748V+8altoxkfpzGcuwHEXQwnQGh9WyFXlr4Yhf72JI/49Ws=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 15:08:49 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 15:08:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
Thread-Topic: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the
 SST25VF064C
Thread-Index: AQHWyYFhbYejLXpUREmrcdCKcR8FGQ==
Date: Thu, 3 Dec 2020 15:08:49 +0000
Message-ID: <2c66659b-ecff-c6bb-38c1-c1172780c710@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
 <44be8e3c-86ca-501e-e575-55f17747bda6@microchip.com>
 <bf31d41ca489b5d1b7976bfb8ede88e9@walle.cc>
In-Reply-To: <bf31d41ca489b5d1b7976bfb8ede88e9@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e2662aa-5998-451b-8fca-08d8979d56dc
x-ms-traffictypediagnostic: SA2PR11MB4937:
x-microsoft-antispam-prvs: <SA2PR11MB49376CE98E94D8759CCFDCC5F0F20@SA2PR11MB4937.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lr1UbR2YNpGO/cIj6E5ptOwqd13MP9cZH1sC/liKVAlR6L02+EmduVNgHQDd0j5K0npjPav3zPjYZdls8cZvSB2dThcEbdjNIZG+9HUopI+ALOOnb2qVOye40KOhkgDxlOSIAb+qEf4GMIbUZgOlvd5frKtwys8aIeiYYXR1Y4pWQcpKqv7GtBPgAivhUcEoT2MQ6rf3pqXaD3UuKx/fhANKXQmUc9EZWGvmirrm6GMxEXd4HfQHaMSD1wMZuAdf3nQkcb79/Tv4QuaCV2X12b4AWVmrAjpUKmGUfVmTDpUw0aOndcWv4EdWVI+qPMzX8qB6ipzRX2S6G0WtKufw5c3BOXiUBAS7RguM4sjqy0MECVsiZGUv0uhGOfhpN1nTcSKTFqMltnXbmGazrfk2ioZlYf+1oT3W3XBoC5whlcQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(39860400002)(376002)(366004)(86362001)(66946007)(316002)(66476007)(8676002)(66556008)(8936002)(26005)(64756008)(6512007)(31696002)(66446008)(6916009)(5660300002)(83380400001)(31686004)(76116006)(6506007)(54906003)(478600001)(186003)(6486002)(2616005)(36756003)(2906002)(71200400001)(4326008)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXNWVGFPZ3lCMjNHVmx3VC9mWjRuTUtGbHplZEpLemc0K0E4d3hTSkFRelpD?=
 =?utf-8?B?MExZUCsxbG1QQnhyZE1raEJZd2sxeWl0eERsYy9SL0Z5OUpFWTJLQ1kvTkJK?=
 =?utf-8?B?ZXY0Vjd1bi9QWjZpWHBCendSOG90MHB3Q0Vra1BxMFdDQ3YwUXFEV3lDamRC?=
 =?utf-8?B?TUtWMUVtTXo0VllURXFQU0RqM0NsNUptU3hpN1FkZElWMkZmL201dDEwTTV3?=
 =?utf-8?B?TzAxbnJDQnREYXpVSEhDTGhkSHN5S0R1MEpIb3YrRGhkQlVXWTlGUjlLV0hu?=
 =?utf-8?B?RGFxNTJoRGRkQ2VYczVHeHIwREZxSDZjSS9Rb0ZFRXMxR1FOV3c4QmdoUEkw?=
 =?utf-8?B?WkNsblNuTmtxZ3NuUDVnSlZ5UUw4aWl3U3hLMDNDdFhMb0taRUpvZUNRa25W?=
 =?utf-8?B?SXNRL0ZhME8yNzJDMWlSYWVEMmxIQ05WS3VBazBwQmNMT1I3WXc0RGNhdnVx?=
 =?utf-8?B?ekRsK0hXVmdnbmVuVmJxeWVGMmwvaUcxVnhVeDlsbzNTVUlIY1E5UHNjQ1ox?=
 =?utf-8?B?MTViUnBxU2lyNnBQUGI2RWR0ajhES0IwSHZkQ21IT0F4RlBDcnRyNWIvYU14?=
 =?utf-8?B?SVV5RGJ0cGM5ellwcElqTENhOGpodGVhZTN3UUtUR2dZLzZ0c3VTTk56enow?=
 =?utf-8?B?U21JTVdGeWZwUjZKOXd5QmZJY2pEbWExSXlsVUhkaGFkSnVGaGErZktFeVE1?=
 =?utf-8?B?eDNEUDRJQzBTN1BONjFXdWdwN2lzbnZGRW1WcGNXNWxoS3ZWUVUzbkFxNHVP?=
 =?utf-8?B?cFc5ejRYaENXNWV2b29xbERJQitXamtTNDZOamhVUnlWOWlOekZZT2tMYURL?=
 =?utf-8?B?QlZkd21adi80RzFMUTVCOHR2SEZjaERPU09qVGs5b09RR0FzU1J1MEpTeE16?=
 =?utf-8?B?UGN0dHpxUXVYb3ZCYWdLYmJxdm1TT3JNTVJrSzZSdTErakZRS29yNkRldGxl?=
 =?utf-8?B?dThyMGFMNGhKaklMZFdtRlErcWp5UWM3ZUc4M2w0Ky95bzBMTDVSSWlxNHpE?=
 =?utf-8?B?bTVheXgvWWlqcXQ4U2tCVG84UWlHU2lUK0tyQlJCYm96eVpWRHI0ZnFSOXJE?=
 =?utf-8?B?aEcvMm1CS3YzbTJBcHgrUEhvZUlvakY3UE5sSFVwTEhlcE5KRDdGNHMwaDFO?=
 =?utf-8?B?TjVSR0VEUUZ5YjlJR254eFVmWkpDbzBIS3daMXRRb1cwQWhhSzg2bzNzeTRC?=
 =?utf-8?B?Zm5DbUNxYjRSSkpVbStUdFdEVGlEa3pUYXpkM3VvUmFqQ055MkNNWmhvRUZ3?=
 =?utf-8?B?bzJwc05sWFZuOHN4N1NYbU0xaGI2OE9Od21ZbnZFQUkzMC8rTGFuZDQyQTk4?=
 =?utf-8?Q?PpliP1JEG7w6o=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <7E662DB3FA43954BAAE5A5A0FF5704D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2662aa-5998-451b-8fca-08d8979d56dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 15:08:49.5432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7hkPoWgn1wJAqYf5mwR5di9N0yK0nmp+tXl/4Xxu2B944biMkhN7hiRg+b0WY2J54ln7PYdm93uHg/cJoVvhCGEYtG+dFmyqrEEXswABZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_100853_333746_43FDCA6A 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/3/20 4:39 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2020-12-03 15:34, schrieb Tudor.Ambarus@microchip.com:
>> On 12/3/20 1:00 AM, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> This flash part actually has 4 block protection bits.
>>>
>>> Reported-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> Cc: stable@vger.kernel.org # v5.7+
>>
>> While the patch is correct according to the datasheet, it was
>> not tested, so it's not a candidate for stable. I would update
>> the commit message to indicate that the the patch was made
>> solely on datasheet info and not tested, I would add the fixes
>> tag, and strip cc-ing to stable.
> 
> What is the difference? Any commit with a Fixes tag will also land
> in the stable trees. Just that it will cause compile errors for
> kernel older than 5.7.
> 
> So if you don't want to have it in stable then you must not add
> a Fixes: tag either.
> 

Documentation/process/stable-kernel-rules.rst doesn't say that the
Fixes tag is a guarantee that a patch will hit the stable kernels.

Since this patch was not tested, it's not a candidate for stable as
per the first rule. It's a theoretical fix, because it should indeed
fix the locking as per the datasheet. Even for theoretical fixes, I
would like to know what commit broke the functionality, and that's why
I asked for the Fixes tag.

We don't want the patch in stable, so that's why I said that I would
indicate in the commit message that it was not tested, and that I
would strip the cc to stable.

Maybe it's just my understanding. Others may help.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
