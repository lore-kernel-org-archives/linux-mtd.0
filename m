Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF51C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C19362088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OcHMVYxv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VsAxwkWq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nMXsyoJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C19362088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bULfUGqXN+POHJ0mn88sWZIcgCrQMMr+5FZC0XNCSY=; b=OcHMVYxvzrrQqC
	ZNY8bgHJU/6YNovPbN/E1OZGA+d46Db3+ai6j+wd7xHOXdCfvx6oWGuF1LHK9RVb03gaQD7NYx89T
	AX86CUPrOJtSdSqAr5YzmS9ZqGkg1m3Bfo+ccM/PAvxLgJbk96HizAsuKlwHOZ7gXxDL9X/KB+AWx
	BVVsCGBRKRsIT/VNurX6CBtHMLBoC0MYv5x0SuMY22vUiTmtdqfArldAaStFzg9OSQdzpValvmIvk
	H9TpxMdZDUmMrqE2aJsM07fyZIE0686ztoHcr1GimrRtDYfe83hx53BrJS6+iQk2PHAofqIr1i1PZ
	UotFu4Kc4g2+k+ngC+8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDcu-0004Vo-3g; Thu, 28 May 2020 08:10:56 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDcr-0004VO-5A
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590653453; x=1622189453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HdTdtDOJYrabw8J8TIf7lGLIzmSJ3KzrDOQOcHun3bY=;
 b=VsAxwkWqxbeiFtExvhjRuJ35v1ZKSKGFJC74Ip4BTEAzXoV7HNOuegy+
 Kpa71bpT5d2OT7KhqJNojqsas682Idq1vW9g/863qZkhsTLjLyHn5BiDr
 wD4l+yLOhtmCF5RWuKRN1UVr1J+C29fF4imvRTOYl/odB6jn3APAkGcSl
 OpJilhd+oXag0jUf1w9S861QNgOUNGbpmUn4YDinTPtEIGg9fbZjltLPF
 Pfp1CBIgpexdx23lbsHVvCtWWcSpkrR30n7RMVRTTHqH0ilTwqWGRhs2z
 RYUnsHOUtl21Tr9+lvCRd5saUgZp7jf+5vyZnB84yM3aVSL/6H/MgKNkS g==;
IronPort-SDR: I0+gdjGwoXJcJpSxIIIvDDKRTyM2Z0SX8I3k+zADBFSNHub0h79TnwdrEDLBhiLSgH5ZfmbXr2
 simjRVI3lf1krCWKt+2aB8nBmSohsNLT1j+lLQJUbNedPS2jvlww5BuNOcMPaC/jyOV3Y6Cb/c
 24H6TIBavUCUnvRVaAFpEC9B8MldSWDfxIEqOD/fDY5Jrz04iTkoR3rYrpR+WhxrIjFfCs8gtt
 b4ewM3HnWCdLLUiOcU+3WImv1z0ChJZ5T0NeSG7FdVxC22gtFLc3tvPkfeHH4aNJ7H+p7GRrfq
 dzE=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="13767514"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 01:10:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:10:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 28 May 2020 01:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al4BM8+TRU03hUcTfP9njP0GM0cTJcuEYbi8qcMIaDkhm7diW5qIH3pH+GWZT22brucUEkVV6svyPgwCdNBt8uQ+t+GMsFG3r7sCzgzOXI7ISWSh0a2e0zNIFwEcQtOnhFIprez/aqJq2q0xAT5It0BBvChS1IElFIwaaQLvIQgQbCiYYYWS9bKNltEKqOzDBM088WxoHvGRt8tykBsrbbyshVLsCTFM5i5cTLq9xgGgi6UqMSESbs8makZX2dGeFv5cXCDGGNaxhUGPkIvNRwHuvL4Y5V6W5TsOtPgPxUdls83DyZPT/4ttuXw0mMGUvihmvKGrwPZDFhW1K17Szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdTdtDOJYrabw8J8TIf7lGLIzmSJ3KzrDOQOcHun3bY=;
 b=XVyScvwiUoYSaCppE8cM+7GOwl/tSwpJwRIpJAncSxQNoOkeq+8NuGcRRFaChLifdPK7LKlEnFzNGBCZCPHiO9cRzXtUVWk3Rdqww41IHgYmRTLM5AiVXVJjqnJSjhCN3j0fxENriVPbPcfe0OxGtJn7yMayhqbJGKhyO21H5CrDhbwBtKGz9QXZGQemfyvOBkMJBgpSvo5926x3eJpaWFCzlq4RaHi3Fozw7O92r/DXAJCLp/HEJJeFmC0lfnhrBM1K75TacstCRko8e34+ZC9dfKKg6OpEKXfZ+Ivr1bQgs7+mbSbXjFRkVpG/2onXPZxjqp7rlbAFLcjzVuQpEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdTdtDOJYrabw8J8TIf7lGLIzmSJ3KzrDOQOcHun3bY=;
 b=nMXsyoJ78f12QlT3uZPWh4wciKInFaNGu9ObRoPJBZp8+T6nxUtawt36uoKepXdIPuWk5zOsGveKBfd46csVWQZVGMbtKdx6/mCc2TyfZiD0mfIIv8VEzrjp+NpgqIS1CcCDFrOL7WxpuWqOBVG8zbcfWgaC0bqVNkyPyxYdwAo=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 08:10:51 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 08:10:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Differentiate between s25fl256s
 and s25fs256s
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Differentiate between s25fl256s
 and s25fs256s
