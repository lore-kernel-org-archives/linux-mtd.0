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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5E1C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA472065F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 06:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9Y2IELK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nsvbPh6X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="f2VwxjCo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABA472065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4W6bs8HDElXsLXYJtiGIe9ILwCvZlS4Fbok8G1rdp5s=; b=I9Y2IELKU5frs3WNvgpXJU8S1
	DH/RPF6lRy/iRqLlcpE+CjgIirXnkyxEp6MKl8/6GxJ7I9WrYrQphixNi3mmeTn79cYOOlska1b+6
	1AwXvrC5KL3tMdZ9M/8+X+cLWIrxzQEKOgOH9MiFGD5yJzoayamK9x/s1dcIeqeVFc0pi5jmrknu7
	7GWLO0u9LmN5GYtbFN+X1afnp6t9LJJoC7hkK7v2c08y9KEmDuq7j24+uAmicKxEp8m8T4IG+dqJt
	61VQzxZWBtq+c3IN/rGGsMSyHyTWB47Z7fyXsuJE0++UNdP+fchuyoGJlZ0u5Ng+8C8Oy+oT0PKqB
	60EMttfrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurkd-0001J4-6W; Mon, 13 Jul 2020 06:15:43 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurka-0001IJ-GJ; Mon, 13 Jul 2020 06:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594620940; x=1626156940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qff+WQLzK03WMkZJrwepDKwNiYuViV1I2cwgyR+o71k=;
 b=nsvbPh6Xv+bw+2xBOT3AzP2QfomTzSYeTbrKYKcTTomC/C30tTb97Grq
 nD3R/nd0ompiRD0Q3h6UdVLmqVbCpkL82sOVaGhCTi0PCxx6mYa9w+90r
 6EfUOPk2s4OxibnA53UKr4HA6UOuRI44ZDiqTtMaXE1g7HsOrK58Tns6x
 TlV6AXmKhJ9iDKBEAvJ4d0q2XHqiCkMlP3AC+1jo8G/kQqYCoydyKZumi
 QnfyJXFyjgYc7IxkxW/OnMNcP1xb4wDqSl34ch05v2Jd94EG2ZQ/bwbDr
 uvK+TOrTnbZK4S4461x4DExF6NgQ2ao2jp5caE+8LEu6VmF6X19RYd0KY Q==;
IronPort-SDR: s0EBudUGrxHZ6LomiTxd489bH32q9Yr6oa38Ynsc/Qy2Hlj9oCS1nLV0hi2noDtVZFXMHqMBq5
 BySEfoqY94zky/keJthrrbMaN5VWPy19xZ5JkqsYc9aPR0TdUxjjx+ZrSYrZlC4z7VrVNaZnN7
 TFABFuNFFbqnudYO7+6B6R3zpdMkH09ummNSalZaJs+D5ZnkvQY14z7z0JES/7XNbbDxf1uLuO
 J+7OeTvKSPjgyN0zK4jQ+wpQjQ32ZnttIb1gS/a46IiQ/5XKt+IyPTo/K21zKYxgzuPQcKBAdS
 w+c=
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; d="scan'208";a="83574246"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jul 2020 23:15:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 12 Jul 2020 23:15:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sun, 12 Jul 2020 23:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M99HBuU0etMf+pVOmx+eDDHjEPTnQDRrPPeE0VrafOkndp5LQQyKKtLlueE6/zsTEmu9fYUgfDsjogRcI/zICVzmkZ2ikkzDEmHNE1n4UA+nzhv2HtOwyRYOA+R0GW9TLLYLiiCWoyQBHuflhCoHDT1ScidRTWnRhx0xY4gyw8GJa1kNVvzci8Mo9bmzAE6Z7nWaDGTWpc7V79gj3GsTn9U7z31DEEbHVDZKcnl/sjwTBXQw8kddx6m5gJcZ2FUt8Xy2m/AHSAqB+1ewvCSsnLXogH/RlGbWsFPlcX0woqk9cMIRRfP6sh4c89KbyKiBGYlOHnyAuJEzcdoY4N2r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qff+WQLzK03WMkZJrwepDKwNiYuViV1I2cwgyR+o71k=;
 b=CygdUQAPbvE4Hh7IR+McSr2wwGec1LShEYge7/QwdKvm6lotXgcUQIFD3BaXMi7T0omoymGwZL1UkJ2usmo8b3IiQCR11s/lSrj6QGLW/y1hoj0TBT/gzmVxs2DnQ778gvFGPE+H9oChaikJyEZSLcKgE1VxBNejB4uqRhJmRfhkl1kY9yIHidyzFAUPRuRdBnIx4AeAYyLED6lgs4cZLsPkNCj5f6wAZndFMGAZMqDkx22bBjS0tqeU5Yyobs7OyWupcKGW4OyTy6/5gNO2PcqkdIoiynuSy0XGt1yO9afrENf86+L8AIR5g64GGkvLz6s3b9O9AB7f5YaFGw4D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qff+WQLzK03WMkZJrwepDKwNiYuViV1I2cwgyR+o71k=;
 b=f2VwxjCoSEtur62cGLQktTjeMfuakia/HEffIKAMCdKY9pNfh3pGnUimGNDhr+SXd45iABxfg4dfQSj98kwolWy9JcEKas4Ghb24W842GAiaIepO0pAGa99ojU2bLFubX1bTuJIu8Ll/Jc2Rvt3QWMHnPkxnaL5YMoaSynyiGpU=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2693.namprd11.prod.outlook.com (2603:10b6:a02:cc::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 06:15:32 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 06:15:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 02/17] spi: spi-mem: allow specifying a command's
 extension
