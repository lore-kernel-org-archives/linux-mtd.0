Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA05C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:07:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4567220872
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 14:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pi1FpTzj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2ev0qKAg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gu3JY99Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4567220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S1f9qu7v66HgK59u/b3g1sGbXoIToVNoShjm2bd04BQ=; b=pi1FpTzjxqCVMoGlJX4s0QQUX
	f7PVdx5siovMk0Lx5Cugow5jEMaDpjkP5pCfEmfnAfKWbCtzWLafEi95T01/SpqCozVTOp8DRD1CZ
	PlS1xnd3XSSyRxZQBwd287T3DTt8yevUxaE1zkjW/o4F9fz6A4LoSWV8GZEHKgioM3MS4cmlCV99s
	NyOo5mg0cI8JQqMiv++2t+kVPy/bRlckYqKuZkO4sb5L1mJKyDUbCEGm/5g+pZP9aBnKFl9TtsTDQ
	IQW/0J+8YOXBSdNtHQS6zjA7KS0qnR2m9AXagzMhRtx/eYzlt5Br5OjWZWameph6K0trGI9/tnEf/
	n6s41LNwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzEi-0008UY-K3; Thu, 01 Oct 2020 14:07:08 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzEe-0008SQ-1Y; Thu, 01 Oct 2020 14:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601561224; x=1633097224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JyAzKFrrQ+dS8KoTfqq62BPpyQFHY9kGh+E/fvQ5YDs=;
 b=2ev0qKAgSvG2Wr4c7rauq4i+a9FkGSWcT3kBQGAMp/EhuNqcondLynNO
 XFh2bM7XTTYy72bu7gsruNmnCZQEBmD8qFcPRKlZu3AlzZyKpn3E2BBMe
 FAN2s6Pm893L2mWkjlNwqd5lO9gizzUDySGuoOfwDN02g8hGOfnJmoKpw
 Y/dOIO+iP157QNGgwt2/sJMW3xi7HKK03RklluBUwxgaDyjm5nYIV2TMf
 b1ha9MYfLG1vr4hLLoHTnfRLfGLFOFF9onE1xhDVs91mWc4SBbPEk7CSY
 JuNfpKiuvkq8FKfOTYpd0axEpjG2Fhonf5zsJaWjBwWUsIoFe8FKdRxnv A==;
