Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379ABC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LojifZc56UzhtjHxB/7dKLUDwu1SgC8ozYTf9ut4cCQ=; b=GNBjmiKjcNSHnU
	9jwb57g+iTtRpPgMJQevciWzRHmmUfIUI4lv03FQKhlRFkcza3n1W7GEV5cbjCBh3Cb4bzUugv69/
	xVBX1Veoxg7l6op9iW7BWFN/lSEHGcTmlS0ly1+TIeR17afhmxCCAqrGaKpSpgx8RPI9/I2nu9PvS
	KhBAgF5fbhyfM8YchEWvJguBx7Gdw/33DOYpMMJjP2BIITkRGGd20OYLpXbhNr8m4yybZR2enqn2A
	kevpZMH4xqLb2UFbL0zDAYGqVEaJM36USGyIdkRxygFgkgKMnE+pN6jXQJAN5jh4bQ5BrSkQUDzVB
	pmHlfDaTiC0tpJisfb/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI0CH-002RCi-3G; Thu, 10 Feb 2022 03:32:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI0CC-002RB2-7K
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644463956; x=1675999956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iKcOcsORepjWY+32aNr0q/MyoTMtrxD22KkDoY84Dzc=;
 b=Mwta2nqFmzFl4WxVM7eoaGUbAjej6u9tp5lzX4wW7swqxIkWxmU9wY0r
 h9vq1fZVirXEbDO1z7hxA/AQtNQ2tFUVhWXC/g5+R10t4h6llQRJ14goq
 kgMnyYDmda4pbhHaReb+ifTy9Ai/jKHDEGWOdqH0sflg7yIMAyVTWrtAZ
 8bSsTGR62nlCZgwTYRUTdtOIkES+zIhQeUmaYgqGqroEfQyeCRj1kK+Nx
 2KkGVF1r9cDLfipamEQvl+c/C4bHFK8GON3clqk5g8mISJZxR9ESb1DIS
 /nDjM4sr8Ro2NaG4Xd5mADpwahZuU1vBm2HSaAyDxVnHv1+UfEGx9mhae w==;
IronPort-SDR: k1MrUron4G2arthh5lgAAqR1Pfh2P/per0e2RapVJD4deyvQkpPfOPMGsatTtuykqcMPt2zGrc
 kI1bPe3wa2woQ/aT+Mad+vpsZDaWPBu1Z7O/CBuD48Tb+vXHcI0heEkFWKB+qJZQz1gyW1isNT
 gprNhKqCekHSDeJ+nWcpj1iSPaWj1ytKQx12z8rIEj2XRvQ4imsN+m479PinS5hVST/bX+q/qC
 YrtoaKqH/CBjxMykNcV2UchwaZ0hgyIRxVlVk4l05YXEKxQiCZs03bJzB/VZnHWnnVnvWYOFTD
 TBDbotvBBPVivZHl868oHM8u
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="148222667"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:32:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:32:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4NxkjSpTD1TUV6WCZURuLDaLeio6S3LCYTh6sgatR2iDKtyzubKSMdiKoTBisGWDPPkJI3D2wjZ+doudppzJ3MtPnQ/Mj4DKZHSY8bNoaDhZR9XRAjqKTky+GziIClzT6o/rMOaCK0sqiVu7ZGGtDEXmFM1WXfuqyj6RUOdbFgEvKHy3l364gYxjS9/BW5wEmn4wdQ1jmlzBLwNfBB+WmNDfbL/mQnUbF04DAcZ6pnRxYs2Knlz6O8Ibtof0Du9xSsDhSx6qjfs30myQw1jYiDKTisezDhBAH2BMw+xbR553RIsxaAp5KzK5CrnQyWQoKGIOQfHu+7b3KQ5mkvtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKcOcsORepjWY+32aNr0q/MyoTMtrxD22KkDoY84Dzc=;
 b=CBLrMROSGqIxmkcr5Pk+GLCxYf+CmzEf9ZFYjhYqpOZ5JXjoufmUxnvxTt3w5IHXTdOPJQF+1RcHjaz8zjnELcEz1O3wSZsHgTGqkwvTANGC80/lEgZ1QxTcZh99LlrG69hfGH+uCQA95u3oAkVusrgLN0EeF9orrqGt3lBSAyReBlThWE05oKcDhs1c34Evm5jwEFkRoXUURQYm83TXfJk/EdzeRA9QSLqGAUDLfALoFCdWckYmuy7Vmqgip0KzBNe74C3dl6lRgKN8h/pVWHYUJMhmPrOutAjlDVj5WdSPVMJnoK/08UcrKoksfCihZ3SSFYouSbnAR6/nAT2nWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKcOcsORepjWY+32aNr0q/MyoTMtrxD22KkDoY84Dzc=;
 b=ccyvbIX2NzqeOfgA8PMJcK9+ebRA581CM3QxSwdYMw0RtpVaw2zxk6ITQiC1w25018ocVHoBk17DzNoEEdhkWYOFFqpESbIsoxxQow79rjlPSn62hLqIN6G4HSRorNibesXpLJbconQACru4/7MP3DJRcAD7i6ZajTa56hJNGw0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB1411.namprd11.prod.outlook.com (2603:10b6:404:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:32:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:32:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 12/14] mtd: spi-nor: move all spansion specifics into
 spansion.c
