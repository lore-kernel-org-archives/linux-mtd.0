Return-Path: <SRS0=mTWN=RN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F2FC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 10:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98789207E0
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Mar 2019 10:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f6Jmc7ca";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="adTt9eEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98789207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1EmtSxzmkhoKnjnVUjEgihebS+TuGjdP4Pj4P3VItY4=; b=f6Jmc7caxCQXto
	dS3LsHiMh0haAYlOiyYsrQ8Y6bCL6/m1LveJlBQ2GLzC8mKxxe32Cb8kZ53CfSp1vlkXzCZnEOr18
	/IFt1aFYHx/bVZeL+AWQ8nzea/so1hdjNFOr/cqmO7DblU3nlBsK9AtNisqUf9PW+ieuZasqX+2Z5
	rCdm1Y0HcMxVcJabwvkTtD6C4ssLLwheHOrY3uCYMG4YzbCe3zcrHoJs6DlGo/lEYJAXKo1/9WarB
	4YoGFMf42nAPjdenEcbrWgwjEZMEDKOukm2D8t+/j/qBLy3L4DPL51C+pf1netB28KJZHnu1M/yhg
	I+GXm/QyR3oT/n5ykYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2vLg-0001A4-2x; Sun, 10 Mar 2019 10:06:28 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2vLc-00019g-K9
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2019 10:06:26 +0000
X-IronPort-AV: E=Sophos;i="5.58,463,1544511600"; d="scan'208";a="29002305"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 10 Mar 2019 03:06:22 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 10 Mar 2019 03:06:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DFOHDcnJOGSB2OR1jp7FcQZRkn2JLuHqAaVhmRrfMY=;
 b=adTt9eEKZbphtcj3X2qg7WL/8/sbTzq2lC9dchiwuJf9BpV7dTxWLlbim+MetVRmZw3kZIv5OaZ02rKD01hqX/Tl28psFHw5gl/RbJzV6Q5QoHIYHLyLs8Ls2dhr+KNh1ZG0tplEEFtIne7U2NsBT9PC6CZPkx+bhBUimTUMPo0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2019.namprd11.prod.outlook.com (10.173.27.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.20; Sun, 10 Mar 2019 10:06:17 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1686.021; Sun, 10 Mar
 2019 10:06:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>,
 <bbrezillon@kernel.org>, <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: allow setting the BPNV (default
 locked) bit
Thread-Topic: [PATCH v2 3/3] mtd: spi-nor: allow setting the BPNV (default
 locked) bit
Thread-Index: AQHUuB8oUzB2rEqLhUSvblZMn7eTr6YE4YYA
Date: Sun, 10 Mar 2019 10:06:17 +0000
Message-ID: <41ca14de-3756-d1fa-4dd2-2a6fe9dc0c38@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-4-jonas@norrbonn.se>
In-Reply-To: <20190129220705.5143-4-jonas@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0061.eurprd09.prod.outlook.com
 (2603:10a6:802:28::29) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.69.190]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c661300d-af89-4fc2-aa9e-08d6a54008f7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2019; 
