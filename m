Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21FAC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DpsNNifZe5oNp6mPcg3juku3KY/BwbjE+VBwS2fxRyI=; b=wUPpRj3fM4sfMH
	0MLNUfs+pwHeRyScReqW+1Ic3++8FOlqJGpeLY6rRvLabzSlkgPDdypLvYKoPqppkAlZJuwr+o3yd
	ylU/aJI5gkVRYITwH0fzjjkbxz5oFNlN8oV0IE6033/MI7CzfGS6Th4so70I27xQHwhw3yirh5pvT
	mHrdy7FCfLwGLBWn0SqJetffuFMq568eDgxXChVv4ktewKt9r/paSZ3FAJRFpX7XPWWvRLyYo5bVN
	6ImzcvSdw2Hl8lab+6YkfP1uJTmWnYIXvYJFseNA8rKkyKx2nBfzOTT9LW1yI0THq6t8l9jVjGj9b
	uVc8liK01JtQm+7aQ7EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YPS-00EC9X-17;
	Mon, 13 Nov 2023 14:59:30 +0000
Received: from mail-os0jpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:201a::700] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YPN-00EC8g-2d
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 14:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maDN6pWLQRuj7lczqfuELhXL51VGizIwHxdrRPc7aZ2Q541h2Hiv//DE7QIVneeOQ4unHTVFtIEj/rgXvIOiSEqxscoP0bVUH2+sC+MLF7wvUyxuEbVa6ouSsHXrhlrmMbXptptUumDzm0/oC2MWoJ8Re/vYnXiLJmRLPG5HacivrDKPRQoghR8owByiaXSW0bnw2AYip0mb0CoBMAV6XQ3iGmJKvyiFEmtujundudEuUZfMfaM75mSSirlzj9JavlQShNhND40cVVQ7HXkxNmHkVyfq40/32wAVksBiEJHV7JkwK3PqBE6UJ6qxTEKnsIByrreGbkq6WfQMUa8eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjPB1eZDnYLnTLCA+GAvZgmhZ9M3GdKk4t2IH3kfft8=;
 b=O7YBSEXRLilM25XbgpB9IRrtViHY3xDfT7suMWbLG7mxJiPCWO0l7sCP+rJuHzSc98v9EWDWPfFxt4tCfOf10VfoH2iMZeML8z46Qj51RnhHDf1zeTv1F7sSfKGigZVAfSlE55eA9yX97tGwt+JiT7H1sj5Ax59LZ+V4TzfEyNBm5d4Jv1PBpgglgLuOI854Vb2wkqhNf1bJKaDBjxljvqiIGyTQjPP+s/3CrIer9sNX6AB6G4oblDIOSha8i+voorVEQTAYau32I9yJEP8gfB+exFBIQj+hyXoaXaFkA1jePRLTrJW38XaqnbL4/heAYgKWAFbHtKginaFDADrZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjPB1eZDnYLnTLCA+GAvZgmhZ9M3GdKk4t2IH3kfft8=;
 b=jCdaT7dRiJnsx/gqEjgwlHaXm4wVPdil7YxsO/QvjeorexKB6nTYIJYMuqVMsVkO7ZcK36hx0/82Jpps5DkBUnuRngyfkWFOBzsO6O0EJ1qxON0vOUyfC922ASpG16ouW2QJAidJ13ujDPUf/WaF4lTgD2RoRcvNIuD8xk7e6OA=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TY3PR01MB11922.jpnprd01.prod.outlook.com
 (2603:1096:400:409::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 14:59:10 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:59:04 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfCAAahN4IADQLeAgAADMKCAAAk/gIAAADBw
Date: Mon, 13 Nov 2023 14:59:04 +0000
Message-ID: <TYVPR01MB112794AD059F78FEE41FAE03686B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB1126988E1A0741B99DB8DE59C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <3a9184e1e91689757a5b680e699ce02d@walle.cc>
 <TYVPR01MB11279DF8A78E6C15CB0E6209E86B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <c0928bb386aa3d8ad8d1966fa5060efa@walle.cc>
In-Reply-To: <c0928bb386aa3d8ad8d1966fa5060efa@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TY3PR01MB11922:EE_
x-ms-office365-filtering-correlation-id: d86427f6-7ffb-4f94-2567-08dbe4591450
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uG4ykEEaeQJN3uzmyCrqC9W01DYzFWwL+PCkcDhcvGw5JK9vD0z71xHdyRZqvTw5w0lKttgHAPP5n62356ylPZmCbru60N33M+jBLf4PX21PoleTX+RI+bTbT1uS6kGsQjzHpMlXmC0quN8G2aW05Rr6egHJi79l7/RmQiZ8MCH5TY63sQkVz8fLTqdNYlfcsGxBFBLLFtwUZO3JkW9dwCB9DH4QJcFW7lhCZjLu5bYBbYthjQBqAYIlTvyHTsZtSiSmrbHsZ1OmcdN7COEUlzC9qHXIQ4l+hNGvDsDi60Pmbp/UaudpMOBM6EmffL1InUAwJjSskWcHI8dX9epJyteuNC2QVYVV+FNACFGGDqx3mohGtqGK51sTPGmblWgrEHOrM4Ch8oF6BykYZ8jJ97bdTrOV8gRak1e6DVNE9nUfmFq2R4QuA8dW07m8ofhz5QddQVVVAfAuQ0e8i3iN3MkIS9uavYBtbCY4rYmYBqPw8FT/feVVRYWp/C/AHN7QKxhXFVCHWmjzwMRcywgnvomnyTD+Ok8KjLvpdPdvQypWVzimNXei0ONkLIR8iNIVhG8pAff2aHTc8cBASKGNNkNSqKEcBW88AmLyj4eWO8g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66946007)(26005)(8676002)(4326008)(8936002)(76116006)(83380400001)(71200400001)(7696005)(6506007)(52536014)(6916009)(316002)(9686003)(66476007)(122000001)(66556008)(64756008)(54906003)(66446008)(4744005)(38100700002)(33656002)(38070700009)(2906002)(41300700001)(966005)(55016003)(478600001)(86362001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bpPMB9PqAXQh2cG2gBTg7soJhkFxOe4OVcmBrmfKSx+nORwESLA4RHs58UVt?=
 =?us-ascii?Q?0j1eXtpGd7fpaU06NNhIdbIg7hEkpZEFVBTmFAOZrgb9d48jBkbTIxA8zLZ6?=
 =?us-ascii?Q?ICL7wh8cOI+LpuO3v1shp5RXwRsITJ+rg8IYLrNlvSO09+2Nm/RgCRuOEk1Y?=
 =?us-ascii?Q?mChaxbxPQtCjHAEvrvTjcD1zq/m6NSaaNF+3LUiCRk0RIDObj4nUaQ0AnOcE?=
 =?us-ascii?Q?YXNTFFbYjNNRoXJ7nWn7Ic7Kg4YmPaRuHqiij00g4sWmbdM6SpBQvjKTqfx4?=
 =?us-ascii?Q?68ah8UYuHdt02crpp+mmnp54J46R2fVHeQCeeGg51/k87EMn1QMiaY3SAPRC?=
 =?us-ascii?Q?mdmJ6E0OW6tsFMEHEG0H9jY6/2LVt1YHC9vWEc5awkmJO6S3TovX/TeFCy+e?=
 =?us-ascii?Q?MISxC+pdij+9qDjmUMCihbVFFWPhhhT8saEqmICwFsQ/NWX50DttT5GN5SOW?=
 =?us-ascii?Q?AvJV7NEum8WLLy00aXXpHCZXgnkZC7q/tdm974CURsN76Ju7YpyIw2JUk1EF?=
 =?us-ascii?Q?mW+BNHI3mesjYuMj4RFxZdf8Rla6r2yqTbP1ambcdRtFnnc7A4BP7/Y/BwOF?=
 =?us-ascii?Q?7H7J203qG2wbz3oncOZOPotir4DbR5Z2yT6W0GuFsVsF+A7XmYuJiXAqoHWp?=
 =?us-ascii?Q?/V0OEyv3X7ll5m9Y/qmM5MxOnAPLeVnp0dAE8ugo7QCCXDYJ6yi5Tz5kNdJn?=
 =?us-ascii?Q?xZ0Oxjjvjgi2cSO5iXLgRmcen7DCXQ5huK0Uj8BVRy81hZvU7pZGD4ZfGuEE?=
 =?us-ascii?Q?O8Yd4UPZxkV3kfRfYgWvkrAMzrsasgze9RW9UVIjkGomN4hvKRcimZjiex3Y?=
 =?us-ascii?Q?fqBLNHBCg21CHinNWdxdpCmdISaVWgENPYx44UgGuBn7ZfB04k3KhMnKKU2v?=
 =?us-ascii?Q?7J7PcgeiVHVz/jqGCwdrafCCiv10jYvOjEtXC8r992ycIIYQeDLT1oZgubDt?=
 =?us-ascii?Q?dQhulqPUXOjlhoNq242oDPNgV2gIyeNX8gxcEY6auHp3Pwo3GyeXbr7kv9PH?=
 =?us-ascii?Q?d7jOXNtYLrw+F11KBMmiB6jcS8/GboaN5J//4LLImaLfzv+Cw9sAlxTz1Vtg?=
 =?us-ascii?Q?ToJBoIrvb0cRPSlVJgHWT9T2u/gso9O3WPlHoOxaNGjhWoVefrUKGcZMcXh2?=
 =?us-ascii?Q?jLaX/7jm2HyMowztCm8BrH3n5a+VMnkv3mZixJ288Tf3U38B7529D2A+yGkt?=
 =?us-ascii?Q?86a/j+xd9XE/tRDgLxOdhhdJiaGFYHtLqx0A+02xVH0V52xAczf1iO6dmAhX?=
 =?us-ascii?Q?xwuhkdVEHwAnft1/fgAzBJeZrVI4/WY55fYQ8OYZdRf08CAdZJPsVBq9XVD1?=
 =?us-ascii?Q?05M6R0C4jB/uEY2faqOHIRfUGGgvF+nhT52z1Rvi+kC3cTFAnFBZoBDBrw/2?=
 =?us-ascii?Q?nSZpXPYMW4GLGt1i/dOsZ8u+rQC+JMNJ1hrexBTbirWLQB+nR7v1zJB44/eK?=
 =?us-ascii?Q?84PFm/iRZnQeJfOgTi0floUR7I9BXYtyPVKveilHQGWEuTT7Sd7oKtpupmeq?=
 =?us-ascii?Q?ZeK56eEWPcXYGuD9Cddn0FUNRw+Rncs98uFzUuEdtQmgDBt/4MisT3C40fTd?=
 =?us-ascii?Q?GVehGAgu3D6rkbSNoxhtrKe2sGL1bU0GAnq9Rt9JuozI/kTAUCp27I6o2A4n?=
 =?us-ascii?Q?fw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86427f6-7ffb-4f94-2567-08dbe4591450
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 14:59:04.6886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snYsQ9Bxa/AmtmbcBpUvpmJXvLxU4msUdCMg+WzWOZN58Rn9qDV76bCPBrSIRPFwnvqqMToZmrRtt1wQ9kfTIkD6vhi0KzIxl8TvZd5dHck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_065927_119051_362FFEFA 
X-CRM114-Status: GOOD (  10.47  )
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

> Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Biju,
> 
> > After that I will send a patch using IOFV {3,3,3,3} for both micron
> > and Adesto flash.
> 
> Just to be clear, that will just touch the spi controller as a global
> default, right?

Yes, it is in SoC specific bus controller driver(driver/memory/renesas-rpc-if.c)

> That shouldn't go through spi-nor. Otherwise I'd prefer to use fix (2)
> from my previous mail.

Agreed. Fix(2) won't work as renesas-rpc-if probe which sets {3,3,3,3} is called before flash detection.
and that will make flash detection to fail. So we cannot use fixup. The only way (2) to work
is to like patch[1].

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230830145835.296690-1-biju.das.jz@bp.renesas.com/

Cheers,
Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
