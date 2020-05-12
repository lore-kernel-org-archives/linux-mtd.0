Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A360C54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A49206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qpRZv2+B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AcB6siq7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cq9K7qd7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A49206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7vFK/UJd1BPt4ivlWQTauEMNC5EvPtjHvqQ+wuM9P4=; b=qpRZv2+BOnGmRX
	ShONZ0pI8WnWAwJgkadtmP9K4WATkX1pMbTvEMH5oPWvjx0owIgLsEqYHamRVjsBeK++Uy/F8nupY
	+BZ3pDEn+Ftxge19pji2vwPz69myMKJXY3j7vm0SAOzSR27DfCMSlMTBNoxF+osUPC20Q3FioQbxI
	fVFiDmcvD+n3VUdd4dDPkjKSk3ZjUMoJ+2Y3lvL0nU7IzV+asHhGEg7crUBqlcEQ51R4h4+nj9KvC
	VmSjYFp4eDi5VbLiK2ypaAS5JSxZJrNAMXk6G2XOJMkOfx1sJf2uCgfKrSHrNZtNi9J+xfFhl7NLD
	r/0vCOJSrWJ7pGaWEaag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUWn-0001Q9-Uu; Tue, 12 May 2020 13:00:57 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUWk-0001Ov-MV
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 13:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1589288454; x=1620824454;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bsG7sbUkBlKK8BWnCxYE6GIrqrx0RFEu3ocOn+OzBsw=;
 b=AcB6siq7rZMLssMYKPjJYauI0kMx5mN4itWmVNvqAO5+/yMEPGCBxaOh
 vsFOrZPPkg3Xpa/OKrIlCklvmpmORhQI+zWbWOA0Y9K7vo1PG8rNo9Dt0
 xDuaDra4VrMm8ReTjiMpxBOfMtU1c8IvVs2DR0Isi8xtW++1+WYjHstKm
 MhAwGbeCEelHO+6mhWKdyDxBFkuGaAJT7dsLreQDcmd2WWjlU7MDb6Not
 +oTRLwKEqQzUHUXYc3wb+tLdYAe8A63doKgXiCaeTDI+BO2Xp5zSI1pPe
 H+i5MaX+CpmkyC63ecJo4HqecwCTfI2a/kivS9rDu6a3J/ruBdUZ7uQRZ w==;
IronPort-SDR: W18+ITy0ZJdqxPmRUhZ5N7jxnrcJUYOwmet39mfvV1xNWScsMYE300eiH5sQVGz5aIbXH+OOXs
 JmDWTRWZwcxrXGhMahmtIG/NCx/lJIjuhfSIDXQ80e/GZ3/AISUdgiRiPbDG4Gmzd6DKQBZ0kx
 2bRyGK78eIZyv2MnO5hm4m/UP35HtYDpmedNK9i277uK9TsRnLHEM/FShVR0wz4thhsia6vUOU
 m8GsuVVmuZhwX1rlC/I7mb19uZS/5vdi31IHNG/9XpKO+b70Kus8id0bmL3UdXUjubQ51IOt7l
 6UE=
X-IronPort-AV: E=Sophos;i="5.73,383,1583218800"; d="scan'208";a="75622159"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2020 06:00:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 May 2020 06:00:43 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 12 May 2020 06:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR25NqFIFG5S8BxriXuv18cnYneNKfvviCHv4pS0kWI4YJRXlK+UAajdDGfWCr1ZxVlAMkXnlhGWO47YsZtpuPO+q0tutcsL6JGf5+1b5DJfBqD1Fs1LyDq3nEon+GGpLlr1rtcFDA73Dlj63uxHD/U/YewZ+XS2ehu4TeVvMTIVMhfpW6f/tGsFOY7Bi/p8Ba+TBDniWGZYeoeS7D+1X54BlTls93ukSPNC5o6dTzdXmpMceI3YCmYaQ80fqlolue8g/D3t6JwxnQ+HFJyDUpPpCT6Jvww0LWkLdt2GsiOlXv0+CRCLAdS/oGVJR4s+P4/F8gbhykhKsemgfqfJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZRcdHav58wu7xYrb5AKe1dEwtVf6WVXbSpismXhotM=;
 b=C3AJKNsludhlL8ZIddA2RIj5CtwCqcZEh0pjV97NZYSetXUW3PWoTTkQzkTDQO81jC2ZlNXY7aHx4JS2p12TFhLLQXzQCTFM7CiKluOgdh059rQjjzZwkMV96xOshg+jdKV/ATWQ7xm36VK8E+wF3xQyLlVKqxBBFrgHiYejnQKMa4d2FijEicD2gO9FB/nh7dxwXpfHgL60pKPbTAABP/mTA33AQpLYiZH7boYvxn72DwVZ+neODjitvaDZn7El9pGhbnkmJ5o0XZzTGbK0w2pVEF7uzhJn+3aWAKnBALI2qJci8kpW52vmXepnuc96rFF+49nCRWc86mxUoAy3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZRcdHav58wu7xYrb5AKe1dEwtVf6WVXbSpismXhotM=;
 b=cq9K7qd7jX/nlFLaAg5b2BFjljovLR9TLKpo1OlUPNJmJ/zLNUwXV4m3xB3fLBSnOFNTwkkks+p33v8dwyvhWa4VgBkiFCLFzcfiwsGT+HQTe9KebZFUkbwSPU8r751kRuJYdKfH9WDR4FPGVjPcodeZ12+YyBzlMw2pAeX21UU=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4370.namprd11.prod.outlook.com (2603:10b6:a03:1c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 12 May
 2020 13:00:38 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 13:00:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 1/6] mtd: rawnand: atmel: Enable the NFC controller at
 probe time
