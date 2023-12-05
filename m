Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7BFC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NsQG0T9AVNsY19xJ286yAn/8VE9kVXaU4LNQ9LmWUxw=; b=JWbnGKWHLeLIbC
	lfJPe5hYvW4EFbI9uCwvtr4xqNHVWIh8zJQ9b33yiae/wUDELvNRVYDeTMfUnJSXTkwaOB3UHXTVq
	MI+SVPkZXx3yZrsEtN78XhIPkdt6+dKO91UHywj6G1We0dlBNb4S1thCABMjiinZawGA0/cJO3hfS
	lgkHuS9CET19PcZRYJoMRuFFp2c2TNDeEYTYENrazrO933zv1SE8+NUnhJFiak9LDG6TLojDbm4sl
	ajFxKptNyOrKowX4jaf1mGsUT11YVL8nr+767HCX1LRPPSUH4KWTfsiLW9L4mSd9g9o7Au06//eop
	iNOY0uZI3zcYTiCmFW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQlF-006e2D-2H;
	Tue, 05 Dec 2023 08:26:33 +0000
Received: from mail-me3aus01olkn20826.outbound.protection.outlook.com ([2a01:111:f403:7004::826] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAQlB-006e1m-2e
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 08:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBmdn7OT/vkxNkYdnINBc3WAAu0n6MIcKUaToVkxpea70Clb3cdp6uU6/nbDWhkQQm09RJ1opSj9QA/PAwm7D7/VXf+u4KAcS+/eZ3zwdHXNoLSghBj9iI1kGkqqrA8HZvFDBnHWtv2VtO4D1qPebqkLIFTNA5Be3riunCn9peq9uxPWzpUMZgHpQf2/WSGIhmzXvZrWdvWsoFPt0IPZugakkz3KUMeITq9Bz1C/XN4AacR9DFxqWuR+z2khUgpK7+M0gSm1vnd+Q0767v9+HRVjuQu4eH/0QdGmlJc4ob0S4AW+SJwaVxTC/+x4LtTa36yRzG+jJEv98G3wOg1WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDgobJEUE9udd4p/yLl8Jwh+vAI74v91wiT5FG17PlQ=;
 b=Z8mzSpSn2svl88VqJ/IcAM/hkBWiCD05vvvwFmYaon4jxv2IPjcI0fJ3wdT5U2aYxYAZwXRCmZsXxw1FCsxEIcTTd7Xz+bG+jIsUzHBMkaTQbFpyHVpMCf+Ub+m5GdJKF3mJuYcJSa+9Q6uBbMYVb6+0uu6pTkR77mdDzIBzwhWMcAnekxG4/sG0cMvGm66zavJUv3VCCdgAd2SiWLZtJQKercih/EvxiUkrR2A7gqP7KyemxCi4eZgZgI8dDmOAUPUCws2kTcCoLDFZfYKNT5O8xYRXlY/9l1+9nSMgWZjF9Qphhr4V/rZiNTztOjkyQbIFPO2HHso2OE/W2xzEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDgobJEUE9udd4p/yLl8Jwh+vAI74v91wiT5FG17PlQ=;
 b=hTTAPqjjo2/IeTgz7kvu6BMoF1aNTwRHRunV0Ds1sSnr828pfN5aWXYBvE1hZzpdGtMsQj2GMAaMlYhyS7hTYJ9WTNeTnRk/TMTw4lGC9f4t4GaMqORdtHdtCt7Qqh1xG0hQDkao9qeOag2AcfPGFZSQs+RO16MYhx5SgfYZ0J+/mqkWBh5XAzfqe3/xWMvDZ2b4hiaomOrfGagds1FnzO1c3BzkPk1ZMcWhTXKVNzeTkl0gdReT2lbNxijhpOlua8A84B7Tuen4rxRqEv8MQWTGKhBxZyrpawRETf6JmzaP7Clzaf5X+JhfbqWHs/vQ1FVI1aLIcf84DBZRfZkpAQ==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY5P282MB4606.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:26b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 08:11:10 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7233:1e6:ee78:66f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7233:1e6:ee78:66f%4]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 08:11:10 +0000
