Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5C2C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:29:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 071AC2075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="azTNgO9O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1XhLeEbV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="udzFvZuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 071AC2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QaguflfRbx27UwqmcIaySrmL1SZOXubVnRCziCroGkc=; b=azTNgO9ODPJwronnwlQ8Noqb3
	MIXM0jxLvtgD/zPsQA/q5WFZvmfYoDdMiykjFXSCX17yHYsP3iHyxnbgxW3e1emuF3ssIJmtT9pbN
	EJNZ0qIYbS8KU6ZxSo+P105bJe2AFomwWO3R93xb4PRdkU6pi/UzSPHSnVszMJYbGPdMq7M69+PzG
	zK4bX1SqPUh/V30TmTuwbW2GTiF/szL3gcCehPp0iwHRH63NK2E/+xm3zpBZ39W/WsQfajk4i0zY6
	78NGwI4Qd8ZBkhekbC0ppP1bbsLTJkWH10ZW8NtwqKMmU0R77gzTN9b45rJULmQZPUyFbxkSF4fWN
	sr9JqoMaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWXq-0007DP-GH; Wed, 30 Sep 2020 07:28:58 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWSF-00046v-6X
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601450592; x=1632986592;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SI+SazYUtOAc1ZjlQzmU7raWR/7kT/kpGONZ5OdspuI=;
 b=1XhLeEbVGvTh4QGd7OZDpDV2INuhjOU6Xchw35/nUroJYGIlDtSDA+yE
 oq1tEstbhCDNZdYuTnukIIcXJ+Cyo3CJmSyhjhIXHueW+xi8+A+yjFvhM
 R1uIRUHjlfMC8KyC/m282anOo/j/zByzWOWqnZSZ5YBWaPmcKL41WZmVj
 +9KynxPxOMaxlicuUDZNQCxNznIeunyL3341FzBSff/xHv+PRelYrlnrZ
 ATtp1IOw+6OI1lJmv9cRd370LJu143iSMYUxXEX2O///qYQ+dcxcbInut
 jDsVbcjRT2MWuaMLkRHe14CULyjQhR5GT00PszeGd8Y9KldfN+HJclucd g==;
