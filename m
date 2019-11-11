Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E91CC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:27:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411282184C
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:27:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="odFY1FB7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KAivjtAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411282184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1q9fUF9lJUiZyb15H3je+YM0q7JueOUFmLZh7kvL1oY=; b=odFY1FB7seSN0b
	kEPOf+RfP7QDtBdn5zE+Dp5TQJ/HpfsiZbqY64nABVXtBzHmvu54pp74v+7SH8If6K3dPfN6UAGwA
	XedzUEhNqnvVfHe8H13+E42/4kOen7tVtbsUYrI+L2PnR0T6+QFzuoeCqJib5vAd7eAijdJqsNldl
	CkWq1DItV9/eyU9A2Ge4aQ4jZK4U7MvTAev2/xOIubtOLqAOI94fyK1W5CXWdU7LOc49IfLYFSjvF
	kS168QbWfzkstbWlAk861yVRJkp0+Xhe36BtGuv5jLlR5oVoF+LFZVaocSTS+v+K/extoU9oPWjCp
	Oy90vaQ/EeVo6t9k626Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFKz-000791-Ai; Mon, 11 Nov 2019 19:26:57 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFKw-00077K-95
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 19:26:55 +0000
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
IronPort-SDR: PSDP5X7NBgXr6L3xK1QdIZTL7QYh3zzSg0aCA5e0qyvwP20C+iuBUlEeAiOvF+Id9bnusfNyus
 ahNKtdivbcli2ySE3sW4LWkJKCklu/G1otMfYFQPRoyTulkSfDgG+LOaT2LlXXxJF3AIVX/pHG
 4CKaqQ328EOC+s8TaUJRFHE7flNWFuF6NFKk2H49VlOno8ZO+10L55l/1ywpPx421hU1B266lg
 cFLCYJBtEryW1kK9SmbETLXvbgIs+vpw6l2kQQRh2hYl6HMUzlQL7HF+pLWqQj7TnzFT19A9rV
 tpo=
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="53780112"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 12:26:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 12:26:49 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 11 Nov 2019 12:26:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0Aokn92OVE66egsB9faIwNZZkZ7uQi8ut49DCUk+F+j6udGL9xqp0Mk5QVXS8rGsoiGVEVWhzXXd20Pge4Dc8L2xSe2NWM5UPUZbMCO/yNmNwXn4+SK5MJWFp+Z44ApdDpm/iw2Vt8qM0Hinuy5I5dP2l932C7KViNztzjgzLyhZn3Yz9AFGNHbsNIxTFWcPDV+TSaXDHAmxokmN6SRuRQi5tVrHhFHHK9N/k/28K34tC+XeHLuVu7L0QpWmTkMyrDz499xlCK0OkLp5fpmis5e2HPNLUrgmuH0e8o8cWu/bCj96dcL/jNE0/r62BQ8Ww/P5PTyN4fo6NuyQBt7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgwz+6nqDq4fOtSv4R2cvUfs1zlPmxaRPYsVlNy8ANE=;
 b=ebw58LLIKUm2FpKLCqfS1fljXcOngtnnyQvxihRN2LsmD9zbkTtTXHWwCJUrtifyvtLlgsVvTxB1JozkqZ9rqBsViSfr4VFqYI1CdUcPKcXR7rbo1kChFzOLLJj79cwKfkFnb2sHk5hpFs4J2d6lQP5VgTt8qMDhil2Usd92w/aCSnBNaKH967J9IbV4yasxu9sFocL4FWxKkOMbv8GlB56QpWpyd0UHXoDNVGc/+MZY8TYv63P8z8X5Z+COoMpWepsJUyMkoE3bSOQyB5Ov8KK4wClHI5r55jSAP4t/Y/PNcVSrrAz0+U+ZrhqTR8CYW+XGeYr1ijRTERU2oxyrvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qgwz+6nqDq4fOtSv4R2cvUfs1zlPmxaRPYsVlNy8ANE=;
 b=KAivjtAMbg7F/YvLHy/XxeMqq99Z/UzEk1/bjRrncSQMkaX+iU4f8UgV3qSSSTAJWwWLJBuMnin8fYIRUi2l3hypchtSOKNAS2w8W5xN36I7LZ4qcyIr61yo0ehq7C2EKwYDumCE4bfGM5svk7bG017+XLpDEJXFU8W55thCUvA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4352.namprd11.prod.outlook.com (52.135.38.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 19:26:48 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:26:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: spi-nor: Make sure nor->spimem and
 nor->controller_ops are mutually exclusive
Thread-Topic: [PATCH] mtd: spi-nor: Make sure nor->spimem and
 nor->controller_ops are mutually exclusive
Thread-Index: AQHVmHSQpwLCmWp+9EG8iC+d50bhxaeGWuyA
Date: Mon, 11 Nov 2019 19:26:48 +0000
Message-ID: <f79cd36a-5de5-36ae-d5fe-9213667dba27@microchip.com>
References: <20191111100241.717a8fb9@collabora.com>
 <20191111094358.8271-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191111094358.8271-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0142.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::26) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.60.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f04db8d1-c592-4374-c17c-08d766dd1856
