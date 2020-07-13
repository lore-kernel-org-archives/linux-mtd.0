Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9ABC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 03:55:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3B62068F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 03:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQsE1naO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yReazDOi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Fk4SYno5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3B62068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+VN1ENDWiHi1OWriTp5J6W04sJFRwlgbDNeeyrk7Wl8=; b=tQsE1naOjhsfntg/Tf8cyi/ET
	B+dTdQiJiGzRc1is/rluUw4Vc8j79vw6+Xo/WRxyKUvDtACaYsNKZ3J+U827hdywdMEHzHdfZSSzx
	vs9PZXarU5oZj8d4O1aSb1cvKwHrgwui/c/R0SJTD7XEIJ9khhx+F7w8KeEWrd0u6BqAq98AtNPMs
	lczPu2BXMVQaR3pL2n7FC3G3tZas65hfY9zHsTmBVbNVlTOckZmUlGo+c17LF0YymOtVXWKl6d14s
	E6+IWfD+sHvBjpfCDX8rUERh7myBJblBT7qd5VIZvhYXVqEND09SDpVdDAZV9DbpVkhChUABmVyn5
	AZqIVrC5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jupYd-0005Yr-ND; Mon, 13 Jul 2020 03:55:11 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jupYb-0005YE-LC; Mon, 13 Jul 2020 03:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594612509; x=1626148509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I4SZ+z3h4qfcj/wEJIngM+7FiLiHmEESaJejUQbWufw=;
 b=yReazDOi80aee7NMkAiY1/keke7CDNVoaXAd/20teBeac2L0dU/K+pT0
 3Rh2MY9Igu7i9xLYL0pApBVA/G5gQjDG2Pch7bFTn6PKqL0khu+2yTttr
 l02nmpgiaV1O/LRQ/QyLbQkrEayIH5SRIRrbtQqWEEYnAbTsFTfhERGlT
 08edBjXcXqepnh20GSQiClpSBD80GFAFIcxyPEUNl4Br119p0f+sfLFoi
 KrLmvW3Y5QGOpRlyvyd6q5g55H0kr36QblhprYIP5k+q22bnvSO/jYToP
 E/IOttbNVuQ7B/dC1ix0MARay7Kpa71jGbrNDx8sTkGldmuD0aTAMSHFJ g==;
IronPort-SDR: IloN3Vm9h8mMoxs/nuwKmWWLvFi/ulYJYmKddaE5DUtQ3O2xHiX7EwBIH2bnN2LUsl9P06u19Y
 /z6NK5+WxXAJMyt3O92gYZTnQ0X3Dyw3ZYory2XZl2Tuu7Cg0GB4/0/N1wyFs80kqglOElFuB1
 QwMXGwN0GXeN2NXStunSi54sYw/nVGZOdllayJ1fuLo4zyxyNU8oVq4pueFG05/InSXSjznbNC
 o5XegNfB11/KTKea7er1LtYu/vKBypf47fzTxBbqLZhwuJOyo5A8UvnBWkBLqIV7F2lw7zqgl1
 GyQ=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; d="scan'208";a="18914602"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2020 20:55:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 12 Jul 2020 20:54:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 12 Jul 2020 20:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8zLBwIupCyRWmzqx8Nttrw8aWgQ5YnQV91O4cNn6GqLRSZ1wN+0kLEbAka+PhzxJW27kzr5vy06MRfR19BxIeHmLt530Wf0+VztJzbGRoejl5h9HGM5JFroNO5W0WAZJuOcsGEBSMricYEnORXRzK3oGTq6jOZ1VIMIpcwPpUTda71v6cmankHJnz6Lfg+1gKynDbCLmyMRLIZWhw6W9SUcOx0C74Ke2J2TqcA0vsg6T3lMQA+Q8oEZoJz22+viO8ZB83AtcMM4VuYJKwj3y8kQd4y0TbDjNHEnjAppejTXAu19k1udWpZLs0uuez+0DOzHRJXbh67BUdMvaGKo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4SZ+z3h4qfcj/wEJIngM+7FiLiHmEESaJejUQbWufw=;
 b=WZbAJmzLqyoOcF3gLSt77x3t5DpG1jd9TGabvO0Olefk2i4V9baMyVhuBkJ88+Hx/57AsIrdZKcMvh8d1Hu6Gzlz8D5hgjrGtPfKyYIf+rQi8gOenZzIUHju9uIMjYXRgulga6hOwoq7HHsifWefLbr8Lh7dSaJCkTZWhhvDjHF+3d/qXzwHbtinTO8CQZHy5M5UGt8lWJ6ew8ThJYuEgFz3Ss2okGDwPG/OedHb64lW/Mi9jDuwAKtzEAENBeajLtzthfankuQ2vUuW8o5dtQrk4cu45skW8pXNZtldKJpmsLZ7r58tjt7E4ceBENtmIDhMKSCwNILSizQNrleADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4SZ+z3h4qfcj/wEJIngM+7FiLiHmEESaJejUQbWufw=;
 b=Fk4SYno5XKUhN2pJAxrK2S5hApxqShRbvv68QfOpvEsIp5Aupb5Wo5AfsbdmzssZDnx2chAANei/MQkRL0pTBP80viYjJ+pLA5LkfDUd/RQCU0O2O8fNyntYD8OcStDSMnHFNmu/ssJYzEGPEFdmhtus7CRNxCF0ChISAIFqWEM=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2968.namprd11.prod.outlook.com (2603:10b6:a03:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 03:55:02 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 03:55:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 01/17] spi: spi-mem: allow specifying whether an op is
 DTR or not
