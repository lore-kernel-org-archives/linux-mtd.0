Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82774C433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4540520747
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y+OQKTso";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="y7muwIfO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="aS1jvbWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4540520747
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OBNw3qZCLMYZACRTsDO3IIFAlTrhOMZg2eME29R0Do8=; b=y+OQKTsoYF2i00xOIxhIha6xg
	F4UJcBh4QzHVme98Es6JBLn3s3VpU5DFrQL5NSJExDi+O2CJqKUjcFcx0GQnlb6vjU3qaOpeadzfb
	6EsmyH1i+UUD9hY3FbwVRvE6VhBEIu+1+1yfLyMsPNXNvadfxOU8wfC0lR+WsH2tB/yeL9yoVIneM
	SxAlI/YfdyzMXmIYsfOPSJBYUP2HJu0GJ4cZtIj9csh7056fEjE3JXW2xM12n/FaEVn6yyA9xGpFJ
	+aozOcy9j1XZl1rFMecKdjF5oLyGfyxeJlkcJoygBcZyvGn8uCEltyZD4qb82IItlT9m80VYSWQi8
	4KfPed+rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqx4L-0007kd-HR; Thu, 02 Jul 2020 11:07:53 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqx4I-0007jf-Ja
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 11:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593688070; x=1625224070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=e46EtKbjDZqevbSSexyCuqAJY38ONQdkC6tu5zHZeZc=;
 b=y7muwIfO7bPf6kGoMeeZ4qdXN7WWqFAoWYbyuAmYVdztWXjl22eSZpy2
 hGf5uNdCDWezxKQxRQkAeVJaGahR3MIE9MQBUQjQeDEMA4CifrytO5Cqo
 cFL0hMRLT2V6AdDukjI4kH61lKhQ5HDSUSjEDyrl0rA9y07ZQf/oSW2dz
 yPnnZJ/YPWf70taQ+Dihq2mX+qdvFUnTeW5k8M491JDx/4n94yfCah3nH
 DpXcaSgZgSw+sFs+gvsZJ8jCdNQKgchkZW08DW2cbHo5xY47zsYzLPasv
 hAkKs0th+u+M/g3V+k6qMUIdBvyrThrUQ/fP/OB8ayawAqQDovATLm/TO w==;
