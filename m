Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7EBC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AF32206C2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RX513meO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="efHM4eeY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AF32206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taam6HrXbIXW2xRVSg0j2uEsrCD/nJNXB1XKsrLAy+w=; b=RX513meOmJETRq
	MXBBhCWcLmNLsaBcITkChB5cwRYIwKk8Hn4WkxiAGmWq2XOe+GqCOfqIGqlK5mCbVku0h7+9LD/St
	NmDkhaPqGn2ia62ruLgJYd7B7CwQl0oYg+KS3Fm6LwdPcHRcknr9mrH36yyf7rk0RvqTpG7Uh1MTZ
	sEObiyQHn+V2KnjPovOV2alayvdjShAh18t/zndMRhoIm6qCODLMfUx3UPGrvPAN48gR5FPRSbys/
	0zmnll3ueSSowBd2bJ96b0WW8pHJGr+95zTRjhJwpxEGd2biK8ZHrFuTFzNMFx84LlB+TomQSQ50C
	53eIrAuHWAtZPziywEmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2dY-0003Zb-G0; Fri, 08 Feb 2019 09:39:56 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2dV-0003ZA-3h
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:39:54 +0000
X-IronPort-AV: E=Sophos;i="5.56,564,1539673200"; d="scan'208";a="27425787"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 Feb 2019 02:39:49 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Fri, 8 Feb 2019 02:39:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gNps2t21QiDApjKwcV9lIXNptVJrmC/HJAuRm1RUSM=;
 b=efHM4eeY7eQxlLHSBuD9/fAqqgW3lKbBOrxnTAjVlUJROBif2CQ6vNqeMYyXAl9m2a2ErnaGvYgfLg5NFH1n8Xvny1QAxRIX713/+hAddfmrGHBCwp7uTN+mxcTsmwSzHv+nvL7LdNnNVd+3kX+CGjWJqdNYaTigJbR9uq3zLNA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1971.namprd11.prod.outlook.com (10.175.97.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Fri, 8 Feb 2019 09:39:47 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 09:39:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <roger.pueyo@guifi.net>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for en25qh64
Thread-Topic: [PATCH v1] mtd: spi-nor: Add support for en25qh64
Thread-Index: AQHUvxltX+y4NEO5EE6CmgW/A8eqfqXVpjuA
Date: Fri, 8 Feb 2019 09:39:47 +0000
Message-ID: <251741de-96e7-ec1a-0fb1-a2e6a8c40302@microchip.com>
References: <fe18a70e-ef22-a91a-7379-55fadb7c0b5c@microchip.com>
 <20190207190935.5489-1-roger.pueyo@guifi.net>
In-Reply-To: <20190207190935.5489-1-roger.pueyo@guifi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0901CA0092.eurprd09.prod.outlook.com
 (2603:10a6:800:7e::18) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1971;
 6:k/Jav4EF6koiMiaS0PR1xPWp91GyY5XLQyagO/qwcSocwUYDuFl1v6xHoTxyNHr1oNpATtr51XKyYpkhaWaEzAfPHTx3qIf/ockTC3d29/SIFP9wkaeQmNQu0fgUv6BpuZE5cLzcsLSfcey0DYZ2vOOriZBEWUJj2OpgCAX6uS4rY8GW1FQnwwELJUmHBFcgR4yTO3tqphpqkAFmvMoF77P5CirxGjYSJJ63jUXsYyKZiU3mob3dWU2xdfWpjU1tvNkMgmmb0j9Tl9htQSspXmt74m4V74qt1TMGcK2RoR3WzQLQk5BHZSaUh3aTIQrtVIhu26RJS7uZMu2yfZkP4qlz5zuDFhkrDEcYnX+c3jQEdfjMedAnp82bre+ktahcjUigEAwYb7rYM5Gxq2fRkr/NX0tf/2+DuQ/5xr2WSiu158CZLNBSt70pVhEY7Dj15ht1QE/93tLYStynWCBySA==;
 5:AQ+Kb0CJ1H+dux6yfE9hekbnIKKdNbLOmDTajNpszNSvJ5p6Sk7COVvj6oeRRAIAHYQB4oSglls6H9afwqKYi2h91yxaMTAVQXzrUK/o7i4LC4aVOo2+g5iQF+f7+dyVDHYkk8tiPyxYYsbdMskuNSnDpcEUENdX/FVrG5XW0gQcv/H3EhAbrbK4t+qiu66+W2J81yzBfxpXKNAa4zFSOA==;
 7:pSnzJ5mAAp1df6r7e7YNoLzqo/yrzVPmRLcONBPXAuGpH/RLffVxV+yMMvy4wp3GTV3nMnKdg8dUpL3CtrULBRFrkE9lshRdccRRwsJcKaIONaPmvNs9HQsN/rVLhnuqzGqYTsn8x8MIxcKpx8ebHQ==
x-ms-office365-filtering-correlation-id: 30d8b4b5-b3f9-4b84-4680-08d68da95d24
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1971; 
x-ms-traffictypediagnostic: BN6PR11MB1971:
x-microsoft-antispam-prvs: <BN6PR11MB19715AF72F7F94493507153BF0690@BN6PR11MB1971.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(136003)(346002)(376002)(54534003)(199004)(189003)(446003)(256004)(25786009)(4326008)(3846002)(6116002)(99286004)(6246003)(11346002)(6486002)(53936002)(36756003)(486006)(229853002)(316002)(110136005)(2616005)(31696002)(6436002)(86362001)(6512007)(7736002)(26005)(66574012)(71190400001)(81166006)(106356001)(14454004)(476003)(2906002)(72206003)(71200400001)(305945005)(68736007)(6506007)(386003)(97736004)(81156014)(66066001)(478600001)(76176011)(2501003)(186003)(52116002)(31686004)(8936002)(102836004)(8676002)(105586002)(53546011)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1971;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oeliXL2rUZOo0UWk8M6AtIryT5u5AN5p5EL+1VCtLdTaXPzT3I2UwEKQFAhwM0iN5No/wvjV6S5qPnYkVNKskDxKLeqrauVBhBG0a+L+Wb8zsxE6McVkehErCOmRcnKliPmitymL74A+bjjfsi35Ww0tP+EB80OJAw8lakR9yPaZeqGNaXmQSa/aVKnvXOLIQaNrtpB+3+ZwOmJnxICecCHpDV7d/dgWMOtiVK2IQPSL3WUVyTAB0JycI/NxuaMzlknxmY03L0wgXgf7o/3ceSIoW+NgjqTxyLTqiYK5xlgqgOHWwj+pjhJnOSk5oc9IuRgDMS/EbbAE8ZQ/wGw+7FuMqPTM2f1RsLyDqmZdlVN5C0s+XFdRNCEu1+nrKawJzIthL4s8ipl/PChdnyziZPPuSdXEQqTVpjF+qx7Rjwk=
Content-ID: <13A3D06D18F0844EA9AA4D36C14AA61D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d8b4b5-b3f9-4b84-4680-08d68da95d24
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 09:39:46.4496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1971
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_013953_264841_E1E83143 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 02/07/2019 09:09 PM, Roger Pueyo Centelles wrote:
> The Eon EN25QH64 is a 64 Mbit SPI NOR flash memory chip found
> on recent wireless routers. Its 32, 128 and 256 Mbit siblings
> are already supported.
> 
> Tested on a COMFAST CF-E120A v3 router board.
> 
> Signed-off-by: Roger Pueyo Centelles <roger.pueyo@guifi.net>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---

next time please add a change log here, to spare us of reading the email thread
again.

Thanks, Roger!
ta

>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 6e13bbd1aaa5..33b2d0158a96 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1741,6 +1741,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
>  	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
>  	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
> +	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128,
> +			SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
>  	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
>  	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
