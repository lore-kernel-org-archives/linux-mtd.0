Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2272C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE9FcCZqosf8Ww8VlmjJT07Lu8SOfuwYhABVwYRWF50=; b=SpH6jp+VUG1n7o
	uVUOf70bu7ZCEsV9qWSNdorcDcCg4E5GU4zn8FvZjfbELinyySuvgWXdGjyY1Cfd9wnPM8oAfpZnc
	nCOWmn0I3LDcMZKzK25kJ8cq+MMw8+8mkR3tzFiTPRyDFbz3LPAi8zoewaGmY8kJYTiIJ1TG8tP7y
	7nLvzL+u5aRZNdp542lXgbcndBoUjlMiiloX09IROSTqgZswbr4KXbrNtqjeMKxoxF8al1g7OOfGE
	POEl4Hgl04N0HWw2kEbS2+yH1jA3Kme1UB/VJ8a4p3uLnd9brJ0PRc7UOADqqeNmjgIVimPHdY2Sf
	J8cMnrvUCqzB1c1DbK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESlV-003U1k-OK; Thu, 21 Jul 2022 09:46:41 +0000
Received: from mail-os0jpn01on2104.outbound.protection.outlook.com ([40.107.113.104] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oESlS-003Tzo-Cb; Thu, 21 Jul 2022 09:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/Z6yNLcdG62aaNjT8YJqjRuRzONrUlNWWvMCzvCwFg/lvPMEil0W4J9EmD4rAy4RlxpBAo3Zw8r80LSJQbybvNxCCJA5Ws5Fa9SfSRsYHzteumKYYFj5QYK8ky91bBQJdjZB3YY+8cwssus7dU4qPDAeBtmaU55ovwFg2G2XfO+Km5SkQ67fe8jSQpIBs1ONPLR4SXEjwcDTy2To7ft4p7heOA16LQ3hbssvuqYlXwB10jbTC510VKglWjWWwOHG/OsfX9jQ4xadeU5WkWaMZLhfT2k0Fm9QA0uudqi5TMZ5+aSjfX84hwF6SKuF4aMe6JjpZrcAdvl+ky2yUx00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be6BPuFsLPhX/I2cpwJJX+xkzUN5oySoqooXpWHIou4=;
 b=Lgt7OZQfQ7AgmIO00tzn94WSrz3VtpHkOiBolrB/nd/I7pH1+K7iU8biTV/AGUb99v3XBAFtnLqk3JiGGbvLjhFM/cauY7BjhQOeGHZqgQRsqoGM3FNXpm3FpQeBLpA/ogXC/0ysur2JuZ4lC5Xth3fyEAea//KJUCqeLMHTseJevVqwxEVuo7VKrq3VG0lAA42qTYd9lTJgdVyDoD7kvqGu9exWYd558ee/zCq8OV5YqRNpqMNNH1bAM00NWta+ILxYdblZZe5Vm+UuwOju+RhiHedIs+twuDpTbO2vVfzb9f/B1Lvi0M6BbFN6clOi1Zb4S0sHcyYYZdYK0nlTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be6BPuFsLPhX/I2cpwJJX+xkzUN5oySoqooXpWHIou4=;
 b=LKdBj7rwrSVNvoQbxLxi8hfFAZI2sztrmxk7k0wDL2PjymnxXaPxQGJfgj8/Mw8Q1ElLajmIAsFBkEAnIPLDXlOHT725U5AT6GceD/5RisrIjHWR38hjfHvH5hjH9nhOfn3nSRXuge726wYIjSBKaX7xnQjurFdFJkRm0DxB3mA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7782.jpnprd01.prod.outlook.com (2603:1096:400:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 21 Jul
 2022 09:46:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.025; Thu, 21 Jul 2022
 09:46:31 +0000
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
Thread-Index: AQHYmDmxaDGaoLXUcEiJUkRa88raCq2Ih1KAgAANRmCAAAaeAIAAAKdg
Date: Thu, 21 Jul 2022 09:46:31 +0000
Message-ID:  <OS0PR01MB59221FE257A0E06F225AB6B686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
 <OS0PR01MB5922F0D52EACD4686768117686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
In-Reply-To: <785e50c4-3c8c-a1a6-de60-4587aef820a8@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45d3aa31-27e8-43e7-c055-08da6afde451
x-ms-traffictypediagnostic: TYYPR01MB7782:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PKxzjicpmJRW48rESc8pPT0GRhDt4Dg1cvP+ojR8BeBudMfhDaCinreJqejUJq2Ng57WUL5mjKKyf9busVxXuYUtf//MiWEFD0OJUvdj9vwPbbx/DTZEV6fDLxR/fLQ2HkryQ9sdbRBp5L3JxP1uhYrhtX5hW7gfVB3ePyWaG80AYulKuqqB10cy7HOztiSmiXHi8sGvz4vWC5bJy5USl0ZB9S43G+jq+c5WuJvHUZZayKSuAl4W6wr3Wbd+Q8qZjfdu+4A7SFZsiZUT6macDXsd8xdMT1/Vf/3dvoxzSBOBiNMeedLCAQmf8Od/a1HcN8i258oFMm2YOJCIIdBO/lOy8BgAhlp1hPY83k3X2KkRyD4XkfXm3kpz8zT58kNUJYt+5Fri0nc6DDpzJ5itk1/RvUAecez0HZJpel3ccghhrGby78SVefiJxDioMUY1YmvVhkIQOZ5kBysinJy8v5+JvBlBEqR4NHTOP+9Jjf90lGPKMcxi4nBuDY/ceMkSsbAIWDd+g2ORv8pbNd1SO46sq2jTb+R+7Z+9t2fwEWkdeUJ8L76p8Iryb4cSoBZ0O8NLlTw8VNwcWY7lYC/fyI+xjvQgUCYXg4/p5dLCo42dG4FeThHPJ8z8+hgWpYvUSa9nGBuhcgMvzYSYJehJXHgvxc/KbONDm+kIIzSFMWAxj3I8LIMx47944ZXlTnozj1GKzN1i+yIXZA6k9fnMHnAPpWRlOgDsXfc+B923524ANjUgK+EFlZxm23Kix7v+Oj2VocSmMcuedZ+1PWSS4dYtpye7niXGLiya7av1QIXf0ZKvwPL7X+QDa20u5vuQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(478600001)(71200400001)(86362001)(41300700001)(38070700005)(53546011)(7696005)(26005)(6506007)(110136005)(186003)(83380400001)(316002)(54906003)(66446008)(55016003)(4326008)(66476007)(66946007)(76116006)(7416002)(66556008)(5660300002)(8676002)(8936002)(9686003)(33656002)(64756008)(122000001)(2906002)(38100700002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEpHSkhVVkw5WnNIOW5yek0zSlY3U3N2V1RIQ0huWTNDS2wxRkpwR3lvNXRx?=
 =?utf-8?B?YmpqNW96YS9SZjhNNVNzcHZZRXVSSEluNXZpYWNSUzNzUzlyUGxyNnp1ZStH?=
 =?utf-8?B?MmlmNTNYYVpxNU5FbHQ2cVFVd2JUckFXUEdnSE8vRWpjOWhydE5lTmx1QTEr?=
 =?utf-8?B?SVhuY3dURmhYZ0NxcTk4cStmTENHTXhFcXhkSHllS2Y5V2lTZFM1T3FzdFUr?=
 =?utf-8?B?RHVxdkRGaFlDT2ZSU0ZSbGFFc0FVdlFYeEFacytXNThWVXJxUjNud1d3YW5h?=
 =?utf-8?B?ZXNoK1Q5bTdXYXM0UVYyV0VCOGg5M2U2Q3hESFR3ckxRRk92bFRKSDhlWTdo?=
 =?utf-8?B?OXBuMzRhNU12SzVuTUVYQ1ptU2dHWGhjUE5MZThUNVZQTERuTjNxdnVhODlv?=
 =?utf-8?B?TUluN3dyamhJMWE3dFl0ZHpjcXQ1TDFEVldhaVJ4dURXdy9oZzB6M1VLWFBt?=
 =?utf-8?B?ajFNaUU2T1BNYW5pclhxOCs1WjJHS05iSTdMbUk1SUl0SUZmcFJKTjhxanc2?=
 =?utf-8?B?eGlLM041N3p4eU5uVzBHdlcvSzVtYms2dnN1YmVRZXdSK0h4bm1CTCtRK0Mx?=
 =?utf-8?B?VDFGYXc5TEhmeXRkUmlUazltR0NwQUJpRnFRa2QxYmZCdk9xOXQ0LzNRRFo3?=
 =?utf-8?B?TDZ5ajZxWTY5LzRTVXRTMlBtMDBQbXErblFRVXVMOWVnMFVhcE9VN0VzQkZL?=
 =?utf-8?B?aEhpcUdqNVZ2cSt0UWpnWmpESVRYYmQ5dXcrRjEweEhYbkdiS0EycFNtNkhp?=
 =?utf-8?B?QThINXBsSVpMcVNKN2pFOHluQmZqckRPZVFGdXpCVVdLN0lsS2pNSTcvZHhr?=
 =?utf-8?B?UWpCdHZKclpBQXZlVGt2dEp3cnJIVzE3ZE9Sc3o0eW9ZdlN3S2p4aFkxNHVL?=
 =?utf-8?B?elNKV0I5MDA1YXQzRUxsVWZyWlFrRXFWRnNRdjV3V2FoeHplU2xmUWJMZ3dw?=
 =?utf-8?B?ekY1Y2Q1NzJ4bjhCcXhwRTZLcDVCUm9OKzFsQkMzeCtsNThLSGdQdkpUdDkz?=
 =?utf-8?B?UHhrTXZNeUJlY052WUl5VWhYMFEwVjRXRWNmMURQb0RWWW9qTWVSbHNMQkc4?=
 =?utf-8?B?TVF1ckd0QjdWMDQzUHBrMTFPdlY4L3VjK2E5c0hFbXJHTWlQTjBwK1FxV3hV?=
 =?utf-8?B?YXBUa1FHd2YrVjRVTUU2VXQ1Q3Z3UklZcFlQd29qdG1vZFVoSFZldzhYc0Zr?=
 =?utf-8?B?dGVjWXhYcEEvRVJBSzRqVFVjelBIOFBucDdBTWs0UFJPUkZJblJTUGdwMTRz?=
 =?utf-8?B?U2x6S1V1NHdJT0xWZFNreUFUNGRnNlpSR3lKOWtvMGU0N0J3YTB4c3o3bi9B?=
 =?utf-8?B?d2FsdE56QkFSSmdnaVA3VUFFU0VSTHVEc2cxRGtjaEo1ODY2dVcrQkRlNWV0?=
 =?utf-8?B?V1B3SXZXaC9EeWxyVXZRWDlTM0VsemdhNUZuTEdOOWJKWVEwRkdJS3BIQnVP?=
 =?utf-8?B?MjQxU2cxVVJmS3Ura3E3dCs4am9nR3ZETHRpNHlncEhFWTkzNEZqUWZsT0Vq?=
 =?utf-8?B?Zm5DcDVJdnBVaEZkNVRwdEdpejBQTlhvV09BZFZVaFRWOFF2OWxTY0s2Umtk?=
 =?utf-8?B?aWplaFp4VkZPSytLTURFRkVxc3J3SVpYTTJqMUdHSUE1WEZRbW1HY0cyRDAv?=
 =?utf-8?B?MjZCbjdzcGtWZFlYcEFQc2dJSXJQeVNUOXA0ZXAyVU9Haml0VU9jREVaQURr?=
 =?utf-8?B?M0FKd0VCSlh1UUY0WlF3SEcvZFVtcDFGSkR5UjNNSGY1d203ZEhsZGhKMHNK?=
 =?utf-8?B?UXVpWlVDKzN3TzBKaXg4Y0czRHR6aE9rMmFjMTY3dU5EdmRyUGowMFZmK201?=
 =?utf-8?B?NlB6Q05wU25aWDc4SXdDdU9LanVha2I5SWQ5RHFRYTFVRmdHWG5yOTZjVnYv?=
 =?utf-8?B?bXFFS2MySENlUjYrTzBuMU4xd1JTV0J4OUNSWnNsVUpCSEdQQkxNWDhUd2Vj?=
 =?utf-8?B?VUVkVVM5R3FsVE5XUVJwZURCS0Q3NVBjYWFtQmlsNFlDWVV4OXYwZ1FXRWdj?=
 =?utf-8?B?UVpHdk1ERjRVdU43RVRjYmFaa0JCNjZrYm9KTFhscTdoYXFFcmZVdCs5M1lW?=
 =?utf-8?B?UzBJU2dQZGNocmhxUSs2MUlpVHdKSkYvNngxMkx3N0gyTEhVQjRTSUVZOXpD?=
 =?utf-8?B?VGU1eG5DUW4vejVwQW41ZkkwWEFvUnpEL0Z2TVpjMXpYc2VRRUEvVEZJWUcr?=
 =?utf-8?B?RUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d3aa31-27e8-43e7-c055-08da6afde451
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 09:46:31.6023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8z7gKvPFoe9oDKj98gYbzaBAxHJzl5d7Y+1Z21c2UGv4SB6efmznSlsyWhf/A2m9vDwbzxV1EK6XQVTI2UZ99wc2zBlCrSx3uO1F5CSfLNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_024638_796427_5BC096F8 
X-CRM114-Status: GOOD (  23.96  )
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

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> flash
> 
> On 7/21/22 12:23, Biju Das wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> >
> > Hi Tudor Ambarus,
> >
> > I have done quick test with these generic patches. Please find my
> > observation below.
> 
> Thanks!
> 
> >
> >> Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A
> >> serial nor flash
> >>
> >> On 7/15/22 13:57, Biju Das wrote:
> >>
> >> Hi, Biju!
> >>
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you
> >>> know the content is safe
> >>>
> >>> Add support for Renesas AT25QL128A serial nor flash.
> >>> Details of flash chip can be found here [1]
> >>>
> >>> [1]
> >>>
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>> $ xxd -p sfdp
> >>> 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> >>> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> >>> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> >>> 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> >>> ffffffffffffffff501650190000ffff
> >>>
> >>> $ md5sum
> >>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/sp
> >>> i1 .0/spi-nor/sfdp 23e3ec56b5b8f986d0488ba4727239dd
> >>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/sp
> >>> i1
> >>> .0/spi-nor/sfdp $ cat
> >>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/sp
> >>> i1
> >>> .0/spi-nor/jedec_id
> >>> 1f4218
> >>> $ cat
> >>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/sp
> >>> i1
> >>> .0/spi-nor/partname
> >>> at25ql128a
> >>> $ cat
> >>> /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/sp
> >>> i1
> >>> .0/spi-nor/manufacturer
> >>> atmel
> >
> > With generic flash driver patches I get below results
> > ----------------------------------------------------
> >
> > xxd -p sfdp
> > 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> > 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> > ffffffffffffffff501650190000ffff
> >
> > This result is same as above.
> 
> ok, as expected.
> 
> >
> > cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/jedec_id
> > 1f42181f4218
> >
> > This result is not matching 1f4218->1f42181f4218
> 
> here it looks like the ID is sent twice.

OK.

> 
> >
> > root@smarc-rzg2ul:~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/partname
> > spi-nor-generic
> >
> > This result is not matching at25ql128a-> spi-nor-generic
> 
> right, as expected
> 
> >
> > root@smarc-rzg2ul:~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer
> > cat:
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer: No such file or directory
> >
> > This result is not matching atmel-> cat:
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer: No such file or directory
> 
> here we could introduce a generic name as well.

OK.

Michael: Do you have any plan to add generic name for manufacturer
as completeness?

> 
> >
> > How do we get proper partname/manufacturer details with generic flash
> driver?
> 
> You don't, as it is you get just generic names like generic-spi-nor and
> generic-manufacturer. Why do you find the flash/manufacturer names
> important?

Ok, currently my test script expects proper partname/manufacturer.
Will change it to generic one.

Cheers,
Biju
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
