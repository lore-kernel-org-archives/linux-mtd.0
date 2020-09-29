Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D74C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:31:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C2323A6C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDzvRfeI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Qwzkv+k0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="T1FaZM3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98C2323A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zQjcRpn+HJO5SRPlEPlrwKPNDjhD31NgTZUz8d4vons=; b=rDzvRfeIYbZ+1naasb82b2Kwf
	JIwnA5bM4nCB7xwGkZ4ot0I1tVYUmYRyutN0yNJkionCeu8lu0kOmk/zb4aw4T+etRyaJMBWG8Vml
	riIdDFqJCEZpxab8Lovf1awuc7zN/og0WTWBOSHU/3ZuLGToRzuTVd1sNebDY3w7U4XhUuKvQkPX7
	hnMKbNEmpRgmLp7F+Vli20kmruCMvAPmSFo5rNTE6xllJzgYoZ0Q6SpKRC0YxedVus4f9rcdiYi5+
	mX+AcHpLuLrTHEUUKehH49sTV+iE9PurWbjNFYcJZyiDskyZJFm71GiCqC/Lzn9RIjDQE4a5uGW7z
	jXAG7TEbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDqE-0001NP-G7; Tue, 29 Sep 2020 11:30:42 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDqB-0001M3-DH
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 11:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601379040; x=1632915040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pPIqFUcy8fTZSkir27poZeGbsiGXBIs8Uptq5si8F8w=;
 b=Qwzkv+k0oZmCs8akcplN/Lbb+pTIo11abY9a6viSk1leGS4JMFmPm13l
 8HikUCF1IQd+FtK0QfeOEk8zLUubgj8HOUYb4JX6G9Au0fsa5iwaL5JrY
 G+3AnPQhF2OtoZETW7vb3zA0PFC8MBAEvXdLXj2puDXsW1Rhf7REf8XQQ
 2uth/23lrwM1In39v9sNTzhexi2cUgUDNXDoUxqhfYtATQuMztPODW31V
 f4SjK4f+HmShIFL3s/3jkqQeBfYOqHBA9bV6kDgY3fVborr8mKRuE0e57
 gHabhTh3VlSLaeu+mQ3H2hJXPnVI7gbSKkZI7U6Lo/HbCH8NcKxaLBvlg A==;
