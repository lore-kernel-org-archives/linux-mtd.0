Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC0FC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091542053B
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 15:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLVgPmjt";
	dkim=fail reason="length tag value exceeds body size" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="HmJtcLov";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com header.b="uI+dJsKw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091542053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFAKrbRG3XtMyaeRH5ZfM4ztsD8SBbcndjIebGXs0ig=; b=iLVgPmjtEfSgWc
	XsAkVVtHdYMCooop36LnOBYpTaEMolfvCEk4jBgDW0ry1F8cHtjaIRJY+k+j3e/Zdv7ZOSAqB+zjJ
	wqhyKpzBbVi3VZkIVUcNkwlIL/JdzRkv3F3WLk7OKwa3lgmOz4sRI64PQS80hxTVrZvdGtUrAUUWo
	6aU+OHl/d198uKJsmQMdqv3A6DjFEap9biyUtAsR7SXW1vxtXRYbEX/NdatUhL0AJp8cacSeLYmb6
	jxSGCS4XwYcmOgaQ/7yXI2wKxQP/5UeHeGTtuKT0uStxFGV0oNOUkvMf8cF08qxgItJTH73JEPeFY
	9MlYnBu8htrKHERP8kyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeKsX-0002lM-Ne; Thu, 28 May 2020 15:55:33 +0000
Received: from rcdn-iport-5.cisco.com ([173.37.86.76])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeKsR-0002h3-GU
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 15:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3750; q=dns/txt; s=iport;
 t=1590681327; x=1591890927;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YLVXVHJeVzWQknm45eYlhtZE7wvfx5O6B+Qbp/X8Oaw=;
 b=HmJtcLovBNkfR8fl+U8bLHuBhANcUJXQKcVxQwxgDEikLTLBemMwRPvE
 SF17AESmXMzvXdFQMj6DSt0XsgwzeJI2UHFE9peeo+gux/70nvgsCdzKM
 Agxo13UkZ8eagVtA+qDQsW3eoLmXYwd1VP/UkHpbhI1R2U+9SWF3Nh76b M=;
IronPort-PHdr: =?us-ascii?q?9a23=3AhETS5BQpO0qpAYmBRYi2CvYqbtpsv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESQBdWJ9/MCgO3T4OjsWm0FtJCGtn1KMJlBTA?=
 =?us-ascii?q?QMhshemQs8SNWEBkv2IL+PDWQ6Ec1OWUUj8yS9Nk5YS9r/IVbVpy764TsbAB?=
 =?us-ascii?q?6qMw1zK6z8EZLTiMLi0ee09tXTbgxEiSD7b6l1KUC9rB7asY8dho4xJw=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DsBQA73s9e/40NJK1eCBwBAQEBAQE?=
 =?us-ascii?q?HAQESAQEEBAEBQIFKgVBSB4FHLywKhBuDRgONHCWYSIFCgRADVQsBAQEMAQE?=
 =?us-ascii?q?tAgQBAYREAheCBAIkOBMCAwEBCwEBBQEBAQIBBgRthVcMhXMBAQEDEhEEDQw?=
 =?us-ascii?q?BATcBDwIBCBgCAiYCAgIwFRACBAENBSKDBIJMAy0BAaR+AoE5iGF2fzODAQE?=
 =?us-ascii?q?BBYU2GIIOCRR6KoJkiWAagUE/gTgMEIJNPoQVBAENBQEIGReCfTOCLZEvPKF?=
 =?us-ascii?q?TCoJUmGMegmSJBIUMjRmQV51qAgQCBAUCDgEBBYFqImZwcBVlAYI+UBgNkEC?=
 =?us-ascii?q?DcopWdDcCBggBAQMJfIoagTUBgQ8BAQ?=
