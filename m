Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E6FC352A3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 11:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650812082F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 11:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WS5+jaix";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WbIurlSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650812082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+b20TUqebXn57hQEYA0K1HKDO5Qp6PuGEwz/G7Qjrew=; b=WS5+jaixeKH5n1
	qcf4JPsSRPPw7yrzcUIfMHFhKEECpSLrey2SVjirjIRNZVr18l3qYuJPSSF8T9KDdwMwN2Twv2GzN
	40y2TzgsZ6H23UGdJqRzVKgwqslCgTtC6Nzy1QgBHrqNchd3mcjDpJIuS4ykyMJn58I77qztkO5+y
	zbYbuDnOQ6Eio3fkcUjzVNE5scrqvOKU6yleVqLnjmp5LhSckyCQOSk+7FAHdyfydnfWapCCfZQEO
	Q3UNuqiy6CIgu/9fpLS83vBZqgWb4BFn7qZVzuTIYSuWES/5N7NurCOM3YtEvRYPD061Nqd+DCS69
	hHXGnMm5ak4p8eWCCh5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j17E4-0006oc-4L; Mon, 10 Feb 2020 11:27:40 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j17E1-0006ns-Ds
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 11:27:38 +0000
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
IronPort-SDR: d6t4f1uyTGwdGyUBbJWaDPytAuFKrjrFDfFeI9ciQADxVapo4IkfTNKq4NPR583FKDnK/x/BlE
 yh5KreE3ZamxW196ypOe0pXwgFHc08wP8B2R7JoPNcPSy1TiN1iWo6OUfbQgqbYSWtuCbO0/cC
 23F+hC0DiAdkUaXt0wGEdORxFcRZD3z3X7Zsz11lNvndiwC7BIhV5ye6y9hi+4sk1pFHCQ7lQN
 pYhm7dQk3kJZu8rFZJyr9JLpOPn1BRs9ABQXJKMgXCUAwaK0Fc4fyBF0gernImEQQk5xy3e6nG
 PNc=
