Return-Path: <SRS0=dEjv=AT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB9BC433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:09:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA60020672
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jul 2020 16:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bue6T5ki";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dVnobz8s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JlzPg8uq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA60020672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2PQhWeG08anHbg4tobrob9DGGDozBrKmpqPXR2tUpc=; b=bue6T5kiTUerdaiPrb+o3wKEt
	TPGTJ8n2Bd2lldDzblhTefHcEDOTSHR55lYiuiLqQ6MRoW95K/0B7IQwp+zfzHiRhDPlVQL/Q1K2x
	cuK1tnlUsu5ee/NkU0tBwI59++hpTwruglotCcAhMJ8V0/9qkJNugwS4w68TbRaqNt3gMfoTth/uv
	OyovTAsJHNsc23K8ca11TiX97vnXqhfQTcVbPWPFAuGMCiskzMkXWmPUTId+eI9VwfNsUKaC+/5V+
	ohfT8NCdsVUNIMiUHYNFbnjk/iuVM6qIk6BwV+GAcs+B8W2uyqwvRoF1kYApqLSNzAOLoB+/zSN0n
	L3Ivd4oOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCcW-0006a6-Fs; Wed, 08 Jul 2020 16:08:28 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCcT-0006ZG-5v; Wed, 08 Jul 2020 16:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594224505; x=1625760505;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9g6qKzgfVawGBWosD/ySi8Ozh6beuBKKvZcECxXFuyg=;
 b=dVnobz8sbxZNToaVqYI2M233RI4gOKP3yFrfrBYtXst6KDfE65sRZD2N
 RV+4nVl+yV7g2uUiFGeZMVz+QA5I2fRJBJb84AoQa4O5bdBXkPRk5UwCS
 LY0+pZbDz5A2NUWWdGoQEwwKsCO5PBjWJMpS3Kw/TvL60a4HBwaaVFmsR
 URKH8+QSVF0xje48qZN2qDmTRtZmWtaiwyHdEtLFs6j6/jml3wI+Laalj
 xDVAK5Fx0kgR1PVOupycahXFSw7hD0mpWK9CEOyqM1KcNZe3NrX2CwtUj
 sPcpN+6S/8ETA2FveAaXoF2kZGvQ3XtsFJbbV+IFYvqVCMSUveE7RRZq1 A==;
IronPort-SDR: X3sSi9VX7AP7gFe7qo3ZcT6iabW6RxvjUIT0hSnV33FeJMVuQ22Ti6ziLFLG80ZrnNEiBV3UOo
 oLEyUFfStL/wHc9eNDLvJazLmQoScX2xPgOwzThOjt7qTt2t7uDqO9QiBdDZGLBxkuf1TsY770
 SJZ2vNs/7HqsEl0UR5YOAa6o1Haha8lkKhN9S8DHGSsBlm53HGC46QELpLR17AOh0lX3epxsg5
 354i7e1OEBWiy1hOFmfVRBuDOM+hgu32H/swOKNsL999mMcNBc9Yy5446vNtM5kyp3CCy6Zc8Q
 vAw=
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="79171303"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2020 09:08:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 8 Jul 2020 09:08:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 8 Jul 2020 09:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lue59fTS2hwS+ASQcIM52y3aIb1fLDc108csFJemXv3EbOvZEhHuIj5k6H+y3+sAuueCcHUvMae9bB8D+JImMr7kvqSeZL8eIjsIB56/JUo8rhEg8wC33tD2MDamPJ0VVFmzgJhJWoOvj6ssdOPl9Vn8DKG2WCyK6RF+EgYbBdoHHWz+EKOi+opx5j5joVIxp07/LCkzcU9VGQhj4xabra0U9Br9iH+FO2sHwtmgLtZCaPR//ND1GO0VNBFqsQIV6099cTssvoTcpMuBlMm9JwIEBjoicCEt2JcA2IJsDmJ8p2k+QLyZSUpw60joAmKj2gKMssl7yLeL6eMqCGJgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g6qKzgfVawGBWosD/ySi8Ozh6beuBKKvZcECxXFuyg=;
 b=FdVvO5L2tr0+KV2dUda1Edf+SUUBosKPyLxuxWGcsqbxf+Uav4/uuWPPM2gA1wC1L6cRV1RQ/WGQD2y0u6hJFYI/jJROnRdoaHSrQgy4FNGEg1zBAbRpFYHewPCN17V5RfJYDj9KvNNqNk786WH6WureAAZdXBlrOPXfB2WGoXtz46cKpxxcbtOq3QV5zssa2NNrJVFKA8VT9sSWnljdTvp+ef3eutg735EG90kcEytwUYD6yDPnybz0U0nbJnhpyOaIG/TcBEMYbtAZJh6OSCGNkZmF3340vEtbNJVpI1apDuqhB7xRDxbI32X9lk/02itpNDCQVTRaLXx41ylUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9g6qKzgfVawGBWosD/ySi8Ozh6beuBKKvZcECxXFuyg=;
 b=JlzPg8uqtY7uDqnpk/4N+QsV+4KGEo0n14e/kxjAjoaSUh6er6Yzvm7fiX0p+eCaakeFVMRoiXJLtZGhk+IFKQFYl6Zpqt0fJDCfaf1iCBiJdDYVhB6CTW/gtTfSSzjoUAQKcM+vv+P2FGbcFn/hiNruiWbenyktKLskgDWEljY=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3702.namprd11.prod.outlook.com (2603:10b6:a03:f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 8 Jul
 2020 16:08:22 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 16:08:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
 <matthias.bgg@gmail.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v10 12/17] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Topic: [PATCH v10 12/17] mtd: spi-nor: sfdp: detect Soft Reset sequence
 support from BFPT
