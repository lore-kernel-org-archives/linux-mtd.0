Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3A1C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1EA2074B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uiIm5rhW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kcrzVAnd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RaCBeqP6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1EA2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lo+3ZoTc/d6xV4kxLWyqCBBnB4lRaR73hvzmDx5+QqU=; b=uiIm5rhWGv4G4E
	6yed54oFvnTHohlBKEo2c8r+zFPPMhPhRaAQc/FPxpRPjRuMSRUomddT3SE0ewkRP0gIAaU6+COHw
	scEHoXDkOH91uxDjlKsFII55i3moxDrBWTG4gZdAIKTzlTQ3v6bAAfv9n697K3R1PFtbwq0Sxy7iP
	AlK8lRXoo0dwuQP9rsusMpPKHfKvlogiVp3zVC+opbIK6sts0F0VZPWSR1ZwmS2e/lZcDYm18SWse
	EeW2dEXFg7i86FoFvC9FMzlHfRwnf4lfWhuvUTpto4yyRVgQIoWJWwZHPdp3ScCt4DVA7QLF+cl00
	CRLZoTTTwfJrHfENVDgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfe0P-0007rH-5Z; Mon, 01 Jun 2020 06:33:05 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfe0M-0007qP-GF
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 06:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590993183; x=1622529183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=guoAwMs0t+w5Tvr10uAVLqast3VNGue3oJY/iT+cRMM=;
 b=kcrzVAndhz7N2lYSo8sEhlS9uqKxy7716OmypHVAUxNgdTptD8pztfsO
 e/34tqLOREJfJCfPi6VTxzfJqGEP3I7VzPN7s7MLwWYLPCdrkQ9W2r7Zh
 XFBSeEdiAf9bYWqLLBzQkoe3kf8eby1Q0vkrD38u1RMaI/Z+fA+q2VvHz
 RCS+SGprWP/RcySGgs6+ZO1vnzdMuQrx30Xw+xAAUk4v64oMYO7YHLwL8
 5b9FxlMbWGdBMvBqBdE3ARFgOpweTw32/S70WlwgsLSiH1v2V2fF1tzwh
 shylEhr0sPcGoWi2UceBYkAwGimH62sEEO1L/uBipo7e8nu9pVVIutRPJ w==;
IronPort-SDR: Ofv5p26C5ikpoJTeZKpbS7Rfh22Zfr6guErnNg7oW9mN8eqDWxRs5Q8xBjsx/I1UcsXSrIvZDC
 /yjzfsAEMdDE0dotzYrkUNJVkx5mNJtMiaPU1RtLGQJT7Zd+u+LCMQw5ionJwZDu8vFDKYGe2U
 lRy1L/2aVb2sXCLGFAp50xPYEZdNcScd6il36P0gkS9sRWuLzkvEhvS8CHd/jXxh0keLF4PlnP
 +d0PXj9b2PE/zFerGSx5gzw1pujeAVn6U5zvHd7qL5tVLpG44788VzvicrC9LtxPqtN1Kn6kDy
 KUs=
X-IronPort-AV: E=Sophos;i="5.73,459,1583218800"; d="scan'208";a="77715081"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2020 23:32:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 31 May 2020 23:32:58 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 31 May 2020 23:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW/LvjvvuB0HtTgbzr45lteiTu+O4hjWsUsAHa2h1fZVbvFd0HuG+gyQNJezLmaFbgftzJ5A6BrD3ggT6LurSnpq2nCSy+9sH3cr7hxN7pf+Yh/JAkH/Zhjvi/KS6BALg5fXrn2OAlFDcGiJ7zdAuaXE+QlXm4DYmGmOpT1mTctMlav80+r7G6PAwhvA+vXFogfiCFWxYC3pHBRh3ZfDBDPa9nOdGa9jjDbDtoFbVTaQcD6DrySFIldTJ/vWjDbdt4ykYqnD7StYNaWy2zIKLn0tqg3bScZMUelzbXLXoD6Rfxkooc1HDNg+2p6pFJjRO+4TiWYC2huL44iS5omcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=034Y0sOXeM50/TwbWIBqmTzcKBKr+MfhMUB6zCanFwk=;
 b=abz02A88Sz7hl1yeJy1KYzE2F4hMnbFS5KY2YE2BlRJG16iCDZNeE6fXkcdBpxD+rzKSDBdLJjy35bZ2mWP6+RV9yb5shkKw5n9cQQ8bTp95d5rn6i6WPBeh7Zt7UQs3PpEqI2wXMTi3mA4Ms84VEZ+1f24rPt4Og00C8OCyfRSkBfjX/YGZSSs9VbIB6zCnbivu/CVB56SQ8GH9ZXoiDsrrZQWrHHLi60dww/gRY+i1ZbZ84cHj9MlcFfjoew1Cgsv5d6LYZaiDXD5nfjcOGdEKDZMmRsZ1TebSij1HpClCtOG4nQDYmr4i0TGQsn6eIFdUnmM3qzga3k5DJAvP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=034Y0sOXeM50/TwbWIBqmTzcKBKr+MfhMUB6zCanFwk=;
 b=RaCBeqP6WKDXoN+JyUNJ3jRCPZKB8KP+VYOgSLVvYI5ZXrvPIsALFtOmgOHFpEDLT11OElIosKjXywgwWMhEWr36PC2hhV5b315p1+pD33ggI2HisuvLtpupyyMgZ59gfNRoi/6gZM45Lw4Er+HIX96iabj4ueMrloLhuVguZpg=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4482.namprd11.prod.outlook.com (2603:10b6:a03:1ca::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Mon, 1 Jun
 2020 06:32:57 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.022; Mon, 1 Jun 2020
 06:32:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v3 6/8] mtd: spi-nor: cadence-quadspi: Drop redundant WREN
 in erase path
