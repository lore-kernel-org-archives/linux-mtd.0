Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38213C47423
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:50:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B442074B
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x90TkuiM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U3gaz2hG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RGpqoUqS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B442074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z5JHTgx0BeCu6Jb9dIv/tQkuHkrEOH4QPNW888GHwsY=; b=x90TkuiMZmf8j0F5C4+x50C6L
	tPffwResgGfJUdEBnhM0wO53XHdB0aUhbZlxh5Km5EFvLH0Myb5j68jzu/E0MHSMRkUMwRFUqWaYL
	9qF8IlCH4xSJ8yj27SC/5pOxB0lWlNLkdN/x/kJWYVnLC99jgusdrv/er2V9bDKv0+UqhWx/flBWP
	Z27ug+iiPZUvY/48C+eyPX7uCgTxhH6emn9Qs2mJrgMSAcFiZUnJVmfI5mg8boCJkz1m/E6S4CQXu
	HybB9vZhMo2p10JraAnG92i/tmCNo2bzL8/DtLk7Gj1fsBO2e8eZvlAcZBMcVkF1h3ODiygS+/LGd
	8Yka4kuiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNuGx-000677-P3; Thu, 01 Oct 2020 08:49:07 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuGu-00065m-Eu
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601542144; x=1633078144;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eDcd/aavWd+1Gl/qsYt4xpv47esqlEh6owhOzkIV+3E=;
 b=U3gaz2hGVFczPeZfAKnQksYHotv1goIia0SwZsFKwa0KHRHMM9L6gkkD
 JpV0l3QOQB4HxaLl9AVsVyO+pz3myrwdue6lMkc3iqxkHl2IT96yniLwG
 KH1+nBvn23AEXeaAqSr0vG+iqM+TOeTVnKXK89A5CtoFgVkkrdxXVRDeb
 6ZNOcjHCIM0JJA4V67O4is5DkbdhDAJkKQgKNJkmSl5zhxRkrIz7dUdLZ
 UF24fbqyerVVY+th4dPUNHGua8Rb6qPTQU2V6lovFcrrO0WZaC5vlpJ68
 IOmbbFL2C4Oc+IEtFWH5BrO+UeWLEvIsjlqo51HV+RXhEEcdtZduSF9GG A==;
IronPort-SDR: 7Rm+MaAfkLLQWLlRvRmCPAgKvXWO5kZ7lnGyYk9jpm6Qe3kjRP90AhlIVBiSNi/DyoCtXpH+c8
 vrahKZXbKHoT9ZcXqjHJDSF/Ms9XWoePQHexa1eeV6g9CQTDXiy3ZE40uzJ+uD4nJrQrxhGNkC
 kROeNWOeXDE6Gs+BwyBp8b/83ci6Fm3WpMEVEzm5Es8sQjkNsyHqSjFOPGWvz9WG07uMc8vZ04
 TURECwWVDh/BPz2DWgjOFagdZWNkravXKJcJb4S+L/DnoQTx0URc+bes2ZAdCCto7hyWaoPVw3
 dFU=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="93045611"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:49:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:49:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9F+uzB0HKFjzXLnRRK3RFC/v4gIjXqBci8f6r6QBeNwBl0wMMzbRMFc1htlTfaQCem77oIzmrPz7KwPIe9W/vOkBnzd7UtCBjd/EQeTNy/mKXHblAy7e2/Rd3sk5I1g3dErQ7XXGD08yiaqteuw2iy1uv75Vi9VZhEWLN/hM9ajsGvY+j051pnNWlUiSNPiKyr3gwAatUBKAyj0FHTJMjfO2aKLk8bLsCgw3uqkPA8BRnyeWu9tNMafisPas/YiiiFWUgPBWNmGKoKCfz0JaMYRPNX2b/UyQ8pb/AoTrce6CuLz1nKaSl5AzdqiOSU/To4SfMWHIbXZ9pBpCuKIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDcd/aavWd+1Gl/qsYt4xpv47esqlEh6owhOzkIV+3E=;
 b=NZRWQwuJ5Dx5NVS+3jz/6j3cXk+7vZpT0wNkhn5y3nEzOd91meGIkjraU+CjyIo+hxd9Bm5GI8pt9BtifVVk+ieE8yc7cnxUy36I08iHesMcTKCYE2l3L7Thlw+NI00OxD49DKie+qv8h87q1nyoiYAJLJyQ6xMHlq8hkE4J0AWMcamMpGzE+T2MnjVJZMI+NPgagNV+FKtB+ekUul1Qv7xSqvfTweybq1dQiEVMnBQT786vRFt7DCUaGalailKJRyyWCFh20lGP93PcnM+Aw5DruIQwJJ8DS+jrrpnVB9o1K7hg6kdnE/sEdGfP6ySqR/46JNVJu3nqq0VV44KLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDcd/aavWd+1Gl/qsYt4xpv47esqlEh6owhOzkIV+3E=;
 b=RGpqoUqSStq38uzX9uD+hlASx6DhAAC+tzkAggmSuyfTuOOidrUGuq1Ky4LhxI4zz0uZcXRCHwNDiheCYOyAh5cQCgzSSzBFbWegVpPblA16q10jDrJMofTBAN6Jj1RB71i3DQxaVuznLVz5IgvLS3lKziqzqYyr294R855jb84=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR1101MB2154.namprd11.prod.outlook.com (2603:10b6:4:4e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 08:49:01 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:49:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v14 03/15] mtd: spi-nor: add support for DTR protocol
