Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F29DC2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9547246D1
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 08:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtD869i+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qJHqSFgr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="jNc+dVQ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9547246D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=dtD869i+B7rsLoKvlTROys3u2
	+iBhxS+n5CSpBYIe+vSNgZ+CD6OUXClfaALugrXXpOSKyQVgtAeQrAFWIFtjxrQaE8DmbUv5w0qsd
	DixWqQiwuVfDC++w9SP/kKfI61hkcX6efC4nDivnt1WrSoXN0G/24xczpbtreOLBFwcBqwhTh/Lk8
	7VwwGTlZR1AqvJqR8q0ndyniG99HxumCIaRlvIumrUOn6w4DO76Hapa+0minBfIB4dD54wMV1JA4x
	6HJzm0Zmsgxohw4v0t1Ks4H7PQVu6sOb2ckdg0IAe6W649ZnzEClZnf03Yc49BFwbFWDjh/4NjCAd
	psvE/bHlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kffRl-0007yK-QA; Thu, 19 Nov 2020 08:37:42 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kffRj-0007xe-2Y
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 08:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605775059; x=1637311059;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=qJHqSFgrWOAVoePii4sh/14KxdT6irr9BCDF+Ql9YylxptHw758npzh3
 VNgvMBT4LH7inbZppzl/JvRtSlbRSokdXcrLucXlHnn4qEVQZ/m7D7Gkv
 8q7HxGFksSYpAkLPjMBxZ6f2F7SafMjWA77UQzJN6QCjhPZwTaIw+V0SO
 AI3l3/nh9ohJnPThNMIhLOL784O4tdiN4/oz2K4jFha3hEQXj9RQwjslU
 DfGfHWmBIdjlJc+s6cCwCT/rtXzuf7LckHTyd631MJQv2YCvIvpTdO82c
 Quf/1CwaoKjqXJcRE76mLJbqvY3M1HQ4ncRSXN4PtwNWGg4m7X7sO7Vzy A==;
IronPort-SDR: StdrIOMCYswRZg6jQ2lIawKj4Nb51SsYNOaUKn3yYM4pK8EmKRcYoe4YYh+hOReAxYVxjRQyD3
 zH2YHQ41lsKGs3R6Pqb88ZMyny80vimXpqMFaLq5SJmhDbcY87lJAH4mrboq+PWUYwxx7BSO0V
 r0JP/AZbiuYHtrWwMGTI+UsH0S0WOEYOXo7X22T6amLT/QB4izs34Moyfjiu5zCH5Xtak5PlhB
 FV08lz9n2XXzhhsm8NChZ1aoZy8V3KVHcty6N/Trw8XN0R4n6oHmb2sOfrkVfuOXMyc5CHWYRA
 GeA=
X-IronPort-AV: E=Sophos;i="5.77,490,1596470400"; d="scan'208";a="157444416"
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 16:37:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSUdLulXwC1rvWOimL1A7kY1LTHxVN7ZcGJiCwNlWczsNYGL+0u2rHK44wIUCHgxWkiccBMuheKFbRGYyUOktxuX6su76dOBAycwgXoDAX/gQ6geibQ2rr3TS74yCrqKCBKH3mGbrkMe5KjJdr81bPrlO3qHi5Kel50Q40QMoQu25Hw5NmbYz74xtre+sT/xhakQztZK80kG0Kux6ZupKFkRn5k/5G9c3mSihNYj2B9I5q2hEbM/2DPdBQtW0mZwCsXUKmVKHRLqSUGPH9O6GcVfKH+wrc1cTJwHCKqYwgCfe8/pkJyqWQt1vKMgbp45Z3yFwXaCHwato8Xm5AfcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=F8wCY2Fpo50vnXWVzgyJZI5BgL6jPy5P148VhGErow4Y0vBR4GFRt9ZvrHuAsVOlfqhEAYEUoxDxq0iGcWIF6oYVJGJ/NShS32KODDWobErX6Oj3R0hbXGReJqpPCmT2UsAflN2YtLmLZeucflicgToN2EOXgW633PsIHZ9Nr6lyq6uGZ36Nx1azFD9O8db5IRWEDY4uUC/B6DEWxTn7mCzptvkRwJ5oXpec6kJ2z9uDHxPm9eO5eG0ZVn8DJwEmCOkYyaiEOzFlkO8g1wLxFkrg3Lmht8/CluGc16iTN6g3yVdROCVVzkFiO7sWlCxzV0in847V8WvLTy5KDZjxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=jNc+dVQ7zDr8sGJ/6uqB0+7jh2yCdDXaulxVl+OyY8Valg02KDw9Ke6CW359CyIhDruFYHXYxNuKGJP3QX1m8jhLrInWG9zaEf4qRI867HbxiU3RvccV2R7RZEUhJBQwd2E+CXa4zGTmfu6db4M4D1mRpu67j6twXyfQP9sWs5o=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN6PR04MB4862.namprd04.prod.outlook.com
 (2603:10b6:805:90::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 08:37:34 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 08:37:34 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 02/20] block: remove a duplicate __disk_get_part prototype