IronPort-SDR: 7ia7p3kH18W3NrfNt1mGtHNh3IGoPFCOerQDqedZktXmZJybFerVUVJygCy5cP0Z3aApHGNzxw
 CTFJwv7ceZLSmSJspUv7J5PItoWhle9J5tT9sr24pTc6EHMlnBnb3pIh7pmLInj7XoG21yB5Vp
 xNITK4dZJF6flDGb+nL3RCVaXHzhSKHUaCqejvqfO9mUDav9qz/trWaXt1T07eU9P8+qxukpbB
 G3JSCJ5ZPcFktlCqUNs8yJmdfa8/WnR+P92TJp9msJAAlCoqnaDXF0aThYE0cmYBwstdIKucj4
 OFI=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="81650858"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2020 04:07:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 04:07:26 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 2 Jul 2020 04:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGD6NKVDKa+EjH77njt67PBIvI1go+SBR+9txpc06HpXhn0xNuNOnrEI21NiU4vR5xlWNbQMKXFD2M15GMD7uXRFODwdm1/42YbEwJONNzLZSHTdb4+fseLKjbupbt8P4T5c9AJnWIU4B8IZ76uztu0fOsDa/xOU4ik0wo1iicH223RLPVgotv6iJra1SPMUjrrP+YE5STIHpO3O9oDTqtQ2ZzLRR4N0ZTLa0T47uLTypujzOXE3H49IknVdufJSZWRI6yepMyuX93PtG+bjTio0yxTV+2rzikVmMKp1aa2CvgzZ80wk+AI/H87S1GrHhWbGcxvKtdYstDbBh/pD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e46EtKbjDZqevbSSexyCuqAJY38ONQdkC6tu5zHZeZc=;
 b=e9/SxmpdTLL2C6+rU63EXlKMTur32Bib1HBf0WVlKfYjpGhfPCmR/mSK/hDylHBA0jLqHHKDxeqO0q4VpN67PnMPmYt4V9IMHuVo/UyEyenYTF2CAiZeJX79UVuRUoxoWwGVKQk6zhGBXPnu8J9+RuxQct0umNkoA5SN/JDNMJAL9TGh3G3DAV7I2FQSfqOMbAgeCnemxHdpdPdjy/CJxcaR4Tk3lK1qKbGtKseP7fHHb7fUqvL+vG9jMDHjHM8ez3/MXOPpfMDRDqOWjyhfa9lfS5HWxYWOQe9BFmgjRicEDigoKyzUsjOudu1EGyvXpfZlAXqPe/ExwU1Awt+gEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e46EtKbjDZqevbSSexyCuqAJY38ONQdkC6tu5zHZeZc=;
 b=aS1jvbWSu77rOHeR6ud8Er9GN4a76cMdHK/86cdOTq4aiubeOw4IOSD5Re43T+RLMm2W4wf9U9UP5ys1MpxZFW3qocVBmUQAjFSihFnldewfMUc3R7S6GTmfOewkPqHtq8PyJW2XmLhDajDYKvx1WVyAwJhyEUfk+SLYhbaJSzI=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3078.namprd11.prod.outlook.com (2603:10b6:a03:87::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 11:07:43 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.027; Thu, 2 Jul 2020
 11:07:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add capability to disable flash quad
 mode
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Add capability to disable flash quad
 mode
Thread-Index: AQHWUGEAEL9TiAYYO0yDX33PIN0mow==
Date: Thu, 2 Jul 2020 11:07:43 +0000
Message-ID: <7cb989be-3621-ff45-5277-1e82968128b2@microchip.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-2-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1592312547-19239-2-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 952392fa-7599-41bd-e9f8-08d81e782497
x-ms-traffictypediagnostic: BYAPR11MB3078:
x-microsoft-antispam-prvs: <BYAPR11MB30784F9C07890DC48B43D669F06D0@BYAPR11MB3078.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5me2l7LyDi2wLwX2d/oBDxDKfApS55ByceUKFPKyZwLxZqlOAXJFMU+56nmfBcvFKIjvLz/X1V59e6zoyO3g782OqPeZ6DOKcYBxLD6/V67Cs5lGoKRNUyAZyMs36pQmnnJe0XOekcrXqur+2TojGZjcohx6ITg/d4wlb9pPERE25HvcZpjueCTwo1WsLc+/WQTSa+AZmgkOQJOSPSXYkUSWjrK35tEUfFRcpaDy0VmxAWxWAhp+Bm7Bq7/GMp4GMsDnFLWD0TJXWJ1SJtQ5kLGuDgKKszMesFMm6l9I4whSA3Zy3z4UHEb/3NZ78ULHF5m3ENKOYYpDPlMfSf79tmNP336kjGmJyhPA8ms7XnjTt0AYOipsnXWdIcHTfwEk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(83380400001)(478600001)(66556008)(66946007)(66476007)(66446008)(6506007)(53546011)(2906002)(76116006)(91956017)(64756008)(8676002)(4326008)(7416002)(110136005)(6486002)(36756003)(31696002)(316002)(26005)(6512007)(186003)(54906003)(2616005)(8936002)(31686004)(5660300002)(86362001)(71200400001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XqTVUU5bYjI4DgpxG4KIHbuLZ4cY0ql7YIHiLrUB7e0BAujhhCgPCpAkKcgm9fq2fKJLdyx3s3dvKVAPdUMeGX75ftGmZGbKcQEWT+49qWdCGj70g56EzqsyE1w38ddXf9CmQJVPR89kciWbKFNOqYKD88LtlWgelzQkXRWycqoW74DitFdTo3V6j25BYgl+7Yvofkk4eSjAOX9KjuPIeadJCN9pYLO3RCdbOyBCWoc/R3CyuyIk8MV4Ts7YIRv/RIuOQVnvyrpWCMqB7AXhy8mOCqkFbITJK616gcHw+b3lt7k/Q6+g7llCc+s0ykU5SAcv7vuQopcPkSDLwmWQCPacJdJ14CTahLrsXRP9K9N5ehiaWS8cBxVLDws1KBG16eOl+eDs7dgaTf7u2J5PYQ3DtxsRaLVQNcFSxF1HDyQ7kSxIOZed8U7J1AyRQ4rIIbKV8zprMssKc7+0KD/12FfmlvTDLr3oZI1vErNdfzQ=
x-ms-exchange-transport-forked: True
Content-ID: <B4D034D5EE5F14479DBE1801585C24AB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952392fa-7599-41bd-e9f8-08d81e782497
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 11:07:43.0460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwFn1Lq8APF3U8hUX/G7yDEdd5zW2gbzEWmhW7B3/jWL2lFLIb8lwSn8+C+7gSObwy6+2D8LV74qfB44QabjG/Tmjb973I18T2YW6a5w3hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_070750_893366_B4A51290 
X-CRM114-Status: GOOD (  24.23  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 alexander.sverdlin@nokia.com, miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/16/20 4:02 PM, Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Previous we didn't provide a way to disable the flash's quad mode.
> Which means we cannot do some cleanup works when to remove or
> poweroff the flash, like what set 4-byte address mode does in
> spi_nor_restore().
> 
> Add the capability to disable the flash quad mode, by introducing
> an enable flag in the flash parameters quad_enable() hooks and
> related functions.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 55 +++++++++++++++++++++++++++++++---------------
>  drivers/mtd/spi-nor/core.h | 10 ++++-----
>  2 files changed, 42 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98..ad5498f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1907,15 +1907,16 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  }
> 
>  /**
> - * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
> - * Register 1.
> + * spi_nor_sr1_bit6_quad_enable() - Set/Unset the Quad Enable BIT(6) in the
> + *                                  Status Register 1.
>   * @nor:       pointer to a 'struct spi_nor'
> + * @enable:    true to enter quad mode. false to leave quad mode.

s/enter/enable and s/leave/disable? s/quad mode/Quad Mode
>   *
>   * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
>  {
>         int ret;
> 
> @@ -1923,45 +1924,58 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
>         if (ret)
>                 return ret;
> 
> -       if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
> +       if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
> +           (!enable || !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))

there's a bug here, I think that you wanted:
(!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6))

>                 return 0;
> 
> -       nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +       if (enable)
> +               nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
> +       else
> +               nor->bouncebuf[0] &= ~SR1_QUAD_EN_BIT6;
> 
>         return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
>  }
> 
>  /**
> - * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
> - * Register 2.
> + * spi_nor_sr2_bit1_quad_enable() - set/unset the Quad Enable BIT(1) in the
> + *                                  Status Register 2.
>   * @nor:       pointer to a 'struct spi_nor'.
> + * @enable:    true to enter quad mode. false to leave quad mode.

ditto

>   *
>   * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
>  {
>         int ret;
> 
>         if (nor->flags & SNOR_F_NO_READ_CR)
> -               return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
> +               return spi_nor_write_16bit_cr_and_check(nor,
> +                                               enable ? SR2_QUAD_EN_BIT1 : 0);
> 
>         ret = spi_nor_read_cr(nor, nor->bouncebuf);
>         if (ret)
>                 return ret;
> 
> -       if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
> +       if ((enable && (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)) ||
> +           !(enable || (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)))

I am too finding the following line more readable. Would you change it?

(!enable && !(nor->bouncebuf[0] & SR2_QUAD_EN_BIT1))

>                 return 0;
> 
>         nor->bouncebuf[0] |= SR2_QUAD_EN_BIT1;

you forgot to drop this line

> 
> +       if (enable)
> +               nor->bouncebuf[0] |= SR2_QUAD_EN_BIT1;
> +       else
> +               nor->bouncebuf[0] &= ~SR2_QUAD_EN_BIT1;
> +
>         return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
>  }
> 
>  /**
> - * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
> + * spi_nor_sr2_bit7_quad_enable() - set/unset QE bit in Status Register 2.
>   * @nor:       pointer to a 'struct spi_nor'
> + * @enable:    true to enter quad mode. false to leave quad mode.

ditto

>   *
>   * Set the Quad Enable (QE) bit in the Status Register 2.
>   *
> @@ -1971,7 +1985,7 @@ int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
> +int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable)
>  {
>         u8 *sr2 = nor->bouncebuf;
>         int ret;
> @@ -1981,11 +1995,15 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
>         ret = spi_nor_read_sr2(nor, sr2);
>         if (ret)
>                 return ret;
> -       if (*sr2 & SR2_QUAD_EN_BIT7)
> +       if ((enable && (*sr2 & SR2_QUAD_EN_BIT7)) ||
> +           !(enable || (*sr2 & SR2_QUAD_EN_BIT7)))

(!enable && !(*sr2 & SR2_QUAD_EN_BIT7))

>                 return 0;
> 
>         /* Update the Quad Enable bit. */
> -       *sr2 |= SR2_QUAD_EN_BIT7;
> +       if (enable)
> +               *sr2 |= SR2_QUAD_EN_BIT7;
> +       else
> +               *sr2 &= ~SR2_QUAD_EN_BIT7;
> 
>         ret = spi_nor_write_sr2(nor, sr2);
>         if (ret)
> @@ -2898,12 +2916,13 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  }
> 
>  /**
> - * spi_nor_quad_enable() - enable Quad I/O if needed.
> + * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
>   * @nor:                pointer to a 'struct spi_nor'
> + * @enable:             true to enable quad mode. false to disable.

ditto

>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_quad_enable(struct spi_nor *nor)
> +static int spi_nor_quad_enable(struct spi_nor *nor, bool enable)
>  {
>         if (!nor->params->quad_enable)
>                 return 0;
> @@ -2912,7 +2931,7 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>               spi_nor_get_protocol_width(nor->write_proto) == 4))
>                 return 0;
> 
> -       return nor->params->quad_enable(nor);
> +       return nor->params->quad_enable(nor, enable);
>  }
> 
>  /**
> @@ -2936,7 +2955,7 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> 
> -       err = spi_nor_quad_enable(nor);
> +       err = spi_nor_quad_enable(nor, true);
>         if (err) {
>                 dev_dbg(nor->dev, "quad mode not supported\n");
>                 return err;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b2..222e0d3 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -198,7 +198,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> - * @quad_enable:       enables SPI NOR quad mode.
> + * @quad_enable:       enables/disables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:      converts an absolute address into something the flash
>   *                      will understand. Particularly useful when pagesize is
> @@ -219,7 +219,7 @@ struct spi_nor_flash_parameter {
> 
>         struct spi_nor_erase_map        erase_map;
> 
> -       int (*quad_enable)(struct spi_nor *nor);
> +       int (*quad_enable)(struct spi_nor *nor, bool enable);
>         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>         int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
> @@ -406,9 +406,9 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
>  int spi_nor_wait_till_ready(struct spi_nor *nor);
>  int spi_nor_lock_and_prep(struct spi_nor *nor);
>  void spi_nor_unlock_and_unprep(struct spi_nor *nor);
> -int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
> -int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
> -int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable);
> +int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable);
> +int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> --
> 2.8.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