X-IronPort-AV: E=Sophos;i="5.70,424,1574146800"; d="scan'208";a="63669047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Feb 2020 04:27:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Feb 2020 04:27:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 10 Feb 2020 04:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmn2AV5xyBhcz1Y5K2Cosx/VKiZp2JERvxi9C1BhofdcZ30mKq6jsG1ulSWgZ9ADNVrbf1IyJqW5PL8UWE3gKZ7pQA255Jlun2LjSnSVZoMF0yNPMOBGJahp+9xULjpyd2lFhdSSooUeskGxPcyyfUhxuw7AA6x5jUTHjVLN0bdKv89XusmwoHkINRY3CCaa4590qyoxCmlQvECoWn4R8TJD9Vinsp5Ia0F9v9ZiXs43vCn0U5nJ1yPZyYHvCVuPiB0+Kkyt9wuTaDLKMZZ0PSC0bBsN6ET0+lYrAG6P8xgHZjwbX2bP0jiqF3uFSIg3mekQmjhBqC+1NyK09e/SIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKQWsP0HeYk3dOcuyMyZ7EgyaQGpRxyEbcOojdJbmBw=;
 b=Z3DUy/U9qg3NjgGKn7jGnG4rm5rqKynfWsSzMntQtrngT1yIBf1pnvb3OdegS26rb3dk7fEO1cHGE4gtA2EioH3eMU3hBpVAoD9n62t5so0RpcuaEAxPoRatB0EzB/PQsAun4qgX1V/tPM3FUEVTKBXLOwyKC7furupzWBd++gbtLW8Yt//BMoK54j6bSuFifjur0X0Z9dl3lKe3nKUKxpejpKSCByIfWUB/Y0IDqpJdfyxawhL/DIzYIZOMPi0i8MbK96WJP/9tMUjRVb1GtHiUDrpqmb2V14Bgiz38CNphG/B5fGaL1IINKmH92AqkKuaLuZgGXRRuHzcrhHbtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKQWsP0HeYk3dOcuyMyZ7EgyaQGpRxyEbcOojdJbmBw=;
 b=WbIurlSoPduI/FmsoBXyr8RohcmoF739mbXOSnEyQZTKxd/WyiKy5Hmw1UXy/ajC0xL553GcCBWQR8IbZofkvTcHIaL0L0oK27zW63wgeJX7TJGeF8RNKs+htQoxJ3RLtw2/CcEPyXYSPMnClClcTCVW94cyR9jhLB2F3iLZwsg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4414.namprd11.prod.outlook.com (52.135.36.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 11:27:26 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 11:27:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV3bCHi2pGqMNGHESG9Z9T0h6ocA==
Date: Mon, 10 Feb 2020 11:27:26 +0000
Message-ID: <4425106.vomQgZVa01@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <2959960.PApuY8DcOC@localhost.localdomain>
 <d7311f0ea1d0142a9523548bb3562f1a@walle.cc>
In-Reply-To: <d7311f0ea1d0142a9523548bb3562f1a@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51b69f44-2991-483e-ac6d-08d7ae1c3516
x-ms-traffictypediagnostic: MN2PR11MB4414:
x-microsoft-antispam-prvs: <MN2PR11MB44140C3ABA42D0955CC7E619F0190@MN2PR11MB4414.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(316002)(66946007)(76116006)(91956017)(6486002)(6916009)(64756008)(66556008)(66476007)(66446008)(6512007)(9686003)(5660300002)(478600001)(54906003)(4326008)(53546011)(6506007)(8936002)(26005)(186003)(81166006)(81156014)(8676002)(2906002)(86362001)(71200400001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4414;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5paCLaDVxadv3fLTByhR1aj8KvzN5lhyoZ2o8NBbSj7Cbgh7YDbeipt8LgUq+zhX1a6q+aMPT7OPjdpDGn0FbI0pdyAh0v6b4fkAWl0sz93IUldEFtWZgExQXqUVSWOlr2BbQzSr79yZmKQ5DjrMm78UsISmcSTxisMIMyN7GJfC8DetTUJoUE5zyTovmgxXxWkf7GthYraMxtCbEPQLSXYp8HHrfplX+CJ5AT169e6C5W3Jlu4SLseEmYmTFA+FrCq2HtVLxCwL+eOqfvoochqiEwDTpy2d2L5GR+jxF9Ne9TgyTdgP1k8bqIyKK4aWOwS2krkm4hUrriDU4hvRnMNe7i3Isgvpk0J/5tqa6iKnkz4Jz6Fq4qlQAfq/10oIYAwfIVwkyFUDuuLok4UA2Uo7dz1mwxM97fD23T55/jWvnUxzZHs4ZGPkJ7k6R8+HMCxOAKy5luOyWYTDDLx3aBCG0KWb97YD4aN49tILR98SSBRgAzsluDYfWwq86v0N
x-ms-exchange-antispam-messagedata: R39hCtRJ0HAb/lhGD6PpZXGRjgYA5EYE7fpssNsl9vEanQNDFT0Itz/4uvHyfAMRHJM+CyMiwUT8YlsT1F/2Gq9lUACqps0QWumuBH25qN5KXP+wxCPcJOsWWpFlzHbA+OzX4G/OedybEiwHXbOBlw==
x-ms-exchange-transport-forked: True
Content-ID: <AA4E3EAEC2BF3445A224D5CD540B29B3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b69f44-2991-483e-ac6d-08d7ae1c3516
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 11:27:26.7241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEgNjUPvaONFI5cVb8tYVcrWOmME/PuL1V4t0Lt49ojPWzWaxk5/DRI+rtfsn+/RyuuAC5WOKQrFJVmRMz5uOtfGECI0CSaGAdgBBkwPAvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_032737_506431_9A2C755A 
X-CRM114-Status: GOOD (  14.28  )
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

On Monday, February 10, 2020 12:40:59 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-02-10 10:59, schrieb Tudor.Ambarus@microchip.com:
> > On Monday, February 10, 2020 11:47:23 AM EET Tudor Ambarus wrote:
> >> > btw. we should catch the two special cases:
> >> > - lock none -> 0 (that was already the case)
> >> > - lock all -> all BP bits
> >> > 
> >> > The latter is important if "bp_slots_needed < bp_slots_available"
> >> > because there
> >> > are multiple settings for protect all. Most flashes will define any
> >> > remaining
> >> > setting for "protect all", but I've also seen flashes where the
> >> > in-between ones
> >> > were undefined (not mentioned) and only the "all bit set" was protect
> >> > all.
> > 
> > I re-read this. Do you have such an example of flash? Aren't the BP
> > bits in
> > this case marked with "X", i.e. don't care? If not, probably we can
> > mask out
> > those undefined slots.
> 
> There was definetly some datasheet where the remaining ones wasn't
> described
> _and_ there was no X (don't care) bits. Unfortunately, I don't find it
> right
> now. That datasheed made me wonder what the other "undefinded" cases
> would be.
> Probably it will also be "protect all"; I just mentioned it because it
> would
> be an easy special case to handle. I don't think we should mask out
> anything,
> either use the slot in between (ie the one which the formula gives us)
> to
> protect all or use the largest setting (ie [TB3 |] TB2 | TB1 | TB0). And
> given the reasons above, I'd prefer the latter.

I'm fine with using the largest setting, but we'll need the proof before going 
this way.

Cheers,
ta
> 
> >> This case is addressed by using bp_slot_count and bp_slots_available.
> >> We're
> >> in the else case from above. From bp_slot_count up to the
> >> bp_slots_available, those slots are "protect all".




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
