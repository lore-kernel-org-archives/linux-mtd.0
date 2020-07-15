Return-Path: <SRS0=+X7X=A2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FCBC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 03:41:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61F3206D5
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 03:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLxp/yKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jgFEMvH9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tt4hAZw+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C61F3206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zpo6gH5kteK8D+4Jhje0x9vtmndccIxKgdRxlAk7wbc=; b=bLxp/yKuBRjCr99RvfNgjU6BJ
	EaJ2VUoAkj/jxRBsrGrjTuix1dYqRh47v+n43wn3jyNQ0tJki5rv65vxGsXRPTsODuP4DiC5enlNO
	qm3xJk0Stfe+A3zVbFydXJ7GQ5SOwyVScwkWBXztpcAlMpTTGskF1NRNeJicb3ZtNOfpY+PnH5eJI
	EfnRHxHdrDvfb3yF7BMUcEtXIV9e0MTivdnpXPiF4Ex2s/I7e8xhH3RUlRxhTPp0Rnv1k0UX+O9lG
	J75BROjS1Bw5o9YkUvk35KGzV+sTHac2FVwcVS2RvVzgakPibMq2g30F1KTkTgoAreJUDdxHdJCcz
	fwRz1TRPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvYHK-00080t-7p; Wed, 15 Jul 2020 03:40:18 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvYHF-0007zk-KY; Wed, 15 Jul 2020 03:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1594784413; x=1626320413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eKM8/Dm8nPH5gPrB7Mymj3FJ+zIUiGTPb0j+AWn6nHQ=;
 b=jgFEMvH9WIKfP6KSKbCf4gBatqP7rFCZl613avP302NaKVtWgTF130LN
 wrhzEWwiLPKgXLPhqT9PUtwJGe3tQrYHDV/FgLG2UCPp+cHRM0guWoqL9
 yo/GcLuGyAqculZz7eGZ5zAnVEJao+2pTcLaCWpr3npJXkfUJBXTI3Pgr
 9vLNwRSZ0cCWC5ifp7k4ni/9mhxPJdoSepkH9QAMSP4EEE2sNfkRWObr7
 f0MrpiVRO/b0XQyRDuJSCapWjMZqj2/gyI/+0WXvWHNfJtieZwI0Tmz3h
 ryDTuSFcNFcDdcQb83Nz6hNNVvxRZNDtDNhUwbkhbjyCKWR58bud0SU3z A==;
IronPort-SDR: xdcrL1V+OL/OgjPKOyZ8+YcjVPbQTYIYuzytWdz4RbhWIUn3DL0NK5UX3eODhSLYnDd03djPrw
 JZ8S7Kf/6fhUZPVYVOzefofGZF9TW+l9rSXdM985hug9V7SRoXlq8o8awE1igcwnu9qwqvTgLj
 ixvbHwtkhh3GkKU/uYDt9x+N39J3MgkHas/NthujWVV0kfiakBq7HMSz+UCk3tS/fEVm90MI6S
 h0wqTmBJJ9c7peYgiW3YAgR2xyMFpYVkKm6x3OxARFVcbVGKwnhPvvk098Ife52OAeEsAb28R8
 q/0=
