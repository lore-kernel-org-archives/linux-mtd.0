Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05845C352A3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 15:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C771020733
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 15:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oYrxjXhk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="izlHqkQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C771020733
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpWvZoTj/vm0nNb6uuAPUBcgjMdXWC20fUC9WHWruvg=; b=oYrxjXhkpSo2Zo
	QFVJBzmGTLN3k8HzWdO7hNQ/6KNYdGwTFl6Z3Gyvqavms4XkMG+wvK2KnU+pMqWvB/EDjosvcoimL
	4n2nrdDESaePhImT5h1bgyoV8cfRnEpPmayKT77ir8YrsWehSJTRMoH5zN/hD5fe5IkeiatMq4F1T
	wY6+bkI86xDbuO5JGIsgs8ApD4rbxatuhU4Qq5SX2ZE1+ppXZoy3qJxOywRleE0nd5atiL7pwsdkY
	A1ajSbvCJdCvyFYy6SdjssycAUVw5Z/PILkIPglstYfT9ZL7k2liFdIKV9gA1zUvO7pKQzs6AKZAx
	wiI/QYIJ8QQSBlDjP9XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1BKb-0001bZ-4B; Mon, 10 Feb 2020 15:50:41 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1BKX-0001al-Bt
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 15:50:39 +0000
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
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: mKJEV8M7w3m359kN4XWUkAh7aT8BYM0raIhR20rxWoOZHFe1SWUuwlxNe59PnkVQOSjNfRQD9C
 GjxmO2tPgkygNz8grBmyGc15PfhwPR6RUgKsppMywhFU20GbOr89QLoz3p9oQvK4YyZUel3xoZ
 851uIa/V9PanJVqgG/5btUgqtoFZuc7ajN4Q2RK6jNrjC35Q227JaAsHtQxFpgkHpFRgWFjXBL
 UOCIqnhX2DtulTeZ2WvG9zfUNihrOrzTCr5Snor5CxJ/ZlpQ7RA8IkRiAvmA0572bj2ONXysL4
 oW4=