IronPort-SDR: /GeLjTiP0+S4p7tcJK1b26auoB5uQKKFlCqU2F4n+xaFfTmgyvFYswDuKDq2sAiLNIkCe+agcZ
 bwL9QuA8s+8O7si4eoFHmwRuzSuWieQzWiDQqLLz2n3T1vyIlr8nxrhDVc3xY0FsRoxVFLvU6i
 BA4NrF6JKM39IEhk0LYXzOO15l3zCHulEIj8waj0vNWP13m2J72TMZd6hujgbZzNJXr+a/W5rX
 +B5Scy1UAcRaq9w6HxxDmTLMOqdX+d0q6RyEOc9R8YAf1oqCQiS0sXozPgStldFPQS7HvyDsY1
 1xo=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="92767508"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 04:30:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 04:30:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 04:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODovr30h2uu0sNLPwav5BjWsJP4K+SSso3SjCx4v9ZRp6kuU8A9zEkTvB6/lxPGe//z/pHGqS2wtMwOQ8TOXusffQhqnJ1KC6fW01XNxugMaX3G/qlXeEW2DUQxWmOOfbIKbEFOoc6QoF8+XPNxPyjxNVzT15ejltuwjaVrYv/3vYdr1LSK93ILlj/BZYfgcTFq3+9CxfLGUEdwT/oX5fyqYXi2RkElLLeC6/XTloXxGx018tXpKzxkf8YQlZtEGdwr61j7f40kFAi5+mpDublXMCNSvsRFWIrgISDT3lu3M+7g3z2VLukSSGc9NV8vLAE+fqQ3MuNyAoCXA/PefPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPIqFUcy8fTZSkir27poZeGbsiGXBIs8Uptq5si8F8w=;
 b=ZR8aIQfHRXeeZyfvguKlS8xQVGgOlDX8BXMcUIOtE5piin7rQMKILIR++82VSbT25o+u9nplLke4iJ+tYhI6s6E/IfyRpIhkmAQdh7Nv+Ix6q6SnKJ5fCtaGaDJlgX4FQpWCN5RLsXyPshwJhgcvVkyyD2z515jwFdrkkT9DF3rMPGOJXzDoq0/5s+KPz6gRxD5LMxW9I/vJcT+XYfiApLpzVRhVMAeJvnGg8HCMT6BxKe0LStJy8cq7cPigd+YI9WynnCx1JuZkcaIk7VOHnVaR8w/MiSaMp9mh5g7PTwtYOk+b8EGHhGBtFj89bjqb+0F1JSI7lxMQqCJpOZvs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPIqFUcy8fTZSkir27poZeGbsiGXBIs8Uptq5si8F8w=;
 b=T1FaZM3b+WXghaNJMSp+yk432Kb6/B0y+EVrJmg98G31HIuswO+HGfmQgF5rHGuq2qG1Gfgp+pDXUOMf/h5tSp/kJW3yVHwlxt51A5XJp7H6lpOkeS3Ox+x7Sq9aO9b5O7kRTL3wbLlh/IKuvT6rKaX0S1eJuVnf6XGbHlNONnk=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1849.namprd11.prod.outlook.com (2603:10b6:3:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 11:30:35 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:30:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Thread-Topic: [PATCH v13 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Thread-Index: AQHWllPyG1aFgNJlm02+rIjiIwVdlQ==
Date: Tue, 29 Sep 2020 11:30:35 +0000
Message-ID: <9eabfa53-40a7-3e29-b59f-bf762b2d0af4@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-2-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-2-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: c5ec4908-2297-4a81-2d79-08d8646b1564
x-ms-traffictypediagnostic: DM5PR11MB1849:
x-microsoft-antispam-prvs: <DM5PR11MB18492CC1B808FFAD9D7DB68DF0320@DM5PR11MB1849.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pzjf5z86ZdCnvabBguxfPYJzATAinTb8qYcK7ALqfKVunPeRYAVsu+k8MWiJO9mZp7hHxXhnpaRXTpSH+cHgnL4QZ1JFC5U1ikw+Q9ztPzgkXDaUG6IFwH3ghPjHs2IQ/cUVfeNVjAVPAnwV5wveBM+mTHZRYxbkBr3oDZGgTQ/07xMUuJKz2n3lwIPjzkzFqqxPvNknP0fZlY/Q2aLY0Tot0V0XnGdFj+Hf1WEE0zjYTweaOosnQKNCZNXZVjJtmE/XYWYAPAAK1DbFX7RxgUJNLD9i+AGJGy1XX58q7Rdg8lQbvOn14DVLB+vfcKKNbGW7ftKlT/wgZYjkhYtFggKxFjL9R7+7TVTcVC4E3i84nOMyC7SIGfU87D20AQeRxT+EV/7hGOU0N+JaKE2nGfozebUfhv3SQPbQ1WE3f98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(53546011)(186003)(6506007)(83380400001)(2906002)(4326008)(31686004)(6486002)(31696002)(64756008)(66556008)(66476007)(86362001)(66446008)(54906003)(71200400001)(5660300002)(26005)(498600001)(91956017)(36756003)(8936002)(2616005)(110136005)(76116006)(8676002)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: BetH8l0AsHvla+g2PUpigxBU4MTiunmEnwRWIZsP9yXrcqU1b9pVPBRj+F6nsqMS9jDRRZNbfli4jXMEwPXaOJX7OXdEUjh4TBYMBEKmxhwyQXjVo5+O5N2Rb8WvBMy7FW/IxEMgl8fZB2y2c/RyhsPnk9pArEDM1ccrkrXKxZ2Mr5+hulrzf/8cXTdUkgPDasSDG1xG6Ceq+FFMZakln1n82G95jrWCQUsr9ooNRb5eWyALjR1HJ2yF+cWCs2XQ+8uB3tj1yIhrmOxHDytBCo77+fwSUJlOnXx51nTsRTWlJcoL2Odoz4XeQlZdBqKnjj5TaS7ZzYmqhs3QXqf7iOXYiveFzYqXKp8WhNgpJogZiXk+q21jBBUwHDbNdOSCQAnGjFJ8pZzkz4PMN/yd+hKb5Ww8vF97Uq5n+zCptEg1Zfup7/hY0UG4+lP3BftHj4UFi9wUfCCh2Z/TAsgGTJ7T0d0aTSxvME0YPQTdr79r3sKy/FJl2HWNPmAo7AY2OdUszeznEHMwnSowjL+MM+fwy/rCi3p2313DgqU/8a+ZvNT6V5mDu84BwziOAFsaIuMfI/Sb77Io447rlTcyoD+2QgGXnNyzDcKDmENwPOzevY/0OFXXKgGEq3ceUzbc33XhUIjz5f9zGGLrrHZSTw==
x-ms-exchange-transport-forked: True
Content-ID: <60C214559661754D9FE0ACE43D2DBE7F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ec4908-2297-4a81-2d79-08d8646b1564
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 11:30:35.4910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2rG7GjiEhtqkVzLrQUJtTRGbypXN6wClNgn8lt23OjguJQ5xjpGmMeDr5gMyIV/SG50ReKvyidA21bxAfLwrZe/cQPDxYvFcOoBSzqjl9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_073039_619359_FD4962BC 
X-CRM114-Status: GOOD (  20.60  )
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
> ENOTSUPP is not a SUSV4 error code. Using EOPNOTSUPP is preferred
> in its stead.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65eff4ce6ab1..623384ef9a5d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2297,7 +2297,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
>   *@nor:        pointer to a 'struct spi_nor'
>   *@op:         pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_op(struct spi_nor *nor,
>                                    struct spi_mem_op *op)
> @@ -2311,12 +2311,12 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>         op->addr.nbytes = 4;
>         if (!spi_mem_supports_op(nor->spimem, op)) {
>                 if (nor->mtd.size > SZ_16M)
> -                       return -ENOTSUPP;
> +                       return -EOPNOTSUPP;
> 
>                 /* If flash size <= 16MB, 3 address bytes are sufficient */
>                 op->addr.nbytes = 3;
>                 if (!spi_mem_supports_op(nor->spimem, op))
> -                       return -ENOTSUPP;
> +                       return -EOPNOTSUPP;
>         }
> 
>         return 0;
> @@ -2328,7 +2328,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>   *@nor:         pointer to a 'struct spi_nor'
>   *@read:        pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>                                        const struct spi_nor_read_command *read)
> @@ -2354,7 +2354,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>   *@nor:         pointer to a 'struct spi_nor'
>   *@pp:          pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_pp(struct spi_nor *nor,
>                                    const struct spi_nor_pp_command *pp)
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
