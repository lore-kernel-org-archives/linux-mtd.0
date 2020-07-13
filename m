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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69544C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:25:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F1820674
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t45SH99L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Zkb3GTHB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gE1Ju3ZS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F1820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u6URbxMghJ77/juAMdwLoj0d83jXmAztUDJnsoCUInw=; b=t45SH99LmQ+Am88LnWa2j/QHP
	SFKCFOWAVX5+m8VG07opja4p1Inrp6tKmeZ4iK4I6SCvuZI6su7nvyfvaMKrHdRnTcfyOxN7z6u4S
	sNLvpPfmqsC748e+yXBJHoSVgaD7n47U5Xg81GiupbnKcTL4TxghXSn0qwHRdt4gFC8sy7yt8xejW
	5coyj3ExDhU4wCYznmaQbwalMM/rcGG7azxEvmEsus2eqbUoWPzTqDobRII3bFyv02yvafjZIaNn2
	BEfCyMe6YICf7XRxZoAwFEWZEKHwxQ4ju4fDsooCMO522ui/V125692Ms9jGblA5K0nojmJ59+gVA
	tZZng7Zbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurtN-00039z-9d; Mon, 13 Jul 2020 06:24:45 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurtJ-00038o-EG; Mon, 13 Jul 2020 06:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594621481; x=1626157481;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JevabZdcZ/K49lBtfjW4K2P4+aSSGDP4/z2Q52i1vSs=;
 b=Zkb3GTHBnUIusLv+PI40qX812CzumemV0GqZXpv7YTxaSU5B0nH40Lvl
 2J6NhGXB1G+j4QbXsvj7yGtngCn6tEfU/27xPp2vvDOwNPyPl5SuQ1hZq
 B0wYzU+a2z8iCgV5Kq/d9t/6Yuon8nKrwW7WkvHzxV+UKTNr3322sapiV
 8eFUvi1dBH7bAnsS6tUnMeeJYZ5rqwoXeh3ChKD5oHwDO4fo5wjFMmzoa
 ydlJwszPBlKZuseXFYzwtLLHDhwTTDh0JzsFEbWw9bmlFfW/oRE/pg92E
 o+ZBjilatdVkCR4XEoUS0+AaY38YorY8TTkiG6CL1yLLtUfyQF5VVf2/l w==;
IronPort-SDR: XqDggY6UzpA8cHwbIDNum15wnxBsF1TSCEgZFOsuTpCi4EgRAydLkdp4YsGeJO/DaZj/m/10Ez
 P1ULVD7YguLW179PzdWmbt4HR3aD4qvSdEQFjkzQqDiqtBkL+zUz0/rP4bAXt4QZdxznKL/kqt
 4HSkkdEq8NxjVZ9GNVcZfq/XMASMxHNc4namYnzfregYjLBRC8jz6mZaqJBRFUWse9zfCXx8Qu
 xOGmrpGzbrIXc8rDJL0ykO0FwZuP59qnNfV1ik9ojc+wANK65kRs/ngFbciA3PgdM3mmtoeNe1
 I9M=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; d="scan'208";a="87286966"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2020 23:24:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 12 Jul 2020 23:24:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 12 Jul 2020 23:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8zohyIh3cjb+4D4qk1lyAfI4sLygOqdzItfitpTffqqa0QWb1fJdqlKR6ALkVIlY8pIX6NGfxzCdarZoB07MfHi/a4+6nqCUm8tfgDXMU1cxm8LRrkrjipXL7lzyuFXKqr+P10fyJ0v6eeabeGznP3z1OZdvu0JkUhliP6LXsUtQKvSppk9Nsk+y2aNplbKrdOpPwbYY8H9JISOodGpdgDDymniaWbAVd2ZKB+NyniOIo/fmmaDP54IY+jJf5knmYPD5Y4C+Z2TulD+AXJWTvMtrgHYOfzBeECSDeKBRMd8L00pTHrli62MWwc+3s0HGDcetrH7RNKdnj406d1IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JevabZdcZ/K49lBtfjW4K2P4+aSSGDP4/z2Q52i1vSs=;
 b=Gep1w5GSLgdWIfEoapsPd69TkGWFEj9N6THxtCZ2KwEbSJFzsHV2xgs/a6Dl0SyqJtHPz8/+yGlxefzZFnYTnLLO+azcjSjmoE1b3t14tYJafln75HLcQsuCz2jHXzXevVqnwN953JrbRbXtJcCAIs05puVSj88wiJshiDwu34XdVqzmjV6cGsedQHAmRBaHd/eYh6OOTGdwlUx9isOrTNtWfAPp/kaNkDVNB9nl6BHMGUxw994z6JxTfHerl+g1MaxCAPSKrDcX5I57FXH7e150tPjWb2CkXkivALfqfrhlSrRzZzZ8tc9Js0s++cKfJ7c3BNA3He6qAIPDAsLwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JevabZdcZ/K49lBtfjW4K2P4+aSSGDP4/z2Q52i1vSs=;
 b=gE1Ju3ZSV/I+/ps1Jd05X7guiGbT8R52F65c4xATV57k2G2qzhUsO0j9SDf4mOoG4zwPFTDKgYjmDnc2CUw7Z0uiBccgosv3denfoNkQPFLTZsEcExPfVdMAU7s/8sZw8k0gGwG3lcFSbL7UcbmcLCS/lIqgC7Q2AX8QwnIiOWk=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3576.namprd11.prod.outlook.com (2603:10b6:a03:b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Mon, 13 Jul
 2020 06:24:37 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:24:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 04/17] spi: spi-mtk-nor: reject DTR ops
