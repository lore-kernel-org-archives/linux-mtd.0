Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F34AC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:20:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D82020674
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T9cehRQu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="niTZULlj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RkW41z1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D82020674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p3JAQSH3vuQgvenMCE+UB8v707eEkOHFfTFsgmLnm/Y=; b=T9cehRQuhAKadGwYqkl8GpmMz
	RXCqWNqFPS2zcKezg0T6jRk+29g0tGBMup7IN/zxWnLzCkIKCCDFStoXF1ayFDZBx/p2UQk6cTdzm
	/A7yjSKmJjUgb2Ff46dqwJRfEZFjq23DhKHzZYKoEBXTYEWMPlP5LLi9vw+lWSZ900nWI6c4wn4Xr
	2QTisNQTnthwpQ9zzo+8HKMhlfKnrdlmq/sSLC0PUNkIjrx0pworNUwNXXUZ8LWuPAf1UxOjXEv1t
	cQFfv2sX+Q00rGNySMx4fknSBDSt5terqWp7dWgsMRn+C5RkDI5fkPfT1XOO+RTjcJ2CsCA+hS65C
	YYZsPdb/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juroM-00021Y-GH; Mon, 13 Jul 2020 06:19:34 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juroI-0001zS-Og; Mon, 13 Jul 2020 06:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594621170; x=1626157170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DptnLCJ4aXU8eT6B9ZfaMee/mjBzqPKy7dVpkd4LxZw=;
 b=niTZULljZ9qBU/ifMzdYtgA0vAwhtNr54LuBgwQ+aCW3YjjMNO+Wo6zU
 qhE85YvepJCzh8vhVZJ6XrOgTgdtyFWhL68pJVDg9+EY1SUkzVPFL9wVj
 oOlW+Z5XcvXKRmGW4mUKEU4wMmLh8ErPKVM+iuqz0c9KOerm3cJG4kVhg
 Uo2Pjwg5QEw7WYxIcF+yRd08bkv25ycbiK2WaPPhpRsFfaqrpNmJoVfsr
 p0nhQgn+EquoJvcPS/pgloilqA3lV7Y/eJP3l8X/EogLypgRXGfUl9/29
 LbRyBUQBeKrhH6ar2IsOBRGmqdJt0KU5jQ13gwIJxLFXYqajnB2WFwbGa Q==;
IronPort-SDR: aCKz2aWoGTOckzCFuuY6uprlYS/sTpTqCAa5ic3An2yVhz6buloTC0UAW/R2KPepN7KUv9hZeP
 +MNyY0h18ywTfruG2QwJK5klCsRzKC93T15mI3OGd7un1QH55ih+9RBmloONoUCpDRl+Ta+QKX
 zQGDzgmoNswFAjM9VBc4si6P+ao9WJjbQd4zwBes+CeXuJMOiIK6ne/XgHECuLqIkgr/hclx9a
 G1yV97nw/ZMR0AcERx3emnAn2yIUf0GlyYXLvTC6TrDz316rIl2GvQiRFsrvX8AAZj6BEjordt
 I2w=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; d="scan'208";a="87286063"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2020 23:19:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 12 Jul 2020 23:18:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 12 Jul 2020 23:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmVcoTdY/FeAsNA8mpzvGf8UJHCnv9VqHUm/lYBJ/oBDVT6lX9vv3ucBAKTWuefR+j5ngCbAB12T2KHl+pqvV0BFfSgvCdwEz1gD3Mam6BvjoUza+8OicSWd7rSpc33Z8uMgoaC6arjKyPCJmBDQ7np/3p73dQN+JBcmpe2dodvaUtVYFl/R7Te/2lDn3m4M6kRgv+NJrDbSvVAtGLTCD3wHBkfEyqSdGZaktlNv5ixQwOWBzJCS4EMkwutZzZkpx2fa9ld3j7ruMq1ydqaOCM0pPAtcidj2htndbIUvIwuABL6PBRxY2SnlNMJ6NqfjY8+Bdq3BTkk6//PiFoEaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DptnLCJ4aXU8eT6B9ZfaMee/mjBzqPKy7dVpkd4LxZw=;
 b=NSEBRwUhBp0uenB22139r8TG+lYCQqC8wS59rB/KgJV3f/OelULMhvFld3DHb8vVglgH+FMhLBNedHccduViICpEGEKjtMIlNwm+DtK8Fy+IWh5Df/lEglVRNU5D0W0EpLpe/VaUeebO0h5MdqZ9OeRXUH2kLcNflBTF0ZJ1I08hLh8xbfBx2JLcryj143nLpoBwKFt430sw52BZBm2tAgoJArMnihjLJC96aSLFY2VgcElyTm5kDt5zYnbfiSAXo4UM2oc96ltqMPkL1bNzCK5s7TWnA2yrtG+iolKQ6cv9A1jk0e+mBq567F/iuqsEsLAcmYU3EdJkPexLrU1xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DptnLCJ4aXU8eT6B9ZfaMee/mjBzqPKy7dVpkd4LxZw=;
 b=RkW41z1vV+BDXAlFYgo2Ve3kDUBdIvfu+AkaiaUrMsX1cAumAYiB0kDhe9SVjjaqpm/YN6MX5/PqiqWHs7Snd8F4v3wU93lBNGpMIhuOw5aL5XzWtt8hykdHxEHF/QeJnFfMKRfiIlt1D7CoWEoM9CylLFBLG35wFK1SVqpH2Zc=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3576.namprd11.prod.outlook.com (2603:10b6:a03:b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Mon, 13 Jul
 2020 06:19:25 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:19:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 03/17] spi: atmel-quadspi: reject DTR ops
