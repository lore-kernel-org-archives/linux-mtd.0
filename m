Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC582C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:29:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F00206A1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gd01OOYH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DWiE18Gc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="19ujNNzl";
	dkim=neutral (0-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nviFQcty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F00206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WgVTZ1aNYOErkUvVPvLUZDBhUaXFxckxLivAssY5NLc=; b=Gd01OOYHGjvkwfvrIc9wgrnxb
	6mt6334PZEbBcNMzKwiaRj5pjzwLnuvgIp8WKhmBC41/vydKJMkQADiIKLpoE8SCt05cF8yYQNW5B
	u/I9v165zDt8b8Bx3kiXhYov2Yk5oC7XAjjEmFeSy1//A/HutvdesjI2kOEjx6Y1iXha3NbzSyXfx
	8SlUIbJENOAd1IJPXCPhY94miZOVsiWYxhwZTQVuHKvKOqwlj+E56gxewo6H66UC6qRWXBvti8tec
	GZDIJRufEYaMD2WP0RUuP56ajEMDJfXhIR1KqZj05VmeMWgA0nDnTiilFXXqMCNguSIsHOcngf/XG
	VGd0syLbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomXB-0003RF-AK; Fri, 26 Jun 2020 11:28:41 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolFv-0000h7-DI
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description;
 bh=uQxSF6BD09cTa786RD+TS7uSnIbhxtpuvzTY5s1qV9k=; b=DWiE18GcJdoaCzC6OKtiIchjzP
 XmQEtoZBgaZ/X4G6FAzx9hHi26io4vNs2WDpAWPMT8WgK24vxaCwBFLrLxes2vZMwrw3YNDhH7fn7
 Xaf74mY2Osy+EtwiWyXlW0LU1sZsn7DaPrN+/FJPYrOrRz8sMGZobmvD47LQHOKyCLvo9ZSrcpIvj
 Ads1iAmrwynctAmXY5nWFo3yKt0IagnJI2OPp2mImEpj+u7JA9AnVE7yYmfqsgMBQyWHLxKDcZUKX
 DZh5hvziosomrXPaAfZ+rv9jj6uF65CpHb69xfbcwIqRr+Cdj7+7T8LRSHgFC/e7BHGqw9psaXlPQ
 S3kBK+Tw==;
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokdR-0001BM-5L
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 09:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593163620; x=1624699620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MS61EfMHV1bsobcMYtRKCzD0LOC8ydMVTTW4z682Xew=;
 b=19ujNNzlQMCuAb+ZOz1Dgb7TLdZkGj1LBF1cmFG4vGXTXeTRFFg/z0VE
 Gzu+SzcjuL4E2+zr5eH9ZDmHb2zMuI7eF2ATdGenRGDGiFp/RC8/ztdh1
 W1WZFbDEA1mRBI6SXOB7AP2ICV7RmfZ5qH6wUPMCHwKq4pKmowJ3JBd4n
 STj7N15Xqopd06M4c5lyRdS7JENW9dnQvm5SNi8+txj8eoJulewR5Cy7B
 WSQ8RYYK0aI/60suUIlawrhDGhy/I7zjzPMSu264oGhY2+Tpf1YYij/nG
 PGyqjKZqStZ2p3JkJFTTHN9E7JhMyTTww3V/+AYMAqHeUCFUZafUuxRJe g==;
IronPort-SDR: DYGYxiIfkwdDy2lZS4nkHDpS+YrnnFp8KkHh8U2S5WRRjAv1alQNu/LFE7Wx0cJweOLlAwHDJM
 Uio1eXvLsUK6Rh2AcEAerkHWjx8Uqg9FhBA4FfjZY2OoxSHqxmslZe7TDAqTWbxAazwyD6M3xo
 4ZECFfAFDfgnVVZY0qPEhmuY+aSOzjG8J7bAG+ffD+dSZjX3aLdxRA6Ik4yT+lSpGPi6lNhqD1
 axWXB4CtLNXvjKLj+JWcECHp0SWE67GyhDFxZUmpJJ+bTa3K071oXCAvBKiSX097JLhByj6nNJ
 vi8=
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="85195860"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2020 02:25:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 26 Jun 2020 02:25:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 26 Jun 2020 02:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/XzFY825YApFLSPHuIAIP9A0c7Na5GI58Vhs1b77nWuSWy5AVzFDpidB8/zKsNKMzvM5iG3Tw3l3IYyFkfqn0FJ5BQLoMfNU1e0kWCXQzh9LphmaJ+FZ/i7uATnbhGKOvqQK4IMG6oA5/k3NWrZRSAopiHX6/9ycJI2SKOJqDIbNLVsMUhyxmlKk05ZlqhFIT+ET6R7tP59TGu67ARurlU7O1PAa8fVlV4bCpA04Bnpafcs10N8K8QljqT9RT00m5oX688OkzZPF43XkPDZPhICBrtPuU23oPKdDHYSWCEmVeDK6w9sxOd2Cikzzmipta+dCP0vmW5lEosdeC+X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQxSF6BD09cTa786RD+TS7uSnIbhxtpuvzTY5s1qV9k=;
 b=kH4Plui2/fbqkEzh5AB/rL4eKfgt5/DNpVRbmXVX0ZIyA/peU/uY9ztddZNxwQ1M2rr0nW1qPco5Jg+2UHDfNiN8ZfLQFkpnX9QiFPwXcgsGdKIqtNg7QEK7VM1NAzBoN35tcd6eCCf5K8+Te0WW0bgHpo2KBaBckAKjuG/tpRaemz8AwRHoI1lqWsqtXruvIBFJqUPM78iu45fpK6RXcECNDvP0/Md8B4mWiypIdXivFU8tpBmCeDcM1uyFm8ce5nLaqCSOaUja2WrMNC+/xOYE2E6TOc2OOYlAhpGfNFzZs5o2afZkGnmKBoMhXxNObRfRmZynGkF3UhF9U+6qdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQxSF6BD09cTa786RD+TS7uSnIbhxtpuvzTY5s1qV9k=;
 b=nviFQctyrBB9nbG+nNT1yUsagxrKjom8sTr4zJnlsIsHqdBpPyfelG5ujCk+mYKaSzDL05Yu8zeE9y1iEtppOL/3SbDlKvDlCUHdSRyNpzx69Kwk9Tfra97Ug9LZX1lquICTVQ7z4qT6y+jM2q9hblUlFLe09Dn8Jx3b0IwA3co=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Fri, 26 Jun
 2020 09:25:51 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 09:25:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RESEND PATCH v3 0/8] mtd: spi-nor: Move cadence-qaudspi to
 spi-mem framework
