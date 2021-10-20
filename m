Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A082C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5013A60FE8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 09:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5013A60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1ZcPkkok3SawpG7/CcSRo65xRyz1dRUN3kxSegtEcw=; b=SLjK/mwpxKq3av
	S0ZJZvvTJCnycUMrr8R1DRptjueZU4cdHXN0thCIykZANn/aN7Yz9vDqQ0m8ZUSTJQHQnLL8MbaL/
	u5rz8tvEgjPH3ekrI9hK9IPRlK06X211VQw7pY+a2ZgcblKyHcL2Pb0q7lDjgbIKLR7I+QHYmftbL
	e3mjN/Zcz/sa8fxeDUA9TuAX6cLUxkcmJJQPKCfCHVGP2pEQhN9mcmbp8kjQ57EB1W0DnLhFP3ycP
	6DjYytyn+6rNecVgKNnbYwA7M4DyTi5cacMA/YsE051bVie7JJeXaXMgD+kGhrGXF7QbGFpygfAcR
	7h+Owp4Rk/5teR5t9YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md8KD-0044v2-3x; Wed, 20 Oct 2021 09:55:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md8K9-0044uH-5O; Wed, 20 Oct 2021 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634723753; x=1666259753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6mB5I/EX4QmUfQoNMAXAe5c/akUtGKLDJgsemAhKUzQ=;
 b=q3iWb9MLPwYUdAxVu5eOrwdhhuVWWoC1EFPARuq68/Hbgj7P5UxecC1/
 fe56bwjsFnHltZlclYpZ4hZC+o4Be4rRugyDE9xTQy2xJzRqpc7EkYVNP
 oUmRjL67zqmAs/qAKBja7+TTGLC/i82DluFKWUSIZ51Mz3jwvr4RPE4Yq
 uASF8phgB8l8x25qqXKfMiuuacRIBTiFx666XXLeovwEKugRc5+sFtNuZ
 zoWYEOTTpjBUpLuC4zTQUk1sPEehXYRe5+z9l0KH/WsnFxszQDsUfzA9t
 Gu9cW3OeCZvOUItWyTh9C8OWfGyRTfPoZg6DHwJX/7wHV3vcoU0hKd5LD A==;