Thread-Topic: [PATCH v10 03/17] spi: atmel-quadspi: reject DTR ops
Thread-Index: AQHWWN2OjiZAyoUj/UaQzlTa4VGA4w==
Date: Mon, 13 Jul 2020 06:19:25 +0000
Message-ID: <33e2708a-7e69-86c9-089c-2ace27f7768c@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-4-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-4-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 977e2248-149b-4766-6285-08d826f4b120
x-ms-traffictypediagnostic: BYAPR11MB3576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB35762D1B28CE7EABF8850A8DF0600@BYAPR11MB3576.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yemMI/P62AdxmmAJ1aEw4Ziz03WW2gJiqOaPnI7O4GKHQAES/2z0fLHXnxvZOsYluedymS52WWhXfthlyLd2fryyZM2GEQhAJtsnF+vwtZcyVN3WVOJbqqfhjBneElYTNKq83MAwND31YdH+WYoDIXkQAL0Iawagufx1DadVBtII9ZZwnFQfSOo/TGxWOPUaglchlnrHSsUzmx5SSplWZWdry8RWobkmRPjob0DTVy90CfAvMLeMiFQxOb0C4h5Q9zpBXMGVORUfNv/UYPjHvnrbHOJl7c4jkHNIEboxr2ZXlUtzB9QVKd2SJ9ngVvoouFo8TEbXKgUgODfMAKglY3FRNkurdMN8hiXope5uTrz7AmOAzOX3taf8UWWjoE7I7zTQrgRKbcUO8RMbj2+X+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(136003)(346002)(376002)(366004)(54906003)(6486002)(2616005)(4326008)(8936002)(5660300002)(31696002)(110136005)(6512007)(86362001)(186003)(8676002)(2906002)(31686004)(26005)(7416002)(478600001)(36756003)(6506007)(53546011)(76116006)(66946007)(66476007)(71200400001)(316002)(66446008)(66556008)(91956017)(64756008)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: aFvWk89N8Vv82tc85nwySs9c9VYs7Rcp7Mv/5/FVlrJyI9z+/3jlm3fyLuSsplJPQ/8OetY+sg58IajJXJt95KCUcFZkUGB8/e1f6mzGXAIHa7apGFbHSdd06pF2EdsYg2PFkAgJxuqnKxa9vjtzsHj5hn/Jdb6uP6iQhoiPS69aG2/zZ5RV9d40ZEB0QzemeqPss3cxYDzaGG9tOXSv0BTSWJE5vT+KHdSSZRtSfVXVepqDLQ6Z2ocYusO6xTRSqO729qGeE4NwT+Zz7D4puekSHvWITF0yd0+5tfvvQPPnkmyEDWuIHYEgDW/Mvyb0VzH68pXdzhHytxHJSA31NKdVme+DKOlhZ61+FBU/HJPKiX6OwV6N2e3C6KpUXFYiIaFUhbYBNngQHCAuyKMpbVVLGoS0UmlTfoDHqC9xrwH//1yFwLIWSlLdEuY7PlAZOvACTTKTd3nOSAe2hWkLEdGwgEfdiUfyZRzpPJ7XYB0alD0Fq3Nsj72thssJ5I2Q
Content-ID: <7A4C109E0E655841BEF0F3AD8CDB724F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977e2248-149b-4766-6285-08d826f4b120
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 06:19:25.6961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b825ytLg/t9jp4cKgBOJdZ3o8F2ZWFDbneZCFCf+w3B92ArPeX4CYd33JrhTX6pcEvNd2eCMmctJT2yleWiyOGe+LFRNyq2pRDD3263wGis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_021931_026099_B63F9765 
X-CRM114-Status: GOOD (  16.40  )
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
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Double Transfer Rate (DTR) ops are added in spi-mem. But this controller
> doesn't support DTR transactions. Since we don't use the default

the sam9x60 version of the controller supports DTR ops.

> supports_op(), which rejects all DTR ops, do that explicitly in our
> supports_op().
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/atmel-quadspi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index cb44d1e169aa..a898755fb41e 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -285,6 +285,12 @@ static bool atmel_qspi_supports_op(struct spi_mem *mem,
>                 op->dummy.nbytes == 0)
>                 return false;
> 
> +       /* DTR ops not supported. */

Better to say that "DTR ops are not implemented."

> +       if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
> +               return false;
> +       if (op->cmd.nbytes != 1)
> +               return false;
> +

I would move these the first thing in the function, to speed up the exit.

With these addressed:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>         return true;
>  }
> 
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
