Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A221DC433E4
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 09:38:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F83120B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 09:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gyUuiyJk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="EUzuxzJy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KOcbzAU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F83120B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+SIfHIzPYI0SoHWfby9aKa+O9lJNXNPgY1ST0H8Ngs=; b=gyUuiyJkbFWI5E9wIXmV4a1EP
	mgh3ZxOMfopvoPV/pC9hxYFfa2u/gf0Ppfx+tBnLQorZ9M6UUyUdD/P/+LNShLSh9HxrnwdshCY0e
	AP9xAVkoMVOY9FP/FZjAazVoK3tnIDzS0oaw+PM8BHDsBdF/NKisV1e7LSd0WZWbKc99zC4/E70lg
	5P7Dg/XXRvQ+odGLJf/H5gIPaRnt7nS6kNUghtYggUwtNiXGbLyJKrrUBpbFinJi5qZft7K9EzABr
	xYPCNcVLNuBauAtW1d5f/T7O1PzOeGWfENXw56DM70e9lBlp2riUl77fg/o6V0ueu29SNgT49MtLI
	rqCswVrZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoi1-0000yj-33; Tue, 21 Jul 2020 09:37:13 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxohw-0000y3-7I
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 09:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595324227; x=1626860227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=368XCf7q2Xt6K/sbOMaeZ2RJcVDtU3xhpqjdwKXpatM=;
 b=EUzuxzJyvbeMtQxGg1aNwtwgEeG6Px+DAo1R71zd5bOU8AjO/a3PqTv6
 26oUP9kgJZN8u+N27HRKf5DcZ4Rb7F1Z5JJubWeRoBmft8YHdqIaiwhgj
 AHi2vCLeYm4cw1CLWuC1wE1r656jRbKG4fxooZwMLskdMJl+kQdPOc8Bw
 QmAzr0vQhK3OJUQK0wEkz9g+9N6cSseM86e8Klc2qk1Lta8TgDPdQkPEG
 qGQKXt2w+g/iTSjcl8AsLB9uhxywIetHBXlpmk6wrG0QmXBI7BDhu0eYc
 lvMTce9N4Evc8xqnXTgUcGGOX6eoWy1kzWbgz8FACN+uZmHQjIq1b90Cv A==;
IronPort-SDR: 8yrOuKuQWn6KBqk218y08bPJjxXjx4Ri1ZaIb6wQ9UXPMxi3hMcxzUzZZGxjG9CBb2XgbJuyH/
 6eYP0DylaQ2zH//SBahFqjZZfT2VhfrvIgr/1GkqePMdGWxKrZH0EfwI5aXaKLsmPMc4STLta/
 fLP0dOSXS69xsHm9lVsjxJ7y9CbSpgX4c1k0lSdULXeAh0VuKojAaYxn2QIs4Zwh0dIZeI+dn6
 gwTryfH9YvH/BGuxJdxqjDfDEpxEn1AEelsx+kD9/qq275V/VC4Q1OJfGWIzjbjR2l+07dZ3kj
 dJk=