Thread-Topic: [PATCH v2 1/6] mtd: rawnand: atmel: Enable the NFC controller at
 probe time
Thread-Index: AQHWKF1Vk+XiWiD4K0Wsql1D3GA7UQ==
Date: Tue, 12 May 2020 13:00:37 +0000
Message-ID: <2383526.aXbtAW8fS3@192.168.0.120>
References: <20200429132046.583658-1-boris.brezillon@collabora.com>
 <20200429132046.583658-2-boris.brezillon@collabora.com>
In-Reply-To: <20200429132046.583658-2-boris.brezillon@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d92500b5-4c24-4503-1cdc-08d7f67477a3
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4370CA909284031B31F4C250F0BE0@BY5PR11MB4370.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0401647B7F
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lhTe+zOxq33X/s3cuPvTjRtTbWmt6SY7V6DhS+0xiZ6eCJ4gdIVVfSyru2uN5F9Qln6RENb+K4EwoPkpYMHeD1Gaq5tdNj7Z9eRwsbfGsWkD7cNGLft3C3xl6Hc5IEBk8ihYwIs7oXYX9LfC34s0uSwd44c+/y0gABWfjNoL8EZ0ffwy/vHZEbXreSDsy7H0M+0GUniqQA1izZgUQaMXwMckk8zFSsswi24dgLjpdbqzW1+JKFCCTVA9kEAhlTwoi5SNe21B5jGkN1YS5XmXZWZtytkDbTFqyaEf2Y/19NwJD7YW7tjdxdzWKY0G5Rif8qiPoL4PZjuh98LlkjpHMCcg7TIDc6/u540a/P6f/WS2iSfaAvai8gq1SNaFtZzk/ENjaLC5gPv5YxyCEO55PqQOr2rv5cFWzd0CCzxHco1Kxw1Vb/ULdgcfgNLRNdG/vkeBuUnJ5xx3QrSwSShNJucAXwCObNg7mf62YV2nWrG+ube84MRyAYfW6e1RszFw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(366004)(376002)(346002)(396003)(6486002)(5660300002)(26005)(66446008)(64756008)(66556008)(6916009)(66946007)(66476007)(478600001)(6506007)(53546011)(76116006)(4744005)(91956017)(4326008)(14286002)(2906002)(186003)(71200400001)(6512007)(9686003)(86362001)(54906003)(8936002)(316002)(8676002)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: pfPjSRzOTdXMKeCSeLLwWKIVzjTgNtrIopri3v/8dg1Q8maTrIzA+oVZ+oc8Ok9VdA6XQ/SQFPj4vTsEg2M/xECvRm/4n4vI3BU8nOeMwVlpDTTa+J2XJR5XIzen5A73J0V3+MQj+xcAlgYKz4oB+I26o6yztAFUAza8Dngspd/WnHKPaSvE6ik0M69TxQbIKZSIyUp8qnW17PQ8tTvrNIZBsDdf8zmRTKF8N8g4W51M1WNgmg3NaD+0XoKgmHeprLQTH09nGZUu3xqUetuv7W4zl4AkALE6rhB4sZx0L4AhP0xduMeL1gGRKQI9MieEW/VAVZGbLJlz45wDe10h72w0yNrc4wRd9U94757FJzW57/7Uvl64gxjgrt0QJd3hn7SqtJIAGD4gD0yP9h9hNY4YS+bXLFWXWbD7gC+WKn8yNw7SiT5cdIjp4DD+kee2yr66mnReBRU0G/QyJTpI2GEBbN1PnaCFVcnnpVEn+s8=
Content-ID: <16A4200906E86F4CB33A5DBAAB90ACF5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d92500b5-4c24-4503-1cdc-08d7f67477a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 13:00:37.8742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1qnfWZInubUA8XUmkKjJGPFjx1xtZHm8byjjBfqf+IUPWu7v8WBe7TB51UFa0gwOC5M897tOy3/ubjlvQfvd8DK4iiMkjTUb4Hr+C331dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_060054_831845_95EE425A 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 29, 2020 4:20:41 PM EEST Boris Brezillon wrote:
> No need to enable it everytime select_chip() is called. If we really
> care about PM, we should implement runtime PM hooks and disable the
> controller and all its clocks when the controller has been unused for
> some time.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
