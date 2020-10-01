Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24672C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:22:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B628B21481
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipRGfX0c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="i45veT0M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XW6qcKCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B628B21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7gzYgYJNw8HJSkyO2ZguxuZZcYb4iBsWiIX7r5IZbrE=; b=ipRGfX0cLQlT/sJ5IIkRcJl2Y
	q4tmT4GtiOpFMKOihMlnHZ+nYNAYCXyOkfu3WEXtpofG+QTtl0tYYRN2t5vRO+FWBrcSmMCmuqG/f
	bp7La13HHasW8kraQmenlIX0zeQD+hqNRAGzKWSPNw7FS9x6LHexznAnyHmaB5SLJDcHsk1Ey1KVD
	ImdtxTA7vCiGeoDmPZEHgfunNQWo7OgsuEyTWhEvNGdR+QXQoj+1t7YMwH2NWHE+dYIP1JwMCAR9R
	HpqRVwEFWeft/xz29saiC3CgyqKJD2sfdU9sIVK/Rpa111jT/B5BpX1HxLcwJswJEZAYFTW04tkeo
	A5MZXyfWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNsua-0006Uv-Q7; Thu, 01 Oct 2020 07:21:56 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNsuX-0006U2-SY
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601536913; x=1633072913;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zHN7oQE6+CqRvfQc5+UfDHhivcDLyVx8dHDj4J4UyHE=;
 b=i45veT0Mt7+bCcBImtUpBTDmd9Mk6tbbYBruV/XdB6mjqBlikXdHNizS
 y6vg9WElT0HMZOpdsLSaXszoz41wUjMXs8CLm+/7d0wyonkWpmRcNLj9z
 eFuwx+8gK7PhE64B0jZAjCV7InwIeEAAD86zNfy13bb1JDU1Vd0lg0TjG
 Nmpz5TDkxiXhl8j/CTA3rzcjsgH++vd0ZdIcMCPB6juALUqK4U92vtl2r
 U6UrmISXbN1FyZewf/4HQKNBY3SlA/uW4EtVq/vP8tMWSVkhFLIQ3+F+8
 SUDy1uu0EpeIctbgHjNKPbFoWJu+GX/e9/Vsw70eMJ7RFL3OVdKiaGp07 A==;
IronPort-SDR: tRChLQeKZj3sWzVsUJqO4+pGo0x5yAGaf/bw0vfym2tXymSTbwLXhyYcf1Gl2Z+5+SHAFuOYlj
 hCuDb3bbsMtUwYenNqtsjVjuc52DUO3c5DyJCB80nVrsQgZOyFvVAo7I4kWQWV3qTqv55MDVkd
 efQi88xjLYIiibIu2mx5ZFGxJHZ58/pbeCYmDW8wwKkL8zWd3x2MxPBXiLACIJI/1E0prT4QbT
 9WdOVJ/+YThmMtuGTw8hHGnvg4W29euaT1Od4QePZTS66BRJftHu7v7ReuygH2rqLb4QWJ90Am
 w38=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="93850583"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 00:21:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 00:21:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 00:21:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACF6SzVSGgpQ+55q7Bxqtab+U92aaRFIb1B7zlhFCxIVixHiccwILJ2F/0eKl+3EG8xdPvAM2wMvYvNXxDWUIejQ4zRif1EhDZDR3CjozU3QJbf7yDLiKfH8uTRDcWZXBbhc5bu3nVOlCqFHsTaNkXSVbpmwJbQLStcUKkF0CRaUoM6nnohYbN9clDOtdOZdr78zhLtlTjJegml5CWumE2jsJvHcHY8tDr8/6I4AF1yY4gGjGR+EdjAJHSpb6jqRXVUmJ5GpbMdgiw0SlElwT4Ls3LazgW0XjBymrSU3gcHz8BkAyQl8BUAhc4WW7o+jjA2sxxcYcOqt4cW0P2lWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHN7oQE6+CqRvfQc5+UfDHhivcDLyVx8dHDj4J4UyHE=;
 b=ODdapZYkNWlr24PVnNLBMT0okMvMWT76QBaStB+Hiq2CrLFyqGt9hF24m/if+hbxbUcVEn+CEZGSX/VOG7w0l1spcWX+MpVDbM9St2uNnaixJRlOOw5T+qqx3seoNxpZPj2joYiUG9BXljWmiGst5m2JrCZkcydEpD5uUgz6wAa3MmsS6czUukfXD3RGUvsV9lxtSpkc5XwwOnvGPxMthgPY1pJj5la6SEQMZHQ7xMHhldYKkyMGwYnP/opb1pfWXXvqZEr5PUlicfLXPtpG3rsZrmZPk/4KaXMV/CL1JdqGicTOHeHiGyFmFCXRedh6/pNckZhC5dC8MfBD42hiDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHN7oQE6+CqRvfQc5+UfDHhivcDLyVx8dHDj4J4UyHE=;
 b=XW6qcKCi1vm4+BtFVHVO3JuKTMONV27CiIOM4f1A6q0yKuHXU9cPZZ9AvHWB8lpjxj4zA1RTfULbRThdrd2fNEPVPPOx45+gQC8HWx2tdwja+MDU3EbMSUBDILcMA/dUCpWs2lV0BcB5zufyXvEqTfOuqT4nblKwCEPnW5mkqSI=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4442.namprd11.prod.outlook.com (2603:10b6:5:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Thu, 1 Oct
 2020 07:21:48 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:21:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 02/15] mtd: spi-nor: add
 spi_nor_controller_ops_{read_reg,write_reg,erase}()
