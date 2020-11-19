Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6514AC388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34DE246DC
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E4CJnyLd";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="ISSQ98JW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="JRSk8Y+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E34DE246DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=E4CJnyLdf9nd0ndPNsPuzKrrK
	iTpRcew6n0XGmiI/osTm2WCWQeWdo5/5ulTtQ2jO7Rk/xq5DNGYpjwX94x5QV+miZOFG6z74yh9e8
	lKlIAsxNKTWih10tasYGWuWK8pRrdr0fddf0SHuUwdsASM6zqRCyPcHAjg3AG3lJGKioIqwHmODry
	njGr3zKiIIS8LmcMKUGomR4IH/WbkL73Y773RbYVaQ67x6q9RKngN0+m7m4TUvX7ZfOBcV6/i6DcN
	Hwpp9sKhZBWWR6d0acriOsIFUZGSmMBE0D5s+hL54N36FqW7SEWbQrHCYkIrh/WwPizaUCAbdvY7U
	WOBKSoBtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffSM-0008BO-P8; Thu, 19 Nov 2020 08:38:18 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffSH-00088d-KX
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605775588; x=1637311588;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=ISSQ98JW424+rNEn4E0+jvSz6WxY3/p+xL6eQbskWdbJ4ykl8V+6LtUi
 9ifxxOScAxGNgzUt7q3bTzipTte9AlNDoHvX64utN4yQeEHG6Srq6gPrq
 qiDr5Q8Z1H1pRY5rtihdxbwkZD8eGhJk6LyyaA2xAgApw/gNi5CdC1cTY
 YxtjSQbKCOrZ1cAZHTgNIvt5tAq9TSwBP56ylbBt3zZ40HVxHX1sS4kFW
 s96TyfE1f4vZy565T0N9Tbg4z3t0Hgmi8jB2nJ5icoqzF4UaNleXwgAa9
 WiCgtx9FqV1AijGORfnzxOyJc0RO8Hu0BBGFVg3BRxGVtBEBKZZ8zgfPR A==;
IronPort-SDR: STrC28aPaitQo1E7sxRiqmb6GNJBmBQGnQiachRmpdfsFJGfkwSpLiOX3TjtF143VMo+SCCKhw
 +8ltkfjcLgCi9MignoCLoWJ7uRTKMjxK0UAcRorZALJIRRtOVZ8iTuyteQPCiKhf59C1CjOq36
 POBIcljs/LOOsRWxhLJUcgF5HjwiUjV6wfKPMtBa6rYZN8ygp+RI9zaCzhJQhBAVYNbt1wXYeS
 1w8pNSZT6i9l16GrdE6otQX6/O/qYPVsed/uU9gBly4m8dKdu+Hm9SlGAhCTUXLnWhhzc3KPiD
 VM0=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="256563179"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:46:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrPXqYBH7Im3r88nZrkSFtdX2J7o6NcvSoz1XOmRpg53IbpnIwtEj2t52dXsgkr9VEKKux1Wrv4CRxHfvmGA9kbMyFZaE6Zv6W1WviHm1a9dOIdm+KqETW1bxMqBy4iUl3i/OH3rTrIeABK/nZQd3tcuGRqIaE+ckazcK2OyeNSi/i5S6EX6xDBRVkqt7OARea5vzjp6dzhs/sLLJOD4zGh19t7jxf47FEoGeJH/t/ah8mmb1F7A43UiHEHQo4usbPpGChTnDyycqTIU+p725F7LQOWkdD0qgfw6Y6kk5cye8heNjBGhvXXPkJXckAupcxmDVGixwXWQC81JfgQiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=cQA31cy74cRbL6J8h1iQnSHwnfiYyWSAvH9e8IJ5X8iAXEGTyoBpHY/AKkLeWc9xj9yQb1MsF8GMZF5RBxrXtpxZbBKO3QUasU5GH15c721ZFPoy5sEcbT68bIOsB3WcH0Ax3JlEKcLnpmvmzwBCjGm1U4MOVSjQVnYNcyOeiFhjOIr6mR9GocbuOSaqsMSyMVPCH6vC2FaAYZUyqSKFJV0QED2NfdXhi2E9uQHIBzn9LmZuFq3ZNtphTBsiUO70/V9upqD7NTMlLEyq8oPUF3RsO6zDu2rL4V77NvdcZN5pUD2ku7RfE4P6ayHaWFgpRQfW+FO835l1qG73T3GR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=JRSk8Y+Gtz3OMbzTm4M2fArUbQ+G6UsWPaVn5YsmAVDeWvq3o3sey8GhnF8dSo43D1kikHm74uSrSoFJOJNZuKzQJ7DISu96WtF12pzpC4qGVtCNWlYXReDABJyC/FA7UKhg2fz9jFUrYELgF4dpSN8s/0l8+TgYZ49LscZZ7d4=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:38:10 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:38:10 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 05/20] block: use put_device in put_disk