Thread-Topic: [PATCH v1 12/14] mtd: spi-nor: move all spansion specifics into
 spansion.c
Thread-Index: AQHYHi7Q5oxQqD6pCEyAdlkry9WdSg==
Date: Thu, 10 Feb 2022 03:32:22 +0000
Message-ID: <ceef013d-a337-0059-6207-b30d2274d5cb@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-13-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-13-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce840587-f0b7-4422-98ff-08d9ec45f334
x-ms-traffictypediagnostic: BN6PR11MB1411:EE_
x-microsoft-antispam-prvs: <BN6PR11MB14117F393C37CB0960F45EDAF02F9@BN6PR11MB1411.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VRrqG2erBlFwbng8LFeDH9ZVtYM5iu8AmhFgke8uzpuWm1J/xH7+PGwi4Jx6gYBfdKdONu9WATpnIwi8MNe+UWu53pQeLtz9De+sm2TenEu++9fhAQgtG9EDv20kfVnNSu4ocIPBThqXhoIf4NWJQQNr2kAgWgG8mfcCnCOU8Vzbpy3eyWxMw+ELPatkbqSeFk0T5WxRWMoVTjIXrO84/sioihwfBwIHrWg2VoWrtmncmDvLnI47Emc9l/H6bKdCyehwNe+H6Bq6n0UtrX89oOBqeAtfB3OKlYxPjojLBWSU/2CpNyVWSO/xcb8epedLC+ETUm2NjDYhLgzaojdLfs4LjCjlR+BTYFpGjwYfz8BnMCYpoQCgRIFtpR4rASqIiybm4ecsyikh39iN0cJitWtXeud/Z6uGh3ob5zoYsYi4MwjrqPSnGrX8haCJ18/H4RqjZVgYcAVDLT2lJ1zJRzrllNnbxIAj8RX1WPBCpcMjbtYx+2ADYb8km2aar1KKMd/7J6KTYI0RQRDKX22EeggQ9aDz5amB/xIvccwtSxffl40MwYbSsATPnFOc3OSXwA1NRbxhT8hyVqBNqvmxKIoAV1nIQVKa9Y3XENlsTo2SfOKDFRffvkr1+nCpdaJDYSJMjhrUUkO1B5tSz7BpY2EhzPW+FFysOr6popR7aHXlM4ir/E+CS5d/ANSwrqHbqAA0ft3ysDe6x59pqGzCTFsqi895Mbpv2eBMXpeKd2G67+gzVcYdLeiZ6kOBGkWHJw2UsFlyyMUD1zUEiArY0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(5660300002)(31686004)(122000001)(31696002)(38100700002)(36756003)(76116006)(316002)(66556008)(508600001)(110136005)(91956017)(66476007)(54906003)(66946007)(38070700005)(2616005)(26005)(186003)(8936002)(8676002)(64756008)(86362001)(66446008)(6486002)(6512007)(83380400001)(6506007)(4326008)(53546011)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkVJL1grWFNaNENqeG5PbGNYS2MvQ05HYmRTTUlCQTFkVVJVS3dJdUthdThI?=
 =?utf-8?B?K0dGeXVYOTFYY2NVUnNVeFBaRjd6K1FKYmgvRTh1aHJIM25uMUg4THNHT0dX?=
 =?utf-8?B?Vk1jYWhtZWZzb3lFODQ4L3pWY0YrbVBWQ05xMTEyMEJMQTdVUG15WUx4UnZ0?=
 =?utf-8?B?am5LNzJGT1VVUWlqdTgwUHUzeHpER3JFV2RRV1dkdnNaS2VjR2ExR0NqcTFI?=
 =?utf-8?B?UXJwWDk1YmFlWTJLdUg5NTJ2Wks3UzN5cW4vL3ZIL2kvck5PWTVEaFhaTGRO?=
 =?utf-8?B?eXk0SFRxbjh0NVR3Z0dhUVFBdXo3ZStEVTN3UW5kNFJvSE1uNWc4V2t6WHRk?=
 =?utf-8?B?YVl0b1h4R2pCbzRIbVl6L0Z1Mit0aWlzcGsxUTRMYVdnaU9saytidGVneHVt?=
 =?utf-8?B?eDgrOTFUbmxIUEgreXhCWW5hS0hadk9JOHI1NVp0ZUJ5WTliT0w0VG9SaWov?=
 =?utf-8?B?eUNzNWQ4cU9OTWNlS3kyYTE5dUtMWGlPY0p2WjVUWlMzTFRiUjAwMlErd0N1?=
 =?utf-8?B?V1RRM0QzYWJhZU1taGhmMDR0eVYxS0EvN2lyYkk5UmJ6ZFJnaHVWRDF4bVRB?=
 =?utf-8?B?R3VMOUxIcStEUGVrdXFzRHBTMWxwV0xXSmdoRDZMQ2pvd1Job2hPckg1d1NC?=
 =?utf-8?B?Qm1VOXdSb3hFeVc4THpwWGFhdjV3NlNoQVhGWVRtYm5CS2ZnU0t2ZjMxRGtU?=
 =?utf-8?B?cWZMdEg3eTA1Wi9scnpCOGJMd3piWWhKN001SHRxTGRUTW5uR0FiTUhwU0pW?=
 =?utf-8?B?VFRtc2xxaHZzRmMrNit1T1RRQTZKQXVmK2N4RDlTbFBUUGFWdjJoMW5ZSUJx?=
 =?utf-8?B?VXJPdTVoOVZqenBDTWJvSFJnZXFhaTlVdGNHRkJlVVl3V3lSMDYyeWRSL3Zl?=
 =?utf-8?B?Yi9hSU82TDJ3d3k4aklnallZekdyaDJBSk5VbzVzNTBwYmtzRE5lZDlYTEw4?=
 =?utf-8?B?RnovdTcrWXgzaER4b1diSVh3aUQ5dU5NQTk4aUhQZWxvZnowSGFLSEt6Zk5V?=
 =?utf-8?B?YWdSa2ppdzlOaldhUlA2RTVwZUF4dE80L1RCWGE4eHFYSnhvRUd6Yk9HWC82?=
 =?utf-8?B?UGJmRHhFbW1raTdJdE9VWDJXYy9ESGlqWnNWYXRCd2xxZHFwZWpVcGRUUENT?=
 =?utf-8?B?TjZOdnBnUnJzTDd6V0dHZ2VMU010N1FwSTdQSzUvYmVmU2k5UWROQno2dXlR?=
 =?utf-8?B?VU1tWjRCalYxWVY0VWZYSDdqY2o4L3p1WklzSUhORDRnVVlzZXJQVEpXREtM?=
 =?utf-8?B?Q0thVnFDTmEycldNQWJPS2RhZzd1bk1QbW9QNUZ1K0FXenp6bmJkWHJZVFpz?=
 =?utf-8?B?QTdRTzJFM0o4MnpXb1l4Z1lWV09RQkV5bTRTS0FpTkJEaGg0Rm41MGczQ1B5?=
 =?utf-8?B?QW45RmNWNDhRN2xtSkZmTEhTdTBmM0Rua1lhdVBET3NMZi9kckRhYjZHSFlZ?=
 =?utf-8?B?MWxxYnk4NU1aVVpFNzZCZlpoeTJtdlNIZWxzNXFmL3dZSWxEWGlpWTkxYlU5?=
 =?utf-8?B?TmhXNE9zOW1BMmpwZWsxaG03NVBRTkR0b3V6MDl6QW9XeFNSRndZZS83MWFs?=
 =?utf-8?B?bUNVYzBwWWw0WFlkTFB0WmFDNGtLcHJEVkZhMTZDVDZXTTE3OEhhTnhxQUo5?=
 =?utf-8?B?N21yRTBRTmFLR0FZQ2xCa2cyK3gwbll2NFYzUU56RUVsbzUrNXFMeVNhMmt2?=
 =?utf-8?B?Q1FzUUkxMld5RG5PQmlVL0MwcVk1dGV5ai9PbXArT1NsVFovejdDb2p3WlA1?=
 =?utf-8?B?MFFJNU9XbXBwYlZNeENHUitVbzdGU2hjLzRhb2JhZDVwZG1yZlRDN3d3QmFI?=
 =?utf-8?B?UWNoalI5S09lelczZ2RwTE4zdTJMWnhFRE5kTzhhbW1hZVFKN3lIYlFOaXYy?=
 =?utf-8?B?NEpnNkFpTDdubXhRRWJPY0Q3RyswdHZ2ODdQaEttSi9EZC9CVzU1ZUF5T3pC?=
 =?utf-8?B?aTBGVmZKdnp0VGlySjZkSGRBMCtFNWlVZnpNZC82b1kySTdMa3dUT2xkeVE1?=
 =?utf-8?B?UFgya0RDY3VxVG84RENZaXJBUmttZzZLM044L0RVSEdkT0lLRU5aMDN1K3dt?=
 =?utf-8?B?bnozSnpRRWZsbzBRcG5NYnFJOXl6T1ErMkFQa0g3eVRUa2tob2t4VVB1OHlX?=
 =?utf-8?B?UnF4VEVyN05RcDBOK3Q3WWhGQXpiRGRlR2VBOGtGNmhiUlhtQmdYR1FFU3Fm?=
 =?utf-8?B?YWVub242SSt4ZDVOTEhXNG9mQ1hZSzdsaG54bzFOMmdYN1A0L1FXK1BVSFVT?=
 =?utf-8?B?MTVuWXRoVi9WUUZqV1QrQkNxanR3PT0=?=
