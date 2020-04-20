Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E109CC3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4B8206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 10:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJUJD0UQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lcBADGer";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ttI3qnWs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A4B8206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB4EwdWUBsavQYuUF94QilNc4hqjLlnlgy4q6jXcdRU=; b=jJUJD0UQzeitCZ
	iYk57r6pBvrpgaJRcj34edON4GB0rQwlgrozcHl1F9UFeF7BIxSyjYXuKXgcUn6lgas1GwST67UjH
	TmFiuCybiK469hvmHDaZFsDLtseMCEL9iTq92bYHH98XphnZ05rHISXWVl8nhVMXes+WxGA7K0Xzc
	rZLJ/qdtTpwcPF8ciB6Xj3iBXUIddvX8YH5PbGR8L1fWm3QbilUiC22A+T6/x7rdm8kERjMKnb8rk
	SvSWcMTqztVl2K5aoZ0eXajRMLLFN06bJSw7RNBOuhRUPwR4CaEQe3Jgg4+kh1mKtWkL2V/eh+sXt
	b2FtQPt1j/gENtQAPzzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQTVc-0007uv-TA; Mon, 20 Apr 2020 10:18:36 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQTVa-0007tr-53
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 10:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587377914; x=1618913914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dK1CMfif4/o89JRv8WtfJxIM4MQzCWyYutgloObR7O4=;
 b=lcBADGernySVHiMuJqOKbhG9meTE+uXvS/yZx6z+VEG4fvf1M2wh6e6C
 Nr2tAxpPpkHGm+8zcX8cdJzVNQQde8UyFaJ3gzUebOP6E1FCdc0BIb6Id
 vRfxL90C+djTS/nxpWo5DCJpfbAIBk87KGbaf2pUHa6BCEw5ZjqYMAxDC
 dzyjPPCO3STZoj+w/5Ad9l316BSs8NvlNLd8IcBp4UtRVr6d3IjAyfWCa
 eOXtlEBxpB25r7Hm+fCJHsS2bu2uw+HK1t4/IzcBHxCX/EDpkQyX3hGgS
 F0CJeLitec2mg7IHDc7bYaYcHDnoRIWuyjTmPVdqA+N1pwyevKE0yEyby Q==;
