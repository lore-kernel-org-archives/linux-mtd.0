Return-Path: <SRS0=lNmR=2O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C454C2D0CF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B39C20706
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XkTr3rTb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="X6XUUIgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B39C20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTM6hVI7pbEK8hT1mRIKr1O8AtwrFpHO61Km234CMBQ=; b=XkTr3rTb763gRV
	utyPXne0pxeKEzwPVb2361KqLvjzU5tK8OKgaB6wBtkqxAnYKAsK8rCJxJa8HcHivu7s5SASiC2Io
	tEUCCogzdwDDhEhIHj4Z3zaPYRNHiGuoSyZ83Vg999BX1JrEMIn6AS2LP18FuptYG6cLoAOlQ3mnc
	hAdBOl78ep+iD/8S5En+IacqBCwt+Ct9w0kx/pZReu2y0xRPXNJQDac/8hen/29hIJL7tVFm5ji7s
	a3qKA4nSdA6oRSuMDI/8fJsjs22UxMqlcNBU3sv2EmqcLT+fU5Rx3rsP3cg5UUcO9lZcmjE81302y
	LsLQoE5c51Rp/kT7g1iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijg8h-0003Wu-7g; Tue, 24 Dec 2019 09:06:03 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijg8e-0003VV-Ab
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2019 09:06:01 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: He5S4y4gjVLZOLjf3Q6ktNcuRfwYDT1wjzT/XhHv4760oSm8DWb8Qbkhr9li2qR037cxJ8Nm8P
 vosV3gcYvB0404WvNmyg2qa37A12HZOECWlLJbXmnfAPAQQ3gQiS8OS0sX0ueDAH/sbHs22qls
 12+lnphjFbNgdOcXwAj/ExFkT+9ZOezhr983fQqp5DJ5iKFac+n3GQLTE8YgQ3kfdD+JNcDuUc
 eN9/DuGIxlcwTzvXCsR7Iq9AzUo52VvV5jGdYdz4Xq+oWvIYSIcsKAad0/HSmqPJDVupkmse6j
 2nw=
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="59467599"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Dec 2019 02:05:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Dec 2019 02:05:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Dec 2019 02:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT8+FSwdgKLOthkP1XuGQg+JWrISL4S7/sV9TZZG39ANcNVe3b50hlrHn9GkviVZUOwx7MWMNBBdJgTBWNoM2RNwgesMnaLpckrayQSUH7EWeon0rpYZJZ4oy+mFmwKtoW9ru4amzW9aDJGKzGTaY4T+ZIsWHC9LcqAI9jWQBoD2/DRUilNUb9cNu6AmZq1pWmC3+E4JnStt6HrP0tw85h94MySC9uAKqeBhVY7BoYycYIyzzhzEWBvTInU/6zvcCOOxiUFx3w7oBjydZ/kSGlV81xqiX7hRDRkpwVdDq1aguUfhqEbw4y0CpQVRwng9YmE5zshGaEVLEcHfnouDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUoMNMh+N4rl7+RC9N5lfF9sgMH1fytDf5ZO8HMnIlg=;
 b=ZPqwdzMKxzI/iGGoYloN8yBtqUeJAwPtXYsxwIPOz8DCMUyjC315X5/c7nJbOqwgY3WReKvSIUnQCnkScecqBmv6R1L/60fxcNTrqSDCxIqqvmeIDFcY4tjeCqq+abzESmiDLI44ARabJ/FLypMDwIA6wLCPOt4PDmh9okGLenuw2DQS53VxcB6qx0yR9SxgnyRkwPz7xeN74Flc6Tw4zK5OZ3wDNegS9lQiX7DDS+KwXeSWHPq/m9gtLW4AFpFIrwOhvPgHh4n++u5jy0BUh8U9GocLdbsv+4EVHIiIICHP0AS2C/22MNNTD/4JyqiBwV2gdIOgK2DE6hIQ2OVxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUoMNMh+N4rl7+RC9N5lfF9sgMH1fytDf5ZO8HMnIlg=;
 b=X6XUUIggjnuh0zg7ifAgz0g/tPRIcatOFnjWbR3896BjwooE2uMlUkUlJWh0U0o4E6vl7l2r29hfFHJ4ccSQ9Xf1m36E2AmRVrdkBRT+HE287JBJhZf67jOoN9N1hQ8BO3UcgZn/sEd0nyycL9WY2D4uivIOF4dSfPfDA0tgfBc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3631.namprd11.prod.outlook.com (20.178.251.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.13; Tue, 24 Dec 2019 09:05:57 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:05:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mail@david-bauer.net>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for mx25r3235f
Thread-Topic: [PATCH] mtd: spi-nor: Add support for mx25r3235f
Thread-Index: AQHVs6j8lOwGScqlHk+ut4iAsuFbfKfJC2EA
Date: Tue, 24 Dec 2019 09:05:57 +0000
Message-ID: <01765244-01d0-544d-4371-8f967e01bfb6@microchip.com>
References: <20191216003646.340403-1-mail@david-bauer.net>
In-Reply-To: <20191216003646.340403-1-mail@david-bauer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02bf905c-c6f9-401a-51a1-08d788507d08
x-ms-traffictypediagnostic: MN2PR11MB3631:
x-microsoft-antispam-prvs: <MN2PR11MB3631906A80661F3AAA226498F0290@MN2PR11MB3631.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(36756003)(71200400001)(26005)(6486002)(66946007)(66476007)(66556008)(64756008)(66446008)(186003)(91956017)(76116006)(31686004)(316002)(110136005)(2906002)(5660300002)(478600001)(4744005)(53546011)(6506007)(2616005)(86362001)(81156014)(81166006)(8936002)(8676002)(6512007)(31696002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3631;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IGpnWtNzvUPTrYZ0NNuX7zoin99uWobkka5f5eOZTtNcn7sMvk+ieba2w1+9F5TttqqvZRuCUIuVtoa8pJY2nYvzCYHyc8JrTsH+BWeLcghOBcikrBXmMUKQmeYJSs3edxG82zk5SPx4+v+r+VWo0C87EQtLxRSmPXG/QFdLvtzoBxNKFLmQaMjtFLPsoq/HvF6LkUMqawr7oVAWNeCOghZArX5EVoIgBOs+A9ntpH7GkTo9EA2KRACcq0DpRyuEB0ldvOMMOL3w9ZUElIPNdHdVaJn0OZbtLcR/B03ionS3URtCyN6aD6rE6hOgXvOyl8ENcSBZjWygAfXllUBBeaxy/muT6DANsDpeAmUtgYeFOGSnGRkWWMJEACQZKQ5A12nQrZ3sdlp/y0jvtdcHrB2QdKrD7SmoQYMDYQYODRuPcwlCE0s3G2Tmb3loYqbOmJimu6NFb9OGi0hHCflSGsA7r7GZ9Mw9EX63Oc1hc5Ft9v0nOnVuYoZlT8MqtBxm
x-ms-exchange-transport-forked: True
Content-ID: <3F0EFD698B63D0409851A11B238F5311@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bf905c-c6f9-401a-51a1-08d788507d08
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:05:57.1243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s8QV2CaLjsyXYvV7hRZ9D2zSfB455lfJrV7rDaPdgHUgwMShVrGM5bZj+0xYlJOiTF9MfTWWJMkGYJXGzxy6qcHw4+hbhKohjEGoM6nXM48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_010600_403775_E09A59AB 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/16/19 2:36 AM, David Bauer wrote:
> Add MTD support for the Macronix MX25R3235F SPI NOR chip from Macronix.
> The chip has 4MB of total capacity, divided into a total of 64 sectors,
> each 64KB sized. The chip also supports 4KB large sectors.
> Additionally, it supports dual and quad read modes.
> 
> Functionality was verified on an HPE/Aruba AP-303 board.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)

Patch applied, thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
