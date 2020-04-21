Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BB6C2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:56:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C3D2074B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFgIXr8N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="cpcdtKIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C3D2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=accVe+M74pa3ZSKHVu4lD4NceYz2Mqc/T1GXXFu5DJQ=; b=cFgIXr8Nns+hRc
	iSTANXks5uCqMQxzvQBAThm0oEYd3ZnCxJFMCXhUMcgRLZGSU0hbj8o3uY+hiMUvtlAZj8PF193Q4
	1z7fo7AmGfl/1F4W70Fa/RUSP9fkbPiemvK4JlwqNQy9MZ4XSFaT6+1svxEutjtBlSsQFsF9ZoceL
	36o67/Zujn+OLJvnpmm6A8Q7v5V3PvQE6wurajYGB08sln8E9mdGYDxHme2yUm32IHhx/ftHOjkkQ
	nfljHMnvXvIlYYFgKunIoZ99gcv4Tf5G7j56TBWV+BkaoeLxX1YAy1rq32bgkK/VyiFUYfzK6IFo8
	N86+cOmaogZiMc+yediw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnlS-0005qj-LY; Tue, 21 Apr 2020 07:56:18 +0000
Received: from mail-am6eur05on2092.outbound.protection.outlook.com
 ([40.107.22.92] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnlP-0005pS-QF
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 07:56:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS7Pe4jPSv1M9aQW1/MpbU2oE4vgmAoVTMByVTVWjdv5wjuQHAOVykPRvSqIOqmwPhjxudalkdWEnHiEWZS6G8ufDzj7i6whe5JyUccTLOFcqLq7DAGZcsag4VdVvrwUUvk6khQffBZRgRbqeIGnfQl/b2ZXSXM3jFQx75z7H1aKFQY48g9tLRFeVcojyTcyjxy4OAYjG/JSAd4reTXZ/44orIP+RbqrNQ+tG2MVcl0t75vS8XWr8CphZ+7ow9OkLVY/M4+2CICgk22rqvrYUi7H9ZGT3yqaAqAg8bnPlivgpJSEIa6kL26jehC3+fu+912mBU+t6ZMcnnFg3MRSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODtVKLttE3yacx4/kVihET5fE564Fu8Ywu2b00HwPHY=;
 b=gy7FuE9Rngf8QqruN9njLlfqllhDMshw1hGtcOuFrMAuH6uotok/QbR164SOCCaFWeGq8qc/0TTUryRB7tjrWPgW97kPGUEag9Qso7WSU2niBRgENhn0izpeYo+kccM8lhX0vnSM9Hccf/bBqg0H6FMCn3ROuz8pv/ybEmkSOjTSgv6YJ7NZjGkWSigxfMpSjFJ6Vfi4TUQp0ZvacOimzvs9Xv/8NZQxLT1HT7t5RKg2P9n7l6CGbbY6IhvpWEcmRQ7IrUwiBN1z9ncbZeJZywHEOQsJ116iO6FIAz1xinTFKtv6QIUWPVB7OQPVsYJ/RMWBDZ+jq+On+xpTpFA+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODtVKLttE3yacx4/kVihET5fE564Fu8Ywu2b00HwPHY=;
 b=cpcdtKIMI1yO7sWE6C76lhKVNUfis1tERDB7RPFNtn2gJ5eZjcexSqEBF0Y+6+yklfF3CL53i4sg7tSQewqLuu/0l6KpkYyamhE4p+2vc8CEaA+9xkUCzzd3BMw/BB6H6wiPbyCe5dUCGh6Yz8VDJhcLFQ9gCf/sbq2Oy6Ie5qc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com (2603:10a6:208:4c::20)
 by AM0PR07MB5956.eurprd07.prod.outlook.com (2603:10a6:208:10c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.9; Tue, 21 Apr
 2020 07:56:12 +0000
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db]) by AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db%7]) with mapi id 15.20.2937.012; Tue, 21 Apr 2020
 07:56:12 +0000
