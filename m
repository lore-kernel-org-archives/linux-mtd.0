Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B23C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1BA23BE2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xcQhoSrv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BdBL8fOW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="teOOf3Ko"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1BA23BE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rfFT6QbO2Jbteh8h+JRKvn7UJ/X6JS7wzgmsAGPQ1wg=; b=xcQhoSrvMrbMV3cUmtfzH4YNv
	MET4Vw0hi1QIPZNHR8mhRpXmYPeYlnc4rA4w3fXtgBGTeX30JgvCvVv2lRvRTf0ctwD8aigRFSwPk
	1JhqbHfhSH7Vd+f7h/JpsQ0EXIbryBMXaGGBdHCiD7YrE2s5AO3ZPA+zfo5VycP2eDQa9Dgzm48b6
	fX6j7HMhI0Z/rhKVX2XFTzpdmlpWycpXxYTjQdCalNl2FsuGGChBmNW/0D1+DVK83mYU/MmS15YcJ
	X6SaR077w+0whcKhpLwQ5Mq02gJP7Q8QDGWEqsLtayWeDWQbI7bPuMihEYAAdZVdKnIcSMLUs6rGP
	ppnjoZ+sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDmG-0000w7-2t; Tue, 29 Sep 2020 11:26:36 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDmC-0000vQ-7p
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 11:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601378792; x=1632914792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FFTSLuhmFvpQuYs6UlCDy77D/Y6zKTqphrofGrE53CQ=;
 b=BdBL8fOWCitVqgEMfuI4mYtgCOUMl9F/TOQnA+vxut2uX9D6At6jeSv5
 DawrDoypjWn9L/3EAQlxoQdlZ4I+QCUnz0M8ax+yPZTCYUIEZ7mWLW1bg
 Sj2kDEnItzXOnh8HYqdWEsTu83V/iIgW1+Xvic0qVmMBwC15a1BqRDcRs
 c64ohnwKtddat9NiwFa46tH1kXYFWxKwQDXUiTYxNfAoaPCAN5mSYSytc
 JTgqYgHKgmzl9D9S2URvtwYV7uB5gngCTLA01jlr9g2+ClPT2SI5QIzO2
 cEUJbvNi2ceP2exW5prr2JKvzvNQ8cIRnkRHvkml6Yf1zYDildvhyU3rn A==;