Content-ID: <A42FEEF7EDACF243B65DC76E46C43232@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce840587-f0b7-4422-98ff-08d9ec45f334
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:32:22.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOSR6bWmD+ljZDPth33mi1EvFVnsyK9xq6513X3rCVEjMpH3FsbBAE4UNzTb8+bFSAhBqJiu4wVKMk+waJpdr1DvrTfgpVYEPK7k96rjB7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_193236_412509_003D5EE4 
X-CRM114-Status: GOOD (  24.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The clear status register flags is only available on spansion flashes.
> Move all the functions around that into the spanion module.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c     | 52 +------------------------
>  drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h    |  1 -
>  3 files changed, 72 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index be65aaa954ca..5b00dfab77a6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -554,33 +554,6 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
>         return ret;
>  }
> 
> -/**
> - * spi_nor_clear_sr() - Clear the Status Register.
> - * @nor:       pointer to 'struct spi_nor'.
> - */
> -static void spi_nor_clear_sr(struct spi_nor *nor)
> -{
> -       int ret;
> -
> -       if (nor->spimem) {
> -               struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> -                                  SPI_MEM_OP_NO_ADDR,
> -                                  SPI_MEM_OP_NO_DUMMY,
> -                                  SPI_MEM_OP_NO_DATA);
> -
> -               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -               ret = spi_mem_exec_op(nor->spimem, &op);
> -       } else {
> -               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> -                                                      NULL, 0);
> -       }
> -
> -       if (ret)
> -               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> -}
> -
>  /**
>   * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
>   * for new commands.
> @@ -590,33 +563,12 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
>   */
>  int spi_nor_sr_ready(struct spi_nor *nor)
>  {
> -       int ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       int ret;
> 
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
>         if (ret)
>                 return ret;

:) don't change style for no reason. What's wrong with the previous version?

