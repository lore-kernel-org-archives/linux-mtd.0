Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871FBC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:58:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515C420672
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cXoC9dOk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OPRRvvT2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="b29uChG3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515C420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=cXoC9dOk1RadoBv7KM8TX63W3
	nGmfhvO7Pk+2rgEAtGn4IMp/fL5tjYuFDVdXY07lLgKRXRyACvV16nxcNo6AMea86de78ytN2UhvR
	pT9TXfI+m8XJTgybmymQqEZH++QcH5zzw/Ecc8XwrZ3qMZCKww12Va1LKrPK0j0fO8xmys9002KAP
	P9uSQjc/J5ZA71faXGjVnDtahg00kr3ZxcLZwBNC4DjISN325ChWXlyraOY/yk9tJTSi5a5ANtqYo
	s7kCrF/biF57qu585+BtKXyhKV/IK8x36qNEg1YylgBcoT90J3o9Z+5XfbTg4IummNJv9XNiXgt5z
	zeC3Kg05w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0PAK-0002M8-96; Tue, 28 Jul 2020 12:57:08 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0PAH-0002K4-IG
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 12:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595941026; x=1627477026;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=OPRRvvT2KQhom05QJn8LTdUwhx8zfxhhZDpq1q/YBmxmGNQn/iXgGFKC
 IHSbZlGF0ZLCt3xrNsL+FQ9OvvQwLj4CcBznYJkPnbWiRFud6dgnPf6kL
 20TQHNIDNyVziOoJIJGPZTKib69cXkowRhlp3esS2BIjOEfOhV7eD9cYT
 3+FpqnfKn438TV9rLsYX4q83QpOQpatjIwG4AGqo1EIpCWW+Yg7d/0jxd
 /CFeun2uqzWtXx4cvsOYK/J8Jp6r834RREEDPRd5y7PtUin5mn1T838k6
 YWOfd4Jpme1Fr20d8b8nYJXcl/a15E+1iG/gkMVlsOHIHM+JXTYmY/PK6 w==;
IronPort-SDR: gK9xZCKDX9cSM4byXScDmZ89AIssnpejUaPi+k69xl7uTaGVGRuWtlrRsA2Y58hikBHbXrsagE
 IplDxS5Gnly9HP56TS1zyI0mH+mqFCUfBS0UoTslii4MvUIQhTAbPYT3yAaQMza431a5zNO0iz
 t7nvU3tw9PKH0+0kYLhUmPHUHl/FpfHTx9OXryxKLfDPSAo3xgrk/GeQugyWw8iAwPyM5/0H7t
 aCDfNhNbnuZ7fruSQJd6BIAofyPivRpR81Xv05xAjL1ZR6p8+os7ORNLuE5D33cpBaZgyoCAM/
 qpc=
X-IronPort-AV: E=Sophos;i="5.75,406,1589212800"; d="scan'208";a="143652628"
Received: from mail-sn1nam02lp2051.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.51])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 20:56:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNe0uYEAfjZFe8ci/fjjNmgDHjxwzExGY6Me4htTYSDMdY+WZO33qBarvzKgVJ6751Bb+2fsmC0xgmVyouFfTBb/ewE6BwZNnejXC8Cs3ZaCJIlXfq8OVWfqYc7NyIkXSQmC4YIMG5LJVbO4bpk8jWv3UBdj3zxgBidVvXZ63ZwUbXdcElnq5EoNikFv9hgVmTKIRrGwTmNvH2UnrJDZViJbQ4P8xL8vUrzyNvWbvQsCAAtRUO2gOcocCXdAKLVZ3JfEilf5vbLm5eLYoAnTSh7T0kI6DPCyHtwuxlgHvlYshOGtBGaF8Oikq4rJ5CNepiA7z22zIKU36TheJmHojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=cqh838taFrKnLvOEdJCfld/mUUnaUCjMrdZYX/fyRcL+g6qkuJyNdA+hGN6pGKQhnrCT3qXh9//EOwB9CB7uS3aZoNLvWi+tLZfoar+9IgVk1gpPIJPdCYOT3mZsv3DkU/jtzBbSrxpCPI53foH83mFJb7UVWvAS5wwqQ2U/xmdZi5Gj8mBXnVrXoafehgrPeuveDFoT8dgYuVhYvzbas9ukDaop4LW15zW8RlEqdXPSDHMIIPTOpz1Sdix1wqAGqP9C0tX02HxKgCBaPMa2dhyQ0HbLqU9rJIvf3gOJEQ6YBW8O4Q9LhgwYPJvudF0fYoG+kjIUaGxHM2IoKOYovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=b29uChG3UOwrtDjEDcjFavxk+dwl8A8gscJ9dPp03CT6NSWQJaVuVi8ZkAaGRxyj6J6xefKnmjxAN3pgPNKqhdrVSFwsckAk6HlKii5XB94StBPUGFIldf6tJAT06Ct5teHgFtT/jXlLeA4ZvYM7kytZCpzqdAi0nfRVvzvJq0s=
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com (2603:10b6:4:7e::15)
 by DM6PR04MB5322.namprd04.prod.outlook.com (2603:10b6:5:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Tue, 28 Jul
 2020 12:56:57 +0000
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573]) by DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:56:57 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 14/14] bdi: replace BDI_CAP_NO_{WRITEBACK, ACCT_DIRTY} with
 a single flag