X-IronPort-AV: E=Sophos;i="5.73,445,1583193600"; d="scan'208";a="516951576"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 28 May 2020 15:55:24 +0000
Received: from XCH-ALN-003.cisco.com (xch-aln-003.cisco.com [173.36.7.13])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 04SFtNYj026556
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 28 May 2020 15:55:24 GMT
Received: from xhs-aln-001.cisco.com (173.37.135.118) by XCH-ALN-003.cisco.com
 (173.36.7.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 May 2020 10:55:23 -0500
Received: from xhs-aln-003.cisco.com (173.37.135.120) by xhs-aln-001.cisco.com
 (173.37.135.118) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 May 2020 10:55:23 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-003.cisco.com (173.37.135.120) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 28 May 2020 10:55:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF7OsWuSA6iYGTkx2KI7u1U99N075uM/FEw9ijj/jDSYR/2XmRx9hZde609GKhZ+bJUMcJQA8biVvaSO6MHGXz2T385vbarkDeh49hcr1mWPbeVbfKhWfNZzcFvLA3qxsC9A/BTuGwh96WYHEMz9rCwDa3ViXycNv1TVRA9NeqaPkaR/IEYcEFBVW2Pb9E5WHFThVpfloHHMvj2L+u/eO931wCcQCTrVypie+3TAZm17RhNZO0WzYbBi/n7e3Cu4Z4LgKD2CInWWDsP/5xcVynJtAqcjQr4GS+waBMRo1Pv7HAeY4BE3el3Y4PvWzPDqshZPaAsPRTQldkmSbBjptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLVXVHJeVzWQknm45eYlhtZE7wvfx5O6B+Qbp/X8Oaw=;
 b=Js/4xW2k5BSICJg4ID2mfEeFPgi/tfMHFL8EthiEhy51GWi5RG0QH8NWAy4h5l8qVbInVkwmmCCxCdSmq8GiM5xXi2k39BVGGAz9fr5Hq0+zfzoYJTUQySX/93TnUfdHPg0EDnRMaZSsMgPMSN/b3a6x06U0lp2SJqwnv6do11yM1fqN9Ew6X2M5igGlY8pta8MKaYx/yRnaDBbOdtUv8A5UuhaHtSIJYO/xumnhqyNScFZXP2bYgZrFXbB4RcXGJmBMu1zKp+O8hy/H4xQlboZxMnYo40mnEDekijRv9Ms3nIKcXhOiYaovV+pk+oQ8csoNFGwzm1/v+u4uXkjsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLVXVHJeVzWQknm45eYlhtZE7wvfx5O6B+Qbp/X8Oaw=;
 b=uI+dJsKwkAZuzLH40J3xjTdQOQvPeWN3F5jfH16INQtyiz4cb583wGQJGag/Yu2js4mw2Q3N6oVKXAxQ6+HpX3+cN+XCLRF6nst6d47eX2gehVDFZfXq6tFFm/w6uqbZVco5WoUGyZFsCKh2j1DmJHcr7U4uOFbpG7OUxBz6QN8=
Received: from BYAPR11MB3574.namprd11.prod.outlook.com (2603:10b6:a03:b1::27)
 by BYAPR11MB3526.namprd11.prod.outlook.com (2603:10b6:a03:88::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 15:55:21 +0000
Received: from BYAPR11MB3574.namprd11.prod.outlook.com
 ([fe80::352e:4256:d09:ebc0]) by BYAPR11MB3574.namprd11.prod.outlook.com
 ([fe80::352e:4256:d09:ebc0%6]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 15:55:21 +0000
From: "Jinhua Wu (jinhwu)" <jinhwu@cisco.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, "Daniel Walker (danielwa)"
 <danielwa@cisco.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: intel-spi: fix forced writable option
Thread-Topic: [PATCH 2/2] mtd: spi-nor: intel-spi: fix forced writable option
Thread-Index: AQHWLT4e+9wwuj9x1UGlQ413F39RPqi9ZEIAgADYI4A=
Date: Thu, 28 May 2020 15:55:21 +0000
Message-ID: <190F24BF-EE4C-4C40-9101-C0AE6C9CEF53@cisco.com>
References: <20200518175930.10948-2-danielwa@cisco.com>
 <73a475fa-3c26-89ab-aac6-54f9b5b15936@ti.com>
In-Reply-To: <73a475fa-3c26-89ab-aac6-54f9b5b15936@ti.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.36.20041300
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [112.65.8.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87e45d6e-6686-47f1-f4be-08d8031f86c5
x-ms-traffictypediagnostic: BYAPR11MB3526:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3526E2147BF7B2E2EE2AFFACC78E0@BYAPR11MB3526.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WGFFmX1jJiwVeSvsjB8kqgFC+I/Rg/bU3EO3h8uZwNRktbSM2qNP4ceJMEljvrvpCR5OnbkLKfM2PbONju3YI/+I4KqjkgR5cRu2ccYL/ZiZgB2bMJaTauG/sVy8zNvDCpLbpU2RjsjIon6rHCzH3qBwujGL/hqPvaH8g0N4imgDK0ZmikX2Ylda37cGi4GvzSsbIo294B/ywYBbkgEN1oR3u788dsQTMV8Y1dPx4nQyIVlDH5OHbxfbgVQQlrDi+Z3DqM37VSPYudZu+icAOyjhdeJoggbHSIAz8UqZLpSC0tetwjvyXH8ZR3jf32Wg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3574.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(66556008)(2616005)(316002)(110136005)(53546011)(6506007)(76116006)(8936002)(66476007)(91956017)(54906003)(66446008)(8676002)(66946007)(26005)(64756008)(2906002)(186003)(4326008)(6486002)(36756003)(71200400001)(478600001)(86362001)(33656002)(83380400001)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +Pa8cnV4nRmrXmsJWpjlGMN3fM3AohH+B6O73gIcbkEopFsjS70bC8vn8852T92gHdeo2wgqFflzd5Tq108g1wAP9s9LBjhWsoXmJQTjT2ciY35GrZdEHm7rppi61/3vcbRSDEWOih4rC23GFijF8Gkm0P2/8oRVCOhFrhNkY5TTMko1LY3xHl3IgDEHB0hNyaKxtrJgr6dYE4duPmNorVMKZOkxL5/r1akYaJ0krZNG8xTK0vbF5ZyPghYo0KD6kZsaYq4RSmTuqgdGtYElBP1qm29FW89B/2jKFb7Ts+kC+y9vzSHwf6yxFyoPlbNqErc4NJXdSV224b7/1NrTF91cLxiA9baie3lbP4KSe1tWDvbyd/xt/ZhlfEMoSy2HI5w6g58vfeA+YTmWthLe/m80KarVHfg+d+/jQ50voZob5pZ8ZIgUW3Dkd5Y+SYbmZrsTixiDzipPxnwkgmMgmhKGiZ1YlE2MH0BY+zoX4jU=
Content-ID: <B668EF02BCF49A4397CFB1659A79E1CC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e45d6e-6686-47f1-f4be-08d8031f86c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 15:55:21.1495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjOz3Cf4M5rsCPv937WgE2rf66AhyJrj57pI3youWEcqUGL/rPWvGkm0v0GVAMB80y87E39VR2uo3nnIGejTrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3526
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.13, xch-aln-003.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_085527_825528_849E6015 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: Tudor
 Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>,
 "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2020/5/28, 11:48 PM, "Jinhua Wu" <jinhwu@cisco.com> wrote:
Hi Vignesh,
BIOS just locked down parts of flash (such as, code region), others are still 
writeable. Once the SPI locked down,it can't be override unless platfrom reset 
and set WPD (write protect disable) will fail, so ispi->writeable will always
be 0, then the driver will always make the whole flash read only, even if we
have set the parameter writable = 1. 
Now the flash is totally not writeable, just part of it is read only. Why not  making
'writeable' working when explicitly enabled?

>On 2020/5/28, 7:02 PM, "Vignesh Raghavendra" <vigneshr@ti.com> wrote:
>    On 18/05/20 11:29 pm, Daniel Walker wrote:
>    > This option currently doesn't work as expected. If the BIOS has this
>    > flash as read-only there is no way to change this thru the driver.
>    > There is a parameter which allows the flash to become writable with the
>    > "writable" option to the module, but it does nothing if the BIOS has it
>    > set to read-only.
>    > 
>    > I would expect this option would make the flash writable regardless of
>    > the BIOS settings. This patch changes this option so the BIOS setting
>    > doesn't stop the writable option from enabling read write on the flash.
>    > 
>
>    I am confused you say "If the BIOS has this flash as read-only there is
>    no way to change this thru the driver", so is it possible to override
>    BIOS setting? If yes, where is the code in the driver?
>
>    What happens if BIOS is set to allow writes but writeable is set to 0?
>
>    Also please send patch series as thread (2/2 in reply to 1/2). You can
>    use tool like git send-email
>
>    > Original patch by Jinhua Wu <jinhwu@cisco.com>
>    > 
>    > Cc: Jinhua Wu <jinhwu@cisco.com>
>    > Cc: xe-linux-external@cisco.com
>    > Signed-off-by: Daniel Walker <danielwa@cisco.com>
>    > ---
>    >  drivers/mtd/spi-nor/controllers/intel-spi.c | 2 +-
>    >  1 file changed, 1 insertion(+), 1 deletion(-)
>    > 
>    > diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
>    > index e5a3d51a2e4d..68a5877bfc0b 100644
>    > --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
>    > +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
>    > @@ -954,7 +954,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
>    >  	intel_spi_fill_partition(ispi, &part);
>    >  
>    >  	/* Prevent writes if not explicitly enabled */
>    > -	if (!ispi->writeable || !writeable)
>    > +	if (!ispi->writeable && !writeable)
>    >  		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
>    >  
>    >  	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
>    >  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
