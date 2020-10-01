Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F67C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:53:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83DF2145D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bi3yjBEL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1zPUsH6v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="M7tf39Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83DF2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=szwwi/h6D6ZOy8yLyAsZmSePT0pxHxpJwgKdWYHL+lA=; b=Bi3yjBELl2qWTiH5t6cRiITWu
	ajc7C4G/+2jFfaSGVFqxVL/4slcab0ACqf3ORDiIyb5e2KZ4LiyX2wK6rq7HVE34bHMuKl4PlY9Ri
	PlrwkBTH5oKfJ8xcjpyvllWhb4j2rE7wEnMopiUasQ0udbVJ4V8QklvGyUuH990CV9PLEJZdA5Q7t
	bxfUJEB002LnC7Vo+uml3jSTnZBpRK4+2VnxdJULojp8DhAtIc4VxrWO2KRyCcHgK4yC9t/LA02Gz
	rh1s+a3SOMBYGf7uLkncnnYx5aT1XKK2LUDBpz6Tp+thPlh9S/L34dInJxoB89vJZBGvuLwbr5ZWE
	UGMu27Fyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtOS-0003v7-MU; Thu, 01 Oct 2020 07:52:48 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtOQ-0003tl-8M
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601538765; x=1633074765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oef8e5K54IIqocrvLaxrkxdCUAeslKALdDeaPoF4hG4=;
 b=1zPUsH6vA+j58DFpsrT6rvkNuYW15h1LLQmWPGGfHs2vDl3KxQtvANlF
 gEzHsc05GLnKlt5HL2DjiZwu+xSnFIuNAToEX949trQ3sA+bh5BGctrhG
 7RmRt4G4cZYoirBSZZJec8z381NEoqs6tXMsXQBclm939tLCdpp0jtwDD
 YKtCjpQSrctHbsVYyQMhwxlfktoKQhSZOpgLx4f6HMuP2yDWm4S5aHx22
 exdAqhw+d3tGai/F/oyPHBKIglmMrcPwAkVdrJ+omVxu7HUhZ50O5iM1C
 u8iNwfLCiXD9JdsojF6FWuMdMZwcg4ZnslotObK7E2gUmk8Vo36+SO2TA g==;
IronPort-SDR: BX4P5xS8ngr3T2tgv/+AeH0Y1nkYAjzJm9+fDpim4PwJbUSwoaAEPJUP9bEv0ghlrMsl1FOxXw
 OczFYfZDscEnUuClepXQuFo/3T8NFrB/VHh3v3pwT/8B2YpYIr3en8uJeUlegKmlPvG3rdYH/k
 0HPlla3Ja76as2ez4YCUp5y6LLVblFYGm4FFHlHpkdFjb0K64y46lhUuGKjxSyKAEXAIIEgb4z
 ybnYpxaXUmyKSFQF5kdy0VJ7p3TaJxCIYKRB50xjGBbspVx4RCLAoBSmW9iMzznxVDk+2YXXtT
 8jU=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91051294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 00:52:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 00:52:13 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 00:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzTe1WxyDcn29Yesj1K9pA3tOWnpKQw8FOwI5LZN26tgZBgDZYogroIvErXuMPJoPw9VnQbNA8B4uXsqmDPRSyFyUiaxulIkvZKg70AjtQNPeq1GxKVNNJ0Kp5ydxd2r0cNQYwrmWbHGvttlhJY1Y6GA50dCVFUXg84pV+uA6XQ9EViA2vl2PT1UmdFfe9NVX/egLQh5A9/oT0c7oD3/huIA9FaOHLasmbooSLejdic4XGC/CqbxvnkIU1IJ8PdUBFoFzlTqrMgMlw3ZEpgNVTXYtnah4u0xweByrBePjOrvKUSiptKaDIQexwvbEfrdhUEQ3fVcsIgjJPxMCSNnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oef8e5K54IIqocrvLaxrkxdCUAeslKALdDeaPoF4hG4=;
 b=faNUNJee0CYNYpjJmJGNqpG7Wsb/LEUmtp1IvYWvP7zroNCsIm66lVxRg72KtwFh1pJw34hlH9LauQxlTzM85qQaPHj/LhjRYTI6YIifdQrRhucwfjkaLbs/lTmA8hj1936tTZz4AQr+KvmWKViPm241sVXBJkhu1+P3qiSuyA7pK3tHav+qW/wQWgyIwl81YSQFsuSo1zdl3SCg3lrsvpQgMBaC01kIiCNb0KYU+q6Mn2sdJVVqjPnAH7miNI9+b7Sp7A7+GBeF82GgiNSo1mlGahLmZCTFzBou8CY05lRdyRz3GzF5mSAKPcALoWEW+7NKql7URJl7Ba+vAeIyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oef8e5K54IIqocrvLaxrkxdCUAeslKALdDeaPoF4hG4=;
 b=M7tf39Qf9XljqUXroNmuD9drg/IH4WP7ldihorqJSnZ1AYb16yENFIvQ5eIV8NE4NNqTlGTDx/Grvgug2RnRbUKVPkKeIqGCa4nXyOeuTl9l4npa8+Z+boccBLshwQbPlaD2yeFFPaligEX5oXjfcdaT52MtTzgteqMQxsikvbU=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Thu, 1 Oct
 2020 07:52:36 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:52:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 07/15] mtd: spi-nor: core: do 2 byte reads for SR and
 FSR in DTR mode
