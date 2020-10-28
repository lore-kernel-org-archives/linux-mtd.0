Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627D5C4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:46:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC12E2469E
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:46:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sgi+Z2G8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jh+QAHA1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RMqTY6rv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC12E2469E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=enuUgL/MIEagiEmCGqsZmpNlYNZ0LLepDHfcm4E0sqc=; b=sgi+Z2G8gZzOVBEQ3LC11Rqzt
	8gs9x/+yc9RrgHpcf0thk2zfosMlzTlIXRqmy0FFlwVzOVJC/X04K+PH5nO5RutftwNp+DL+siyhY
	QAkyxcae88LBgEgeStxO5yjjjm75/uOtvn4wqrm5SpfRC7nMkWB4HtOQDa5tULCyVbAfgJGTnuA7O
	v5Tkjm27N75H+7XspQ1KkxT2drW83wdNERaC4k5qCo9NN7lvUouXHo7gsTA0SZxJWE8k/20o2iLD3
	mHXzxkqCFDAYiXqX5rECEDq5rbKXOVAVjd0cSsiGwaF9/UmWbyCI+IP5hEQqsIYYSOAf1DD4IZ8mp
	98V0AN7YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXi1U-0005Ju-Ec; Wed, 28 Oct 2020 09:45:40 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXi1R-0005IS-0h
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603878336; x=1635414336;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ldqSJLKSm1gN+2qq9QgNLKK56VR4x8Eu2c80+ohOxAI=;
 b=jh+QAHA1sgqmEwBJsuyJnVlE2AVZAJNIIvMza3Lp764Snxmn2Xt+NwmV
 KTFgHjf4/OX289PTfBDDK9LnouJkm3VPd8oWgqpwT7IcOaeJjpwJRXu2D
 hZCLHv6LMVU+7PAdEFTi5lq2dMLQFlqFNyko1sXKtQfepv3ssinQsUXAL
 fHx+ggipG2hBdpTR938OFZJxtP3y/V9AGgLc3+3rwbD6TEeWdCWsfqmeX
 CFjLGWH5OybkwzODxmb75LUyGThqCZdl8S530Ene+omMq9soVuR2GZhKg
 K0H2yI3W+Z5V4OEZGT4/Y/KJd/7Wmgq4hXFnVTQQAaLBSlEJJi7x6Eaiy g==;
IronPort-SDR: z+vPs9i09rrttTCYnWnQm6jZbQ75TrtPqFpCpMle3sxhTMgIpKv3rMiiIb+0uhBJuGFpATosYm
 81/h0SJtbw21g50Xu2cI9QrCho6H+hDd04sHa6HIYbq4csuyf/MjucbaX1K2bHeKGMNoQTTJFe
 rJLS98Y9ZUnFyP4kqkSsTXfVb0Bi8KTxqqn4IMmjaHA++7FCHEOO1hgZzob1GSEmFC3KJC0KHw
 juHc5lBUp+6Fhht0VA3KTPv9vS6BVgn6M+PavnE38NHcqzkDg+sVz6iDJW8Tz2U/Wozt5XDqWr
 BSk=
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="31497578"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 02:45:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 02:45:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 28 Oct 2020 02:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSkZ6O0QecFirBdZHMfkVwUn2Q+L32WMllZ7Lv7p7tDVC4h6yuZUrm5mC9QUiDnMn6rVB9E5rsN9p3wz6d+2btgul2parlLUzZdAFImha4HJd7xsgwYk5kMx6MvZFrNqVdTbNreYQ6mEduxEb0HGv6ySKn1DDb6Rbg6haCuvvtMeQlkjMQNMsh2WQdaD1nJXzPvnNQIQ1pimt9lc0G8meexzVyRUgx7VpYbMsBmeGUOqdneDv0iYjg2+SSPgWKKIGZzl1peS26pY9dzLCZH3CYzlcTdVU/CrXmFxdRTF2IDzmW6uHnivjF+l0wfLwqHek6VH5CdQgPSub0k1bAelDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldqSJLKSm1gN+2qq9QgNLKK56VR4x8Eu2c80+ohOxAI=;
 b=G5c4uJas+I1sWeyvbW2t04XwK+6z/M+ipKYEDiodhMSHo1ed5ZW2h7J1PNEcG/Ztak/tbg0gYxMdJOZ1VNMwoUVI8A+5MVW27e8o7VtBH7WcRQDncYnW2lSL4NkLVQ3lDTdWRR4oPE16VqooD28Fc4m9Ix9KlqV7e2uJLzf0iGP6AdckruhgMCDFTtIsyfy4uYmFk64Lr5f42K61mgilLsn03lYI+d6PTJyVl683POD1q2y6h1QMAj3Cgzz89wFPhMX9VJ3UvcSiYN6aWuJp6gZJ7vz3jpfaPnStzX8i/3q2QOquYXnyqAxdiLvbqutT0NkW1ynC7hprBGubEtcu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldqSJLKSm1gN+2qq9QgNLKK56VR4x8Eu2c80+ohOxAI=;
 b=RMqTY6rvKebllZ1SfTTWpTAWMMzi64i56wqv8/z4NrA392R0tPY/SvCkIxP7G7BICOuAq0bCTLJ4RAvMxHAR9pZKRJ4G+7kOelvrGQ1mOkzjfEx8pAL3BSIAV3XAW6/NjSzfXs/De+n0SXv5ZqFNShnY+lGLWS0UL9x4NXtvJt8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2878.namprd11.prod.outlook.com (2603:10b6:805:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Wed, 28 Oct
 2020 09:45:31 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 09:45:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 3/7] mtd: spi-nor: sfdp: parse command sequences to
 change octal DTR mode
