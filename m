Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DACC7618B
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 11:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73437229F9
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 11:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEs5ammR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="wCsufhh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73437229F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ4p5m+MdI+LTFRvbx8Exqd5wuGBnWKvPGGlpl5p6Fc=; b=FEs5ammRKim9QQ
	siW1JL4uYbf9AezG7vhWk/yk0Zp9Uei6znPPRWekufHb0vmhzOQVXWpp/QG9hopuLv1X4J+fkDlOw
	kpgaTUB06g0FNRbGMVnG1EOcM6t/iF+BpJVqzLscZYOYTq0B60kDC0Ri0c58ZaLY8T6I9NDSfmd3v
	MpVxy+rul97o3My6xRkBHovAkm3UFJmds1NgndL7yvt/o5y11pRUjD25v3CspLmxglyu6Q9iEv3Uw
	nYWb8yTsTzycyxL5dQ9wtwGIkIvlNMSwo6lyQ09TSqfrxbqNoNC/7Qtwc3xgy42OQpxwLbvhquJmD
	G4huvznRonQdTOjCG0nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqcB8-0000WM-Nw; Thu, 25 Jul 2019 11:44:58 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqcB5-0000Vq-7r
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 11:44:57 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: xYS69BO8PuG8b6Ytcp2MEbTafUubRJsBYFYT3IKUmxufk8itZdxZdgSla/k1TnNiLULXFPJ86k
 oAcI+N/To198Y9XmURQDTo9ISt3rIX4JAk+lV7MYWcVAKNdnFe6jFBVxp0KGjabxuF/MZ7I1Cb
 5dKqEElCvAUvIGZO7wK4Ic/STpZO2YDrZXM1SEGpY5mB6IEydhPQHW9fLzmiIjNNRZKwjFxhr4
 Ob2Klb/at+lNmjA8CY572RxwR+1NaZgXjNrL1S7QPp3QEjB6RMZXXRaPsV/A+fDmZSikcIslzP
 G4c=
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="42717251"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 04:44:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 04:44:53 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 25 Jul 2019 04:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWLN0Cubq2IJMd8fom8GkpijnHd8KIxeMORbxNoS+nAmF2WWqSRh801aTPyAVQH1DVo7+zNjrN/9FNWleFzZi9SVXedn3Y+0K19KlSDfj8bVteWUeksuluHvoy+8h5devCdqgd0RFaOpRr1Dw3owSpyueByBZECtpzfPBT+Kf50keqNmtb+WnJZkSNQ6vgZTZbYSZPg04HrEk+61E+ClIPgkYgZjRx3DUyJPq10XHcWf5nBWBldWK9xpV1uFCaWpoBQKoAOXoV8lEGtO57beO52D7GFHgfz2U/P9BVr5GTgcTfLtkp82kDsHdyhXPyWC8Loxq0bGEsFBA8Bs3O/CnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkIu4mvajccoXK948aemzhJN8murMFj1qsVf+J+2pOg=;
 b=aHERi80S/ptVebIX2X657rhN+xyQrjKGQwGvHZVMDFaz7KLWbvJUFWVAPVGHenSPHBV+/x2x9o0fnCQzObCglasS9iiE8M2ha2KICRYgrdg8BylSdC6+0LYrC2+RYqGYZkUodZUkpmPYHUm6rD4qEuhkZm0cbP9GZ3u32JrZth9xvdr2ZDTWx6iY8841Q2xd7qs5igDF9C2v2IMeg0lXXTakCNIxDTcGP/chISiux1/byEzatUSwijWEffVEtsbPZQ1crq2O30PZLNmj6I+FYt8xPl878R0U3M7wsL5VCwK8hlVCcmAlQNLE0JjEnx1zCtSzTWRlhisng8F7KneGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkIu4mvajccoXK948aemzhJN8murMFj1qsVf+J+2pOg=;
 b=wCsufhh0bCNEsTMNloDloiP0MjqRI0OdiYvIxAi01ua0UK9Mxq0lk2Veo22OnMf08+5pTjJZ5Bbi3SsdE5XcaJ+m20IIn+fa3fGawx70VVKSFRO+Hbuuu3fGLi4EUthn6/Qcr8n+bXLb6YrJSpcBLqOucjbGGE8B6B4sgEg8zVo=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4018.namprd11.prod.outlook.com (10.255.129.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 11:44:52 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 11:44:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVPtFNjfEG9DN44ESnRp+H/g0b8qbbN92AgAAHOoA=
Date: Thu, 25 Jul 2019 11:44:52 +0000
Message-ID: <b60adcf5-e85b-875a-c041-6bff1cade296@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
 <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
In-Reply-To: <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0106.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::32) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 108fc523-07df-4f23-bc95-08d710f5814d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB4018; 
x-ms-traffictypediagnostic: BN6PR11MB4018:
x-microsoft-antispam-prvs: <BN6PR11MB4018DC513D8D27676999393DF0C10@BN6PR11MB4018.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(3846002)(2616005)(110136005)(54906003)(6116002)(316002)(446003)(31686004)(36756003)(4744005)(99286004)(52116002)(76176011)(256004)(71200400001)(71190400001)(486006)(64756008)(186003)(2201001)(476003)(81156014)(81166006)(68736007)(8936002)(8676002)(66066001)(386003)(6506007)(86362001)(53936002)(6436002)(478600001)(66476007)(66446008)(14454004)(66556008)(6486002)(229853002)(7736002)(66946007)(26005)(6246003)(305945005)(2501003)(5660300002)(4326008)(6512007)(31696002)(102836004)(25786009)(2906002)(53546011)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4018;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yJigpJlTGRRurJgF4uWQUNjdXHNFx1B2w5woumwTtI1fI/1mqF86/LObWfxIRk5TzEuIqTXk3tJzEmmNX566QaTgCDk4llaBJaotSL04z9vZulJFiTSbLh/vyMsAg1BA08C831xhqWEwvBnDCttos9LPSrVUEIPLmveCN77yfWZ2LTb58HJSmWbDyHKAyFAF6Wh8A9cd3HstLiu+haLjDkUWSu7qKN3zHaiLb/RnxDx8Og9d/NbFkr1+ttXJXhvq8w64ZC3AxH22dci3KNDA7HECEaqhKN+9uC9HIGe0ZC+qWGqG5uNCxlmLH6f6y+y8XN9l8Re13mVRElb5MmWaDWrd64z++0wYr5u7HY0DW5W2pTdvee9XSJVFcovXGA8imMXZxctejl7v46lIFugEud+xejfUx8rnh42wjI3wed8=
Content-ID: <7AF77D3742602449AFF30BC901B41BC2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 108fc523-07df-4f23-bc95-08d710f5814d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 11:44:52.2740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_044455_421208_05A1BBDB 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: yogeshnarayan.gaur@nxp.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/25/2019 02:19 PM, Tudor.Ambarus@microchip.com wrote:
> static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
> {
> 	if (!op || (op->data.nbytes && !nor->cmd_buf))

!nor->cmd_buf can't be NULL, we can get rid of this check too, and use
spi_mem_exec_op() directly when interacting with registers.

> 		return -EINVAL;
> 
> 	return spi_mem_exec_op(nor->spimem, op);
> }
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
