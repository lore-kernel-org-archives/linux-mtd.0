Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D433C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5F92074B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aL6uESoW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="apxpyyZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5F92074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1P7EYiZbBhvY5JqMco2r7T2jPTc9A55HNnT5gRlPOGg=; b=aL6uESoWKy0n1a
	xZupMYN2YvkkLSODc/XngZw+thcchKD3U4P9FGNLT7XYWeS66rhjl5WfLRy0GWvmnCQ6ujgIMaRVz
	1IRgg6QLvqR7Qy3/BMvOOzQhmSueGnpeznmAFNit9dRuDmyvpNvssckI78UhU0bcMi2zY6yHSsI85
	KbFZlzmsI7Rr+Cq884adjS5yzAQ2VG2ibIUMpq2jHrseNIl1sLjZnEFtH1XVUgM2C9nkyJSb0x7XT
	CY9Wj9i2cnBWagk9ShrWoa9vxBxg8XPcDTGZCwWxGdfuK8xP70Yocq7BI6oEc5KNP/ZsfKe3CYhox
	1Xx1lul2DweBeeMaJT0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnkA-0002hS-Nk; Tue, 21 Apr 2020 07:54:58 +0000
Received: from mail-eopbgr20103.outbound.protection.outlook.com
 ([40.107.2.103] helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnk7-0002ff-WC
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 07:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHDt8niNlqkA2L3GCR1LbRZ9Dh15p6fOhNTVufUqzTMpqUH0mFTb20ineW0ohlIWiwZk4wo1EAuoJy8TI/eJAottGJX7Xt5pxKwmynmiOG3zIaUqGdcgmmxS+9Rnqkdjw38Xy6TyP5mMY74zVXB5HukNzzzmEcQrnwu8csS93jRKbCCqbMaNKKy9Dfu5c2b/krc9TgO3TdaBCb6JDRt2pxiFz1a7g/a8Nhsctlvk25Eh34F0GtYSSla67coPXlYdMjcWEfxf6SogIIVnPqW8Ld/hQcMeUOd6MQyNB+H/aIkSThd8/LWIYGW5umUZTTkFxtHyf+6DO8LU9Mr+pQC2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBYn7Gex1n1wjb77fLHyjucih50b8UZhmSn6ktmhnIs=;
 b=OzsFb9dJJm8dV2mIcThR6/e2PRFLM8SVCdYp5CDIBnwXpx4BxlNwoLGJlyEQcNQeBTZKVaLRRzKfZdF6qCEra7WqBnm0sAN4UdcCoeD+bq60FBr4paj3ApYwpLYAABuHjypwP1EqWl+tKa3GqWsZSmRQ6nZnpFLimidtCFs1TX/213QCaX4bAq1KDSQlYFda12AnfGBMw7vevVNlZiEifuxPFnAepek1u/jysf6IOnJ84p8xaOlc+FLrhEukSn8n43dBo90aJcr1W0QfblbrfUDBaLtaNuTiqhNFGk7MkJUgFZVyGHHPwSmiX7TdtkHr6FbJUA/B+sL9Gj0QT14ThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBYn7Gex1n1wjb77fLHyjucih50b8UZhmSn6ktmhnIs=;
 b=apxpyyZkDnHXX2Mv6v/QoOQ99BqeMmMyT4LrUzcVyvZos1b/bfMf3ztBuigFTkbPHtbrkq7CxTLJBZ48jESdWsYwX8wioC2mJa4wTMIVcNHg6GLxoSIvv3BmxRcxRPS9msWagqRvjRH3mYsNFMUbfuogG5OfjaRNUK8esHTkqKQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com (2603:10a6:208:4c::20)
 by AM0PR07MB3923.eurprd07.prod.outlook.com (2603:10a6:208:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.11; Tue, 21 Apr
 2020 07:54:51 +0000
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db]) by AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db%7]) with mapi id 15.20.2937.012; Tue, 21 Apr 2020
 07:54:51 +0000
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
To: Yicong Yang <yangyicong@hisilicon.com>, tudor.ambarus@microchip.com,
 linux-mtd@lists.infradead.org
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f893b8d4-03e8-bce8-b14e-1584802c6d53@nokia.com>
Date: Tue, 21 Apr 2020 09:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0101CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::26) To AM0PR07MB3937.eurprd07.prod.outlook.com
 (2603:10a6:208:4c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR0101CA0016.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27 via Frontend
 Transport; Tue, 21 Apr 2020 07:54:49 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a582a061-c9ad-48c8-6a07-08d7e5c94579
X-MS-TrafficTypeDiagnostic: AM0PR07MB3923:
X-Microsoft-Antispam-PRVS: <AM0PR07MB3923A35F0305B64B8B5C705988D50@AM0PR07MB3923.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3937.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(26005)(81156014)(6666004)(52116002)(956004)(31696002)(2616005)(36756003)(8676002)(8936002)(316002)(4326008)(5660300002)(44832011)(6486002)(66556008)(66476007)(66946007)(31686004)(53546011)(6512007)(6506007)(2906002)(478600001)(186003)(86362001)(16526019);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feqAFNS5ybEAV6VBzdclTRGy/1OpAt6kM94tbfT4QRBfcXLmyNovdiBSDTLziZueZMc7T+rmCeGHMZWIWbzr11E9z19V74xT1l7MMLrF1is3uHOJsJwLASbkw26PO8nvtlXTAtzLQUf4EtgAqwCBft+J+QMEvevnmyRFkXTIZUrWlPHW3xcSuWZUecfvZJbz4pYMD+Fi+Pl+rgqblvRjBfLN/5YcZgpE3DNpvMwvnvc0wem5yBDrWDlLNgTSaSDt8X5yCRrz4zF04qlWLsoR3SmBaEfZ1AxUwKJAesdyoEWYqIEuWMwc3LBlRQZiCCQbhRCDIDooheEMdiZwkmrMq4V0T3VYecYpdEuJov/oFqNP6I9651r/GfJbltC6pjUObElKRSYcNymuyAW7wFitzFiSDxtu4p1JCI6hxc1NQeUpkN0B9FWnkn9wvPU5xfhq
X-MS-Exchange-AntiSpam-MessageData: nCT586PqTrB9uwbQB4WJU/Xt5CaqY7iISnGFXdT5PFuoX4Gd2rLFewPn250nn8/fcOQs5Udc42jk++jILtBb+PQz1rcTKIKgB9R4+XlBVoWY/RB/miO+PRZRXrLKhseAug5GDnmnzfgYfSUL4+3BHQS+GgHeh21OzGQmfaraISc3asjKsp34MOgIOFrhfx4TKQUryYZSulWN4OO5TndAwsZxoG+gyM5ko28X2Yj6I3jFXduPKk2rUh+Fp44nRyr+ev2UaFbaR8z61LZ5ZXAv1GZwOUU+XWqUWcrZNkuPczae5Cq5+GU9lsCeLdSrnMrLVXi4CvwT1eiCg80K4cCLt9Cz5+SDRJSg4XThbja7fYxrVyLD4BpI3P+pIZ7Hc6Gkqx5ztoVziSRBEmmj300fLzdp/KZubNHi1wIwThq/+QEd9jc7BlAL6lcxxco8GhqAYn4Oa06xP7nkg7DtptFYb9lnFsx7th+7bU6OkB1rWU/gkO3GSwEeHza9qPLOfShQCO/hFZ29B7DylgjaGnU2BfJrya6O9JM8ED4G401Aar59jSfOObpoZWT2B4qAFvxGX4zXr44OowBZiFxJ8G63M7qAepau6mR6EfPIidUvFQaqmw9Ga991oNEQtag+NxwCqIlAms+Nm5f0YTUVRnr1s3w3Jpxte/tR+in8tieaWRLBHClItCSavTmqioe1diVkcvlQSYsglhSsr1dnfX7koasi4VN10E/vZcPJjej6Dadw5zSPeNTmTfjMmbiZVGGP2vTgmw46XdR/8+10LoFuwXZdKAVbEJNvEyQaV5qUKMA=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a582a061-c9ad-48c8-6a07-08d7e5c94579
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:54:51.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3NVCc1D6bC0VOZj9IkuRCrOGnG+lElclVieX0eWzpX9wOuVyMNfuTgK+e5zcDqsyQ18SWy1gP6oua7SbVlNjZQ3Ufpu4gcOB/rEdcII1xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB3923
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_005456_094788_31DDEE45 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On 21/04/2020 05:30, Yicong Yang wrote:
> As per SFDP(JESD216D, Section 6.5.3) says of SMPT 1st DWORD, 11b of
> bit[23:22] and 1111b of bit[19:16] represent variable
> {address length, read latency}, which means "the {address length,
> read latency} last set in memory device and this same value is used in the
> configuration dectection command". Currently we use address length
> and dummy byte of struct spi_nor in such conditions. But the value
> are 0 as they are not set at the time, which will lead to
> wrong perform of the dectection command.
> 
> As the last command is read SFDP(1S-1S-1S, the only mode we use in kernel),
> with 3-byte address and 8 dummy cycles, use the same values in
> variable situations to perform correct dectection command.

Well this will work and as the maintainers ignore the proper and even recommended by them solution,

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index f6038d3..27a8faa 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -624,7 +624,7 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor *nor, const u32 settings)
>  		return 4;
>  	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
>  	default:
> -		return nor->addr_width;
> +		return 3;
>  	}
>  }
> 
> @@ -641,7 +641,7 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
>  	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
> 
>  	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
> -		return nor->read_dummy;
> +		return 8;
>  	return read_dummy;
>  }

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
