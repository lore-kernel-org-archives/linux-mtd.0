Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0708CC4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 08:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AA423123
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 08:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83AA423123
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8J01fnwbLDxNBTt/Tggi0ZtQ3R5tUOlzyjhygTQNb2M=; b=ZOYvxTitNWcSrzRqzGXfQix44S
	8WOZo49pSPZiid+wVCX11D0MoL9MYUzEzxtj+WeFrLqXLgr8hF9d7R8n3g2XWuPlLb4w8ob5tbypy
	9Y7akTo44YkuXuCkHgezmRZfiIq5WeN9/ngHMJz1cTzGRwM/ZBbxBshX894m29wRtVhnwv/Zxu3Qe
	G0INoeHO6oLwOzSlHNm/qBP5dAqSIZ782gJzAXIVMws4aJyMezNRpiNP6P2OlGyqlAn5Oxv6Avjpq
	F8EEv+MTIF1jmIfJuNOYypdb6yg9e5OYDxJXMnD8c0tqxYNslr2nGBj/ovZBlpb/mDa8P3PCqQsnW
	pvoG+l1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSCo-0004sc-G9; Wed, 16 Dec 2020 08:30:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSCl-0004rw-Ap
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 08:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608107439; x=1639643439;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=feN/j6fHXBd/7dblKDK7XggJnmkH/YLE2J9No8W5RhU=;
 b=ariXP9GK2Ynt4LluVMdJEJPYc9DuGUhhwANLrpMrRowfWvHJM335B+qS
 GlNvrEfhwj4M9eHaVHfi+mIZ+7t07WlIiLFXmgZwP+zyqE0JxmvqeW1TX
 defZGZh5O3Oq6iJQM4NDeQLEjyoLlj70hjvLPhF9mX/3RgszqWymYRvAB
 1Kj7+MWLCimWPixBByH6W/1BsOn/Co2Qd4BML+SLv7GkPo817v2PXyC1v
 npJdbR7ZGCu6Rgt+PYu2Ubmwy00Ls04v1X2h/gO/f5KITfcMzVN2MNdVC
 EbZrLuR+9Jkoe6Wo70QZZI0mFpQrObuHuLw7aU8wIOapfcldHH/ANBNGk g==;
IronPort-SDR: QgEZRcfGrfO0jMONnxvgrf6LkRs99hIlvqrfvCmMSasTWPhjTluGpZ0SJw7ovHkjZFjHSu3uPm
 6vlngNMWVYDlScqCv97GsA5yvCUqaaamo8Yh9ZK/I58kje6szETFrqmsUeLhij6rdkNWzx5gVn
 9lS1GmrmEHcpHPkXkq21qhF6bTDGiitXLbFg3sQL0bkl06qBoykze6AZ8i2wgzAFxO+LQXPDhQ
 HT4fsak2YVuo1vr7nnc1rIDwnb8s44sAoXvrKTyEuFj2h9JK6n/sXT9ZvresIRC4dCeRtoLqad
 1og=
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="97287848"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Dec 2020 01:30:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 16 Dec 2020 01:30:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 16 Dec 2020 01:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXCzu9hs11cCTZVuIHht8hjya+RPfY0+YyF96hj9TNiiVaUG5jmUm1Y6qD+m+B7a2CEMyeB47tO31Fn10fPA9f7mxkhBrJElt7YIxJPS+o6DIqfzQGtJRe9jPBwDwHJWNe1erGg1mkuNqaMly1Zx4dolWu7Z0LksW5lF2sknPr7HZZpN/GrhaIifEtowN6EJWEa00AxqFtvaTLBA4t/5jiITIV1L5onvbx4tyIKv13Kbmt6lUOwW4wPW5c4DCS+T9sjnVaq7H4BeIr+Xv4Q0bH+cDVq3bwNA6V3/DqtCw83Wq57fUVYIGqznKWkauUITOGZGPiSE1llxs8g78jvJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feN/j6fHXBd/7dblKDK7XggJnmkH/YLE2J9No8W5RhU=;
 b=J1kgQaxxqo3DLWLSizKErGkdi//xCcuLKdqndNQ8F5m2iCsgtYyhizpzHvzbnVJ9690rynlJFNxa5hciDjUbnVmzpW2OSj7WoBixbwRFU55MiCfeO30tzbKjhf1BtKl2e2CbmabQ4utDNETEaMoItuPszi1p9Btf0vcgqkpjdlzfOstaGYI+ekgGupI6hji60G6bUJdbxC2o1HGgBkDyFTyNlZvx+6yhzUOMCY05dwg6c715eZhjuZpGVvzcb1eJeWQ+hUI6I6MYToNxVhCBQwMUOHemMH/2mKvzkYz/hOCJxS1G6Hd2qP3N+syIpxhsP2mhpLxJnwlCGl9gKw+6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feN/j6fHXBd/7dblKDK7XggJnmkH/YLE2J9No8W5RhU=;
 b=YhvClDYnz1HsZ49nTzhZ5XcxZa0thcIeRJqYH6QQhx8ExxRMhR4wLZ2q3oU4Cel7+kKnCMAcIYe9FG0i/epe5sVX/nA3fS56vGF3/pzey/ROQOaoEo8wGVi286HSzFiU+2iSdRQgnbQWd1HVKFS9rWAYLGZa/X+nF6p32hce+bg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 08:30:34 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:30:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bert@biot.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>, <john.garry@huawei.com>,
 <bbrezillon@kernel.org>, <gch981213@gmail.com>,
 <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch SoCs
