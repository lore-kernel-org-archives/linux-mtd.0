Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34481C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:39:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF962221E8
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHKD8MY6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n0HghYyV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oYZwAJYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF962221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ktCDmfX42wGCyLy6IHr2qRTF/Csa2pbU/vDsdnrXa1g=; b=UHKD8MY60VB6ns5ytmKc55N20
	7+y5jYBemLZIatWUuNQaWBtBtLEtCCYMPYB3/vPVWL6mIfn31QbVAog5hHMSC9x1/cdQzOz2Kmd19
	IjhlxfXtlbR5Di8RN58R79xYBa7O0zxADhdYdlhncuxJfwf4yMmp4oJEpQwdg2YKfuoNqjRvgFdrA
	kDaiVD3tzQ6VMG0Y39I20tEoGjJ9jw1bdaRKvNdBQU4g5oVVx7mA3VPTIpNmFLdJ3nOsj+tElIq+Y
	mtQy2DBZLglcGkokfEawA79o936KW3sW1BwMy09/sam5yqW2lLKDn53dnXz05UK5KZZrQvUH82EHc
	uo9WQf/ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDyH-0003Cr-8Z; Tue, 29 Sep 2020 11:39:01 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDyE-0003BO-OY
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 11:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601379538; x=1632915538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oN/iwRnumSz+ayb71eLOzqGXykKwOUHXWW7exat2grQ=;
 b=n0HghYyVfcU9OXNM41hVdMoIlZEolQETBEQMrFbG15B6bvAiOLja4hJ4
 H8nWt3APz7MhuwUI6Zocj2XVeNJK49FdSPa965+nhneSnmPI32v3dqmiD
 jpcMvMRPBBq7PskEDvsYCVAg5oOJeYIoMaU474Fn53A8G+Ve/2kjEDKSs
 Jkq38MbkuTHO0GmuEnLYCaJVBictBGiexLCPIseH71uLv1v8nw6Gyz169
 XG9W+eJYMCNee2AKxq7MvU4BOhFSLirm6C4YrgfR6NBx9PzKmVfj61hf6
 H4Cag+Lkdv49/Vv6Ap60PZJquOiK9g4qPJcuQNqTxfRngRWMN7gCl79Ss Q==;
IronPort-SDR: eoyVZWidkwCEfvtnnGiaeZieu7Bt/MKP5skyh2UFlq0omzYDWFCzvOuqRfakaMkXmRgKlRz1ZJ
 A8ewlMkL4385Ks1V6/7tXePqvKXrdD42J88oomYnJIgYtVuB8o+hZLMZyvBdctFz+a1EZnrDUl
 qMxC6ARVjjq0p5+bJgRoXWyhaoMQlzQyhO7/EFj4IfJSQZ4vC+4FdFyi/GntLbTvC6ECbIgjrL
 qhOoRDWp4DWKOLp20F+JJL2Pinef4+NR1dWPXr6H0947a4qaM0VnQtDu6IhrZy1PjSPQQtH8mg
 vhk=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="28038439"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 04:38:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 04:38:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 29 Sep 2020 04:38:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OV3FYYnpAlVfHRVgbWRiiZS5AZbWrxqSGkl2xRCfriTG0r6VyK2rayd8WVtgMZh0u32xVvtADlIfoXpbeTl6DXkw69+yVzqddZrBbQDdFjM0spGg6ZrAsXoa/+MVNzgjGyF5QgDODOum41Q0iHusC0GPkZw8/nORm64GvHsJ1eoc0YRhtbqg8gCq0QcMrw1teVHltb9ul1/03jRSSDkTLh18VGvZzpJCdL1hLpR2iaOQfGkeFvs+1PC3u73yhO91T6tTRKbuZI2ang01LMT3oJcjz0URMw7fxF3sXVOuB28gAYkIkSXfASUMkmVVTB99sBFzhY1O1pCDGXtkXeALZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN/iwRnumSz+ayb71eLOzqGXykKwOUHXWW7exat2grQ=;
 b=NvRHnbPO+FYnR7SS9pX31TGS25bLnrZD6S0yzRh98NyC4Cn+tMyTX97a9Z3qE23L1q1hJckjyJQe8py+GZs5hycuxWdjB5P61sOhSTJXrDoE6WpsxMc/nA22Bk56Vn6HnHF9Xr1Q9YW2CdGFh3KjXbR++Wdcmii+2zFGXMgs4AKmdyAPPj3xhU2TKqcdsjgERJdtfj4DIo7rcfs4LrE0NzoWWZU+AcSR6EMoZpGOqm+yPHPQ2b/VDZ9LYnrM7pWBZY611a0N0rL0huMdlaqE8P6aR8d+NJRTrNKqP491W5UTkbwF3/kQl3amn+QqhfPs47bj2xuOd2/SRNhpqG93Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN/iwRnumSz+ayb71eLOzqGXykKwOUHXWW7exat2grQ=;
 b=oYZwAJYEwWPSgkKoq9avH/IHyv/nAn5+wfzChzktc0z6oeTa6Kp7T2OSU/XqA/g7RBRv8snCKT6fJSMtGP6JPgrvUE4tbK7RNywn+vFxxYoV4YGHDxQm5t/ZZLQYMvpciewh3Lp+5oIMDg4Fq/3ct8yHE34kGgdUSPk0H6RvD5A=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB3084.namprd11.prod.outlook.com (2603:10b6:5:6c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 11:38:55 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 11:38:55 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 02/15] mtd: spi-nor: core: add
 spi_nor_{read,write}_reg() helpers