Thread-Topic: [PATCH v14 07/15] mtd: spi-nor: core: do 2 byte reads for SR and
 FSR in DTR mode
Thread-Index: AQHWl8fTc0NzaLTqvk2yuALqCAPR9w==
Date: Thu, 1 Oct 2020 07:52:36 +0000
Message-ID: <07af5100-55b5-4f51-ef5b-1e7a69b3607b@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-8-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-8-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 66e10c92-429b-42ce-65d2-08d865def680
x-ms-traffictypediagnostic: DM6PR11MB4691:
x-microsoft-antispam-prvs: <DM6PR11MB4691F60879AD96F5415F0FD7F0300@DM6PR11MB4691.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OyPI/BhCnp6/TokErNz2A0AGy7PEW3nB6ojtAw/BE6+qMPlkoA0RFbDqeZ1DDMwxMZjoaGLm4CNMSiXylvzIFl9E6XBzRQ1+yOug/4tqFGkR4NWiufG+hnZ5OD3o+0IXUVeNs6g7U8YPfpgHucqvP9nOF9wcYYlsaAlMgDAfk5SU3kwyDNo8l4S3w3raQ1V7Dtle/mB/wr1qZtB8wqPWlbgd0J7qcWSzhvH0nrha/3FiFbL+6e3wgzK7fpPSqON7jppPQ5nZi1QuB51kaqsN99LbDl+r0+hglYR6nLJpEhM2CpEG16NFb4/YMD9jybPrINLhonyaNUdCgI/pFX/JwnSQxU/V9/g57aXueY+BNDYloyBFyouV2P6kc947YQ2A9EbH7heH3tWevAOAqmB2SiLSV+m9cKfA9ERFMb8ezMH1aiyNLpFxkUUmyFMeFlYs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(2906002)(316002)(91956017)(8676002)(186003)(110136005)(54906003)(66946007)(2616005)(53546011)(6512007)(26005)(6506007)(31686004)(83380400001)(8936002)(31696002)(36756003)(64756008)(6486002)(4326008)(71200400001)(66476007)(86362001)(5660300002)(66556008)(66446008)(478600001)(76116006)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8h0lHOVROtCSrLwhLTvNesKtMk4ssTtBx2EM38kKukMJdRv0XS3OR7AoOfcgqIfbmvD1Eax9zomyI4gUE+BlohCbKYPblKt5rJA/aEe+Gwu6y6hflz3QJ3Z9ABjfjcsxw/vldE16+pDJzb9Am7GyhfCWxrUVAEFiNmxzn6m+J5Rcdsdl2p2enbh2BXOHvEc/FSyR65F2h67aJ89cb4Xl7d4DnXts6pyJldzGPRt6gM41Vk74MF/qcXXloDaAwHrN4iS7A+l9V62wljHg6FfRD6XFrvTs+FYIQr24LboTrkDYuVIV/+rPiaw4jFr8Mip0rnu9X6sOh0u//osPbnPFec6ffMGxIzrrlafg1JLnHJviron61MdqnCEaQxe8Lyjlh7h4bjSG7+PFSHGKg5neiqpovUHOWWLkqUmsXTMlnalybqo+e2jVGwAHpvbebZVJX1bn6TdY5gK7/O/bYQ1ti8P5peG2UC6CublOzDw2bOyBPLwD3jatYkYYHSLxySr9o3/UCBerkK9pFVzc3EFBdyg7nQbfOUndZt9zHtmeT/1+H1+qdMPbfWB5WuyFbVMwVI7Jbk6LyvAPISUPoXE32o3NP5k/En2SGFbkTcIEiTe4t8HPCkniJqyLe1CMfLCvOm3tj6QTLGNf9CY6UqAqbQ==
x-ms-exchange-transport-forked: True
Content-ID: <239D18AA5719D14CAE0A8CDAE78413D4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e10c92-429b-42ce-65d2-08d865def680
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:52:36.4620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnbPPGibMA66zleC9jgZG5uFAfAybHL3lV8nWOGX3NT2CKQGhiLaw7qtbvy+3sEpPa/ZOD1rl6h+DtV7F53qX3x6FvxPMyG6jKdKz+rbuUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_035246_406497_97EE37F7 
X-CRM114-Status: GOOD (  19.93  )
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
> Some controllers, like the cadence qspi controller, have trouble reading
> only 1 byte in DTR mode. So, do 2 byte reads for SR and FSR commands in
> DTR mode, and then discard the second byte.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1465cf80f978..73a26e7e32c2 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -370,7 +370,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>   * spi_nor_read_sr() - Read the Status Register.
>   * @nor:       pointer to 'struct spi_nor'.
>   * @sr:                pointer to a DMA-able buffer where the value of the
> - *              Status Register will be written.
> + *              Status Register will be written. Should be at least 2 bytes.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> @@ -388,6 +388,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>                 if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
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
> @@ -408,7 +413,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>   * spi_nor_read_fsr() - Read the Flag Status Register.
>   * @nor:       pointer to 'struct spi_nor'
>   * @fsr:       pointer to a DMA-able buffer where the value of the
> - *              Flag Status Register will be written.
> + *              Flag Status Register will be written. Should be at least 2
> + *              bytes.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> @@ -426,6 +432,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>                 if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
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