IronPort-SDR: D34q+Ga/+7jnnsJ3rcGgjqUqAeTjI+3LBW7Opf65yI1tIPbbd+373vLMngad9L6+DOV2uYZ2hP
 Y464U++6afBy68GaQfn99Uw2Dimfz6W0pvQIPPqDsa2J3vLQ8cIeKdNdNUfm/LBoBUdKGvANcX
 x2OqOo6ciQzq3uwHHaT1b0HKstd/ZPBqki/nObemB3xP1zm5UZP4hrpZ2JNGFgksWS2AlP70g9
 X6RQjjAyWrdBWo898JK1QGJYCK6V6uciRlRm0xc/QfgpC+lRjGHZR3a4z/Lko34w0o+MS+3YgH
 keE=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="73108988"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 03:18:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 03:18:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Apr 2020 03:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6Bfs8LG6LwpKsXiQm6CMoQAg8emw28UG6AvXxrbXonIf1H7p92kFXWYHuCsOUlbQL8b8UfaC/Wt9a49FIJ9vFabPtimgiB7ICKPSdnfjeamYG04bXDL78ZGnVqZ/crO6+hk4z4eBd08bXLhlhI6IdT3ocqg5aEEzuZphugsETptOYFDAE4Bl+yuBI1Uq+05dsp84stWC9PLO1KTGikAzbPUzWiSuRubAtE06l0nC2X7Hsa3Z+LhpJYv+IWUaEy1CJIJk8TpsMh5R/xeyl+/cvAcgyvZhaBx+m9N1F8yowcyRNbcsK7bqEKtMdXF3/2Bx8Ha96RYenSjwPzPmg5JVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i+gk7az2SYIr+IVNGWPcl3sd9aSf1Si2l0hJNr7u60=;
 b=BG34xlIzzHhgd9b1mYfYk2smjQLqxu2ig6d3Vi431XbhYlQardCASUgoI0F8gCCB2C7aoyVVFZcdjmT5RnPKPSM7Bz3QFlDOXbqNGxNC9Pvm5qpuBrqaw0pLnt5MYWIrUiOPue5C75ucFQOmMLSt0O/eXSVVVshwCcS2hk5VoCoGZfg4bUobUAMJJQ55mc2ika4N5L5Ndjd2M1RAIgICJ4FOadQ5QPN64AUvCfCEY/YCdXdJuJwzJ5BDHT6CW23+pHyG7yMfLYBPnfD+JeWdv/O8AYE0Z73hsVAbZ+EdRl5pOE9r2KJgFj3FNOzVAg+Yb3vrfFuM00qvJhWQ6NZTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i+gk7az2SYIr+IVNGWPcl3sd9aSf1Si2l0hJNr7u60=;
 b=ttI3qnWsGLqT9vHeic3/RbrbXQ3Vy0a+7an5mbBNqnTcoE2CULPJvDSGTyIiQ3M1EatVzLB8JneoojtCES5Z3jjG2jcqvsaDKhUqixMBPfTvxLVYsnfoTNI/8u+Msn/hVQ7qM0bZPGGpWJF/wsl0ND0jIhubZYUOGhwZ17y1jZQ=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4466.namprd11.prod.outlook.com (2603:10b6:a03:1c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Mon, 20 Apr
 2020 10:18:29 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 10:18:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
Thread-Index: AQHWFv0JvKPM1oUd6UaD45+u2YvC9g==
Date: Mon, 20 Apr 2020 10:18:29 +0000
Message-ID: <3664588.JgWbhVaYgF@192.168.0.120>
References: <1586939433-20861-1-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1586939433-20861-1-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ec3846a-b9a0-4390-6d80-08d7e5142c25
x-ms-traffictypediagnostic: BY5PR11MB4466:
x-microsoft-antispam-prvs: <BY5PR11MB44669A7CB1BBC000BEA981A6F0D40@BY5PR11MB4466.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(346002)(39860400002)(376002)(366004)(136003)(396003)(316002)(8936002)(81156014)(8676002)(54906003)(4326008)(9686003)(14286002)(478600001)(71200400001)(6916009)(186003)(2906002)(6512007)(91956017)(26005)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(86362001)(5660300002)(53546011)(6486002)(6506007)(138113003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OtVgT1flpqHIjde3Th/XczgwLhv3gueX38/uB9ZWKy8w2knAbrHhirK40xAlEKR9YK63Hjyz13jLsWsPSyA/FQbZhbDPRo14GAgEe0T8JKPRiPLFNwy+pvMDvpGHNxwVeQEKDAJGn/wgKTCM/ixG/cW0/24KTuAwalZ13UULobHDoIYroUId3Qp+qF5EJcSzeFRD/YhinQpHHrTC7x61CDKN39p4LzWnLFh02cUGqfZ2lDn6/yzZ7UBgGyXXqHsrt0/YKRSV9Z88BR2u8OYSeotdWZMIItV2vq/bsqxAto6y648vdBB+E2kitL8hE8vCcnMWEkVxYRd9DDufr/3J8U/tIB2rfCzvp9dek8fmOszfLjZ7oiJIJ5u6AWJ1+daBj+lDTGxVyffRVvRFRSUI3E0FceaXfuDsiZFgG1lRnbT1Iyens1l2H6Uqsme4MurGgrdHo4LVUjXuYci9ezfr8DkIj9zHFfuV8jttAzM9mLz/ofpHB3DvD+aOj4cK5yw9
x-ms-exchange-antispam-messagedata: Pb7FwvlpTHrNANdf8IhD2OizD98frwnzK0DonCwGzb0t7hkI/WjvRmUv0uAdrk4LA/6cUd6zA0NwWszEFkNtArtWNswNMPsOrpBHrZ8d+q7T5gbm1rIrckqoa1SiQWOhBR7g5BnZD2Lxfq8tCEyOGw==
x-ms-exchange-transport-forked: True
Content-ID: <09CD48442396AB42BBDB9CE6D6584372@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec3846a-b9a0-4390-6d80-08d7e5142c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 10:18:29.8161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJTWSPLNRjSEs6QWbkZC46O6rSHgvQgNPumhZVMAgB3VZyDfdsDijpQz8WZeU8zwSUpz+TeIjitgeCxHKsXuGF2k+f4t9RCH+Y3l8hXCwUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_031834_290709_0BDB76EA 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linuxarm@huawei.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 15, 2020 11:30:33 AM EEST Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Add support for Cypress s25fs128s flash. Previously the flash is
> decoded as s25fl129p1 by mistake.
> 
> Add it in the flash info list to correctly decode. No functional
> changes. Further capability of the flash will be parsed from bfpt.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> Change since v1:
> - rebase the patch on v5.7 rc1
> 
>  drivers/mtd/spi-nor/spansion.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 6756202..01640c1 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -29,6 +29,8 @@ static const struct flash_info spansion_parts[] = {
>         { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                               SPI_NOR_HAS_LOCK | USE_CLSR) },
> +       { "s25fs128s",  INFO6(0x012018, 0x4d0181, 64 * 1024, 256,
> +               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },

The flash should be named "s25fs128s1" - this would be the flavor with uniform 
64kB sectors. One should add a "s25fs128s0" entry for the flavor with uniform 
256kB sectors.

We usually don't add new flashes if they are not tested. Please specify in the 
commit message with which controller you tested the flash. The minimal test is 
a read, erase, read back, write and read back. This sequence should verify if 
read, erase and pp work fine.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