Thread-Topic: [PATCH 14/14] bdi: replace BDI_CAP_NO_{WRITEBACK,ACCT_DIRTY}
 with a single flag
Thread-Index: AQHWYYzlqorm63WWfE+oLNIUKsplxQ==
Date: Tue, 28 Jul 2020 12:56:57 +0000
Message-ID: <DM5PR0401MB3591373D85A471CF9541D1E49B730@DM5PR0401MB3591.namprd04.prod.outlook.com>
References: <20200724073313.138789-1-hch@lst.de>
 <20200724073313.138789-15-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 256ec321-6aa9-4cf0-97c2-08d832f5b5dc
x-ms-traffictypediagnostic: DM6PR04MB5322:
x-microsoft-antispam-prvs: <DM6PR04MB5322089578D056EB25991E949B730@DM6PR04MB5322.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FbYENchCtaITF7m6RyQbIeSeYE8S5uRLhSBUwrGKWMDyYndXIa8DkqeTo4ZUphOpX0bWNxjaUcHvsedufES3GUtZjMp/EHQOUgLlT1gGYUv7j6sSa4dngXlVaMOw9vJGPqEFYNUDi2otNQF8Iy1ACe845Wo0c5OEEAU+qtviNJ8sUqEEbXxBRZAnVFYBZCcCFQZ6CuPeavMN7ag3aH930fsmd19aRUMcvMGz4n494U4JKp0hWFANLMkDEX8QUc1gePJgfw41ZBSSx9Hhc1JCXbjvdzgNu/k2fYrH1EeZHqmzXjT41Py6i51XNOqzGxV/feCFoaCVQIFhyBdFrmefCZ0ad43UdNua9m6BSg5OnT2CN+kfkSmWjq1I2Z4LJqWeli1+h3zkVhQlh06rPOAuww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR0401MB3591.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(5660300002)(8676002)(66556008)(66476007)(66946007)(66446008)(19618925003)(9686003)(7696005)(186003)(26005)(64756008)(86362001)(478600001)(55016002)(6506007)(8936002)(52536014)(7416002)(71200400001)(110136005)(558084003)(4270600006)(33656002)(4326008)(76116006)(91956017)(316002)(2906002)(54906003)(142933001)(14143004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: G4IJjpzbqsijbA6RQMTP9G+lqgirCTZ4/7zN8ekC6hb1LAROoioXlWe2Ml+OzEayAoSW6N9JJBCaGQPnOyWOpT4Q+64JLk+cQo4mIJUgMYm6ucuiiyiHzZl3LlUC57w/qmQdqGaLfaz++dA7DWD2zzlBFKCCbWohZ4SEBqK/NA93P5uosS8Prs3ezBefgffUbovR6Ebzs+qQLctj5hIEJNawz963UPWv4AGqxdASCR89Rl6k9745uo55/BZWGXR3RuEMQrZO4msfd812hPxtEKfCjR3voXB+NcrTyt/aoAL2bp0NJu2lvQozgOJgvcySJw6WLedmyd5w4Fdp+Qel6dsIdXQYyl+5Q9nyf27iq0tpdfzbPFEPXCm077MHG7iVJ2eEK9EYaRwXkLv78uhyyz+vLq7/xqrkxJRf66K4RLceQQJVoq5PhmO8VSNoMmy4tfOwniOy5IKtBV9x9MsnfVL73rvt1ddUSdeDh2iZbZ6QAi0XPePZugix9z8dNB4M
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3591.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256ec321-6aa9-4cf0-97c2-08d832f5b5dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 12:56:57.1354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aWssUk/6kJwWtFLU9UAlgqdEYYzTZfaqM083iPKdojGMLd2Tux0XHazJqGzL4eGXFQOIVWtTURDagP+ojdZu/490s1Xsh0HV1OI0y7ac3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_085705_755804_89BB084D 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