Thread-Topic: [PATCH v14 02/15] mtd: spi-nor: add
 spi_nor_controller_ops_{read_reg,write_reg,erase}()
Thread-Index: AQHWl8OFLwMazeNsuUO8siQdU3S5/Q==
Date: Thu, 1 Oct 2020 07:21:48 +0000
Message-ID: <3289f3b0-6690-3e0e-5250-ba459d884b81@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-3-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-3-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aec8c53-ccee-4d33-13bc-08d865daa90f
x-ms-traffictypediagnostic: DM6PR11MB4442:
x-microsoft-antispam-prvs: <DM6PR11MB44423DBB800C645C065CBB18F0300@DM6PR11MB4442.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:255;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WnKH8tRfviNNXBkPV4Z8xPzYBNtTecZ6stgrz4mVcB8Jun5KtiGMLDQcD0NlaKgw+W3FjtnSZOEMWsGe7Wf6pbcsT3ghgxQrfNJBMajmaPu8gd6bV5AskpuRNCM1nWjx7TU1YHb27to+TKw70Qdr6PB/2yQ4aQZPXtYYy8sKYyfCZL+lZAdyJTV+kzFNoAjKtaNTJV55XHNFodN777M6sLhPWrwUrYOREmKboD2Jna0iZVAxQFngdsjyOorH9MQt3vBVFIFbUg2/m+KmzZbnz4rmqm3Pufm9BOfrhfrVOiylxIUlwV1SrDbpx7Wtpnc37mOoNDq7DoEAGBlINEigJQqv4kRKYD3mWWM9t445iNQxS7fVKLi7TLXkYquRCOzfzGN9Lr0+fBUzmrBtDExDrKJ+GTxhaMLwe7LV+gIbHs4KkYpjlaVbKatwKJs4CUf/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(316002)(110136005)(6486002)(6512007)(5660300002)(4326008)(54906003)(66946007)(31696002)(64756008)(66476007)(36756003)(53546011)(2906002)(26005)(186003)(6506007)(66446008)(66556008)(83380400001)(71200400001)(8676002)(86362001)(2616005)(91956017)(76116006)(31686004)(478600001)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: X075VCRSPvTgwISncBSJ9D9ecvEO7SHsTPp6X612wnOMwlgHNeR2je0sa2YQoF2hjwmSL9RX84uSL3niyS6N6zR1VuOG31iVIG5ybt4utzGsmIniEONlQHN+w9xBbz/5kOTNU63VBI1TZ2L3h8NS7wXIagpRx2GGePXWstY6KMSUoJCio9IXIwbY2M5JlnV5wtO+PrfGuh6ueAVl8XQ3FLMZgIRbIogK0CVdVD5EP7N7NM8+8WKYUaxMmYG0Sh7MbNwTLr1EpPLiMq2nMy8ilIbSz0YLHTukbH1Rfmvpe5WlCcm5/VpMjTO2Obl0tBEspfHbZeRViQwUYgcUremo6E5+zkgHt3gFsWQQ054+4ZDozdNofdWTtJ3OzR3sZVZNG1U472MhjOmZHEEfgBGSKoErMpfRS8p2NAoVd9Va7E2wvxFYSFshNkAhHQgAzhEbv0MbfuNIXETXTpLbrIZp3PqpFadG1B2ZuMEX1duGee+hkYclbuTGRXUAz+nkOZk6TD0iMyB1AiNS4Xj8RnK7f8xItdPyY/qmp/sDceJzE5TLlWWNUOBseEcSw5VFihxFNJmmUM1kLwUHrEztZMJpBBPLvLd4wRC0SwyIwwBTSQ2FgF/ahQmppEjG8aGG5gqQufsdg8cQpEpC2Rfpb+1JuA==
x-ms-exchange-transport-forked: True
Content-ID: <0C55CB5797A09041B072C31849E4FFA4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aec8c53-ccee-4d33-13bc-08d865daa90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:21:48.5848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KkAO4rQT4WdZsU6G0GTeFPxbSDpevqX3Lw40qdB7yR6n3+Wyo0b9oMjyCmyVs5kM8V6dmtYdgoJnlB1N7djaDgbdEcfztnZjPBt8CXC4mbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_032154_174410_80A5B5E0 
X-CRM114-Status: GOOD (  20.58  )
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

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> They are thin wrappers around
> nor->controller_ops->{read_reg,write_reg,erase}(). In a future commit
> DTR support will be added. These ops can not be supported by the
> controller_ops hooks and these helpers will make it easier to reject
> those calls.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 87 +++++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4d0f8d165544..7a3bf460a2fa 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -82,6 +82,23 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
>         return spi_mem_exec_op(nor->spimem, op);
>  }
> 
> +static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
> +                                          u8 *buf, size_t len)
> +{
> +       return nor->controller_ops->read_reg(nor, opcode, buf, len);
> +}
> +
> +static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +                                           const u8 *buf, size_t len)
> +{
> +       return nor->controller_ops->write_reg(nor, opcode, buf, len);
> +}
> +
> +static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
> +{
> +       return nor->controller_ops->erase(nor, offs);
> +}
> +
>  /**
>   * spi_nor_spimem_read_data() - read data from flash's memory region via
>   *                              spi-mem
> @@ -229,8 +246,8 @@ int spi_nor_write_enable(struct spi_nor *nor)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREN,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -258,8 +275,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRDI,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -289,8 +306,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
> -                                                   sr, 1);
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR, sr,
> +                                                     1);
>         }
> 
>         if (ret)
> @@ -320,8 +337,8 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
> -                                                   fsr, 1);
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDFSR, fsr,
> +                                                     1);
>         }
> 
>         if (ret)
> @@ -352,7 +369,8 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDCR, cr, 1);
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDCR, cr,
> +                                                     1);
>         }
> 
>         if (ret)
> @@ -385,10 +403,10 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor,
> -                                                    enable ? SPINOR_OP_EN4B :
> -                                                             SPINOR_OP_EX4B,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor,
> +                                                      enable ? SPINOR_OP_EN4B :
> +                                                               SPINOR_OP_EX4B,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -421,8 +439,8 @@ static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
> -                                                    nor->bouncebuf, 1);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_BRWR,
> +                                                      nor->bouncebuf, 1);
>         }
> 
>         if (ret)
> @@ -453,8 +471,8 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREAR,
> -                                                    nor->bouncebuf, 1);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREAR,
> +                                                      nor->bouncebuf, 1);
>         }
> 
>         if (ret)
> @@ -484,8 +502,8 @@ int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_XRDSR,
> -                                                   sr, 1);
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
> +                                                     1);
>         }
> 
>         if (ret)
> @@ -529,8 +547,8 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLSR,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -593,8 +611,8 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLFSR,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -737,8 +755,8 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
> -                                                    sr, len);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR, sr,
> +                                                      len);
>         }
> 
>         if (ret) {
> @@ -939,8 +957,8 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2,
> -                                                    sr2, 1);
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR2,
> +                                                      sr2, 1);
>         }
> 
>         if (ret) {
> @@ -973,8 +991,8 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2,
> -                                                   sr2, 1);
> +               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR2, sr2,
> +                                                     1);
>         }
> 
>         if (ret)
> @@ -1004,8 +1022,9 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CHIP_ERASE,
> -                                                    NULL, 0);
> +               ret = spi_nor_controller_ops_write_reg(nor,
> +                                                      SPINOR_OP_CHIP_ERASE,
> +                                                      NULL, 0);
>         }
> 
>         if (ret)
> @@ -1146,7 +1165,7 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> 
>                 return spi_mem_exec_op(nor->spimem, &op);
>         } else if (nor->controller_ops->erase) {
> -               return nor->controller_ops->erase(nor, addr);
> +               return spi_nor_controller_ops_erase(nor, addr);
>         }
> 
>         /*
> @@ -1158,8 +1177,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>                 addr >>= 8;
>         }
> 
> -       return nor->controller_ops->write_reg(nor, nor->erase_opcode,
> -                                             nor->bouncebuf, nor->addr_width);
> +       return spi_nor_controller_ops_write_reg(nor, nor->erase_opcode,
> +                                               nor->bouncebuf, nor->addr_width);
>  }
> 
>  /**
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