Thread-Index: AQHWHfVWQssMLhsP7EynPsc3LqjCPai9UxQA
Date: Thu, 28 May 2020 08:10:50 +0000
Message-ID: <3649874.8oGzVPpBU8@192.168.0.120>
References: <20200429071058.34385-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200429071058.34385-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ff75e1a-82a6-4926-ec16-08d802dea2cb
x-ms-traffictypediagnostic: BY5PR11MB4134:
x-microsoft-antispam-prvs: <BY5PR11MB4134D7173CA210264BE3E855F08E0@BY5PR11MB4134.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WK/V3mfUC4gHa52wOvE53n1/tO+sD6pJIQEEjHPCHd0OgUcyEkkuucnKONuFM0jmBtx5aUds++dAqtG+kHR51wv7jYAcGsNsyx6x2w/ykquGzekj1M7NRUl3v2Z7V4TRzQ+WMlc4O1AS+DrH9B++ef1txmFsDCotjp6yzqIb3EGuctpHdz4g4o3tSbsO83NL1TZjy0UDoYkF+0Mn9KfwA3Lr5fASCzXIUEWrsGvJAzKmhDbESRwnnxen/io29OmdLdWsUh1biUFIPiUElbytmwza0/X33l996ngAD82Iqy7kHiRmUzt7i3ccR6GTwNQ2hjNdyn/FCQUuHuxeQYqdXnwQ4oRmkBLCqyVj4XMgnXbGHQpCDls3wtghyWe47BjymbVmOfTMUbkzn4el9hc9IsN48oNNM80rGr8A6SD11/RxpageiKmj86vUxn0upj0VTpc19hyURr+UJ67p0agGGSm9EWktKrBn7N5ksbr0gKifIeUrUr1DAMFn4LFvsTDzo3aN2//+XvGGEndB5FnRZmtRpWvd5qyzme5zkvKf5YL/22ttV65PUASaNZRaC4DQm8/nJXuRKmkITeONKfcz51KBX+z+gg8uMDmY/pnb5ggbEJgfrXKkVc4fMBlRf73HJYWMgclITh9rsUqK3hxosB/dmqxrJdfJhrB/LMHqJtFQvKOJ3POp8+H6UREXcPWfEFvZhrDZ3jQpJ7K9atlqcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(396003)(346002)(39860400002)(136003)(376002)(366004)(6916009)(26005)(53546011)(54906003)(316002)(296002)(6506007)(5660300002)(558084003)(86362001)(71200400001)(2906002)(66476007)(66946007)(66556008)(64756008)(66446008)(14286002)(8676002)(6512007)(9686003)(186003)(91956017)(76116006)(6486002)(8936002)(4326008)(478600001)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
x-ms-exchange-antispam-messagedata: OxZRJErivr/zwpIk6XFcOJCmWNnjPN0hPnifbKz2pXnLlmKOP2pQpzX4SS8n+DfkZtb5jvPIg7RhHZcqpVrYdTph6IGJhrkNcNWb21edEliGauKlXBqdn+VwwFl94dBWdbjRFBPkogO7i+VHIKiPhW9IzkifKMUdjGIQiCR4Z5LDKegPB08Wzu8diZ1deFpklBHbSnJbT8MYtTLJvLhxKBDqx7tcxoNsv/UMI45NzZAVrRoIpiG8SboPIiQDCKlCDgVdwsMCprbcViHkDTvmFxY7d+tseYSJNiHOr1xcHIzxqHI8RoiZ7NnSyx718r92HQCVLgZLSJokBXTSUQB6c1GNTDRCF79IYf+dh9trZtSaDghh2CN29i7i31SYymas2pluj/iINWgUBYUMbYtlEKLqdcMg0zwJj+SDOyzygLTwqEOYJBXNIdWWx05x8hmrfXXmHiPXtJCpodoG++nZmxV5kCXqSqkd0uPDgCNlKEI=
x-ms-exchange-transport-forked: True
Content-ID: <37E0A2CD1FA54C48897521C7343F3CE5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff75e1a-82a6-4926-ec16-08d802dea2cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:10:50.8534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5BiYSPSZY/5wwawXNzKxQv9KjOmfnLhls+thHx2lOxqiIaFTcRndpt9Hyn4yKINKelV/OAxnUWLF4q1VfKSvMKNpW8hNjwo7/c2du1Kd9/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011053_273772_DCF178B5 
X-CRM114-Status: UNSURE (   6.36  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 29, 2020 10:11:01 AM EEST Tudor Ambarus - M18064 wrote:
> s25fs256s was identified as s25fl256s. Differentiate between them by
> the Family ID using the INFO6 macro.
> 
> Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
