Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48206C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 16:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123DB206C1
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 16:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ww0Aw5Pr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="RQEJK3+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123DB206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8rIbRMV5OKH/0XD1Yn/0mVE0VaV6PVi4gwKRHk0VsHU=; b=Ww0Aw5Prdf32iE+KKAKucDKj6
	DNv+WSx7w7WXMXZ9uXxdBKiz3PIZO7E9rZMZaJF8w7yjYdU8IGtY1Y4JRrI2Ikc8rVqMZtI535yyc
	H38G0R65r53iFRT4U/Ju9V37m3fe0pb5kwRa7/yLQy2LoSp/+ay1p8zoyZ9PsVU5PHbfXOb4ad+Fv
	T/os9scKjcMPMEPR+ffLecN8MH3WotytF25dL+/QmhOcGfKQlKbzZNS4GsRer7iK+rrNhpwi/AVhW
	bhK5ME1QIVdZdwIAd09lhEHhOql2YbCDaG8sK/Y9epg7jR5Jk9CvdoRnFz7ncxN8brv4RPnA6pYvH
	E+uS9+Dzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyHkJ-0000k1-82; Wed, 22 Jul 2020 16:37:31 +0000
Received: from mail-eopbgr140120.outbound.protection.outlook.com
 ([40.107.14.120] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyHkG-0000j0-7G
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 16:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTc41Zmil7wCsptcclKhDwpPygO9n4I6Af8FPNAvPclV+ZXorCD1c8nTR0uy2rBMUR5RRlYPckIBpQs634+U6tjBjqKlNabtJYjOxTaTeD+YbIdeiH6wQbYeLZNgU6nyImr9cdWPW3QYDl3zpm+8hc3EAGfcoqiomojA+jSaPgmqpzBJyK1CBERzQQtUWfId8C+KoI+UMcYWU0OOiUfKHWVfIaiiHcwrDsWElwdVzqrUlO1R1hisLSsjT7W0lTO74cxiMFot1O4Y2/M3db78vBqsHArNdc3T5iVzcpvXCreIela9FLUYlYIbu/613VD28cSIQwn7M7xfIk3hV0av/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+BL6dKCR3K8/oMj87c1lWrP/CK9vcNgkRY3CFC6ATc=;
 b=A2L6LXK+ux/ynm0QWImV3mBy56ED8TknC9NCA5RcZUTNQgpcUA86Qn8ta6G3iTYNtY2ImZHQX4tc835qTQEXeoYB9lrz5pSIIQCjga0Gor0ajN2CnwuF00E58azFdgfiC4kntHYfhENMrv3jB0mlEiQXMIrZeyQgSv1aXmwZZIj24t93EZs1+AYVRgJvAtLUnqg5xLthTdAspERzFHyRV8ZjPfTkdYBMgTf5o/79Vo7InK17uWTA3v7dfSB53+kjpOQgQ6UEQg7dqewyZJBEV/AIZU2HnXEDWxyOmSV+J1Qj2oDZSfO8tuBN4as19vK7f0F4SAD4gP7LiLpkNrDa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+BL6dKCR3K8/oMj87c1lWrP/CK9vcNgkRY3CFC6ATc=;
 b=RQEJK3+r56sTQS3HmAWdcpMuHblDgbrE4SqgsQ1QrVyWWlRMcA0A4r3qwMsHxVz/fjiJwUECHAcsakIlaf26Qj6KXvDblsDmHVJPexbkuuGTqZHDnlbJfyGDPiEdNsR7MpAqTHjJQoqGhmIArMvXTfqKi7Zo4Ogypc29/hX+/Vs=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nokia.com;
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com (2603:10a6:7:96::13) by
 HE1PR07MB4379.eurprd07.prod.outlook.com (2603:10a6:7:9b::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14; Wed, 22 Jul 2020 16:37:25 +0000
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e]) by HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e%6]) with mapi id 15.20.3216.018; Wed, 22 Jul 2020
 16:37:25 +0000
