Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B2AC4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 17:19:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E57F20657
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 17:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Xg7PDkU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LbJu2qS0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZR3x0gYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E57F20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3F+42t/JtfdGuTl0Mt8EObM4bXdgfdQfHgfkirWT5/M=; b=1Xg7PDkUZHiV0u8NmK9EL10hg
	8LaK0o4DfyRVxPMSJohiRKNukvrxIN39lXrrqo1jT9wev0NhIbnZeKis9KKxU4TL4SWzOnM/tq17D
	+KMU1uASxa9D1ijQYbZs5wLP+nctLFaZCuz+vj1qlerxuK9bE5SfQOhHpPMa0W6PqKkVKuHTZCGGD
	QCdPlB713aa335BBk4Dc5x56lqG7fOQtAFmfMmovApVUx5jrn0K8ZqX+stOY62kuLTL2yRYcTXPsK
	jP1vthmb4Q8YZgLEm5g3eE3fQgtXjFqGjSqUngjyZ++2pAOtzM+fwgPmQL7Y4MKKfZW/b/RmeN6Ry
	+WDr3Nh9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXScm-0003ku-Kz; Tue, 27 Oct 2020 17:19:08 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXScj-0003k1-Iv
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 17:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603819145; x=1635355145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xhVQfJyBUq4O04kaSsEusHhCAE5k7mfFdtUZEBmdRaQ=;
 b=LbJu2qS0Ok7TnLM4go33XQI0tSBIUhgiiTHeR99OuW7h4hI/6uTWTjwj
 7t6/ySd/PGLEXqFhTvs8aN5sgWdWa01VJxp5EKKhy0f4N7VY4BIWlV3ll
 WH9ta9TLPCphlqyg5vYATYWxvSgJUABoV8ZCF3zKTp/fgsYHK5IVlsspe
 lydYNnahwTvBlGNjG1uzJ3A9Zs0oPVSC79A4aLhEZbEN+iknNb3t2Gths
 IopA/rKtReyrBGTqMhMyN41HdPDqUzVjbmsBfXfkIXl3DKbT5uaVq3V0I
 p7agB+OmmkV7b1LMN5FJaOm7mVUUDvvVgvjkGKTFNYtNEtIWwyFFR/WZm w==;
IronPort-SDR: BWmxHnfwfJ8Wk13cSGmmJkCJe3VuzrBqzIqKtSpe+nCCpob+R022OZb+qQmDBncOh8pBGWaFVJ
 euxNaae0P4gv3xQWTjQtvH9ct/0Vi9d+j/34qEujifYqbZe5B/B2KLR8rbJxb03ugxnu4brcJv
 9naOcbXlwT0X3MwbK9t6M69f0UpSSwGTXVify2cO4Mk/Vis/KuxgjREjO1DprQNukcSampQ1Wp
 Iz1VfBEbsCOJ5O4H8a0Arl5MLXKzWSXdRwQP06iPkOMOGccd81PKIl8QfD9DrivHZuVepUIcDc
 GR0=
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="101132432"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Oct 2020 10:19:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 10:19:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 27 Oct 2020 10:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgXCYkW0vbjX53wsUxqM9XVHJT8FLjBZ/y9FuIvbyINoogYbNlEMxfMsIsBKM5IwlCf5wN1o/1KQ/J9D3YDVypZSV4j+tpR796zCpvdphVuhFQO3SEAWThyC5RQPtyevROn3KEu8v8INgc5bAjbjaR592GzuruBazwAuptHvfFaEwphTckjR6SB8GVDvQObczyOZu+aa2wU3L9i3XUdPLmWDLjAp/MGkoB2IjKmPw8fxvsaRC383C87qS4fLLClZu+NrYZImc0dsWoIUKrAREZ+8kQNdIkFqNqGfKDd78QOhzbgC2CAnaqe+xyTYG/lVXbrUORw8zPpzHpu9HjjhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhVQfJyBUq4O04kaSsEusHhCAE5k7mfFdtUZEBmdRaQ=;
 b=PeqmIxod0TjTLjOFaMqkgEIfoAjR5EgOjMBlvxf5mewQ4REkmLxXELwg9mFVpyNC/QPZu9tBZdzKHjVsKLR1sLD/UjPY53ArauQPI+J1jv+f9284Ai1SbLBASJsZ3O/UcjInE0Ur1xjxEfhVACEFEiZMPhif1ot424qqvbtuWrCt77mD7jPqJK0Cru3JjyV3kYgypChMaOEUDWxDxMpYPgjyJcbAKxEhEFefst13Q7U9km91WkNEE0wXcE6mqbBC18p0y56SgCunerlOzqFBJZ4xNx5XY9Ediwn/HvDXQ4WqORf4qGUaEunHhHBuASNFp2wXD1sTGtAlwCxWjUmp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhVQfJyBUq4O04kaSsEusHhCAE5k7mfFdtUZEBmdRaQ=;
 b=ZR3x0gYWSYWi912e9RxAc4o9JDTxIc8h4G6TkhJ4UVAua0b9er1bAHHCAxdt98Kp0SNB0xgb0oOLjyeYLIBUvGG4PGbCPtgIODU8vFqq3comPsQ658eqfn5zv3aoNi7vKMF+IUxd4mVHQFgzrASjy31KVo6xvFJrNKV19rE3NOY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3024.namprd11.prod.outlook.com (2603:10b6:805:d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 17:19:01 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 17:19:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 2/7] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Topic: [PATCH v4 2/7] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Index: AQHWrIVDOpu8fNTtIEWVa0cdn6EZ+Q==
