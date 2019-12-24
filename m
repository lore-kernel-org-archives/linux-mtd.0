Return-Path: <SRS0=lNmR=2O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D386BC2D0CF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A57A92071A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eFnIFdfR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TZBT/+Tq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A57A92071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQRZnJWOTZ8kBqhorImJF5NglLUBKnRtSc0dg9mbiW8=; b=eFnIFdfRzRMhYE
	GE/L7Tkdamj0Gocbb+5ihq4zfa8xknx2tpOnGMHtsUKKcP6tZqOrfco2xgM08g7mYOaoQzRNaY2nT
	HYVzsRSrCdYH7jiYIpe0g1FO5q3aRYMrUmdwVUxEy2Jj91xD+6kvgGdl3oPNWfz9yKV4sX8nH/mOp
	89HtcJEc3dmixAsHUF3c135ebycc2RQBtgAchtv34o+ja6PdxEQI3UAV7JpcG+S2ASNuokQT8sfWW
	uowNVEHJzhFmvz3oo0V/G7tNfkWrpq5zgOW8A/iaGqUAVL6unqlJDXvRph1InWBHtPxRzAQKWVTsB
	enlgySb3A8cyn0k6ry5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijg8R-0003GN-B5; Tue, 24 Dec 2019 09:05:47 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijg8N-0003Fq-T7
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2019 09:05:46 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: aUBAGq+UeRdPHQqriN4hrOEx2eKiBA8lgEoky2+jrdebnThiZB8BOqybOheuTjCvvJmUYJLvn8
 W0cA1ghmSLbnWUD4vOBHC1Jt46r1snJMnBdKEl2RR7TQeGt4sO0d0VnxQ8Ki4Y/7SJtNxZGhXY
 4BdT+LMLrxFModlUaKVSFlTYImUpTxD6RqBNvnfWqN+qS4q1EiWVfXN1gz8RFMK+Q9mn875CDu
 BdUKXJ/P9ey1pdYApC/i1PpJ4TwOR+tP/kEdEB/zwpaBlVnv4nwjIeUYzE9qjo9L/rxBfNVlvp
 TXE=
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="60026818"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Dec 2019 02:05:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Dec 2019 02:05:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Dec 2019 02:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljf1373YPnvoJKCtZfa4uw6xwxdmAqxMkqEkQ+S//t5sdzAGCfAA8nWyA1EBbdh/PtAUAaxyyyE99TvnOrkYVSuZtUOaH8CPKOpj9chNbAGCZDMBriWH/RCRYdl1CJOLcpuGlOQxY9vd+r3jlavAHndrAWz/MbptkiSAMzjKopz//Dyded6Yv14MXxr9Qzxsmzda2nBPptqk1UTvUFiN2ud2CEzDRYsIUlXO1hlFBeGF0/mXTpPK7YfJNfhvYiVTtHm4Vq8y492AgaQlDvKqykjtw/A3fzwcHy7SuMqLD9f6eYwMdVM2SldBVMGjk3V0O1RMU6VRRnKkivShbkpvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im825GKzl1BHQrFRDiBB5UHm/vc2VkPK5npxYdDeNCs=;
 b=fGwt8+mpRdqFYcY4I9yXRMyW/BcO3706ctgO2GhC97xP8axPQpQgTvf6idOz3CUHFdU7Qbugx2NocMB8xtMSLCU0e30W7JBquRTwi2hHvj2amFqi6JfCxnht3Dt0zcMY88VfWJu3TLhv91KrCdqdoPaqYRCRdah2XL/UNkjmdN4UCOuMtj94MqopT73s9tJ6INnUoBOycFODNtmEnx6QVmFdfhNFNPxhOX5qZtR/9Nrx04cmHwfDGvQpuyfjFWoVpfY4gxiIaR6zJELhheXzot4rDRAOmYRMRNLMmZvqFCEwE/ewOiDDEbTa7hvSc/GCWSi/dsW6GupYzL+aNF5TUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im825GKzl1BHQrFRDiBB5UHm/vc2VkPK5npxYdDeNCs=;
 b=TZBT/+Tq1bDC4YWXhEBd9ulhjijUh1DzgC/PLNNfRiKZliEcTSFBYm5zFsR3YWGCQOVLPVNhZlxu6vcwRNU7s+FSuwc5rlLWikY242nzmXzwxLdOWIITH5Gt1rWzD+0CjhdTvIHO+lxwXONV3tBIiS2fV1mHog6hK8w9Ub0tQHE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3631.namprd11.prod.outlook.com (20.178.251.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.13; Tue, 24 Dec 2019 09:05:25 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:05:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Jasper
 Lake SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Jasper
 Lake SPI serial flash
Thread-Index: AQHVrznI1Ci2UL67ukeBTPgleRu0iafJFBkA
Date: Tue, 24 Dec 2019 09:05:25 +0000
Message-ID: <02790c48-3f64-6e12-7325-d751c12e62f5@microchip.com>
References: <20191210091111.39403-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20191210091111.39403-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 829e5f4c-d3e9-4f63-8c48-08d788506a12
x-ms-traffictypediagnostic: MN2PR11MB3631:
x-microsoft-antispam-prvs: <MN2PR11MB3631B94DA3156FFDEDA66FC5F0290@MN2PR11MB3631.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(36756003)(71200400001)(26005)(6486002)(66946007)(66476007)(66556008)(6916009)(64756008)(66446008)(186003)(91956017)(76116006)(31686004)(316002)(54906003)(2906002)(5660300002)(478600001)(4744005)(4326008)(53546011)(6506007)(2616005)(86362001)(81156014)(81166006)(8936002)(8676002)(6512007)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3631;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tFaiDVh2fyPMTls+h/H5bDCHbvtTp9JaIA+Oa37b0kDH/IZqayK443ow+c8XgU1huZP3z21OkuCEHZeslqJnwPLWC3jqrahBH2Qc6FdwRpGJ3tFOwXOGJDszWbmq+VqQGRwsGsLnuGAqjHXmKjmHxc7Hcerx4Ee23+7TDrR02m7dFqop+LELHgSQSOfvM6XcYvZytAWbDyj3jOpxaDe5ji1RTq62jRADI+lIs3aLIIn3bslv2wV+Oxhw7/7oCrQl/Qrq5mp9EOA2vGKhENylK3EuFKsgm2zQm8wXxQ8KzGUZCd+KjxF1GMuxlU8gLSfd3WrP+TzcEoLDhfFnZOA1VGTbD/ChIOYhmtdjEy/xotjq7+6vjyKTvVkMMej1eL7PmDUHTQIiKApB7KX83fqHfhqyKIa07R+NOabTtvvmRu/GEyCbzW/FDwPhVTbabhZr
x-ms-exchange-transport-forked: True
Content-ID: <07076F40E969134D97120DCF634FC5C8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 829e5f4c-d3e9-4f63-8c48-08d788506a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:05:25.2277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J50gZFHfuIcjsCtgvyo4vGvg9+25txeAFDklEXTCg51fPELjvW8VxvA7nY3C4vbkSJLj8IX1HNmeIuXjgufc/N6D+2zRyJCYrmZgE3LCbGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_010544_928904_36ED55D8 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/10/19 11:11 AM, Mika Westerberg wrote:
> Intel Jasper Lake has the same SPI serial flash controller as Ice Lake.
> Add Jasper Lake PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied, thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
