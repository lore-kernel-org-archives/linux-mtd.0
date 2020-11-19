Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759C2C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6DBF246DC
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2SjehElS";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="QvAad/dq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="WtU+DNkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6DBF246DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=2SjehElSG3F8CmizxMJ3kw6vr
	bL5XzZ8F7ftBWChapYs+LfC66SmFS0S/Ni9xTWu+aByh4XESdfhQfyl6Bpr3RKBQ4b+O56zM59iEi
	lBtTqF0LDiX2C44ZTu+JQFV64byWz09Wx52KPlBq3R5ErueCyaohSZKb9JBU79Ywj3d/+OM4wbi2R
	vr+Tyt2QEB47w1T7+2Pcy7vk8vvwyupIosJ43SvSQ1RrTJaWAC63J7N7HtFLOXvJuMZFVOsYRLqeM
	W0N7WZZ8cyJ8ROIN/FX5m75WhUi0qIetpQ7JSH8TE2PB5e4P/Ym46ocHm904LE4H2ebxgF6fivQSE
	bCA1VdAbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffT9-0008W4-Sn; Thu, 19 Nov 2020 08:39:07 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffSp-0008M8-MW
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605775640; x=1637311640;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=QvAad/dq08ALRjA8fRqteVMX0n3N9u9t6MnZTG0RbqXEGAiwtRg7Dan7
 xdJZnglx8ZclxBc4wBglI1DWxx1I23FW22l+2TaqpBUkxTbgsWLZ38GR7
 nNG8PaAW5Xc0/4adgK8ruDvceHzB7frJwBFyDHQeqYqTs7BhwBICeK29E
 S3D4DYsE7QSWpvqOfTkd8Be/c/aa6hD/qgApIr1nB3ZOorkvwSNqQVM1X
 yPmLO2xKCMTrHye+ynMnictgMc5Mondz0PrhFZbKL/eAVQpQ32fjuQTg+
 6vjZh5mS862l3+GpEkfveiHiJlP+FhklnXNbLpzur8gA8jA4dAItVPf5+ Q==;
IronPort-SDR: vAoAVeJm1/5MEtcMU/kFHtNBbrm5JShpR7BiZqP78Dha/TKDLv3ZCyYmdM+YVahaE7+p4jGq6D
 irSWb7OFiFT0ng9oh8j5mY4+80e3SIWSdTjOOvxPHG9dU8+bqaFoNAU7P8QoNyetXzhr3mdsKa
 SbHZIrsBDMNPmMKym3v9RujfhSvVjfv+oBT9BOmxe2QJgx7aS1OAsySwZ/QxLrFDCdkKoBdYdl
 i03cjz70h+etnh0VznvYAmwNo+yAj+susaHipAF3iyZu6pUiZ8MjAAqTLx3QJn9V03RUCZLns5
 /Oo=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="256563234"
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:47:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTJNDjrOkjKEEtltr7Lp28AY44glVJvAntj68LzZ5QtfRJO0CTLu3ccAuX7W9p/dU+zB/8jQaBnjDCqLs3QEN3fvQ+WrINlkaZnGRYqrpOXCxillx8Xt0jh9KLG7YTGT3o9euhxaMe/89QU0pogtqD7HY61EPOoBvzkOheX+ogx/zRv+h3IxZtVS4AJhrFog8SZ2n4IbiB0EnSfKhzyyAWWT6Te5Lti7COYze1WgEQvBKvHqr8mb9ou0B2pdAkGHEmiOCbAMukicxR7l2y3ct92z8iKmN+CZ0XNY8L5N1QWmeYfDBM/w8aZ+YMW3eWvdEm7ZkCHU4M0RXKzz6Fgzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=Rp0DYDQGL3aFvz3RrQmZfTVeyGU1Rhpt7+b4iT1/90mzpc9nFVGhPt8ZJdfyVjhdgCTeZ9wubcid0xPEfoMx/9DAGGzmLKOR6w+aI/GRVoJLDjcSf4IwlIrmWGlf4JP/YOE97Bi3xKQ6VbgernV98aWDs68IfYngGdPcmG1aSMmEep+p5O3wfEpUomvGuPipyJ+9+vOTaFi2KJ0+aG95DcT+zwnxEhBOzPYXs2fHQkot0miX6Je1e9zNx6EvkjeIxtx3D0NPh5rbcP70YEslMrqXsg9FXZ04eaabLDe4wMVcdPO4u53gNAWrT8zs9DxDWbCD4WZeeseAYcYK2QXyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=WtU+DNkWcHHq9v+7vltlYxPAS3rs0uIjWexfEJj+xL69WFw+sQhns2/N3GWO7gySVSfBpEWOxdD1+E7Xv1u0LIDRg+MgDTplJstokIA9gPmHAIGY8QOmAVyPspI6oiBRFg9dRFtL3FXcn9sHHJL0NTsyerr3OHdquakuYrrqYZg=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:38:43 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:38:43 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 09/20] init: cleanup match_dev_by_uuid and
 match_dev_by_label
