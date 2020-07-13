Return-Path: <SRS0=9vQs=AY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD159C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 21:52:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8715C2072D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2020 21:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UXlU1vxR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="OvP01AKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8715C2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oPGVCIxXUiyyYka/d/V+lNryO85Zf+FQJaWqxkWvcO0=; b=UXlU1vxRUzX2p8gzO0FqeCI8F
	mN6ZmJ87qGrn1EmvKfvZwHv/kebN2IjuVvr12Ngr/4sUqI9JF4OlEXLuCUHQQvdJxnjrxa2dnqNP+
	qDJeEd9v0h5xSeVye6H6VtUg2Z8vaYYOsMZEiT/KL3yz2JBy6kKNa0FEWxJBTdElXfmpYo/dMCSyZ
	KgXEdZ5s5uiTgHq6eGp1BP0g1OC6RnMM0GQeUENducGpIg6Fh3mwS9s6y5i7Bb7dnVy9Xpp8X7oHg
	kjwivBOoM0MIMWxR2qonkTHTOK/TJG1t87tTPggIVJlbopF36QwpVZOuPpbiqzY7zcwJaij81XNLX
	q8uewTUYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv6M2-0000pQ-6H; Mon, 13 Jul 2020 21:51:18 +0000
Received: from mail-bn8nam11on2044.outbound.protection.outlook.com
 ([40.107.236.44] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv6Lz-0000nz-3F
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2020 21:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZXlA0ArCxpxawgA5oVwx74Ew51ltpWGBNV4t6WNtNHPy/RiSoSG1jZkMB8We2mpaEMWw4M9AuYg6y9EL2xw4pXvZ/vy8xOuVG7+0Mn0hzMTapOn3uDrXI0EUjQUns+xLxl5BytDQGNV6MiTaeox4AioSyAs/H8Tj4vW2yDP03GtdME6AcbERjuJRgAERGgV6YqYYUsp/JyRjFS3jibdoG20a2Q2HTr7mJ4JlndjGYXk3nJ4zZmWLA+xbvBuxZnaFTsoxQWugQhUSocvekPFP4VEVSy1HVYDljpOhvRfSnj82VMymbNHTUE3q/rBlcpdVdPf+qMVYTxbhQL6fTa7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjED0GPrRv1JRMoh1DcgPJtSSA/Ww+9m5qGZN2x8eQ=;
 b=eOjXCiDYr9n2OD+B9Z7DP1M6jrFNjuEHJgd4y4jgioR5j6yYlwj5GUD7C3fifHFGnyrsERc5sFm58XL7jvLIkRAYpvYfeHUBkk3yx0T1Peoh0wK82KZuQ0Hyj/TtMSjTdq8SaJ0nLvD+EAGMJQY9FDEdZGAC+w4phef0FwNi6PTFi1scr7/YYoAZLuWk+NyEC47ZNqOJFYwhMGzSYA6yNCTEvYG++rV+bc5dfuyufSLCsjhs2QftMVeGWufV3vyYGlocOJEKxrHi1UTj6EdkEZSgm0Le9Q/1NMKOtAareLK6AwUlEavaIpvlwzY34MMtTdUkAAbpvqdMFdxmJFz01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjED0GPrRv1JRMoh1DcgPJtSSA/Ww+9m5qGZN2x8eQ=;
 b=OvP01AKbdr1Lo4m7x9bRz9N7QPU8avfbjyZgayjGauxWCjsL8711d2l9fgPr8NrfbbVvlFJ/oT8bmp0RC4CMpa8wkmlT57g8XQJoRJuaJOsWhVQHG4lUThAbneD+ixVsOd+cRS6oY4J8llIh1usSPiPoInG6VWuThkQCZKf1MtA=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR1001MB2222.namprd10.prod.outlook.com
 (2603:10b6:301:2d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Mon, 13 Jul
 2020 21:51:11 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 21:51:11 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>
Subject: Re: [PATCH] jffs2: fix UAF problem
Thread-Topic: [PATCH] jffs2: fix UAF problem
Thread-Index: AQHWRhkioXhOUXpJp0C2OVljdhi7G6joJxSAgBQb7gCAACilgIAJx5WA
Date: Mon, 13 Jul 2020 21:51:10 +0000
Message-ID: <a42981ab23f75dcf5feddf6c8b50d3b44f749899.camel@infinera.com>
References: <20200619090635.58548-1-lizhe67@huawei.com>
 <e0d04d70ce674584a71af1a5a00984dd26729891.camel@infinera.com>
 <dadc539df01b17aa5dc85e7c0f1dbc83591667cc.camel@infinera.com>
 <CAFLxGvzP3AuZBJ3RugZiRTobxv3Z-kxYKnBUi0rfshwf7GuuCA@mail.gmail.com>
In-Reply-To: <CAFLxGvzP3AuZBJ3RugZiRTobxv3Z-kxYKnBUi0rfshwf7GuuCA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.3 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [62.109.37.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c447148-16fa-43bd-278a-08d82776db44
x-ms-traffictypediagnostic: MWHPR1001MB2222:
x-microsoft-antispam-prvs: <MWHPR1001MB2222B08D40FD9F40D043A78EF4600@MWHPR1001MB2222.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qeSV3BpQAIpD0HWtCMQ+SXvLY0qwyDl68BAyYirhAVTNVh+aGJYYBL0UcG0dp4Vf0bKa1CTY+BNjOazdZ3qByVDUmgvigDJyMBen1g/5ZLL495LKvl5BlNb9Ba2TahtE6nur5pQcEnn3f5YVQqFxBGnCH46BxFkdW1b5HIE/uueUx2t5zWCmxcmZG8JFR1A9+b579nbmGEWTYE+/c4rqiLNPiTQwUu4q+I6N0fQrA506y6MURQkzTJqfuKJhkKZapIUcBaAmBIXWCYdHYVt0CZVoFsKtwtc1gm6Qm5Z3iaRCz5A4sGmSsWghRYtrKCfPU4bG5pcZjYdtyymkeov2LQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2190.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(7416002)(5660300002)(4744005)(86362001)(36756003)(66946007)(66476007)(66556008)(66446008)(64756008)(91956017)(76116006)(186003)(26005)(6486002)(2616005)(6916009)(71200400001)(2906002)(4326008)(478600001)(8676002)(6506007)(316002)(6512007)(54906003)(8936002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RlH2HDBApX21JnupmNHAq2BLKr9K7o964IQHLGeTQhjk9TuwTLxRP9ePzt3n+tW50CJ1HlfR38KEkOu5j0Gw0kvua+QRugFoyWzphh6IFGGUoPyxOqUZyfMcyIssrlpGfNlT6zXT/gKwCK71piUsAOw+BPkON4MA5NQjgfsjd5X4ESCtKvYNEjLasOZaY/+8wxqHcoH2q7DoxnyAckPv/vb4D9A89E+FWlKSY/DBLTF+88QotD5dbqg8S0mMq9xz3VgKQpu90YPEWNHhjtG2vYy+CfpOyNrJ+QitDq+Aq7wYOkK8t8lxgiU7GOfIcSDH2jLUa+sR76a8AzoOc5sPbDoBDE5W1Hga3yvjB97j5kWtvte/z2Ueg2+6ekqX0+GJumZ3dwHrZoeRWRt4nGpFHLoKDYkKkP6bd2YSqoMZJ96UTICHUMglE97PegOxTjUvkMDZZf5GhxmJhU0GP3nyrRlwCsd4tA0Q2Hjsy7uqisg=
x-ms-exchange-transport-forked: True
Content-ID: <3A648F6980A4A34796ADD831A0BC1EB0@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2190.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c447148-16fa-43bd-278a-08d82776db44
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 21:51:10.9087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uEetPqCZUGMPfL8Pu5O4wiZ5HABBpkwWRZjkZNy3R70ae9QocdoWLPhA5OgketrCJRtdp6kp3OF/SppmRPRYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_175115_378630_5E89CE78 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: "lizhe67@huawei.com" <lizhe67@huawei.com>,
 "qiuxi1@huawei.com" <qiuxi1@huawei.com>,
 "zhongjubin@huawei.com" <zhongjubin@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>,
 "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "chenjie6@huawei.com" <chenjie6@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-07 at 18:30 +0200, Richard Weinberger wrote:
> CAUTION: This email originated from outside of the organization. Do
> not click links or open attachments unless you recognize the sender
> and know the content is safe.
> 
> 
> On Tue, Jul 7, 2020 at 4:08 PM Joakim Tjernlund
> <Joakim.Tjernlund@infinera.com> wrote:
> > 
> > Maintainer ping ?
> 
> Whoops. Applied for fixes.

Did you queue for stable too?
This bug has been there since day one for jffs2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
