Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A768C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:36:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C45923427
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 07:36:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdsIqJhN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fK/bRw+U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C45923427
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0+4MgzNAYUKRaiv1/wuXwBn3o+oqubk+Ti5YsG75sY=; b=jdsIqJhNb2ZINA
	CjPs9C3JRvLUR0h1HQMhcljWcue5S+J4E1Bh3B3ex9cjn9IRXvrN4XXs8Wj3ZxM/1JXYVX3PcUtDh
	0klwJ3cNJXhwn7FjAUM1XU16t6K9Gm6hHUrOToix6vce2veGH3CMIc6adw7Ww79PCYK9fOyd9GMz4
	4DfDx2zyUAwavRzpfnxlpPL1e3Xn6oydDS6A9FBuY38Dazd2LwDcCvX7iAH/yAfrOwde3DADOcHzE
	mDNDNvL22GVJaFIn03mt//FuC7cxgXrDGAPQE/UCayT3XJUMm70XTbSJuNW+4DgGsjGNvxHGe7ARi
	Ka22i7rrwLp/mnp7EAwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0LAc-0007t8-ET; Wed, 21 Aug 2019 07:36:38 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0LAS-0007jX-Cr
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 07:36:29 +0000
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
IronPort-SDR: Tt8oUaJuLfPMHQUyZvVHnP5JlrhyOhLFdEv8AFHC1XbzQWV43BnRzx75kta8wlsYeGNah6F/iL
 4HkooCE3q7UoeP5wsetF96kDMdV7NfFMVIrKR8uMvUuZSTbBB1FCTjheAyOctg5ZvftStxn7KA
 Ncbmoy0uY7dxq8LhXe3fI3Q597LJnPCrqXkhnrzSu9L3SevFKgeYtMy/dwsdq0HvmeMJTNQZMI
 u3c2cSR6ae7i96NY+EUnVUM9VGEIN26qwWQ3L3qB+qPMDz8Nz7QcoTbEveZdmU5zK09A0FCEFS
 ZYM=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="45930593"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 00:35:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 00:35:23 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 00:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/RQgAk1ueqpWsU3rgTnGUXKVNb6/p5HAEfirQM7ZyZkEa15le3TKsZtlur3fnD6hYLI8thiu1Wg3Kg73Tug5TzkvWgyWJNtWZ6W+Q63snDA1XUBXMXLoZzJDRtwSDmm+U9RstnmAvS5dkUQEWbmzk+Hueza2FwuqLpTvF+sirrX2jOs1oxZIjy4Okd3TIdRBgvTWLEv5Bbt8MxHUqVcOoB3h2fx62MPR0POJVeuP7p/pzZVqMD0BHxGtfSCC/CfCiDhD2Ghf4+9f2yuWS0X6nAeIZvpvfaMwiucKJ2OaCe1jqrwxDbD1CrrmhjBq3P1GRXC1V+ivgr37cfsSdkzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+fVtzxmUrnBz/vV6eqepDd/MrR4CJ6LyK5Rtl2JVaA=;
 b=NmlnuSWHpbz8yg8INdudRzz9WkhFDd+bLYWV9x104RUbl9gki050rauBR+1JZ7NXicULrbIcReaFsOsU1wmpY+Nw5u1TpJNBXlFWK2KdVuhavxudS8+MS2VK2viZ8mBBWdwEzBM+TnRw9zzxTPc9kCdJZVwHbyT4Zdxc89yu/QUa4gmKYFGvfEPjkWMMW1jJ0FYTwHGtm+c98erckavp3ZwnQ7391Ak3gdCYOShjPH8G3yDKm+9QyNFDAEVSCd3VDCxaD9fXtDhjnZxjDX+TUBXQjI/k1nFpFxlaAKcvvB4hZH9psD6TfrWQaA09qpZcGcEGKqcH30AS96cuHYrRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+fVtzxmUrnBz/vV6eqepDd/MrR4CJ6LyK5Rtl2JVaA=;
 b=fK/bRw+UpEeaUBzE990MNdqLKjLca0US6vzRr8iEPBfoQvEQEEX/mTuGgW5QJDSWF8VmqC+mJN3EVLR97GHPUhCmv6QVvIQ0nxtBnyPcUTtTNn7sy8EApm8z0Jc8ajgYl0CJm5CFGkhPo0W3f4RD7e7b0kVd1hoQ/EoMSUsVBZo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4191.namprd11.prod.outlook.com (20.179.151.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 07:35:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 07:35:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <marek.vasut@gmail.com>,
 <Cyrille.Pitchen@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Topic: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Index: AQHVU0QrPPnbSj0lTEeIojqRI3TmEqcFP2eA
Date: Wed, 21 Aug 2019 07:35:21 +0000
Message-ID: <568a064f-af88-bfd6-b50c-208f9cc9f8b0@microchip.com>
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::32) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71ad79b-6da4-4b22-41fe-08d7260a1f53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB4191; 
x-ms-traffictypediagnostic: MN2PR11MB4191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4191B4B8B8E2A8592C8AA476F0AA0@MN2PR11MB4191.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(54906003)(6436002)(31696002)(66066001)(186003)(26005)(6512007)(86362001)(6116002)(2906002)(2616005)(64756008)(486006)(3846002)(476003)(316002)(4326008)(31686004)(66556008)(66476007)(11346002)(66446008)(25786009)(386003)(53936002)(7736002)(14444005)(53546011)(256004)(102836004)(6246003)(36756003)(446003)(110136005)(14454004)(66946007)(5660300002)(99286004)(52116002)(8936002)(71200400001)(6486002)(71190400001)(229853002)(8676002)(81166006)(305945005)(6506007)(478600001)(81156014)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4191;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K7NgtsFSPmDe0WfSNZGaGsL1S/6YC+1ZatL3uB8VOJJyrLHfRWqKzo+xqmFJLZaM6hLDPR5mfry96MYU6DPXO2+7BnvVBnnoCkZaPxYypv3S3hJjL6jN8gBGC9FqB7CtdoU1M7eHQ41mpbT2txpYIDMIl+WmZyWEsQM8Tw3ajxAEDv8RpsLVZ7sibtQLFgKpd94KuIlBX5OdR+XrC7b38lZmvUwJSSrtJN9NrlJbgawICcO8KIPsq+e2e4a02momi9p1aYCmwRLImi72rU2yOa8pWAotOIp/PA7OtXKggwhDG0wPxkZ4t4uCrtG5i0TOoT6mydG2JlmqWMFRM/RnT75bnSwB2Nc3uKxmD9cWyMOtcqFiOgboHTZmbVyZ4blHtX9wAKoS46MJ9mrfPkhvmwdQ5QJuPvrY0YDRlR3iw50=
Content-ID: <024A93CC4742BC43B93E0E4F36AC1DB2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a71ad79b-6da4-4b22-41fe-08d7260a1f53
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 07:35:21.4592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hFGx48J3UR+XgOuGGsJPDHzSWQIHHYhj1BNHDYmG+Syfw/Gg0VCYwSUlZk/NzbbWo+TBscJBGrngkgT1DvZLKS/GLqKQXtcI+clhdFw+KHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_003628_631525_69645C02 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: vigneshr@ti.com, richard@nod.at, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/15/2019 11:32 AM, Dan Carpenter wrote:
> External E-Mail
> 
> 
> The problem is that if "ret" is negative then when we check if
> "ret > len", that condition is going to be true because of type
> promotion.  So this patch re-orders the code to check for negatives
> first and preserve those error codes.
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 63af87609bac..986b0754495d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2903,10 +2903,10 @@ static int spi_nor_read_raw(struct spi_nor *nor, u32 addr, size_t len, u8 *buf)
>  
>  	while (len) {
>  		ret = spi_nor_read_data(nor, addr, len, buf);
> -		if (!ret || ret > len)
> -			return -EIO;
>  		if (ret < 0)
>  			return ret;
> +		if (!ret || ret > len)
> +			return -EIO;
>  
>  		buf += ret;
>  		addr += ret;
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