x-ms-traffictypediagnostic: BN6PR11MB2019:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIyMDE5OzIzOlVjNlhrWEY5WmlvZktaenVnNzN4TTdGY1Zw?=
 =?utf-8?B?OXpucllmbGxabXFBanpOK1YyOUIvVWhUc0FUVUFxOHM5a3F4R1lrTm9xbVlB?=
 =?utf-8?B?MVV4Y0dINWNGb0R4QWF0cHQ0OG0yMWZHcGRvR0tTM1ZTQjgvMDNBN0hTd1dF?=
 =?utf-8?B?aXMzVEJaNVRBMFRoNU9ncWNJSmp5L2tkQU1taVcyWkRidSs1R1hZaStKMXht?=
 =?utf-8?B?YnYzRUJWNTQ4T1VEbHNvQlBSbWYwNk5qS1lHWEp0cFlWNVk0d1FJMXNKUm9R?=
 =?utf-8?B?dDc1WE1XcFRaM3NTSTY2ZWhsNi95SHZ2WTR1Wm9MRXoraGhEdVl2aVM5RmNj?=
 =?utf-8?B?cFdmZUx3UU9LcGRnZzEyS0RSc291RUNETkQ1ZkR3NnhGUDN1RnMzRmVYNVV0?=
 =?utf-8?B?T1JBVnFzaDhiRUhLRFd2T2lRWWVMaFMrRWhCQlhNbU9lTFBOeVNWVEJTREZF?=
 =?utf-8?B?TlVvOVN4bmpPSHM2RFB3ekhlNGhSSyt5eVFkdWVicGlCdHIyZUxONCtTTWVy?=
 =?utf-8?B?K0RKMjlLQkJMWk1aUjFEbGZvTjFoZU5OWHlnT0NzR0lGNFNKdWY3WHRleGZl?=
 =?utf-8?B?Nk5ua3E0d1RFSi9YOFN2UHJsL25iQ3pXZ3FtU0NvR0Z0djRxblJGd001NzZG?=
 =?utf-8?B?cC9lekwvMXljY1kwWmt3cVc4QlpRYTRtNVVlcyt0Y2JGMEdHaTg5UlZCTUI4?=
 =?utf-8?B?NStCaUQ5Q0FmWWsxNm5Bd1hPblR0NmduNUt2SWFzck05cG9sSVlqZ1pKdmJN?=
 =?utf-8?B?bWJteGZBZGtJWHdjRmpscHRWK0h2emVkTWZhTWxmaHU1aHMrd2xHdXhOMkI2?=
 =?utf-8?B?d1JiSDIvSjRUbjlYZGgranFsck9FVlRncXFKR0dvemNTejkxUWQ2d2xMT00x?=
 =?utf-8?B?UEw4dkI1Sko4d1JNMThnQVJuai9xYUI0N3FpUytEZExUR2hEOEZxK0h2cUhB?=
 =?utf-8?B?RkFYdFRicTB0QWRNY0pFWk5FcFg0dEhQV2xrc1p6a1hvaUZVL2VPVXNOSkpn?=
 =?utf-8?B?MGIyM2ZNVE9XNFB2UmNKRWZ0bFU0WXMzWkNCais0Z2MrVEJ4Q2tkWGtFRmNR?=
 =?utf-8?B?VGNwSXRsYVh5SHhjOHBRaVZubzQ3TGQwYmtCMzFqUDRKeVJMQ1hFelNEUVQr?=
 =?utf-8?B?YVpMMDRWL0J5eGU5MTVNZndsemNkTllsbUFFdGpWMnp3Rmc0VmJUWHFDWXpq?=
 =?utf-8?B?ZHVSV0hyOXdhdC8xUm54QlorcWN4RlFxbUo0T2V0SmhjaHpXQmpyL1RxblVG?=
 =?utf-8?B?MkZDZWo3WlduUnZoVFRFNWhZcGpORkVoTFg1Z015V3pXL0pJR2hIOERYdllM?=
 =?utf-8?B?bkkzNElCdXRLL0M4VlF1Y2xOeXNjYk10OUxXSTRyOURsYy85bEFWSjU4OEVM?=
 =?utf-8?B?aEJZYXVCM1FldVdnQ244aHBIRDMyU3M0RHl3c3lDekowbzdwWCtxZDIxMGpm?=
 =?utf-8?B?TFFHOER4WG9FSHFFc1FlYzUrV3h2aXhCL2xiQlZ2Z0h4VlUwUnh2QjlIN3NR?=
 =?utf-8?B?T29sanF4Y0dhazY2Nm9PZmMxMjVIa1JtQ0MrOU9NYmswYU9NcVlqSWh6ZUli?=
 =?utf-8?B?OVNUbDZBc1FORzk3c2dld29VNkVweGs5WS9BcWx6RXA2MnZnamo4eWFPUFpz?=
 =?utf-8?B?TGllV1QzTWhUZ2xvL3UyQTZZYUZzMkowUldQb0pNdUdHSC9GeHdwbmFnd0Ra?=
 =?utf-8?B?RE8wWkNVdGxqU2NjOFFSckV6YVJqS0VGd3hGT29oUEVRNmVKRitwNk53SUlG?=
 =?utf-8?B?SDF2Z3pOMzZLMUtORGl3aEJQSkhxSzVHUndkRk1KcjdGY3ZJcXdJM3kzQVpj?=
 =?utf-8?B?M0tJT0l3alVwbzFBMUhEM0tMcVRXS2s0VEdSTEFBMGk3N2c9PQ==?=