X-IronPort-AV: E=Sophos;i="5.75,378,1589266800"; d="scan'208";a="82640856"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jul 2020 02:37:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 21 Jul 2020 02:36:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 21 Jul 2020 02:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pt9Tic/apFnScjSjw77UJXrFM6CS+Bg0sbpy97z6alVZvAiRlo5m7twqpxyU0KcLOrgyqodprI49/ulVJW/z12vI67yBHFpW75CJUdDPm76GlKM0d9MGx7fbRGyPkc74bG7xbLEKAzttSRmRqMpP10O+BL8QQV+ms2vwWMQt7taW4Lu2XPa2pakVQWFy9GSTK58w7Z/36/8dzyEzIZYLgKALkA366oFG/xClP92WVMrA58HcDuaDBz4AFakXkSEsDy4XOEvlmJEE2ZEcDH4NpxPPzzw0dlCFvrKuNRsZXWi+/6xLuDGDsBiPjRLZs33kI8MyCmM+dUQVuFvn6Y6L0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=368XCf7q2Xt6K/sbOMaeZ2RJcVDtU3xhpqjdwKXpatM=;
 b=Q7xn1bGdFm7hll0FMOsCI78wmBQBUHAREu7eD7zssYcoREMAeK6MTyFk2AByfSsJR8h2BOxkxoCYG5AWMxhDo/URK1K9SJ0UjXCqxqCU4sf0LX4jHvleAO+jbxbEmGvGtblVRD/IPOaQBgPV/BUu619WFED9+T2H4BBiiDMEwNnQG61xATYxntQ7ja+W+F4WVM1nMm9+ndbRP63C4khu4VcUvEY0DN8G+vW1M4sZgrnFI/u1p70pyjVbGGtg7UQphW9fI+T/9UO6FMwXwDt6i2lIyOpsl18Qo1h5Nk5NyZEf1hMHmAhWJVN3Kv/lB0Dy6A5afHvpDPl3XvI3CDe7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=368XCf7q2Xt6K/sbOMaeZ2RJcVDtU3xhpqjdwKXpatM=;
 b=KOcbzAU9O4CvjOVWtZnwbkDhovo3UWJ8Dh/DqFPl5TaeQfSwzWLWMMmUM/JCkMHFNl5jleBCdouObfgtcg3nUCfdnHEQR7MHDNd3GlWZl9Hs2f4ghYgakUw8qmtjPFqly5XN5gVL9USwynZxjF9s9AXoVkdLm0MA39ZhrgfVf/Y=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3206.namprd11.prod.outlook.com (2603:10b6:a03:78::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 09:37:03 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 09:37:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dac2@pensando.io>, <linux-mtd@lists.infradead.org>
Subject: Re: [BUG]: spi-nor: spi_nor_init() fails when SR locked
Thread-Topic: [BUG]: spi-nor: spi_nor_init() fails when SR locked
Thread-Index: AQHWX0J80aMKh47pfEe1WfBRbg8wTA==
Date: Tue, 21 Jul 2020 09:37:02 +0000
Message-ID: <1ae4f44a-cbd2-b39e-68f7-3d0375c453bf@microchip.com>
References: <CA+nMikGSSc5NA80Z89fz4GCh+6Ux2Pr6UyjB5n+qoBkiOqAh=Q@mail.gmail.com>
In-Reply-To: <CA+nMikGSSc5NA80Z89fz4GCh+6Ux2Pr6UyjB5n+qoBkiOqAh=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: pensando.io; dkim=none (message not signed)
 header.d=none;pensando.io; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf699446-9aa5-4be7-cf5b-08d82d599fe5
x-ms-traffictypediagnostic: BYAPR11MB3206:
x-microsoft-antispam-prvs: <BYAPR11MB32062A7BCC8ED0CEEC29BC6BF0780@BYAPR11MB3206.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nm4X3hLCVSUC1V2+uMDZoEEAzSLCS634RinQEX/fr9kOVKFErEUgz/+KVjhrxpv4jxiJH6BfCMTdJkeW1Pkz7u1ku8+jRMIl8yOWxeyURENSErXXELLuLanjG7a0jCE9XOFioMP5I31yD6Lh5rSQySXs4tmPXhTnkTnE8nOXL1GljxgfPVxy/LmedOKtkPbqzgW6DEQ41kzLC+7o3ycws3zmM6YCU0Xovmfb9D7v1P+6tmLZQLwh/GDXLmrk1JiLpjxGi4Gmj3Cpsj3rk3l26bRiO8nNlAtidM4vP2iyfPuEZraFiDEzuaDQ5zVzaoWFn8CPzzHJL7oYiCBEYJQX/ZmHA8+fKozK2y7Gjq0eJAhcWm0j7pYLU4FyssWUdpJ9e4ZfEXcMmPhoWFtYOY6LRBz5JXFFhL8zunJtN5nQ4OHELGYdTt4yDoBp9klZSSgvp43x786bnE1sbQ8Iziyd0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(366004)(346002)(376002)(39860400002)(136003)(2616005)(66946007)(91956017)(76116006)(8936002)(83380400001)(8676002)(316002)(66476007)(110136005)(66556008)(64756008)(6486002)(36756003)(66446008)(31686004)(6506007)(478600001)(966005)(31696002)(186003)(2906002)(6512007)(26005)(86362001)(4326008)(71200400001)(5660300002)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IgzKByH8jVgxzWj7L+FVW5BLm0SUrui6GKzcYh+UIt0+yPLk0aXy1rWzLqby9/MEGWQP1Ihb3E8JfrIDvXv0HECJYN76fYuHxODSxD8i9qMlmqJyDK+tR2dCbJnm/5dSZ11bV6OBEuWMQ8OS/EGN2zVckxnvNzNzyQLxKrcsAnfWUGvlKuibnmKDw8vXSRv8GxxyCM3oAL9MiJ8WRs00/9D/MxR2iQ46BWNZEbhVBxkXzVbBfWNHPMmr+ztp0Jzeqd/lD+oT63Qa2GllUayQAgsb1CWWoK/K0I3FvaKRIKjKEJ7O8dblGCDeMQoG4rfMZFBTkyiKM0/IcSd4XXdpweDftrMJqUAGsrXsI7QR3LbPcb4kXpf/iz5tuajp5Rfzl3VjzS/hG1dLvdcyGKi6oIXkoP2/Wl9iRoW3oRh+Q9bu86F6kKf6r+uqa42PPMX5AGP75ptV58YCNQutsTUtmCS/W15xwegyEBA8gmMeTEk=
x-ms-exchange-transport-forked: True
Content-ID: <D6CCF1C98BA0CF44A2DE3AA3BC57FA08@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf699446-9aa5-4be7-cf5b-08d82d599fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 09:37:02.8963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJDG2yNu9hXR5Y8y4yXHPmPGejRf6UMLWU6PcOK2p+ZxkAonzQoKChRmNo3oHjRO+VM3A6P2JImkcaX8gqD6dr3ofiCWRrY5eIlDB6ugNKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_053708_560688_A8624DEA 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: michael@walle.cc
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, David,

On 7/20/20 9:13 PM, David Clear wrote:
> 
> Hi Tudor,
> 
> I'm seeing a change of behavior in spi-nor/next vs. my older 4.14
> kernel w.r.t. how SR lock is working.
> 
> In my system with a Micron mt25qu02g, I'm using the hardware WP# to
> lock the SR.  When hardware write-protect is on, at the next reboot
> the kernel rejects the flash as it cannot unlock the whole device.
> 
> I traced the problem to spi_nor_write_sr1_and_check(), which is
> writing to the SR and reading back a different value (as the locked SR
> bits are immutable).
> 
> Call trace:
>  spi_nor_write_sr1_and_check+0x68/0x70
>  spi_nor_write_sr_and_check+0x34/0xd0
>  spi_nor_sr_unlock+0x108/0x230
>  spi_nor_unlock+0x54/0x80  (via spi_nor_unlock_all())
>  spi_nor_init+0x94/0x100
> 
> spi_nor_write_sr1_and_check() is returning -EIO here:
>         if (nor->bouncebuf[0] != sr1) {
>                 dev_dbg(nor->dev, "SR1: read back test failed\n");
>                 BUG();
>                 return -EIO;
>         }
> 
> In my specific case Linux doesn't have (and cannot be given, for
> product security reasons) control over the WP#.  In any case, I don't
> think a write-protected flash should be rejected here.
> 
> Can you suggest how we might proceed?  The way WP# is used is
> board-specific so perhaps a device-tree property of some sort in the
> flash device node can inform the code to do or not do the
> spi_nor_unlock_all()?
> 
> I can take a look at putting a patch together if you suggest an
> acceptable mechanism.
> 

Thanks for the detailed report. I'll have to study this a bit, I'll get
back to you in few days/one week. We tackled the unlock_all stuff in
the past, Michael did a patch, I'll check how that fits here.

https://patchwork.ozlabs.org/project/linux-mtd/patch/20200327155939.13153-1-michael@walle.cc/

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
