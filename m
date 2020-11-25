Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180EBC63777
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:22:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E41206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z12U+Wn5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="TlIyuv9a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="f7wd1RvU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E41206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iiP9fMyNgdP+DpMNINB8B46WuQaQVOaFA1UTlsAxkWc=; b=z12U+Wn5ePKIN3KohpE2nh0jJ
	X/240d0lRYJfNfcg3RB8i2AA7PGd0xQ4u/yJeJivTFYA6N+iBD9dEALktm7obwy6m3aBGRCyel0YN
	lq9NlCrXEusEQMR5AGAsuuPOouM7PKbT2C4QUO0dqiWQjwkiYTreem998HzIRtqVHlH8+KyRvljyi
	PsNErvOzxgPlSpOnrK4qsa/X3SEec2NtBd8eYKzmxkp39+Vl49trsEgyjV2LTZMlyF5lCqvT7ZhAF
	dFfwIYwVUdmkxzHyTxfLvj6klLDdUTa+Y6cvo0EbM7aYRO7BC6WJR235Wegp/IZ8ZyFt9QZqjk+z+
	7UI5xiUxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khtni-0007xL-0D; Wed, 25 Nov 2020 12:21:34 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khtne-0007wI-4H
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 12:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606306891; x=1637842891;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=n5+yf+G4jtyyfJiBwh/frM58WJ0Mu3Q3RVyLekHBT1E=;
 b=TlIyuv9ashZDzMz8VbP6J5oSn6b7Ji1mIQgtonXvQTLqbmvqXLS3X9tm
 JrQFjAchKcG2VrHj0PB2lqWFSWEriMvefxdwDfSBymUaJT3xXdrCDCNd6
 b5n3zmtDHsTJ8tfaWZiMS24JVbamig8QAqGyBE4KxYQB5grBFCPHMYbH+
 HlNlTaW8YAtqqJah3rGwCsRs+ipQy7gcQHsp9Fw5jl4i0lZ2Agrw2P4jJ
 1o/8y6wwOawIkL8uA3MPwJaao2DvyluOBkoNGL7XQ1KGaLfvrzrlFGZtO
 gRALW1GDMfhbd8VRna3YQJ4dtntqub74KZwxXOYPOsLUcoQEMN8FhV7/h w==;
IronPort-SDR: DRPOhkSoGwSHiVtXQlUog3/lusaOIpH/glssMM5Wwtxx7FJzDcNzAoIvbd8xrxJBg8aN9c844m
 SNm4Hq1pFn3KFnVB3VdT9EYhJCdvdL2cELIwf+weLb/g4udm24Q4AccrTeHAS/EoBjRkF2EHzu
 m5BIFPsJnJBk6O7RInI/4UTN5TRNsbUuo5QyM81qbu7+xw2X0rZgzrlR1ZZC1Vq7D+c5A6KCBB
 rmod5cgh2BcTe8vzGCu92dZvTFRDpo1QlUpW5UM+H9t8iS60FT/T9m0KzBJHaRt6rnwxJY6qvr
 h4Y=
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; d="scan'208";a="99785490"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Nov 2020 05:21:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 25 Nov 2020 05:21:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 25 Nov 2020 05:21:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeU/gZDFkqo7t6LO2m6fHUX4QkSz4clLdw4a3yZzwey2mwO5DP80/OgL+6dt99AxS5BWAcGdJnEE/rPqYBdgZeEwgnuWJExIkVe3dyKuWUlkjZC3NU0gehu2gNBRZbn04MXxRQNp+0J1laitiNpeP7QVc20Yc8Y5giXdLlklJpknxYOQpXUHLxzF9V2ILHqjYvSSEUpbSKr/MB29liM4wlVKc7LpDjC20H8GHFJ2IqZktncydICxk6+fSOReURdhtd+QPGuCK0h57peJcZm2wVE13VHLU1TyuAkI8ikLhVMSuSuH4ib0Vo8gP8AOXpTeaXPOWcEiKPx4L2FcO1ms+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5+yf+G4jtyyfJiBwh/frM58WJ0Mu3Q3RVyLekHBT1E=;
 b=UyCMf5maXjU+WSzVvAkWBY8ydxfkSRJmmcgA5acWV5na6z5Ug1eTx1vHhT0CDweoVoP6EunMKvMGkx9wI1aDzSlNSuGVfnWlGYY3KVxIJfNXAhUv/L0Ib6Is3Pkb/8SB4geQ0sBJJP/YtAyDEj1IKnPZcvQuoNnhEAgFO21WUl3QpqDLKQzxmC+L85B5S4IvigkxbhnlCCy+/e41e42NwpZSdLKQDibSBqNuvJ33njFASEYFQbVnVXMHHkalGoG8poOomFHE7IGWSsSCx1dhqJGIsI6oLc4WH3gRHVkJ4YTREfTOEmra2Hd0lEr3yL0EmXhFqxPfaO9oAavfAeaZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5+yf+G4jtyyfJiBwh/frM58WJ0Mu3Q3RVyLekHBT1E=;
 b=f7wd1RvUTjPmLsX9FQ//Tc2c5jfnt/lICJHTOIluOUGERGGGHOgB3qTDKPW0xbYx1ieBDeG8e087fWNC2ZdZSzcTWjfCgOMBLrFZj2Qv1F/e6fO7Tx4UifjQWvH4mQXV8PCvGF0UwXZE8xg+YM5aSCCrOuj85buNiwiPeXigjVE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3389.namprd11.prod.outlook.com (2603:10b6:805:c8::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 12:21:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.021; Wed, 25 Nov 2020
 12:21:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Topic: [PATCH v5 3/3] mtd: spi-nor: keep lock bits if they are
 non-volatile