Thread-Topic: [PATCH 09/20] init: cleanup match_dev_by_uuid and
 match_dev_by_label
Thread-Index: AQHWvYhocOE/KFj+qU6m8HXUxgOagg==
Date: Thu, 19 Nov 2020 08:38:43 +0000
Message-ID: <SN4PR0401MB3598D6B584FD73A97E3681AE9BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d44d37f7-3e46-48b6-5716-08d88c668629
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB4862D36B009D3979BBCC93EC9BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vhLfugirm/LBJVDQVEhG83CPym6FDM00kZxCXB0hqndJRE48vo97PGXQ0wPUx9XAR9SJuLVJkqdGd3lL8YCK8RsFy5SnF83vRnxC/BPusxZAymKlBel38EcuEHJd6QjR4Kz31sEMe8qcVSd+0pGApw2l9m3HbURdau7tZ5I+8kmOr7uz6LrzBSsU32UcSnrjD8NPYG4r3AjYWMwzhhnF9CWFdXCDOa75pHsYFCwWhQEiEghykYxLd31FfmTFusr5YAVD1qlZC+QwYG5Jzk/vfrdT6lyEsy02HCuPQIF0NisRD3YdoFcIqgD52iCiY6dIBwy7cq8NPlBxGYslflnbMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 88nmOM5+EWcTP4MQ2A3An3tXN9wV0en98gGW/l7Mp26Nsg1CXZRXzntWhvD3UXdE2DUij2u+4u4xFcuRndUlxAcOr35K9aUPDmlpPNQa7Za++EWjmdrRWHK2XrtEDCBpLQ8L6IkVMFT0AMwdYTEZr9A5gDSg8RUWyranfcCvVniTCysKqWaaHxJQRK96f4bI47cNE5YSp8IRdG/MULgFkl3KmRpfZ8Xvixx+/KHvI5xqfppbc4Pntr+1RfwPW2m+xfgowibFPyX1IZcq5keRVL0Hz7kE/WYlLs4qSUhy8ftZSG8weuwSfm1XO6Biyn42XDb0QFRJOe0dMlqMQXHZUIQzFgRE4SzU2b4s1dgk+XZVZN6RryjfGOY7IcoNjR3ixggU6a4UEoMsoUyqh1dau7WWKWe0LiCziU3FfcvHXbI5U4hz2DSW751XQLOstKdXGhXGIVccGAL5wkmHvgBJ7PHjk0ucQ5ldk7kR2+HgOiVgffBl5cvXm2pHFHMINAtpOjP/Lj2oVE9To6fFpcn4F5xfNU1Bcy7VOiNoYphQXJOmzNc8qwkCRXYCmwZCUNG9WmuTMP2O+yDKDPtQ1r86gNh2p/1ADkfFWZJAS4BUFZqZL5gmi8uCA9K+hA4AHLCPQ/ieJtv35QDTih9HjWJ6uMm6CONTCswAkdnbbRo2SRl17wCd65388Ojf3tAmnrBHZ517A38ZiACklU367LG6iQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44d37f7-3e46-48b6-5716-08d88c668629
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:38:43.6815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lLmbh3EUsXFC6D744TZ/ixltcXZZdJdq/76z3I//Re4QhH9XcIZeGLJayetrzTUbYsWZPdAf1w6xEJPAXVxQz9sQiR9y892Xuadh57IlW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033848_393558_46DF1EA1 
X-CRM114-Status: GOOD (  11.25  )
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