Thread-Topic: [RESEND PATCH v3 0/8] mtd: spi-nor: Move cadence-qaudspi to
 spi-mem framework
Thread-Index: AQHWRi9bRsHSVVCOu0SkX6Y85WgKZw==
Date: Fri, 26 Jun 2020 09:25:51 +0000
Message-ID: <79c4bedc-f2fc-edcc-518c-eadd68ac1f2e@microchip.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200619105701.GD5396@sirena.org.uk>
 <0007c019-1ecf-1913-56a7-facffe345b1f@microchip.com>
 <20200619151746.GF5396@sirena.org.uk>
In-Reply-To: <20200619151746.GF5396@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bf7cb1-a23d-46f4-9b39-08d819b2eb68
x-ms-traffictypediagnostic: BYAPR11MB3750:
x-microsoft-antispam-prvs: <BYAPR11MB37502DBAD2BC90C40DCD1EB0F0930@BYAPR11MB3750.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: haAR0B3YlbiXQSmhyMoVVysr2RTr+Xtw/DiIvliUMwfaTbDgVdZJ9IoT1R7YCS0xpECfukF0m9xme3r193JUBREJUJUzgk1lADYcfHBt1jlOGPwajbYFC3TvaK/nvVBZVD1jlPdgG8nuBDxIcL1wmemdgwA5o3A1hFeyZ4iGO3CrESA5VprIwWn7BLi0WUmYJz3mxGbBCzDBw07t9/cV3BHHpJRoMhpuQlvO4/cC8RoU9maEaUu+YuZ0fzqXKf08mCxxqJQZ/OAD/VLL+uSBbzG9sYQjmwTEclqksg5PWD9JoNMvd50drhqfTfg0yPU4/p0bcHUIY1stn0SRajMTdu5lM5Lav7RT1EAyjfcigbTMxBRfrG427HJRP1mk9+8nfGJtDEoCpZB/FaktZweu0hquofoWzxNX4tuBfTxixfv9XCmNEeSPZ4ltkaj7ToYzpsvqyko5WuNCYpmUJI0mwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(346002)(376002)(366004)(396003)(6506007)(6512007)(2906002)(8676002)(36756003)(86362001)(478600001)(5660300002)(966005)(31696002)(7416002)(53546011)(8936002)(83380400001)(66446008)(76116006)(71200400001)(66946007)(91956017)(66556008)(26005)(64756008)(4326008)(316002)(66476007)(6916009)(54906003)(2616005)(31686004)(6486002)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: N+Uz1Ed+MWc41+QfEfluEcH/O1kaIpRwDOvGq0D4bFpl7A+aq6ZJblYLCPQzTLCvVga7eb313tQVUymiEl/YYgWpM5JgIAI0n0j7nixRiYyXkTRYzK6QYMZ8EvpC41p0StkRMivXtH7y1sWqq2Q3O8PPie8aEkUmHod7j2+PgVj8B9ezbVsPJjNXpn88j1MvyqmvwzbcdG+8Pl9DPJCmQ/gj6WCLnyFeDB3K5BrCmymA9eR4WYkoqCv5wgeGj6Pe3ygKrYpb3QW7UQwCn8aoc+nAtgK0Oj8sYecl8DZ5QmYdedzdmhxHblFJdKRN7DIeSZgqRdcKjyU4GaC2B7PywwdhM+SbScsjhWHdDjnSk+lIHyJAEuhHFz8whEipBHlUHSmGv3ldPuX2tiU0ehcZtZYhfk1WIiwbnbHrt1h9x4De0o3VU/fotRstD6u0YwvgCaYsdSTPF34Zwd6grfzYHVyOHtBjw8/kV+keTyc9g4M=
x-ms-exchange-transport-forked: True
Content-ID: <C596C975063B7F4C8C0667102A501995@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bf7cb1-a23d-46f4-9b39-08d819b2eb68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 09:25:51.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re5yIJwon3ljnKcAVvhnHKvbJiKl9zsziOBBdgyjswheBRYmXY03IoCUdM1FjkhflKVkPHLc4dy4VWDfJVHuvTMR3wzybS4haIPLTjEYCX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_102702_593698_D591AF8D 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: marex@denx.de, vigneshr@ti.com, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/19/20 6:17 PM, Mark Brown wrote:
>> Would you please provide an immutable tag on top of v5.8-rc1 so that I
>> can merge back in spi-nor/next?
> Here you go:
> 
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
> 
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/cadence-mtd-spi-move
> 
> for you to fetch changes up to 31fb632b5d43ca16713095b3a4fe17e3d7331e28:
> 
>   spi: Move cadence-quadspi driver to drivers/spi/ (2020-06-19 14:26:54 +0100)
> 
> ----------------------------------------------------------------
> mtd/spi: Move the cadence-quadspi driver to spi-mem
> 
> ----------------------------------------------------------------
> Ramuthevar Vadivel Murugan (2):
>       mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
>       spi: Move cadence-quadspi driver to drivers/spi/
> 
> Vignesh Raghavendra (6):
>       mtd: spi-nor: cadence-quadspi: Make driver independent of flash geometry
>       mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
>       mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on failure
>       mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire reset lines
>       mtd: spi-nor: cadence-quadspi: Handle probe deferral while requesting DMA channel
>       mtd: spi-nor: cadence-quadspi: Drop redundant WREN in erase path
> 
>  drivers/mtd/spi-nor/controllers/Kconfig            |  11 -
>  drivers/mtd/spi-nor/controllers/Makefile           |   1 -
>  drivers/spi/Kconfig                                |  11 +
>  drivers/spi/Makefile                               |   1 +
>  .../spi-cadence-quadspi.c}                         | 541 ++++++++-------------
>  5 files changed, 222 insertions(+), 343 deletions(-)
>  rename drivers/{mtd/spi-nor/controllers/cadence-quadspi.c => spi/spi-cadence-quadspi.c} (74%)

Merged also in spi-nor/next in order to avoid conflicts during the release cycle.
Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
