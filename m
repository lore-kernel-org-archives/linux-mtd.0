Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D563C77B75
	for <linux-mtd@archiver.kernel.org>; Sat,  6 May 2023 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=44KgoUCpOKOrYT/8COBu0f6v+mhgPhBU1oDCqLjFmH0=; b=P20P2WC3mh0pcZ
	u2lKJvspbiJGWCvvkt+/Zes9oSSDMlmjSuLkLeYNzY6y/BECOKdmuB92Ibr6E+CrqvPVrR0Y5AayY
	qEPCYBMlkXzxbVB4HF/ap/ZEcPmBNAcqdxegWcC3IQtUNEAEzHvRzcRTYDPi0uOyGlbopGiHKttGy
	p7CWXmAQmKxFQq05CW3MLVcHZJ5PNl5FeZ1qEaN+rXBtxAlXfelFRcOEwnsOpM9ejC1bgBxSyvzk1
	jYtAYdzc8TBSqNVQjytKGz2ng4AyZ36BSRQY8SPd3Z2z0f448fRsal/VZqosHVOKE7YUstBXltkUN
	YnuX6CNxIzW8tWO8lA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvAfe-00CbHp-0h;
	Sat, 06 May 2023 05:41:26 +0000
Received: from mail-shaon0128.outbound.protection.partner.outlook.cn ([42.159.164.128] helo=CN01-SHA-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvAfa-00CbGu-2C
	for linux-mtd@lists.infradead.org;
	Sat, 06 May 2023 05:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0g4FaXLpcYKHjDAcafR6Pq7sHRGSgYr86YfHLipI9SRQ6DFFYEFvWMC+MGvtXfo8oIv1xlSDUbHipQibDsBay2uYJHiNNf234p/P8kEWGwuGgmfqWmLC619OOKZsz4QZFTo97FjMLNZGnqAm9vFiCIkj5U3Y/XsnHD66IMusYHZ2k94jm26wQpLSSdf2vfDzpSsqq4EfW++SKhvooRUv94HmKP3o99Fl5gSnQd62MXCPmpp/0fmIrmAiz/RBsjasojW2OQqHAwQR/212X61K3bZe2ALOaS5gMVbURs2JkbXuocgj/yyTqfwPjDhS7aN8onGLEBmqauC3wfxuHto+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI/JHQpeUkAzIyE6RGXW/L+hJLh6/OXMmdQEn39vmjM=;
 b=a5k+VIpZ0IL5N1xmSKeR1arGmzGUhUlhhm5tTA5q/5GrDoIYAiw2wl+MF8yk66tNf6/7f6066o6NLa7ixZc3jWLLzC0sqYWh7drjOfC7rFRX7dFMRspwCJrk0Mg/byPDinE1nGheqzYboknf8DKOHOfQL1H+C7QdTuLkmej4bixb/yLKhk/ZJqDZOEFLd59uemXBDaZ7ZzuIoqO83mUmcmR0gVyFG6zgyH9BUu+bFOYp4YrkOxjGQDEOO8CiCDiijBPrw53zaFiqwpz5r5HMcoO4jvwCO4ufXpAA/uE1e6Cs88iASQHYlxcjxHsgSmm37Nk6K9BWKDeA15cSIfsSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gc.omron.com; dmarc=pass action=none header.from=gc.omron.com;
 dkim=pass header.d=gc.omron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=omroncn.partner.onmschina.cn; s=selector1-omroncn-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI/JHQpeUkAzIyE6RGXW/L+hJLh6/OXMmdQEn39vmjM=;
 b=oyrjQw+VXsDMRDyJGuFqDTp9aFxnOrVx/rLIxfK5FrAP6wHRa9fwhqR2MZpdGU+VGaKR1NoD6gVwu6vyKNwcr1ZAMQkh1Xi2PvdTGfxN7K69CJB7FIWIcfx5W0CbsjtsZ3HjaME2NIXlrQhwTkVxq519zyAEhC37+D0wfShjIes=
Received: from BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:13::13) by BJXPR01MB0741.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:19::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Sat, 6 May
 2023 05:41:12 +0000
Received: from BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn
 ([fe80::ed04:82f8:2631:151e]) by
 BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn ([fe80::ed04:82f8:2631:151e%4])
 with mapi id 15.20.6340.037; Sat, 6 May 2023 05:41:12 +0000