IronPort-SDR: +FmVu+k/7cU+zhMh/RW5ny7reimyHQBW6uGXDihl5Tyxwv6iYmEj9yMpLsjLE0F6CXXPgPB0zM
 yA/GfJDFsaBigzXGs1E61rEgyC1op8grRR6MsfzBbooC+TUbwqCQGjfi6OqMH2ZRTabPRFhngt
 6hfJhkwHDryQsF23R/o8pk7VtzmlEzVdohRU2B1ztCKEDsoKXE/Q87gpA9PbrkDWSGQ1TTT7Hy
 82TfTid1xAo6h1sOZS1HvnNVFtNv8jvf8qGVQNYS6HTUVsbTuuIZKC0ggBb35elH7vh9a+4ROi
 fzY=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="93080388"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 07:07:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 07:06:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 07:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ff0HtnNEOc24X+CfzSYZ7WIFkx+SVbbZrltxieSjt/YYATnL8jYd/2cyL5rRKuKbYhr6qZXVNJ7qiL8JDSG8pnM8MPKJOKXsztuHbYjbsQEg3E980KqLNg0WNYzVGnVHwnfeirojT70ubnBFOeF2eI5o8VUPSZo9wpZmCeoqinOdZINFIJyFHtXbuOwEv1TdFo51RwAfMGHzSfAVugKgH7QN5VvJ1/cUQL3xi8OQp6pqoLOHknKmoRNipH+ZoyrQfRvcvCPrjdVTFjvfc0kOgsuD/ZWKBPs23Ex0vwCz3ah8lSFTN+Btux+MbgnkTpMy0l/1D39k5Vv7j88+a0uISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyAzKFrrQ+dS8KoTfqq62BPpyQFHY9kGh+E/fvQ5YDs=;
 b=GyHpdaUyDjB7G1+/r2Oxz/gWpZ8U0aSD+pEIS5psdFSSUisgcOVDjpC3AE9kIrC1ATSNzM7j7eEcTZl4CZHvqrOtAFDZUv3QP/q5ifk0RKXMOsobahCv8O2Y8sJg9/QrTYk7D7sDE37q73xlVypiq/WAynzUGcpNDNxwzAWUnIl3bp0gAyyjDU6iU5KA/qz4dM1nQagnlfislx+FY1sCY67doCNynKVD57bJr+8p9uH1kRS67ve76Vc7dEyjOWE2pQoMFPjgWy2TjaxiG7TOXqlVD+qDL7tjjJ2O1msJta1ZyB3/qZCdKc/79UcD7SZQGT11iQxi/oyEcMZS+7I2kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyAzKFrrQ+dS8KoTfqq62BPpyQFHY9kGh+E/fvQ5YDs=;
 b=gu3JY99Y2ClrH/SHWD6lk6IuroC7hUR/xuyM1M3Ou3IHZMFR+2OCc4gZUBvhW+Cl7Hfazzb+mIFqDsG37A9YvP269tX5tAe0jFwNM6PZIN1fE9iS+Uf8BeNpCw0/gyc+5DcsniqMtH+w0Cv9pxsUzYm1GYhYciCwbUt2zCWy0xk=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1257.namprd11.prod.outlook.com (2603:10b6:3:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 14:06:58 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 14:06:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global SNOR_F_HAS_LOCK
Thread-Topic: [RFC PATCH 1/2] mtd: spi-nor: atmel: remove global
 SNOR_F_HAS_LOCK
Thread-Index: AQHWl/wfolQmpEhmZUmGKx8TlQY45g==
Date: Thu, 1 Oct 2020 14:06:58 +0000
Message-ID: <5eb8f95c-e9d5-6043-fb7d-bffcda044262@microchip.com>
References: <20201001122828.23186-1-michael@walle.cc>
In-Reply-To: <20201001122828.23186-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa1a74fd-3b96-4123-0521-08d8661342ce
x-ms-traffictypediagnostic: DM5PR11MB1257:
x-microsoft-antispam-prvs: <DM5PR11MB1257B5BAEC5CF329F2ABAD4DF0300@DM5PR11MB1257.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rYdOGS2Sy0iGUWCRNYMgSh5/dBTc0PegDpBMN6hnmKB/7teX9uHA9vEdXWgoUQ4QufzFH53pJRqXveDNB5zWnGJvOds0GS9SlrCViE46/fc1P2Gw71/tzLJtGuDyCZh+ABYFSwZoYpjiXi/sFO2PsjZtVNrLcTG75EjSSpGyy6yIq+qt9oJxqYbwaEc+v8jCZQt5ao0kQFijNTdmEPNiq/dxC8pH94XfDfStdU8cMakGzz3Zr7mec0WGXzv13Yy8SXRy/KpCBH3NIfY2MHbt0g57ssZR+v+B7efxJozmAeqW8IQEOJYcK0aVrUfS6I37w4GKePzRzYvEvJOWI2Oks3no+eTmaaQTiG2cAbVtmvdrAXbSWGZd5vWJYiCsuQfcrG3AVzFPNzSc2V75B5EZL4ybEtQZimABFgpdzs1R6t4RlrKPjZ1aER2nt8cS9cthz5uTKX5k61MJB5LpiCIYV7Hi714hZXGn3IRpvOmYY2DI8Yeq6Nfc0ED/RBDMj/E2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(136003)(376002)(396003)(186003)(83080400001)(6486002)(83380400001)(91956017)(64756008)(66556008)(66476007)(76116006)(8676002)(66946007)(26005)(4326008)(8936002)(66446008)(6506007)(53546011)(966005)(110136005)(36756003)(86362001)(31686004)(31696002)(5660300002)(6512007)(2906002)(316002)(54906003)(71200400001)(478600001)(2616005)(15398625002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1+n3WJ9h4HwbvbBTfxyAUGxQCwrsPdl2ixV0fvnXByqc728IEahEf62cJlJ0E+s1XHwaTtzZWwCMo1bYwoZiRy3HraM0dr9HlQfo1BmhJIo+zoLTbTDMWeI61TqibBPI973gYWveHCYmYwtFkoFsrvvgBw47BB4Wfao50SQDNnk9vTdNgq8AilzXxKnpSvFZVY7rqcuCV9dQ982hlJ4Tcbi/6w7smVAKiJHcA6fdWPP/HYUetWFTpSOuxhNzoh+eE24jw2oQDCROXCsTXndf38Ml8Pm2A89rlBbkEvdOYb65iI9VhVYW0n+/ll6xpDEaSkxVNTRYN4if3mplFAiE7F7R3mQOiiSVkuV1GiiTQUTOK4xUe1Aph5oAM4ORqNHbf3h9vLTb7Hj3+N7TK6wGyoQUWrwJYMlE8X/O+dbAN79DYBw7p9Ni37S9R9u2HUJWvP6ye2js46/pGRcEIMWMIjmSm1FpgqrlYO0LJUgQVdEfJ7pUTqcPVUA4nQP3Rppn5JubfSmQ8GozW80xDGKzr4A7vo++JGO3o3BKc9uJo3m0m6FauoLg4phNShN3VuTmJeXJW97dcGChAGssAPHr89TLX6zmHcXP+WTMDFHFRKDYIDYnYuX4kzTvAu9vKlhonI1XNfX4iMnAzKZyo7YpOA==
x-ms-exchange-transport-forked: True
Content-ID: <242952F3BEE92D4FA24F74B8DF4272CA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1a74fd-3b96-4123-0521-08d8661342ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 14:06:58.2815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEg0WO0ET1tVwSOMdxxFu77xL05gB94eD2E3TA4n164qBOR8MGrh1M/SVVp+52+cbG+DfALuOWdNZfIIAxShewmF25VrKmsoihiqS8QU6kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_100704_239103_D7323B87 
X-CRM114-Status: GOOD (  24.31  )
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
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/1/20 3:28 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This is considered bad for the following reasons:
>  (1) We only support the block protection with BPn bits for write
>      protection. Not all Atmel parts support this.
>  (2) Newly added flash chip will automatically inherit the "has
>      locking" support and thus needs to explicitly tested. Better
>      be opt-in instead of opt-out.
>  (3) There are already supported flashes which don't support the locking
>          scheme. So I assume this wasn't properly tested before adding that
>          chip; which enforces my previous argument that locking support should
>          be an opt-in.
> 
> Remove the global flag and add individual flags to all flashes
> which supports BP locking. In particular the following flashes
> don't support the BP scheme:
>  - AT26F004
>  - AT25SL321
>  - AT45DB081D
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/atmel.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 3f5f21a473a6..49d392c6c8bc 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -10,37 +10,27 @@
> 
>  static const struct flash_info atmel_parts[] = {
>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
> -       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K) },
> -       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K) },
> +       { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },

