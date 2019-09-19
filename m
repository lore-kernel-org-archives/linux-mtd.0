Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A330C4CEC4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 05:05:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB44205F4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 05:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BvMMHyDh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WczUgvld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB44205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27gTttJN1GZ1prDBdQxiuSbikvMweANSwpwxoIxSXsM=; b=BvMMHyDhWQkHbY
	fpJeHVRJjFC2IfgkLB1Tnqb60+7WshdZegazAftlgA2tIwGU19r4FnMR5KlhFmDIOJgFddhPARVyS
	lQm0soGxoJ7rBbwiUxvUAe8cVKAE79kvvloEq7aCbXDEnowVK78lbV6k5qlN/NR5xIbiWPJlaPJDG
	HKAhjBSq1tsAGjMtwtGu2vbbwV6UR2ApTA7IKfM9AE9ei6kya8tKQ/+7VBy6F8sCADED3yXAZ4ZW5
	jXinhQAqQLPmcfTxl8xbwTJWPE4ckvmqe2qH00+P3nVIlFEDxr8fxSacTsLC/pjLb27YKeNOqqXL0
	NW99GhtphlF7Sux6bw0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAodf-00054j-O0; Thu, 19 Sep 2019 05:05:55 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAodb-00054M-Mz
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 05:05:54 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 6bZlyHLYHRtj3RcnsPoBJl3ZhSMAzoh1M62bDc8gMMzuj/QGo7wVzVNmNzuJnVr7VtzdlV3fQa
 u+BRniqUUqXDiz7xNmz3wZryi/PbsTvcei73MJZvsZ0fl+cFayh8542TnB3iv+dHU58UIqyoI8
 3wIPNyedr6bt1gc2VieJPZP5BPT3pGiqIKhsl2dxGwLd519zXL5fAjrdQj9Xe+bODqzEzyin7a
 fIvXFI2ASfE1284E/87hOv+wNsh32OJjb1GqDBN9SDzbAVkdduynOtK2hbE51mMDlWVN3rDdQx
 4cE=
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; d="scan'208";a="48497320"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Sep 2019 22:05:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 22:05:49 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 18 Sep 2019 22:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYHMJ4KjE+6D4MaThbKqHDnqe5swuo4tO7cV9qK6s6+SCBg3ny13q8BefR/koaKG8p/q/cxpmtp/4Un4pMkJ6VfhviFpTiRXDrViz9ulJm3nqPmTH0lni7ofWg8NFCM/Ro6lwnQKq97vC1kyZZt6CRg85V8VpoPyy6tEV9Dq7qnv6RAzw3vr15WgzrHcLv9cDRlw6Z+zfJ3hVCfo9aP7jzn4pnE2VZabwu0SX7yNtt3BZ/eiO0xERul0/FYxGd6+ScUTB2IgwWibNv3W5gzT4PjqkqrVWgf7OM55D7WpWc/p3Gv0qiFWjWfgRYxewS2Wiun33MksSR5Epk+ESXTJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EaxVPOPYs98Jk6yETY1tWwwctLWyGf3H/hVhBGNJKo=;
 b=Kux3VMuxhhPBxoKo81Io+frfl8AbSTUxxmn0Nf0WIorgaoo30SDSlZmYwsY+lPU/aIjpgxXmKY1WpGZA40on4CqD0lUxYrDqrkw/lKuezCwPSX2ITyADx/7fTIHNI7ffD9mqgMIk3DCR6x/O+osRI8ZolMlQUDk6AeG6OSyeR8OjldgOwyhpbiTdSdxC7UigWQs4Xzv9pyDyylwS0QdPPHPHwDNMtLUjqDu9Zck2gnkovvOXQwNh/RKwh+UgvjUaZ5JOYulBOurHzsKAK4pT/nuMdnJcA1NUH9+qN0UmrCZ7y4OqF7bPxkWrRgOZrsYPn5Uw3q36njzgBTKea3UVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EaxVPOPYs98Jk6yETY1tWwwctLWyGf3H/hVhBGNJKo=;
 b=WczUgvldLoDrZwRF9Y2Hv8I5Q31cQ35smQKiLzjnk5pCdsCGFgAxG4ubCKa5LBeuwQgVYysvRkSYYkKgKiEGscAhuvpejloxRs11ZCDE6Gz0RRIisU3oa59vRGvR0ZYhPk5Y7rbUB1TXkNJXu/9ufDVTD4QIrAvMq50WLyQ+2xM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4141.namprd11.prod.outlook.com (20.179.150.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Thu, 19 Sep 2019 05:05:48 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 05:05:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <shreyasjoshi15@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Topic: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Thread-Index: AQHVbox63cGDJV3ccUuN+JNPYUxV3KcycquA
Date: Thu, 19 Sep 2019 05:05:47 +0000
Message-ID: <b23d7d84-73d8-7752-c671-f3f05d4c9966@microchip.com>
References: <20190919014916.1303-1-shreyas.joshi@biamp.com>
In-Reply-To: <20190919014916.1303-1-shreyas.joshi@biamp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR03CA0003.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::15) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.240.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2fd5450-116e-4c54-e710-08d73cbf08a1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB4141; 
x-ms-traffictypediagnostic: MN2PR11MB4141:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB414199526A4387537F395E6EF0890@MN2PR11MB4141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:219;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(366004)(136003)(396003)(189003)(199004)(25786009)(229853002)(4744005)(186003)(386003)(6436002)(6512007)(2501003)(6486002)(7736002)(102836004)(6506007)(26005)(3846002)(486006)(76176011)(53546011)(6116002)(52116002)(81166006)(2616005)(81156014)(305945005)(966005)(476003)(66066001)(446003)(2201001)(86362001)(71190400001)(8676002)(316002)(6306002)(36756003)(6246003)(110136005)(478600001)(66946007)(66556008)(8936002)(31696002)(66446008)(71200400001)(31686004)(5660300002)(66476007)(64756008)(2906002)(14454004)(14444005)(256004)(11346002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4141;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L1W2xCZjTapcXDEno8wlctjBhAxpt5mAdEy28k2UxSbkRhk6Hykw+UTyCjWoC9ByS+5ZASEk9ACfTiByEP7qVf8Mq4SzFFYIUHk13rH6VbafkKper9ieP9EJzGJS9Om9gj6J5VpW560T4pvgPxYvXz09+yZko8SAIU1vNCgDl3LnpkVaOjd1zSweGIxSt6eyDHaXXKqGkVBKTAQPXWFU7JbvcfKwAroLinpb9hLdbMAlU//FjHzN9YhsS/47gEwiKAMtUxG15QdVdn1a8RiugvYN5YV1HN8upcpZ8xoZUrkx9aa/tL/dickZoFqL4D5e4coEkOKFv6erbenNOfz7vfAWZIrzdHnxU4ThIJe7RYiqJe3Ym4vcQsuDkP84AHr9Fxx2TEORWqgpzM+KjuAHlnkb1Ky+ssHBEpAbw06k4Ik=
x-ms-exchange-transport-forked: True
Content-ID: <C66E4C783A669F45B1763E9B16C81CA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fd5450-116e-4c54-e710-08d73cbf08a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 05:05:47.9341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhftW9d+w+MRFm1SOUbrlAdpexuDij7nDGeaPHGQvgvCil26IouWFKcWKSj/y3hAIzHS5XJCMe6MTAv0yh0T74xshU+CXD/ePmTS0wuASrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_220551_857009_7D04880D 
X-CRM114-Status: UNSURE (   6.03  )
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



On 09/19/2019 04:49 AM, Shreyas Joshi wrote:
> @@ -1356,6 +1356,7 @@ static int n25q_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)

n25q_lock is not yet defined in spi-nor.c.

You should do your patches on top of
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git, spi-nor/next branch.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