Thread-Index: AQHWwyV9Mln+2AGpp0CZylv8vNNFfw==
Date: Wed, 25 Nov 2020 12:21:25 +0000
Message-ID: <e9437b3e-de44-7b17-df2c-6a8502b48ca4@microchip.com>
References: <20201003153235.29762-1-michael@walle.cc>
 <20201003153235.29762-4-michael@walle.cc>
In-Reply-To: <20201003153235.29762-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 063359c5-1838-4467-9ad6-08d8913ca0d7
x-ms-traffictypediagnostic: SN6PR11MB3389:
x-microsoft-antispam-prvs: <SN6PR11MB338954E79989E4C32849BAB7F0FA0@SN6PR11MB3389.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zk6AMHE8OyFVww/9AECaxc7KN2l910XlCQj2xC9hL3rAN8B2pnofLsMSJ1Zg21ZfSX0IgXu9cErAFHNK04UQ5mwgnBlamz6yB14a4qItNK6Y8EadP3ItzwnjomWZecgOu2jZyy32CMN5gJxF2i/0H7oRkDpgjgbqfUIYxkSgseL/rgd04RyUHaDL7dsLXoKucZjfEvy4YW998OZnJYeav53CB+jRqfXFeLmT/F+qCsDQCW6oiTjo29NUqO2q76c+YUIhJwSlBl0fzR7+7qhhWDNdQiKRLTfw2TnHDnBDYkZc6EuSzeHz4SL0vuI6fkoKNVZOc7pPinfPED647EfVkYvR3mbtdAFCl3gUOtnz/rwe1iQD+AqPOnGN7CcDtyrvO8/2FYyBGQawwG6/NHh+KvhhpsZ+/8qx/GwC3KMtuSkl6YHdbrlCaSt4JSnyYhnkGKLRC3GuNT0/kglMYb4I2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(376002)(136003)(346002)(2616005)(86362001)(316002)(478600001)(6486002)(66476007)(26005)(5660300002)(76116006)(186003)(30864003)(64756008)(66946007)(66556008)(66446008)(31696002)(36756003)(8936002)(54906003)(71200400001)(15188155005)(6512007)(83380400001)(966005)(53546011)(4326008)(16799955002)(6506007)(8676002)(2906002)(110136005)(31686004)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bmg0eFZ6SVVPQmdrVjYvQWJjdGFWWGhWVFR1TGY2aVVCYmdSV2l1djRPSWov?=
 =?utf-8?B?Q09EMlBUOHpsWFM1Y2U1T2VMbVJQM2RYMkFjRGw5WHFXRlFaQkRLZEtZNUxk?=
 =?utf-8?B?UmF6UVZ5aVJaSTJhc2hhdlorakNsYXJQd1lwMjZ3Ni9RbXB0ZFN4cFBPMTJp?=
 =?utf-8?B?TGdwNEVobU9DQkY3aHZtTWRVaG5jQ0ZtcU5JaWU3QVVCdm8rMmxXK0k0bGhy?=
 =?utf-8?B?eE5SZ0JaMGxJMDdHOVpLZ0VWYm10TWNGQm9FSFIwMXFaRlA0bWhCakt2Qkwz?=
 =?utf-8?B?ZXBTc0NhMjZLblRlVVZiQjVhbHViNmpZdUpCWnY1ZzZpSWl1M1dCQjRCdGZP?=
 =?utf-8?B?K1V4TnhxZFEvSXl6UjFUekU1RzV0M1VSanF4VTY3VG51Y2NYbkNtcG1paUhp?=
 =?utf-8?B?MVpWQk5zcXFWWDh1ZWtsWFdTU25EWU5CVUlWQ1hUM2tDSGJHaUQ0UlBMWkdO?=
 =?utf-8?B?MU1Hd0R2d3VDc0kwYmpycVdQOFNBWWM3ZWZ3UStFeWo3L094ajJ6ZHZ1T09s?=
 =?utf-8?B?eHluZlVodlExelRtTnNJVnhWaGZpNnJXM0ZUNTdGRjk0Q2FyT1RBWHFuelJk?=
 =?utf-8?B?UVhEemV3OXA1NjI5OEFxWUJoMllWa0svNlFsY2pINnh3YjVVVXZJTjlmZG5Z?=
 =?utf-8?B?UEUzYm55SmN4bituelFUT2Q0NnFHOG83SHRnNFBvTldZZ1ZkR1lhNzFUZUhy?=
 =?utf-8?B?MUtOY05TTFpWeTNLWTB4VkRqNDE4bTJEMjEzcUFpT1hxNGIxREZ3SWo5TTJU?=
 =?utf-8?B?c21GOHUwUWV4eFp3bDJtTXF6RW5pSGN3NEl5STIwYzJKYlNCYmhsdFJmTXpW?=
 =?utf-8?B?SnpOOEpHMDgycjU2TnNFNVNtdGcveCtkMnc5TXZTdE1FR1V6RXpoajNCY3dN?=
 =?utf-8?B?c2RDdUkvVnpLbndQaVF1MWVoZ0tMaURTRS9RTGg4cGFNUXloejRYUVEySlV2?=
 =?utf-8?B?dmxmUkk2Nm9keXZhSlFXU1B0d2pYelBxeHF0bHlEMys3VWkvdXdWZ3ZQbWZW?=
 =?utf-8?B?cWp2MnRoWFltdVdubHk1Sjl4N2xMMG15bi9uVkFZcjh6LzN3Tk9ScC9lNWNK?=
 =?utf-8?B?ekcrTGJSdTdtTndmOEh1eUpzMTl4QkhSbzRtNk9GWkRxZzdOTm04R2l3ejRK?=
 =?utf-8?B?UnRzMWVNQWtFNUhMOXU3aG5CTlVNWkc1Y2JwaWJtNXFPSnlaa252M0E0VEN6?=
 =?utf-8?B?UVV0QmFUTURUa0YvVHhqTFVOZGEzNkJTSlFlT2xQMzBvZmo3TDMrWXkwWUVq?=
 =?utf-8?B?RXJRM3QzRG5HOUpHU2hKbndWT1pGZzB5aHdDKzEzTG0zK2x1R29WQ2hrbG1L?=
 =?utf-8?Q?pVvIMlrJffsJY=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <9CDE207036764D4E86D45E2FA9B47BC3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063359c5-1838-4467-9ad6-08d8913ca0d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 12:21:25.4489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAalG1SI72/1zyOKbQxsN+SxP5B+AcXoIC6qEwQU5xIV060+OqAFFscNJiLAcPeTR9JuOJN5ubKGHGx93WoB9BIe/WxgKbV68kFNhnZBuyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_072130_576156_C6451D58 