Thread-Topic: [PATCH v10 02/17] spi: spi-mem: allow specifying a command's
 extension
Thread-Index: AQHWWN0Cwq3UvT6ajkaqtGSmj3sXog==
Date: Mon, 13 Jul 2020 06:15:32 +0000
Message-ID: <0e7ce8fc-b3aa-b93a-d717-fce968686bb3@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-3-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-3-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 0f0c1bdf-89a8-4882-036a-08d826f42631
x-ms-traffictypediagnostic: BYAPR11MB2693:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB269372E06E7F3B4F24CFB502F0600@BYAPR11MB2693.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4IcjUO0KAZcHiNM1mnIc3qdVv92lB3DuhdxSyzyFLmw1uResUJaV9nPXVhYApBaeFaNhaJQ9ZOSmCXXoZHTUDcAjSC7mfnpLHifOsmd4s/zbFGHeUJApjtiaZBKn/Bz42Rhp6Xxc6n5FJNvfwFEjaAcjyi633dMmsvkLRTPVdKuE7o3Tp1tj6guXyWzR0HXXjCnf+izXk5J7VaKaRdCrJh5hrdH4X4tWs3YvwSA0ButB7XO56ARa7RlJp1Q+Ms3HuG+qK+1Ue9UnRjWnz4BKX9ajwI6IPD2s4s+Z4avRnZx6/qdTkxTxe4Ggqg0QBwCc2gjUWgJxMvodz7jSNJrjDQfwsBjQbChuQPui2FQkVn3lwZNSHQJ+usQMJ5U9QBkU/LsV1ni9m3As52w7G+VT2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(396003)(39860400002)(136003)(376002)(26005)(83380400001)(31686004)(36756003)(478600001)(5660300002)(86362001)(7416002)(31696002)(2616005)(66446008)(64756008)(66556008)(6512007)(4326008)(186003)(6506007)(53546011)(66946007)(91956017)(2906002)(66476007)(71200400001)(76116006)(8936002)(8676002)(316002)(6486002)(110136005)(54906003)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1HaKMz/nm+yIaJRKBOjkC5DtzZnia78pmLuc9QVhzs35EZr64wjWtX0KMpAdVkL0DSv7zAGIDHfJ59qpCObzNBpXjBN6SXZQgZXwEmZXWpFeZiFcGGR0Wlfa34LOTUES0OAGqLlqV5dnf7CWNuD44+svD4cjx8VfEKqgUfAttfYjWKiU8HGC3B3gsBNyU4AeXEiwSf3NV7PUh77jVuM0jeBMVvvdhxPxkNtJBRBYnjdRGF+P4b6DSFDnbSLnj4g+vHeRXz6ZiNa3LXykzDUNd7bBVY0yQS57Yi0TuneAYQeCTjGjWbB30lK/XpNFbSzBQ7ZleCoo/DPgen+RFyzPMf7t3X1YI21OCdalgNgsme+y8xtOVFnN/OyoZl6rdmGe5DKk582nbHxvErWZL7Og0+p/9tLEaXgk1Unxkz8JFsTvhq2UcWswuqLaHeFii9f5Eetnhro1Q/gJBOe4gSWzv/zoioTAHs+auKoAvlcxxOK1ZDG8Mv/GTNEO208W2eSp
Content-ID: <5FA253D76E84014ABDD7D3036FFA00F2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0c1bdf-89a8-4882-036a-08d826f42631
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 06:15:32.5948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXBlDWhbqnNdXvRJanw521w0EClGCobwstUV9jmN+JwLkVLnqTYy+ETb50Vy7A5QI1tCIZvZrK+vMxrW7GRy9axYmciWydACExKzUb3hrQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_021540_937044_9D0DC334 
X-CRM114-Status: GOOD (  26.48  )
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
> In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> the "command extension". There can be 3 types of extensions in xSPI:
> repeat, invert, and hex. When the extension type is "repeat", the same
> opcode is sent twice. When it is "invert", the second byte is the
> inverse of the opcode. When it is "hex" an additional opcode byte based
> is sent with the command whose value can be anything.
> 
> So, make opcode a 16-bit value and add a 'nbytes', similar to how
> multiple address widths are handled.
> 
> Some places use sizeof(op->cmd.opcode). Replace them with op->cmd.nbytes
> 
> The spi-mxic and spi-zynq-qspi drivers directly use op->cmd.opcode as a
> buffer. Now that opcode is a 2-byte field, this can result in different
> behaviour depending on if the machine is little endian or big endian.
> Extract the opcode in a local 1-byte variable and use that as the buffer
> instead. Both these drivers would reject multi-byte opcodes in their
> supports_op() hook anyway, so we only need to worry about single-byte
> opcodes for now.
> 
> The above two changes are put in this commit to keep the series
> bisectable.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/spi/spi-mem.c       | 13 +++++++------
>  drivers/spi/spi-mtk-nor.c   |  4 ++--
>  drivers/spi/spi-mxic.c      |  3 ++-
>  drivers/spi/spi-zynq-qspi.c | 11 ++++++-----
>  include/linux/spi/spi-mem.h |  6 +++++-
>  5 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 93e255287ab9..ef53290b7d24 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -159,6 +159,9 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>         if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
>                 return false;
> 
> +       if (op->cmd.nbytes != 1)
> +               return false;