Thread-Topic: [PATCH v10 01/17] spi: spi-mem: allow specifying whether an op
 is DTR or not
Thread-Index: AQHWWMliL5FGGK8980aliLC/F11sVA==
Date: Mon, 13 Jul 2020 03:55:02 +0000
Message-ID: <2702a5cb-b7a0-ce00-f943-08f359c35396@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-2-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-2-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.120.242.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 046ac775-211f-48d5-bce9-08d826e08558
x-ms-traffictypediagnostic: BYAPR11MB2968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2968739D2626D37F9ADD8223F0600@BYAPR11MB2968.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nC3z0EEbT3CN+7U98q/SBPLt7Yx2LC5xIG3Xe8XeXodD4c2C1DInZIG9LWdWlS/lPVlwQMbFfx+Z1ErtwIBTGOvkc4CzJQWTYhvEP26MuzptcydYeUYLMSex6K0Iqz7teXtPEEUyFQX1Wik7QgVDrTL85MmJ2+WQpHQ+dhmT88mHogFy5tuw9PBvSZkXvZFrfh2Xodw0cRg/OFmb85KNa7uGNeZJnDnnGhOoKA+Dl/uIatYAJNSARe6oG0vsPkRF8Q3qV/BbutrcIxYMXAyI3DX+rW1El8hLJK2O7ISJgqfZY0+utaYx12CrMnXkK2WDFL0dmSFp7Akg5IQ95N9ZH0RSE4dJ/APtOUbd1e5a52pnWS1628TcU48S5iYnoAJ2Z6MywNufU0xstrzOA4M1Sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(39860400002)(136003)(366004)(396003)(8676002)(2616005)(54906003)(316002)(6486002)(36756003)(6512007)(31686004)(478600001)(8936002)(26005)(186003)(6506007)(7416002)(31696002)(5660300002)(110136005)(53546011)(71200400001)(91956017)(2906002)(4326008)(86362001)(66446008)(66946007)(76116006)(64756008)(66556008)(66476007)(4744005)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: slg8wc9JaFhj9GAH/SCkPUOYo7ut6GAKrPnrUwEt+DOJe1F9CpqzQjQbebMNPGIeulnlXTDOWaY5E7drFtIyuWdgX03eMj9hMW8J6aO3uNFcp88XOwGbeYr7MrkCkbTlkyoz7F9Htp/lMRqIAYQ7p/pmqpdfF7JDAVMTnXxhHpXRhNUctsQ2HA0hYBZbV5FNQhTMxycH3ww/WtSNBQ8Y/VbPaj1JQIcWFSuI/P1nbQ8YvBQyi6af80yeEXt9lBaK9fPPuKS8n0sb+tsH5BqENetrKnoiouGH2fKw8e1Ajdm+GPLmeo3ilc2bbNb5kvfMGe7c/mGq+xyGsvGYXv+59AeM2wIS/EipqsJUsS9pYW74n2VZqiS3jgCMye/0I/VNwspVc1t8LHABC4RK3R1iga9saHqMO8dZ+0Yp29PLpUtTQ3c1UO3Fy8bQayGmVDFhFrjZLLH6CZKFRaHKUtdsT5tuL8wwFaE4sULwyNMxgTxmoup2Wh6DOwusJf2asEsZ
Content-ID: <6A062EF7E3CBBE4386549E856BAE6DC3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046ac775-211f-48d5-bce9-08d826e08558
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 03:55:02.3231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AkYXWlysxB7LoV8Y0N6uJUA0JTVvVVpq6j69zB2SEEB7VgMTOYr81JMnpTnuMKd6VIeDaMpILGnR1yKcNoDmb479jguof3E7NqaAnYaIe18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_235510_021295_C4FA2B00 
X-CRM114-Status: GOOD (  10.86  )
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

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 9a86cc27fcc0..93e255287ab9 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -156,6 +156,9 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>                                    op->data.dir == SPI_MEM_DATA_OUT))
>                 return false;
> 
> +       if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
> +               return false;


I would put this check the first thing in the function to exit sooner
and avoid the rest of the checks, that would become superfluous.

Anyway this is just a nit.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
