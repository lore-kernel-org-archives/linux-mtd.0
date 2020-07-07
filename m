Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E7EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 17:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF66A20672
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 17:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVBHqUDx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XIvR0E96";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="T7uCh+d3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF66A20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lVnuhmP0PRJun4QafmsKKkyYl7BBjW/Qzkdvl/D5k3s=; b=NVBHqUDxOkzmr64JM1+yvJOB6
	ARBnDe969ipC+KjJb9B80HFCbjlDNkeUhUQT9xOykeW93Q77n+c/rMxUwa/mkeZ+2v/FvRuqbvgCU
	0TnGvrXxNPPdlH69Ncw+ouc2QZVFkAeyKzWRxNM5ZFtLBuAWt74kb/hTWIa2+/i8WBU3XY0snGFtF
	Mm7qn3Q/bToTGb7VTTyC/Vf2eYFOYIuSxNk2uN6y8HJkcpWao/NMDZkZVc41Egd9ajQpaNIsX+JuZ
	nEmbxU1SErzqz4MQ4hJ5QzsdHO0LP5hSuVVOppSNBmxTDFFzgjNfsNmiFqYL2/9Hp6QQwt069FJSS
	vlJlmZxAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsrXF-0001Sc-HO; Tue, 07 Jul 2020 17:37:37 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsrXB-0001RJ-Py; Tue, 07 Jul 2020 17:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594143453; x=1625679453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gggAHfxW3j4Qxr/mfxI+aHpCGIQTlLW5ZtBSaZ/WJzY=;
 b=XIvR0E96p2qSiBdEHGe04WHCdd+Z/EMRjESLAWQEbUDX88iq5BbYtuq5
 nFSvw7ZvlLJKd/vX9sRfo4JGE4ub2PExubP7KzhA/RsjWkBTlQ4kh4W+h
 gGz3j5Jh5LnJVfzloa/a/lRBMTlDdST9y89wnEr2vSHWj/aq9619rUemi
 Zr6GYo5DP4vtnEzCnJYf30+oxwhObSjaEUqhm/386TS348SKdKsNqllv1
 bkKLxvrthXi3mnBTy/cxCxK0n/vyoFstk0xoM/265645Y/ZEDljVFjdHU
 jFrahUIcDOFLsCFpz+uFTZxqJBc9ngK9u2pmwNLsQoHNDoEWgtuXo38b1 A==;