Thread-Topic: [PATCH v4 3/7] mtd: spi-nor: sfdp: parse command sequences to
 change octal DTR mode
Thread-Index: AQHWrQ8R5RqJKCpNnEOs1eXdDu8vbg==
Date: Wed, 28 Oct 2020 09:45:30 +0000
Message-ID: <ef36ad59-8081-4d0c-f4aa-57ef66a602f1@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw>
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
x-ms-office365-filtering-correlation-id: 4d06b3f7-a404-4406-7c9b-08d87b26357c
x-ms-traffictypediagnostic: SN6PR11MB2878:
x-microsoft-antispam-prvs: <SN6PR11MB28784732280AB66CE57ACCB1F0170@SN6PR11MB2878.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaI7pqBp5zSJa4P3xItyO3nfYLdM69dX7+JGtsy9j7S8H9rT4U4ZfzW3Z0/vJ9BrDtKsEzckXclSoxyQ67S7wPOs9SKuK0UZf8hSMza+FpsAO37WUxJtR3vMVTGYJFoW/LzK7p0QDjLPfcyS0yGVLP+eDkzv9FDMlXtVQ8m3eJf2IzrHfWag1EUR1K4H+vx8s6wEE+mVXQKsfeQCQp74eE3Q/dBqfjEcmaqmFEhPf/9DYHy/0y9B7DpJArKgoyXIRlGODMgRxAO+KOkS+Lcip8kgleO5OiNk59kwFgXNimgH2egLpy67qxgHvQ5TdoSXVCdNmNiKqhLpGT9AMOJ726rxu9HimtRnaycYdgWVfXSXjr0JuCpnhAX+4BMZG6b/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(39860400002)(346002)(376002)(26005)(31696002)(66556008)(7416002)(66946007)(8676002)(66476007)(66446008)(64756008)(53546011)(83380400001)(316002)(4326008)(478600001)(8936002)(76116006)(6512007)(6486002)(6506007)(2616005)(186003)(71200400001)(5660300002)(54906003)(110136005)(31686004)(36756003)(86362001)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: s+cH+7UxVf+If7fk9RjLXKo/+KHnNeBluW/0Rt2vTtfywq1RtCECqxlm8GOaq1SoE4CD6+gEAfNRza6dJUw+8EKZdduvrxeTHJDqNt2/FYyl5pyUFxXTvRUecvLOO6DWL7OaUPRiA33ehT3pXYcaZ1/5gm4tMod7cd7a95RrSifPDZguLWHgWiDS74sWh6iLN94Ps7TlSb2OigGCSS5tVPSO+goplDmwKZYxbgYSJA1ABIZ1TbHW8Cxce7jyv1qwQeKinzTX+NC6GcEmr5nSM54nkkMjcwd2Zq9wor4yC/nymixoCYR5LBRP/SVMTIbX+Tj/4IsGgsIuI2MFRPYIHCl6pQwH5kjGTz09EZpSKgAtOkAp/FNzY+r5VPIQrJrQhQE6U0mrvEcyXEgekSPo0gu08+t9sgaBnKxqDq8VKz7f/S1wnykiTiTc64chSzeBRawK5fbG8VzHb+hEZTxF73DKbtC1b5S0g8DLL6TUlXtybnCRyko+7nmzoKvKQin21sA5MbHA9I+sGptSq38nFXbl2fOyYgDFj3sYFfO5W31xlqjVxgXfV/5RYhW7jLM3kopgSDObP6Y9zvY09NrZ7be9rZd9l5hLSPThqz9BlEPLct4nVFmqd+l83FWRUa0gVfryC+gZ2qy1ubrx6hryaA==
x-ms-exchange-transport-forked: True
Content-ID: <142BA76BB48DDB4382EA26B7B29C8911@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d06b3f7-a404-4406-7c9b-08d87b26357c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 09:45:30.7816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fB1nj4yvccQt2tKxf4h9QjFEPnY9FcjoIPV/PzXOjXUkPreFgguEBQJQsm6AvFtF7cw0/oOTkxbxJ/OYyEjnqsDF1vAWHqoWtKWov7RREnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_054537_453724_498B6F01 
X-CRM114-Status: GOOD (  27.75  )
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
> A set of simple command sequences is provided which can be executed
> directly by the host controller to enable octal DTR mode.
> 
> Each command sequence is 8 per byte for single SPI mode.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  drivers/mtd/spi-nor/core.h |  20 +++++++++
>  drivers/mtd/spi-nor/sfdp.c | 104 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index a33f807..8de7f53 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -183,6 +183,23 @@ struct spi_nor_locking_ops {
>  };
>  
>  /**
> + * struct cmd_seq_octal_dtr - command sequences to change to octal DTR mode
> + * Each command sequence is 8 per byte for single SPI mode.
> + * @len:	commmand length of each command sequence.
> + * @opcode:	command code.
> + * @addr:	address offset to device.
> + * @data:	data write to device.
> + */
> +struct cmd_seq_octal_dtr {
> +	u8 len;
> +	u8 opcode;
> +	u32 addr;
> +	u8 data;
> +};