Anyway, with the reports fixed and no hidden style changes, it looks good to me.

> 
> -       if (nor->flags & SNOR_F_USE_CLSR &&
> -           nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> -               if (nor->bouncebuf[0] & SR_E_ERR)
> -                       dev_err(nor->dev, "Erase Error occurred\n");
> -               else
> -                       dev_err(nor->dev, "Programming Error occurred\n");
> -
> -               spi_nor_clear_sr(nor);
> -
> -               /*
> -                * WEL bit remains set to one when an erase or page program
> -                * error occurs. Issue a Write Disable command to protect
> -                * against inadvertent writes that can possibly corrupt the
> -                * contents of the memory.
> -                */
> -               ret = spi_nor_write_disable(nor);
> -               if (ret)
> -                       return ret;
> -
> -               return -EIO;
> -       }
> -
>         return !(nor->bouncebuf[0] & SR_WIP);
>  }
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index dedc2de90cb8..4756fb88eab2 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,7 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
> @@ -294,6 +295,72 @@ static const struct flash_info spansion_parts[] = {
>         },
>  };
> 
> +/**
> + * spi_nor_clear_sr() - Clear the Status Register.
> + * @nor:       pointer to 'struct spi_nor'.
> + */
> +static void spi_nor_clear_sr(struct spi_nor *nor)
> +{
> +       int ret;
> +
> +       if (nor->spimem) {
> +               struct spi_mem_op op =
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
> +                                  SPI_MEM_OP_NO_ADDR,
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_NO_DATA);
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +       } else {
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +                                                      NULL, 0);
> +       }
> +
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +}
> +
> +/**
> + * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
> + * is ready for new commands and clear it.
> + * @nor:       pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
> +{
> +       int ret;
> +
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
> +               if (nor->bouncebuf[0] & SR_E_ERR)
> +                       dev_err(nor->dev, "Erase Error occurred\n");
> +               else
> +                       dev_err(nor->dev, "Programming Error occurred\n");
> +
> +               spi_nor_clear_sr(nor);
> +
> +               /*
> +                * WEL bit remains set to one when an erase or page program
> +                * error occurs. Issue a Write Disable command to protect
> +                * against inadvertent writes that can possibly corrupt the
> +                * contents of the memory.
> +                */
> +               ret = spi_nor_write_disable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               return -EIO;
> +       }
> +
> +       return !(nor->bouncebuf[0] & SR_WIP);
> +}
> +
>  static void spansion_late_init(struct spi_nor *nor)
>  {
>         if (nor->params->size > SZ_16M) {
> @@ -302,6 +369,9 @@ static void spansion_late_init(struct spi_nor *nor)
>                 nor->erase_opcode = SPINOR_OP_SE;
>                 nor->mtd.erasesize = nor->info->sector_size;
>         }
> +
> +       if (nor->flags & SNOR_F_USE_CLSR)
> +               nor->params->ready = spi_nor_sr_ready_and_clear;
>  }
> 
>  static const struct spi_nor_fixups spansion_fixups = {
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 4622251a79ff..5e25a7b75ae2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -90,7 +90,6 @@
> 
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR         0x17    /* Bank register write */
> -#define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
> 
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