Thread-Topic: [PATCH v14 03/15] mtd: spi-nor: add support for DTR protocol
Thread-Index: AQHWl8b18X9JWcT5zkKq1MM32MT8Tg==
Date: Thu, 1 Oct 2020 08:49:01 +0000
Message-ID: <2a34630d-1159-e678-1596-035328f412aa@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-4-p.yadav@ti.com>
 <67f14906-ef28-ff4c-b41f-3500c9212ad7@microchip.com>
 <20201001083737.iacunfb7l75elvex@ti.com>
In-Reply-To: <20201001083737.iacunfb7l75elvex@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9472962-2711-46c1-27b5-08d865e6d83b
x-ms-traffictypediagnostic: DM5PR1101MB2154:
x-microsoft-antispam-prvs: <DM5PR1101MB215451FFBE23BDD52CFAE2C2F0300@DM5PR1101MB2154.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WbLf0iIVayaA0Ve6jc3PgEXrHn43WjbW2pDnmbn5XPD0RfRB9fpObQBjhrHM5Lv7RlKYxKnW4jB156KYqRaKCbVUEe2NvLLdvjpRUfObu9IisltqHT5aRNceXzCSkcVOBJvaxcpJOfugr1h/sFlyG6Jf0VAjgBTKxECYL5fnTqES29W2OK/MPDQ+kLz4vWSMKv70Nwl66fpXbZxNay/URPzMArauyX8vsqzbMx+2E7ylhbd6nHuM9vtoRGMvzOdL0uS8vereOo3Ymbe6kznN3lOY8H33/HzqTs/FJjRwoIDjqUkaUrmCxBScAycvj2qZi7ZFYajTymRwH8Rb+duRD1MCnkAd2VPnhFQKuDVQbNm8WSZeR0zvFEytcfIsl8CyKYjCS7rVmVjLgBep9sU8gslxFV4URlc977BOMW9oQlQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39860400002)(136003)(396003)(4326008)(54906003)(76116006)(66476007)(64756008)(478600001)(316002)(71200400001)(91956017)(66556008)(66446008)(2906002)(186003)(86362001)(66946007)(6916009)(26005)(36756003)(2616005)(31696002)(53546011)(5660300002)(8936002)(6486002)(8676002)(6506007)(31686004)(6512007)(43740500002)(352734003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 509z1soEmZeTjqfQxCSzF0xLGZk6GyFqbow2CvnV+HcbEkXN/mw2PbPO39fWTfV3bW4NVTCli431WzwPvMKYTlBW1gkKz4BoWVKNgXf7I0ZoiFbiB4E0B4OocVZra5FPvKz4fTl1yJHV/zeWuwciI5+NyHdM64bDsMSf6p9frcNLi0YW97YHIzc2h2VboM9i79JlHSFwARYILQ91/1fyWlIDIoqFK9uxlncvVUEP3Q44IQnB6iDVnJlGO/EtAUuHtKs8Wn4xfDPwpx7Aw+XQ0zQk8C0gDYfWPKruyLV3ytD5CtwQgdaqGF1RLnaifTa/aFG+0grip2eY8w295xg7S0BjuMSWJ/nDi+x4ErRltjo9uH7WoJGnALj06H8MxzaSCyND9Dk6phs/awXH4apxotwn6StzAtirRqBD88hUUNtmsVHSccUIGXfXDg3Cd2n/h5z9P05upoa5mF27P/revwVUwvDLIxXNgwJs+R5nG/Rp9EyWkETX+EASk/jSIbseX6n1azK/9jJNlyb3B8CwFn0XH00INawfD/fAOMrts5uBszEpR3ofFW4VKJKxhIEdfWYg5dazxG0gCWSUkgAMe7+tN38NPYnAz+N+WlxZHBl2LJ7Ipzqjlt8Go5iSoiM6wPIrgz303bNerRfXk4Bjyg==
x-ms-exchange-transport-forked: True
Content-ID: <1B21B636603C92459ECA51454C15DD1F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9472962-2711-46c1-27b5-08d865e6d83b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:49:01.6954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvt/C0uXFqN2Opi99/kA1ImkM0SIWtR1I+7puZS80nDZowYDzsYpPmi1UQWpJSezXV3F5BrGd8xe08vat8fXaGwfj5G/j++MR8NmG0NxU70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_044904_679574_62EFF94B 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/1/20 11:37 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 01/10/20 07:46AM, Tudor.Ambarus@microchip.com wrote:
>> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
>>> @@ -2387,12 +2496,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor
>>> *nor, u32 *hwcaps)
>>>         struct spi_nor_flash_parameter *params = nor->params;
>>>         unsigned int cap;
>>>
>>> -       /* DTR modes are not supported yet, mask them all. */
>>> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
>>> -
>>>         /* X-X-X modes are not supported yet, mask them all. */
>>>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
>>>
>>> +       /*
>>> +        * If the reset line is broken, we do not want to enter a stateful
>>> +        * mode.
>>> +        */
>>> +       if (nor->flags & SNOR_F_BROKEN_RESET)
>>> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
>>
>> SNOR_HWCAPS_X_X_X is already masked out above. Do we need to do it again?
> 
> That might change later and the person removing that line might not
> remember or even know to add it back here.

ok
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