x-ms-traffictypediagnostic: MN2PR11MB4352:
x-microsoft-antispam-prvs: <MN2PR11MB43524E28605AC141DABC2A61F0740@MN2PR11MB4352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(6512007)(446003)(11346002)(26005)(186003)(66066001)(6116002)(3846002)(2906002)(52116002)(102836004)(476003)(486006)(386003)(6506007)(53546011)(71200400001)(66476007)(4326008)(6246003)(31696002)(99286004)(14454004)(71190400001)(478600001)(76176011)(2501003)(86362001)(2616005)(66946007)(5640700003)(229853002)(316002)(305945005)(6916009)(8676002)(31686004)(7736002)(66446008)(36756003)(6436002)(8936002)(54906003)(2351001)(4744005)(5660300002)(64756008)(66556008)(6486002)(14444005)(256004)(81166006)(81156014)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4352;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ko54G3e2dlh3sMpK3HlIRhe9xBPuWuLQUQ8WqP15iW50r5s72wvdyCbAQeVSVEvbBfxaOJpiDi39p9u0xWHdfk7CkwB3fW/8JNQxxd8M5qUJ2pkEmVcfoTVO6NAdW6kY/9gSFqahyyKd2UtBJqAh8kZYLqTz1e05U9woACZ7Ugcese+wLnMEXT0OWaT9cHN/C2i2Q7l+X34i3bAVmzPIKZJYCcocAL6wzOLZh8JknZfb3nuO/dDvNsfIwap5s/IcT/7NGNv533RBJWsnV7uZslj+8v2TuV6d2MNuWSpU8LqOgu/qBL0bx6bqBnwkKXw6Si622WblnYXmC6NLz54U1TrbRP84MSx3ucw++Mbq+q/6fyKwiq5Pfs2kFYfNtWCy/DE4mfl5XtYWrujpKPK6DOaUxb9F0gVVrcLVEpLFTVfETCsejsc0GnEHWLjjwQSD
x-ms-exchange-transport-forked: True
Content-ID: <BBDF55C265B74944B2A3CD6AF95AA8DE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f04db8d1-c592-4374-c17c-08d766dd1856
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:26:48.0517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brbNIOdo34kwwn6Pb38jWFW78gMvA5limcd1Zw84wpX77N28a2Z36M0CM39QphQ9AMLTtojwc7+u9pLJ6yJpvsPMGbPHbg8JXtNhCbhCJfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_112654_354271_A5290407 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: linux-mtd@lists.infradead.org, dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/11/2019 11:44 AM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Expand the spi_nor_check() to make sure that nor->spimem and
> nor->controller_ops are mutually exclusive.
> 
> Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v3:
> - split checks for better error accuracy
> - s/mutual/mutually
> 
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to spi-nor/next.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