IronPort-SDR: TdPzTCeSGanF/gZzft2eIpss/k9uVzETofAIHPWWz2LCC1QY9urvPdQHZDE0euXriVymJOwVrD
 yq6O+Ylk3slSSMDEao8UhC/K82BVyr/UCiunK/ynFdHVQykCZjctDuJszXMerhEw4bLj5fDp2K
 4YTBt3w+R4CnVEpKlLfMNQmkVvMYrhzDj6oR73ublJF4DF7S2+JvGNYo7i+tHYwe71CVgZ9pmB
 jcXBFpPL8R+UqlUY7JG2idt9t8pxnMA6lYt/s2otTfo53NeYjYXaSP9/7aI50Mpfh43gjmQ3s/
 Hqk=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="90788854"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 04:26:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 04:26:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 04:26:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIgSYfBTA+B1nIC+UMzZL6mMr5QPpEM2VPbuLBWSJYP7VffGQGPsv8FbPofVPmyFkCgu8CxcI4o33MH36xT8P8ga2Bh6pWsYyzH6BSkF8QikLhNXK3HNbiAQE70y1CRhYBreZFq35Hkc/EWxgjtHxKfTyAf4ZDblIsXQdUFu5nIfSPHaDuLYkshuU8WOFZ9Z0jeU1rOsWcJme5ZMcilUWGXt0B43laVXyWdUG3DGXnn/81ohZhUEnRTzdAp4GfF+i45vD5aPz0cKwH3VNWu7FMCrrajqT7UNs8SIW4odVC5rnkUzuED5i0re08FePFdDGa+c3lSfVlq0b1HDFPlgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFTSLuhmFvpQuYs6UlCDy77D/Y6zKTqphrofGrE53CQ=;
 b=ZcgVXji8d37GB3BG/M35/A667Ftrc3+k7Wsk/vLcwoDzL+lmEL08/o16fX3m23n7SNFinU27FX+R4x0gGWGFGups74fEMpkcigOk4B4p8pHdvXv/8IX/aLBEsCkC0WhO5S1IF8rcU81SvW4MKqEN8u2RoMz30obRjAwbIJwjSHN03eOlVLFSjqNYyPbgfqNKGLCyTOsPXNOgNL1OLvyU+NTwQ6KIB8huBb3RaegbIu0Xn1ijCVJVTS31kIo97wNy2sal8TDjr6YsdIosqBOuy3R/DtEXD6jG4Lw/M+9pFvokeNCeclpmeyXTIoU1/s8rHOxdm68QxZQSUmN2wKuwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFTSLuhmFvpQuYs6UlCDy77D/Y6zKTqphrofGrE53CQ=;
 b=teOOf3KoXA1BtkyNr47jAGEbbUJms7KYKf5QE2xeRbt24k8LC/Yc2HONjlzan2m0xm7Q2zcm0twj5DOEuYK4ZIhVq41VJmub2K3p9L+GeXfJsXFY9A7L8CAYLMsjtrpexlOaS3N1nLUjxpb9F5cwhW3tMtkPV2oVqFSrPbt4HYk=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1849.namprd11.prod.outlook.com (2603:10b6:3:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 11:26:25 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:26:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Topic: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Index: AQHWllNcSEOJ06dulUeHo292BYv/qQ==
Date: Tue, 29 Sep 2020 11:26:25 +0000
Message-ID: <feb046fd-a9ea-9ea3-55f7-bf823ed1e61f@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-10-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-10-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [82.77.80.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bf59fcb-2ef5-4128-b14d-08d8646a8031
x-ms-traffictypediagnostic: DM5PR11MB1849:
x-microsoft-antispam-prvs: <DM5PR11MB1849BBBE7400B863F60030C8F0320@DM5PR11MB1849.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eMjoB/MyftwttX9GZg4LPedqPKaaQZ0pEeE+Y9ugOaJjH4vtJWNBDnxpw4shGKUOAcJIVaSYfSHdEDLlulXCHppktg58pgfPbeDwESRmpOZjyI8w9bZvEdgqknY9er/lxwTtp3aGUZYVvSbLLsXqugP//0cC7uv4zRF9RM0a9TKzKTDQjkVgsW8Zl4Z1Dsy36aSnvHJiAR8oGiHTVpxgOJkBF4J2pFqIl8aEzAzz4YkYc2l6Z5fTVEAr4tKRDaIXb35LBd6XUULHjEgCST4M6gvIbQ1k6pusblGfau2XKm2ZfwObvfPHZz4tp+mKRk9hjLCyaivPVp3K0d7R3fJpm/fRXCcAzURPgIeseBwCZw4wkcMN3lTq5bgzK9lhLkXRzZG/yi2euH8JmqVVs3WDcwipKcaSC+aZHbFHOgtoaxyiOUS73JcMgrmV479LAEJa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39860400002)(366004)(71200400001)(54906003)(5660300002)(86362001)(64756008)(66556008)(66476007)(66446008)(110136005)(76116006)(91956017)(36756003)(8936002)(2616005)(8676002)(66946007)(478600001)(26005)(2906002)(6512007)(53546011)(186003)(6506007)(31696002)(6486002)(31686004)(316002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l0Zm0EX3KBlJ34ZAaP5Pl86H6EpE2gs1xLw730arnaJdncfifnTELH/OYNvFmHhphCL98E07vxSMJw7Xk7p1NXiq5Lb+/85VjTntMTcOHndVKFEXvk6idDzflNFjgBKZ3NxkW1mGa4hxgTcQxlV/JYV9epMtLeHb0HYp1EeWVpFOrELXblYmNkjvVw71HRPaEAP26VPhT2Y40QFeqRLEwD9JBxyu+qhWLyiIn4DBFTvOBctMbWJVZfGtQ8+Wgz5D9OHNaj5Q/oag+Lwc+vb7jV1o2wogzCrqESoDKRjGCkovbl5mCrhtuBgirz3dPJLGl6R3AIReRlJ2CROB8d6GM3FT4lMxpbHYIWPk0v+xWgKgB49MJ0VLCTaHqZeZBdPhoIflSpkwpQnpzaqob8ZCrjJg3kF8pr7gHidgqW0wPzil3VIfQINjEikZPEP/rIz6uFsrbmUZTGKu1QiRDx6us5i/qaCG8tSR+6mg9WQchXUJV1LzlMB37Ysp+U5dHKSruLkagzVR74DkMzPspuW0V3hn0/gO7bGdbtNosNN8dvWoNME4uK+CiSt8S8PbkuMF9evUQeggu2Nnp6mAU6XXMTEYrn+Xz9PPIW+G8A2CA8SPWghg7ci5UZYao7Thh6pLeoCavurtL6BjDD9ol2EzOg==
x-ms-exchange-transport-forked: True
Content-ID: <96ECCF50E8F47043A6775C52E20CB543@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf59fcb-2ef5-4128-b14d-08d8646a8031
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 11:26:25.1157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rkntc0fvetsthqsoBlFnkIlswmpkKDs3rwexkqmZBybgD4OURvmYr6uwTh8LocWl9CCE68uCim1c3/bWgICx8722t2F+vXzk+agFYJEjsWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_072633_053646_9425BEB5 
X-CRM114-Status: GOOD (  21.12  )
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

Hi,

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> whenever possible to get optimal transfer speeds.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 87c568debf14..6ee93544d72f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3069,6 +3069,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
> + * @nor:                 pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       int ret;
> +
> +       if (!nor->params->octal_dtr_enable)
> +               return 0;
> +
> +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> +               return 0;
> +
> +       ret = nor->params->octal_dtr_enable(nor, enable);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> +       else
> +               nor->reg_proto = SNOR_PROTO_1_1_1;
> +
> +       return 0;
> +}
> +
>  /**
>   * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
>   * @nor:                pointer to a 'struct spi_nor'
> @@ -3109,6 +3138,12 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> 
> +       err = spi_nor_octal_dtr_enable(nor, true);
> +       if (err) {
> +               dev_dbg(nor->dev, "octal mode not supported\n");
> +               return err;
> +       }
> +
>         err = spi_nor_quad_enable(nor, true);

Is it possible to enable octal dtr and quad at the same time?
Maybe an 'if/else if' here depending on the values of nor->read_proto and
nor->write_proto

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