You define seven bytes for the command sequence, while the table defines
eight bytes: first byte indicates the length of the sequence, and the
following seven bytes are values to be output by the controller.
How did you choose this cmd seq organization? The standard refers to the
7-byte sequence as "byte values to be output by the controller", it doesn't
indicate at which offset the opcode, addr and data are.

> +
> +#define CMD_SEQ_NUM	4
> +
> +/**
>   * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
>   * Includes legacy flash parameters and settings that can be overwritten
>   * by the spi_nor_fixups hooks, or dynamically when parsing the JESD216
> @@ -205,6 +222,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @cmd_seq:		command sequence to change to octal DTR mode.
>   * @quad_enable:	enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:	converts an absolute address into something the flash
> @@ -232,6 +250,8 @@ struct spi_nor_flash_parameter {
>  
>  	struct spi_nor_erase_map        erase_map;
>  
> +	struct cmd_seq_octal_dtr	cmd_seq[CMD_SEQ_NUM];
> +
>  	int (*quad_enable)(struct spi_nor *nor);
>  	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>  	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 27a4de4..ef19290 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -21,6 +21,7 @@
>  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
>  #define SFDP_4BAIT_ID		0xff84  /* 4-byte Address Instruction Table */
>  #define SFDP_PROFILE1_ID	0xff05	/* xSPI Profile 1.0 table. */
> +#define SFDP_CMD_TO_8DTR_ID	0xff0a  /* Command Sequences to Octal DTR */
>  
>  #define SFDP_SIGNATURE		0x50444653U
>  #define SFDP_JESD216_MAJOR	1
> @@ -49,6 +50,19 @@ struct xspi_dummy_cycles {
>  	u8 shift;	/* Bit shift */
>  };
>  
> +#define CMD_TO_8DTR_LEN			GENMASK(31, 24)
> +#define CMD_TO_8DTR_OPCODE		GENMASK(23, 16)
> +#define CMD_TO_8DTR_1_ADDR		GENMASK(15, 8)
> +#define CMD_TO_8DTR_1_ADDR_DATA		GENMASK(7, 0)
> +#define CMD_TO_8DTR_4_ADDR_MSB		GENMASK(15, 0)
> +#define CMD_TO_8DTR_4_ADDR_LSB		GENMASK(31, 16)
> +#define CMD_TO_8DTR_4_ADDR_DATA		GENMASK(15, 8)
> +#define CMD_TO_8DTR_SIZE_MAX		8
> +
> +struct sfdp_cmd_to_8dtr {
> +	u32	dwords[CMD_TO_8DTR_SIZE_MAX];
> +};
> +
>  /* Basic Flash Parameter Table 20th DWORD, Max operation speed of device */
>  struct octal_max_speed {
>  	u8 idx; /* Bits value */
> @@ -1219,6 +1233,91 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
>  }
>  
>  /**
> + * spi_nor_parse_cmd_to_8dtr() - parse the command sequence to octal DTR
> + * @nor:		pointer to a 'struct spi_nor'
> + * @param_header:	command sequence to octal DTR parameter table header.
> + * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_cmd_to_8dtr(struct spi_nor *nor,
> +				     const struct sfdp_parameter_header *header,
> +				     struct spi_nor_flash_parameter *params)
> +{
> +	struct sfdp_cmd_to_8dtr cmd_seq;

you'll need to kmalloc cmd_seq because spi_nor_read_sfdp expects a DMA-able
buffer.

> +	u32 i, j, addr;
> +	size_t len;
> +	int ret;
> +
> +	if (header->major != SFDP_JESD216_MAJOR ||
> +	    header->length < CMD_TO_8DTR_SIZE_MAX)
> +		return -EINVAL;
> +
> +	len = min_t(size_t, sizeof(cmd_seq),
> +		    header->length * sizeof(u32));
> +
> +	memset(&cmd_seq, 0, sizeof(cmd_seq));

no need to set the contents to zero, cmd_seq will be overwritten with
the values read from sfdp.

> +
> +	addr = SFDP_PARAM_HEADER_PTP(header);
> +	ret = spi_nor_read_sfdp(nor, addr, len, &cmd_seq);
> +	if (ret)
> +		goto out;
> +
> +	/* Fix endianness of the Command Sequences to octal DTR. */
> +	le32_to_cpu_array(cmd_seq.dwords, CMD_TO_8DTR_SIZE_MAX);
> +
> +	memset(params->cmd_seq, 0, sizeof(params->cmd_seq[CMD_SEQ_NUM]));