Thread-Topic: [PATCH 02/20] block: remove a duplicate __disk_get_part prototype
Thread-Index: AQHWvYfztpq6w/pFC02UtIWdUqy7dw==
Date: Thu, 19 Nov 2020 08:37:34 +0000
Message-ID: <SN4PR0401MB3598F94B66D20E767C5AD4C29BE00@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:157d:bf01:851e:5636:4e29:3e2e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98cdfb1a-7b94-4350-579a-08d88c665d0b
x-ms-traffictypediagnostic: SN6PR04MB4862:
x-microsoft-antispam-prvs: <SN6PR04MB48628F2FA5D18715BA01A5D79BE00@SN6PR04MB4862.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9EU6zsu5wfqN3LzwpruHOA3vp8P7XrQotEGqEig19wHTBrjlE1ohLK+ynonRdF1W+UL5wUOVT7vKCtAIQt1dSmxkpZy4DwcLO44FjnTrjbNXSNUI9Mq5wH4rrR8XdBKih9KoY4v1it7GZ4WesFQhZZ5dBKUzP5pmgwnmt0WtD5bIKtK5htwauYpXl8TH4sg6j0HepHhcs7hep71FbRp4+8+nbJpt7IIBzHakBKpMSVoqQ8BhUxMKvxr4VZlyjthyXgTgH9RQ9rYR0A5fg+h6P3vM04AI1LUtG8AD6oJeYvLkuNL9IfWg1mZIXI71jhfByHqksAhEDVkCYrfz51ndNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(8936002)(71200400001)(19618925003)(4326008)(33656002)(7416002)(9686003)(55016002)(66946007)(76116006)(478600001)(66476007)(66446008)(64756008)(86362001)(54906003)(66556008)(91956017)(52536014)(558084003)(2906002)(186003)(8676002)(4270600006)(7696005)(316002)(6506007)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: csjjfoFZMdOUtjbQ7Aps9atodfrldZAbocrPpoPa9WuJ6wwSi7DnrL0jTbsl05umbEp5VVC+Yq+5KPyuvTo73nFFa0glxCUD3NqLFMLFCRmAqwzZ6jfwtuTOm1PGA+XNbnO2OBj5W8MgTuXPoSWugEuyBfyseXeerfvuPkcSGFyKN9wp3mddZY7FbFTQEBHdMb0j+HS7xJzjSmA7NBmmQwz5xyTPiYeoH2ga3rmicKdGPs+RkI0tc0bPk1q75G0FK3zd845mg1pA9gJoNCLF7sggrc7oZRshwwBzwahklVTj7UJRr8HiThJRCYgTVJwe9HSVhbVLjCB8fMTf1tFS01qJwvO7QRf5aiCsoSWY4BczKY+KevZvPRJeWcZKXZgWVP1fKakfbsuLMw0G7xu9h1+eOoypobiMkCp4KcJx4HXDIgJErir4uclycSdDgiCfNT58C8WSyGX/pqfKrXhFHSMjbg1zhQFlwLwmq+x4IVXunCLV+I/9vd/d1Xm1mZySuKEKxJX0X5kaxoc5ikUAsNXYZ2Qol7RsOAPY1XB2juhmbsYkVoEPCFliPFtr/McdEff0Y3lH9nbRLV2Fvx8F2elFq3wxIwNwKYRtzIEwafd8M5cLZt0SpoQl2w+Lc99wWYWrIchHiWf8tjaK1z0uxisWXgD48i7rr+9UZP7j5qsbKCrq/rkzjE9rrzRkXhzm8jX/DLvmDT+skKSPQRxSig==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cdfb1a-7b94-4350-579a-08d88c665d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 08:37:34.7562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNE1HeeUNLBOJT8P2aBEjcGVvGD9E2iGPxFIV8+WaWcaSCFxON7IDGhjH0CQvhEpzGLK8RUwPduSaG/uVJ3gocebzXpV1camyawT1yPVJOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_033739_317008_963CB49B 
X-CRM114-Status: GOOD (  11.59  )
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
