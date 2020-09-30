Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2378DC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:50:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73002072E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3SdcAdPa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="h+wic4nb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="FwA51Z4F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73002072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X+kz2QGQkpYsycokNvCmbbtHVYUK6YsH6AMT24+QS1M=; b=3SdcAdPatWKu+T0Qg4THyg50n
	Y4MZuLkj/TljW1DQ3X4t8p/NNwvZ+ZIKLd5ZQWZR5d1albUHQa2d8QXdlxR0gJobF7E6dvxeLD/Ir
	Jzxotpz47zQ8yaYVQgFvDT4+9C869LLXYP2QZcV9ovzeYBJTMBf+ZgWhlc8EBCXJIA/XbopEymxGE
	AeTVdB+Dvcq5kFwkx8R+NJDeKLILZOxiB7AKJPkan+irNgJgK7jChex9x2zV6vDkP2E9TnObwB8B0
	OwfM9/F0uk1WUm9W+8ax049yODZJnqjjLXdZ8bYfZ+CRgPNvfN5EP7+WN8Q52nkyYbMFlMeUwgBj2
	/zuwMfSfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVwN-0004j3-Lz; Wed, 30 Sep 2020 06:50:15 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVwL-0004iY-L9
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601448613; x=1632984613;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rSr0T7lQHu1yaJgDPGrvsiXKR9Wt/+8kvMIxSALEhPo=;
 b=h+wic4nbVYy9CgMXu0A529+mYdGquJbBbqWu+Aq9O0hl9gHIDB66gn8v
 EYPKZ2jzojuYmDrH6l9Cd++gIY183412bMEDZ3Uw/WRgEU192dsCuDSEo
 j8Q316/SC3FNL8KHSVUVthr1aZrspPlz6Y0/bqt26qYGkptf0suPP601D
 8fJh7y9REzJite+pZqe72A63V5O3T/rlmaCWL6QuxISbUv/oU6yBm+fyK
 zbN0dhGynhEkIYLi/NkkIvYUEsM634UdyDOii3v6yF9Adq4rQ0nx2pyCC
 Y4Jdd613MRSB8TmmQ7ruZKVF+9lry2DDYei9+ImqoLteDZrcmCx++g8of g==;
IronPort-SDR: QzpdOiN/+WOCbZg3Hix/TDtDhXkdNDD6gmZpCgQS1i/PHdNajMu4aTkzES4eJ/ufaqi4hSL3Im
 sh3BS6HOwe5r1ghTW2W4d2NASyxisAo1KIKvIS4OQwKLKl09BhBU9RcBoz9833nhOF33ZrDAsO
 1NO/0PdChnY7VJfNFbeQONpWjba//bIVtrAuw+g8XzlxZRib35jbpPYhH7cvXEPwLEUWq2dmYK
 gkBN6KqZp95GtT3lHPdZvbsr4W7hRjbBHzAdnlzROaEr6DahoADt/g3kz5GfmQIbk1uzm7WR+2
 ZAc=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="93692166"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 23:50:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 23:49:56 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 29 Sep 2020 23:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQVV0395RVGq3EDxqky8aKnZBGc2g9XHig0h66PRcyBlGxO68lJ4V4jLLUyefWQhBHjN0u51jsvFdTDLBTYbP2abRHZ7k1t+PmB7tNGyGOtd8ZMYQr08BigqWZhxZjhcCRXhW8EcCErIod03TMWT/As5vQxB2Axbx2C/MyaLeAtCPGzjV7iLciPgp7XW2yPnv8oUG4Oy2P5CM7UK2bdcEc+IVtOU6SnSS0JWHoQqR9j9Prt8f6XItgAn/3oZbbDjxo7GDMJxb9PjsAZoTn/7WgAqyXzbj08I3Zz8vIMkL6jK7SWokcI8Vz17p4zDttRl/sJdGR0PHGq+WuIz6aesWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSr0T7lQHu1yaJgDPGrvsiXKR9Wt/+8kvMIxSALEhPo=;
 b=h+LRvxX+amcQE2oOKDfu17qDo0FIAkOLBxAffIVkZDoQM/DmppWHT2Mzzh7NMzJ+2jC5eVxSYvAwZG0p/rbvgKw17znCQTURLOboBa8osalvADf2Y9xaBkkM2WUtw1nrEKKf/v1gQDae79jRFgMrE333jxjmIvka3B/P8KSv07/GEvJ/RfUpIO7W1gqowgFC5hnNJR9bapbWGNbOLEvYR3SQli2jtLFpL5w70ZLylEYeeKQ4u7MHVkDjUMJuH1Y2bjH2ggUxWGp6FcTceCQ/WGVYkD98T+FvgM9T4M5zfoUbLEg1KKOJW4XGTt0I/3eDTg80/Z8nY9vn3Fx4c3YvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSr0T7lQHu1yaJgDPGrvsiXKR9Wt/+8kvMIxSALEhPo=;
 b=FwA51Z4FgQsRUsy9JaektNl5jCo2i/FNetAarWfR+4G49xbPjdf34pRBP07DHurPJEo2kW+ncWXqeuSmGdrOBD0ha0RfgXMZWgYPOG5zUQbOj61IISAGba/IjREHvgEwONEaI+Zg5asg4SPcJdpnNadC11u72ELSgEGajefvmhU=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4123.namprd11.prod.outlook.com (2603:10b6:5:196::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Wed, 30 Sep
 2020 06:50:09 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 06:50:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 08/15] mtd: spi-nor: core: do 2 byte reads for SR and
 FSR in DTR mode
Thread-Topic: [PATCH v13 08/15] mtd: spi-nor: core: do 2 byte reads for SR and
 FSR in DTR mode
