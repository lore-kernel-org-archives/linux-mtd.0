Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A96C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:00:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FE220770
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 10:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+CT0k49";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="Z6IzvSmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76FE220770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v78lfSo2z7uvZ2fO8HNGkoIO8rDhcbHOmNZYghvZFGA=; b=s+CT0k49/gvHNCSlKvJJ7WpcjN
	O9cAk98xo95EyfomVLonE+2jbPHPT2UGOz1THIpoxs+wupcy3s0NF1iHd/QNkla6R30+qFMa13uE/
	R2QnT5mAdZnLLk4N86D7lsjimhIeUqo/zuTBWHIRjSgzlurFsihl6MGnU2nlIy0xSnE0c4mL+Z9IC
	w3IMPGJmey44LZlyWheK20TvlTsvFgONudQV+X5VJyv3HTzI2U2KG6GIorpZ+fMR6Ie3NWnPiEW1S
	xy2pJmptkLKCC+HvzWxI6VcrwY+DSyQ02+N1slONqJ5YAe0EfiSNLcmnQ2tHI9W2FEpFu4z850HrO
	/auWSn2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIqhn-0007FO-JI; Thu, 17 Sep 2020 09:59:55 +0000
Received: from mail-eopbgr140117.outbound.protection.outlook.com
 ([40.107.14.117] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIqhk-0007Ei-Kp
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 09:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2gpXQrm1ho0Zw4zg2BKipPL2XTyVOuOX5n7AMqulHLZBH2rHD4ka9VUiPJoj9f0Na/rhKQqnD0oE5kg7GevSxg17zD3MkeOrEuY7xEHKTscRwN7rVdERtzgdLVqVgiMJh8M8h93PHo+qhRBuAEU4myx45tIEeIM3fOeQL6nNOzq2fDnYgzatIjMleKuFybQ/6oRIiLK1pg6zguCxlp5j229YsIIGmA+0XrTFkSPbu2kGDHB5ES4/syg80Mf17e69MS/R8+QUFvTFR6LiSXnua0cSRSCUu3RZdzFi9G230cXCd3nYAyCakLpnkCfSQYL80l107glVTjyRPhvC/e5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D10fuy5yUfWObH4sjZcFiFo3eCdPIEzORJoZjO5TNms=;
 b=keBSY1QWOV9arHpg7FWUCQ5JQB5GqPTQWGqlUDwu2wbBN0XLR2nJoiMfoqABuLkXD1zs6xcWvzv6bU7I5eQidQ/OwB0vC3m3rb6d7kKjhDcXDsiQJ+NoDmzl19OkmSWKsdLSxCLQ+SPSL6iR+XRa7J34GaBVBpo7LFvexyKj9vt2aETc7X0u9xNBs1cFlHt+WViLm/nfQtFtxwz4R5HhCNBmTU6Cp/lQPR5jppM2YApn2AN+3IRmjhE/qxLAOcb0WY/TPDjAy+b8hy7dXXwqVSWeA831p7IelwFCzUcxdCtJ6jg6sPvUx2Aw6CaFBpbaiznMyPpHdBOTk1HKGHzCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D10fuy5yUfWObH4sjZcFiFo3eCdPIEzORJoZjO5TNms=;
 b=Z6IzvSmjugEy/+M7P5DHmDWG6EvFJ2M2Dw/J+wkL0OQCvwpESnaXV3JvUWgfySTNZXW957HmVvo+hpXhwInMDr/tX6hvEt9DuSWogj/sOhUr+V6D/tN5JzGTx7BxmYFR+0b+MpcKqBaGdHo0HZybIh82r3kUyIpocpAD2vxaZZ0=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM0PR07MB6370.eurprd07.prod.outlook.com (2603:10a6:20b:158::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.6; Thu, 17 Sep
 2020 09:59:47 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e80a:8374:ffbb:165c]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e80a:8374:ffbb:165c%7]) with mapi id 15.20.3391.009; Thu, 17 Sep 2020
 09:59:47 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Do not proceed with spi_nor_sr_unlock if
 WP
To: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>,
 linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com
