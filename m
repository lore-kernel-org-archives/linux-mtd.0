Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800BAC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/QYeSbQmf8o8VoukxQDw5rTbvRZDww8L49VU8UOW4s=; b=AS/rZGE8e2adRU
	tbxefG+KsRZncPjlD3amly20hCZnYnQ6jiflCjsw0smOm5GtJRd/KPOEBN0WthFK/QTlgTwUau309
	6zmcgp9kNahQv5UWp7b2RusZ1a8Jd7Xtc+Qizd96xDRFW+33j6uD64eiBEHEoECl4TEpHIq1HUgKR
	MdH/plcX7gc3cYNRRsYilufccCVmV9X2ZfeM6nm1J7QYQ0N1JyUIUnNA3Hugk3M+/1voUZhh620wk
	2NRB6GNQc64IESUIsYmOUFkO9guTGIyDrEXXVmeQnUTDXTYbeSwuIW46Tk4xFIyOwNDbGn87xH8Lb
	bfZHCkq8zNpAdenrW0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11ts-005rED-1R;
	Thu, 09 Nov 2023 10:04:36 +0000
Received: from mail-tycjpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:2019::700] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11tn-005rCA-31
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 10:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2Nrh8Rhf3vxIU981YGVVC7h+wilaFH55lE4iPT15nGnlInSjYF4r6BhJVm0n/3J+V18/oypQcmevu/ViqXAgEgE/GWcsUiWJ8T2qgkEA1mhH+U7sDrljGfmuautevlquaiA2Oq6YlNJgq7OjFSQU+N6ktAzv8GSfOpoG+stXimATShJEhvDdYBFP145ZHBeMliRFE8T8SimjZqsneha204HeEt+ZCaLUzMf7tIuLmvgHADG4CtHQgAPR8OipITh1HLM8BNySBJJhn9sMhMGv3rY6VQevrwOm+4B6Rt8a7inVqTt44E1honM13YDH99TD53qIbHXBG2c28GA/4zvtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xleuik7sKubKWWdXFNOhDSSvQCJiQU3i0hokz4Nj6qM=;
 b=OkKyYjlI3XcbRnMRjjgxX1kf5WKP02aorDZHzefvlzM2k0a87Q69FKhuSNyCHyK5sCXF9TxtJb/6fqe0bsNRl2M1PDSrj4mNTKiMgVeLCL8FuZkiBA/zgcKxF0MNZ8/R6g9vnWkbmTp4K5iEuVHVW0Jxegpy0iZFaopiJoAGqSx1Aa2oBi+xpDEKm0QYWfLgdPbfDMr7xXTrxkZ5dZqPXhq9JciQpEJzP1jRQ3p8QcsbmK5JCRAfub+aKEZcLdzM8fmLL3r3V+YlSfh1V/zGQOoRFBM8L7CBAt0+ptZKXIcGHfQKlP6VWjnHtLJ2K3SId84p6huxkUJfOxI7Z7jKSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xleuik7sKubKWWdXFNOhDSSvQCJiQU3i0hokz4Nj6qM=;
 b=hQwpTmYJlOv06WKKOw1g3JhnGwmbJF25J8g4GK/NHi8adtnNjDStD4orUqp9cioQt2ou6E8CDDQHO/PdnfMQrXNn+IV5VBq25qVgtGf06jALhKcqXN+pjY7lYLFJfD19isdNsocQhOT1s6lM1R5NcJ0hPEDnNWbQFLeRMakDpMQ=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OS7PR01MB11682.jpnprd01.prod.outlook.com
 (2603:1096:604:244::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 10:04:19 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 10:04:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Topic: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEAA=
Date: Thu, 9 Nov 2023 10:04:19 +0000
Message-ID: <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
In-Reply-To: <877590a5e3f8c32ec0a032385049a563@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OS7PR01MB11682:EE_
x-ms-office365-filtering-correlation-id: 9e25d53b-3334-4142-66cd-08dbe10b3d83
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1h5ycQg+EXPUDQ2RPwEQwYGgpw7rODy9BP+3sEZz5540jAX00p7RqUpNACh25FaGGhcHAq5QZCZXO+tcJO6gNyIvcIx/zTLAuLJexP38C2h5NoPAUL6Uvb6GUjHQ7QNT7MhrOHYiZe4XAV0d6gDiS71Pjl8Mh4F+pg/5+gbGxPOEGfaDOjZCj//75TxsT0vQ40lg7/AfAYXdEALbuVZWijSZfqYqxYEMA2v9poDypgNls0ohfpqFoXkcT/pG6AdtsJfPq+/UCD8/e0wuvjCH6m1OZlkw7rjD1+7lCCy8T8WwLoUs5x3M+/J5qRWeRMOignJcxvIi6VMya6hsFQ+Ep40mw3/bSGUWKDgFLseHKkxO+tSWIJaevkfXbpEOiEofCKCCay80hkFwac7ZDuvq42frsEoJvNrWbYKSHbJOaBJrjG4mr4u+aYDbdKCMzdBTZVIsKydqcpFrvyStemqBwRoiQ7RwUqSTMTblKWJiyoH0Pw1s7HGTE1Z0VYyB6NakjuQM+h+zbm8roY213qEwENzm0kM+wXu97mmRStFoqcuHZAJRWMKQuH3AhEBxfdDeMHhcIwLiwadjsjtC7OlPmEfWfTUAqR32CJBBT5C53PCiyyod4bK9muBiY0azf9rs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66446008)(55016003)(478600001)(86362001)(38070700009)(83380400001)(33656002)(38100700002)(122000001)(6506007)(76116006)(7696005)(316002)(9686003)(6916009)(66556008)(54906003)(66946007)(71200400001)(66476007)(26005)(64756008)(2906002)(41300700001)(8676002)(4326008)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?caqFVuij5QjXJeHAND2fuuCyx8LTPMuC1GtBOcJ2ASDR3IdQXyploRUyEkdh?=
 =?us-ascii?Q?zpfzQoV2nohQhe014FNSIb4JyIED8cJPQJ36+Rk9aohkHO7BfCE4HFww1zbB?=
 =?us-ascii?Q?c/Gblwhwp6mYI8VSCMTkATXnm00ma+c0APlj2E8eWbZE0B8Vt+n+qvbPLIhB?=
 =?us-ascii?Q?DpYwtMPbFEppVTEHFhCKh+kPipu0/YfPx/kjLwTrlvPtqU7N2ZmkR+n5KMsL?=
 =?us-ascii?Q?6Oy4FzdgReG4eqxhKaOGVCUaHjvIoDPYLSzvTLpa5/4bKKPBp6HHTFBmfE3E?=
 =?us-ascii?Q?dox3KvjX8NlGGABXqE6uwpMiXm5+RPeBP/+zQHDk8Y+Pp9gT/LrqvWa3cdUT?=
 =?us-ascii?Q?nRshEEUuQmAIgg5UWGRQSgi6gZy3sD9LsSBgnzZiiG3GQc2RDgWnjqpG2ZF0?=
 =?us-ascii?Q?JIX43J+k0TAm9TtIcslNvSicoOUGmI/sDirYEBnT0Eh3ZaoJTl/ZOmpNvMUM?=
 =?us-ascii?Q?xbxmuRx7K5g+UEBePoBptrU9opiwhK9arbSwVQu+Ed0nZrAG6xggW2aH0KFX?=
 =?us-ascii?Q?CMFfnAWPZE21cAOEW66EPlw8z1wiUlBEonqnealAIs7sGwWZkTC2y5ID3JZ9?=
 =?us-ascii?Q?KCJW9d3/gmLD27GhXO8vTrGVm5/5rtNkeqppdEsIjZ8RNO1q6mZMxWFEfOlG?=
 =?us-ascii?Q?xwL8BJFeZb0xshX22NXsYiDJz7q4Sep6BZlVZfxrfZcE8LjcI8Cj2taY+JY5?=
 =?us-ascii?Q?6zWVDtZbru2SKl6cGhTRrVdZ99LUv0ELGbqrMxSIHyrn4/jb5vVVdnPdDirt?=
 =?us-ascii?Q?03Y+XDumHOdWHNzok7tG23w5q//TVGOZwn/Ui8BfiQVVmhgLUFMX38h2LfM2?=
 =?us-ascii?Q?AeRCLx8tCG0tOXsSkucsPHsabNSRe26KG7AY4YgTLZ799KCFeQXmEnIWs2q6?=
 =?us-ascii?Q?0UNSExqJyXhWBsruo9Rk1tGErkRbjCncNqfiUlaj1Rf35wUh1uH8PC6qHG/A?=
 =?us-ascii?Q?nI8tzmasd66dpdOGx6Si5Pe45uefeR9vUOFQWsMFNzW9QYtChXK8jPzG43hc?=
 =?us-ascii?Q?icvemFXnoWS/q4Be0AIp71ufmFd42rLpBea9PZsoBFv174yYx87GshGJ1sBL?=
 =?us-ascii?Q?kFiWdG2SMjRk9ihR0m3TPnU0kzQZ+CaeL3vhQ18kpQF7xzEpUWJ9t5tfTIcU?=
 =?us-ascii?Q?tW1/KUP9roTTgqoIHVfImH2fgzaxSt8yybv9HkotFdRRR2LJo+T+NeB3sJ6p?=
 =?us-ascii?Q?7gA7r8qfKfauYW2AsElDJEOE9RIPVxPbiA99GkCnYJwBlSMfctH2EwEstMaP?=
 =?us-ascii?Q?8mYrmQ6mAQhdmNpIvmsrsgFKy6YprtpIPyO4wUu12qCGRZyvz3zKwyF778DI?=
 =?us-ascii?Q?0QuJLbWd1gUugfmGBht+UdrUTfkY7OmNuR0fEMx77eoFHe0a6S+EjGu6Uo2p?=
 =?us-ascii?Q?zzfUc9bsf5hZmZHdz3bfcnpAk7VCMNUjtmLWyOv7y6wRNs3rfx8Z3ST3UZIB?=
 =?us-ascii?Q?nxgaGznRKvdRbScFKwo3D65NT0ZsPYA2y4ZZckPgshOjokfqsKUcEw8Gy4MH?=
 =?us-ascii?Q?cBj/IFwd9vtu8tbSdE/VVOPsUrw8Ei3YCAc3Jdgr4tr4nQQNPsThA/DXdq5+?=
 =?us-ascii?Q?Kzy6jeIxcm/Wi7hkyYQY7aQIFhNSUOq698YwUt9g52VJSPg1iTPx647TCRjn?=
 =?us-ascii?Q?Mw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e25d53b-3334-4142-66cd-08dbe10b3d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 10:04:19.5768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jdc0MbEoPorGaKN7IYbKqanNPg+6u2EFV1/HQHMhvyg55wJi2o0qg4M6mnywrIbL2/V0Nd/TcLL5rOmG4hRcWW2/yrEt2zPMWka2hbo/Rok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020432_463999_AD9C4759 
X-CRM114-Status: GOOD (  21.47  )
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

Hi Michael Walle,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Biju,
> 
> > As per section 8.14 on the AT25QL128A hardware manual[1],
> > IO0..IO3 must be set to Hi-Z state for this flash for fast read quad
> > IO.
> > Snippet from HW manual section 8.14:
> > The upper nibble of the Mode(M7-4) controls the length of the next
> > FAST Read Quad IO instruction through the inclusion or exclusion of
> > the first byte instruction code. The lower nibble bits of the
> > Mode(M3-0) are don't care. However, the IO pins must be high-impedance
> > before the falling edge of the first data out clock.
> 
> I'm still not sure what you are trying to fix here. For any quad I/O mode,
> the pins of the controller must be in hiZ during the data phase on a read
> operation. Otherwise the flash couldn't send any data, there would be two
> drivers for one signal. So being in hiZ state should be the default and
> shouldn't depend on any connected flash.

OK, I will make hiZ state as the default.

> 
> You've mentioned the micron flash which needs a '1' on its hold/reset pin.
> I would have expected a fixup for this flash, not for the flash which
> behaves normal.

I will drop fixup for Renesas AT25QL128A  and will add fixup for micron flash.


Currently,

With iofv settings {3,3,3,3} (all pins on Hi-Z state) with Micron flash
-----------------------------------------------------------------------

./rpcif_t_001.sh
[   37.950986] spi-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff

EXIT|FAIL|rpcif_t_001.sh|[00:00:01] Failed to detect mt25qu512a flash!||


With iofv settings {3,3,3,1} with Micron falsh
---------------------------------------------
root@smarc-rzg2l:/cip-test-scripts# ./rpcif_t_001.sh
[   26.500035] spi-nor spi1.0: mt25qu512a (65536 Kbytes)
[   26.533995] 2 fixed-partitions partitions found on MTD device spi1.0
[   26.540410] Creating 2 MTD partitions on "spi1.0":
[   26.545239] 0x000000000000-0x000002000000 : "boot"
[   26.554381] 0x000002000000-0x000004000000 : "user"

EXIT|PASS|rpcif_t_001.sh|[00:03:01] ||

Cheers,
Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