Thread-Index: AQHWlvXvbGbh0YzMp0+DVtDRFRmraw==
Date: Wed, 30 Sep 2020 06:50:09 +0000
Message-ID: <6198a69a-2800-d14f-1d29-9511ba6a3f5f@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-9-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-9-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: cc37b08b-c583-493c-7d63-08d8650d12d9
x-ms-traffictypediagnostic: DM6PR11MB4123:
x-microsoft-antispam-prvs: <DM6PR11MB4123A59AA2634AEE98F4432BF0330@DM6PR11MB4123.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJ973W/XEo5P3mqUkCixdFsPUkrNXtAyjnge+Is2or4GLVi2hVT0y6OfLDq+5t39f/NyTzozCXw7K1W9BY5IGaou00fLBQhJaRVWtHTAN1tX07vwNRxLPqtRUrNBVxP6qvdqROfQ6Xm1V6IYvBUhTy78+Ih88+wgXrSVuk4yvc3aTTEN/S7130epB+b4Xl6BW3jXnoNkTJHqMrlTDSiCMM5TyxQZJvksvkkQCwsLhlnkTE7cHe6gD4pdUjhlELM7iGcR1TeqrXBUZKlnDWGnmLpHK9rWT1n3tYIugKwvewpfYGHXtQHiroJME1eRGh2OQvg00HzMYYNiFkiX+oedGggsksuXTefFlnojbulReQjchLoFYtB50lmcKSqTs+dPSEA6jd0V5xLTvaTgjIe8/IU3S+w3tGPonirOVfz15VcQyQPNXkKKvrHpjRS8kC9B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(396003)(346002)(39860400002)(2906002)(8936002)(8676002)(6512007)(6486002)(5660300002)(2616005)(66946007)(91956017)(31686004)(66556008)(66476007)(76116006)(316002)(71200400001)(64756008)(66446008)(54906003)(110136005)(6506007)(53546011)(86362001)(478600001)(83380400001)(26005)(36756003)(4326008)(31696002)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: cG/OjKntCaHtLwUE/Yq47ZK6uvae6hRhYFryCH8V+8H9JutP0vI1mqwm/Z1t3N9IakXl8Rd5QDIgGrYzQyeBwhV60cqroHM7Y3HnTs63pfHLy/2IoH/tffrQYbuCrvQocO4BLIixr6i3EqM2OrettjqQXp7OPXNhE+YOixzrxUW8eII50J8oiBPPSAKoD995SUTUrq+nH2Y8RcBHoVLQ2/cJFGcWvOeFhue2cvEGn2N/9e4OWpEujt1oSpD0dLHN5woUaHIq8W4Da6bJedJTj0SVTxipieQCC81ziAHa2OADA63pA7K9bXvzhlz7TN2+9o9JEH9nqI24pfhJiOlO+G2DZQu+Q5YAa8IGQFtf39It9JPzvbyCo2XK6Ow7BK+qML5vUkt0FCT5o7SQ4GYHQ1Q7ZGIPWxthwutdftzzXP4pqprnnPgv/JPMQX/MGNsvBJoF43sHekQj5ZpcbSDQ+RJZEpp+XbaiPuwkWStnKCq8v4zv8kG9MEDjp3TFkL/ZokNt4OHx6QpyYsWbW0lBr8q5gTGVYDXeLc7wP9zhCOrEI1WWyrIROVPKOz2k/aLP5/ZcOV1WfiorQr83lAAd592QVa5ZHtImqrxmUUsDseIkwxYsEzDX+guUKVytJ5XWsFosEAttsT1/TadnYeAnhw==
x-ms-exchange-transport-forked: True
Content-ID: <B57AAD26DACF2F488105D183D68C2FEA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc37b08b-c583-493c-7d63-08d8650d12d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 06:50:09.6329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yoYvN4yaUEeqJQHtvtWA14CFYqm3i5a4dX9dhSJl+wXmRWU4CrGITHN1x/7GwfXuTMX8Z65tWVPyyI4H8VwHVfkxzqCS5U7lRU4wnRDlMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025013_870266_F2910FD8 
X-CRM114-Status: GOOD (  19.68  )
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
> Some controllers, like the cadence qspi controller, have trouble reading
> only 1 byte in DTR mode. So, do 2 byte reads for SR and FSR commands in

did you get garbage when reading only one byte?

> DTR mode, and then discard the second byte.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 88c9e18067f4..87c568debf14 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -368,7 +368,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>   * spi_nor_read_sr() - Read the Status Register.
>   * @nor:       pointer to 'struct spi_nor'.
>   * @sr:                pointer to a DMA-able buffer where the value of the
> - *              Status Register will be written.
> + *              Status Register will be written. Should be at least 2 bytes.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> @@ -386,6 +386,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>                 if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
>                         op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>                         op.dummy.nbytes = nor->params->rdsr_dummy;
> +                       /*
> +                        * We don't want to read only one byte in DTR mode. So,
> +                        * read 2 and then discard the second byte.
> +                        */
> +                       op.data.nbytes = 2;

just for octal dtr, but should be fine if you update the previous patch

>                 }
> 
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> @@ -405,7 +410,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>   * spi_nor_read_fsr() - Read the Flag Status Register.
>   * @nor:       pointer to 'struct spi_nor'
>   * @fsr:       pointer to a DMA-able buffer where the value of the
> - *              Flag Status Register will be written.
> + *              Flag Status Register will be written. Should be at least 2
> + *              bytes.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> @@ -423,6 +429,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>                 if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
>                         op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>                         op.dummy.nbytes = nor->params->rdsr_dummy;
> +                       /*
> +                        * We don't want to read only one byte in DTR mode. So,
> +                        * read 2 and then discard the second byte.
> +                        */
> +                       op.data.nbytes = 2;
>                 }
> 
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