Thread-Topic: [PATCH 05/20] block: use put_device in put_disk
Thread-Index: AQHWvYfygihSbkAO3EqJycs/+eV+qA==
Date: Thu, 19 Nov 2020 08:38:09 +0000
Message-ID: <SN4PR0401MB35985F6360E32F28890703BE9BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 92c3f2e3-cc64-499d-51ba-08d88c667205
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862CB19B47022438805E7B79BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g42yADA20zKfT09YVXuquvxGh0iZXmsRDe9bklMiBrFQthaK28s1yf2EjTv1uoB0v6pKXfQCrEQVKqstUKmCpAt+rzV4LFtnPPrytVFPPjrsUsT1NY3vw96pHhMN4RK1582QV7b7eUxFSPToG8D+dIGtqOaZcHriUkTB/p55+rWo3EWMFtY3A12CPlhoEOaQ/+o71LMRPBCMrxVsqPjYcyrAdcAM1YTGLz9AdAxyjW4hEirLDTpfYU93z1QYWovqJncjaAhVvgJFG4jATu94xNJ42VcFduKC2UAQ6ZFdsGTs9oxiNNnabE5ylyI0dZwNUyEaT7Y+NUIVmBN/UdjTKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /akJuE1o1z04hMhHtY8YfzGcCbUKkscN5Mk/ueb8x/1TSn28wXiiO/Uv/GeWQNoedJbudgJRSqr7s1xxUx4VG03KSLCLuNolrhv2cujAFucV4dcggqQKcNMDMvkCpIy/aue5UXHRQywDh1svaqswB+/H8Tn34pS51hr06VmgM9H2JkpsMwabvSeLo4NWzKfzxo24o9bEuEuLJP1Bhnjmh5sjWfYZdJrMCuc1ZPQY45j9hGoEL2xM98JsJlBFSP3qSNRMZa1dAUGcVgXSciVoTriuTumU3lkYPebUUQdSoqxkc9Nt+qtM+u+IcrzJI7+uVnfsfeMpUn4vsHbkn7pN8CVThtTjjSwe+9wqtRzHuh0bW8HKVWIlhs572lHA9Jx61ROnvD1OHWSCOTqI1yntTvV2rcaD79UJuQNREfG6mEbzmw80keiyBT9Q4aleLVtMxL/wsfBY6vOkS2MoMDh4xoh2+E6jQcwgea9GQABAp9leTw3iolDV+eo7LwZQs8XKQkvLAu4egy+aBGJ850FhTuZxrYUeCm1ITygSTGy04jvPEjG8rHPCj8KttrDjmB5vRYElkn7kVNjF90IsehoQjFEttUFlH0jZRgEqOZCJHQtFejZHQPQYhiPbyvQDJ4kRvYk0AqcrdpnGhC0cj4/vm17IkTi9xSqtdiafgvsYM+H8NbgWE6KIpyX38rR/Gw59D7VgN6EPBxkg422mROdckg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c3f2e3-cc64-499d-51ba-08d88c667205
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:38:09.9609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /A+nGOFGHVgtcuTmOCVgRAAjJNv7win23VbADbkAEy0+10HCHizCBKfCvlNVPY6m9rus8x3oWitEqAHBqzMgL65YOdUAeLxVGcm7bjyLto8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033813_911755_A10F3C0A 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
