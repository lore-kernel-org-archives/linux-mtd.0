Return-Path: <SRS0=4ZlO=BH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96C5C433E4
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:55:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E212065C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jul 2020 12:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhVPcgj/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cjRGbSnW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="SUZQTNu9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E212065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=NMHM0oJOQB4VZmPlvBrmCK3NUGXybD/RMc6APb5Y83U=; b=hhVPcgj/HbWvYJiTN8oHUw+Rz
	4tK7j5UoKuJ8OoPvKw/xfRW/HP8QlSOJm3GuGo45jSSutdsFgeo3ghRRugklQcXAv5etgqZxkRZuo
	AiHbb/s6TJBJbHLc18rapgWbfyr33TZFYKPgOTQAhEZG3Phu69DFHiaHeuDTFD0pA0s3y+GK+rz29
	GM7Q6R6YWbMkgbYXwqe19knG17ePscvil2T/iavDkKpRe0rqNsEe3Z3piBLDlaJTYHEVXMnfuxbB9
	dRssQGSHTgGX/ZaanwXXsO3WZ4nvE/gVifYsVGzCPk4aNJcelqlV0lhTRBGNWTg84zENqeaNP5O84
	nXPxI0/lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0P83-00020k-AG; Tue, 28 Jul 2020 12:54:47 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0P80-00020F-26
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2020 12:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595940884; x=1627476884;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=cjRGbSnWOYA3hYv8q+va9eZ/w64UJukooqNQ1EMnCeAFNi7MA4J95QFu
 1DDjFBCpt7CI3+PtvU+x2qsC93xiZjphOwYl+zm6BXOSkNELg4H34NxfF
 JAIIEHfFo7Sz8GA3JwHQdddcdfr8ZAjK8HYxex0EkiY1RvWUxS8+QSjJY
 VjZbxZ0/3wOmP5VPW7xNvDqwiiLKFHS+uJizy+d1tIcp6+wsapNaPeX9H
 BmlvF4Hwv/P0cJK+bi95p3Ku7Z1GxBEw6tmXNf9poLaReq/jU0RITO8rK
 rwP4CdBwmaBJGLsP0Uvpzzvx3TZFfeMfpTtLJZVDOKMB51exPW7c01Q0g g==;
IronPort-SDR: ZFjmBZNE+HTETK1BTJfuK9E5kELLB9K3qIMYsBmSaucJluK0rxKtkojYstYRoSkpXY8WiWG2la
 UvfEp5GNLboONN/wSoycnzeVcxZAR/ltMpaTLLPKCOrVnkIYZnIXWxIfSMas5iuiNNgYFLhDZA
 CwDx/fbvhBYYrzKqoSu/hhLb2BD3Wbo92HO0KFQ8Sbg5vnMFw47qj01umN0suxSQPnmKd0sd0Z
 arNbRsQp5TKIPPsGHsJXu5OdKVFUy3b7ZGoOnNsHDCDQBw12Hm+bi25DMM5xhrgNxfmSCW5oDy
 800=