Subject: Re: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
To: Luis Alberto Herrera <luisalberto@google.com>, tudor.ambarus@microchip.com
References: <20200610224652.64336-1-luisalberto@google.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <40ef3da0-56f4-3c78-f875-a750afaf2ec5@nokia.com>
Date: Wed, 22 Jul 2020 18:37:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200610224652.64336-1-luisalberto@google.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0101CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::33) To HE1PR07MB4412.eurprd07.prod.outlook.com
 (2603:10a6:7:96::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR0101CA0023.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Wed, 22 Jul 2020 16:37:23 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb043270-f286-4283-7007-08d82e5d83a2
X-MS-TrafficTypeDiagnostic: HE1PR07MB4379:
X-Microsoft-Antispam-PRVS: <HE1PR07MB437988F67BD1D882EEB3CF0F88790@HE1PR07MB4379.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqfj4KzCwd/BShU0sZHScMP1GUL925m0RvNrLjE4SJutj2/ndP1LbJbnnGsN6Qeomk8/nCrQMxpn3lmud/ux+rLj/HqtJnkLD/Hn3WrwPyRV6XLowqFSeYZQDWd/+DF16fX+j8JwoWA9u73/p3569kSD8ZAkKKlK5Yq2TtBOmCtFybA+KIAiBO7ScRM+I41JGGsCEmIjuxpSuW/84p95N5b8eHL/SUso9K/VH8/wRe4n6rfTT9YBo6OT1aKPWbbTyDIn1LYzt433AjNimntK34+8YRbHvoGYYo7B+DI+phFcT/PU1VaZ1AGzCgdnLPvGQKVScU7dVQDJ+5lvspJljzkplkIBsFbasuql+zAtMGTsQXSDVzq33RafoLNV4V2zq2+vzqCAJhs3sMWU5EM4CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR07MB4412.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(66556008)(66946007)(66476007)(86362001)(26005)(53546011)(52116002)(6512007)(6506007)(8936002)(478600001)(7416002)(8676002)(31696002)(31686004)(54906003)(2906002)(6486002)(16526019)(36756003)(5660300002)(316002)(4326008)(44832011)(186003)(956004)(2616005)(83380400001)(21314003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: zLjB7KiH/F/eyzDD2Z+oYnHiP8EZ/iAZDM1Tp/XTVeu+Z7TWKSQYgJlgho2ZefpgCq8WRkgSUfMI6i5qfoV7OoFhRY51JblsYurc1ZQtqpYIX6pSjkjWeuJepDhy0PBgFPSV4Dd7mJ7UWGdCYIee66XbHPMuxda0asYFmrqbhpN9xzT1Wrdb0JP7nN7DouvoafNzwSWGGSWsNPW/+dtWylIfDcgxRB3k0Dfkz6TuvFfSpz0X7LsPWhs2VavEcbpQN8QYjYNrCTRA3mf04Tl9mGQbvUs/FkdMpxnPxCvz6IMd2v0saeFAUtgPtpSWJM37ViedzrNjBW10PMVLCnZYJ/E3zDQM5juwwDinq+XTK6Yj4YEH+K34w3MZ0S22VpiYh13hnF+pLDragy/SkuX842K1rgzzn/3852rLmWpIv5zTOMqpcVA0Mta1g7eGuS3IaRj5HSaCHoHUlXw7GFpkh0nxTaTtSE0MhL/waNU7sr7tZwyVnuv+t21KJ9lRN2Ef
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb043270-f286-4283-7007-08d82e5d83a2
X-MS-Exchange-CrossTenant-AuthSource: HE1PR07MB4412.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 16:37:25.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJ+Tx0Lx8sqqnnut54tIsaAGKeJyPrzs5kzwSNvVW0S/OVa2VkTtAoQqD71weGi3vQj5BJeGy2HYl/tt2VRX4r+lDpGEcCce6ZO4bCYYQbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB4379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_123728_402027_71666C25 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Luis,

thank you for the patch!

On 11/06/2020 00:46, Luis Alberto Herrera wrote:
> This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
> for poll_timout". That change introduces a performance regression when
> reading sequentially from flash. Logging calls to intel_spi_read without
> this change we get:
> 
> Start MTD read
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> End MTD read
> 
> With this change:
> 
> Start MTD read
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> End MTD read

I've performed my testing as well and got the following results:

Vanilla Linux 4.9 (i.e. before the introduction of the offending
patch):

dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k              
1280+0 records in
1280+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 3.91981 s, 1.3 MB/s

Vanilla 4.19 (i.e. with offending patch):

dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k
1280+0 records in
1280+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 6.70891 s, 781 kB/s

4.19 + revert:

dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k
1280+0 records in
1280+0 records out
5242880 bytes (5.2 MB, 5.0 MiB) copied, 3.90503 s, 1.3 MB/s

Therefore it looks good from my PoV:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> Signed-off-by: Luis Alberto Herrera <luisalberto@google.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> index 61d2a0ad2131..2b89361a0d3a 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> @@ -292,7 +292,7 @@ static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
>  	u32 val;
>  
>  	return readl_poll_timeout(ispi->base + HSFSTS_CTL, val,
> -				  !(val & HSFSTS_CTL_SCIP), 40,
> +				  !(val & HSFSTS_CTL_SCIP), 0,
>  				  INTEL_SPI_TIMEOUT * 1000);
>  }
>  
> @@ -301,7 +301,7 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
>  	u32 val;
>  
>  	return readl_poll_timeout(ispi->sregs + SSFSTS_CTL, val,
> -				  !(val & SSFSTS_CTL_SCIP), 40,
> +				  !(val & SSFSTS_CTL_SCIP), 0,
>  				  INTEL_SPI_TIMEOUT * 1000);
>  }
>  
> 

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
