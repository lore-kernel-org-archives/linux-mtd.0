Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC68C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 08:44:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC4B20714
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 08:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFIfHJLC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DFmTULic"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC4B20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYD3DschFs7ex2O0E+zeRzGTgs/UJe+58CG7u0KyffA=; b=VFIfHJLCkyRRkZ
	UnJSQo77LLSMb6VLhgX7FwVtEdUKjTUd5GjlvUHKWkrhFhdY94VkEhh6OzMgx1dzu5JgzoJrEZ+zj
	S3IVx25fLg1gEGdcdPCSm7OYulOjhPCPCONW34Y0U7DTfFojUsXSMURHjtLH5zeztQRLpMKULdADi
	Wq9nngh0gD+pojYJd82gtZFX/u5yklFeFl/nUOGeHBcHgnI4OAQEfRHRrj6UJoZvADDPWwe4M9184
	45JgSdGdqARENZXJbV9Oy79WJJMJWfhkIp1yj31W63EtvJd0TFnHDWxFaGFABZerdDxG99NQVA4e8
	9POXnqGFtaBZNk7yl8Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHkbH-0003Bn-1W; Fri, 27 Mar 2020 08:44:23 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHkb8-0003BC-4g
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 08:44:17 +0000
IronPort-SDR: mOURTKBDDvTCZqSWhrcsiutFtn3/2spdmIAh8uR5ZEN73+anV6iapz6EEYdgiJLfS55T4QXp+u
 +Do0wzJzdlMP3wbIex6wt+P6CQ0sZ+yk6EkQ92gkbuzh6zVzPUlJgOK1ltnSNmyqmmEjD+3MOl
 eA1hbkgXpNaswAI/9y96B7bx1X2WlQkK3Cvyymk/PBM+Ex+Ns7XnQVFDDzjKDgI4crY4Sj7Oyv
 8sqqYM7+WysRO7iCIxyMzWFrC9TZ7V9YNJb8t37T9p6f0XJ2fqNJukErXBlVH2bty9y4Lz1BED
 FXM=