X-IronPort-AV: E=Sophos;i="5.75,406,1589212800"; d="scan'208";a="252888668"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2020 20:54:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftw5FfjvDA6RiLM5wmPGnArTun/1FxPjUlh9FghplwcHO+jRMognSMRrNWdr9knODMPvkQVU8p2DqfuI9klJu/n5r3uXDKHW/303DwAoqWh5SA39QER+mtiMwHYcHkUvbLeA9oJ1iTRzxJLsWbrLUhiJOJaraV1r3QYrA/PfKYHss8zJNiWFgKdLC+/9vDKytTUiu89F9aUYNzC1GIblWE/Pl54y1Z0/ciF1y9QItuer/yLyAsrID3NvkM4HbcM6SQz2b7AJl11O5zA0owIhTszd+8SuleY8J6Bl11JOYrLpL0K8J9OMOZeQaQp0qyVzV5m0KEsHwm70O/VzIYyfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=WDqmh3qry9I9w5Sd/aI1KG3uEBzlX0uGy3lic/bjV81TZWaU5dy28v1YA5Mgd5kSF1Cw5k3KsmBR9EV4Np6kr6U/QhdGFm+qOJYSEQWNvFiJcMcqsU160UDsPoXl0HUPl8C2nPhUa3C2tZVzERthzGHgpHs76gGufPFSh4Y5X+w8p04eQ6hBl6jfmOJDCz0ASEgIxYG9pBh1Up3CmFsK5w66nwcXMQeAUWya9nx15yrYF5mnQw1vmZa8IHMQfmGzvZlDlXv9e9jTo4ct11M8yKBAMtUmuJW8nrJOichf4IAz8DwdyuAtSPY0DPH2QhfJFLXnVl9iB/bdB3yvO12VhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i73cQScyOXtQNhKCgBM0j0yco6YrKjuowVHgFUDbKic=;
 b=SUZQTNu9cUdP+Vnavdl52Et44KxjvwANxWJVvXmxxtSYAdo/8v+KLFKJA60/7IVtPeOv7evuYz5BLO3U6ZPU3NvN731SIjA71VcbqQ67J8QDluqaLAWkcJ+b4tr8kPYzFeP2oj0w5q1ueU5LqDVFdQn2V3jE/SrxRHMBsf/fWOs=
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com (2603:10b6:4:7e::15)
 by DM6PR04MB5322.namprd04.prod.outlook.com (2603:10b6:5:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Tue, 28 Jul
 2020 12:54:40 +0000
Received: from DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573]) by DM5PR0401MB3591.namprd04.prod.outlook.com
 ([fe80::c862:9cd5:689a:8573%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 12:54:40 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/14] bdi: replace BDI_CAP_STABLE_WRITES with a queue and
 a sb flag
Thread-Topic: [PATCH 12/14] bdi: replace BDI_CAP_STABLE_WRITES with a queue
 and a sb flag
Thread-Index: AQHWYYzciyAO2mhny0WEWIk3W3JOpQ==
Date: Tue, 28 Jul 2020 12:54:40 +0000
Message-ID: <DM5PR0401MB35918B36977C0B2EBB7F262F9B730@DM5PR0401MB3591.namprd04.prod.outlook.com>
References: <20200724073313.138789-1-hch@lst.de>
 <20200724073313.138789-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31e0b3d0-c47a-48ca-363a-08d832f56489
x-ms-traffictypediagnostic: DM6PR04MB5322:
x-microsoft-antispam-prvs: <DM6PR04MB53220BC8FC684C251C6EBF5A9B730@DM6PR04MB5322.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T/yPeA8qh/rQgzQmjI8BQDmycI+yvDKNgThgiXWHNjjuusLVniiHii7Xs5llqxBhzac32Ut9f0viphdg31/ZsThTIyPqI5410dgXg03CTDavZ56Jb4tZ/soLeUBLtny8yY6GWx3630tBjArX6WgZH+9SOYv8vZZKWgNEMttX9pXEV1XFj1df7m6yFLJBLVAWYBbGjrY5v3iVtenDV0MR7r/L5Bo87zjS5MLbGJLN2jhgQkZKo1VeWXVkQ9UhJkWM9YiAN/iuhoRDeNDNE/shz2Yq3xZHNfYcF0TCV+47fUxZsNU2+XFquWXJoxb2hnWs32mbyGM2TgpG1XyMVZwpzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR0401MB3591.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(5660300002)(8676002)(66556008)(66476007)(66946007)(66446008)(19618925003)(9686003)(7696005)(186003)(26005)(64756008)(86362001)(478600001)(55016002)(6506007)(8936002)(52536014)(7416002)(71200400001)(110136005)(558084003)(4270600006)(33656002)(4326008)(76116006)(91956017)(316002)(2906002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 89maTvJPspOuacsDUS3LL+WKq2F7jyIjTk8KzJ2Po3vc17ENqkU1PZWitO7B5q9juIQetGeGZKXbM8bzrWPVhbbgWcjUHUOMknY6kXKP8GAbTbvVnsoY9eEp1N1W1OlIagv1h2hmqg4dghSfyuAlTOE7crGQ/Amikns3b2F3ob4sz2TN9Q/1VhtI/mo5mZv6qed+N0X0woUA9O3jRMoD8m3+EOD5x+6HhhRe2NfxczaPaf4lkVMgQ9n9ynt4h4yXiKVZEwuZtFol8C3hQEuPcYaE4O6DaoDwsUhF9OtW2pC9zUwA5Srerm/9ahGHmCz3xGCnMIj9gV4X5PJppHXN6Cd2w8bblTWF5YfLAwMHQ0nQEtFoOZnVXH4kFmbrYiCYxiGzlRlM8MQif1zxN8vg9wlaeYVVabFiGMIdoW1Lvdsvo+t5eysmJMIBtaSpZgMBtfy8/CqBQpGTFGh5zr2+ZJ/WDZprkP9gqOi3+E2Kr33BTDWPGVwrvXfIsFGqgNUL
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0401MB3591.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31e0b3d0-c47a-48ca-363a-08d832f56489
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 12:54:40.7335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBI2uUsV/Gk1eL8gdBglcrLdbO2lk0xAj739ocxmoqy8Nk+RjXyhOxkQVQKoyZDOUS5VeCs6KZsHMf6P74GQXM7paCXcP6VgrWIwoAnDBoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_085444_323086_2108CE5F 
X-CRM114-Status: GOOD (  10.32  )
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

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