X-IronPort-AV: E=Sophos;i="5.70,425,1574146800"; d="scan'208";a="63690602"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Feb 2020 08:50:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Feb 2020 08:50:31 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 10 Feb 2020 08:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnuk08BNnKNP78KQ4V3vVvlx33ynjYsH0RULT6ENmLq4mX2o8cs3V0a7Fzv7HkkrC3jGVL/YvhgtoQVVOhgGO01DRpVSvnvGhv50YfGDfRdlJOJTGQg21w7vyQIifg2XERRHXZvgqOHTQ6XNZh9uX4E38VdNvPd/rZRAgCjmLiO+bt5/4nb8Jx+EjCwAkkNmRApzxdqaPxPjXuKwSlMJOJMN5jF2JGsF1ZFVPAT1LCFKeJiPpoTpXgSIBYu24UPotVXRRwexzotmGZitNxziVCsffLGM6MBoQoxMUnIX9a3nqXI/2mGGiTzJHnMeVrOTg9p8lZQQNH6j5SNTrqpn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnn14GDni7t6Ku6wEUvSJQvjxkMoHXiCwOc9nCwQI9Y=;
 b=CTASuXlbmC0HNndk9B2TokJ2zRp+7M+wy1hLgCUNlBTfrlN6fbYGh66qjZZO2d0Fj49GmS9NHxzwqOm9cUKz3B2yHOjX+3k+TdTsZgHG9xn0WRREByr8EABx2MWgV3h3St7So8NbqpQ3U9Adu7fRMLyUpndSTTBUgKTHmFlKI612d+ddD9QqWjhUm/hTwtK9kwAgrlr8Q4eWD2E9tIQ8UyNCM4S93lQ6lm37wF2yDfTt5bvtRkHO1WpVdLMnBs3RtroXgNIHv2CAhzenqgj9f/8vsd5RQ9MVM544z6L7APfG4CIPgWJ6wHGlDQgcazj7J+utkqKjAqLG1cYm23B6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnn14GDni7t6Ku6wEUvSJQvjxkMoHXiCwOc9nCwQI9Y=;
 b=izlHqkQOCYf3FfVSkyVVulYD4d6y2hKBt30n0VjxzTUBt8/pAbha5tRIMmCSjUKJcAHVA79sbPir0TxFqWUEs6lpSAy0w6HRiooivWuMfsWHeYD2hlftreREc5e3WWk/2P4a6gztfAl6wuiWns0pywEdErGxbftwePS/HumuNwg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3936.namprd11.prod.outlook.com (10.255.180.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 15:50:28 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 15:50:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV3bCHi2pGqMNGHESG9Z9T0h6ocA==
Date: Mon, 10 Feb 2020 15:50:27 +0000
Message-ID: <2666242.fqR9HCI5eq@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4425106.vomQgZVa01@localhost.localdomain>
 <3eb14c9f46fde4d232ed5d1c6295ca91@walle.cc>
In-Reply-To: <3eb14c9f46fde4d232ed5d1c6295ca91@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6be3d176-95d3-4951-0186-08d7ae40f354
x-ms-traffictypediagnostic: MN2PR11MB3936:
x-microsoft-antispam-prvs: <MN2PR11MB3936DCEA7C9CF3415AC38FE8F0190@MN2PR11MB3936.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(189003)(199004)(4326008)(8936002)(53546011)(6506007)(26005)(86362001)(966005)(71200400001)(186003)(8676002)(2906002)(81166006)(81156014)(66446008)(9686003)(6512007)(5660300002)(66946007)(76116006)(91956017)(316002)(6916009)(6486002)(64756008)(66556008)(66476007)(54906003)(478600001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3936;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f4pXC+7wFqaSK+dYUsSOGXyquvoHvJKIC3tyUKKtnzaHyDvogTxNbE7HX7XpLJorRo/gC+gBCWmCWQoY7Sw5x7rSKCaw4+zmmgkA/AKIPcogcEftu9PxNoJfq4jEW9P+G3cD+zIwvGWBt3kbmU9K0j4lNeUyyU4u8aIccL50Bvkgr9da3/cnzQgjkaxzn7q5dFYCLGpFWZxL8uF044HsdpJ/k9jB1gbFAsJmZ32C3ShaeBWnY4MB1i3I7vd6WPIMP4/foRnqO1Ee0QWLZs8r8NKzJ0z3P4tB2ZmqLgSjCb3tJOHWphITr8JUYdq+ZHcqWMl8MtJA2Y/ECi+Oj7wA3NPmnlPgB1IpsAG0vB7mXbE7VZNfeQEVQDEXAqhRXuMeaR7srCZeKf38qAzEo4KxIQz1fRwP5Wc+SNHAWU4nFgBbOJorIWfmeb/En5wtHraA2z6w4FS1kjtFwwWjVvUVdHEtKSSHByZu12qIa61LAjcFgrCs+cVoo64TBtdotn/2XP3Xnx1N8yy6DlD7WcRek4fT/WkbMXmtcintlapFz6cQWKZi7YCg3BISLbUtbyT+
x-ms-exchange-antispam-messagedata: IMm4UD0293gvcj3fcu/SypnOFJqAKoUWqElR8kTjUMf7tPvkORRuNeau3P4bP/Q1qdM1exowMTyUpQ41sslLINgmTAnnIbRa0i+WLFE9T7uN7nx0DkQ/E7LhF7DKJjSuH2ouOueqT+ML84EPvurMxA==
x-ms-exchange-transport-forked: True
Content-ID: <0E28BCDB830DB04EB5768258105DC976@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be3d176-95d3-4951-0186-08d7ae40f354
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 15:50:27.8174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZRp+HGb+9JRZcoHp7AwPB2TL9m5I4U7heXFM7R0C6kxSxC12RWOsq2c7kKmc5sVQ0pNjp2qaC2fRe5dQPPEQioi16AG19jdJQm14OLNynE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_075037_505353_D07E8669 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, February 10, 2020 2:14:48 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-02-10 12:27, schrieb Tudor.Ambarus@microchip.com:
> > On Monday, February 10, 2020 12:40:59 PM EET Michael Walle wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> Am 2020-02-10 10:59, schrieb Tudor.Ambarus@microchip.com:
> >> > On Monday, February 10, 2020 11:47:23 AM EET Tudor Ambarus wrote:
> >> >> > btw. we should catch the two special cases:
> >> >> > - lock none -> 0 (that was already the case)
> >> >> > - lock all -> all BP bits
> >> >> > 
> >> >> > The latter is important if "bp_slots_needed < bp_slots_available"
> >> >> > because there
> >> >> > are multiple settings for protect all. Most flashes will define any
> >> >> > remaining
> >> >> > setting for "protect all", but I've also seen flashes where the
> >> >> > in-between ones
> >> >> > were undefined (not mentioned) and only the "all bit set" was
> >> >> > protect
> >> >> > all.
> >> > 
> >> > I re-read this. Do you have such an example of flash? Aren't the BP
> >> > bits in
> >> > this case marked with "X", i.e. don't care? If not, probably we can
> >> > mask out
> >> > those undefined slots.
> >> 
> >> There was definetly some datasheet where the remaining ones wasn't
> >> described
> >> _and_ there was no X (don't care) bits. Unfortunately, I don't find it
> >> right
> >> now. That datasheed made me wonder what the other "undefinded" cases
> >> would be.
> >> Probably it will also be "protect all"; I just mentioned it because it
> >> would
> >> be an easy special case to handle. I don't think we should mask out
> >> anything,
> >> either use the slot in between (ie the one which the formula gives us)
> >> to
> >> protect all or use the largest setting (ie [TB3 |] TB2 | TB1 | TB0).
> >> And
> >> given the reasons above, I'd prefer the latter.
> > 
> > I'm fine with using the largest setting, but we'll need the proof
> > before going
> > this way.
> 
> have a look at 7.1.11:
>    https://www.winbond.com/resource-files/w25q80dv_revg_07212015.pdf
> 
> BP[2:0]=0b101 and 0b110 is not defined.
> 

Good enough for me. Thanks, Michael!




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
