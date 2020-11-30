Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DACC5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 09:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F18520825
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 09:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyNW4mV1";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="pzRwbX1G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="qfO3nsDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F18520825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=SnfU235bhmxTrNGMEOUeAjki3M6AFMdW5K9ZmrO8dyU=; b=XyNW4mV1cS4wKx55DfgbSh499
	iqvrUtYVswi/L/arZfRMgwSGYWyAQSbKNZ3Cyz0KgfHSV5t/zyAi21XN7dSfHP5vbvDepNooWBXkX
	g+0CcF/uTIoEH2sFWxlWlZQmVhjakL2Ai6xuO0HrpazzD9zg4Z5PNigkjodYb4GqyDAo/gchC37+7
	hG11ooF/LOrOlyxqwEv2VaUvphS4Mbna3tuYpPjpzdrPhHs+UTAz8CRaBND6CLrKzBhkq2Yjh215E
	L8VvwalravT7L46s4goEu/4PcFRd2At9baH7Qv+hngFHIEmN9i2BjkpZGDIYwHNnq/E2v1Tof++dp
	2VwztT5Lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjfM4-0006td-QB; Mon, 30 Nov 2020 09:20:20 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjfM0-0006sQ-On
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 09:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606728534; x=1638264534;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=pzRwbX1GqSpnXkTCsD3zCgdsKiq+LUhWSEfJHgg54OuRJ/gs8Vdj1aL/
 HIeU6m5xDe4x3CB6r4BuWClKOggQzJnPxp11PkzkLKqlUY+lDERMZa062
 OdYcMnngWTsmHyr+RbZeTIeqR8bpI4LfNPRlsQT82rmfV+tODRJ8G/+3I
 kaWszABefnXvm/B6ttCVCdRbavh6EHVy2l6zi62uCd+JB2qYOqjxElLei
 ZUU29wErl9WAe6GTuuHvSec8HxJ4MvcYP9VqWhmfWwH+JWtFRVPwd3CHa
 DHo/G3yoQWdwVYS6kDww7sN/2cWiUYPDezrDwi1eBsrbZ24xLa2BlpE2v g==;
IronPort-SDR: 30dmv2GVw9omZk5nScyBE94RWc12Y6/AOrt36CDVDgm3EJZT3g5dfep61PdsUYnfs+gLNwEczG
 lZorKKiN2ARJKbt8FOICeEW4tn+CN47ZNOJCiOAGrc9VH8axE3v1ryfp+3IE0lJZtNUQcUD8pA
 8TaIDArIFcdAJa4H3rY/29b+Bsn06eTF9SG/Xptw+RIaILqN7SK8SCauWcTf5lwVZElD7fYMAZ
 NNNU95ZQaFrs1UR+v9D7A6SZAdY4p871MkXTf68cL0+XrFp1Ah/liuArU3T21ErM8j68Rly6Hr
 FDQ=
X-IronPort-AV: E=Sophos;i="5.78,381,1599494400"; d="scan'208";a="257475519"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2020 17:28:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTy/hm8ZzXAbTjHsaUUf1kveXVEoCEnu4JqYgUFlC9dUECoRHxJZYORF4dTkQl4BgvNJDa5frf6dwP54LEKHgBElHtATYAMXpszMvj1pj3XLP3RmebUkpUR70aNn1VB8x4DF59qjNcnJ1uMyKr371OK+ZeMKqMFHevad0VVvtiid2UfdVBRVezpARCIw+vrIwevT3/ZnkLKksAxAJJZDEgS9lbTWGLzj+R+cehpC/03yxbhD4jv7ORpbt/Kv9C1GK4BoTZn6nYC1IzS7BKx9jNX1CT96zuNMSlWsjkErICksU0QIdUVQCPhBjq0OiiqQHOB418zqkcPnXlUdFoSGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=eSr/Pvsx9LHiOD1n+pemv2le4de+LHnVxxISa62B3bMCXGVqXysu9IH/FB69Yh1gQpFbIcxsD3Wm+vuI6SlWwr+XKDfMEFZ2BHQocgY5bpKO9zRvrSxvOGLp+iIFPqZU2O+pYX8spwsk/W0RXDLexyXXS/i6ieByqcEoxyKhDz35hMfexqdKkspYyoB/oO/RojjzrTi3GpVmMwymACAziOWQJNU36w2RM3+qHp1Ka6HEXQ9bVe7O4Hcx/oIZ+Dkkdx9FUvoOG+6gTarPz91nV5e5wgtaW8+RhFK+xD5HdJsixZLWoE6IcIQKpzSO1zIf1lC6aiNXu02imV382xOTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
 b=qfO3nsDKJKylRVnAT2PR4NgkeqKc0W0IspjFphHHVISuWba9hW+zfxczg3iYeIetGBM0tJPxhzaZwNk1TCAEVgarXsSSrsNNgckmqCW+pfJDmGJl5Ympl4QAKBZvjO2qUvshTr0XqsJAFkzr5IYqzwTk6w6N7+tnRy8102qwilk=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SA2PR04MB7594.namprd04.prod.outlook.com
 (2603:10b6:806:136::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 09:20:08 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::65d7:592a:32d4:9f98%7]) with mapi id 15.20.3589.030; Mon, 30 Nov 2020
 09:20:07 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 11/45] block: remove a superflous check in blkpg_do_ioctl
