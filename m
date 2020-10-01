Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EF1C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001B4208B8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLjR/dFt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="d9vcDXr6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="GROccR/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001B4208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yKKrYzs+pNeQ5kfLHUsj39KpsCQFelQQpyq01k3X1pQ=; b=kLjR/dFt4PsXs15wW8S7gXHiv
	4BJ1nto/TOLfX7CST85M0aS35IH5tjOUDyKcXKbWqC072Lvm2Ilgf3ozo9QyjFv/xpV2qQW+/Amu8
	pe38ueYdOaDto4FccVv3U7485lGZYGX/iFuU/Ym5t7ulOMSWe591GFQUlzGMmWYSGsI1nmHIoV9wC
	MFIPgFlhmOWdn76PbAe1j82dH0nBLkxTVKSZ5Uk/KDjIPC2C6NfskC2aqNVfhvf5QnRdxlnt6LNfI
	VN2QkuEd0qHDW18KmSagT3CPJCrGyoLHfAwIqCO/HG5LZCyBEiZWS02n99mrkwamS23oouOTnmuNC
	JtrESQu9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtpr-0001L3-Q9; Thu, 01 Oct 2020 08:21:07 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtpo-0001KH-0E
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601540463; x=1633076463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NkP4xDEKRLPfbxw9D378wtTzrlfQkW4JRIBOiB/+OqY=;
 b=d9vcDXr6ToIxzMTuCCDbS4aMVNWhL7bV1yDNKTzySDbI92vA4R+EJr7B
 ORBEIPNvIncZBQ60U2+K1HIDsellZj2pgDr5pRj2cHhLyYhMDTGA++V2b
 /sT34DtApgnQKkLFYYg9VXvare0vzcMWHLhguZMrGps7Errb5oUQ0i/2R
 qCeqcmYwXw6ih5oWnaXTg4KCPPDnUGSbM1HSBAmkrRErYGRzwKahGcp71
 0PGexS6RBvR8u9cKJZ0oNRcpGDP+2CX7vubax0foNOfgd24VrkV+2jmGt
 gJoVJ5Q+4vfYoa/Se1YmER4c5JPzi4TKDIMK5MrbkhaV8LjieC/d7vrh2 Q==;
IronPort-SDR: yr1SZA/PTKFNrN6HI0yj+G9JIy8dBArT8p9frLzq4M/MV4mR4n6E22JTDbc/xt7GIdEj90cLiA
 A0PVFZFCVKvbyntgaTTq7gb5dgb6JdQDU1kxy0hBXlqz3N+NPGw6kdB7480t1Fr1DdoRJRsnUL
 tuKQlypiaIyH6DRQUzzBxBxmvp7FQsaF7V1PASQYzhY+F7171veUBshUcDP+h5aBKcoXikNXF5
 xDhIKkTxGea02dBgrfuvKhlLOkhNe9XjQPwbc2VTUVB/v+ayKM0Ak0P3euRgHQu+RnpUnJm0Jx
 PcM=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91054010"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:21:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:20:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EntYXOu0WGyI8gCa3MyhANXBQV5lKc/TqCuoRxQ8x4zd9RrGIHfUlT7/LUB8oKUjAgwsH/+0aeL7TFWaORbN6HZBSDD1/n/WnvhD/il/PH5GnSJkjAoNG8/tSZ/C2OoF0EyuuXdy4HKVnNbdZxO5RlGpkOrY9O3fVhZ7huxn//XKAdSq5IMuBtmFnJ92MicOsBV4GXIXjCE7eJ1GtLHeZ0akPc+0O+FZ6SHcqlmKq7H0Zit31GPSUGboANtHNETbvP2fl/SO49OjcmrB8OZgnJLkdWUQ/rrXz7dfCOa3ENi31PBHvc2CZ/DX7WSOGGxtBc4WbKJWl7p76OW+PW+f0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkP4xDEKRLPfbxw9D378wtTzrlfQkW4JRIBOiB/+OqY=;
 b=j2SGvE3oqNZEK/NIllT8DkiUr2V+evXpbbs0dXEDcjL1cz0/TkZupFJWybFAh5R48QPH6IGOqoyYblDRkGxsGZnVbDBKNsCaZnUOjrMiATxYtYNMyaZPsVIkeniidVXHukb71Xz0GaE4wBbTD3o9S9JzHsDM90/RDVFiwRhoggRQn1ABGIOsaP7eXQPCcTVFY4jbpCfcjRmy1xv2tYr32EKuo7AU4PZakK+oCfT/G7IgEcViVauVwsZeUiCpJholNmBYIsFOw9L5D9sW2wUotal3L3UnLbh8k8BEqFiPSRlM3yb7d+iUB/af/agWCvA+425uYdMuJguR4gEMURRaog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkP4xDEKRLPfbxw9D378wtTzrlfQkW4JRIBOiB/+OqY=;
 b=GROccR/DmjluZWe0A04xK6I/OBVv24fC5n8c8ee0tf6AAQEcVdPxBvq+DZmYvPguZ1r2lq+IesGKwvpHBAQwkzUTcD6sKnhuve90lxNpeOHgSoFDHB39KB02ku0zlvi+kcLoqOchSzYTuZMRtwuM9hz4TO+LdkBiL4ho1SF1cZk=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1947.namprd11.prod.outlook.com (2603:10b6:3:110::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 08:20:54 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:20:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 10/15] mtd: spi-nor: Parse SFDP SCCR Map