Subject: Re: [PATCH] mtd: spi-nor: spansion: fix writes on S25FS512S
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <b51d3173-5fad-c389-2888-185d835ca4d5@nokia.com>
Date: Tue, 21 Apr 2020 09:56:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <191f8894-8392-0d85-62f2-49cfa0285144@cogentembedded.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR08CA0044.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::15) To AM0PR07MB3937.eurprd07.prod.outlook.com
 (2603:10a6:208:4c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:7:2a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 07:56:11 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a30b8c04-5c44-4274-32dc-08d7e5c975bc
X-MS-TrafficTypeDiagnostic: AM0PR07MB5956:
X-Microsoft-Antispam-PRVS: <AM0PR07MB595626E5E017CD4A2FBACC4F88D50@AM0PR07MB5956.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3937.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(5660300002)(86362001)(6666004)(31686004)(44832011)(16526019)(966005)(36756003)(186003)(2906002)(6506007)(81156014)(52116002)(54906003)(66556008)(66476007)(66946007)(316002)(8936002)(478600001)(4326008)(53546011)(26005)(8676002)(956004)(31696002)(2616005)(6486002)(6512007)(110136005);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4Hxm+3JdXLegrghOr/5RnqBMVJ+GOXMeacfEg1DK97l05LYsi7zwRq19mWlDtNy9KUV5Eb4S/yBDwrxpjxItIuGcA776zTPc70qycienBtbenecjtxnOV47QVL9GQLGoEkPpJhE4C2KJ8wpCjdko3K3LB0kDEEghyFZHB8vFbj5kmkqeB0HRKbblD8i1ywvF9yBKD8xeXzkmbwwx4HKCmzR6zWx3FJ4p6xhcLf9qOoP+RFYurM+eE8sUL47s2w8HqJXCXf29S6A/0zFTaMjpp/vJYXYJQYl2oWtWiR+MXt/kDTugkyq23qhY6l+65KhVV2szbRzNqHhb+GPhIsTolReFEOPx26pEhaoEx5WL3qcMCaf9Iom0ZLXZH+TuAXDLt52dcNz6IkQGt/oAbIuPFZb69a7FHbCk7OLIg9E0ODuZwi3bnfjW8Yv8EVT5r+z9zqCv5xUlNiZFeeGlA5SFFC0Q2YA3rJ5RV/gJf4v6375askLYdEsp7kXB5ZsvqHiFsjrxW/bpwx7ybSIPiBKEw==
X-MS-Exchange-AntiSpam-MessageData: JW2iRejjE8R3LrQscK8zLkdORKdHJUrbSr9m5Di+LXieW8jU6o2sqOSVCSfqt6IryLnjQP/j52UclhGA7MQJgZO9uEcUo5w2PICiOtd3aNdix+DnTzy8G6bwQIWFwLkU1+jw/TaVo5s0FYnTaQLVr+HoxsjbZLn8sx1WcxHMMaiLsxmm2oi4brL+qo8Yn2AugcZ9doGeX48guFLhbFeTM5W7uTmJ09SOPB0geYArb22gVn9KfXWT/wOP1yJKes6Q1ZNkZNmcOnlXKk4Vgy0rNkvm7d5VKdDc1fRvl0BMFO1I+awVpGAIuOBtextcVdjLV3NeaPoipkqetrPDNGpXrZh0LN/ljixfwcFnKRtmeVT4W/okChGcOHTpi1NrCAB8Fs7hFpCGwVA1JfsVwLKRfkM7rbNaL03Qf3h8PPUZ3rNYHvhpPuJLzfTIlX7yBjEpABhDUxwIVYhwyDJEBDNd39pjUDfXoQEBuSgJhJaZaorqFdLSO5yY8bjNb5r4Ppzf6hZPer8Gw8NF5NHEPrqT7QYQsY4steooDXFspi4kpVUwnbLjQdPtyFyus4pybUrGGr7ynPx16kUZV1Vh0A1HMN1wNEUxDTMX0ttj3jqDnuPqYk7EZii1zFqMCgSTF/83niUS7n4ME7DM/Q+LOAAKpWEUhhL+KQDeJObe0re8tpdkxM5wyfHcBbhaGgInooUOLbG49cTvoeXkMXKjDvn1CPEgxXQ5SgiiQd4Yh/bOVEodO4HeHbfLp5D9yDaXL2jOds5b6KCgUvrTGcJ8a2f7lnFzSiCS2qDsu6HcWPunhW4=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30b8c04-5c44-4274-32dc-08d7e5c975bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:56:12.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iq8Wz9vEeJw7rQfWD64bcLHuKK1B/4W4cReBJ0UIy5BbrfWxhkTa8EJNQ4uvfiZ/ZoAtmaTYSk5R/g4e94ysBQ6jljB3+vyzo9qHOALMhXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5956
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_005615_848704_DFF6D38C 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: Richard Weinberger <richard@nod.at>, Yicong Yang <yangyicong@hisilicon.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On 20/04/2020 21:13, Sergei Shtylyov wrote:
> Spansion S25FS-S family has an issue in the Basic Flash Parameter Table
> (BFPT): Dword-11 bits 7:4 specify a page size of 512 bytes.  Actually
> this is configurable in the vendor unique register (CR3V) and even the
> factory default setting is to "wrap at 256 bytes", so blindly relying
> on BFPT breaks the page writes on these chips. Add the post-BFPT fixup
> which restores the default page size of 256 bytes -- to properly read
> CR3V this early is quite intrusive and should better be done as a new
> feature; Alexander Sverdlin had the patch doing that:
> 
> https://patchwork.ozlabs.org/project/linux-mtd/patch/20200227123657.26030-1-alexander.sverdlin@nokia.com/

Right, you patch has a performance impact, but at least unf*cks the chip.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'mtd/fixes' branch of the MTD 'linux.git' repo.
> 
>  drivers/mtd/spi-nor/spansion.c |   25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> Index: linux/drivers/mtd/spi-nor/spansion.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spansion.c
> +++ linux/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,27 @@
>  
>  #include "core.h"
>  
> +static int
> +s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
> +			 const struct sfdp_parameter_header *bfpt_header,
> +			 const struct sfdp_bfpt *bfpt,
> +			 struct spi_nor_flash_parameter *params)
> +{
> +	/*
> +	 * The S25FS-S chip family reports 512-byte pages in BFPT but
> +	 * in reality the write buffer still wraps at the safe default
> +	 * of 256 bytes.  Overwrite the page size advertised by BFPT
> +	 * to get the writes working.
> +	 */
> +	params->page_size = 256;
> +
> +	return 0;
> +}
> +
> +static struct spi_nor_fixups s25fs_s_fixups = {
> +	.post_bfpt = s25fs_s_post_bfpt_fixups,
> +};
> +
>  static const struct flash_info spansion_parts[] = {
>  	/* Spansion/Cypress -- single (large) sector size only, at least
>  	 * for the chips listed here (without boot sectors).
> @@ -30,8 +51,8 @@ static const struct flash_info spansion_
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | USE_CLSR) },
>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
> -			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			      USE_CLSR) },
> +			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +	  .fixups = &s25fs_s_fixups, },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>  	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
> 

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