IronPort-SDR: zvKMN8gXad+C5GtwZZR4wbXN0SP8KhsVkCd4gsQX/0w8JQ84GVHliOIwkbfuinBq46ZdjHVWOD
 uOm+4v9MNBcZiP6gjuOQPEoUtlrO9YkdIYiUmZJbrRtxMXc+slK4Z3KMSxAwkGUQ2zPPXSdYzv
 7lxgOhNa/3Z5DRyUrZlaZ8vuP6J44DkV8xW/cCItifAhoOD3n/Tv7kavqbYc+LnJNncVs1HToZ
 KM+10mD3aIqPjhodKZuhK4ztPnQkXjgUmL8CWTUwDtTQE6RmNJjzm+tM73y80Xg6DMchLr3ZTo
 znI=
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="79049909"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jul 2020 10:37:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 7 Jul 2020 10:37:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 7 Jul 2020 10:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8bey7CrRFmHXlR110zEYEd0azsB/SGWcGZVoevSIp/fR4Wng+3Y6x35RwrmHhae3MdjKSSWbCjyAPnTJgyLi90TiaEpMlRqCJZ1HIU2030yrOGQa+kr7FWK00zt9bD7NVgre0ai/eH2k77V+j+2v5AE6cxKUzcxwTuW1dlzgOuDfs3zzizCzIWWMCLpaM3NnyEK7orZnrZ75r4hVWmnFG+WAuGSUCqwt7OR/8F/cTcjR0+329bneKOR51hucI84vzHeZsEExIB11dD736dtuJn+HydtP/8rw5zjtLGkmddcALIi1+/BCt/MyZmx6BWdsOg79wnmoo6oGxgrXdImNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gggAHfxW3j4Qxr/mfxI+aHpCGIQTlLW5ZtBSaZ/WJzY=;
 b=Js8//aPnScH5kNFC7dnctB/jFwbX8UGMppuZZrdjMRH9xVWd5FXrxiITbq1PLjs3ScdJWC48Cz0KCIDG2RsHG7ejmbXFPBo92IVXo2e9eYjl0POny5Wxuy/oMnufwG48D3delmDp0QJRoMIWq3nWZvbZJP67s7x5O+oPjwI1kdaQskUL2tDyfkV1REwW602tlEZR7LU/klyi8Ha0S4hYc3KbPKyAJSLExC1kM5VWYu9aZSo8rR0KokgpEP1lE+N4Y7GvCU6o3iB0Y/fYkz2XKt2Q4VUKGPaA2OSahlWCwon79Q4ogJezW1fraH/S/pBFocFiGPb76Fd72XXqm+o1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gggAHfxW3j4Qxr/mfxI+aHpCGIQTlLW5ZtBSaZ/WJzY=;
 b=T7uCh+d3oLCFn60C41EFLKqW1XUJWvPjmjpdt1GTTcE/ya3HJIxB7WChBa13X/ZPcdzvPjdcobc7KSdNa7Gvn9MkXOAavdo9wtepPcMM7jF7yJnyTsURwHRYdStpn9nxPhHFql1S1Sa1BctGS906f8maJrCkPqty5dQzmfmeb3o=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB3879.namprd11.prod.outlook.com (2603:10b6:a03:18f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 17:37:26 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 17:37:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Topic: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Index: AQHWVIVGo10ftuQ9H0mpaQ4YA8PU1w==
Date: Tue, 7 Jul 2020 17:37:26 +0000
Message-ID: <fbb3d7e7-75ed-dbf6-a975-2ae871bc9fbf@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-6-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-6-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b642c5a3-24e3-4965-89d8-08d8229c6a0f
x-ms-traffictypediagnostic: BY5PR11MB3879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB3879442F481F54BF0DEB59B2F0660@BY5PR11MB3879.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yDv4DcNahWwXbv0qk+/GYlgPDO1ll/3X+dwbKBZI+zbYThxOcZ5KdjGNdueajymtIUbx74HXXfKU/r1HwGiGLhpYFjBIOW396AmJRofXaI9t9+i6cV0ObEsmHj/UPogau8RY7BT+NsP7lm0LbqogWmbocM4V18StbN7pWwBDHwDhNREiTuj6u3kRkRTcDSf+Yw0MAp7g+eB7I5pJDFcRDMaJntC/FRzaLmxM1CGnNxhClKxzvKxYjOm1eV1AC2+9SYjl0rTylcwhzRO6DrL9oWLOa4mTCSe6rqMGVAXEY001ggKBqncSVfXg6jUthgeHCEvLs6ygPsVemLHUbsGCQYYmkM4lMiv+lyNIVPCY1l+lPKvwUt9PQb0pWHqtShQn87ZqbhtW3Dlkm2K87oX8uDsAAjsf5wDTwMMdB8//R8YeTH5kX43hfyYXeW5bYnMO1XTUhL965u1HEbqLvcA+rKhStpFtKl4zxYyWioShi8kub0M9Jp1TMuJibcQ06HCk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(396003)(39850400004)(366004)(346002)(83380400001)(316002)(2616005)(66946007)(6512007)(186003)(4326008)(2906002)(6486002)(26005)(76116006)(110136005)(91956017)(86362001)(31696002)(7416002)(8936002)(966005)(53546011)(8676002)(5660300002)(30864003)(6506007)(71200400001)(478600001)(66556008)(36756003)(31686004)(66446008)(64756008)(54906003)(66476007)(921003)(43740500002)(352734003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ellkTB6/9jOymSVnp9xpoywq0OUpbvjFwN8azfKATeE1cZE7X6AGQqXKpkGImdNluii1nfdb7deuiiAN3ZEN2d7fkUKqNROTu2nGq+D8Aqyur4bv5OXzOec8gtFFmcFITlKoYcsAHEGFqLp26UMwXhD02RyWQE1NqE6p8GgtWjAa6emgN8bqoGVyYd86j3Uc21BkRxR+yTVYbXODtPrqX/fpehojl7tSThzU7BmyR0S9v+MKYCxLzfCpTnzJjlCjz9GgMy1XBH7VtDRilTzEJq3KDC62GDnNn++Fwrt2hcLKv5OX3xj8ocHgbTTroIRmsVjaaqigETBA0QKogiwsSKW48DjGRpBQEDSN3DTn6wSazgIsZ7rXcYDyOSujURse2AkN8D60P+cUA+JAWY7J+VyGFu3TQFoMWvPYKud9Imq3vSpiaySboW5759v4I34pRu3KvpD5iDkNxno/+h+hViBb+j+63QGV4DCkGMbs+pw=
Content-ID: <D75917625431364887D7C4D5B2F700C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b642c5a3-24e3-4965-89d8-08d8229c6a0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 17:37:26.0402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tu5S/subQ6GUPMQTG6ndQOjvatERiV4co3n/AO0TvwvKd+nxuYfhn3Je0pi+GrzjcJ4hXAZqfsezM5bWB4EbcmZJHg0riqMR2XlAgae3gmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_133734_229481_34174B7A 
X-CRM114-Status: GOOD (  24.80  )
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

Hi, Pratyush,

On 6/23/20 9:30 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Double Transfer Rate (DTR) is SPI protocol in which data is transferred
> on each clock edge as opposed to on each clock cycle. Make
> framework-level changes to allow supporting flashes in DTR mode.
> 
> Right now, mixed DTR modes are not supported. So, for example a mode
> like 4S-4D-4D will not work. All phases need to be either DTR or STR.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 305 ++++++++++++++++++++++++++++-------- 
>  drivers/mtd/spi-nor/core.h  |   6 +
>  drivers/mtd/spi-nor/sfdp.c  |   9 +-
>  include/linux/mtd/spi-nor.h |  51 ++++--
>  4 files changed, 295 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..22a3832b83a6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -40,6 +40,76 @@
> 
>  #define SPI_NOR_MAX_ADDR_WIDTH 4
> 
> +/**
> + * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
> + *                        extension type.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @op:                        pointer to the 'struct spi_mem_op' whose properties
> + *                     need to be initialized.
> + *
> + * Right now, only "repeat" and "invert" are supported.
> + *
> + * Return: The opcode extension.
> + */
> +static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
> +                             const struct spi_mem_op *op)
> +{
> +       switch (nor->cmd_ext_type) {
> +       case SPI_NOR_EXT_INVERT:
> +               return ~op->cmd.opcode;
> +
> +       case SPI_NOR_EXT_REPEAT:
> +               return op->cmd.opcode;
> +
> +       default:
> +               dev_err(nor->dev, "Unknown command extension type\n");
> +               return 0;
> +       }
> +}
> +
> +/**
> + * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem op.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @op:                        pointer to the 'struct spi_mem_op' whose properties
> + *                     need to be initialized.
> + * @proto:             the protocol from which the properties need to be set.
> + */
> +void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> +                            struct spi_mem_op *op,
> +                            const enum spi_nor_protocol proto)

