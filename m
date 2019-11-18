Return-Path: <SRS0=x2+d=ZK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DF2C432C0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 10:17:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9EBB20727
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2019 10:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYQE3I+G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="LcxoOLl4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9EBB20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmIkUL20nNdVQzeXPVl55PVngvYoTVZEY5iKQNErGU8=; b=IYQE3I+G1rPUnj
	oWrwHGKhW89r8HtyK258f4p6R971+QJJF5GIthWgES8DNEQ//L99Uw+9SzpWrjnW4xewebQFwYrpQ
	wNsFrRarkTRchJsaAJwVS2hKF9rGDaQkf2MZDE5J+sm5ETGbrqviWXbR02GpZML23MyqCdMcnmT9Z
	DvIenSyGUccEN0bcvW/cFtiGt7iPtfIItlrfccHOiBDPF3CCXH71EOv5/26RCMoQ/kwjxfFvDqc3f
	t/IJauWUL6eVHfS8RAx0nthOE+Ijvm9sBtjnqKuExkcxpAdgK5wemIoEZAdwaaxB+8VEVT1Hso9r6
	ihwM0sl0b9LPhDaaXuMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWe5f-0005tx-A2; Mon, 18 Nov 2019 10:17:03 +0000
Received: from mail-eopbgr700050.outbound.protection.outlook.com
 ([40.107.70.50] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWe5b-0005ta-Jy
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2019 10:17:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn/M6Rk/yf8imgZb2WC580WpW/4RmTfAG8MLJWrgnH1rudYNzsmmLXswPEiF3tQd3ULBasXmM1/p8QB9r2yjrqNMowDjF/TcRYn1+72w5aXZVt5wTgzhCYkh8w/TyUkMSIqbvXV3TgMuFKr1PYjFNVICteDT0H0BYGno2xH9Y6r5Mm1sPfhEwY4TS2/8pXnAeT8m1GMG3gVrbNhkF8I9sWLn+4YS3xdsL7teYxtfaLKiHqEhR1EPx0FLshkmenyhkEayoheAHgtDzEuBqKOCksZtPv4Z7qs+SVm/SnH6w7MEyXAk8vq7GTSPR6RvCch0SJ18Xm8aOkw/SpyEU/L9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOcouLdZB+RwuWkD+WAFqt1fl/HciQ6AwgJpnsAwILQ=;
 b=mJpPQcVVJgFUlIdmyxN2h+MGwAop2foXqyfr+YDWnWnLhfilljCA6YLPSOSn7nV3+AfP0vaNYol0gnRzi+olrcKqsFgM0WBECzxnfi9j/sGwWgUdK2d2Mx8S5yLaWdudnro7iPM3TB37lO7Onc5KHGl0yhF6XZBE4B0rj1cf28J6Z/6HScWN6lPNt3ZOQHt595mQtcdgyJOzpGwT9MpFVqlJ4hrRIiS68i33Sh+Zo9Dii2avAxb/fvYBk4DC4rKcrBGou3Trg9SrD5NV4+YfTyn9wlG2Z41bMV89QkYd/hi9PmQSeSxl12BBXYW6Nq5X/AnlzZ8XyojibsXK8ea/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOcouLdZB+RwuWkD+WAFqt1fl/HciQ6AwgJpnsAwILQ=;
 b=LcxoOLl4xcQ0kZ5mzWe8iOQH2Di9QWFBNJCSN56Ie3eeXjWpuj1TDyMPFnQnlXrwxQu+41KwvcdkYDn+61aEWjxpr6su8fZ3IaCuLJrdx6IcbjCVzOXYh19Mp1s6D8RJ9m/ZkDAN4VpY4Egbz8wFFyK1xsMIgRMK5ebJXLfVzzQ=
Received: from DM6PR08MB6396.namprd08.prod.outlook.com (10.141.162.200) by
 DM6PR08MB6219.namprd08.prod.outlook.com (10.141.161.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 10:16:56 +0000
Received: from DM6PR08MB6396.namprd08.prod.outlook.com
 ([fe80::1c8a:6889:b816:3d7b]) by DM6PR08MB6396.namprd08.prod.outlook.com
 ([fe80::1c8a:6889:b816:3d7b%7]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 10:16:56 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: RE: [EXT] [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Thread-Topic: [EXT] [PATCH] mtd: spinand: micron: add support for
 MT29F1G01AAADD
Thread-Index: AQHVlgkBIyrIFcZ/2E+v1f5bGBMtdqeQxKjA
Date: Mon, 18 Nov 2019 10:16:56 +0000
Message-ID: <DM6PR08MB6396AB87FEE731C7B3588358B84D0@DM6PR08MB6396.namprd08.prod.outlook.com>
References: <20191108074852.18507-1-m.felsch@pengutronix.de>
In-Reply-To: <20191108074852.18507-1-m.felsch@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOGE5NDg1NjEtMDllYy0xMWVhLWIxZGYtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDhhOTQ4NTYzLTA5ZWMtMTFlYS1iMWRmLTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iNDQ5MSIgdD0iMTMyMTg1NDU4MTQwNDU1MjYzIiBoPSJldXhndDg0ZStHK1c5d3hoMHFBMkp0akViYWM9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.80.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cbbb69a-bbe3-49f4-4b07-08d76c1070ce
x-ms-traffictypediagnostic: DM6PR08MB6219:|DM6PR08MB6219:|DM6PR08MB6219:
x-microsoft-antispam-prvs: <DM6PR08MB6219044FD9FCDD7C7C9F064CB84D0@DM6PR08MB6219.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(189003)(199004)(102836004)(71200400001)(71190400001)(229853002)(6116002)(256004)(3846002)(26005)(5660300002)(446003)(55236004)(86362001)(6506007)(11346002)(8936002)(305945005)(66446008)(64756008)(66556008)(66476007)(66946007)(7736002)(186003)(7696005)(66066001)(81166006)(81156014)(8676002)(52536014)(25786009)(99286004)(45080400002)(76176011)(14454004)(478600001)(2906002)(74316002)(33656002)(6916009)(966005)(76116006)(54906003)(55016002)(9686003)(6306002)(6246003)(476003)(14444005)(486006)(316002)(4326008)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR08MB6219;
 H:DM6PR08MB6396.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gsEkbCSHGZJK/l/7O8k+yBuKs5GDf3EMzUCmlqEczRLlt98zo/cE3fjh54rB9sc14TCuqN+pkNdSydTQYmxJIQl36c86BZOJqMziEIyZjSLquvlO86A+DkLA9fXJvGdCkgZcuJy4ME/2N/GztKLylaTB2hftYsmxMPF/uDMYf3o3H2WYqWVLHw40eznfIK8xb1ttvSB/JbW/Wx5yXZMQeClhOR0qsOswA3AMMnS8TzBFPmZ1rlfLYB+QfaSGI2FP5HENuqaRpfzRrzA2kRBpyIvN+ANrWnGhfkqvJqzZO7Osfk9l0qBqJEYAN4k3bo17aCumT2chYnNpKftG0Wnumiuj/VOJl8+xwtO2wZNh4gk8LTnUlprKKTqeHrDyhfV9VEn9vhm588tn9+CsJbbXow0XKbQ17IwDlGcpOqAUij3uG3fiRP7jc9wi+RIcOnNU
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbbb69a-bbe3-49f4-4b07-08d76c1070ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 10:16:56.2475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEeBmpqs5ZPYr+Amg83uc/Vli2IMMIUOF2a+RHz5oh6AE4RT2RlGLVsZjZFXlnWV2JffpUd8WPIDWfRLLHQ9Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_021659_675263_6DF3D7B8 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Marco,

> 
> The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
> capacity of 1Gb and supports 4-bit ECC. The datasheet can be found [1].
> 
> Unfortunatly the linked device is marked as EoL, but I will expect that
> the MT29F1G01AAADDH4-ITX behaves the same way.
> 
> [1]
> https://nam01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdata
> sheet.octopart.com%2FMT29F1G01AAADDH4-IT%3AD-Micron-datasheet-
> 11572380.pdf&amp;data=02%7C01%7Csshivamurthy%40micron.com%7C21a
> da5347828461980a408d7642021a9%7Cf38a5ecd28134862b11bac1d563c806f%
> 7C0%7C1%7C637087961499818902&amp;sdata=%2Fh%2FHfUoSnl8qqSVClVfp
> ykvi3UiDEZFTn%2BVCsAf9IaM%3D&amp;reserved=0
> 
> Cc: Peter Pan <peterpandong@micron.com>
> Cc: sshivamurthy@micron.com
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - Convert 0x10 into 16 for ooblayout description
> - Don't break web link within commit message
> 
>  drivers/mtd/nand/spi/micron.c | 68
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
> index 7d7b1f7fcf71..70e278759bd3 100644
> --- a/drivers/mtd/nand/spi/micron.c
> +++ b/drivers/mtd/nand/spi/micron.c
> @@ -34,6 +34,18 @@ static
> SPINAND_OP_VARIANTS(update_cache_variants,
>  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
>  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> 
> +static SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL,
> 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL,
> 0));
> +
> +static SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
> +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> +
> +static SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
> +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> +
>  static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
>  					struct mtd_oob_region *region)
>  {
> @@ -90,6 +102,52 @@ static int mt29f2g01abagd_ecc_get_status(struct
> spinand_device *spinand,
>  	return -EINVAL;
>  }
> 
> +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, int
> section,
> +					struct mtd_oob_region *region)
> +{
> +	if (section > 3)
> +		return -ERANGE;
> +
> +	region->offset = (section * 16) + 8;
> +	region->length = 8;
> +
> +	return 0;
> +}
> +
> +static int mt29f1g01aaadd_ooblayout_free(struct mtd_info *mtd, int
> section,
> +					 struct mtd_oob_region *region)
> +{
> +	if (section > 3)
> +		return -ERANGE;
> +
> +	/* 2 bytes for the BBM + 2 bytes to skip non-ecc memory */
> +	region->offset = (section * 16) + 4;
> +	region->length = 4;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops mt29f1g01aaadd_ooblayout = {
> +	.ecc = mt29f1g01aaadd_ooblayout_ecc,
> +	.free = mt29f1g01aaadd_ooblayout_free,
> +};
> +
> +static int mt29f1g01aaadd_ecc_get_status(struct spinand_device *spinand,
> +					 u8 status)
> +{
> +	switch (status & STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +	case STATUS_ECC_HAS_BITFLIPS:
> +		/* 1 to 4-bit error detected and corrected */
> +		return 4;
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static const struct spinand_info micron_spinand_table[] = {
>  	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
>  		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
> @@ -100,6 +158,16 @@ static const struct spinand_info
> micron_spinand_table[] = {
>  		     0,
>  		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
>  				     mt29f2g01abagd_ecc_get_status)),
> +	SPINAND_INFO("MT29F1G01AAADD", 0x12,
> +		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 2, 1, 1),
> +		     NAND_ECCREQ(4, 2048),

I think, this should be NAND_ECCREQ(4, 512).

> +		     SPINAND_INFO_OP_VARIANTS(
> +
> 	&read_cache_variants_mt29f1g01aaadd,
> +
> 	&write_cache_variants_mt29f1g01aaadd,
> +
> 	&update_cache_variants_mt29f1g01aaadd),
> +		     0,
> +		     SPINAND_ECCINFO(&mt29f1g01aaadd_ooblayout,
> +				     mt29f1g01aaadd_ecc_get_status)),
>  };
> 
>  static int micron_spinand_detect(struct spinand_device *spinand)
> --
> 2.20.1

Thanks,
Shiva

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
