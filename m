Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77519C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E297D2075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 09:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cm6J1pSn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BuhtvMlS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XOGACClK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E297D2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QKDP/KV5av/Y5c1wu6kvFI7WZ+ok8AYju4uO/XCsYqo=; b=Cm6J1pSnKfgl/feIX+JbhS3G6
	o3kcI1CqqKxDi/CowjRp0kp7VfEyIjzG2rF3GhtsIkgLfGt8XGXHmcc9SRTjlm7uzJkQwlSBD9PzD
	J46yLDg97gYFDfTVGYqpA0fQvskXEB/ACaGx/9KB5PuSfCSy3h4lpBJ4kD+rkiZaHd9xeRRLqCXiN
	YtChiSqrbDf6uwRBSzhnoGLPdf7oSW6csxhTuqA/UScAFv8Bpr/LLhZLwSKZoMZvj2PCQ9r+BaWhq
	oWS4bRlrkEhfK9Jns2a9Rcjh5hdlz3dQF5kaQVKifHDXVXsF8b4w6q/vMU21UwlqqAYy5ZeaHYzvs
	6RQxNQVfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNYrK-0002Ki-6d; Wed, 30 Sep 2020 09:57:14 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNYrH-0002Jw-Mq
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 09:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601459831; x=1632995831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oy+zjxaLiiUd0sbpo1fg3iDBOFpEZaUXO3vi2U33xiI=;
 b=BuhtvMlS8bgNZRISXIK0JyUDFvIlH3fw4OktQpT34ieEWvDFy0EkykJG
 eYySASZaCD54TndYo6epk2HSmuWn3ocmBUHFqnOtizXieNAQBAQZRQ4Ap
 CHvAWg7EmlJCUlGREwE6+2kRbY2/+Na+ePY/Wdmk55IqwRaRBJwximF+U
 CLZBu/5fBvSz8R+khpOgzaPF8+CvST5s52htPp0O7IKHrdjYTI7qcEH9h
 5HhjWkx3PQoOZGJ71cHwXM1u/t+rWch7bI7ZjQtsWO4zYhTumCj6byh1s
 G06B8lgjXQmQRzLujQ4nXH6b822u30mHu1ENopEsPfaLUqq0Ym0H0gq38 g==;
