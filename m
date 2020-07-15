Return-Path: <SRS0=+X7X=A2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA91C433E2
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 14:47:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03A120658
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2020 14:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c4yxFeze";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=irobot.com header.i=@irobot.com header.b="tXcXFBFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03A120658
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=irobot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+KJjuJngroSf00ctsM72LBBN0Tgx2WyCqiSvJr/e6c=; b=c4yxFezepLAulwKj/w0Jtn9o+1
	wTo8unIAgcwiX29byJ7WNBpUOamONcob+B+XQlT64NY48aQ1GPvLpFuzcgdWR97RwsQgHpdyXvr2W
	KcD7sMeGZbsBgHI4K3k1oCQVXGAjfpXmdOLkED0MAYagHektSE10lgp8lSObTRkjCtGUOaGuFGqbG
	Vv4F7zA5l43Pe/b5L27A4wrRW1qFAtOLOopgxyDOb6+qDw5cmgoGdppSCqpEiyuUDdVRRgUg4lwgp
	ZuO56NEH4P8BfMZO4atCve13Idq0MD0/1v0b6M7Sco22Rvlj3BmNYLPbG1fAtRhoN/uLZQ0137AnT
	BfEV3a9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvigC-00048E-O4; Wed, 15 Jul 2020 14:46:40 +0000
