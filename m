Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903B4C10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:11:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEBC2073F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 09:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ljzCZcxL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="raNtgJ0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEBC2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUze7uM/CqXZgjIHdtD4K0W6Wl57Pb/5cg9l3+Vq63c=; b=ljzCZcxLDZe62g
	oMbIJv7FmPLWlZ9k6nEAwr+ERhneTUDcCgeDgUXAynWSk+8WxIMBaS5jJhwG8JGAgNEeqxmm+ZfBd
	oD6MhOrcIjLK5j1LBGQv+Oc+mITdmk8pWxDtI0E1uynyU/zHcrxOIZyv3YtyUh27Hgzx3LGf0QnP6
	mzq8N/upeEmyQ/yY4obH+5zkWDq36p7VtIrqw1d0+l4nvsUVZ04vbIU4K/TfCbdsW4nt1LK+qF4WU
	ihkDYEiDiIYNMRqTtRd2xW236GhV4LvVc8n5Bo2xqW4RRKJCmWSKnQbQ9sEfCfm0nzxrl5gsxEzNq
	uPBmHlTUohAFqIo+pW6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxdi-0004Qi-UA; Mon, 15 Apr 2019 09:10:58 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxdf-0004QI-Pu
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 09:10:57 +0000
X-IronPort-AV: E=Sophos;i="5.60,353,1549954800"; d="scan'208";a="31511630"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 15 Apr 2019 02:10:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 15 Apr 2019 02:10:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYUebBFojl6+OCI3dAbHxeqpWoXQp6QdvErH9nw/INY=;
 b=raNtgJ0UEQV6a74Q73g5lZ5CuPoxOTTkVtUrntf5pU4bggZsIa9M8K/StipaCMbvr/DIAcx/VBbFzEgzUqQFRjpRkZ1hosEgceAa67I8Vurw/lDIemZ8lSzHwuqJ2+XlN3RxhwTX1hfVVDGvuKSgLNoqYCTRLQea/JmR2QfLhiQ=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1316.namprd11.prod.outlook.com (10.173.26.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Mon, 15 Apr 2019 09:10:49 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:10:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Add support for Intel Comet Lake SPI
 serial flash
Thread-Topic: [PATCH] spi-nor: intel-spi: Add support for Intel Comet Lake SPI
 serial flash
Thread-Index: AQHU73CfZBa5TGAvY0awodbZbSzUe6Y891IA
Date: Mon, 15 Apr 2019 09:10:48 +0000
Message-ID: <4a314ca1-281d-27ea-e774-6916aac71df9@microchip.com>
References: <20190410073923.35693-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20190410073923.35693-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0602CA0004.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::14) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9dec8e4-e653-4d34-a0dd-08d6c182402d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1316; 
x-ms-traffictypediagnostic: BN6PR11MB1316:
x-microsoft-antispam-prvs: <BN6PR11MB13169328E0D85149208A858AF02B0@BN6PR11MB1316.namprd11.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39850400004)(136003)(199004)(189003)(31686004)(26005)(86362001)(97736004)(8936002)(68736007)(486006)(446003)(52116002)(14454004)(11346002)(6512007)(31696002)(81156014)(81166006)(2616005)(105586002)(53546011)(106356001)(72206003)(305945005)(8676002)(36756003)(7736002)(476003)(4744005)(53936002)(186003)(6506007)(6486002)(386003)(66066001)(316002)(25786009)(102836004)(5660300002)(54906003)(99286004)(3846002)(2906002)(6116002)(229853002)(6436002)(6246003)(76176011)(71190400001)(110136005)(4326008)(71200400001)(478600001)(14444005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1316;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cXHf7+vk6daZPZqN7pF0NH7+XbsvUvnxqtdpdyrDu0khtBTeFgpHZMZkrwbK5EyD/nmIeviVS57BEGZkUKdJrkKqF/7X3c6DbhsYhzxgADG7vXUe7j/7cvxbqD2Uw55U72tXFzGNPDCj2D+6wkGLTZ23KaNSKT/sDa+lc+Hryy+tNhaz7HOLTmmAJCjpzBVYItvCb+jg02vMv7vynNcMGTZxuUVXPTsTbXEpGrNNglfbxyJBjtEKlklg1r96VknySwzmvccJ+NRhQSHaKwcIrcLPGQxg9AZrrnKaVMgRW4/2a74aH6v49V0sxlFRluQ6fEGctSOW+iuRmyZYgqE3bSWNr3lD0AdPQaAzDgCqgtXFtbpuyclwKt/Scl6K9Uk3Z7y/NLE06FQErhgTa2O2Vcj+S23d48O7j/YLo6Xsx+k=
Content-ID: <D3EEA38AF7869D4B821D379DFB1E2CCB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dec8e4-e653-4d34-a0dd-08d6c182402d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:10:49.0138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1316
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_021055_949824_13EA5B54 
X-CRM114-Status: GOOD (  13.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/10/2019 10:39 AM, Mika Westerberg wrote:
> External E-Mail
> 
> 
> Intel Comet Lake has the same SPI serial flash controller than Ice Lake.

s/than/as?

> Add Comet Lake PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

with that:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
> index 872b40922608..bfbfc17ed6aa 100644
> --- a/drivers/mtd/spi-nor/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/intel-spi-pci.c
> @@ -63,6 +63,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
>  }
>  
>  static const struct pci_device_id intel_spi_pci_ids[] = {
> +	{ PCI_VDEVICE(INTEL, 0x02a4), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
>  	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