References: <25c209e2-f48e-f4aa-4043-1f259e26a7f1@nokia.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <4ad6c31e-fa1e-7e73-1278-150ca58fab23@nokia.com>
Date: Thu, 17 Sep 2020 11:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <25c209e2-f48e-f4aa-4043-1f259e26a7f1@nokia.com>
Content-Language: en-US
X-ClientProxiedBy: CH2PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:610:5a::33) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 CH2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:610:5a::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Thu, 17 Sep 2020 09:59:46 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd01a318-256a-4430-3a3a-08d85af0690a
X-MS-TrafficTypeDiagnostic: AM0PR07MB6370:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR07MB637011268FC5369BF02AA647883E0@AM0PR07MB6370.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5OA3k9qcd/2rykIya1iUurCBDOgHgv3B+EIHkuvcJHu+YeaRh17yn4F52Taqyj1E960tPIN83VaDa/iXXo2Ulsgp7sRKpjpjx0l/7JWlPNFu8sLpimwGFMvckPElgi4q08o2dDZd8nL6ZXCRuSyKtiOdbS0WrerH7yHpqDimLpnmHNegV5ix8IQKUfKUQkZLBzAtgpqaGLfje4pyJ+xxFDwEXJhpF0BZV+pFN8KyQgosGkVTcOkRJgkKIWq58xXh0rYoM01HyMRU5Pj6fAWe5I7oWE+bRKNVRq7vFf1NR7GbPkE5gC2gZQpEFgUt6jaQdTeDhaXfjD4gL3Tx3g0omheFSfqygsaUNcyNSxhjJ7aXRmzXrtzQ/N8RpQ1UDfSmDPvAbaV/y8sIoWlPfpIX6ghndsPNfbZgBzrAgXVpg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB4531.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(52116002)(6666004)(8676002)(8936002)(36756003)(5660300002)(2906002)(31686004)(66476007)(478600001)(66946007)(66556008)(6512007)(31696002)(956004)(2616005)(316002)(16526019)(186003)(26005)(44832011)(6486002)(6506007)(53546011)(83380400001)(86362001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: eKw4ZonhRT9i1INhEwGyl5VJP04pTas7TUMbalatVwfFJk2W4cWK5dpbSivTvvfs8JkJmJNS0g40X08WUdmTPRlreX8yZT8xOPHGrhS82KOMf4Vs2Wo70TIvolY68srqa6FiZr7gEdiFbcdGd4qVl3L/c/SZIq2hQi2iq6f0HJ6VamngfzKvZMeapnGcp1uHsBbs0Wo7Dc7ghXpMreohAJHaK7gu7dAimi4Sr14SNqesiCaBDghsP1is6hQPfBW0muGJgSrJj5EZtgvzQQvi2dcbwNMphwBNEAx/Esv9O2hffuhoD0+m47pkE6uQ+ZTahbFzUPOxsJILW5WjLzUB7k4IjDWPkr1HzfdGaiK83PTcSu8CqzAC1GePSN4Mw0VhcNoLcVnkV6BChsb3/rFdE8PDkdYgMuXHr8ysGV4aE6xpVes7jm/wndRlX3OE0gQhLv4AWxliFzk3clozogGuaLfo4uxMIuhaDXSgqW16Iv4+lLIC0Fg0qBAEL6QgRQIp7jA9ux4VrEj8oxfhFpwScJv89t+JnJu/I4TKABwBUOmjbNmEIxFUGjFUnNrkMjH/hP6XIWdo+7dXxZiQ92dBIdA4lK+V1AIXbhqwiP8emF8+WHfKejZCGBnCxvhMPBJ4BvNATWPMubmE7gqUd1MbkQ==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd01a318-256a-4430-3a3a-08d85af0690a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 09:59:47.5543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /AgYmoLKXb40WpeQg8kWvljUN4GAO0DFB0qB4QUCN5aWNoYk9GDzcKzsazE7Gq3+2fUvJdnaaj2p7vZcZ+pKZ+5+ykKoPYnmXCVRExr9sCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_055952_729779_15710D7C 
X-CRM114-Status: GOOD (  19.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17/09/2020 09:31, Matija Glavinic Pecotic wrote:
> In case Status register 1:SR_SRWD was set (either by software or write
> protect pin), sr_unlock fails on spi_nor_write_sr_and_check in 8-bit
> mode due to fact that written value will not match read value.
> 
> Problem was observed with n25q128a11 device having protection enabled
> by W# pin. Failures lead to device probe failure.
> 
> Problem was uncovered by 82de6a6fb67e16 ("mtd: spi-nor: Fix the writing
> of the Status Register on micron flashes"). Commit selected 8-bit mode
> for micron devices. In 16-bit mode, CR content is verified, while in
> 8-bit SR is checked for sanity.
> 
> Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
> v2: Fix whitespaces added by mail client
> 
>  drivers/mtd/spi-nor/core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65eff4c..4c3acc0 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1777,6 +1777,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  
>  	status_old = nor->bouncebuf[0];
>  
> +	/* If SR is write protected, we cannot unlock */
> +	if (status_old & SR_SRWD)
> +		return 0;
> +
>  	/* If nothing in our range is locked, we don't need to do anything */
>  	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
>  		return 0;
> 

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