Thread-Topic: [PATCH v13 02/15] mtd: spi-nor: core: add
 spi_nor_{read,write}_reg() helpers
Thread-Index: AQHWllUbpbr2eCvR/k2DO2tfqwxa1Q==
Date: Tue, 29 Sep 2020 11:38:55 +0000
Message-ID: <8632e742-9526-fd80-8980-2792075f194c@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-3-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-3-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [82.77.80.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1ce23b7-682c-41a7-50e9-08d8646c3f4f
x-ms-traffictypediagnostic: DM6PR11MB3084:
x-microsoft-antispam-prvs: <DM6PR11MB30844032374C081004EACA37F0320@DM6PR11MB3084.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NXx2eHg/u/Tp7lzKDnWBtXswzb8ywfBneq9oREvuJJigsEn0WfEiAMEDXvPT28tHYLEJenes3J0eWUlL021vTzf5+kthOIKPWxF43EKnsZBGE44gKEgiKhC0uawdFkYROB7qelUTRtjQ8Gl+Ipw6fnBT/33MsbrjZexnMGa7uAgmYBv7d9EuWe51+zkuf41gl89EIIqLZJGSoYh2bXGoY0A3lE6ENqkAl5uYrKF50J00Sk4RAUFj0gjSSuWJfc8jNUPTcVncAK89iXPZovMZiHRseMa8eV+e7qoNzVLStzf1AuSLUQ+9WagwaZrfY4e7nyFUGR0uwR/d8RVuzpC6p2uzNdClFktwGK6cc2awj6ST0/d8CTvCtYe9DMOI6QkW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(2616005)(54906003)(110136005)(31686004)(36756003)(6512007)(86362001)(31696002)(8676002)(53546011)(6506007)(4326008)(26005)(6486002)(186003)(8936002)(5660300002)(498600001)(4744005)(71200400001)(66946007)(64756008)(66446008)(66556008)(66476007)(91956017)(76116006)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6bNLdBAkNJnROPfsk2n9VdMq2JWho+S0Rqj95hpOBYkCM6IiIKxqkRLPqSgks0jWx6EuQYfwk7yCNoVBELx26fim+Z843FETTzc36QlfGSgM5N64HtUh64QbZf0Ho49wCmchvXuPMzOoiITtvCdqWXsR2qMljoB4m1k/ugWJLQ8PkIpuF9o2Ls0mPKw6+SFSCcmUGwEQTLymxSOi1696C6xzYGP606lUSiIJp+U46HLUq052nGgCkanPSuvWfAl2S+zk5vQJTCgC1EgNOu5gK8+WYsnapQw4qJXl+2HgR4XVCNFbETaQsrNAU6/N2fA82E4ppu2vFh89KdQmailyu7y2m3MghXfx8XfJk565ghOpjcWpI5Fqiu3VUMhcvgeQniDZH+Jp7sTJCyO5fvh6uKOB0ydAZ6rcCRJD53h4yYSUcYgBIfP1Wx84SmjERWfcZB8MXm4Oc7l9DKAypax1/vW41YQn6v4579SRlF9dqJn8Sxd7yOKlGtIwlWKiT+mVlE8ndquZwYRG8mWNeRa8bp5Dq0a+G2N598ob+kvJ9Z2DrzxkxwDK/vYxeiVT6u8PPX3KEFkHcYJX4NM+ksn6j1XzFEgC2zDSJng3s3ByoxXkI+09dB/hwn5OQHhBilL6na00lJd6OXBwfxw4gcEqIg==
x-ms-exchange-transport-forked: True
Content-ID: <C8DD376693DDBF41B62859DF1FF59565@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ce23b7-682c-41a7-50e9-08d8646c3f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 11:38:55.3433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSq/gSOe1NwRWl53N1LFFGYEGzaBBaCAdiotSblgZuTGXsoJ+TnQHlVyL1OdSpw9FsdETUidY7l0bpS9RcMGwGj00FdcHl5vZ5+uJ7jicQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_073858_971663_F23C7210 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> They are thin wrappers around nor->controller_ops->{read,write}_reg().
> In a future commit DTR support will be added. These ops can not be
> supported by the {read,write}_reg() hooks and these helpers will make it
> easier to reject those calls.

2/15 and 3/15 are introducing wrappers for the controller ops. How about
squashing the commits and using the same naming scheme?

spi_nor_controller_ops_{read_reg,write_reg,erase}
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