X-CRM114-Status: GOOD (  34.04  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/3/20 6:32 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Traditionally, linux unlocks the whole flash because there are legacy
> devices which has the write protections bits set by default at startup.
> If you actually want to use the flash protection bits, eg. because there
> is a read-only part for a bootloader, this automatic unlocking is
> harmful. If there is no hardware write protection in place (usually
> called WP#), a startup of the kernel just discards this protection.
> 
> I've gone through the datasheets of all the flashes (except the Intel
> ones where I could not find any datasheet nor reference) which supports
> the unlocking feature and looked how the sector protection was
> implemented. The currently supported flashes can be divided into the
> following two categories:
>  (1) block protection bits are non-volatile. Thus they keep their values
>      at reset and power-cycle
>  (2) flashes where these bits are volatile. After reset or power-cycle,
>      the whole memory array is protected.
>      (a) some devices needs a special "Global Unprotect" command, eg.
>          the Atmel AT25DF041A.
>      (b) some devices require to clear the BPn bits in the status
>          register.
> 
> Due to the reasons above, we do not want to clear the bits for flashes
> which belong to category (1). Fortunately for us, only Atmel flashes
> fall into category (2a). Implement the "Global Protect" and "Global
> Unprotect" commands for these. For (2b) we can use normal block
> protection locking scheme.
> 
> This patch adds a new flag to indicate the case (2). Only if we have
> such a flash we unlock the whole flash array. To be backwards compatible
> it also introduces a kernel configuration option which restores the
> complete legacy behavior ("Disable write protection on any flashes").
> Hopefully, this will clean up "unlock the entire flash for legacy
> devices" once and for all.
> 
> For reference here are the actually commits which introduced the legacy
> behaviour (and extended the behaviour to other chip manufacturers):
> 
> commit f80e521c916cb ("mtd: m25p80: add support for the Intel/Numonyx {16,32,64}0S33B SPI flash chips")
> commit ea60658a08f8f ("mtd: m25p80: disable SST software protection bits by default")
> commit 7228982442365 ("[MTD] m25p80: fix bug - ATmel spi flash fails to be copied to")
> 
> Actually, this might also fix handling of the Atmel AT25DF flashes,
> because the original commit 7228982442365 ("[MTD] m25p80: fix bug -
> ATmel spi flash fails to be copied to") was writing a 0 to the status
> register, which is a "Global Unprotect". This might not be the case in
> the current code which only handles the block protection bits BP2, BP1
> and BP0. Thus, it depends on the current contents of the status register
> if this unlock actually corresponds to a "Global Unprotect" command. In
> the worst case, the current code might leave the AT25DF flashes in a
> write protected state.
> 
> The commit 191f5c2ed4b6f ("mtd: spi-nor: use 16-bit WRR command when QE
> is set on spansion flashes") changed that behaviour by just clearing BP2
> to BP0 instead of writing a 0 to the status register.
> 
> Further, the commit 3e0930f109e76 ("mtd: spi-nor: Rework the disabling
> of block write protection") expanded the unlock_all() feature to ANY
> flash which supports locking.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v4:
>  - made atmel_global_protection_default_init() static, spotted by
>    lkp@intel.com
> 
> changes since v3:
>  - now defaulting to MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE, suggested by Vignesh
>  - restored the original spi_nor_unlock_all(), instead add individual
>    locking ops for the "Global Protect" scheme in atmel.c. This was tested
>    partly with the AT25SL321 (for the test I added the fixups to this
>    flash).
>  - renamed SPI_NOR_UNPROTECT to SPI_NOR_WP_IS_VOLATILE. Suggested by
>    Vingesh, although I've renamed it to a more general "WP_IS_VOLATILE"
>    because either the BP bits or the individual sector locks might be
>    volatile.
>  - add mention of both block protection bits and "Global Unprotect" command
>    in the Kconfig help text.
> 
> changes since v2:
>  - add Kconfig option to be able to retain legacy behaviour
>  - rebased the patch due to the spi-nor rewrite
>  - dropped the Fixes: tag, it doens't make sense after the spi-nor rewrite
>  - mention commit 3e0930f109e76 which further modified the unlock
>    behaviour.
> 
> changes since v1:
>  - completely rewrote patch, the first version used a device tree flag
> 
>  drivers/mtd/spi-nor/Kconfig |  42 ++++++++++++++
>  drivers/mtd/spi-nor/atmel.c | 111 +++++++++++++++++++++++++++++++++---
>  drivers/mtd/spi-nor/core.c  |  36 ++++++++----
>  drivers/mtd/spi-nor/core.h  |   8 +++
>  drivers/mtd/spi-nor/esmt.c  |   8 ++-
>  drivers/mtd/spi-nor/intel.c |   6 +-
>  drivers/mtd/spi-nor/sst.c   |  21 +++----
>  7 files changed, 199 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index ffc4b380f2b1..11e6658ee85d 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -24,6 +24,48 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>           Please note that some tools/drivers/filesystems may not work with
>           4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
> 
> +choice
> +       prompt "Write protection at boot"
> +       default MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE
> +
> +config MTD_SPI_NOR_WP_DISABLE
> +       bool "Disable WP on any flashes (legacy behaviour)"
> +       help
> +         This option disables the write protection on any SPI flashes at
> +         boot-up.
> +
> +         Depending on the flash chip this either clears the block protection
> +         bits or does a "Global Unprotect" command.
> +
> +         Don't use this if you intent to use the write protection of your
> +         SPI flash. This is only to keep backwards compatibility.
> +
> +config MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE
> +       bool "Disable WP on flashes w/ volatile protection bits"
> +       help
> +         Some SPI flashes have volatile block protection bits, ie. after a
> +         power-up or a reset the flash is write protected by default.
> +
> +         This option disables the write protection for these kind of flashes
> +         while keeping it enabled for any other SPI flashes which have
> +         non-volatile write protection bits.
> +
> +         If the write protection will be disabled depending on the flash
> +         either the block protection bits are cleared or a "Global Unprotect"
> +         command is issued.
> +
> +         If you are unsure, select this option.
> +
> +config MTD_SPI_NOR_WP_KEEP
> +       bool "Keep write protection as is"
> +       help
> +         If you select this option the write protection of any SPI flashes
> +         will not be changed. If your flash is write protected or will be
> +         automatically write protected after power-up you have to manually
> +         unlock it before you are able to write to it.
> +
> +endchoice
> +
>  source "drivers/mtd/spi-nor/controllers/Kconfig"
> 
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 49d392c6c8bc..19665095aeab 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -8,23 +8,120 @@
> 
>  #include "core.h"
> 
> +#define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
> +
> +/**
> + * atmel_set_global_protection - Do a Global Protect or Unprotect command
> + * @nor:       pointer to 'struct spi_nor'
> + * @ofs:       offset in bytes
> + * @len:       len in bytes
> + * @is_protect:        if true do a Global Protect otherwise it is a Global Unprotect
> + *
> + * Return: 0 on success, -error otherwise.
> + */
> +static int atmel_set_global_protection(struct spi_nor *nor, loff_t ofs,
> +                                      uint64_t len, bool is_protect)
> +{
> +       int ret;
> +       u8 sr;
> +
> +       /* We only support locking the whole flash array */
> +       if (ofs || len != nor->params->size)
> +               return -EINVAL;
> +
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +       sr = nor->bouncebuf[0];
> +
> +       /* SRWD bit needs to be cleared, otherwise the protection doesn't change */
> +       if (sr & SR_SRWD) {
> +               sr &= ~SR_SRWD;
> +               ret = spi_nor_write_sr_and_check(nor, sr);
> +               if (ret) {
> +                       dev_err(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
> +                       return ret;
> +               }
> +       }
> +
> +       if (is_protect)
> +               sr |= ATMEL_SR_GLOBAL_PROTECT_MASK;
> +       else
> +               sr &= ~ATMEL_SR_GLOBAL_PROTECT_MASK;
> +
> +       return spi_nor_write_sr_and_check(nor, sr);
> +}
> +
> +static int atmel_global_protect(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return atmel_set_global_protection(nor, ofs, len, true);
> +}
> +
> +static int atmel_global_unprotect(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       return atmel_set_global_protection(nor, ofs, len, false);
> +}
> +
> +static int atmel_is_global_protected(struct spi_nor *nor, loff_t ofs, uint64_t len)
> +{
> +       int ret;
> +
> +       if (ofs >= nor->params->size || (ofs + len) > nor->params->size)
> +               return -EINVAL;
> +
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +
> +       return ((nor->bouncebuf[0] & ATMEL_SR_GLOBAL_PROTECT_MASK) == ATMEL_SR_GLOBAL_PROTECT_MASK);
> +}
> +
> +static const struct spi_nor_locking_ops atmel_global_protection_ops = {
> +       .lock = atmel_global_protect,
> +       .unlock = atmel_global_unprotect,
> +       .is_locked = atmel_is_global_protected,
> +};

Skimming through my notes in 1/3, I'm guessing this will not work for any
of the atmel flashes that we currently have.

Can we instead return -EOPNOTSUPP for .is_locked and .lock and just write a 0x00 to SR
for the .unlock method?

> +
> +static void atmel_global_protection_default_init(struct spi_nor *nor)
> +{
> +       nor->params->locking_ops = &atmel_global_protection_ops;
> +}
> +
> +static const struct spi_nor_fixups atmel_global_protection_fixups = {
> +       .default_init = atmel_global_protection_default_init,
> +};
> +
>  static const struct flash_info atmel_parts[] = {
>         /* Atmel -- some are (confusingly) marketed as "DataFlash" */
>         { "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> 
> -       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> 
>         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
>         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
> -       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_HAS_LOCK) },
> -       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_HAS_LOCK) },
> +       { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> +       { "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64,
> +                            SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE)
> +                       .fixups = &atmel_global_protection_fixups },
> 
>         { "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
>  };
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2add4a01fce2..c40a7c1490d7 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -276,7 +276,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> +int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>         int ret;
> 
> @@ -906,7 +906,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
>  {
>         if (nor->flags & SNOR_F_HAS_16BIT_SR)
>                 return spi_nor_write_16bit_sr_and_check(nor, sr1);
> @@ -2919,15 +2919,14 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
>   * spi_nor_unlock_all() - Unlocks the entire flash memory array.
>   * @nor:       pointer to a 'struct spi_nor'.
>   *
> - * Some SPI NOR flashes are write protected by default after a power-on reset
> - * cycle, in order to avoid inadvertent writes during power-up. Backward
> - * compatibility imposes to unlock the entire flash memory array at power-up
> - * by default.
> + * Return: 0 on success, -errno otherwise.
>   */
>  static int spi_nor_unlock_all(struct spi_nor *nor)
>  {
> -       if (nor->flags & SNOR_F_HAS_LOCK)
> +       if (nor->flags & SNOR_F_HAS_LOCK) {
> +               dev_dbg(nor->dev, "unprotecting entire flash\n");
>                 return spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> +       }
> 
>         return 0;
>  }
> @@ -2942,10 +2941,23 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> -       err = spi_nor_unlock_all(nor);
> -       if (err) {
> -               dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
> -               return err;
> +       /*
> +        * Some SPI NOR flashes are write protected by default after a power-on
> +        * reset cycle, in order to avoid inadvertent writes during power-up.
> +        * Backward compatibility imposes to unlock the entire flash memory
> +        * array at power-up by default. Depending on the kernel configuration
> +        * (1) we do nothing, (2) we unlock the entire flash in any case or (3)
> +        * just do it actually powers up write-protected. The latter is
> +        * indicated by SNOR_F_WP_IS_VOLATILE.
> +        */
> +       if (IS_ENABLED(CONFIG_MTD_SPI_NOR_WP_DISABLE) ||
> +           (IS_ENABLED(CONFIG_MTD_SPI_NOR_WP_DISABLE_ON_VOLATILE) &&
> +            nor->flags & SNOR_F_WP_IS_VOLATILE)) {
> +               err = spi_nor_unlock_all(nor);
> +               if (err) {
> +                       dev_err(nor->dev, "Failed to unlock the entire flash memory array\n");
> +                       return err;
> +               }
>         }
> 
>         if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> @@ -3170,6 +3182,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>         if (info->flags & USE_CLSR)
>                 nor->flags |= SNOR_F_USE_CLSR;
> +       if (info->flags & SPI_NOR_WP_IS_VOLATILE)
> +               nor->flags |= SNOR_F_WP_IS_VOLATILE;
> 
>         if (info->flags & SPI_NOR_4BIT_BP) {
>                 nor->flags |= SNOR_F_HAS_4BIT_BP;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 6f2f6b27173f..99dd2e14142a 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -26,6 +26,7 @@ enum spi_nor_option_flags {
>         SNOR_F_HAS_SR_TB_BIT6   = BIT(11),
>         SNOR_F_HAS_4BIT_BP      = BIT(12),
>         SNOR_F_HAS_SR_BP3_BIT6  = BIT(13),
> +       SNOR_F_WP_IS_VOLATILE   = BIT(14),
>  };
> 
>  struct spi_nor_read_command {
> @@ -311,6 +312,11 @@ struct flash_info {
>                                          * BP3 is bit 6 of status register.
>                                          * Must be used with SPI_NOR_4BIT_BP.
>                                          */
> +#define SPI_NOR_WP_IS_VOLATILE BIT(19) /*
> +                                        * Flash has volatile write protection
> +                                        * bits. Usually these will power-up in
> +                                        * a write-protected state.
> +                                        */
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> @@ -409,6 +415,8 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
>  int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
>  int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
> +int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> +int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> index c93170008118..c2ebf29d95f2 100644
> --- a/drivers/mtd/spi-nor/esmt.c
> +++ b/drivers/mtd/spi-nor/esmt.c
> @@ -11,9 +11,13 @@
>  static const struct flash_info esmt_parts[] = {
>         /* ESMT */
>         { "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
> +                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },

https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32PA.pdf
BP GENMASK(4,2), volatile, ok

>         { "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
> -                          SECT_4K | SPI_NOR_HAS_LOCK) },
> +                          SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },

https://datasheetspdf.com/pdf-file/796196/ESMT/F25L32QA/1
Datasheet states that "BP0~3, QE and BPL bits are non-volatile."
At the same time, it says: "After power-up, BP3, BP2, BP1 and BP0 bits
are set to 0."

Maybe factory default setting for BPn is 0? Let's treat them as NV, as in
f25l64qa.

Do we need BP3?

> +       /*
> +        * According to the datasheet the BPn bits are non-volatile, whereas
> +        * they are volatile for the smaller f25l32qa.
> +        */
>         { "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
>                            SECT_4K | SPI_NOR_HAS_LOCK) },

https://datasheetspdf.com/pdf-file/967488/EliteSemiconductor/F25L64QA/1
BP GENMASK(5, 2), non-volatile.

BP3?


>  };
> diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
> index d8196f101368..c45ea0ad01f0 100644
> --- a/drivers/mtd/spi-nor/intel.c
> +++ b/drivers/mtd/spi-nor/intel.c
> @@ -10,9 +10,9 @@
> 
>  static const struct flash_info intel_parts[] = {
>         /* Intel/Numonyx -- xxxs33b */
> -       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
> -       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
> -       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
> +       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, SPI_NOR_WP_IS_VOLATILE) },
> +       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, SPI_NOR_WP_IS_VOLATILE) },
> +       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, SPI_NOR_WP_IS_VOLATILE) },

http://www.datasheet.hk/view_download.php?id=1561787&file=0282\qh25f016s33b8_649107.pdf
BP GENMASK(4,2) all volatile, all set to 1 at power-up.

You can add SPI_NOR_HAS_LOCK to each flash, and get rid of the manufacturer
generalization.

>  };
> 
>  static void intel_default_init(struct spi_nor *nor)
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 8b169fa4102a..5e4450877d66 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -11,26 +11,27 @@
>  static const struct flash_info sst_parts[] = {
>         /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>         { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },

Looks like BP3 is needed here.

>         { "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K | SPI_NOR_HAS_LOCK) },
>         { "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K | SPI_NOR_HAS_LOCK) },

These two flashes have just two BP bits located at bit 2 and 3. Probably will work.

>         { "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16,
> -                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK) },
> +                             SECT_4K | SST_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_WP_IS_VOLATILE) },
>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32,
>                               SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
