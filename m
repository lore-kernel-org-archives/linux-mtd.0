Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA2CCA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A722214AF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzsgP4D3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TIRTpXRZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A722214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYyCkDJm6tJCvuEOkzKH2ekxN0j8LIzfO1jZhdPdQ98=; b=MzsgP4D35pf3z+
	Ub6msDE3t+6fiIMYJoKlC1KL8MLS55gCBKZxGNJQyR/TVZ8BfhoLB2BlNQpZcnziFy4wxOF0kp9Z8
	tUuMcC8n4Tn+h/c+CL7ABQfYYPq9YdCs1J8HcQ9zaDJPq5rXNRjBdV/mz7wyUyTFb2OxYEK5ejGoT
	QP5ZDv9j8k+e1xmQuIyiPMZFlVnaqmmx77tgOjbVv9isjvyUN9Tgw175kbr+9RRY9abJNUJ7eowzl
	8xlFWL8uECfl3kgWmXG1HITdyrK7DNFsL5xfrtFu8QVAgG4VaLBU2Fr1sg2hPdcNwdGQJ/6mTp8dV
	z73CmCgB1IRDQERZ/sdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQquq-0006mP-CU; Sat, 02 Nov 2019 10:45:56 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqun-0006m0-RL
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:45:55 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ReQjp5VIBzKa1X5PqM3fmrpxtzjPgDnZCbPHeMapSNbBz2ie0lI6mmalfJppa4xQkpXuDf7QyL
 dx02FEnuQMdgDBLk5I+/gT25bC4sdVr2rWz0omUtQnCT6wC9rOdQkEgmNnMAW7DJd8jAOun7cS
 jvLFAGDtbDTgnTaWAl7oAa6Bu+9y0qETfObD8TsBaoO1EtVv2laOWBPdqYSj2+ZdD76wqRwZ/0
 Uk79iSXd4LF9nJ6DbV9s0HX0CR82JANGGPTbDwAU2bRXLtYEcRcRjxYnld3+d0jHSqfVCIi9Vo
 mFA=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="55427778"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:45:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:45:53 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:45:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms8KKi1LW6b/xhDXsbNSG+O99Dlpf3mzbffOpIB9fwRCpUxl3XAYV6SrH70ZlXXNHyGkbREtcVI27m0I5lhWcHV+6gzu1b1SDx0oJRB4ftFRsA3Jym2bk3K/p2+e2OXP0dDdJjCKJAlaM4pS+Ppx/KYg3siuFy2ZWUWVWsN/1MZm/LGUT/odT75ToXRTG8RqkBsPY+TesbEYvdrZuVH/wxu0lUV9m/lt4bHbtyqp37vJblXiRtQ5ejpmSt6J1RN62Fj7O0UTK4TllnEka+RmIgO3+kNJnN97EqNwLir3DBJqUTj2BCwNLxeHvfTvOEF964tNQeaux5wFMcR/zRCYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhMDqOxNYZVN7Ow1/IYZfrqAoRF/bOm0lUIrEp1dBEY=;
 b=nOd0c9QRygGn/9RCrmhGSqfri639bFgn3BZ2Zj/8jZa2ek4Fxt0lCdnVRmM8DdBpJEtQ03/JFqfdPWbwkgBiXbYb8br9cq+BKI+R30Sdm8026ZfZk6A/8t5b4bagi8YPZjT2o9Nj+l0A8lUB5cTNdnX8ZjTQDX6VU1XUIJlKrWUUcCVHPIqQJflFrhzEuKhFLwnzvAkryYX3kqwvhxd1O8bBzvssRFTwmGjuvJWzZOHezut8tHxr5ZwzMw1Zp7waHML7b+o9kLGPt66zHtp2m4sljwxiKI0YrWq9QoLw1qttwcs4Qgdo5ruQU5HdfPGh19LLVZCl0ITRQLlIXZ0RAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhMDqOxNYZVN7Ow1/IYZfrqAoRF/bOm0lUIrEp1dBEY=;
 b=TIRTpXRZ93m8+UM93GsqPYXEKvA/R1lzlr2vLW1WaN5AZyJDg5zsidrnU/pWkljD4DINfsfYjNKmjugvVP2ov0/p/t3l49kX6hmnNA21zxUK4sxrTC9XbW9dAk/gHsZ73BXs+Z6d0a4lCq7d/2o6LasT1NVLL1w96U5zE3m/abU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:45:51 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:45:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 10/32] mtd: spi-nor: Pointer parameter for CR in
 spi_nor_read_cr()