X-IronPort-AV: E=Sophos;i="5.72,311,1580799600"; d="scan'208";a="73725025"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Mar 2020 01:43:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Mar 2020 01:43:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 27 Mar 2020 01:43:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKHEWn1V3VyMitBpJFZWcaIjbj/nTqGlv8Oblx8su8UcxfGFbaYEkt8C+w3sntg12GA8FbkPaNb8DofVOfrqNOCflApuNvJKzND0pzwlk3BqiDMEhJz2AhZyp5pvDXO0dtPlCddppCHMQGvl6yKhHkS44nt2f4gvwXhLCV3f1hA7uSFOCi1KNOO8nqfyUuqUvVW2LO9RYBpyO4vyiaivI7oNw25kMKGNSRI02KYu+LSPdRzNU4p4hfWsCi9J2D6TkzHr4IzuHVO1yWrINrtDfp+ypASlupfj4oMbBDystBxTCB1LBkdsC/u1QeaEbqwPfLnK6sNH7fL5uSARoQCd6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isPVJSfLMdMQ3xEJEuzUNE0MKq7CSXI0bnU2TISybiU=;
 b=N5gdtwy53bC52uJJckPsIZ9qGPF+mNzhVS9Z8xlD/uau0dFge4DF86lgmhOGW04SDKHoUDzwrCAOBic7WWfSFrU23J7xTeZ6HrXCYxAb+/nWwR355n0VRVnpts/idmuY+h8P4Jj5JhlvaNsX44JTUW6+NOtz72BEMljJODSzl8kIDczvcMePkJhrYWvQHNcj+Y7Lgk9gv2vLRE3leHECLDDZzAvUp9LTlRfayY11C8hAGpgMvIgU3DuO3BQS06ph/WVm4d3WW4pSPLd/CtQVh3wR18PxcrpuB1hloMZY7pxJaE59SwEc2WH1I0PMOXlub1+3G+sZBdB7tnrHnvq6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isPVJSfLMdMQ3xEJEuzUNE0MKq7CSXI0bnU2TISybiU=;
 b=DFmTULic3JiqI/oJM5rWWR4K5kWv/D89xdSz/69Ux8OmtyFDR1cG/oEea+V6GEjVVqCx6ICJ83CepE4cfgyHq28XnCDtYBbomnarfuSN1E1OcwFH2fu1LzQFRGmWawDw3/XzUrZAvTxAVBC2yyytm4or2oqppD+5GPwrSImRXGE=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4498.namprd11.prod.outlook.com (2603:10b6:a03:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 08:43:53 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 08:43:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: Convert fallthrough comments into statements
Thread-Topic: [PATCH v2] mtd: Convert fallthrough comments into statements
Thread-Index: AQHWBBPXknEEtiCtukmNSeqEFUoMUQ==
Date: Fri, 27 Mar 2020 08:43:52 +0000
Message-ID: <11409771.dsHhkDzkrP@192.168.0.120>
References: <20200325212115.14170-1-miquel.raynal@bootlin.com>
In-Reply-To: <20200325212115.14170-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0be3ee7f-025a-415b-7bba-08d7d22afa82
x-ms-traffictypediagnostic: BY5PR11MB4498:
x-microsoft-antispam-prvs: <BY5PR11MB4498FAAF0A224067E22FDF18F0CC0@BY5PR11MB4498.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(366004)(376002)(66556008)(6506007)(66446008)(76116006)(2906002)(66946007)(478600001)(5660300002)(4744005)(26005)(66476007)(9686003)(64756008)(8936002)(6512007)(53546011)(4326008)(186003)(6916009)(316002)(14286002)(54906003)(81166006)(86362001)(71200400001)(8676002)(6486002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4498;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gGq1+uH/5bHSj7kBut8XlpMN31Ve0sCQcFWQhXU4iPwOS8Kd6F5ikVX3kAEOVl6B09TY1Kwl+IyiJXsCumLzlklX+kZUY0VSKX4JkV5WDbAQQNd/7TbXzvs2mqeO2fHHQsmw4dp/5zWrvZ5nvly52PnZ5lTR2NU8JxuZZr161W0dRE5SRI1i+UOT+at7VBT4eBKFZFtWitIvUMFDdZEbnBZpUNZMSsMWWynwBp3CYERyx/+WzrECtecOUQygfdSiJFO9e+ALoptdX1jDiuoJpTEbfkxwm/SfytVservnH3C/8XLpvXNk6i7t+rC9BKifoB2SEXWQA0lndRQmOPaecmPmrThvA9DA+aVfpKe4SHQ6C6QMsV8XLrvBi31CLhjWa+noVr1QPIUnEHnwK8yxil+baPtx06C3kX7q8Hsc8cjrq7meZ92+ybbBaj9ebPcB
x-ms-exchange-antispam-messagedata: 5O+uoWB62/OmuviobWRDwlvGcA5uVnzNsZ6KpP5O8aEK9yxgVleme0oyaaIzsUWQZCzdA5X4xdefdhStVX5YI5P9uIik63cijM5NOQyNllD+cnr1P90QjmXVwKVkRnLI3a0pC/ERiPdzMi/TEV1jaw==
x-ms-exchange-transport-forked: True
Content-ID: <EC5D2087C1D8A34BB8A1F9D6D138079B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be3ee7f-025a-415b-7bba-08d7d22afa82
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 08:43:52.8619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dpm0GD3iYtZaIFZCp8bZPvpJeIVGwiNHkaauyL7DvjZQ7pfJkb0McTe6tVTDdsJE8dmK3KMDVaCaI+Y9e2VbVoZFYDoJcsc1KSMCdtyh4pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_014414_250836_BAE9E211 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, March 25, 2020 11:21:15 PM EET Miquel Raynal wrote:
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -623,7 +623,6 @@ static u8 spi_nor_smpt_addr_width(const struct spi_nor
> *nor, const u32 settings) case SMPT_CMD_ADDRESS_LEN_4:
>                 return 4;
>         case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
> -               /* fall through */

just noticed that you forgot the statement here.

>         default:
>                 return nor->addr_width;
>         }




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
