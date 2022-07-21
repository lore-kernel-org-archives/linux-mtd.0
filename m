Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0890CC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+Wpj5W+zVTGd8jcmshNoWVk1uMcmb1CdvO+Zd//6Hg=; b=bOYaV9p0u7DmU3
	lI9nwgzJ0umkELTxFmstfTy+zPrl3TP+A+4RO88DnuE/7FmR8qh6FREoCoIiSxaLKe5WGdBPUny1j
	zMMgNRjp5+k3JaqjgSD7OHQpDHhHs6LlfKY4At3eEJJHoRT3BhVa+IPpp4yUcbgTGF3jV+8gGK6OQ
	pai7TPQwlg6q2Uvg3gs20/yz+GXQPddluUiaJ5hHHRer4mMvdipc6qUgVBiqrLqLV2DSUFEjXyeNe
	f+m8OA+gh/Pj0ZbAfn4lMpHDKud4931Q9Il7fsc4brQ+6RMgBzG9mC7DNg/XyNZ9pCGdKzmj5E4rF
	HqK/EYSPCf3xg2Cei9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESPD-003Dad-6U; Thu, 21 Jul 2022 09:23:39 +0000
Received: from mail-tycjpn01on2096.outbound.protection.outlook.com ([40.107.114.96] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESP9-003DV4-R7; Thu, 21 Jul 2022 09:23:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I47+Po/WsoHlpYHOa4sc9TFoJt3h70veuLIkfsYjr0qptVw8NeavWAU47nF5vnoaa3K1XD1L0aBbk6EQ73ns6vNjTd63Iypp287IuCnuV55aIEe5yQiXwJ6YCZVQ0uCjLzkmMIGojt/2+D8wL5ZhEQZanAU/gqDsxpVubavrjkJSZiIAmhbBvgTOKRX/mZXAzhuMCWBPutizfZOVWSzA4Yl3SZPo4Le2YUeichJHX9nFs5aVj5QEKOkDCmx8QGcEXnVumb4uu1CUq+HAsuAe6lxSww1Kg38NXabN9JTQaxj8nYAeWuFbEt+AM/tdngCd5y+WRz/MCyjiHq1d0mQwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fya06QtXptK5fpLJGiKtduI8NSnuEg+DSC1M66obnQ0=;
 b=mDnvoJUMQIeBftOhxdhSLJD/chSJuWlY/A1VFK9XowUcPjpsYjc47EK+Z7/HTYqcvrFncy9ENc24cEqFCT4SPAkKxMnLztAwBWjYKznpQSryvdPG/UP8px/Nll4x1NvP7McVC0yGjUN58Ehmw/ge6tZko6g9M/nkbYOO29x3jUYVRP/QrUtHxsgVyG5OvjZWoR4UBBP8v7a1h4da1nPDz9g9SYcG5oNx0fxCzrZumecsQ2pyP/ppSFtMuVkj8cwZy7VnmIvByP+Ou0wPLUr8AX1SI/4z6PsD8IPAhllDAaT/JxnVKis5iUt0GPX6CGnr41m6J4n53yj/Muk2xIoYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fya06QtXptK5fpLJGiKtduI8NSnuEg+DSC1M66obnQ0=;
 b=jgY+BzLy/YzMAY7HJ9knn11UIh71HuWD9TqtA1ulVCqYzT8F2yO7cL5KK31VBxjAoNNLBIJDbJL2HqK3/wX7/3eC5D1CwdHayz0dk/RwVSKwwC9Usp5Qf/7PHLcadb1G6onriatD7DHFPRjVAxxWiZl9lQnCkqYD3K91t32QxL4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4759.jpnprd01.prod.outlook.com (2603:1096:604:7b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 09:23:29 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.025; Thu, 21 Jul 2022
 09:23:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>
CC: "michael@walle.cc" <michael@walle.cc>, "Nicolas.Ferre@microchip.com"
	<Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "Claudiu.Beznea@microchip.com"
	<Claudiu.Beznea@microchip.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>,
	"biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Index: AQHYmDmxaDGaoLXUcEiJUkRa88raCq2Ih1KAgAANRmA=
Date: Thu, 21 Jul 2022 09:23:27 +0000
Message-ID:  <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
In-Reply-To: <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bb3a235-3a0f-40db-894f-08da6afaab71
x-ms-traffictypediagnostic: OSBPR01MB4759:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Y2cAT/qLuRJaj+D/RmGdv0aP0ejRaqzU1cbBWVicjEAnq6UnkKe0v+rgkuR3lrgK7aB+DK898H004EPNBJ4TFQyyO7J8fOMtB8Y9ze/dhPNYQ+8GsjS1PanmG6CVZfZgO243/wc7SB8+chANMsrW/U2Vv+KEQghwv6QXDpue5LzdvGWo97D9xjob7YnBp3oOOubI8dxcbp4XT/Pv+HiUht9SEfBTWaeyPb9UM4yFPUuWg0cmFNy07+7pPTr4Yk62FFvkgVTBPlSK1S0tf+tbv4kRebQsIDQzGZ3ZSo9LJ2L2XqNkz1H7O1eIVmjdkXvmt2NncIWU6sGg8oMk9/4TOZfwu+Ccco2wDFmZFcooyCkI2Sxn8rHzuwy36ru90raE09ElT7SGiFupdCz0nlNFqi6BH++owdILF4paTJUjcm0oUstYvhR6WhS5IVxcUThjIFml2BvEpIQP/L7Fmg9l69swHkKt4mBxOX+UmW/IvW+0PYOLZ6NEwNf8x59+nmb92r1OxRtQJUT9ZbVR6dKT72JGPviPFCXyt8O7Vn56cFDsC5Vulxo3GXFasuH+sITK9c2Aih02C/pZ8uRPJHl+OGdW5ffggw71yTuxotJbFN8oXka/0VrZfQiyR/JC6Ntmy42a2joGsAn1QgMMPXKBsawhEmGrD3Xc2t3U5HSfgLKtYmxk0yKTvx+sIp09Ew7sUKwSIrWxB2v6+8TUrF38b1ZE2vVHysFy6hdiUXSTnzWTs/LpI3/l7Zj9mLifE3GpoT1rv+Dtf3+pItJHmqvnNvHRnnM3YU6eogkXfaJ6W+339CMq2zTdEQslN3WUAHKf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(33656002)(86362001)(38070700005)(38100700002)(478600001)(122000001)(52536014)(7416002)(8936002)(5660300002)(66946007)(66476007)(64756008)(316002)(83380400001)(66446008)(110136005)(76116006)(71200400001)(55016003)(186003)(8676002)(6506007)(66556008)(54906003)(7696005)(41300700001)(26005)(53546011)(2906002)(4326008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4H8iemp6yGKj3NZXdj0mShffD7aDU9xk3VTzzXmU9TFWto5OxGbzU6EgLmIM?=
 =?us-ascii?Q?TFaiFrTunof8TxR+LlQDMwiuLO20j7NrE4gnOk1yZ3xvq7OYJtWoxLntflHu?=
 =?us-ascii?Q?JshzcJOZMMg+maNlwMy2CEzzyOn5Drsmalf/IT3JxlfX++TmpUxf67K3u79e?=
 =?us-ascii?Q?eee3XEeG9YpkLzvsH8EDO3Ar1tgy1Xowy7Rj1WTM5eGGLdfyV5jLtqpSKMl2?=
 =?us-ascii?Q?T7RCvsvcQQ0eO7tejGa+dYpBqZjF5t2qR0wumVrQJvEaaNLxrAkPN5AVM8Bb?=
 =?us-ascii?Q?UrVUsm78oYOpHRcxRx8TOkNsXARX0qp70vWdQ+lHPYpCikGB8yVKHECtAd58?=
 =?us-ascii?Q?qo41Vt3459r27kWvNDzXJWasY48MwQjmydfs+TWsbT85YTMC2tBsurKoM7n8?=
 =?us-ascii?Q?k///A4iisZ0vJZ/3pURmxr2xlZDrLWzwzIID7Mm68zl3lDJ/taJCs8ACRkG2?=
 =?us-ascii?Q?VST1lNfXumNY6oKdy13CokAcdwYEIVcYLiyW/FndHSXtQt3v8Hb99W+4/A54?=
 =?us-ascii?Q?OveEOT3oBtAGUtUG7HX5KVUvDofxBNwAzJ0O2g+vTMj3yxENEYUmc/cVya9x?=
 =?us-ascii?Q?juGvTwSRBuNvo+h5HViAahKzBixkg68jICn7q700T1YEnPpboNPKGe+EAh+i?=
 =?us-ascii?Q?6QXyjfG8d9+45YTWVHGa0AsTWDaZVGEV787fvC7iT1ZKE6l82+v58WMcgTL8?=
 =?us-ascii?Q?bW6Igi18ci2aNxA2EGf6qu/6QkKQgnUEVJB2/Ip6+m7wfbWKKKDWndgHn1m2?=
 =?us-ascii?Q?rnEK4vJpsNqBWhYrEJx4qZR/30cvMM8OK0Thqvdea3rqS5yNUA1g4y9Qjf0Q?=
 =?us-ascii?Q?pPL2BITLRoiVQfSbqdhapNdY9E6XAJ9WaPo8xYwqm6wilsopKawG4NGNJmiq?=
 =?us-ascii?Q?mBeby0vhYGeOaEV6o8Y2bukfPHZuF+nqVkD3DT4kEPVjy0OYlqLEQ60H8a6p?=
 =?us-ascii?Q?FcndYlJZjMIItqAFLmMwNZfj4glVFC/8QTxcwQIYJ4xHuT+OSYbPvZOA62Sz?=
 =?us-ascii?Q?12MbvqoSJd7hIUuJTCXHZO7hpf0rmkZcz3Vg6yHB+OCCSG9FZsjqBrEOtyRF?=
 =?us-ascii?Q?8UjnyyfHu2fzMcK7f+w0bBUTjtizwo8mKKbSAeyHaJy7lwycZs7rxfA0YgSD?=
 =?us-ascii?Q?amFJUKewjtxYD0aI51V+g83n0SN1Cu8yJb3uvV3Fipy6K1Fxv1JGbN6dsh1t?=
 =?us-ascii?Q?hIosfFkjVu5tBUsn3IG9ME+MNtXGXcQXM0wLrm2Hs9V1UiSSBMnFCzCspSow?=
 =?us-ascii?Q?E96y9RZ1yeUaq7rxryzBla/5yJQHyJCqzK9DvnUEFHErQ3IhXoGTq0fMOMIU?=
 =?us-ascii?Q?kbhbt8QEB805ewYSokSTWierkRs6RGcN/SDGXqWE3MROO4Br76VzAYd4/sB0?=
 =?us-ascii?Q?Rna0m2L7jXv+Ln9dRmxAzCrZx/zh4LLE/3kiRAXoR9o4MehjTXmjTs7R4Z5T?=
 =?us-ascii?Q?tkBd6Y3k6FK7ESZnLQOFkmxYIePV2kHHjNr0H3kDSjYJjkX/iBZtIiaMnTHe?=
 =?us-ascii?Q?vg6wBVWPbHURtdSKSa83vmkkpjYUmC84dzs/BWUqhSX4J9odnDvmEBqNypLF?=
 =?us-ascii?Q?qVkbMk1NjqF4CIq162sOv8RGz5Dp86bJSyoXMGOIKO5yHBEIZegxDRLG6RtL?=
 =?us-ascii?Q?fg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb3a235-3a0f-40db-894f-08da6afaab71
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:23:27.6746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqkyRGTn0ecTA5C5ZudMJO0nsf40APX2P+rbyacNjVU9X86Kco++txhaITVbTbru6IqAI08QL0/Poetm0qSMI4Y6DczjUXgWwZl4b0gZ7TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_022336_251587_0E6643B5 
X-CRM114-Status: GOOD (  27.10  )
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

Hi Tudor Ambarus,

I have done quick test with these generic patches. Please find my observation
below.

> Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> flash
> 
> On 7/15/22 13:57, Biju Das wrote:
> 
> Hi, Biju!
> 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> >
> > Add support for Renesas AT25QL128A serial nor flash.
> > Details of flash chip can be found here [1]
> >
> > [1]
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > $ xxd -p sfdp
> > 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> > 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> > ffffffffffffffff501650190000ffff
> >
> > $ md5sum
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/sfdp 23e3ec56b5b8f986d0488ba4727239dd
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/sfdp $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/jedec_id
> > 1f4218
> > $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/partname
> > at25ql128a
> > $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer
> > atmel

With generic flash driver patches I get below results
----------------------------------------------------

xxd -p sfdp
53464450060101ff00060110300000ff1f00010280000001ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
ffffffffffffffff501650190000ffff

This result is same as above.

cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f42181f4218

This result is not matching 1f4218->1f42181f4218

root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
spi-nor-generic

This result is not matching at25ql128a-> spi-nor-generic

root@smarc-rzg2ul:~# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
cat: /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer: No such file or directory

This result is not matching atmel-> cat: /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/manufacturer: No such file or directory

How do we get proper partname/manufacturer details with generic flash driver?

Cheers,
Biju


> > v2->v1:
> >  * Added flash definitions into Atmel table.
> > RFC->v1:
> >  * Moved the flash definitions to atmel.c
> >  * Remove macro related to locking as it is untested.
> >  * Replaced INFO macro with SNOR_ID3
> >
> > RFC:
> >  *
> > ---
> >  drivers/mtd/spi-nor/atmel.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> > index 656dd80a0be7..80c24d138b27 100644
> > --- a/drivers/mtd/spi-nor/atmel.c
> > +++ b/drivers/mtd/spi-nor/atmel.c
> > @@ -186,6 +186,7 @@ static const struct flash_info atmel_nor_parts[] = {
> >                 .fixups = &atmel_nor_global_protection_fixups },
> >         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64)
> >                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > SPI_NOR_QUAD_READ) },
> > +       { "at25ql128a", SNOR_ID3(0x1f4218) },
> 
> As the flash is defined now, all its characteristics can be discovered by
> parsing SFDP. So instead of adding a new flash_info entry in the already big
> array that we have, I would like us to focus more on a generic flash driver
> which acts as a backup when the flash is not found in the flash_info array.
> We can discover the flash particularities by parsing SFDP and we can probe
> the flash based on that. Michael has already suggested this, would you
> please help review it?
> 
> 
> >         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
> >                 NO_SFDP_FLAGS(SECT_4K) },
> >         { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
> > --
> > 2.25.1
> >


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