Thread-Topic: [PATCH v3 10/32] mtd: spi-nor: Pointer parameter for CR in
 spi_nor_read_cr()
Thread-Index: AQHVjkpkiF1slcDF2Ua4XfvPGlZW3Kd3uLuA
Date: Sat, 2 Nov 2019 10:45:51 +0000
Message-ID: <339365a9-fa0d-ae9c-c047-c9f6a1a553a2@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-11-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-11-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::16) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c264b536-f02e-4a04-884c-08d75f81d44b
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB3629346679ECC1BD8AD1A95DF07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(39850400004)(136003)(189003)(199004)(66946007)(66556008)(316002)(66446008)(52116002)(2201001)(86362001)(76176011)(6512007)(53546011)(386003)(14454004)(305945005)(6116002)(229853002)(31696002)(6486002)(446003)(71190400001)(25786009)(36756003)(4326008)(66066001)(6246003)(6506007)(102836004)(2616005)(99286004)(8936002)(478600001)(71200400001)(11346002)(8676002)(81166006)(66476007)(81156014)(2501003)(256004)(3846002)(5660300002)(64756008)(7736002)(31686004)(6436002)(186003)(4744005)(2906002)(26005)(110136005)(54906003)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tpn0YasCOfnPBwNPlR2TcbL75iNAQKBTxqud1vduYBjI5dDjwf/AIEtt8eI0Z6vYyO9jC3b5LCNJQSQ1dR87x2OxwOe8MtOspL7hBiAPlNEN0G7aOlU2N+6qJ/nZI+zeFnkWrCxXk7WNwpE97S3HchF3mUOxUDckQINNvzMPsGBOI6MqAiNGgo00RGBg7kwdeQ92uQO3eQLxYgfbHrGs2NrElQzJ9f5OxQb4z60vd+EXNidzd6xDcGrvNlWDvxeBoqduiS3BlEG63vveN/ZcaAGrm4IAlzL1B5tf4DfrmY1rXZT7C/NK6wQC+11+zcA2PHZecyzScUgrHFV0ll6hcYqNWBl9Xwl8NfCBkTysqE0dGI29hgomnZkVetbz1E04hDDHaFIrArdrO2kIomO0T13zs/5tPV2Z8niYc7G7zr/3wYHcdmbh6VXNrjLWFa/T
x-ms-exchange-transport-forked: True
Content-ID: <1C15A497EC161D45969A015C64D70BAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c264b536-f02e-4a04-884c-08d75f81d44b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:45:51.5593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAfFiYQMI1oayWjzqgN7YE87Eaum5lnkIg6nYXQujIcnYjlfZ5CVOJmvMdUlkDNFiL8XMFXRlZqPPEiy5XBSkDNAvvruYOEZiWAEhyCWE6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034553_896776_F0A68E53 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/29/2019 01:17 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Let the callers pass the pointer to the DMA-able buffer where
> the value of the Configuration Register will be written. This way we
> avoid the casts between int and u8, which can be confusing.
> 
> Callers stop compare the return value of spi_nor_read_cr() with negative,
> spi_nor_read_cr() returns 0 on success and -errno otherwise.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 55 +++++++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 25 deletions(-)

Replaced &nor->bouncebuf[0] with nor->bouncebuf and applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