IronPort-SDR: DuqUSN3IPq/5c/N8alkoiJVLWDOuXFj0QdNcmXngZX9Z16OCl3hhcsnhiiLG0Tn+DCAseqx9nC
 2Dw+7lyhSZSZElzHba3UHfdUv2MGP+N04NRtG86ZamgxBr4VCIt2swKpBz8BfhB5O+f5L/V+0h
 N4nyueq1GmwlH69fc9prXkOuGGgL9wT+syKnNHBS/zX6KP88MHufM8Wu9oeIWNAjA+WbLo5x4m
 vSsTjOhMRR2Vjf2mKYLJOCbedKVSwxRHC4ryEbRQUYkCZhzbrwPxiGuC9PbZahdK2LxTZEM82D
 7Cg=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="92916250"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 00:23:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 00:23:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 30 Sep 2020 00:22:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qb1598zKzu1IYOY1ZpNQxVJadN0ASM/+z7LNniY7ngb/KKpUz0tVNGmHcJC48/MfTt0KV3sGU+44F2oasC7evLsneifIQ8LQyhab95qljJ5ly1SDrhizQI/CqiocB9xZpfrczoPhmUk3JlGGPH0pJq33LLaiEI9fo5Oph56MY0/tGY3puRCJYIO/JOAHjzqH/SLugNRQsMB0NqAgOlcCUGEgQYr2+sZmsYGHxFtCpmelFEAi3CZ2OhRLij42PUXFch9bjYkcVSu5B2iKJGJpE1OMwaOkUIXrB0v1wYrPE4OgHQggSY6pPIwRJ5SF0kl4ghSKviLrYqSvGy1sWSX6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI+SazYUtOAc1ZjlQzmU7raWR/7kT/kpGONZ5OdspuI=;
 b=ALFBZGAHtI60/EaVl1/gmmrY43i34zdOk7QEGxFuXcxT3xQQwodYu1Zecq1wowCNLExQDDPwFM1RMpni5R2iW2Kt10N7BBtPqs3dASuesi7QtU+xE2E+r47olRZFSSVknmOjn67oGVoH1dZjRM6V23JlFixo+fJ+40m+RkxdhmYrgxbz3eiqmA/Yq6fqGZvGr20r00W6Kr1pgEA9wwQX1HRrdq1nh7MnG2sQQha0Ta7XAKPFER3BvF1XRzHrEt7Q29hW3u+UuGVZZUwh/H5qSpgV2YWHboGVTEbrQC4LDT/yxgdMKox5VzjWgHTGKBa6QK3PIJuFUsDL4bJ76v3HlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI+SazYUtOAc1ZjlQzmU7raWR/7kT/kpGONZ5OdspuI=;
 b=udzFvZuRxHs+sHCEEiLU55wRl9h5IJmgGZOaNCCts96rFBPh2MoDxRhHHKtti9Tt8h4sZOwP2faLGyK3alil8WEkh4M9QtD3Xt+5XA9kiSTpB+Bn/vO5j0WE54KfEYAwO+kJ9QPpDaRpokvRVvVDVcfaid2EsBxdHTpulO8CAAs=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM6PR11MB3401.namprd11.prod.outlook.com (20.176.119.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Wed, 30 Sep 2020 07:23:04 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 07:23:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 10/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Topic: [PATCH v13 10/15] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Index: AQHWlvqIHkQZTJ8xTUKPfCCAzBC5iw==
Date: Wed, 30 Sep 2020 07:23:04 +0000
Message-ID: <8346524d-487b-a147-6183-e8055a7ff54a@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-11-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-11-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: d43a4c88-d7a4-4669-4ccc-08d86511abba
x-ms-traffictypediagnostic: DM6PR11MB3401:
x-microsoft-antispam-prvs: <DM6PR11MB340136FE8EA39B8D5649934BF0330@DM6PR11MB3401.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wk9xK5+uqV2Dn5TXs7Pj8w3eXsBGj8YYggSDyqowIxRaGnaRPSCFBceAOTr5DbGdufg78IC8GwIaTlDMI7zGhcSs0SBuyPVmDEZA5P/bDAj/ShK+n8RTbu7Hldmbwhxq7EqSN1unTWBgL2IoO50NOYR4FlHA2AdJ+W7A8bupRK+ozVisZkPYQpoehkDOL1n65BEU8kgTvi2ANVhPG67wjenTaTOKkWLKFq9mzCba/5kKt/Fu5aC49sHaMGz2N1Ed/PwnuT96teghjg4FthjIKPtAASFIc/Q7TQ9jsRwwRd+MfWuNNJhTTga1ok+P99Rko1kqGkC34SP3KZZLc8Ztg5xv0dyF3QtXlpVLeHLIrDq7HPIoEwLT4AQYD6xjKdl2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(366004)(39860400002)(396003)(2906002)(26005)(66946007)(91956017)(76116006)(66446008)(186003)(4326008)(64756008)(66476007)(66556008)(8676002)(6506007)(2616005)(31686004)(53546011)(6512007)(8936002)(6486002)(5660300002)(36756003)(31696002)(316002)(86362001)(54906003)(71200400001)(110136005)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RacwX+iixmt80ExDmWaKQ1igOrZ40M7fhBl5Al/I/iYrjswpqCqj2BVf1VsaHtjk+6daA5InRuzRZonUaqO6cjZ9Bpj6qGnVIEkr2lor8cEgxoe/y+RM0RAEASvTiL2LXAZvkqmhTJ+viVOxIHI0qEoBbokbh1F7MCFDaOrF+U3pAyZ7L0J7HVwrHRa8w2uoclcp6RA/yvlxrR/9Te8h++u67CKonhtGnJOjUxeyvMwgonABjcx/HaU3BfboDXpb/JseM5aRCED/DLdaIF6qlMF2Vr0yVSxvPvBsKR9VlB0kMT3S3sjRTYC37B0kiR7K5P90IyA2267k/vKsI4o5h6lc1J3q8KAdHCIYZMz1RhcljKIp2rpRJseuA9Y2kmB+fnPL7xtutN6FVCDYFV/qJ24V1pSHQGu5wBwCEZp/9PJn1p3Ccrj2nXKdk8ifM9k3NpYL9b5vles+XppOXseuPyEanfF1/z2uocGLN4TLfK3nY8wL32aeM0ZmJQFH4bBFPC0gbWKvPZOuorsT5ycyr4zUzMYZAolyqlQfEk+66vLRgLkia5sQaAMcrP7FbR83O/Ecl6uVSdA3RJ2iYYcvrZzqy36dBYkXgWNQmelXrT7Eqc664Css6vQcGue7FZXDVhWK+ti9y8PHx0XOjZdp2g==
x-ms-exchange-transport-forked: True
Content-ID: <2BA8D8F70AC7A34DAA49D91508C28096@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d43a4c88-d7a4-4669-4ccc-08d86511abba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 07:23:04.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnO8hgJka+p3SEn39ajDwt/k5uE2pNilJU+G3GRcZdvcXJqp+l8hoXIypeg1r/tZwUuOdq2U87lTPffiNCOCE496Y2NmWrdzemeLZjMuzrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_032311_529539_D42CCE4A 
X-CRM114-Status: GOOD (  21.56  )
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
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> A Soft Reset sequence will return the flash to Power-on-Reset (POR)
> state. It consists of two commands: Soft Reset Enable and Soft Reset.
> Find out if the sequence is supported from BFPT DWORD 16.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.h | 1 +
>  drivers/mtd/spi-nor/sfdp.c | 4 ++++
>  drivers/mtd/spi-nor/sfdp.h | 2 ++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fcb5f071ebed..e2c7324d997e 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -26,6 +26,7 @@ enum spi_nor_option_flags {
>         SNOR_F_HAS_SR_TB_BIT6   = BIT(11),
>         SNOR_F_HAS_4BIT_BP      = BIT(12),
>         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
> +       SNOR_F_SOFT_RESET       = BIT(14),
>  };
> 
>  struct spi_nor_read_command {
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index cadb1ed27ffe..f192710aca31 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -604,6 +604,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>                 break;
>         }
> 
> +       /* Soft Reset support. */
> +       if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SOFT_RST)
> +               nor->flags |= SNOR_F_SOFT_RESET;

minimal support for SWRST but we can extend it later. Looks good.

> +
>         /* Stop here if not JESD216 rev C or later. */
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 6d7243067252..8ae55e98084e 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -90,6 +90,8 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> 
> +#define BFPT_DWORD16_SOFT_RST                  BIT(12)

the name is too generic. How about

#define BFPT_DWORD16_SWRST_EN_RST		BIT(12)

> +
>  #define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