Thread-Topic: [PATCH 11/45] block: remove a superflous check in blkpg_do_ioctl
Thread-Index: AQHWxaG2R4tyW2DDf0eoMvMUHA4YTw==
Date: Mon, 30 Nov 2020 09:20:07 +0000
Message-ID: <SN4PR0401MB359840636BA2F57A26F159E79BF50@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:155d:1001:2c26:fc00:7c60:29b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d631229-9cb0-48a3-34ed-08d89511215e
x-ms-traffictypediagnostic: SA2PR04MB7594:
x-microsoft-antispam-prvs: <SA2PR04MB75949460375CD1052865D6069BF50@SA2PR04MB7594.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GzeUkmGPfSYvr0GQ/DW1fyEW3zzaETC4h/ntDEp/lAVe8ZTTwR5Vo5fZedO/796kdj175Fgka8vPLc7d/sHvZ9AS9Ob0tv6kLCys1rnboFxltaVN1eg3VrFMt64ciQFvmwfZ9KLb3GcF7beMzIo7M5augKw4GMoWf6yRRRkY/Xmvw8Pufis1JbFTulz6+dMbXgt8sRRXN23U4IAh/a27pf3kOobxhN887eD0sYr48y1XgYlBJKVUzsNWDrb820DTJpLTXxRuspFcApQoSeFT13e6CWgiOPuo+b/fQ2egNDJsgIO/iT4lPmjnfxc5GHWtyyVvIMFRnIDau0sqTa4y9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(5660300002)(6506007)(478600001)(186003)(4270600006)(558084003)(55016002)(66946007)(66446008)(91956017)(8936002)(9686003)(4326008)(2906002)(64756008)(76116006)(33656002)(19618925003)(71200400001)(52536014)(316002)(110136005)(66476007)(66556008)(86362001)(7696005)(8676002)(7416002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sBwgiRi8HFz91hVZPsEH4xofEUZ84B2oNLt24n94w5o7lK6S7/E8mNiOHVKE?=
 =?us-ascii?Q?W6sW3acQp2VPp7BmZ9a9S2AmMj4vCKjBOF39ms6IvnQb6ecCCfMRN5xIOL6z?=
 =?us-ascii?Q?al76fcfciTE56Db49P2aoVzSWV/Kj9fT7XbVQrebaiRxR0HtvwY301QPxV2b?=
 =?us-ascii?Q?2PuWaxrKG0sY5ZsL/iC8lVta+Mp6RaRFYjnDJ4lHo2l1RcHv8GhUKPLANbrv?=
 =?us-ascii?Q?frSL2A6R0wzzTR5Krwlv6sx2mkaMua4sQNGGfa/KH2V8mEBrd6mX3FrDJxOn?=
 =?us-ascii?Q?36iT9cuPvoyXpMzhsh4pZaXyhiTDd1FaE3VRHhqcDEdYrN+vzXi0Z9kbykT/?=
 =?us-ascii?Q?t+ZdOmKouYfeC2h0bHwydsm1DTWImrk5/SiclJrEx523Dgct/NnKmP57G6fe?=
 =?us-ascii?Q?FR2OvbheXDMTmrALZF2UWN7ll8MlAzTjSecSR0HcSLVcFEb4Qjj9K+/6c8bp?=
 =?us-ascii?Q?EuwKMGcqJV7WptUbqPz+AHCszfUiOFoXZQvXWz47cQPhgAtJNQT5z3k79c5p?=
 =?us-ascii?Q?42vAnAqqwdmG/W07Oc4NGxeDDR5r9kkwaFUiUEGe01nXonqcySw+pKlDsMq8?=
 =?us-ascii?Q?s+p0sjEcBAtLyVe7VJA9UZspCiSyeh9HwcOAgX/OvmNFGGCHFoG5qEgup2UP?=
 =?us-ascii?Q?q6PFQbyRMJbJAG1oKXWSzD90C8quOYGk8qrRluL0N0rg8au6nul/O/+RPHF8?=
 =?us-ascii?Q?QYnX6HVk69lw+GD+e0r7J17Y9Xcumgisx3VJhJ0DopmXsne7lOq7afNU8BRi?=
 =?us-ascii?Q?7HfEaxNtMmMtu9mdQ2BvKwtpUMViIVXYWHVwcdIQTyluJ+WHaLiQshTJIXIU?=
 =?us-ascii?Q?US6ucXZw7VXbrzAT7iptzDMxI4n+tpowKAoFfOu8rbgMY6raDQB+GpD8lnfW?=
 =?us-ascii?Q?P0C2/oh6lwjcKBMuQcViN97RC77/xZfjCz5awsaDaBhbHCYMxav3P9E37Ed4?=
 =?us-ascii?Q?yyDvEFryRLsCmKq/zXyESXx0bS0duZF/x5+6QJF1I5E8OtypWbcuLtk7xWnh?=
 =?us-ascii?Q?yGrGm0lAozanuFx9X/uHJri9aKPbM2lPv4qQQV/IBJ+T3WUuPlcAgBZZIybS?=
 =?us-ascii?Q?y5QxRKaC?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d631229-9cb0-48a3-34ed-08d89511215e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 09:20:07.9070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCCId/TlCPrFtQtXgAAKu6GD7sV8O1Yxb7MHMs04oekt4TNyHsAgXL7kCnq5SEsna7hLI9cetZxvuL96hmRqCglMCCZFHXUZuI1b/8NNon4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_042017_121876_A0AE9B8D 
X-CRM114-Status: GOOD (  11.91  )
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
 Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hannes Reinecke <hare@suse.de>, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