x-microsoft-antispam-prvs: <BN6PR11MB2019AAEB53720811AED4C6B6F04F0@BN6PR11MB2019.namprd11.prod.outlook.com>
x-forefront-prvs: 0972DEC1D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(346002)(136003)(366004)(376002)(189003)(199004)(99286004)(11346002)(68736007)(446003)(6506007)(36756003)(71200400001)(6486002)(76176011)(14454004)(97736004)(486006)(105586002)(106356001)(305945005)(476003)(2616005)(7736002)(53936002)(6436002)(31696002)(86362001)(2906002)(2501003)(3846002)(6116002)(4326008)(52116002)(110136005)(229853002)(54906003)(66066001)(25786009)(478600001)(31686004)(186003)(6246003)(71446004)(316002)(8676002)(8936002)(81156014)(14444005)(256004)(102836004)(72206003)(81166006)(6512007)(26005)(5660300002)(386003)(71190400001)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2019;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QZsqjh3EaonlnbNLXqkO1atTOxFMz+S/JfqFwhtQllNqN/Uxnp+OlH3YsHG7ibEio7tzjSgqEVGPWIMbyzV+Z2Z1Cyhq0+d+UBo5bATm1AjeZKH1vg9sy8cAXdZWOJCGVk1PwlokPuEdFPw7oki0pqT1BsmrJG0/nIFQiuPHxRzuu7FOkjdiaTSLEfui77SK0ywS+iJahWC1J/bLbSXIke5NxKsUh+JeHu+c1Ps6dLMTVo7VaetSrZQMcfkgzjcPzMkw6qeQ6JQ+0kjxoepGpvX+Ps21IO26a4/enrE9TJ9SoJTcOFh2V9WzyyAfFi9aVIK/82gZhpK7aX/FoAaY6pc9N01IVrG3SAj2LOOyqFsdG+rRQAdLYGjUoRcPt/oAYZPO4qmkzPTYNDwJer32e02PybL1epIsVV3aTN5BywM=
Content-ID: <38B407DBE6AB504B945A545D2C3752CF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c661300d-af89-4fc2-aa9e-08d6a54008f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2019 10:06:17.0295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2019
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_030624_829639_2A59308E 
X-CRM114-Status: GOOD (  26.49  )
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
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Jonas,

On 01/30/2019 12:07 AM, Jonas Bonn wrote:
> Setting the BPNV bit defaults the block protection bits BP0-2 to 1 at
> reset.  This means that all the flash sectors are protected until they
> are explicity unlocked by the user.
> 
> Together with protection of the status register via the SRWD bit and the
> WP# signal, this allows a flash device to be effectively protected from
> erasure by unauthorized actors.
> 
> The patch has been tested with a Cypress s25fl512s and works as
> advertised.  The concern that I have with this, though, is that the BPNV
> bit is "write once":  if somebody inadvertently sets this feature on the
> device, it is irrevocable!  Whether or not this actually belongs in the
> mainline kernel is therefore up for debate...

My opinion is that OTP bits should be set at manufacturer sites or in a client's
controlled environment. I wouldn't add this in kernel. But maybe Marek or Boris
think otherwise?

Cheers,
ta