Thread-Topic: [PATCH v14 10/15] mtd: spi-nor: Parse SFDP SCCR Map
Thread-Index: AQHWl8vHo8V9MvvnOkm2cl68dypCWQ==
Date: Thu, 1 Oct 2020 08:20:54 +0000
Message-ID: <81fa2331-d808-fed6-232f-f8b67e7e9dac@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-11-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-11-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 3db79b75-8848-4bf2-876d-08d865e2eac7
x-ms-traffictypediagnostic: DM5PR11MB1947:
x-microsoft-antispam-prvs: <DM5PR11MB194717C0E620DABFC67CCCE1F0300@DM5PR11MB1947.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uMLvxSDUGiUvKkz75LiA/W/8JMAQqLvMLf+lxsBInX6QngnOeM8CTzIvb+i1iy86bzL3b34//JzpaW0i/S+FAsCa2fVwohyAdWap6i3onYPsBehGtNfeyc6SFEDbZkirg0KmDdfdwabo5S09Hbkz1ETxm08eUtqc+TB9tACRLNDpTojTLYmOrr93g2/5c32v7UdWJTle27u54x+KlbMeSigSRj18hFzzxeED1VLPxEKmyNNCACgQE/bfHLYAPHAFLh3bWi+gr14UNTGthkwXFD+kIx/qyldqwwMhOUMCmXhUXAjH0azRYumMHhDHoJLgEoeCynHQbCvuzu1FtjF6m0GBxWN0yy+zPymkEt2BwvHgEkIRYmJt0ZsT6DFH3j9E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(66946007)(478600001)(64756008)(66556008)(316002)(66476007)(71200400001)(91956017)(186003)(110136005)(2906002)(76116006)(86362001)(66446008)(36756003)(26005)(2616005)(6506007)(5660300002)(53546011)(31696002)(8936002)(31686004)(6512007)(6486002)(8676002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SLjFUTGp+k26gMvQvUfta4onl5PJPyrFeL6LwE2jcEQBJfas+oBryN2YNJMBCTKVHs5mTxsQpx5LuvjC7b68fh0XdZq3D3pWrwIsKKFDtaquDwAEixaFwtoqFAj+xYqUaE5l3MVWm9ezYI4eU0gJizjpYv/VME+ZVpkKoPl7Uw1fl6RdaUEMC4k+/DF6BDPIWsrgcSzsUpNRT3md91ULwtXQo0zSG/zkavK674GlP3lmLG7eOBxl8ChKd8vSbR1H7ySf4BLqtkFDi9yELZ+cJ3tbaimxxosw60PUhTqAFxRjv1WCbLT3qsO0UBKOLy6lcF3UR7aAijBYdYLLUyov+T5UUUCLUhekDxqCZjSRtx+VfqKfccCIU9Qs4ogqTBms4FbqKzoq/dJ2DBHnDAcfQS99G1G0nZMZAT2DhU5WvsAhr6038/E3sOTmk4IpuS2yos0OvJqL9IY6tnzBTGaG+fOCWiq+yPxnzW0Dj9rQ0vcek2yOvAQsTta1qgIvFXBz716yALXunC2NR1IwaoEAoGkrsuHCn1UG8pHeD8JKu1YPUlT3kXHKSbYRUsl6gvhEyE8HQebuRiGaJgzojQkyF6YK3FOfjAVs7v47r4SM9GtaU4Oa+0UGR9Bjjj4/mgBIySJc6PLjZv+cxt46Uwvj2Q==
x-ms-exchange-transport-forked: True
Content-ID: <B74599DA3275F4429888C0958A85589F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db79b75-8848-4bf2-876d-08d865e2eac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:20:54.7474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APjNHfvpDhQQTxexgZQxg8hL5tDVPZ/ASIINmJTfbsrVCWn/6s9kI1aIAbogfLOVq8sYuLSG5wXGq28j3e1hJhMYqZG2cABIyCUmRXoPcf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_042104_174018_6EC70028 
X-CRM114-Status: GOOD (  23.73  )
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
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Parse just the 22nd dword and look for the 'DTR Octal Mode Enable
> Volatile bit'.
> 
> SPI_NOR_IO_MODE_EN_VOLATILE should be set just for the flashes
> that don't define the optional SFDP SCCR Map. For the others,
> let the SFDP do its job and fill the SNOR_F_IO_MODE_EN_VOLATILE
> flag. We avoid this way polluting the flash flags when declaring
> one.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 52 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index ebc1188f7533..0b5b9ea44cfc 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -21,6 +21,10 @@
>  #define SFDP_SECTOR_MAP_ID     0xff81  /* Sector Map Table */
>  #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction Table */
>  #define SFDP_PROFILE1_ID       0xff05  /* xSPI Profile 1.0 table. */
> +#define SFDP_SCCR_MAP_ID       0xff87  /*
> +                                        * Status, Control and Configuration
> +                                        * Register Map.
> +                                        */
> 
>  #define SFDP_SIGNATURE         0x50444653U
> 
> @@ -1195,6 +1199,50 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
>         return ret;
>  }
> 
> +#define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE             BIT(31)
> +
> +/**
> + * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
> + *                        Map.
> + * @nor:               pointer to a 'struct spi_nor'
> + * @sccr_header:       pointer to the 'struct sfdp_parameter_header' describing
> + *                     the SCCR Map table length and version.
> + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_sccr(struct spi_nor *nor,
> +                             const struct sfdp_parameter_header *sccr_header,
> +                             struct spi_nor_flash_parameter *params)
> +{
> +       u32 *dwords, addr;
> +       size_t len;
> +       int ret;
> +       u8 io_mode_en_volatile;

would a bool work here?

> +
> +       len = sccr_header->length * sizeof(*dwords);
> +       dwords = kmalloc(len, GFP_KERNEL);
> +       if (!dwords)
> +               return -ENOMEM;
> +
> +       addr = SFDP_PARAM_HEADER_PTP(sccr_header);
> +       ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +       if (ret)
> +               goto out;
> +
> +       le32_to_cpu_array(dwords, sccr_header->length);
> +
> +       io_mode_en_volatile = FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE,
> +                                       dwords[22]);
> +
> +       if (io_mode_en_volatile)
> +               nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> +
> +out:
> +       kfree(dwords);
> +       return ret;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -1300,6 +1348,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>                         err = spi_nor_parse_profile1(nor, param_header, params);
>                         break;
> 
> +               case SFDP_SCCR_MAP_ID:
> +                       err = spi_nor_parse_sccr(nor, param_header, params);
> +                       break;
> +
>                 default:
>                         break;
>                 }
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
