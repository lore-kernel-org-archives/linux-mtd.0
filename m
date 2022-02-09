Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A118C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3y2A9B2muQMpvfYl66geHO3nnmXWG4qSIQ8GnHujZ4=; b=fWtbZ/9ZrgK2Ku
	ZFwYegmuDcUY0DwWIgpuga1gOa9t3oCSM8L3K9e06j8GNeYYiApr4t7HcXTUUmnKBq/rXN2Q4KmgW
	EuA2RYLMmLwh0vlpoNTAhmVGRI4EvK6nH0mmmgnZLrkaeWWWEeTR7mTTD79M80p9m05gN44MUB/1S
	vh1Jej8Cb0tTs9lQBK5QrJkS/P0PlP+yMgIOosUQFSFK9shR/GKxeb+eI/g6YUP+JYD1f2YH9rJ/2
	jBr0LkArzkcini8RiEgB0dr30aCyZKihOFsbLHJ2UFYUlo7Z6oy8SSiW1TNMlUnMWl1Vt1yHqoekl
	D/EzZF5FPqyoM463zppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHkDJ-00HG2L-Tv; Wed, 09 Feb 2022 10:28:42 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHk8d-00HE4C-Hp
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 10:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644402231; x=1645007031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JHsMEnv9/CHTQo7+cloCyrpQDyEnXiO1CrSg7mZKkT0=;
 b=hBGAKrYhPXgSsq2koI7i9xYoTNyaHQAb9Hd0+X2qV2OLb8+j7QB4AdYw
 KhlArA0LpRANECpnazrbZM2DJO0vvp89ddnoOCCXw1pr0nG0QFDTF0+YI
 4xno1ZoXyaOX4Jw03c9Nmpvgp3W49qN8fI+NrVjoYyMC/vElvzDRsXcIF 4=;
Received: from mail-dm3nam07lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 10:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4Ctd1lHz7Sl3fT12MWFjzpTjVyO7INUd+9xfmybERbV6ydvPLvmwFp3t9OBHHj8G6zaJ8RkwkLIOYgz6dxuo4ORL585+5DUamt4meI9VzkXMIM3jGWUUhiTvofR7GBnQJ9R5W9/2KjtjjScvQLsH8sQRBeGCb+oZ9SX/JaZbXlieMwi+5ZmO/1lHxEhImTVcCAziLnCEgVqhiP1vGbRlxUF5vigWLBrOzhAfcn+J66UeGQHWyiF7BdUNeLllL+xEB8lQ3YfEmaeHktv7h9+1zKBVRt6zCc5EBljDTlDYHPvfN5l4jz6gzqbgpH9XT+74/Qa74LTDsyhNLRtplTZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHsMEnv9/CHTQo7+cloCyrpQDyEnXiO1CrSg7mZKkT0=;
 b=ff1XPlnVwZVoxAIsH+o5lscitJQzo1t14elPMwaAgDkQqz6+ndskGSo9slAC/lSOUL0ijapF1LXq5d+FjA+L+jFqC0f/+vwZEtqgJ6KwjT+SHKY+EeVT+76D+P8Tg1gTql/pFRdiL8UU3/j1Vp6IceIWiEev56EnaO264TmmGrA/9eazagsL9mDiBK7kXlky/16/OVTsdiWsyT9pjES1Lb1cwsMfP4eRpbez0/dsxTUVaWIuiTBTBX3ro8zXZqgQGNbzF4BT2VJZymhub1YLE6mubBNepD2SoaZjPY/MXNz8GBlZmqYbWA2zz3BWeCO2Urki5VzSimTY6xRHbGempQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by SN4PR0201MB3437.namprd02.prod.outlook.com (2603:10b6:803:51::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Wed, 9 Feb
 2022 10:23:46 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7%7]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 10:23:46 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
To: Michael Walle <michael@walle.cc>, "Sajida Bhanu (Temp) (QUIC)"
 <quic_c_sbhanu@quicinc.com>
CC: "dianders@chromium.org" <dianders@chromium.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
 <p.yadav@ti.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sahitya
 Tummala (QUIC)" <quic_stummala@quicinc.com>, "Veerabhadrarao Badiganti
 (QUIC)" <quic_vbadigan@quicinc.com>, "Ram Prakash Gupta (QUIC)"
 <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "Sarthak Garg (QUIC)"
 <quic_sartgarg@quicinc.com>
