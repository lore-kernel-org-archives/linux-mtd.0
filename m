Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C8AC3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 10:48:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AE532173E
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 10:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFeGIjyR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="uC0aZeMp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AE532173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vRxQQW2Mz1qhVocD7Zm9TOjs91t82pGDjOhcfxXkfM=; b=gFeGIjyRACaFbT
	XYLUSjzHpd4oJaKK+Necn/Fgs0nK8ZYtgNgpysOugLIYx+KVfj0mErOjn38FnzOLOH5h2yNWwtH8B
	NoOo5M/xXaaGybo2BQwCMJbTQh90mZsJa4rSE0esC5dfGrGKRPdS9CCMRRCIzkErEHtrUTtofoLq2
	wrWpwu1ExLquliZaO9wDRVuhMjPuN1DiqvET+11eJyUJwA5TLtzVzAv9k2a86ADGhDDBOhWrVzOTO
	dQsL+z8XuT5sxWrSennn5w2P6gcNgfnzoIVwXNeL4Og0FKWKzNK5933XnwvF6k7NcQ4W+ztdNFgkG
	TJFmDLrfLgi3FjsNrwdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Hyc-00079a-4q; Thu, 29 Aug 2019 10:48:26 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3HyX-00073I-QL
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 10:48:23 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: wf0UB7nm40tZ8+X64VkC2a3riOpPTJ9gAsKjESLIGwoatsQIxHUNTKMpBPH8SEA2QyY7NDb3v6
 jtHHNV+LM4WGkAG2tm1ehUxWEhHndgSALtXbDffGXHSFkzQSQKJ9gHDJtMThC3FfaVyAaI6t4B
 e7VnAKEpeykiN5uc9Z6D5bW6c0x2QDEry5d4bLmWMT2FrIfgg2fiA8XBj3+E3HvNiAHmskuaZz
 Km4q9inV4wt7I7ArsUjcTdXbcN83nSFzfsX54y0pQUPpxfMcNqHTDpP2P0Ifu/7OcPILlV3FbL
 q18=
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="44148429"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Aug 2019 03:48:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Aug 2019 03:48:15 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 29 Aug 2019 03:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFS7uKGBLRVS0rWuhB3kXe/xXS3wLBvyaCBDYrlb48mlAuc0beGblnndvMXJ4SGWDkdfR1CmMijUchHzScnaXxNOHejHZ3mM9M/KHEyDNM/iOjjyOZClBOW+6UHlx5sbfs5VP+Q5llQW1b3zjSBb525uc5StdN5p/DZ6d15kd6J2Nf7itRfF+hKpwxhA6gnfnxTV8u92a2mHz0NO39TohXEPALiP9RCGqxsafQ9paf4qfLA7YVoTbZDMfS2nLoU6XkajrPxTkcFE8LsNHhi8ykOau1NCp9gAsIFhWCdPedoROvtADhUaUNIFbG+EG+l7GRG1VSqDdu5LGIVf6bHp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTt81lf4ltCYlnDkQwm716uNRAJibC1OpQRzSf+G+70=;
 b=Q8/vpZVQMIl8d5qR2vTevBP/15W55MT9io28zX7+uxGL9/wYME17UYqE4isC3GsCYTuPmPAjZZxK7irj7CvJW9Bf/Cz4ivijDTCjleS97TeAKeijEZpng0CEaOTJ5LgKFpyEl7xdfjyRIbU5jSu8hs4okHF5tR0DqA4yW1QFR+Sp/+uM6DYn3aTEg7gRDSA8wOcEISiQrNV/8KSLBjBH/5xEJqHnK0ZBiF6mTtzt6R8cfFrHDeobixGjqSiJ2qguYbcaN1JXFv+E+P7qUc017wQ7XSM0nWt+g2iyUpGvChnj0xvqcTCFkmkcbqlK3r//kbL+W2O9wbMV5LPHxj7rDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTt81lf4ltCYlnDkQwm716uNRAJibC1OpQRzSf+G+70=;
 b=uC0aZeMp70JBgGebCW12IzBuPvLhwntT5gfBO6raJNdeQOrwkUMyDSHs4AGWFDrMR0mkRfwEXktqA93jSdVKp9YKqsJ9QA7IjSBbM/6VJhUcd0Vpq3qebtYdvFDrvznqV4x39EAtlZU1K8rIzu0eQcuG0M3+JOs/vGUs93xAu08=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 10:48:14 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:48:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: remove superfluous pass of
 nor->info->sector_size
Thread-Topic: [PATCH] mtd: spi-nor: remove superfluous pass of
 nor->info->sector_size
Thread-Index: AQHVXYxI0TEFgblBx06pcxDB5XcXnqcR82OA
Date: Thu, 29 Aug 2019 10:48:14 +0000
Message-ID: <65f562ba-485a-4f88-ff6c-5d5643943b38@microchip.com>
References: <20190828103423.8232-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190828103423.8232-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0197.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87b69a0c-41a3-4882-de9e-08d72c6e6489
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4223; 
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB42234030FD3CBF316E78A830F0A20@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(6306002)(52116002)(81156014)(14454004)(6512007)(81166006)(8676002)(305945005)(478600001)(7736002)(36756003)(86362001)(31696002)(2201001)(316002)(2906002)(3846002)(6116002)(110136005)(6486002)(966005)(6436002)(66066001)(99286004)(26005)(11346002)(386003)(476003)(6506007)(2501003)(2616005)(25786009)(446003)(76176011)(6246003)(256004)(71190400001)(102836004)(71200400001)(486006)(53546011)(31686004)(66446008)(66946007)(229853002)(5660300002)(66476007)(66556008)(8936002)(53936002)(186003)(64756008)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LdoWjUAMU3AJIqPpF7zDR1BPc/kqNwjelFAJW9el2wCYtlp+d6gHpf8xQbFX0zVtIPhJU9yIDdIWls2PEeb2ZumCnoSeWGKXyEudfZjM1Sc29G+coA3s/Ua7LHsSCUI/Mx9FiXHsuohyGkw+8mT6ccL5grBoOUBov/xVgDsY8oRtyr9X7PyZDjBU0/Im/FbVvrsrzDDFnNvJzSgT5QTnjaOWm1UcOsvGJlaPjEgtQNjzwcXvCYLJw61fy0S2C6PCBdJTf4b9wc7lbZOHICCxy7CFBQHWrBLBed1dqeAlSpqHmrZRyTINS5i4Bn4ZasWzyP6gt6RRUENx/VG2gYc89l1bOtQEWJ9UT7dwQXXsRf5AIHpirnwjHKYW9ADb0/vT6ThzDU5q26EjdRPE2xmYhN58aIyLY15SYB/4g5/YX30=
x-ms-exchange-transport-forked: True
Content-ID: <51F25DC1604AF04D81BFD87C4A1D5118@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b69a0c-41a3-4882-de9e-08d72c6e6489
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 10:48:14.3145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiVnPonVPUCHKo759uEurrb6awtG9AWOLfWPvTNRRmE5cJi0S/xwDzSN9h3kB4Ez1Nzf3riqhY6rQqOKFnZox82dK3RrnY2nDRfH2R3sJiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_034822_099297_CBBD2532 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/28/2019 01:35 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> We already pass a pointer to nor, we can obtain the sector_size
> by dereferencing it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