after a quick look in the datasheets of these flashes, I suspect that
what we have now in the SPI NOR core for SR locking does not work for
them. They probably supported just "unlock all", clearing all the
BP bits. Anyway, different problem.
> 
> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K) },
> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K) },
> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K) },
> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },
> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },

this one does not support BP locking: https://www.adestotech.com/wp-content/uploads/doc3668.pdf

> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },

neither this one: https://datasheet.octopart.com/AT25DF321-S3U-Atmel-datasheet-8700896.pdf

> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },

nor this one: https://www.adestotech.com/wp-content/uploads/doc3686.pdf

> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },

nor this one: https://www.adestotech.com/wp-content/uploads/doc3680.pdf

I stop here.

> 
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
> -       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
> -       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
> -       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
> +       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
> 
> -static void atmel_default_init(struct spi_nor *nor)
> -{
> -       nor->flags |= SNOR_F_HAS_LOCK;
> -}
> -
> -static const struct spi_nor_fixups atmel_fixups = {
> -       .default_init = atmel_default_init,
> -};
> -
>  const struct spi_nor_manufacturer spi_nor_atmel = {
>         .name = "atmel",
>         .parts = atmel_parts,
>         .nparts = ARRAY_SIZE(atmel_parts),
> -       .fixups = &atmel_fixups,
>  };
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
