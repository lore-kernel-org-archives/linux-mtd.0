Return-Path: <SRS0=hsQV=GV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BA2C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 17:19:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB7522C9E
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jan 2021 17:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB7522C9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CiRkS7WkDWleUOk73Wx2NhlbQCVPx+uEe8iwj20fjQo=; b=X4s7+1MhoJRl6BlcqJ0ZTO6EN
	XZpUY61Mc1E+1YY96meqaDTwHrisR/T32mblVF2zlxIU2QYr5HECWz6et8+7vL4ihz/b8mvmqgeKp
	kllqaWHko1tixySCQZwsVvnsGy5SQYM8X3xqPTRZuLDN+yDHUjXZ04X8ZGL4/rNfGmdjIuyOAaU+r
	PM6TtxKe/fsK6nNS+VLJP64ZRxu8QTFhJPa644g85ucSRb4tvN0SERhbAJ2MQ4+hbgMYUYqJSHnAe
	U0vmdYrn0ENOSIHdOmHuVWD0EpIT3jTZFu64YegnnpMLakkjmrP8UMJ3Z/KBPE87v+8Yc3aOX7/Fq
	Aik9CaCKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1YAb-0001jl-Io; Mon, 18 Jan 2021 17:18:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1YAT-0001j7-GK
 for linux-mtd@lists.infradead.org; Mon, 18 Jan 2021 17:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1610990297; x=1642526297;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z3WE70rTfT2ip4YtkmaI3sgcoRAkVuPFL2m8X3H/cyo=;
 b=UwCWzdLAzYzhGRJ9IHZWh6igkeDFODBAm5mUCRgSs2JI8EWQaT8y6CnV
 CL03pX8Kp4oR2+isuDdkfVG1178cR1pewOAmgD5UhY04VAIt2tqIKuC7u
 cG1N77Hq4WEk1pQowlVGNnAmch1zBuDSJFU73gfEoy/iGcALnCvXzxYb4
 Wsx8rQneQ0OQ9+9UWzdvv+9zDPZhsnpam0taVleFF3/Ke0mLwXlLVLUhq
 0JORWW1BWWa7MxrvaK4/L44WJekNJEA7Jis92uvuNOCf3RPnEaKqGLRRI
 GHqjj0gM3C/xkiaXkfU0gdKUdj6OlVCxfgh0sBfXnRVCfs/kSiIJayKm+ w==;
IronPort-SDR: aA7lGxhVDRlS0h/KiQdmFfCxoRu+pM/p4s9aCrHNu7WaJT8bpBAoJQFLH2Rc2SoQY5jYucWyBL
 a3/YOPE1urzrDNfe0+9ufcaqtJw3yCCJhCdxgUG5gs8R6xAqWbXeGiIwdBvLBxHUaayX/Tv7Ex
 /smO/Yo5Ik94+szSi0zKIDXSYw+OXyfOoXBGTKmT11SJbV1Ns5aQ4rGCLtRgvXA6tjAg3jLeD8
 pNmK7xsdq+4ULjYhp85JuO59ovqI+J1DV044ZBe+nNDPKO8bhGJi+3mxsWtU9/1sk83wqKEXuo
 S/o=
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; d="scan'208";a="111470806"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jan 2021 10:18:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 18 Jan 2021 10:18:13 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 18 Jan 2021 10:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtjmeFALYEu8dUa/dVGtnczThKS5eTJsRDe07+002pvz44w/fb0FtAMhwOmwoAo7Z+gn+Ea8gHsiU6p8m48wXi0I9rxz0VGVNL6ewcPGi90X/dkP9HjbkL1VWLO/iEVGGTVBnzg8izs7ludFsan368Od+kqiEobKA+mOQEaJjKxoOeSlFd9o5991aB35UO9Fcwc2nPszxdVzRBcoOrwns3J64An7kQyZ5Bx+18cd01VM0K6gnbg4rgY3G1x6iDH1EluZGPUZT3QhYvqQVDI9zMVVKl3epcvvVef3+ZPextMi46xClfXobKnSMDlfyRd1r/LLVmKOXo2qT4I/Yoiu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3WE70rTfT2ip4YtkmaI3sgcoRAkVuPFL2m8X3H/cyo=;
 b=hd4BasbVo5LASuKdzi+8XlAu+axo1CaHzD8qav7VD4F7ZIRT0FrHPhpJHOlWChT/CsrkAKFTr17bUrQKit3OYoL4VG9frNBSa/N3ep9ae0ifVlnrBQVoKIDqpnrsKPt5L1xAH6o1SAmGg/vtSz2OK6ZOvptLy7WWWLku5eQsa3QA/O4GcRD4bLIvl2VWbvSy3QwJAQ2G9wjlaK3b5D7Juwd3RCdnhRbDYS18iYP1GrI+Goe+pST6aaqrkIXmFsLoj0C3irduBzMLUJAHEdNFO9UL93ggu4jJ5idaAh5xTkhBLyDAjvfW/VK9ZlcFQc24euUH6W5dTFJrdEm4ybPaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3WE70rTfT2ip4YtkmaI3sgcoRAkVuPFL2m8X3H/cyo=;
 b=EcoCJuvZIFa9iSDM+q+GT24eXG46rS9v+giQrm3yA/DmifaGjQb1DC2oZkRORX18lJY/vtmgoxziKT1O2Hu5cAmZgeS5DrKaAH9edaBs+gnauL/AdOcFW35TMkWgN6+jMixHiKgKedqkIrwvwiPaoUeU+9ihsigUeus0yg9b+kk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 18 Jan
 2021 17:18:12 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:18:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <hongweiz@ami.com>