> 
> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> CC: Marek Vasut <marek.vasut@gmail.com>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Boris Brezillon <bbrezillon@kernel.org>
> CC: Richard Weinberger <richard@nod.at>
> CC: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/mtdchar.c         |   6 ++
>  drivers/mtd/mtdcore.c         |   8 +++
>  drivers/mtd/spi-nor/spi-nor.c | 102 +++++++++++++++++++++++-----------
>  include/linux/mtd/mtd.h       |   2 +
>  include/linux/mtd/spi-nor.h   |   1 +
>  include/uapi/mtd/mtd-abi.h    |   1 +
>  6 files changed, 88 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index affb0ac39928..31dd308d34b1 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -803,6 +803,12 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  		break;
>  	}
>  
> +	case MEMSETDEFAULTLOCKED:
> +	{
> +		ret = mtd_set_default_locked(mtd);
> +		break;
> +	}
> +
>  	case MEMLOCK:
>  	{
>  		struct erase_info_user einfo;
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 254c3b413213..3cae22f161cb 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1759,6 +1759,14 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
>  
> +int mtd_set_default_locked(struct mtd_info *mtd)
> +{
> +	if (!mtd->_set_default_locked)
> +		return -EOPNOTSUPP;
> +	return mtd->_set_default_locked(mtd);
> +}
> +EXPORT_SYMBOL_GPL(mtd_set_default_locked);
> +
>  /* Chip-supported device locking */
>  int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d6840c2b15dd..4f9b82ff87ce 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -250,7 +250,7 @@ struct flash_info {
>  	u16		page_size;
>  	u16		addr_width;
>  
> -	u16		flags;
> +	u32		flags;
>  #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
>  #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
>  #define SST_WRITE		BIT(2)	/* use SST byte programming */
> @@ -279,6 +279,10 @@ struct flash_info {
>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>  #define USE_CLSR		BIT(14)	/* use CLSR command */
>  #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
> +#define SPI_NOR_HAS_BPNV	BIT(16) /* Block protection bits can be set
> +					 * non-volatile, meaning all blocks
> +					 * are protected by default at reset
> +					 */
>  
>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -1324,6 +1328,36 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	return write_sr_and_check(nor, status_new, mask);
>  }
>  
> +/*
> + * Write status Register and configuration register with 2 bytes
> + * The first byte will be written to the status register, while the
> + * second byte will be written to the configuration register.
> + * Return negative if error occurred.
> + */
> +static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> +{
> +	int ret;
> +
> +	write_enable(nor);
> +
> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret) {
> +		dev_err(nor->dev,
> +			"timeout while writing configuration register\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +
>  /*
>   * Check if a region of the flash is (completely) locked. See stm_lock() for
>   * more info.
> @@ -1342,6 +1376,35 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	return stm_is_locked_sr(nor, ofs, len, status);
>  }
>  
> +static int spi_nor_set_default_locked(struct mtd_info *mtd)
> +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	struct device *dev = nor->dev;
> +	u8 sr_cr[2];
> +	int ret;
> +
> +	ret = read_cr(nor);
> +	if (ret < 0) {
> +		dev_err(dev, "error while reading configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ret & CR_BPNV)
> +		return 0;
> +
> +	sr_cr[1] = ret | CR_BPNV;
> +
> +	/* Keep the current value of the Status Register. */
> +	ret = read_sr(nor);
> +	if (ret < 0) {
> +		dev_err(dev, "error while reading status register\n");
> +		return -EINVAL;
> +	}
> +	sr_cr[0] = ret;
> +
> +	return write_sr_cr(nor, sr_cr);
> +}
> +
>  static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> @@ -1387,35 +1450,6 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> -/*
> - * Write status Register and configuration register with 2 bytes
> - * The first byte will be written to the status register, while the
> - * second byte will be written to the configuration register.
> - * Return negative if error occurred.
> - */
> -static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> -{
> -	int ret;
> -
> -	write_enable(nor);
> -
> -	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> -	if (ret < 0) {
> -		dev_err(nor->dev,
> -			"error while writing configuration register\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret) {
> -		dev_err(nor->dev,
> -			"timeout while writing configuration register\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * macronix_quad_enable() - set QE bit in Status Register.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -1886,8 +1920,8 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> -	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> +	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },
> +	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> @@ -4066,6 +4100,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		mtd->_is_locked = spi_nor_is_locked;
>  	}
>  
> +	if (info->flags & SPI_NOR_HAS_BPNV) {
> +		mtd->_set_default_locked = spi_nor_set_default_locked;
> +	}
> +
>  	/* sst nor chips use AAI word program */
>  	if (info->flags & SST_WRITE)
>  		mtd->_write = sst_write;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index b78e2c1b27b1..a07468b6677d 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -346,6 +346,7 @@ struct mtd_info {
>  	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
>  			unsigned long count, loff_t to, size_t *retlen);
>  	void (*_sync) (struct mtd_info *mtd);
> +	int (*_set_default_locked) (struct mtd_info *mtd);
>  	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
> @@ -535,6 +536,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
>  int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> +int mtd_set_default_locked(struct mtd_info *mtd);
>  int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs);
>  int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
>  int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 2353af8bac99..c7cc84a5c8f6 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -144,6 +144,7 @@
>  #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
>  
>  /* Configuration Register bits. */
> +#define CR_BPNV			BIT(3)	/* Block protection non-volatile */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>  
>  /* Status Register 2 bits. */
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index aff5b5e59845..27b752796efa 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -204,6 +204,7 @@ struct otp_info {
>   * without OOB, e.g., NOR flash.
>   */
>  #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
> +#define MEMSETDEFAULTLOCKED	_IO('M', 25)
>  
>  /*
>   * Obsolete legacy interface. Keep it in order not to break userspace
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
