Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEEBC54E4A
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25CB4206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rX+uCg8K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="qeM0kx+t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="AEDLY3pJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25CB4206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrULszSpZXiToSvyQdnBT8vEYORx4zYEvGQM7qc8WTw=; b=rX+uCg8KlDkw7Y
	DlmcGDSRXvH0yXvFejKtE7xFZTvCk/UIy1imnreIr/U2BXNRnoW5VO/W4a/PBGsdF2d+xwkXr2VGX
	zYL98vJmv6KEpkDkQyxAIcMokFgRT6iVpIzag39rqioRUw/IHGgF+8ZYaDzqNTdo/hEBFCWLhyWyO
	HG50ftJcWBuqBSvBzM79SgjCjbgpRXwU3dEKsLhZaRKfu0+S2iuSztp7uyrA8L56P09Y3NIOlbBlj
	TUSV2FMJQhcbJxOw3HCAbpBLwP7z1khxebEbXuSBa5tn9Q7M+1Cb3DEFqqNWlJtD0P+EtSeLs79eg
	CVjprQWsMK8w7mznF8QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUfz-0007pB-8o; Tue, 12 May 2020 13:10:27 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUfw-0007os-ML
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 13:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1589289024; x=1620825024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ff3+UEeNj6ba5wlBoc8AJAqLN2MqfuY0Qn/ONjfnPWM=;
 b=qeM0kx+tTooJYtFDxrowmEkAWr+mZhgNlmcJQ1fSuoVJJFu/6phVmWit
 J+slx0jSeMTjxl1JEq+YFAJBeEnuFqH7ADI6mG9dNZvAWpwTZVz4LwTQF
 WE0/sWJcMrSuO0qgSc4C1GTgyUicfL9RTxuVfHjuarvNM07rK+qY94tI9
 IXtd4VnAW6B4jzruZCJxANX4j3n2MUVDWWO+bNS88GG6BzqlQa1hA13bg
 uKzCzHYfpvjD5BSHzO/za0S4fX53D79raWbgxLvudNuhhzIYwojbx/v4F
 WVjRiQJ4yBEOnabWCAUA3FP5XpcGssOm97Kvt/esEJuqA1VtqVy1q+2Dv A==;
IronPort-SDR: Y2upTNaPX9BSPLRiWHT3xlipgqV+u/uqDXALU/RQ7HMONK8ewlk/8n8mGAobyMZwjScdQARO7o
 3he0v3smZRtXZe0INbZQdOuubp8VBtaqbF4IoYOM3td9Ppb6EPPghJZcg9qjFsQyASpohAiV4B
 Yy7zu5JFQ8dpwAWyy8NROE16q6HoPqXbkLjNtY+pTGVq+UaqEyf8Etz7OHsOaKR2oaoYPOsck5
 w1EoR5mGJej5PIs1Z9kTlU5cQi/EX9ymA/xtuatt1efdQDZhHzQ4oHUlLQwfDCsXsoKm52fJMU
 bqY=
X-IronPort-AV: E=Sophos;i="5.73,383,1583218800"; d="scan'208";a="12103677"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2020 06:10:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 May 2020 06:10:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 12 May 2020 06:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3W2btrcPLlCC9NI5JvHuRVGlJWIz+hNusF2WEqxfZqLjREYi1RMTGsXmI61/eGKh0meK+eRGs6SU9r+bzfyBmxO06ketTyhoPy0kOoBkWrgItGAXpspPpuIJTuXmoOD2zt243cLd5ggt4EgBz9direE+X94OXt2QTw8cQTXB5B81IVGStXbPPXMUh8RP/TsqfWJQAFXPqtloOHF+iNlEQ6bTQvtYB0BNDgv6h0UMZ70Tncqo5i5ERl+NPBTViIxRECd9DvnFlFQM/qdCMslP9jxrrA7xOGIZ8/kL8iO83EpAbP4K0TcQG08wcyI+QgBnCmpGdAeWPxe5jWs2SFCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4tpffwgcrTyTDrHoSM77FwI+E7kcYL9U9So7XApEDs=;
 b=QHet+wYoIiZfKRftSDEcdbS0rwrM6vD2pR3RK2nadDWCaKlx9PprloltYJ4EE9gf9UlfT/XJxRvxSPqJyOKUL/LX9hkAdnMOe4ATG+UT+VwCcibzeV1HG2+sB5mhEo2AAiU8RemKbs1NArngSsHZAo0eHbBfEuA/zV+EnwCMizwD49xC76pL73UdTIrJ3XuUKNA4Z3B3MlngiYo/alYX/hCrH0dpBKzuI47H8d5yZIKUTTD6jjse647krwClX8HDxMr1TEWAIW02EzXcCvFPXTXbrNawP5tiQdhbRcDKLfu0vY3McJYR5U1S/GCz4dUxyRmWp5CNOTKzjgWgEWyD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4tpffwgcrTyTDrHoSM77FwI+E7kcYL9U9So7XApEDs=;
 b=AEDLY3pJcYbtqFbChXO84xoWNtnqqti5eMZw/e0Cntq5NS7kRdzBJrHv6D35n5koVUXYobbHyRrdFmwy9V/6oiqa7Q5fliLen8oXyc4sYZw5TZqUbOWBXduJxN0bJtHc8t2hPoxwiv0M4MKxfX3PLsodhTdcCNAjX9ZXyr6zVdo=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 13:10:18 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 13:10:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 3/6] mtd: rawnand: atmel: Use
 nand_{write,read}_data_op()