Thread-Topic: [PATCH v10 04/17] spi: spi-mtk-nor: reject DTR ops
Thread-Index: AQHWWN5HTvB91P8nH0ODLTeFKdlZcQ==
Date: Mon, 13 Jul 2020 06:24:37 +0000
Message-ID: <b0e86071-2808-ec4b-e09c-3614bc9c205a@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-5-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-5-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 2be7e176-fb07-43df-a9d1-08d826f56ac3
x-ms-traffictypediagnostic: BYAPR11MB3576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB357640DF67F7B762301963ACF0600@BYAPR11MB3576.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmQiZpziSInvudUIawGfdeHeTM07DHlBxxtz2Xt+Qczl05ou1xP9LGIIk3E5MhTlnQXV9PU8LWgjd21S4FwBD0+JJ0xVtCCwKS5qHedCBCOzf9llQWVCGanuM2gaJ3ZTDnZvOLyk8+7sEFQRxH1tc3rG9RRaSKbEwXVL00OpGWhRv5VBmGrUyuWy7LoEG3czbXRPp+GRhnnbDJnR6uL6WszwQh/IKK9rn43uWV3X/hku6eLg06ADtDfatW2HkTN55nZ/+a0Zh6xWifmQUfZsBnOhAMqqwzt2HTzwjjgGptDJ1J4RAmP4HMSUjkPPUs9JW1LwqnIsUDzx73HHevsdEK5gQ21plXouRVcIEO8yH3uZqqeaWprH84euVge0yw9xvP30pAfiVcL7bTSfLLsvdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(26005)(31686004)(8676002)(2906002)(86362001)(186003)(71200400001)(66476007)(316002)(66556008)(91956017)(64756008)(66446008)(36756003)(6506007)(53546011)(7416002)(478600001)(66946007)(76116006)(4326008)(2616005)(8936002)(54906003)(6486002)(6512007)(110136005)(5660300002)(31696002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 5wwQbZEH24EPqmBAcSW8RkisuKuqo5OEDrjnfVCTKKOqd03Wz76C7E9c+Lc3tE2Ossi7asw6EkRUqvGtyBE5bPBWn1bDGmMYZ8ECpfqTIpXO4eu10IMMBVBTNGsrAovD5Q7fzV1GD362Zzkzc6WSjyG0tyxUdHjGh/dzL0VlMk//ekQyBLSaAp7VbI2gGl9RDBsbTz37iKxi7sF+/VgvrcvJgo6Cydbpxn6sCTMuTePWxOOrP7n7Pnndd+DBl95ejuG3F6QmIJWOhvCa/oVkYzYQLAiI0c0e2t/Hop5T/OVIwudSSwRPN6GoFmXBXx5QltLhFDqKpjPzT2CxJXxi9HYfjd4GVga5OZJJZMCYKXClKdNRY0jzsJbJLg6uDdC6ym0d8VFokUXh+HEvs4QN9OMfCrbMgsgq9Twr3OsfLySRiFQIaC/aYmWHf0yuuHG6lmH8cWo5fjEIKZnMaH+EqqQLHrEuj3J6KYtrD4vmMIx8GJ7/4Vb3uebzZNkXvgFb
Content-ID: <AB1940F37E9DE64D91DA79EE22BE5869@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be7e176-fb07-43df-a9d1-08d826f56ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 06:24:37.1117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWa+02RctGgK3t13eefo1T+yNnUnZ8WIwCJ+GRpbPDqpUyv7B6Di92mDDrplQnCtsPU3wvNmA5ittFdOEkjdlBpdreqjD88KHrz6Xt0b8ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_022441_614518_DB1FB69E 
X-CRM114-Status: GOOD (  15.90  )
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
> supports_op(), which rejects all DTR ops, do that explicitly in our
> supports_op().
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/spi/spi-mtk-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index d5f393871619..b08d8e9a8ee9 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -211,6 +211,12 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>         if (op->cmd.buswidth != 1)
>                 return false;
> 
> +       /* DTR ops not supported. */
> +       if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
> +               return false;
> +       if (op->cmd.nbytes != 1)
> +               return false;
> +
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
>                 if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
>                         return true;
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