From: Ryder W <rydercoding@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Zhihao
 Cheng <chengzhihao1@huawei.com>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>
Subject: [PATCH] ubi: don't decrease ubi->ref_count on detach error
Thread-Topic: [PATCH] ubi: don't decrease ubi->ref_count on detach error
Thread-Index: AQHaJ01Smf4XGYIF/kKYwGu4alQHeg==
Date: Tue, 5 Dec 2023 08:11:10 +0000
Message-ID: <MEYP282MB31647F3434E6BD0178F32CDEBF85A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [aTJwHwSwKvnkiQO9cIMlbsOZzv0Tu89dl/Y2R6mXzww=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY5P282MB4606:EE_
x-ms-office365-filtering-correlation-id: c6c75615-9ccc-4ac5-f569-08dbf569bdb9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUQXKOAvtX1b26J8t73XoBKw27fatydG3T9wMreeqTfPquhLOuZjZdF4Q8pAaR44nICNN4BUQ2cGkDp1jhNURKDrdcngIy0Gq5W2wtj9U7tJ/+VtLmjKNUjezuf/3UR/dal0ZQ3AuWdH2LL6PCuHrt3xsCT0Hm/zc7/kayE1q1sxg68EHhLrPRbNfXhiKqTLHg0FyRibBcU1j9oHPuJeZpEHOpT1356vOqcZ82V8steLmZ8dEHOdlqx+owaKt5fXJO4Ps7+w08oGk3DA5/H3+GUtNKVRAkq1/FkQMaKCE+kKv1Uuse9/HCtyt8luW2WKAb7ncM9euX+o0Iy3DR2AwehyWXBLuhdQb6pCHHwdMNYWaZbsftoylVeam1hbMBExwHvXPKZRbb8DmA2zuOQphO3NzgVt9uBXzn38Ou6XXXXWi0TtATfVwFXcLsTgzcZ/hb+2kn34UQwFEHjmNbHjiW40IoSgNS5dQRX96BpPCLwFDaMR6GQ0+UJEyvuqsrNfDQgvXgV/u/Ncca1Hx19zPj9UepC65ome5i5snvcddQXcj9oBKmBYI3k1oQyKvuGJ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DpXxiE7Ukq4zQbdulgUmQrMwr3TrLr5Otq4eubh/uRgUGcB7I57/kxQosk?=
 =?iso-8859-1?Q?o9Gm41JzVqAVyCFlCI18zvbsblfL3CRl0v6HuAuXIH3Ol+R+cicCwFlaXD?=
 =?iso-8859-1?Q?1GoJ7msraDVCz85w+5jLRJLExIsXGkyCA9nbOlRNV33tlK5SBBgTkeZQGS?=
 =?iso-8859-1?Q?xX5lhaKaabKcu1wqZeTMzwLOYva56cmy0vnYO2kDFGYuF0u0Q8u8QLLAGN?=
 =?iso-8859-1?Q?dNLiAn/6iWExI7PN3YOT9Vu1GgpGXcihLKSkDSNFFtAm5n6JyUoz2adoqA?=
 =?iso-8859-1?Q?fatHBuP4HWy1Fuxz0+Dkvyi3RW2DZznDUDsbBAthUUeo2VwTALfNlsf2tc?=
 =?iso-8859-1?Q?LjyGfqiQWFuzKK/DYOuNdgcKRoWAUw+UyeNx6JWWQ/JQV7P0NPeQJWktcf?=
 =?iso-8859-1?Q?wd5k910zvPPPRdUtHDLKZMNG2UdBBDHcrAH81QIPcytGwMtknnCV5jP+6l?=
 =?iso-8859-1?Q?mpgZzA+N7R0bKQlP9whEcuCH7WEEGojgHRa/n7fplaHUagiB6pDg2m93z5?=
 =?iso-8859-1?Q?KKdMZQirQTneiT+oSLxIpG2OW9rhsiOzHnLifAIIJatCdlB4ld1eO8cfg/?=
 =?iso-8859-1?Q?ZpPyYL2TFqQbfMvAEn++Uj7UD2/XW+huf/dXEIaNqX6L4aqUX9zvO5dgKm?=
 =?iso-8859-1?Q?QOrgIXuCjf1oJ6UET/2uoaE7E3ZGAVE3VkvF7B+WPH2MBF+4dyL9QCrLyF?=
 =?iso-8859-1?Q?z9r/5rrtfqaGpYgKorjYeK/7rkuyst0P4dSlC0z29YY28rrNXWP73P2bSq?=
 =?iso-8859-1?Q?z6hbZe7YU66B1ER9TX5TExmJlHO8c/B23uB/awthU5bee42Fe8NC1aqfa6?=
 =?iso-8859-1?Q?0OGXbQyvCb54e9y+rXCooOZBbEXIrXm0Ljj40sx9Pl1GAk5pAIaQoIOiiL?=
 =?iso-8859-1?Q?DxK+nP7aZ226dfezsa6XiqGUeaL5F7NKcqdASnnWbaK9UndVzelP45MBVs?=
 =?iso-8859-1?Q?ZOmZtEodYwk5TCDvnpqRcSlAQAeirWifIVFayYD6Yq7+09UQDci3HROIaV?=
 =?iso-8859-1?Q?2slhQbYvY40tM6CaRuIgZvflwZJQvotjP5iqJbAsH/RowT40prriI2lc4S?=
 =?iso-8859-1?Q?XpVp9vdzAhPqCf1NhtYRrkz1mWIlwXfU60vcSfQ7fmw3GV6sNFGR7l9P5b?=
 =?iso-8859-1?Q?we6rG2i3elzfp/4JJ53HpnWXoX916a166HlPGT/1mKs/8lXFgjAdj+8ppY?=
 =?iso-8859-1?Q?Hl7WitnapP9iZhdZ+Nq3ACZ6fRh8xcKJUAqDXnoid8E+L9pLRKqpsokOa8?=
 =?iso-8859-1?Q?MGJz4w4MZq4LfE9m2asw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c75615-9ccc-4ac5-f569-08dbf569bdb9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 08:11:10.5950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB4606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_002629_931681_B5AAF6C1 
X-CRM114-Status: GOOD (  11.93  )
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

> > Fixes: cdfa788acd13 ("UBI: prepare attach and detach functions")
> > Signed-off-by: Daniel Golle <daniel at makrotopia.org>
> > ---
> >  drivers/mtd/ubi/build.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index 7d4ff1193db6f..f47987ee9a31b 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -1099,16 +1099,16 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
> >  
> >  	spin_lock(&ubi_devices_lock);
> >  	put_device(&ubi->dev);
> > -	ubi->ref_count -= 1;
> > -	if (ubi->ref_count) {
> > +	if (ubi->ref_count > 1) {
> >  		if (!anyway) {
> >  			spin_unlock(&ubi_devices_lock);
> >  			return -EBUSY;
> >  		}
> >  		/* This may only happen if there is a bug */
> >  		ubi_err(ubi, "%s reference count %d, destroy anyway",
> > -			ubi->ubi_name, ubi->ref_count);
> > +			ubi->ubi_name, ubi->ref_count - 1);
> >  	}
> > +	ubi->ref_count -= 1;
> >  	ubi_devices[ubi_num] = NULL;
> >  	spin_unlock(&ubi_devices_lock);

In the last code of ubi_detach_mtd_dev, the line "ubi->ref_count -= 1" after the line "put_device(&ubi->dev)" is just to decrease ubi->ref_count, which is increased from calling put_device. I don't understand why it should be moved after the sanity check of ubi->ref_count. It may introduce some more critical bug. 










______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