params->cmd_seq is already filled with zeroes, no need to memset its
contents to zero

> +
> +	for (i = 0, j = 0;
> +	     i < CMD_SEQ_NUM && j < CMD_TO_8DTR_SIZE_MAX; i++, j += 2) {
> +		params->cmd_seq[i].len = FIELD_GET(CMD_TO_8DTR_LEN,
> +						   cmd_seq.dwords[j]);
> +		if (!params->cmd_seq[i].len)
> +			break;
> +
> +		switch (params->cmd_seq[i].len) {
> +		case 1:
> +			params->cmd_seq[i].opcode =
> +				FIELD_GET(CMD_TO_8DTR_OPCODE,
> +					  cmd_seq.dwords[j]);
> +			break;
> +
> +		case 3:
> +			params->cmd_seq[i].opcode =
> +				FIELD_GET(CMD_TO_8DTR_OPCODE,
> +					  cmd_seq.dwords[j]);
> +			params->cmd_seq[i].addr =
> +				FIELD_GET(CMD_TO_8DTR_1_ADDR,
> +					  cmd_seq.dwords[j]);
> +			params->cmd_seq[i].data =
> +				FIELD_GET(CMD_TO_8DTR_1_ADDR_DATA,
> +					  cmd_seq.dwords[j]);
> +			break;
> +
> +		case 6:
> +			params->cmd_seq[i].opcode =
> +				FIELD_GET(CMD_TO_8DTR_OPCODE,
> +					  cmd_seq.dwords[j]);
> +			params->cmd_seq[i].addr =
> +				FIELD_GET(CMD_TO_8DTR_4_ADDR_MSB,
> +					  cmd_seq.dwords[j]) << 16 |
> +				FIELD_GET(CMD_TO_8DTR_4_ADDR_LSB,
> +					  cmd_seq.dwords[j + 1]);
> +			params->cmd_seq[i].data =
> +				FIELD_GET(CMD_TO_8DTR_4_ADDR_DATA,
> +					  cmd_seq.dwords[j + 1]);
> +			break;

how should we treat case 2, 5 and 7? From where the assumptions on how
data is organized in the cmd sequence?

Thanks,
ta

> +
> +		default:
> +			break;
> +		}
> +	}
> +
> +out:
> +	return ret;
> +}
> +
> +/**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:		pointer to a 'struct spi_nor'
>   * @params:		pointer to the 'struct spi_nor_flash_parameter' to be
> @@ -1323,6 +1422,11 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  			err = spi_nor_parse_profile1(nor, param_header, params);
>  			break;
>  
> +		case SFDP_CMD_TO_8DTR_ID:
> +			err = spi_nor_parse_cmd_to_8dtr(nor,
> +							param_header, params);
> +			break;
> +
>  		default:
>  			break;
>  		}
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