Thread-Index: AQHWVUIAsFiQ+I4mt0WYZhmL22dMxA==
Date: Wed, 8 Jul 2020 16:08:21 +0000
Message-ID: <5f9a93d0-833c-8976-c6d3-2043e65b1b66@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-13-p.yadav@ti.com>
In-Reply-To: <20200623183030.26591-13-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ddbc1c-e351-49c7-339b-08d82359231f
x-ms-traffictypediagnostic: BYAPR11MB3702:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB370272994E23CFBC6EC97331F0670@BYAPR11MB3702.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BLrl9aZOiu56F9fD3dfFBZ51YAwsPTirJzz8lLSwPB9+hrSvUwx/IsEpmNg8irknyMtnKNEfpFREmz5ySj68GLp26KDM9ZDtwa6yYuju18tPMZG4i+Hwk7EojgCNyx0j8gPzuwt5cZfskCyeFCoqjIXgKKZPFxbKcvu87ACxIzlImmb5HwawfsD1rUqB6pbddcVYWoPyz1E3hJSdW0DB5uKolQQ83q0W/oVPRQsm6EqVuN9Z4mjdxbHq5yOrduh993uFTPWGjeXxsi9h36D/P3v695psIc5uNzBWZptDZXw2o9WvDOIn7vktv9p1WQ0oBap2bPWg0QzXWyHqcztDjM9MCZUehecbG2Tk7nQqcJNnyaryVrQD44N6uqRwScK6OBawDje48ec7DBPnd++tVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(346002)(366004)(396003)(7416002)(66446008)(66476007)(64756008)(110136005)(8676002)(53546011)(86362001)(26005)(71200400001)(316002)(6486002)(8936002)(2616005)(2906002)(54906003)(4326008)(6506007)(6512007)(5660300002)(186003)(31686004)(36756003)(66556008)(66946007)(31696002)(91956017)(76116006)(478600001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8pAh/+NyiayLJtrsK0Q0sZREdpixTeHkzi3lIASUfvtd/rImi2xUXgT8YKOKu3K4pAwkqiiiiBP6uf9YweIpwxSMk2RsfgIYNHrH55EGeCL9dV/9BjGoq1zAR+ECpxLHk/r7Gc5FXzgsMvY29RjZAgwTcFVxcotCbl9JxFFqcgxQG7SCibnTFoMJjjAKFuJkfrJdk+WNhrG9BxtT8bfjR+wdG/JKsKQGqtZ6CLUaTHxbgp1+r2YXfwcrtBiNNfBCYC+N2+LFoUWJ4BVoVNiBtpHT4d2RZqEWf1LyfwwiG97/UhZAaiLCAPmONIk76WpQfuOmXMCH07ctJhgl/dGzYZxc8fnJSqqT1a/LX+BacBMgOEG8xFMzV7HgVNQPrMZA6qqLyPN8cxH6F0ZjGWqxaeHkUUFhF88bOcUyO2+SvIgI8oG4YPC9c6ZroNnEPY1yGin0EcGeIy7PrRXFeQcAy9BZICDqKUpUSxYB8hJqHEk=
Content-ID: <93AAB675FF7A824BB3F01E52D5156678@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ddbc1c-e351-49c7-339b-08d82359231f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 16:08:22.0024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDKJVhF4coQ5mI4OOptitJf/NGXwBGKikTBsi4zKUcD4xsaPkjN8j3Uq3J9+JK6CoLLFXwDZhuNXuUtVdyxwwnn5vf2hmGEChSdI5VpUuPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_120825_999495_C05B1126 
X-CRM114-Status: GOOD (  19.30  )
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
> index 6338d32a0d77..79ce952c0539 100644
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
> index 7983ff431346..8e0741d8bfd3 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -616,6 +616,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>                 break;
>         }
> 
> +       /* Soft Reset support. */
> +       if (bfpt.dwords[BFPT_DWORD(16)] & BFPT_DWORD16_SOFT_RST)

this can be improved. There are multiple reset methods described and you're
addressing just one of them.

> +               nor->flags |= SNOR_F_SOFT_RESET;
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
> +
>  #define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
>  #define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
>  #define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */
> --
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