Thread-Topic: [PATCH] Add spi-nor driver for Realtek RTL838x/RTL839x switch
 SoCs
Thread-Index: AQHW04W49GgU8cqC4Uy9lbOGcRI7vw==
Date: Wed, 16 Dec 2020 08:30:34 +0000
Message-ID: <410ca5c2-96a0-ffd0-e1c0-316fe37ff4d5@microchip.com>
References: <20201215214656.649896-1-bert@biot.com>
In-Reply-To: <20201215214656.649896-1-bert@biot.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: biot.com; dkim=none (message not signed)
 header.d=none;biot.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b4924f4-614c-464a-59ef-08d8a19cdb85
x-ms-traffictypediagnostic: SA2PR11MB5179:
x-microsoft-antispam-prvs: <SA2PR11MB51791C44F13A8EFEB818FA2BF0C50@SA2PR11MB5179.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ikHOoWvZ6MTJ5NAauMZ2Re4MD5AF7GAikY3sP0skIVXEqxDNo+GuWHPMeWTnrPxLZMDbbqJYFX9linRmDWPXap0Jt9ESYMNunmmKlrrUVmvgakT9508qWTgdmkQj7DQOF99ImGegdPDGO8TlrI5tADqUsogvgKWP6F+PvCiN/SOu2v/Ym73z3I5dLHOK+rzxOI/TMNFMJ293UP6k7gNkNRQXhdKVHgalJoLKCujvmiFfMmbiZqqZC6CnQE1beRbboue7AULFsXKIRQOK+Hw/NnC5nluewbEeu0sTdyJZ0i63CEfF9/618HTjSTXyAjpfvDGxPFP7ofrspBnbjfTtxq5swnD/lfKiLuUtndrLLxy5kcA/4o5GpKJFFQBQvMx1qxmCZfP1eu4FiyD4/IS9g/jrVShZ6AdWUUKt4U9ihZtBywaobl/KOCwyOA0T7Vzx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(366004)(39860400002)(136003)(396003)(346002)(5660300002)(66556008)(26005)(91956017)(478600001)(66476007)(64756008)(6486002)(66946007)(31686004)(921005)(66446008)(8936002)(6512007)(76116006)(7416002)(316002)(186003)(8676002)(86362001)(71200400001)(6506007)(110136005)(53546011)(31696002)(36756003)(2616005)(4744005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y1kxTjlXOVZQdVR0Ky8xQ3JEdVdXdWN2UWFNL3VtaEFPTndReEtNaG9HWjBr?=
 =?utf-8?B?Q3E5WTd5UVNxQkdiYTV5U2Z0d1VNTUp2TEtGVTFzNktpMlZRZFF3UUJjaG5V?=
 =?utf-8?B?cit6UlVDTGw2cldjbUx0R3hsSjJqUFB4MEE4cWdiMWNQcUZNVjkrWktMUlJO?=
 =?utf-8?B?Yko5TDNPaFlJSTMwUGc4NFY1NEhzcEUyWTd1dFZMai9ybFlkMG85VzVXTzJk?=
 =?utf-8?B?blcxeHZUb3M5ckZqMlIzaUdCbWJ6Y093Q1VmK252aUpMK01FdTFtYkxDblNs?=
 =?utf-8?B?QmZuZlh2M1E3K1I2ZFNLaDVHUVpkUXRJMlVwb2c0TFNJNnRCYm1waWRDNi9I?=
 =?utf-8?B?R3RqVlducXdESk1nK3EzNk1abTgyT0Jaa0VacXFJRmtyVSt2UGxwVVN1S2k3?=
 =?utf-8?B?ODREQmNieFFZbmdRZHo1N0Yxck9XL2Y3OWxFSEYzTk0zNFYwN05UVGN4SU9G?=
 =?utf-8?B?WnZOdDk2R09ZZGtsMnY2emV6cFNLZU1hczhyQUs4QlRsUkI3Q1htODZmeS9a?=
 =?utf-8?B?N3hGemEyb3BHTlZDdkd3ZWw1Mnc5NVBkWXJ0UGxjRWRwamZkNGQwKzBVQ3d3?=
 =?utf-8?B?OE1qbE54aWNBK3hDUEJ3QXN6K2lzUXp3SjRnZ1ZpUTU2a3FWUkJ1SU14REtN?=
 =?utf-8?B?dnBGeVhia0VObGhEK0kyVDBGcmtqWnhsSmtKOWNBVWltdWhIQS80cjAyOVFG?=
 =?utf-8?B?RWxRNlgxVTBHMEdmZksvNGNGb0xscnVLdW13YkpYeXYrbmVXOUpMelVVRjNq?=
 =?utf-8?B?RmdBV05HOFhqaFZ3Mk5NSjRrZGl6Skx3OVRFU2IvWitwVnR3THJRbkJ5a04y?=
 =?utf-8?B?SnhjRVgzdTdkZUVkU0I2V1U5SW5nNjRBT3cyem1mbnYzTmM2b2NDRGVLOVA1?=
 =?utf-8?B?VE9ZR25nNno4RXRMR2tXbzZlN1Bwayt0Y0dDY2dIcG84c3djbWpmdks1ZlJo?=
 =?utf-8?B?WkQrTXBucW1JcUxkNzBsWEhtdEJEZW1pemN0VEdUWXdqNTlkN1hZeFBSRUgw?=
 =?utf-8?B?dTFFNEFrYWFJQjJYZEVlQTBJS3FxRFBKVmhUamw4MmwzTFJuR1FDZFFHWXZk?=
 =?utf-8?B?c1NhSlF1amRaSmJmdlYyOWNjUS81bFRIT0dKbmhQTEs2dTBsWmQ3YW1JVUR4?=
 =?utf-8?B?VVJMU2plc2pkb1pVT0RRbldYdEowZXFidVo1NDF3RmQvcXhKY0JGdWJ0eU5l?=
 =?utf-8?B?aWFZbDM1OU1GOFhEU2Y4LzhBWTJLL1dSMnNiaG1McGNSaFRsc09LcG9HUFU1?=
 =?utf-8?B?bkI5STVaN0FvSDk0TUNsZUhXRUowOHpHY2hVanZqRDRHWnV2RFZZbG92Q2ZL?=
 =?utf-8?Q?9o3ZtqUQ4XzA8=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <8BE5687CBD3F0C44AA9A030055AED382@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4924f4-614c-464a-59ef-08d8a19cdb85
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 08:30:34.2287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uitgMLp/hl1NniDrmD4PTI84LE+KDRS0FE9nxnhe73Gn9sXFJ65YZ0vYY1BUgUHiDqLdy7GGr6S5ieWvvD5W1K+ZVCN7UjDsqKN+atXdUgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_033039_517859_DB6C3413 
X-CRM114-Status: GOOD (  12.05  )
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

On 12/15/20 11:46 PM, Bert Vermeulen wrote:
> This driver supports the spiflash core in all RTL838x/RTL839x SoCs,
> and likely some older models as well (RTL8196C).
> 
Can we use SPIMEM and move this under drivers/spi/ instead?

Cheers,
ta

> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  drivers/mtd/spi-nor/controllers/Kconfig       |   7 +
>  drivers/mtd/spi-nor/controllers/Makefile      |   1 +
>  .../spi-nor/controllers/rtl8380-spiflash.c    | 347 ++++++++++++++++++
>  .../spi-nor/controllers/rtl8380-spiflash.h    |  34 ++
>  4 files changed, 389 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/controllers/rtl8380-spiflash.c
>  create mode 100644 drivers/mtd/spi-nor/controllers/rtl8380-spiflash.h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