Date: Tue, 27 Oct 2020 17:19:01 +0000
Message-ID: <786750c7-595f-2954-5382-78005c71ade0@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-3-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-3-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c731a01c-ac53-4f8d-db01-08d87a9c661a
x-ms-traffictypediagnostic: SN6PR11MB3024:
x-microsoft-antispam-prvs: <SN6PR11MB3024E301DAFACF43E6765680F0160@SN6PR11MB3024.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMDMRN4yIpdmYUedhIMi2ZslfasO1MQ5VO63ufrgnaohDh5aWYG/VJZnbZRKqpieDAm906gn63NwfXGwnh4+1dTyJAU/VUTcaYZbMA7hmfT2G/j9uvnDbH2f08DJnqffNQoixxOwKfECcDMqOthPFviYyzyesM+tboS3gj0nQlp8/8aha5WsleeP4qloJJL2kAEuPUrmAla5vlJubMiWCzDmPs6y7zVlMrlJdIMkFriZcJ/05mHPAQ5b437ftMvoWW9HWpKqPiGQXcLX9jnb61OlSehWY+QQX6ekCgMVrZ16rn9BZjtOMlHVeQbXqafTWu1shHPgdfkFkCBE1TSh1yP3QojlaW9xaExA0IVBo4VfJ3+CIJDfoVbF0p1PmHWO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(396003)(376002)(346002)(366004)(478600001)(36756003)(54906003)(7416002)(26005)(66946007)(6486002)(83380400001)(66556008)(186003)(6506007)(66476007)(76116006)(66446008)(110136005)(53546011)(31696002)(64756008)(2616005)(8676002)(31686004)(86362001)(4326008)(8936002)(316002)(5660300002)(71200400001)(2906002)(6512007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Z7DoZ8lnyLf4i5/MPkyQpKnRTe+twTygGNNuvab5q1+rBW4Y7rFJnQPOuqI/NUEfNVYZA/FnGb/Pk1jRP1O2Ih14erybL7aWyVbqMj0nN8DnVTGq7VS01qBEZX/COJEqF98j7cjt2ODQ4oEAXOqMxZANwAbrxjvJEQdmiUxFykLMdfLfYgsU5tIpdeSLEa0SAIzKUuhNj34BLnnODu9hcLc1bnzvpq1jP6U2OH6cnbNtzwE8BHHITZx0ZFcEhqMibZt0zcfDCZSTeY3Fj5d4Rx9QDxMvmRpIdg/z5jM8g9F36LMi9RaJ7Hg+qD+dKc+sHb6I/eX4lCUnGiVgSUvtXZ4wT/H9Fbwuh7Mf9xKQDSg3OSZUirQMgX4Yo78GVpCwZhuZpzNq1cqhws6fxjiCehjy4cVR35/EqiBQyYezlujuk1cuNLspOar2xksbfQxwQWnGJjSkERLlVLoFqqJvtP52COWfZcJHoZyw/QgnMTrjcoBAlojgwBbwjEPtw2WSu3ttj2fCmPD17LNLDOHLcWbEGaQtY+b1KDpmYgB2SXhuvDyV7kAeT/1Ub6tJb17yUPnqS6rDBmPh6ICbVvML89Dck0YkUOZogg1QTtAXMVILHm27EZADtLY8eEwExpUAQ/xClXR1/CxYrZrBe+n2XQ==
x-ms-exchange-transport-forked: True
Content-ID: <EFDFEC9D7E2CAC49B16614A6F375CF6A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c731a01c-ac53-4f8d-db01-08d87a9c661a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 17:19:01.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbPM0YkmaqkSu0SRQkW1IoAY+fWc+cpY/PlVKid6oODrXxIW7eTXOsaDat5e6hZBOEA8trF2xuPWMn3uPS5B9dTYZMOGca8Pnd3BULWUrXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_131906_218300_2AC1DE94 
X-CRM114-Status: GOOD (  24.27  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason, YC Lin,

On 5/29/20 10:36 AM, Mason Yang wrote:
> JESD251, xSPI profile 1.0 table supports octal DTR mode.
> Extract information like the fast read opcode, dummy cycles for various
> frequencies, the number of dummy cycles needed for a Read Status
> Register command, the number of address bytes needed for a Read
> Status Register command, read volatile register command and write
> volatile register command.
> 
> According to BFPT 20th DWORD of octal maximum speed, driver get it's
> specific dummy cycles from profile 1.0 table and then could update
> it to device by their fixup hooks.
> 
> Since driver get octal DTR read opcode and then set read settings,
> expose spi_nor_set_read_settings() in core.h.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.c |   2 +-
>  drivers/mtd/spi-nor/core.h |  16 +++++++
>  drivers/mtd/spi-nor/sfdp.c | 106 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 1ab4386..3799417 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2204,7 +2204,7 @@ static int spi_nor_check(struct spi_nor *nor)
>  	return 0;
>  }
>  
> -static void
> +void
>  spi_nor_set_read_settings(struct spi_nor_read_command *read,
>  			  u8 num_mode_clocks,
>  			  u8 num_wait_states,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7a36b22..a33f807 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -191,6 +191,12 @@ struct spi_nor_locking_ops {
>   * @size:		the flash memory density in bytes.
>   * @page_size:		the page size of the SPI NOR flash memory.
>   * @octal_max_speed:	maximum operation speed of device in octal mode.
> + * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
> + * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
> + *			command.
> + * @rd_reg_cmd:		read volatile register command for xSPI device.
> + * @wr_reg_cmd:		write volatile register command for xSPI device.

Can all the volatile registers be accessed with these commands?
The profile1.0 table lacks description.

> + * @dummy_cycles:	dummy cycles used for various frequencies
>   * @hwcaps:		describes the read and page program hardware
>   *			capabilities.
>   * @reads:		read capabilities ordered by priority: the higher index
> @@ -214,6 +220,11 @@ struct spi_nor_flash_parameter {
>  	u64				size;
>  	u32				page_size;
>  	u16				octal_max_speed;
> +	u8				rdsr_dummy;
> +	u8				rdsr_addr_nbytes;
> +	u8				rd_reg_cmd;
> +	u8				wr_reg_cmd;
> +	u8				dummy_cycles;
>  
>  	struct spi_nor_hwcaps		hwcaps;
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
> @@ -420,6 +431,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>  
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
> +void spi_nor_set_read_settings(struct spi_nor_read_command *read,
> +			       u8 num_mode_clocks,
> +			       u8 num_wait_states,
> +			       u8 opcode,
> +			       enum spi_nor_protocol proto);
>  void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>  			     enum spi_nor_protocol proto);
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 4d13f66..27a4de4 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -20,6 +20,7 @@
>  #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
>  #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
> +#define SFDP_PROFILE1_ID	0xff05	/* xSPI Profile 1.0 table. */
>  
>  #define SFDP_SIGNATURE		0x50444653U
>  #define SFDP_JESD216_MAJOR	1
> @@ -27,6 +28,27 @@
>  #define SFDP_JESD216A_MINOR	5
>  #define SFDP_JESD216B_MINOR	6
>  
> +/* xSPI Profile 1.0 table (from JESD216D.01). */
> +#define XSPI_PF1_DWORD1_RD_CMD                  GENMASK(15, 8)
> +#define XSPI_PF1_DWORD1_RDSR_ADDR_BYTES         BIT(29)
> +#define XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES       BIT(28)
> +#define XSPI_PF1_DWORD2_RD_REG_CMD              GENMASK(31, 24)
> +#define XSPI_PF1_DWORD2_WR_REG_CMD              GENMASK(15, 8)
> +#define XSPI_PF1_DUMMY_CYCLES_DEFAULT		20
> +#define XSPI_DWORD(x)   ((x) - 1)
> +#define XSPI_DWORD_MAX  5
> +
> +struct sfdp_xspi {
> +	u32 dwords[XSPI_DWORD_MAX];
> +};
> +
> +struct xspi_dummy_cycles {
> +	u16 speed_hz;	/* Speed MHz */
> +	u8 dwords;	/* Dwords index */
> +	u32 mask;	/* Mask */
> +	u8 shift;	/* Bit shift */
> +};
> +
>  /* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
>  struct octal_max_speed {
>  	u8 idx; /* Bits value */
> @@ -1117,6 +1139,86 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  }
>  
>  /**
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:		pointer to a 'struct spi_nor'
> + * @param_header:	xspi profile 1 parameter table header
> + * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_profile1(struct spi_nor *nor,
> +				  const struct sfdp_parameter_header *header,
> +				  struct spi_nor_flash_parameter *params)
> +{
> +	struct sfdp_xspi pfile1;
> +	u8 opcode;
> +	u32 i, addr;
> +	size_t len;
> +	int ret;
> +	static const struct xspi_dummy_cycles dummy[] = {
> +		/* {MHz, Dwords index, Mask, Bit shift} */
> +		{ 200, 4, GENMASK(11, 7),   7},
> +		{ 166, 5, GENMASK(31, 27), 27},
> +		{ 133, 5, GENMASK(21, 17), 17},
> +		{ 100, 5, GENMASK(11, 7),   7},
> +	};
> +
> +	if (header->major != SFDP_JESD216_MAJOR ||
> +	    header->length < XSPI_DWORD_MAX)
> +		return -EINVAL;
> +
> +	len = min_t(size_t, sizeof(pfile1),
> +		    header->length * sizeof(u32));
> +
> +	memset(&pfile1, 0, sizeof(pfile1));
> +
> +	addr = SFDP_PARAM_HEADER_PTP(header);
> +	ret = spi_nor_read_sfdp(nor, addr, len, &pfile1);
> +	if (ret)
> +		goto out;
> +
> +	/* Fix endianness of the xSPI 1.0 DWORDs. */
> +	le32_to_cpu_array(pfile1.dwords, XSPI_DWORD_MAX);
> +
> +	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
> +	opcode = FIELD_GET(XSPI_PF1_DWORD1_RD_CMD,
> +			   pfile1.dwords[XSPI_DWORD(1)]);
> +
> +	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_ADDR_BYTES)
> +		params->rdsr_addr_nbytes = 4;
> +	else
> +		params->rdsr_addr_nbytes = 0;
> +
> +	if (pfile1.dwords[XSPI_DWORD(1)] & XSPI_PF1_DWORD1_RDSR_DUMMY_CYCLES)
> +		params->rdsr_dummy = 8;
> +	else
> +		params->rdsr_dummy = 4;
> +
> +	params->rd_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_RD_REG_CMD,
> +				       pfile1.dwords[XSPI_DWORD(2)]);
> +	params->wr_reg_cmd = FIELD_GET(XSPI_PF1_DWORD2_WR_REG_CMD,
> +				       pfile1.dwords[XSPI_DWORD(2)]);
> +
> +	/* according to BFPT 20th DOWRD to get devices dummy cycles */
> +	for (i = 0; i < ARRAY_SIZE(dummy); i++) {
> +		if (params->octal_max_speed == dummy[i].speed_hz) {

Why do you introduced this restriction? The dummy cycles fields themselves
can be used to determine if a speed is supported or not. A value different
than zero for the dummy cycles fields means that the corresponding frequency
is supported.

Cheers,
ta


> +			params->dummy_cycles = (dummy[i].mask &
> +				pfile1.dwords[XSPI_DWORD(dummy[i].dwords)]) >>
> +				dummy[i].shift;
> +			break;
> +		}
> +	}
> +	if (i == ARRAY_SIZE(dummy))
> +		params->dummy_cycles = XSPI_PF1_DUMMY_CYCLES_DEFAULT;
> +
> +	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +				  0, params->dummy_cycles,
> +				  opcode, SNOR_PROTO_8_8_8_DTR);
> +out:
> +	return ret;
> +}
> +
> +/**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:		pointer to a 'struct spi_nor'
>   * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
> @@ -1217,6 +1319,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  			err = spi_nor_parse_4bait(nor, param_header, params);
>  			break;
>  
> +		case SFDP_PROFILE1_ID:
> +			err = spi_nor_parse_profile1(nor, param_header, params);
> +			break;
> +
>  		default:
>  			break;
>  		}
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