Received: from mail-bn8nam12on2090.outbound.protection.outlook.com
 ([40.107.237.90] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvig9-00042H-M0
 for linux-mtd@lists.infradead.org; Wed, 15 Jul 2020 14:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQgbxKwLOhgygInCIkqA+KInd/ViPt8qCx5kPB47EKNvFP6jGYOctX3b+WrQ6JAfdH/Xr+ZVdBkGBLsq3Tj4cJyKJ8sH8fA2WtNNl1TUGWZGHJ6vhhKIAqvHqr642IUG1HAbthLzGdpVwVCt1wCffAynbQKlNT6rzmaCk3LHEdG/+Bvflmc+xiM3osEiuNkjgjpoCEzh8fTq51t1Z/rEFcMChiCob4ompJMRULkWm6Hl8DtDTP9NUUp+sxuydL31EjBVJ3/gcJYu52tIxw5GKDzfBA/Ngiu4xoFVFY1jZ3GWAhcGJg9d5Umyj7GPqczhYH7/oIeI+95zr3NsSP5DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On3dcIhoBTxz+H6MrHhfsa4acpAIxxXUEr0BLjHBTjI=;
 b=lZ4lluBjN8CBwKFmORuaawTmL/VALTMmrHm/zYco/9Llui7sDEzIvQ0WaMWgWQeyRpika8yjaqfjf3sd+Hzb83GK7hxotOWqDZsbOEWlt12cPkxm/rfoTOPgUNW+1SMM7Vb4S8kxXFAXTHk5JFNDsUOIdseYe88P+9f6I7jyQrA9reiQybtJPl1m0h+vY76XejGZXUCKfWs+k50QPiVQiEW3Z+DK9zCxdx8xqPd1Nd7svVcNyLrs3TaTDY3ym8iWy/4MnN6Oca4BYPlrKI9iEzCnC9LeDIjEmNdouDtW4MCMfLPmwd1uOVVJQX60l4bV/hy2NFeW9s86C+8U57Izhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irobot.com; dmarc=pass action=none header.from=irobot.com;
 dkim=pass header.d=irobot.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irobot.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On3dcIhoBTxz+H6MrHhfsa4acpAIxxXUEr0BLjHBTjI=;
 b=tXcXFBFVNt7z0E+EhHFlFpL+GZrcj+GDfbtEWPFGMxZAb9DHupiph4Q3yeQOp9yAHw8IkJV+Ih7868zNL39nEdX74p99B8Oobv6ktGhAhowqrI38376hlQL9IbZ9qSRCX11qRgGgj9GlV5n9To2rXA9W8RuKleuqKsvPONmSqiI=
Received: from MN2PR13MB3309.namprd13.prod.outlook.com (2603:10b6:208:15a::30)
 by MN2PR13MB3213.namprd13.prod.outlook.com (2603:10b6:208:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9; Wed, 15 Jul
 2020 14:46:34 +0000
Received: from MN2PR13MB3309.namprd13.prod.outlook.com
 ([fe80::7d17:ae0c:2d9f:bb69]) by MN2PR13MB3309.namprd13.prod.outlook.com
 ([fe80::7d17:ae0c:2d9f:bb69%6]) with mapi id 15.20.3195.010; Wed, 15 Jul 2020
 14:46:34 +0000
From: "Doyle, Patrick" <pdoyle@irobot.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Boris
 Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH] Fix corner case in bad block table handling.
Thread-Topic: [PATCH] Fix corner case in bad block table handling.
Thread-Index: AQHWWrY81uufKjOV3keIvCKc46rVGw==
Date: Wed, 15 Jul 2020 14:46:34 +0000
Message-ID: <MN2PR13MB3309227C223D0CD8AFE5836AB37E0@MN2PR13MB3309.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.denx.de; dkim=none (message not signed)
 header.d=none;lists.denx.de; dmarc=none action=none header.from=irobot.com;
x-originating-ip: [192.58.132.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 324a42b1-5fca-4da6-064c-08d828cdded0
x-ms-traffictypediagnostic: MN2PR13MB3213:
x-microsoft-antispam-prvs: <MN2PR13MB3213ABA5FE333AE3E8D5BFDCB37E0@MN2PR13MB3213.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5uihqgiEhlK6mEtCLxQabp+DTo+AJklT85MCyPVdWZRQwgUu6cX2eT6+DkmwPLaOUM8SWM/u2WOKxjJtGZrKTW3oT+64QrGhHs1+bBKDgyvmf4hVJWA8BznKBvWzf7X5IvhWVM967ELJhAh5WPmO8jYIKDmG3Smw0TifyAekZ2drfnBexeHXjyKg0C0vDF03R1X/FpLXyvHidOT9/9Li01/0pvLtWlZ0Syk5cPda5z6SVZhCgpNtxRqWztAJ1ec3p5+iAzl9AsL2Lic7j5zWeYayQiwWdwW93AwP2keGLMjzrzy0w+Kycgo8s/CrYZd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR13MB3309.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(316002)(5660300002)(186003)(52536014)(66946007)(55016002)(9686003)(83380400001)(110136005)(8936002)(26005)(64756008)(71200400001)(66556008)(66446008)(66476007)(76116006)(478600001)(33656002)(2906002)(8676002)(7696005)(86362001)(4744005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ztPK/ruJ4RT8INE+rl3x7pJPcbl/iHaOwIu1fGTbABo85NJbBiNp6NkwnqZQ00FgPdGvwX9WUal6xyBkYtr72I95nheB331ZqEU2KYnlV/l1i0dYR+y3qQ5bCmx2hFbpZD+9doY7qfNj4nSEk9awoO06ZYPWdZJUCHlmPy8t5+1+PlFSPBbc938twrxgIAMemxxq+C2WH2kQClrmbj/zKtc14+iNgGCLDBN75b0KngRMmr6gUeQ2rMgd9LdR79JGzV1mQYZH1j5gXi9Yy0fMC0O9JTjeZ1JvOrSfONW5pkmt7Vavq3k/f347yrwVx0pedRAonLFr1rIVxc1IhwCEDfGnbNzVfDKEywtNA4vSbIE1/508+o7p0CVGtQPplMysLwe/hawVFoltQYwm3gnZ9y3G/KVzAsPZV7uSZhVkBUtvOjAAjI1yQ00WY7CMJHDqkMWakJh8bmJcyHwFGRzQ+cYyg2fjO99FMkFSQxlobY5Jj3vcmiL+x5WGxA/FLZTm
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: irobot.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3309.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324a42b1-5fca-4da6-064c-08d828cdded0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2020 14:46:34.2967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a0bf7449-7b5c-485b-8795-6308895cac67
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTWzxYm5MMwpQr4iSYT68x339wCmef7SDGxLuTwi/fP3T8oLlhjuBY2fv2tl0Xbr1w+sQeNx8E+uCTheesXoQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_104637_933573_5921D084 
X-CRM114-Status: UNSURE (   6.11  )
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



In the unlikely event that both blocks 10 and 11 are marked as bad (on a
32 bit machine), then the process of marking block 10 as bad stomps on
cached entry for block 11.  There are (of course) other examples.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
---
 drivers/mtd/nand/bbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 7e0ad3190c..eb1184aadb 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -124,7 +124,7 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
 		unsigned int rbits = bits_per_block + offs - BITS_PER_LONG;
 
 		pos[1] &= ~GENMASK(rbits - 1, 0);
-		pos[1] |= val >> rbits;
+		pos[1] |= val >> (bits_per_block - rbits);
 	}
 
 	return 0;
-- 
2.24.1
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