IronPort-SDR: Ky2mTTEjcHesAnPlT0Fkr9q71kSxLdrPgaYzBjHj56NsOlND+O6c42Mo/dGSvLMWwBd92nJAQp
 xUfGEI5DikZXlOO24jJNH/jswS13GzxTb+MZQofmCVjDyDrVCxZ3cmQb3v98+MOST/nJ9wyX2d
 BuDQKqkSQ40A2CyjYrQ+iqCM1UP+eJwSXu6PJ9IIMqKtlcUzn/d9M+JJjvl5iFEp8xDlz1XVBw
 3JoFp6PUMvRx2XejqNsOrIU4xDB9x+F/Tr8LrzQ+3BWoQGcnjXRCX3C74i833uIpHyqUSs6hy/
 eK8bHJyZXSrzW281TBDcelFX
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="141017523"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Oct 2021 02:55:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Oct 2021 02:55:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 20 Oct 2021 02:55:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuA9U1B0aTEgbzmLKYD9meqD+IuPB46NFt3EzhUMqRz/9K+L+kKQcfdLbucODzy9mntRUC/gwB0cr1HI1g+Dh2Ml4pgJ6CBt16vZddoD7tW1m1/MaCW0rED5l8hGbQZhLuL56AhqJ++8RR0Z7xhPRrW2qqc0sgLpVOUZhJH5sHjtXqIYk9ieRXRQGzjYtil2b3mNbpeh3+MvgUbwvmHY60raJ+McBT2oDMhsHQyqqUA9q1ZrJCHFTsbrJkX8fD7QfDdMsmLJP5PGPoBGbk15BuMfjW+elYjjmPR9vum/8BMeSQ5+GQbwEjEzzA5HRgeEVjm21ZUVwK8ahDdv5snZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mB5I/EX4QmUfQoNMAXAe5c/akUtGKLDJgsemAhKUzQ=;
 b=BDNqr5zkrHE8yvP3MGHg47f5pAgRGGXIsRNUD5owCUyXFo5uu7G5m8H/Be3vJzp3pZDKUmYYL2lldTwFsI+EackpABmx1G0zXaCIpdllqw1uFYD334TiVxVWMcGzo8GOPpZbIJhv8tjBHw984maUjPIrnc7P74C6sbVUllhfw4ZijOQLfBrqaVMgP85UDn5itSsuGWGnNhh2c/z6NCdZB8V+FJWuOdTmAS3Iq+34L006d/qZi1EkWhYlmWJeTGsWogMQYUbRD5Nwdomgr0IdpD2J8ogzfMIEWXcuEscrDrNNSRRVI/zkeEuuV9CIUKaWOx4ffHGGXRzYz0eVNqv3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mB5I/EX4QmUfQoNMAXAe5c/akUtGKLDJgsemAhKUzQ=;
 b=qxJrH6dDJmQ6A5JWuPm0MteJ/MivJ4To0mK4J4eZhHz8f9GRSCiIxEPqWevbo6gUvm2i8UYhu30mLD9x67i6orVfdqlaGbSRy1fXeR+afUyRnBEirB0WSD1WhLOd3tL+3dNnvvJ90rrVG7bbF5KQ7UA0l+5MinpbjK8jAFGnmSo=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1663.namprd11.prod.outlook.com (2603:10b6:301:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 20 Oct
 2021 09:55:47 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::fc7a:748b:9fd:b66b]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::fc7a:748b:9fd:b66b%4]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 09:55:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Topic: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Index: AQHXuM5x3Sn1HTf2W0qinCbUxi2img==
Date: Wed, 20 Oct 2021 09:55:47 +0000
Message-ID: <e3e5c59e-08c0-07c7-e77a-5edfc3502388@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
 <20210817121626.5vcwuluheqfqrqc3@ti.com>
 <d7d7b602-0c42-dc14-71f5-9b89303a0941@microchip.com>
 <20211019172623.hi5c4i274bv3lnqw@ti.com>