Thread-Topic: [PATCH v3 6/8] mtd: spi-nor: cadence-quadspi: Drop redundant
 WREN in erase path
Thread-Index: AQHWN9hM5WpDI+1VPEm3aMfh5OsD3KjDTUcA
Date: Mon, 1 Jun 2020 06:32:57 +0000
Message-ID: <132637749.oe9tJpQIbN@192.168.0.120>
References: <20200601054725.2060-1-vigneshr@ti.com>
 <20200601054725.2060-7-vigneshr@ti.com>
In-Reply-To: <20200601054725.2060-7-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85afb1e5-ab68-4f7e-3a43-08d805f59f63
x-ms-traffictypediagnostic: BY5PR11MB4482:
x-microsoft-antispam-prvs: <BY5PR11MB44820296895FADEA713F2C9AF08A0@BY5PR11MB4482.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AHH75T4UCeOfjy03vnTTCKlCMp6NFz1tiZ1NQxQPSFVzbjKlUIPiPLVseSktYK+zrSRYGzELR/8IcYbJnipIRcPouLNieQiP1MDBkxSCKD1jHpRK5AViPidHADEx8YWtuFIratA7PNf1pKilgy7mbyvnYYXVduw8Dekc8jLc7goDYig4OBHon3/48x2Ueqn8RVDMLFnDJ10NFkZrABvG4PUxhJDX3KCnPTR5YS5LJch/j8je0TNvPTt8oI5XfzEd8SczkYGtRIGdOMG25NI89x0jElL9fcLaMnzmteDYzaCCL0VliQ4Pe3TmPmE5u8CIY21iTMR/la6nE/z49/PlCX/X5qs+vuzsvRY6tBPggz57xtDpSvqiO0SgR4BGXhGp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(396003)(346002)(136003)(39860400002)(66446008)(64756008)(66476007)(66556008)(66946007)(86362001)(6512007)(5660300002)(6486002)(9686003)(186003)(4326008)(14286002)(91956017)(316002)(478600001)(76116006)(54906003)(6916009)(4744005)(8676002)(83380400001)(8936002)(26005)(2906002)(6506007)(7416002)(71200400001)(53546011)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: M3D4xOdLDhWJiybhNyCkzuHmCFfOdpTyJDmarVDCkPE8/jR3QhRUI6SKUmQdGoclwXgs/64IoXbyT4/vov8zgEZctWFey5Y3yeYfmSeOOFMktSzOi02lfHFgg8jFvjY6GNeHINmStrpsew2B6+sKudiGtYhJ2NJU0Yd5CYNT3CFEN3pzti9QW1JjjSDSTRNWbV/NkjhZiVkSRJDot/0mqbmLgzuUsl48t84SxJtonpy8RwUNDSfYUFwV5fWgvDIUTfIJEaatzSmWqCBBQdQ3m5+xzBO0luX0nAMPTHbPlrMnm6HMpMUDH3Rmh+G1X1LXEdFsEI6qaPHJI8J4EqMTaljMl8pdAipJl9aCzGVObFGSC4Z2IfkQAUGpzEcGFVhb/+83yeCvYJGveEFcZQHzDmSpw+8/RVAZgEP3zPVj3vW/WWsXps3pLeFPLVP1yHqpd7gHcRenTBzdUVUUCVDaIWdbqFDHFaQmaCbMRyXB/VE=
x-ms-exchange-transport-forked: True
Content-ID: <BAD3164096CD034686935C47F1361CB4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85afb1e5-ab68-4f7e-3a43-08d805f59f63
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 06:32:57.0632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: irYGBKQsmNrqUdcLGEGqWxj5ltiXz942U88SLU526Ism9BHPcnStHHM12nESqqEMMGWSaxqScglcdhWKktiFYOuxOeoVPFW/++IHNiCPZaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_233302_552673_DB0EF9DF 
X-CRM114-Status: UNSURE (   6.63  )
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
Cc: marex@denx.de, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, June 1, 2020 8:47:23 AM EEST Vignesh Raghavendra wrote:
> Drop redundant WREN command in cqspi_erase() as SPI NOR core takes care
> of sending WREN command before sending erase command.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