I would put this imediately before:

if (spi_check_buswidth_req(mem, op->cmd.buswidth, true))  

to speed up the exit and avoid the rest of the checks that would
become superflous.


> +
>         return true;
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
> @@ -173,7 +176,7 @@ static bool spi_mem_buswidth_is_valid(u8 buswidth)
> 
>  static int spi_mem_check_op(const struct spi_mem_op *op)
>  {
> -       if (!op->cmd.buswidth)
> +       if (!op->cmd.buswidth || !op->cmd.nbytes)

we would be more explicit with:
if (!op->cmd.buswidth || !op->cmd.nbytes || op->cmd.nbytes > 2)

With these addressed:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>                 return -EINVAL;
> 
>         if ((op->addr.nbytes && !op->addr.buswidth) ||
> @@ -309,8 +312,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>                         return ret;
>         }
> 
> -       tmpbufsize = sizeof(op->cmd.opcode) + op->addr.nbytes +
> -                    op->dummy.nbytes;
> +       tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> 
>         /*
>          * Allocate a buffer to transmit the CMD, ADDR cycles with kmalloc() so
> @@ -325,7 +327,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> 
>         tmpbuf[0] = op->cmd.opcode;
>         xfers[xferpos].tx_buf = tmpbuf;
> -       xfers[xferpos].len = sizeof(op->cmd.opcode);
> +       xfers[xferpos].len = op->cmd.nbytes;
>         xfers[xferpos].tx_nbits = op->cmd.buswidth;
>         spi_message_add_tail(&xfers[xferpos], &msg);
>         xferpos++;
> @@ -427,8 +429,7 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>                 return ctlr->mem_ops->adjust_op_size(mem, op);
> 
>         if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
> -               len = sizeof(op->cmd.opcode) + op->addr.nbytes +
> -                     op->dummy.nbytes;
> +               len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> 
>                 if (len > spi_max_transfer_size(mem->spi))
>                         return -EINVAL;
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 7bc302b50396..d5f393871619 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -195,7 +195,7 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>                 }
>         }
> 
> -       len = MTK_NOR_PRG_MAX_SIZE - sizeof(op->cmd.opcode) - op->addr.nbytes -
> +       len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
>               op->dummy.nbytes;
>         if (op->data.nbytes > len)
>                 op->data.nbytes = len;
> @@ -219,7 +219,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>                                (op->dummy.buswidth == 0) &&
>                                (op->data.buswidth == 1);
>         }
> -       len = sizeof(op->cmd.opcode) + op->addr.nbytes + op->dummy.nbytes;
> +       len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>         if ((len > MTK_NOR_PRG_MAX_SIZE) ||
>             ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
>                 return false;
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 69491f3a515d..8c630acb0110 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>         int nio = 1, i, ret;
>         u32 ss_ctrl;
>         u8 addr[8];
> +       u8 opcode = op->cmd.opcode;
> 
>         ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
>         if (ret)
> @@ -393,7 +394,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>         writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
>                mxic->regs + HC_CFG);
> 
> -       ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
> +       ret = mxic_spi_data_xfer(mxic, &opcode, NULL, 1);
>         if (ret)
>                 goto out;
> 
> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> index 17641157354d..bbf3d90561f5 100644
> --- a/drivers/spi/spi-zynq-qspi.c
> +++ b/drivers/spi/spi-zynq-qspi.c
> @@ -527,20 +527,21 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>         struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
>         int err = 0, i;
>         u8 *tmpbuf;
> +       u8 opcode = op->cmd.opcode;
> 
>         dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> -               op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> +               opcode, op->cmd.buswidth, op->addr.buswidth,
>                 op->dummy.buswidth, op->data.buswidth);
> 
>         zynq_qspi_chipselect(mem->spi, true);
>         zynq_qspi_config_op(xqspi, mem->spi);
> 
> -       if (op->cmd.opcode) {
> +       if (op->cmd.nbytes) {
>                 reinit_completion(&xqspi->data_completion);
> -               xqspi->txbuf = (u8 *)&op->cmd.opcode;
> +               xqspi->txbuf = &opcode;
>                 xqspi->rxbuf = NULL;
> -               xqspi->tx_bytes = sizeof(op->cmd.opcode);
> -               xqspi->rx_bytes = sizeof(op->cmd.opcode);
> +               xqspi->tx_bytes = op->cmd.nbytes;
> +               xqspi->rx_bytes = op->cmd.nbytes;
>                 zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
>                 zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
>                                 ZYNQ_QSPI_IXR_RXTX_MASK);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index e3dcb956bf61..159463cc659c 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -17,6 +17,7 @@
>         {                                                       \
>                 .buswidth = __buswidth,                         \
>                 .opcode = __opcode,                             \
> +               .nbytes = 1,                                    \
>         }
> 
>  #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)           \
> @@ -69,6 +70,8 @@ enum spi_mem_data_dir {
> 
>  /**
>   * struct spi_mem_op - describes a SPI memory operation
> + * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> + *             sent MSB-first.
>   * @cmd.buswidth: number of IO lines used to transmit the command
>   * @cmd.opcode: operation opcode
>   * @cmd.dtr: whether the command opcode should be sent in DTR mode or not
> @@ -94,9 +97,10 @@ enum spi_mem_data_dir {
>   */
>  struct spi_mem_op {
>         struct {
> +               u8 nbytes;
>                 u8 buswidth;
>                 u8 dtr : 1;
> -               u8 opcode;
> +               u16 opcode;
>         } cmd;
> 
>         struct {
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