X-IronPort-AV: E=Sophos;i="5.75,353,1589266800"; d="scan'208";a="19228366"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jul 2020 20:40:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 14 Jul 2020 20:40:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 14 Jul 2020 20:40:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqDjQ9pKZURCvHjvrMuSbayijL43OjbArkqEfk4D8/vnEENPPqQQr4/w16NYr/pdf3wK0A+eIPDPByHoLxxax9ul6lAKry5OUKoIRUIqsLJbsNT8xL9mCzJxh3y7foPSVqbA3HVBcY7ON/pHxpVP+z3/x+0sHlx6+QGKHukOxIB6naUSgrLPVijslnFE2lLLFbZE3F10hInXfXRNRSCrp58lcD0bYeNligPAX+e75w2m78fDjmW96elOKuTf/lK4XLJ66QxureyWsvmdwrc9hRlQcfaqwfQf3jXZoCGRqpd3zuXh2mjc6ukKNhh+TTAKUvebpgdXhutKENWGMMO9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR1ZT07LcbtLX2nHPWSFHFhp/4OrIpdnirumqv4S3YE=;
 b=I+3xRDODFy0qUpGJY8R3ukLJ6UQcB/Au3MjZYrw7IZzHsGFzRTST99SZTbHMVwUx/aoYscxI1JCsDBFGKs3upCWJTghNTFrYv0CO45VTlZ5UJna7HOFVBa0VhY+W9jpEO4w5YzBV3OoPs0xtDql0hjeAS6dy1e+q57W1n1HwCoV8nxGnFWrOguVxsWW6yZErHqSKe1fNJbJKSE3ZjPvXhg1LPJtjj0dzn/hcrio3yPQKte3qI+f8FDRsTCj5rVJtrdG4EiTdTA2aYwYC1Uo2tOcdtWiO0+nNLzPKYASHS5c3LJKMlKap79rb9Gl2Vhw1//S4rH1hMJz86sKflABKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR1ZT07LcbtLX2nHPWSFHFhp/4OrIpdnirumqv4S3YE=;
 b=tt4hAZw+pVhbO7SMxjjIVl5+Sud9POHnJNr/yDrQcJYIh+ROUJMetwS4IiF2RKehRoFP0LRWhkbx7+bU7P1h+MBYZpVSJ2PM5+9zRB+YHmDxIo7loVLKEvgE9ONj09WcR53HckOcRpEdntKALEEX4wOTWt4O0v5jVMwsckn2oh0=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2741.namprd11.prod.outlook.com (2603:10b6:a02:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 03:40:06 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 03:40:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <broonie@kernel.org>
Subject: Re: Re: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: Re: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWWN+dU3MRlEjPj0CyeRCYqGYmmg==
Date: Wed, 15 Jul 2020 03:40:06 +0000
Message-ID: <afa04032-b886-81ea-7c4c-07ad281aeb98@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <e6d4c015-b70f-40e3-2275-89d245e817e8@microchip.com>
 <20200714191947.GI4900@sirena.org.uk>
In-Reply-To: <20200714191947.GI4900@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.122.210.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd64182b-e8c4-418d-0704-08d82870c443
x-ms-traffictypediagnostic: BYAPR11MB2741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB2741D444E3A6F34DB56477DEF07E0@BYAPR11MB2741.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EuLQbpM/HkXHl7bfPiK+hL+sEsoY53dNe+bDZR1XXYxna3fZNm2dpLiIxva/vM4p5nYkd47+xD20n/4rFxzkISnjhWi5zVIxZcD9UCQsgj0388n+omwvS8MKVpRZovcerCMDXNmJLn4pW4aVCtSMuh/WmwGggiRY5pPKoUXwxxV06UF0H8Dc+H8nBW5/ELjlVIzlvmnUDWinKp5BjNonrbAfMMLvJg9FWUzI/iLIezdM5WzB35c3fgqRb231zt3K685C8QnIWSnL2LxVuXtMuUGmBETEwYuovxMo/8Y3gofNnWhAFLjt4FQZVSuOthzcUcdWd7kcgMZhlo7/z/iyPAKdxrx+owbyynLDA1ji+1JDCgOBa1DPupBJUQlQYih6pwTowagOJ8S2UZaa9A9pefx6z2l+L6ReWdEgdC+iRmaSD8z2vquu1Q4WLDTFe0ic/7UzL7X9LvFWb2RJJqBVkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(966005)(64756008)(478600001)(76116006)(7416002)(86362001)(2616005)(2906002)(5660300002)(6506007)(31696002)(91956017)(36756003)(66476007)(53546011)(31686004)(54906003)(66556008)(66946007)(71200400001)(6512007)(4326008)(26005)(66446008)(6486002)(316002)(83380400001)(8936002)(6916009)(186003)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4aXFAirlv/LBEo5SbvvDMN/ex7xRliwP0vCQhVbefdnoLdKmuqTIPRy85XB5PUf6w7TTZnlkdtGmyc1UGwEYuRqluuP/89f8gpan4k8YVPKKUO8gre3cCG4vVDG6T4E5sag5KeNqXLw6WMI4kNWE36WS6Fo/1hHk8YBQWhmKsHKOUGN7QKBqKO5LBORCDO02ftztjEML/xtUM74XYQKgtJe1R3hTaD8So8DmjiHwxEMFzbDlowQ+c0xOUlPv8kvLjwLDG/RgUECc7VA2pcURFQkZtkojU3wkCBHj/CeIf47fAP2cPH1d9VkaDl4ilcPDV2U5AZplWaFc5l6XZlGa7Bj3EPHAgQCy1yeWoiJ1roL/mfc2QQIW1ys/A1qBa8E6dXkwxIQi+VrXthv5IrmjGO9/iNHI1o/Lz2g+r76EbTIvWoDgxar6RJIBT66cyy2CmV8Q6yIWmjxxZ9mABUwmUXyw/8NNfTPUxI7ERO8dSU1mQ+WN3fAjWTJrBbqWziem
Content-ID: <13CCC07CF7F57F4B95EC309B09037CB5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd64182b-e8c4-418d-0704-08d82870c443
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 03:40:06.5461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxaPsg4hDN8uIASWRQ/mHYFIedCgB1A9QhAxsPDMstOI2+qp2DDNTzsdl+gWWgyRDacqDcbucUfkXGz6la7doYmkv3ZviCX53bRH7Z3EsAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_234013_799028_DAECE3C7 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: alexandre.belloni@bootlin.com, michal.simek@xilinx.com, vigneshr@ti.com,
 richard@nod.at, nsekhar@ti.com, Nicolas.Ferre@microchip.com,
 linux-spi@vger.kernel.org, Ludovic.Desroches@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/14/20 10:19 PM, Mark Brown wrote:
> On Mon, Jul 13, 2020 at 06:34:12AM +0000, Tudor.Ambarus@microchip.com wrote:
> 
>> These four patches are looking good, I had just few minor comments.
>> If you too think that they are ok, would you take them through the
>> SPI tree? If so, I would need an immutable tag on top of v5.8-rc1
>> preferably, so I can merge them back to SPI NOR and continue the
>> development on top of them.
> 
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
> 
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-mem-dtr
> 
> for you to fetch changes up to 4728f073bfc66b8b555274ef0d7741d7f5a48947:
> 
>   spi: spi-mtk-nor: reject DTR ops (2020-07-14 17:29:40 +0100)
> 
> ----------------------------------------------------------------
> spi: Support for DTR ops
> 
> ----------------------------------------------------------------
> Pratyush Yadav (4):
>       spi: spi-mem: allow specifying whether an op is DTR or not
>       spi: spi-mem: allow specifying a command's extension
>       spi: atmel-quadspi: reject DTR ops
>       spi: spi-mtk-nor: reject DTR ops
> 
>  drivers/spi/atmel-quadspi.c |  6 ++++++
>  drivers/spi/spi-mem.c       | 16 ++++++++++------
>  drivers/spi/spi-mtk-nor.c   | 10 ++++++++--
>  drivers/spi/spi-mxic.c      |  3 ++-
>  drivers/spi/spi-zynq-qspi.c | 11 ++++++-----
>  include/linux/spi/spi-mem.h | 14 +++++++++++++-
>  6 files changed, 45 insertions(+), 15 deletions(-)
> 

Merged into spi-nor/next. Thank you!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