IronPort-SDR: CqgIw+gmdD1T38n9iylH8rkCWjm8uyACW/bITQBmlNYmcPj3VozrTdyzvmbhODiHAl0bAuKcxf
 B07SV6fl3YhyN7nlXiYm78r7lYegiHSW1SwM4+YLb/LqdhHYNYjpxtvPJjS6wbx3ZHF68RwD1T
 kN9Jn7OdscPUgTyJ2rljD+VRITDbie558s7Gp07M8NpuGiwSJ00Ma9u62Cy7aHYQIVz3h+Agj5
 UBbLMv3T26hivpUuZBPRz0nSCX7ghB3DirLUj1UD0/kN+SDDWf8IfnZt4HGVJie4AMkYd8gsfo
 FVA=
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="90923872"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 02:57:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 02:57:10 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 30 Sep 2020 02:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiAckfMacbIhe+TsUn9Su8gmGAuLlAMbmPNFoJ9MCesMKMLuCCGO+L5CXQUy7Ei2UenFFK1HftVBKQDPHeE1i3Qf8vCchsSLNTApj/ZjT+FrdFOcb8t/P+tGaLAAu4/WBNl/mE/CR156Horo+tuto/Qs1ZadlcD1Ta6snvHW3AAJNa0A4BKkseY9mUReDajwe24f9yXgZ8xa2GuKDyeLo+1xlYMSqcBN8XmiAobOSDGcV04gk8Tw3Bw8dshrg9bsE22YZFuDNVmJvGhoBJURGv8mZHPT3aziVEu7DidTOhBu1l0PI5kQx2FT8SVs/1r2+dKJ6dqazvo5XWgKI3cyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy+zjxaLiiUd0sbpo1fg3iDBOFpEZaUXO3vi2U33xiI=;
 b=JOZKBapDz2kyBJxWpds9jm4DHdfFF29zzqm/9tnDnOqtgXPHBbI1YTJZ9WOHd8t+YiwIFZ1WE5bqBpt8eoTRMTAqUdSaS+1LRj+vpvEnHs/kGdU4phaXi6fSruOIHy0xV2ZJQON5LOeUU9e/6xzyDx74q/VOHpxaR3JAImtuoR3j/mEPzDSi1JS2NunW6+GeYN073jqQRN4LrZ8xsBQkKZcEzv/kZKM70/1GFb2YlwMYXP7NQGTyJ8afCq9o4g6hktVe3qTyW7PjkSgUFmZIjnY7Qz4XHVadOzKpw2jJ0y7lQEnoJeC7fzwoAsTS+zbZwythL2Ekqhp2Rb0STrRRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy+zjxaLiiUd0sbpo1fg3iDBOFpEZaUXO3vi2U33xiI=;
 b=XOGACClKFX1XhDXHcPMZblIYfTPPWO48rTJ6Sfa5WBpyU2yZffvda9SFoxQs3G+Tk77nqhKRLhERRGPVmOrkGlK7EvGDJa4khy768OHMt0mZ/ZbWIEdIH5RL/RJ1dQnnXpWdlWAKKBiLY7K0+mviYrRlWmxROwU0KRwITPKsd1c=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM6PR11MB3242.namprd11.prod.outlook.com (20.176.120.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.29; Wed, 30 Sep 2020 09:57:06 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 09:57:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: [PATCH v13 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWlxANNWms9uU8o0WS4BnhtiydLg==
Date: Wed, 30 Sep 2020 09:57:06 +0000
Message-ID: <1cd1b952-9126-516f-d8a7-91149a815ff0@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-1-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b04dd2d-5461-414b-8ae2-08d8652730ac
x-ms-traffictypediagnostic: DM6PR11MB3242:
x-microsoft-antispam-prvs: <DM6PR11MB32420444CC3B9C552A71134AF0330@DM6PR11MB3242.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8VPBSChpM96R0HZkqDHBfopu+q3XI9qDN381+BODrGW0YwhBHGuMUwwn9WpAMpjUic4TFl4qOLFAs+Xcmeoixi1I8uoJZXmK+sXd20cOWWltCIzYy5FjqcIzwaC+qRigwfU3w8+VoDh8uXMwYO8J0nWNTm2pLicKnefihzhRWbVa/v+eBY/LQ/rNoKz3xDpJx39gcBMxbLDsZaCvHdFN23ub3JLcEdqJ+nYmnES8E0TvAT1nk6bk66hxwha2QldAz2UCArxjr4714/A2mvMcemAlrZgzWXRl0Z0o+zmdajRXHBWN0ZBLqQ9cIuRXY8QpuB3puylJlZEPLtB/7BhSa2cllu4ptYHFJd1OZHv49X3eBTX5SncVP+DDgcDglLmNmhi+4owOoCCpFX5+9EVzK6j6BvtSGVsreAuleSDMIucqAHIZpAjncNlOHLO5E5rB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(396003)(366004)(346002)(136003)(6506007)(53546011)(31686004)(478600001)(66446008)(83380400001)(64756008)(66556008)(66476007)(8936002)(5660300002)(36756003)(6512007)(4326008)(86362001)(2906002)(26005)(2616005)(71200400001)(91956017)(66946007)(76116006)(31696002)(6486002)(8676002)(54906003)(316002)(110136005)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Zy5BxJ1RF0teLLFjyf9XQ4szclIEN0E5VC6KmTsLxalKQSiYVn0swk8Kit4smfjade7JqPdWYkLufwGTa4xCaa2RHAXMM760Ddz4YUuuKLja/QasFxcVFLOrwTFc/3hjV6k1ry0xVqkSvNSn5QZenC8DcaeDQ0S0qLW9WE5QY1KqZ/qUCzvLE49DVLP5yhUooB4SIsj5xiXkxPfAlQn44MqMqmm7ph3bLFz8Zcnlh+PyZa6ijqcxcbiiytDH69o0PqrA0w7tHwbkKqXz6MT/paJOf8fDTIa6GnNkbDqD7pY1ubCbEW4ykGV4IEf2I+yLG6n5wqBD7tP/WEhSKtNWsUe9RLKPxJwKcRnvY4wWOVC1SPoqvNFkdq53ZTRZ1beAFuE3li8U2/nCD7ul0h+0/uLswhwfRGBfOWKlfIZtXpLIMH9o2KDRJ+ppE3vC2wzQVNqOYbxPqOh0kCLkWTXIaq/iNV0xM5UkC5OdAXZvljYTk3kxNKWkydvTxWfQWBBpUJVApGP85deIaareq0UQIUj9rA6pHvAcrg7iZihLLB4kEuMQOWKwXuSdgb9xK0LoabuMYAQyczcOQRO/7/mU00idMNYhBoZDn9LboDBI3QHEtudd+w0x6l4Jhd7BDnp4C0CaWqOFGb2AjjVvsVfyxw==
x-ms-exchange-transport-forked: True
Content-ID: <8F6EA078592F744697B7D7EB5018B968@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b04dd2d-5461-414b-8ae2-08d8652730ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 09:57:06.6289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi++KMPqHLCS2tVDsAxjuOZuKbQvEJRFlrfwMK+pI4CPEqGt3lDbnxLlmGtayH9BSgiYXom34yvJESpZfpRGwRLKFJHAEqpJUCsBYrqc6/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_055711_979062_5C537562 
X-CRM114-Status: GOOD (  20.48  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> Hi,

Hello,

> 
> This series adds support for Octal DTR flashes in the SPI NOR framework,
> and then adds hooks for the Cypress Semper and Micron Xcella flashes to
> allow running them in Octal DTR mode. This series assumes that the flash
> is handed to the kernel in Legacy SPI mode.
> 

I like this series. There are some comments that can be addressed, no big
deal though.

I think that we shouldn't let the door open for users with flashes that
enter in a X-X-X mode in a non-volatile way. Think of two flashes that have
the same X-X-X mode enable sequence, but in which only the EN bit differs:
for one the EN bit is volatile and for the other it is non-volatile. Users
of the later flash that try to enable the X-X-X mode (using our code) will
end up with the flash in a mode from which they can't recover. Thus my advice
is to consider by default all the flashes, as X-X-X mode non-volatile flashes,
and to not let them use the X-X-X mode enable methods. Flashes that can enter
X-X-X modes in a volatile way, should discover this capability by parsing the
optional SFDP SCCR Map. Those that don't define this table, should pass this
capability as a flash_info flag when declaring the flash. With these, users
should be conscious about the V or NV modes, and the risk to end up with
flashes for which there is no software to recover is diminished. This is what
I tried in RFC 1/3 and RFC 3/3. I think those 2 patches should be part of
this series. 14/15 and 15/15 should be updated accordingly. RFC 2/3 has room
for discussions because it provides access system-wise, while ideally would be
to do it at flash granularity. I'll wait for your feedback on those.

> Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.

As a tip, when introducing some big changes to the core, would be nice to be
assured that things that worked previously are still working now.
An erase-write-read-back test in Quad SPI would suffice. Probably you have
already did that, but I haven't seen it mentioned.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
