Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78327C4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 08:50:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87D521D7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 08:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eP+UbnVh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Itj+GQ7f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="odOU4Q7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87D521D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZQckxUMOfhrmCoSwwNIJV3N1I87TJqMAem5EaJi+Ho=; b=eP+UbnVhGANbde8FlZX8cf3BK
	zzDxzH1Q0tnjryVL5cwylrrq2Qs+w4YPDPQtboAccnxHjJXJkAdjFz5nbCw3Z91SXkICujB0m0+90
	7QhijQAsNlW8z2MT3vS9ggo1hG+fsk+SwePpVEGqG0mzfr76q4iVdt9et6hxSBBgDuv5MNz/fyoNT
	mrmP074KdU8DI3kZUfbzkGAmWQYzrFCJWbdrU1+r7xHb50uM/D34kj7ct65AkMojGHtV7nEbTlMYb
	N9IqycstZVTacwvb6xIxo3j/0+XtgZfVrwAsQlSDxj3UdmQ/dNRzeojDvKAXZErMEOe5lvx118Sgs
	60Id0pq0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ58E-0007mI-Ay; Wed, 07 Oct 2020 08:49:06 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ58B-0007kb-DM
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 08:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1602060543; x=1633596543;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DhE+3rR02b6KzfMf2ZTiSgLoY/6hg+L+vnMGM8B1A5Y=;
 b=Itj+GQ7f8To6aQUmntF67h4Xf7BodeLP2UM4pHoEGdIYgOUXReqPslKN
 O1un5gcKvSVJU+PXgUnxP/DSutbI6hkcpmvzB0BUm5zhd0+b23SwyYxcw
 PvAa5RxXSjKpRVjzP/lwHV2S+cFYa9CV9lIknTkhCrzs6cVudMdS4EQns
 kZdp/lS1Ga7ljKWknHCGxt39srNDT/fsZOkGv8pmFLM8LJ8/RPjtwmt/P
 G9m1QqOo0kWQnG/RVQd4nCuibK3lTVtYvRjOxbFWPyaLfXucaiTiV6wmt
 eq7jf0T4GPSoTLFgBMeRS/WA2kVhmlFCjjU/L2tXMcEMpiLR+RytXrV/z g==;
IronPort-SDR: d7aWoCLj+oj021gI54dTZp/YmK/i8FPa/aPTxEThpkNQfLQ2n8WWXCYhcLx3rMY54UmAlyytdp
 Kb1D/NHPjSlu0q/fc8x1TyzDo3IM3ssX3dPYuTecN3qeXbctT4TAJxhfJXsJco04sZp8sGVeN8
 SmAeij8ad9g9YAsFEzh5o5dO8diJv5EALR5UYJVfEK8mj4sgQ3+7Mv/aHJOOjvCRm/r/CJsm0R
 XIE5eM8zXZD/xd9Bwg1Ey4BLefs+2bRrL59IP58zCofIY2LtBkwv2QIrCzx1SyS1pXrVIGguwj
 OWs=
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; d="scan'208";a="98581730"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Oct 2020 01:48:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 01:48:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 7 Oct 2020 01:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiXYD+lQbsaC/5j3XY7MsA8jo2ta/FE89RSj1qPMNMKUeg7DdAIq0TKvj1pcWYzonUsRt7RqKlj8nbNNZA0pCrPaLYbz7ZGDWUIPVDAZdzMSDvI0vShv98nWfzWO4CefDC/WP4aIU/XiE5iKgxRmFn5LVd5xyZDqeE3Gi2YMMMxosrvxl1JY2H/r3l5QGf3vV76EPPV+kY/sgt5sZvlrN/FowQueAKckwUnLtw8+mOE03V2277S+u5+XrhlN9PWwhnVHMyi/g9rMXdo32LtVh6UEMfd1Z+QyDLyjunFzLdnp2o+OYjHiMBzZtVv3BO5nX713h9YWU+TFcMWI36LweA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhE+3rR02b6KzfMf2ZTiSgLoY/6hg+L+vnMGM8B1A5Y=;
 b=Unj5GP/db6zG99fOchCKNSQHBwnfuAKZD9d6x4yFWavuTMnCMbNYXWCqLh1cKzBnY7nNX2hxzH5b6aZG2EJXlS6gUw4XDXJ60S2FCGpdITMXUePsll429sFzkeQdgPyxdSexnA6hV2wNUkjNgXRkdPvLJer9qIvpkvVKDCmj12YImRaTonuszP15soBIzPmt9wLOpg4rxOU4CtB146rD9iRWCfJnj+FpktEIUMXJJAEOZGEKSd0t/L5LwMHi/K8g+sD/WcLQlnfsovo5ydmq9/HZgFkSS1mohUeyusq8yE81FQeMp58mibpQ8J9mpyyKMMCibBO2fx/Itrgmf44UPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhE+3rR02b6KzfMf2ZTiSgLoY/6hg+L+vnMGM8B1A5Y=;
 b=odOU4Q7AYA+tFGw1PTWg4bDF+8DwSMXYl20D5hyHApj2IIzIqFn8m/rDcagY6MRSe7n66roUNYkkcEoISp/D9o8TRViZKQudrExdRXsnim0WvPyJUMnUkKzHwybnQeeUu6uG070QBZ6LqcVwq9LaDWiXYtCAnB493RT3bieW0Bo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 08:48:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3455.021; Wed, 7 Oct 2020
 08:48:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Don't copy self-pointing struct around