From: Ying-Ying Lu/OMS/OMCC <yingying.lu@gc.omron.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd: ubifs: Problem about license header for ubifs relevant files
Thread-Topic: mtd: ubifs: Problem about license header for ubifs relevant
 files
Thread-Index: Adl/3VyclHOiedTNRoyVuhUo4QK2sA==
Date: Sat, 6 May 2023 05:41:12 +0000
Message-ID:  <BJXPR01MB0600C3825B4DB8349C3BC513D9739@BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gc.omron.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0600:EE_|BJXPR01MB0741:EE_
x-ms-office365-filtering-correlation-id: 4d5026ea-883a-4d52-5bdb-08db4df48091
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7iSzi7KobQUq9FLmfcjNk2iv6TWFKAB0JmcUbTRPkr38hnN9BX0nGeAnb3CLev1k3ZY4f6aEou1ECuSGdcMDQ8bI/9KxbJEXGueZS7QFqM0afRBAl5LxzifD8vz0m/QTVwqbSHVF6dAsLloadgmfBzcyyt89n6tyGwaY1CiQ4FnYHjw3uIHrtZZRZlFoS3a/idvfGESVU1pY2FrI/HEb8wwhwxumrUfEfpyehMoPy6KjZdrKi+iY0oP9ku+0s/u8/8+bKuQvNBAAw6wnSIlBvBZZCeJiEKsOLa02jj0gDnMrf4cRgM3NrT6HRUdCHEO6/NmXj1wAMZZozDjNyUWF2rfRWC0nHFcP0sDZamAHbiuD1XmJ5MWfqgmVMhEpvv/Vvt/h2aMA+7qNuoXOEpYG1r6nm+7oe71/P9xE4KOrNVdIBJP7qdGQfF1SogGlPEWZNkH/p8KdoakpiteHD50Dy54pmri7dBrKQZR40Ntl19Hc6eThUH5+vbtbYFviezRhfDaGZQTJvFcH8W+3HmCimh3TLTvVywwYS3xeBC0iWzvI2j7IDxx5L3cmJbzZ6Wyn36eg9/c+siJeEtkRyA53mQhYVK+c+V2GsMoVjGOudgKNhqVmEOgU7MYuQU3mp0W/gOwCRFHh5n+fKXV4+tqYj9B3Ir8g+wwYzUmQpQu81io=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(39830400003)(451199021)(186003)(86362001)(76116006)(33656002)(83380400001)(122000001)(71200400001)(41320700001)(7696005)(66946007)(66446008)(508600001)(66476007)(9686003)(26005)(5660300002)(41300700001)(4744005)(40180700001)(2906002)(40160700002)(64756008)(8676002)(8936002)(6916009)(66556008)(55016003)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?P37iDyX/xiVq/MBudDUrXWGHjfTNbgWW3WPSxj+KAjtm/NpYypnL+zxs2ZSP?=
 =?us-ascii?Q?YoEIL3d4NIGpANOfBtfkuJFxbYWlA+md/JNiNyXPwoE0Im6eo9v4czTT5bhD?=
 =?us-ascii?Q?jM6XcrQiyXgraNdTVUdIYDl3NtCqJQPwHpTxTUXHUST0a34v5KduQkeKalm3?=
 =?us-ascii?Q?yvJN6zAtzAxm2zzWNw2H0WJ55g8OlczlO95BUUZMljralHx2SPP8dzUyv7Gs?=
 =?us-ascii?Q?pLOzmnlqvDcPFOUVc38qjApAMXTt+JdeXKKqfDfTOOBKu436ZmgWNDbzsfCB?=
 =?us-ascii?Q?sq2w62z7AGVr3GhUCECLqtLZazTpvoCFHYpyl/Y4r6NkwAU5l2P8uU9CmoFy?=
 =?us-ascii?Q?wuT09sC1BE7ongTB6X7ICpF/7O4syLmvaBeOlAEjfj1lX/Mp57Bm45TWu3AD?=
 =?us-ascii?Q?2zfKJ5u2FeD4+HMFVumPzV0J/XYF/NvIYEaVyZV0ledJSTXr0ACe4Sc6cHJa?=
 =?us-ascii?Q?Y4Pv5JQLWpshLDPI/3IgxU4YFYPdEpedhQzVLiH13ympibxWJNq1MNrnhgtc?=
 =?us-ascii?Q?nGd9KRfL/p5xIS3kXRc9HvHmbuoWGVN/uJAS1AkzXEqdhaBMhKCDDYUJRIOy?=
 =?us-ascii?Q?uSx0NxyoLZd123Du4/4Z/El8kaSoINOOMGw1XfguZWI7fTt+bVqIwp2y7ght?=
 =?us-ascii?Q?magg13/rIXcTVW8ZIwbxAGraY1Lv/KpcwQPS4Pg8wSRYBr5RO0enGwy1sjQV?=
 =?us-ascii?Q?7likpX76d4RPDuv+1ZkwfMyCdxSGX3aik4XiWUsUrb7+sLLbep5ukYiFVeBC?=
 =?us-ascii?Q?OHJ1k0BwqQaALP4YuVcl83lcT/Y+xZXH4AcqLkyiio7QKg/4nLXx+tLsLcZl?=
 =?us-ascii?Q?JnUD2jCVnrAOTazN5G8heWVcmUGNY8ceCl/G7Wobo7xkVI1LWM/85e/0tr1s?=
 =?us-ascii?Q?GvnRczx8j3ONRb4yNJrY6hFuAVEwZccCqPRFsShLhTKMd13ZYSSO9aIJ0jam?=
 =?us-ascii?Q?0grWH92c9WinlPCqzg9L/f6tMkAvljU35DtXJ/TPjW9EISVbNZRfaLB8j5Xz?=
 =?us-ascii?Q?WQzNCfZg1mzewewL9w8YYMAXtxop0r7YAieYHoNFWcRgDL1Vm1cj/h/c5rtX?=
 =?us-ascii?Q?+M9WRMFIDjWzjYxv2WZGqSWs9mnLYO+VR2bD4Pc3LdJ7YcZyCnqUw/5axrxq?=
 =?us-ascii?Q?JDdw0gD8lrwWPDBPSeMqye79Sn82AccIg86R+bvY3yVzM3JVD8jaL8tCCTPq?=
 =?us-ascii?Q?ttGoRf/cAeHe6WAi6Dgjn2Xy//h6pHWbnK78T4zkU5ScO6c+3LaIlqd1yzs9?=
 =?us-ascii?Q?0BXU5/lHJ6gLUyBFRqKLc3saD7oWVbJ5eVd5a4A6TAaYphchD6JTOw7q9j0x?=
 =?us-ascii?Q?hlpXZcLvuUrPAImKtutya3uyrsGo0++jWM8kd6olrx0Rf5K7Zw78bYnZJDlO?=
 =?us-ascii?Q?3OM6AUeISTB5Mt47/xzGorYGFLIC0BH3EP0RcwioOprCfIRfraHxFQUjXTkc?=
 =?us-ascii?Q?qooNp0jhQ6MhWhfGbLna8Fwp1OVGwZ+1gBROSraXPuFg9N+GZ0iDTxXGm+mE?=
 =?us-ascii?Q?2o3NZGtUW8RM331BCyWRbObuCs2uPyviL/r+b0HNEvdggMvTt1cRf1C/UfKj?=
 =?us-ascii?Q?aKF0QA55RqBplx/MCgwkqU4MFhda6YCZh6aEX+l/?=
MIME-Version: 1.0
X-OriginatorOrg: gc.omron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0600.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5026ea-883a-4d52-5bdb-08db4df48091
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 05:41:12.7127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4230186-a3b7-45b2-8e88-4800d28b7e30
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UyN/hTm0mXhgfU7NVaIINBhpUspciSwWrpCE7B9vz7YvUxiX1xTSio0QCcxKcj9XXM2YuO+EXP3NFRgLXK82thhH2AjDazjBwNSUHAYS7CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_224123_623994_F3999FAF 
X-CRM114-Status: UNSURE (   6.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Hi,

I'm currently investigating UBI file system for embedded product.
I found that dual licenses (GPL-2.0 and BSD-3-Clause) are included in ubi-media.h,
but only GPL-2.0 (or later) is included in ubifs head files.

BSD license is acceptable for me, but it seems not included in ubifs relevant files.
I'd like to confirm if ubifs files are only in GPL license.

Thank you!


Best Regards,
Yingying Lu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