There's not much to set for the REG operations.

> +{
> +       u8 ext;
> +
> +       op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> +
> +       if (op->addr.nbytes)
> +               op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +       if (op->dummy.nbytes)
> +               op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +
> +       if (op->data.nbytes)
> +               op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);

How about getting rid of the above and

> +
> +       if (spi_nor_protocol_is_dtr(proto)) {

introduce a spi_nor_spimem_setup_dtr_op() just for the body of this if?

> +               /*
> +                * spi-mem supports mixed DTR modes, but right now we can only
> +                * have all phases either DTR or STR. IOW, spi-mem can have
nit: SPIMEM
> +                * something like 4S-4D-4D, but spi-nor can't. So, set all 4
nit: SPI NOR
> +                * phases to either DTR or STR.
> +                */
> +               op->cmd.dtr = op->addr.dtr = op->dummy.dtr
> +                              = op->data.dtr = true;
> +
> +               /* 2 bytes per clock cycle in DTR mode. */
> +               op->dummy.nbytes *= 2;
> +
> +               ext = spi_nor_get_cmd_ext(nor, op);
> +               op->cmd.opcode = (op->cmd.opcode << 8) | ext;
> +               op->cmd.nbytes = 2;
> +       }
> +}
> +
>  /**
>   * spi_nor_spimem_bounce() - check if a bounce buffer is needed for the data
>   *                           transfer
> @@ -104,14 +174,12 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>         ssize_t nbytes;
>         int error;
> 
> -       /* get transfer protocols. */
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->read_proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> -       op.dummy.buswidth = op.addr.buswidth;
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> +       spi_nor_spimem_setup_op(nor, &op, nor->read_proto);

Here we would keep the code as it were.
> 
>         /* convert the dummy cycles to the number of bytes */
>         op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +       if (spi_nor_protocol_is_dtr(nor->read_proto))
> +               op.dummy.nbytes *= 2;

And replace these 2 lines with:
	if (spi_nor_protocol_is_dtr(nor->read_proto))
		spi_nor_spimem_setup_dtr_op(nor, &op, nor->read_proto)
> 
>         usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> 
> @@ -169,13 +237,11 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
>         ssize_t nbytes;
>         int error;
> 
> -       op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
> -       op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
> -       op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
> -
>         if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
>                 op.addr.nbytes = 0;
> 
> +       spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
>         if (spi_nor_spimem_bounce(nor, &op))
>                 memcpy(nor->bouncebuf, buf, op.data.nbytes);
> 
> @@ -227,10 +293,16 @@ int spi_nor_write_enable(struct spi_nor *nor)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);

For the reg operation we can get rid of the extra checks that were in
spi_nor_spimem_setup_op and simply do:

		if (spi_nor_protocol_is_dtr(proto))
			spi_nor_spimem_setup_dtr_op()