Thread-Topic: [PATCH v2 3/6] mtd: rawnand: atmel: Use
 nand_{write,read}_data_op()
Thread-Index: AQHWKF6vNQT3BtNbnUymB1lIQJRSqQ==
Date: Tue, 12 May 2020 13:10:18 +0000
Message-ID: <2815971.uxDrECCjjb@192.168.0.120>
References: <20200429132046.583658-1-boris.brezillon@collabora.com>
 <20200429132046.583658-4-boris.brezillon@collabora.com>
In-Reply-To: <20200429132046.583658-4-boris.brezillon@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8aefbabc-d16d-4a8c-1ac4-08d7f675d1d1
x-ms-traffictypediagnostic: BY5PR11MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB440195D4F139A5B1888AEC8FF0BE0@BY5PR11MB4401.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S1kc7UVGv5H/WK031G346rY0SB1s2hMoXeG6X5DvHKIX1JyX7sl9td1NvdcK800C53XJigSvRoiNxYYjv3BEIG0CRnQoE1k3k71TYLmA+CR9sCxzql3vr6pzAn9dWnTRyul+mqWTyrYdC0Fp+aktcrHlmYe1S4lhv0841Gq9cKAmxUag3VJiBSfv4Zy7CUYEhYXK8/A1Wno0Cw0/1ZXymMbViapKnreB/RkeeyniGTahRJIR/TYuq0/9GkxXJDv3YnsmRENXMwAWp66IV33mioG/QYKULvBxcAJMivic0c4zzrJfNzNpEjyohO8jZEmhYWIcnd4Qv1pllssPpQQOm88zRvd4tJ/AOdbPTs2cv7tYbfiipTOqSoU1ZtxWYjLtBu0au9LQvXQWKK2I/Yfygj76z3g35wxK80JB0AzyWLSbgieDKSgD/EKBHpIY2CHOk/BI1iz9ttpsInImIkYy7Yv3sqBfdTcQdHj4KSNkNbT9uSs23MewZRAkzMeybxzbnZUmxgg/Ve+kNvBNOzcbDvfC/Mux+WnjN8jkiQiNyAzdVQmIkmTYhPlpc/glXxG1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(33430700001)(8936002)(6486002)(2906002)(186003)(26005)(6506007)(9686003)(5660300002)(6512007)(53546011)(6916009)(71200400001)(66476007)(54906003)(4326008)(91956017)(478600001)(66946007)(76116006)(14286002)(64756008)(8676002)(66556008)(86362001)(33440700001)(4744005)(316002)(66446008)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uKlSRqverRHcf+FBkXZpUGvZQk7Mx5Wm1PPQSIPsD/SoG2uZQqJHqQdmqEPdbe9X2g4DOOf+zRLim/jhSWZtBBKXn0YX/YqD6roUEWH5lfs5qE6Ps8SymNABYV7AISzN+GCeREJTq9js3Ht677ELLHunVsbwFAWt4byXNfFVmmIqDvU+HbLSXPOX0Ee9Orkh4q4vjW9je+hMe+juLEhlyekaTXvIsG2T3VcKAu3Ys6k9SF/LRi7mrUMZIHU7RbJsxMJVoD66nuOi7qbGP7XVpHeamFCRSjH7ozSZ+XooP+RzDW/tXOlD3FX0fQyWXSKVm803/0FTIYDsRf0iFsFkGohpyChoMscdlOuI5HXLi0OzuWp1L4WTI30Cyz3uAv5TJ+WSP1XQLyPFbB3lSwL7HsH/gBu67JPVUiNT50NqeUtxxqE2bzuAlntH2i8/DPYrMf28nFUdq4DeshmM/SjtwbLKWRhKiCZDkJVUyrYGQa0=
Content-ID: <C1730FB78AE72A4FA59AFEA4304AE830@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aefbabc-d16d-4a8c-1ac4-08d7f675d1d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 13:10:18.7213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SM6bnHBXztQvle1h7WQStaHA6CUgC+UXjU3OtabMCN4KU07HhBOqJi4saT/auMdQ2Mkcx31VHuER9rkw+IJRVWbbrg7ehyV8e/9Dn7kSuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_061024_816915_AC460DAA 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 29, 2020 4:20:43 PM EEST Boris Brezillon wrote:
> Use the nand_{write,read}_data_op() helpers instead of calling the
> atmel_nand_{read,write}_buf() functions directly. This will ease the
> transition to exec_op().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