Thread-Topic: [PATCH] mtd: spi-nor: Don't copy self-pointing struct around
Thread-Index: AQHWnIapYR7N4KU+CU6dtI266TT3Dg==
Date: Wed, 7 Oct 2020 08:48:44 +0000
Message-ID: <f815c4e5-eabe-af3d-efb6-87000f5ba411@microchip.com>
References: <20201005084803.23460-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20201005084803.23460-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1282a35-fec6-4ba2-4c13-08d86a9dcca6
x-ms-traffictypediagnostic: SN6PR11MB2574:
x-microsoft-antispam-prvs: <SN6PR11MB25749541B84536123DC54115F00A0@SN6PR11MB2574.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X/lm+uyEOnwvcKfSFmJMwLjCJq331PEtNiNa3dHmeJteQMJCH0hLApyAOXcultLDIwzKpvk/ov/qrMarfDj2tEILmOe3JWhBTBBdaxdnbfj63hrgVvsScM6xJlQI7rVOciCLCHoUzIFEPMltz9CcasyxH98+5TNKcO4Jp0PE0yx1H6+iFNPYnQF2og1CeGvBOEeT6ACjg3D+rjuCMQyEj146dJ37/k0qFOTkhX3ppmKheO00r3aUqNkSCcUCNYC4Qwmcedb0xMb2SLtpIzucTaR88sCSuSKf8reWWPuJlrKknoLgtekPgV9A02Kb4NYgDmoChJg+fvzXynZ1wX4tgAYej+VUVhwPTFmXTu7rCPOSxTIv1qfAMHMB2Q/hLxsC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(39860400002)(366004)(376002)(478600001)(8676002)(31686004)(2616005)(26005)(71200400001)(2906002)(31696002)(36756003)(6486002)(86362001)(6512007)(76116006)(110136005)(66446008)(6506007)(8936002)(4326008)(186003)(83380400001)(296002)(316002)(66556008)(66476007)(66946007)(53546011)(5660300002)(64756008)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: TAH9ClBN6iNAljqm44iXtpgoXT9DkIeiKGYdLXA0MIsZDoFLb036BQyLvCAR44BtPxmeQ1a0K5e77jXrzRMP7gQNIzLGUHy79o2PQVLuA/cT3/FeqB3i2XU5uEBRkgUm9Zc6UhKZqA4lCbYSfC04RTP8iqCongDWXuITrAtlzLZsvHmnhdPBf6Upc4fP2RHL3uVeI+KDPQZOWAuddelYjxk6m8PPK5Xby2SRxoj9eOgyE1kUW8SWOODITk6oZq+HxmolxndTXOHALx+/bzVvOG8i/5AMFkE0H3adPoJcKMn1S0TwopCkATYWUy48pukRfKTwMKR18iaWeHOyXvdqlDuJNMNKeis+9zo+FyV+YrTqVPCB7t98ButFoUc2akjlylunhDJLDAIAB9no+TVbmw8iyOR7DjNgaKSQRnnSbAE3AoOdkQma78GjSTmzIVGvNBr2KUV0akJulVmBRS+OkO5XyNnnPfJTBWTwpneHgd6NM1L1Sh+8YTc3axug9QReiqA1J+TzwTIOMNo11Y/UAUJY0lvvZiL3dQ+hebUSUnjpdV0TN6KtdkA3vsFEvtsYnP8mNtz6ScR35/VfNJI9djyun0T+hx/xHEseOfhPCNE2l97BY0AB7beFyom4kjXc6ho+xjpCJRlYOK9bUzvqGQ==
x-ms-exchange-transport-forked: True
Content-ID: <8A46B7CC5A4696459646E5C20AF17174@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1282a35-fec6-4ba2-4c13-08d86a9dcca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 08:48:44.5460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JmrlP90QFEWylxhfVlmzZMkzzyjui8eHOvrdKl9F92rNgMFg6uIRMVM3WvYnR9WG8rJkNBkKgntzs/xOlt7rnxPViQoW+Puz4KOSjxKjMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_044903_796291_27F0420E 
X-CRM114-Status: GOOD (  20.82  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, matija.glavinic-pecotic.ext@nokia.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/5/20 11:48 AM, Alexander A Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> spi_nor_parse_sfdp() modifies the passed structure so that it points to
> itself (params.erase_map.regions to params.erase_map.uniform_region). This
> makes it impossible to copy the local struct anywhere else.
> 
> Therefore only use memcpy() in backup-restore scenario. The bug may show up
> like below:
> 
> BUG: unable to handle page fault for address: ffffc90000b377f8
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 4 PID: 3500 Comm: flashcp Tainted: G           O      5.4.53-... #1
> ...
> RIP: 0010:spi_nor_erase+0x8e/0x5c0
> Code: 64 24 18 89 db 4d 8b b5 d0 04 00 00 4c 89 64 24 18 4c 89 64 24 20 eb 12 a8 10 0f 85 59 02 00 00 49 83 c6 10 0f 84 4f 02 00 00 <49> 8b 06 48 89 c2 48 83 e2 c0 48 89 d1 49 03 4e 08 48 39 cb 73 d8
> RSP: 0018:ffffc9000217fc48 EFLAGS: 00010206
> RAX: 0000000000740000 RBX: 0000000000000000 RCX: 0000000000740000
> RDX: ffff8884550c9980 RSI: ffff88844f9c0bc0 RDI: ffff88844ede7bb8
> RBP: 0000000000740000 R08: ffffffff815bfbe0 R09: ffff88844f9c0bc0
> R10: 0000000000000000 R11: 0000000000000000 R12: ffffc9000217fc60
> R13: ffff88844ede7818 R14: ffffc90000b377f8 R15: 0000000000000000
> FS:  00007f4699780500(0000) GS:ffff88846ff00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffc90000b377f8 CR3: 00000004538ee000 CR4: 0000000000340fe0
> Call Trace:
>  part_erase+0x27/0x50
>  mtdchar_ioctl+0x831/0xba0
>  ? filemap_map_pages+0x186/0x3d0
>  ? do_filp_open+0xad/0x110
>  ? _copy_to_user+0x22/0x30
>  ? cp_new_stat+0x150/0x180
>  mtdchar_unlocked_ioctl+0x2a/0x40
>  do_vfs_ioctl+0xa0/0x630
>  ? __do_sys_newfstat+0x3c/0x60
>  ksys_ioctl+0x70/0x80
>  __x64_sys_ioctl+0x16/0x20
>  do_syscall_64+0x6a/0x200
>  ? prepare_exit_to_usermode+0x50/0xd0
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7f46996b6817
> 
> Fixes: 1c1d8d98e1c7 ("mtd: spi-nor: Split spi_nor_init_params()")

I think the correct Fixes tag is:
Fixes: c46872170a54 ("mtd: spi-nor: Move erase_map to 'struct spi_nor_flash_parameter'")

> Cc: stable@vger.kernel.org
> Tested-by: Baurzhan Ismagulov <ibr@radix50.net>
> Co-developed-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
> Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2add4a0..cce0670 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2701,11 +2701,10 @@ static void spi_nor_sfdp_init_params(struct spi_nor *nor)
> 
>         memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
> 
> -       if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
> +       if (spi_nor_parse_sfdp(nor, nor->params)) {
> +               memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>                 nor->addr_width = 0;
>                 nor->flags &= ~SNOR_F_4B_OPCODES;
> -       } else {
> -               memcpy(nor->params, &sfdp_params, sizeof(*nor->params));

neat!
With the Fixes tag fixed, one can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>         }
>  }
> 
> --
> 2.10.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