> +
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
> -                                                    NULL, 0);
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto))
> +                       ret = -ENOTSUPP;
> +               else
> +                       ret = nor->controller_ops->write_reg(nor,
> +                                                            SPINOR_OP_WREN,
> +                                                            NULL, 0);

Would you introduce helpers for the controller ops, like Boris
did in the following patch?
https://patchwork.ozlabs.org/project/linux-mtd/patch/20181012084825.23697-10-boris.brezillon@bootlin.com/

How about spi_nor_controller_ops_read_reg()
and spi_nor_controller_ops_write_reg() instead?

cut

> @@ -1144,7 +1291,11 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_NO_DATA);
> 
> +               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
>                 return spi_mem_exec_op(nor->spimem, &op);
> +       } else if (spi_nor_protocol_is_dtr(nor->write_proto)) {
> +               return -ENOTSUPP;
>         } else if (nor->controller_ops->erase) {
>                 return nor->controller_ops->erase(nor, addr);
>         }

here you would need a helper: spi_nor_controller_ops_erase()

cut

> @@ -2368,12 +2517,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>         struct spi_nor_flash_parameter *params = nor->params;
>         unsigned int cap;
> 
> -       /* DTR modes are not supported yet, mask them all. */
> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
> -
>         /* X-X-X modes are not supported yet, mask them all. */
>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
> 
> +       /*
> +        * If the reset line is broken, we do not want to enter a stateful
> +        * mode.
> +        */
> +       if (nor->flags & SNOR_F_BROKEN_RESET)
> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);

A dedicated reset line is not enough for flashes that keep their state
in non-volatile bits. Since we can't protect from unexpected crashes in
the non volatile state case, we should enter these modes only with an
explicit request, i.e. an optional DT property: "update-nonvolatile-state",
or something similar.

For the volatile state case, we can parse the SFDP SCCR map, save if we
can enter stateful modes in a volatile way, and if yes allow the entering.

Do the flashes that you played with define the SFDP SCCR map?

> +
>         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
>                 int rdidx, ppidx;
> 
> @@ -2628,7 +2781,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>                  * controller directly implements the spi_nor interface.
>                  * Yet another reason to switch to spi-mem.
>                  */
> -               ignored_mask = SNOR_HWCAPS_X_X_X;
> +               ignored_mask = SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR;
>                 if (shared_mask & ignored_mask) {
>                         dev_dbg(nor->dev,
>                                 "SPI n-n-n protocols are not supported.\n");
> @@ -2774,11 +2927,25 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>                                           SNOR_PROTO_1_1_8);
>         }
> 
> +       if (info->flags & SPI_NOR_OCTAL_DTR_READ) {

Why do we need this flag? Can't we determine if the flash supports
octal DTR by parsing SFDP?

> +               params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +               spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                         0, 20, SPINOR_OP_READ_FAST,
> +                                         SNOR_PROTO_8_8_8_DTR);
> +       }
> +
>         /* Page Program settings. */
>         params->hwcaps.mask |= SNOR_HWCAPS_PP;
>         spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>                                 SPINOR_OP_PP, SNOR_PROTO_1_1_1);
> 
> +       /*
> +        * Since xSPI Page Program opcode is backward compatible with
> +        * Legacy SPI, use Legacy SPI opcode there as well.
> +        */
> +       spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> +                               SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
> +

This looks fishy. You haven't updated the hwcaps.mask, these pp settings never
get selected?

>         /*
>          * Sector Erase settings. Sort Erase Types in ascending order, with the
>          * smallest erase size starting at BIT(0).
> @@ -2886,7 +3053,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
> 
>         spi_nor_manufacturer_init_params(nor);
> 
> -       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
> +       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>                 spi_nor_sfdp_init_params(nor);
> 
> @@ -2948,7 +3116,9 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> +       if (nor->addr_width == 4 &&
> +           !(nor->info->flags & SPI_NOR_OCTAL_DTR_READ) &&

Why is the Octal DTR read exempted?

> +           !(nor->flags & SNOR_F_4B_OPCODES)) {
>                 /*
>                  * If the RESET# pin isn't hooked up properly, or the system
>                  * otherwise doesn't perform a reset command in the boot
> @@ -3007,6 +3177,9 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>  {
>         if (nor->addr_width) {
>                 /* already configured from SFDP */
> +       } else if (spi_nor_protocol_is_dtr(nor->read_proto)) {
> +                /* Always use 4-byte addresses in DTR mode. */
> +               nor->addr_width = 4;

Why? DTR with 3 byte addr width should be possible too.

>         } else if (nor->info->addr_width) {
>                 nor->addr_width = nor->info->addr_width;
>         } else if (nor->mtd.size > 0x1000000) {

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