In-Reply-To: <20211019172623.hi5c4i274bv3lnqw@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa889675-bec2-4920-c5cd-08d993afca4a
x-ms-traffictypediagnostic: MWHPR11MB1663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1663559318D006002427B69EF0BE9@MWHPR11MB1663.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EtVxvJEfVfW2wnA/OdRVGmNyTE/ELlPyvFH9Gsn5G9xIgKk1DvTOV4Sja1hh4o4J1129jsEsTNHZgpgy84kTX+iL8Op9e2V/+qf2hzQydxqRmQiEddJnjE6vS6/qvw47bf6TwRJhWfybqOqJncxrh3jGmjnjyipnD5Kh6/uuGq8c2UyrpQtGdygc+gHdM5ICwdbILhxQfUk0cx6wQ9W9lPDv3fSXHxDiI1Qo6gvLNUhhR1BoURnirb31k2eJs2RND3TqVi6a1ce500iZgQNW1Xt3AabyJZ123dzJPceKv8twN97C2NzxZTIqjbsxesJbx+1yO3bg3H8SZIh24YVGizWLPCr9ouBHop/WXJQtcSXiN6k3O1Og2ANrGhAIwSQ3z9iLw+4jW2s4ReWXVV8yI5/zv10EVG85ejX8IcHPVdn7vZcGpFX9nBD5B48//91dG9dylYe33JHgMrublU+kxk6h2DXwoCJMNSEG3ylYQ0DD6KdXCT68tKjookRMkZSX2zVRwFk3V3VT9uAWavaSaddvgfj2wPXtAr3Teoytvti+FrqiAD5GBe63vAdNe8FX9E5J8J0CjaeHKPFzCaObhKzdm7G6W0k6a3npaFyIqCNUKbDiHfd5HSQH03k9uqbcV6kpH68Qdeti3bk5aNk+hFe7f831CoDTpLNP/kqBLBTIn+8G07VRcvBecZAFoj6uPndn2TkrRvXQG0KphgYuIKmnaZDlogER9kgRy2g+C9wnmIcT0NV3QXzryZp2LQN4Q6/RPsL3Wk9BG7efOaqP7tWAUBhhAVqrybG4HkpGeSs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(6506007)(54906003)(122000001)(8676002)(6486002)(5660300002)(186003)(2616005)(6916009)(71200400001)(76116006)(7416002)(2906002)(4326008)(83380400001)(26005)(36756003)(91956017)(66946007)(64756008)(66476007)(107886003)(66446008)(8936002)(508600001)(31696002)(38100700002)(66556008)(38070700005)(86362001)(6512007)(31686004)(316002)(26583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmVJSGlUeDB2WkJWTWhIOU8wRFU3aE5acDgvdVRpNTNkR1hjcC9PZE5JRVlN?=
 =?utf-8?B?S242WGlaN0FqK0VPeHpZSEpIZ1pjWEQ2elJJTEFZZ0o0OXZYc09UOVBFTmtu?=
 =?utf-8?B?cHlJOUY5aHFyQVVCaGlCUGRNQzNiTjBPQzVjN3lmSGRyd0xTemZabnZUd2Y2?=
 =?utf-8?B?enR3U2RMV1JHcHNOVnUxRG9mZnNpcCt4YmhKMDNaTUJkd3FqczRsbDhETUdE?=
 =?utf-8?B?MHZmYk4xZEluU3pWZFc5UGduL1lYUUs5N0w4VHk4NzEzOVVjQk42Wjcvd3pL?=
 =?utf-8?B?YmJlc04yZXEzRXpLYjFLSDBaZ3dsUUJzV3oxTTBjYmxTV1ZyTHowWmxFenVZ?=
 =?utf-8?B?Rmc5aGJzQlBlUmJzVkVRaWluNmtnT3Z5eWgzdkhZNVg3Tm13KzM0M0xRU1BN?=
 =?utf-8?B?Z0ZPc2lGT0xEZ0tpWmoydURRNWJ3c3dvUFhhekFJUzJxaG9WN1Vua2k3WC9z?=
 =?utf-8?B?TnU5YmowdU9LYnZBREJBakxXK2dsT0duRVBIdG1McGlNaU9SVmthTDVESGd1?=
 =?utf-8?B?bHhSSW9YbE90L1BZWG9BMWhSSHBsSXVrN1dmWUZNVlVsUEV2MmdTU2Y2aWNr?=
 =?utf-8?B?QXk3dVZ3eVdZdXRCUzFMbU54N2xBcWtlcjJ6QjdXU1cxdHlDWnR6LzltMlB3?=
 =?utf-8?B?UWJWeE9tRTRpaHBJejgraHpLNjlGVm9oa2NNbWJxWHNLTUhKQnlMdDFXcHV3?=
 =?utf-8?B?b25KUzVRdEpaNTNNZTBMdEc1YWlCU3VZUjdod1RiajhzVjcvZis2b2cyNno3?=
 =?utf-8?B?OTM4V1l3SGFnSUZUaGZmMlBtbG1GZmU3YTd4Qll1RlhyaldrSkJ0RHlzclN3?=
 =?utf-8?B?MXBhNHlXM0RSU3AySHdIMktLTkFtQkVSeHM3ZWoySWVLNTFaRVhoanVEb3h0?=
 =?utf-8?B?cDM3bmZpeDlaUm5zTHNoVUQvMzRmMmNwTFhWVndXSGRrZWFmdFlMRWtYUWw2?=
 =?utf-8?B?WUlNR1J4Q0NBZlRpa3cxYjBHYnJzUGlWNVAyR1VNUU1wV2h3Q2ZvVnZNOThQ?=
 =?utf-8?B?ME5zTnRRQ1YyUldmWDV3d0M4WnFhVnpyc1ZHY1Rpajc4eWJ2eW9mdjhES2N5?=
 =?utf-8?B?dVNVOVo0cEs5bW9xZFN6Mnc2NTBKUDdXWnl2VFdFTGh6eHIzYS9kaVZEUE1H?=
 =?utf-8?B?RXJ1ODdsNnMvWFlNMkNqbldWOGdxaXJOQTM5Q1FnQno1Y2M2NzJTcEJQbThl?=
 =?utf-8?B?TTNTcnlXN0ZLTk9ibnY1bTR0dDk5eklGWHpJTmI2QjBHVzhKZ1J0aFo1WEdF?=
 =?utf-8?B?N2J6bUZKOWx4QXkyRGdBdGVsVkdnaGpPWjFFc1JLTkNvYXZYUm9mSExzd0gz?=
 =?utf-8?B?bFBMVTQ0dEhqQzNXd3ZFa2JuOWlXOGp5T0lFQ3RLdDV3SEk0MWx1WFdrOTc1?=
 =?utf-8?B?OXdYRTJPRGZZYWhHOHNEZHJ5RVY1NzlDRGZObkJNTEljeGJXSWVjcTVZQnpp?=
 =?utf-8?B?MEg4SnpYQXdIRm14aDdKeUJxd2F3UEZiNlpkaVp4YWNMTXJiWEZyNEljZFVq?=
 =?utf-8?B?c1JGcFhzbjV6Tmx6YzlGckJibDNCVDAvZ08yWk5aSFhrZnNtOW1rSmNxZ1RE?=
 =?utf-8?B?Q3lmNFlEQlM5U2d1TlFTOXJSSGYvUWhhbi9naXRPM2ExMzBrWWJkb2c5b1NU?=
 =?utf-8?B?NmpPMzlaV3hTYk5rSStvR3FyUVp6ME5VRmdvdXd4OUVnNDhNRXJQc2JMS0RX?=
 =?utf-8?B?dVBiSktiZlB6SjBLTzg4NEkzZUVmQ0pOamU0VjRUZno5dDBJM3hrYzluWVpH?=
 =?utf-8?Q?5ctS1vg0V/ImGkPtTE=3D?=