Subject: RE: [PATCH V5] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V5] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHYHSZc+MddQRsTVUmI/Muk+X5ezKyK5F4AgAAfjMA=
Date: Wed, 9 Feb 2022 10:23:46 +0000
Message-ID: <SJ0PR02MB84491A01308D4E2B125379F0CD2E9@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1644350330-8809-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <d343f7172f179ac2da96f80f54cc500d@walle.cc>
In-Reply-To: <d343f7172f179ac2da96f80f54cc500d@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a4858f7-3b54-4d73-3e7e-08d9ebb64165
x-ms-traffictypediagnostic: SN4PR0201MB3437:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN4PR0201MB3437218038881F59A952BF93B12E9@SN4PR0201MB3437.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fSqykmjDVHyOPmfeGCvHuVc4rp+Kt8UI5yUPFo5B0V2GUtQvkj1U1XxwrFtA+9unmU2GlQ7ZPXB1Riv/8m9ptoAigVTRRt/vUvx6JCpLaLyqXbzUpfkmNorZ9coeqAu2cyRXYBTZ4kt5ldR12mlgSSIRkB72neUKNlvJ7Mg+10COa6l7PPuoj83FFSnwZr2tzUja/X9BfZAUY/e1CbBWEtdjcBV+LbXaYalO0vMvypKIg6RI3+jx4mcd/mRMgOPnIGtd+Z/HQOVFLRJ4s0lIFhlYPVdXWxT9sr7hEFS6hFgzl2JHFJbN+FymiNWWaB0jROcqGxQxEvHeo6rqkyKUNu1HHeitPSNJjhCEbVL31dZyhVSvsNtm6Btx2s1P7grZYCL24m8dmDVIGMnfNXaUhfFjXtk/UmZcFkRAr4deNU1MrEsvMmo6Gm0BkRFLIZ8L+YVrSemY+AnlZl+xslYw+6d+1LDZqG+mSojGSMvopPONrzn2J6BiRuZJP+A2CradFdlWiWdJaZXSwZitu7iMNgk0QMJTqSl6TkTRLeToVQePbDCafyc+ZEhLVktMPlVcrpFVEimzlvI09XxetXkpF00coMyW7JZ73gWS+9zKhdTCUnamEZgKkcEVopN379T2kbgFSFc9gZ8gqJQegJLujk5obRbot9fO+JUU50XyV2XC72CPYcmuUK+vLCcgk743AD97bH3RAYtQeHXf0OiMag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(316002)(26005)(186003)(83380400001)(53546011)(54906003)(508600001)(71200400001)(33656002)(6506007)(64756008)(52536014)(7696005)(66556008)(55016003)(8676002)(86362001)(76116006)(9686003)(66476007)(122000001)(107886003)(5660300002)(66446008)(110136005)(66946007)(4326008)(38100700002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nDzqywFtsVjy9TlO/mfzPnQ0gPKopz/0oYRcYMkGAD4fcHEqhGm0z5ZSMQr8?=
 =?us-ascii?Q?rB1cpYcoCqgS4UpBiL4ElvPl2Etda/AuFAJtPvZp0oF3riZn7yLuPCxW45gJ?=
 =?us-ascii?Q?TsK6Wi5w2iThKI25EZU5DHcrkyojT8OYGgbC3qoCUQkLGFIz0FKaWJ0WqSLG?=
 =?us-ascii?Q?i/ty2yPMqmZ3xdZMLIsvJEr12NoqWjW7bP9KoXiQGBuzeHypJ3CCjZ7qz4x3?=
 =?us-ascii?Q?sKl3ttyeF7ocFL0R/i9Xg2H9JfL/BOIpinPOmRwfEjXh5mYRhqbw4nNWKzEL?=
 =?us-ascii?Q?/c66AJ0/m1Ok2BpbGA854H6Nr+aTYAbTwpYFfoPVtRj14LwVOwc5AMzaRL6x?=
 =?us-ascii?Q?90yzmJUwPJksEtIgW5mp+Px+YtUzJlCn7pLtFE7lJkSrAElRbH4l1Rx/HOOx?=
 =?us-ascii?Q?8fiJUxzVfjQNUjA+D0IUlWAuRMarCGV+DGHGsuMG1Btd/LpnosmRTB7zhQlf?=
 =?us-ascii?Q?FQfrrszbqFoxpVD+cDDbMkvnYU1W5CEBcj05uxUlFCysdrsw9Jw/KVqyuTTX?=
 =?us-ascii?Q?uCLf/l/5t32XktcNCpu8qEGP5OC/gBCaJgDawXxim+nw4K5uDgJq8MlPllSw?=
 =?us-ascii?Q?V0yV+5/DTVxQLrVLpbyffZ/kaz167eBwueM3iufLrZpcfV/zw9QmyZ/2L5pL?=
 =?us-ascii?Q?FSHM20sHqPsYzNHk9YdWMXmO8scM/jrdeRDtsXte5qlB3X8SmBRmXHo8PJnK?=
 =?us-ascii?Q?GD0LJfZt2eLHFwX28L79J2uNcXuKTOX42NjeFkvuUMV4AUSG13gqIB2AKJTH?=
 =?us-ascii?Q?Ma6t3JryT9NpOLL/5/SHhXY/munm0BxrmwIn0z818DQCiMngK/rNH2zqNEJv?=
 =?us-ascii?Q?c34HI1X+HsUG6nQENnoacVmSnzzdQooIZBLtjX3uEXPDqxbpTrZm/gD7GkNp?=
 =?us-ascii?Q?Got+4TkA6BaSnblkmiL62eKgiBA5ZTOwzFajBsDtVzSynY/PtgvJBkU0lsWE?=
 =?us-ascii?Q?UBmYWRJBcPORvrrnNO+hd7YDoBfJ5x3PYk5w030ffjAFm8msTglImXa6vpM3?=
 =?us-ascii?Q?FwzKqckZvxJl8pRW562HzgvqbW3eFqgbnGRtRkWplXHT3DTvGbG7+XBaHh6s?=
 =?us-ascii?Q?yNSYqLkJm5WodnFhfSFCxt4CKQ5KqPQdObeIogqE9CECBANeVrw41ytyI5+9?=
 =?us-ascii?Q?UIu3X8THy3U8kM1YGQKb+gYEBbwv6W9x/pCIEOymDm6JUaiGoIXA2cDRk/tx?=
 =?us-ascii?Q?Zw+iG+rxRZen/8imm7tmT/n2LUDn4CdkFcO17cdkcy3vZHoHRjzk/ImEA/MM?=
 =?us-ascii?Q?nRpJq26WAZe8NN/Vcc1f0hHWo+54W00LkDzaGQ5htdpm7MqB2Obp6Z59k8Kl?=
 =?us-ascii?Q?YjBmTUkSvmYAngZnyq9MQyD9URL7U4enMdjMRVVt1v7LBp06OShKOokT+SzF?=
 =?us-ascii?Q?wwMPJxlPtyuYa4e3XcY4HHO3AnS3EDYVO2oXlT6SPULh3rbf3jyGovY7RMkv?=
 =?us-ascii?Q?xN/9hZmyPDwKVFSMlOnkEwOoHN56ddKflwVInmK84uxtddrCHj9j81q0+Uo5?=
 =?us-ascii?Q?oeeveFPBQs4s8y/Xx1Zp2N14HTER3XbRu3DfoOIeggr5axPXFPfQ/xqak6pB?=
 =?us-ascii?Q?HqA/A4vporafLkYJhGOpoPohPs+DVkjQjtur1Tr2mhMsQybz5hlU7Q30GHRn?=
 =?us-ascii?Q?lXxeInbVrweGTUDuelzR+aHawxlk1lTd/3JCVAOXwm1pMFcC4cBwbdNiEyPq?=
 =?us-ascii?Q?v623rw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4858f7-3b54-4d73-3e7e-08d9ebb64165
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 10:23:46.1959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: siRGAN1dEgKDFg8X+4NTb3pnBPDPe20DgpnO78vc7mfDtJz/gndHIgWkXDRcndBUXddB8W/Wy2dKo5/ecax5iDTyk2Rs7q+s7IUl3eJ5k0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3437
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_022351_724274_CDCFDF55 
X-CRM114-Status: GOOD (  17.68  )
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

Hi,

Thanks for the review.

Please find the inline comments.

Thanks,
Sajida

-----Original Message-----
From: Michael Walle <michael@walle.cc> 
Sent: Wednesday, February 9, 2022 2:01 PM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>
Cc: dianders@chromium.org; tudor.ambarus@microchip.com; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Sahitya Tummala (QUIC) <quic_stummala@quicinc.com>; Veerabhadrarao Badiganti (QUIC) <quic_vbadigan@quicinc.com>; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; Sarthak Garg (QUIC) <quic_sartgarg@quicinc.com>
Subject: Re: [PATCH V5] mtd: spi-nor: winbond: Add support for winbond chip

Hi,

Am 2022-02-08 20:58, schrieb Shaik Sajida Bhanu:
> Add support for winbond W25Q512NW-IM chip.

Also please include that in the subject. Eg.

mtd: spi-nor: winbond: add support for W25Q512NW-IM

> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since V1:
> 	- Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
> 	- Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
> 	- Updated flash_info flags passing according to below patch.
> 
> Changes since V4:
> 	- Added OTP support for SPI card as suggested by Michael Walle.
> 	- Updated SFDP flags passing as suggested by Pratyush Yadav.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 675f32c..315b9f6 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		PARSE_SFDP

This usually goes first, eg.

PARSE_SFDP
FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) OTP_INFO(256, 3, 0x1000, 0x1000)


>>>> Sure will update.

> +		OTP_INFO(256, 3, 0x1000, 0x1000) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },

Otherwise the SFDP dump is still missing as requested in my comment in v4. Please make sure you put it in the comment section of the patch, that is under the "---" line.

Then I think, this patch is good.

>>>>> Sure will add SFDP dump.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