Subject: Re: [PATCH,Aspeed, v1 1/1] mtd: spi-nor: add Micron MT25QL01G flash
Thread-Topic: [PATCH,Aspeed, v1 1/1] mtd: spi-nor: add Micron MT25QL01G flash
Thread-Index: AQHW7b3mOzC2ZxNdAUSBAvVOs4tDIQ==
Date: Mon, 18 Jan 2021 17:18:12 +0000
Message-ID: <dcd8c798-86fc-640e-a481-3648055c242e@microchip.com>
References: <20201208202220.30302-1-hongweiz@ami.com>
 <20201208202220.30302-2-hongweiz@ami.com>
In-Reply-To: <20201208202220.30302-2-hongweiz@ami.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ami.com; dkim=none (message not signed)
 header.d=none;ami.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acb493fb-aa12-4998-324f-08d8bbd5092a
x-ms-traffictypediagnostic: SA2PR11MB4793:
x-microsoft-antispam-prvs: <SA2PR11MB4793D468EC6049E0296AF6C8F0A40@SA2PR11MB4793.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /vwG59LZ5HJ8wCeB0UeQTEbRT3V+MxqgC22M7b6ejmSEDZu0CseZLKt+LI3rYd0lnQwlpa1uWPCiHBu7+O43VbXKGhaOdyJHsCUueaTuxpqlxeGYUJBDzwlQ4P3cVWOF6j8Q6X4lQ256whvvfj78SdjYVAwaHHkuOZOY6IJWTGae784JCdeqk62OUnRk9jEXj7lMIAwAIPEP+nJqsJZ/n0bVIkjQ6pBP2U/eI+O/+TY+3heTOuE/c/JBsPWPQB4gQ6a9l6pS6YQbHlTxdu/rG6tfPU1XGagvW3NiH2LY43C4vj4dC68FiLIB3ejvyvLBJi6FLxga9GpLBiE9jdw25mj7Cnkwts227nFdZjUvj113VFrBKCwypV9ekvYhQFaXPrD2ajSS+l0Ptc/F6IvT8wMMQGDDmZ8+esaBQdUW1FkNtUF9BQtqkvnELHX5TV7olwmmUVdP4QQUT0PeEZ1VL5/hLGuY1AWwd5/Lc5CJ3bM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(26005)(186003)(478600001)(66446008)(5660300002)(2906002)(31686004)(31696002)(4326008)(71200400001)(36756003)(6916009)(8936002)(54906003)(6486002)(6512007)(66556008)(66946007)(64756008)(8676002)(76116006)(86362001)(53546011)(66476007)(6506007)(2616005)(91956017)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Zko0UXptZ0J6aWFWbnZsb3pwSm9sMElreGZrZkZ2ME1mRXFFR3FWRERzMzdD?=
 =?utf-8?B?OEFKaUtmeHVNdFlpVTcwKzlyeVBWMkdrVEJFUkV6Q0pPOXlZd0U0cExiL2xY?=
 =?utf-8?B?THVJOHVvNDBzcG15YkgvODU3QjBNMTl6SG5nSXl1U0sxelJiWHpjSjUwTkxt?=
 =?utf-8?B?d2c0VlU2bHk3RENNZ0ZtRUxZYjJtOVRjTXlHRndjcHBvYmZqZGJmbE9KaUg5?=
 =?utf-8?B?NHEwZitiVDV6ci9nT3pDRnY1em9DTGxLU2M1Y3k2RlRpV25TNTZQY2tLNGd0?=
 =?utf-8?B?cU90MFVncE5lZkUxOERLWjZWd25SazhuY1Z6TE16eE9Dd0t0aGFCMTcvQTNQ?=
 =?utf-8?B?TERINDJ4Y3V4MkcwWkZmeTZsbTEwNTV2QWpuNElpc1pZenlQWGRpdU9JZ1VH?=
 =?utf-8?B?ZUFUUVR0Z2dQSVE4eUxrNjNTUEFiMlBKUkVNSEFLd3plSXJHblR0NEM0VDRS?=
 =?utf-8?B?SUVVcnJMWlplbVVJNHFaVklhT0ErQ0p4ZlhoMC9raC9NdzJxSGt5UkNBbVJh?=
 =?utf-8?B?YmZBY1ljUkpNTWhpMDg0Tmx0em5xNit5Qkc2WEJBSTJxVm0wTU4wRmhBTkdE?=
 =?utf-8?B?ZWtoNGt0VVk0OCtEUFROeXBDdi80U1ZINCtuR0NGc1ZMQWZPcktUbE85VlZD?=
 =?utf-8?B?RnM1Y2s1VFZOVXgwYXRmSHlqeWpWOENoT0ZYZHBoR3pTdHlGQXYveUpyNFRt?=
 =?utf-8?B?S09DREl1ZlJEMEozOUhKTXk2Mkk1clJmcTdBTndmRVBQMkczRlNHaUR2ckMv?=
 =?utf-8?B?R3NScFA2emhYbi9iTHAwWDJBVUg2cVNSVUMyR3RMT2ZnTmRoN1IxakhkRXBm?=
 =?utf-8?B?TWpRVG9paW84Vk9rMEovK09kTE9rd1JRSmorVkhGbkpZeDl1N082VkJFcWE2?=
 =?utf-8?B?eFZ1NGJZZ013dUtlc2pUMnVORzlSMlVkM1RNZjVTclVrOUc1c2FSVnUwdHlI?=
 =?utf-8?B?K05MbS94WmJTa3FMNFdnQTliUnBEUERDajFvUkxtMjdibytIOWR6SzVqWkRE?=
 =?utf-8?B?d0dMVG9rdldEN01vcUt6SEJ1aTBxdVo5bno2K1lYRjQ5eFVEMkRiV2IrOWow?=
 =?utf-8?B?M2xWL2ZmRFZzaWZEbG53bVh0QWJzZC95Y0VNZ1o5cm1IR29EWDlnR1REZUhl?=
 =?utf-8?B?MnU5T3hYaEM0K1VndXh3NjBQeDRvYXdKWGlJWHI0eVk0UEVDN3pNODFodmRJ?=
 =?utf-8?B?Si9JZTFubHZTc2RiRmt3aUtZbzV4aUNhMnpvQmZZWVFMUjB1MEg3YVdhSCsv?=
 =?utf-8?B?UCs4cHlpY2RBeW9KWW0rQ3VZRC9YQmpqbEdIWlZFKzROK3VyKzFrT2ozTno5?=
 =?utf-8?B?MHpOTnh4cGRrMEwyVDhjdUQ4c3dOOVBJSU5MVldGVStydTY3MzJwb2ZyWTZK?=
 =?utf-8?Q?PXIH89PJY2b5WN4P4KOvNPhbRmiePnbE=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <C40E029BC553404E87B58A81CD97E02E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb493fb-aa12-4998-324f-08d8bbd5092a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 17:18:12.7829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tT3kdQ8uAvEc7rxkqT3skWOVIAvutRUYHoiNrDMCu2SnuBTw/NwU9o9q046b06K4/rBgTAl3XuZi3l14fFH5EKmf4qu/HbZjLw+TbM4tKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_121817_869988_C0DC7AE9 
X-CRM114-Status: GOOD (  16.57  )
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
Cc: andrew@aj.id.au, linux-mtd@lists.infradead.org, joel@jms.id.au
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Hongwei,

On 12/8/20 10:22 PM, Hongwei Zhang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add Micron MT25QL01G flash, used on AST2600 board.

MT25QL01G is a stacked device (two 512Mb die), and we don't support stacked
devices in SPI NOR as of now. This flash can be added when proper support
is added in SPI NOR. Would you be interested in working to add support for
stacked devices?

Cheers,
ta

> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 99ce971ebc6d..800890038c39 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2312,6 +2312,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>         { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>         { "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> +       { "mt25ql01g",   INFO(0x21ba20, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>         { "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
>                               SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>                               NO_CHIP_ERASE) },
> --
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