Content-ID: <A81D7B9B48A7784686C2654BDA6E6196@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa889675-bec2-4920-c5cd-08d993afca4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 09:55:47.1177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_025553_362946_19C20AD2 
X-CRM114-Status: GOOD (  31.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/19/21 8:26 PM, Pratyush Yadav wrote:
>>> While we are on this topic, I find this a bit "ugly". Having to set
>>> late_init() for setting these flags for each flash is not exactly very
>>> clean or readable. I don't know how the future will look like, but if
>>> each flash/family needs its own late_init() to set some flags, it won't
>>> be very readable. We seem to be trading one type of complexity for
>>> another. I dunno which is the lesser evil though...
>> Your point is valid. This patch removes SPI_NOR_4B_OPCODES and sets
>> SNOR_F_4B_OPCODES in a late_init() hook, forcing the reader to go through
>> the late_init() function to see what's there. As you saw, late_init() can be
>> used for tweaking flash's parameters, settings and methods, not just NOR flags,
>> so I would expect that this hook to be present among flashes that don't define
>> the SFDP tables or for flashes that have parameters that are not SFDP discoverable,
>> the hook will be there anyway.
>>
>> This patch opens the door on how we could handle the flash_info flags. All flash_info
>> flags that can be determined when parsing SFDP can be removed and use for flashes that
>> skip SFDP, SNOR_F equivalents in late_init() methods. spi_nor_info_init_params()
>> should NOT be called for SFDP capable flashes anyway, because in case of SFDP flashes,
>> all the settings done in spi_nor_info_init_params() are overwritten when parsing SFDP.
>> 1/ flashes with SFDP will set the flags as:
>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>> 2/ flashes without SFDP:
>> SPI_NOR_SKIP_SFDP | non-sfdp-discoverable-flags
>> and a late_init() for SNOR_F equivalents of flash_info flags from
>> spi_nor_info_init_params()
>> 3/ flashes that collide, one with SFDP and the other without:
>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>> and a late_init() for SNOR_F equivalents of flash_info flags from
>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
>> 4/ individual flash, no collisions, a flavor supports SFDP, the other not:
>> SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
>> and a late_init() for SNOR_F equivalents of flash_info flags from
>> spi_nor_info_init_params(), that will be used for the flash without SFDP.
> To me it looks like you can separate these flags into three classes:
> 
>   1. Whether to parse SFDP or not.
>   2. Flags that can't be discovered via SFDP.
>   3. Flags that can be discovered by SFDP ideally but can't be
>      discovered for this particular flash because either SFDP is missing
>      or the table for this flag is missing.

These are the flash_info flags, indeed. Apart of these there are the SNOR_F flags
which are set either statically (one sets a flash_info flag equivalent when
declaring the flash), or dynamically when parsing SFDP. Check
SPI_NOR_4B_OPCODES and SNOR_F_4B_OPCODES for example.

> 
> With your series, flags from 1 and 2 are populated via .flags in
> flash_info and the ones from 3 are populated via late_init().

My proposal was to get rid of the flash_info flags from the 3rd category that you
described, and set the SNOR_F equivalents in a late_init() hook. This way we also
control when the SNOR_F equivalents are set, late in the init call. But this can
be achieved with your proposal as well, let's see.

> 
> Why can't we have 3 different fields for these 3 different flags? In
> flash_info, we can set .parse_sfdp to true/false to indicate SFDP
> support. We can set .nonsfdp_flags = X | Y | Z for non-sfdp-discoverable
> flags. And we can set .fixup_flags = A | B | C (can probably pick a
> better name) for the flags that your series sets through late_init().
> 
> This way, you have a clear separation between the three and they are all
> clearly visible in the flash entry itself.

The downside that I see with this is that we extend the flash_info struct with new
fields and the spi-nor.o's size will increase whether the fields are used or not,
as we have lots of flash_info entries. This reminds me that probably I should have
put the late_init() hook inside const struct spi_nor_fixups. Anyway, we can avoid
increasing the size with some flash_info flags masks. We use the same flash_info flags
entry, but we introduce some masks, to separate the type of flags. Something like:
SPI_NOR_PARSE_SFDP |
	NON_SFDP_FLAGS(SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_SWP_IS_VOLATILE)
these are for category 1 and 2 in your description

or
SPI_NOR_SKIP_SFDP | SFDP_FLAGS(SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
for categories 1 and 3 in your description

but you can end up with flags like:
SPI_NOR_SKIP_SFDP | SFDP_FLAGS() | NON_SFDP_FLAGS()


> 
> The only case where this might run into trouble is when a SFDP flash has
> a collision with a non-SFDP flash and they both need different
> fixup_flags. But I supposed that is a problem even if you use

we can probably solve this by putting the minimum supported flags by both
and fill the rest in fixup hooks after we determine which flash is which.

> late_init() so it certainly doesn't make anything worse.

yes, this is a different topic.

> 
> I have not given this extensive thought, but it seems to make sense to
> me, and I feel that it would make the flow easier to follow. Thoughts?

Both approaches are fine. Your method keeps all flags in one place but duplicates
the setting of flags, you'll have "if flash_info flag, set SNOR_F flag".
Mine gets rid of the SFDP flash_info flags and directly sets SNOR_F equivalents
with the detriment of introducing fixup hooks at flash declaration. Can we involve
Michael and Vignesh to get their preference so that we come to an agreement and move
forward?

Thanks for the review, Pratyush.
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
