Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21810C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E226E20870
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hr6j2MGY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="10w3KZ63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E226E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePnk2wAZAjNNaqyO859NR6yXde7IP7mp7p98iLDPFcs=; b=hr6j2MGYE+fjZl
	jyBXxpOMGkzRHjx12gCcX7FAmhaDXcXhXa8s8RWYe/B+VHeieEk+Kfj3r0++/RU4uoH++S5q/1RrY
	d0SKouJBU0/glchoIu/wL8Rn9dSKDHbflRouGGFieREsWNdTnvtzl8Zz330vDab/9vHDwaaGXmvtc
	dXXCQi5zTI7oSMSuAJ2AYstHY34/B9aY46XFxoZsOayXscuOmwWh+GYpUYQnVj8c0qI/QZq18fdL0
	LwVedZ7xabdjk9r6Xu6HcuOeYW2V1DUrfcxLwSQ3Vc6alXdBaDxxNYBixg+w5gNSbB9KyShwseJbc
	yO30pQgv+eY0xtYdj6bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWcpX-0008Pw-Dh; Thu, 07 May 2020 09:28:35 +0000
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com
 ([40.107.94.60] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWcpU-0008PX-Im
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 09:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpy/orWg0MOdfnTDF+nQic3E+kLksbQucdPFhS0wsvAkTR3tJB8QjSa76WMW5LEtC+4/2x4KzpNIZAU0BUZSjaT5t97FMepKWz/ReYstNqx6fCfUbXIIIFjG6N/8DC5MpfpNIGB95kRFjF/BN7UDJBBsQwmkfRbK7R82g6sYpSkzzTu8xL+gWvJGejmKfvuYA1lNdoo3LzZWxDtivTyEnhkqHwD42ZLymxqZ+0NYwZsshV1CyGkZ7zJAZt0WMBbJUQ8b5/3MjPMFUPx9a1mlrtPoD5l5Cp4Vwhvwo7lxjwGdeapuD91sEUS4KjCKgPRDSMfccENTk/fjI8QQfoL9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWyzmM1tRUtRQDJUFCPA8Z+A8rVV5Yz0aathTSaOa0=;
 b=KpXWmM6GCDwKheEtLRCRzTj+Fbo8H+fXlSstXKKQej7Qm4UunYE1sVKlvCemnZmy97u7sJ/8/XAtS4WvyxcvFWELJSrfyO+yADc/CTORjH5L33Q5E0bvwNtRWOoeO/XVatK29byeOWXOh32ygLKurJBnXwL7WNer2tvvbHcXI3O3uem+aXnOIQYn76dgYEV2B2x8rakyA1cee8FGYTPYiFTMm81uT9+0UO4xTt0LHsEDCrozJy2A3Czu/katggn5vE2LaNz341VWa28OxCFtDsNw3cRjTAnWIkHV2jZ+6BR1UjjEGbVlx7PMvBJCf91RzTeQYOAUuxyhOWj+Y0Xgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWyzmM1tRUtRQDJUFCPA8Z+A8rVV5Yz0aathTSaOa0=;
 b=10w3KZ637radc3rAN9fk6BdBSIYOuyYkrSyk/die2Ivmpb4NIPshSbSDLGnKEUsE+ECzOpQCbKPASE623N5sZeATi6WhDCD7rmGNn7W/FGZAH79QNI+HXd6YmRAfbR9RDmqee6aIz2GncDIdwokmH82e3lHvl2O9CAhiMgoXN6k=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4020.namprd08.prod.outlook.com (2603:10b6:406:90::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Thu, 7 May
 2020 09:28:29 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Thu, 7 May 2020
 09:28:29 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUIAABVcAgAAAtIDY4+LN9qccTiAAgAAF9gCAABWBAIAABWqAgAADPwCAALk4kA==
Date: Thu, 7 May 2020 09:28:29 +0000
Message-ID: <BN7PR08MB568434AC9C9168C016CC1592DBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
 <20200506224016.2d48d0b4@collabora.com>
 <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
 <20200506231116.2d16b747@collabora.com>
In-Reply-To: <20200506231116.2d16b747@collabora.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTE5YmZmYmQzLTkwNDUtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFwxOWJmZmJkNC05MDQ1LTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjE1NjkiIHQ9IjEzMjMzMzE3MzA1OTM5MjMzNyIgaD0iMkl0Z1lkdVhUYWhrOW5BOVByalFzckNKVkI4PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFCUmt6VGNVU1RXQVVtejhuWE9OUDVOU2JQeWRjNDAvazBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11273cde-f7ca-4d04-bb4d-08d7f26900ab
x-ms-traffictypediagnostic: BN7PR08MB4020:|BN7PR08MB4020:|BN7PR08MB4020:|BN7PR08MB4020:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB402035D36E9D5F3DE205BB04DBA50@BN7PR08MB4020.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0q5sZvstBd9qEfHeD1M/DsmQxXQRzthmhZXQDDh9LYVuknMk67fCFXSb7uOhDEDIe2W1NAXA53S09icOl1q17yhuaBHRJuv7mFG4MCzb6VYCKg7LC92yMs9PrnQp2LHwjwo5Js+f0kG2FP7PYSmjwViCfaAV/sQJYrCBXHZxmaaISEh6vMtMlbNeHdMfB+chXcFs7mrVt1oXBMMOv/nyY9fbK6vlEv6jxfnIRftflnQS3U9sVODIICuFjAth8EbXTFKV6+PxRqtxEeTSkX4A0aGC1ZzkpJ7eZMN1JDsOA46cnPoR2f5iyL/wGodrzRu7ioUVCG6QOhWHxWsK9Cd6hVmPLpN7bIYjaCo5O7Sx8HxBnzUuqKTrL4PHb5cVp9D2hbU6RKHTrjsMCxiV8IIMqee8QheAzyTOSJFGz7xfpmx8btL+PxWLs+pTu2fNA/QeVe4uVaI0xp7L51CS5fIT9fEuEXSzJY12FgUn/2hvBmPYaDtOPFvIcJR4QFewaI6+0RddIicXgriOh5NHgSIeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(33430700001)(33656002)(6506007)(54906003)(66556008)(86362001)(316002)(66476007)(64756008)(52536014)(66446008)(9686003)(83310400001)(83300400001)(83290400001)(110136005)(55236004)(83280400001)(83320400001)(4326008)(2906002)(76116006)(55016002)(5660300002)(66946007)(186003)(478600001)(7416002)(71200400001)(8676002)(33440700001)(7696005)(8936002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: heH6dic4SxhcRKkJvm3nwfk8Z5bMX1PAy21HMhinuSHvaAeYoNtxvpb4k8mBnOQf48oVVnWT390glbjn0wmvQs9xkaU7cpKJyrmNEg2BvzrhB8TruH/vMXMJoj591F4EMyw/aK1izbLOFAXMNUv1j7avgRRnP27BSa862ADeeyKutnLTsBCnC08REgzF5XQLJOUhUuJ1sxgNj/5El7V/D+0pux4++P6ewa1yQgn8K9zBTJ5GiUegii3L4NY6IDtl/TxsBmU8/p8OSbnFCNCjIR4Tf5WmTnNKO26qJZkr24a9Qhb3B4KJreVWIgoz2TKVZC807p2bfOl6m194gT2YqD3DsBPrbhby5QAp5ixJWDpqbvYB+B2XezRqWEx6igF6Y+AOA9e4o+o78DnC2EL5LCoP3QrRvTwOzyqoQqR34x6hdy3NLnIdgAT+u498q9fHLmW1Wb3f0eonfOzRRUOevWyt+nXV0//qTd+fApp7DBl3ktAJsigqaarNeCTYHGXx0BTGjGSYWDTiR53VsweeP12WIizQDmal86aoHsC/owwHadhaQ8d3dBbPQGbgCSCEFzYeElq5zkxf767iglrqfaxkAhbULRr06CRKYC/LX+BnGs7Bw+jBXP4Pvo+YG2Ry7e+i7djQZHjz34ZwijRZtytCYiz0wREpJ4dSwBlc7obWwP6FG/+kBXsPbIsvKoD0LOnMJ8BGl3CvJIQEbDFxNTy8vSYziltOPviNEpTg2b2Vzjm7XWZI+Hq3OVOTSdfIg8wmRNmdBB0LDB/Mn69iR8u9s8wxW5mgOWgGYoS7Ra4=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11273cde-f7ca-4d04-bb4d-08d7f26900ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 09:28:29.1208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBs+8Y60fOIF3b74qWsX6CKTt0Sydj0SYn+URXvW5rWP2shKOwd7tyq5NKG+nn9zq9OIq1c1zG5lQY/6M6nLsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_022832_679392_B3B95E14 
X-CRM114-Status: GOOD (  11.70  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>, "Zoltan
 Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Boris, Richard 

> >
> > A missing VID header plus good payload will cause UBI to stop
> > attaching since it violates the IO model.
> 
> Sure, and that's not what we want to do anyway. We basically have 2 choices
> here:
> 
> 1/ overwrite all pages starting from page 0 and ending at page 15. This will lead
> to ECC errors on already written pages, and 0-filled pages for others (unless we
> go for a raw write, in which case it might actually lead to ECC errors depending
> on the engine).

No need for overwriting all pages. I overwrite EC and VID page just for prevent of 
Erase power loss issue. But you hate this since FS-specific approach.
According to Richard's emails, we don't need to overwrite page0,  overwrite page1
Is enough.

> 2/ track already written pages (by reading them first), and only writes those that
> have not been written yet. That means no ECC error in that case, and no
> corrupted EC/VID header as well.

This is similar with my patch approach, but corrupted EC and VID headers. 

I have two proposals:
1.  rebase my patch, and copy one idea from Miquel's patch which records the programmed pages.
But page 1 should be overwrote considering the UBIFS re-erase mechanism.

2.  add a new padding structure in the MTD,  which is used to filling empty page in the MTD.
And once FS layer detects this padding data, just ignore or trigger re-erase this block. 

How about you?

Thanks,

Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
