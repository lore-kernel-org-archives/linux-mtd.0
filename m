Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26096C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A3722DBF
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 15:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QeRoCrdD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NLTqiyj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A3722DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YLZFmd9chBmMqUFu4zxgtXUx51wvcBIuntZMWMyBTQ=; b=QeRoCrdDjk19yE
	Aye0Jol5ketr/TYVtgspkRdjB6eNv1eILU8c5aO64wUfPLwZBC4zmhz/5CfLOb6xXuwKVb2OF+1VJ
	7y6aHchzodNnIBYNM2pWycJWBrfBSJgm3NFWEVcvVDtC7OsdI+dxZsQ5WihuSWipMcuwqvpxaVBeq
	H2R/oGTHuqdZZKK0vr+RPYotg9FFY79jmTp4Mfh/fs8ZvIsZhFisImtEUfZB3kcN2hrI3zvQHyvF7
	vQ8COwtCtPRVie6ZJcuhaRK5fl9EGWU/c9A9SHyBl2iyLvYUIDuZvzsbZFlMq9mTK5ONABVntAHlE
	uPStj5fNORGEfw7Oh8OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05w7-0001Y4-Pa; Tue, 20 Aug 2019 15:20:39 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05ve-0008ON-Ju
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 15:20:12 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: tzcJnfunQ2aulBdliByUiPYggXU40g9Bj0IHQCqQnrHbXk/3FUWExtZmJ/LWsQk3ry0VXdX2pH
 yf8icyJrp6pSb4towvDOK/ZZowEtIvS6ZR25Y3rjJ9TE3isxflnaMfOn26aRUMI4tAovENpFYb
 VmAoMNizqaLEcgKrOp6ZbiFGWjpblQG98dUMhvgucIY2nN86eovHr/3nU4zBkRf32ZtACJPc3m
 OkZySbj3zXikctsdylFD5eTj3YWarqPyyRulVbt9QZ7A+APGOonvJrBsh0HMBEtCiQiFd+edOq
 iVQ=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="42943414"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 08:20:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 08:19:50 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 08:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD1HdmrA6fe0qqq4fEtelCUnQuHX7Z6PPnlm8MmASw3qKC6+K+wgee9ukOzrEYMrDHp8h1N1l+dBeu5sXzRCEU3PNkP7z/VxavpjqDom3DjvNzV25XT2QpfGWTwARfFgg7G3+fmmBBQesIRDK5o5h9dqul95QFscc19cJruI3T3WEQ6a1yMcLkoLewmvlI7jJhMoyGM9hxKZalJcy1EWjiPty/GR47znhI16tHMXXtgkGwvnndPgyryUtl7/a9XTj4AHOsp5fzILgSiKWh6pgXfc0ZLRriNxxkcZrEAbFMgsmwVzfrZbcvB65DFvm2z5KX3jWoNunruJbLNs64WEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cFVU8YXS40JzCP6lbwzyk3FRlF/Bo+cxIb15swNpac=;
 b=kKZv/M42TG19TL70HgcrA1BQ19D2HNnaPu0IMmtsUmBQb9Q1uFhFP4jzl+mSrAGcFoiRmPXPYG+7FfOy4rB8mR0lMlxLtWNyxFjxuhOLzykeL4Ltin3JbldgWerHYkGBQAY0Esg8FyN4J2lHwJbaFrMwrhpSJYRTNPqDnv4okbzu/F+FHz1uvQ9dx49WHfo2tEXnJA40SBr+qlBh02uaY9f+rU41p2gpl1YE9oZoO8GY9sV3lcBJ+B74kLFdpcD01iiGNbqmmeWvFJrs33tKZ0gngyRLff7tk3FT+VNUYD7h+EzC/LAfmCGysMDikpvtcGgpmV4S/3IhDLaX3DjL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cFVU8YXS40JzCP6lbwzyk3FRlF/Bo+cxIb15swNpac=;
 b=NLTqiyj8x5V/Kd5w0PiLqkzOqVkoKQmOM11bAuukj46tljair1C8n+LsiJfsApo687avrpXGa7Y4mRtoAjl/1bI9AkdxvJhgcsUNQayz4Gf21NdnLnnP8q1lRckP0ElYgYbhb4LJw5eCgRFWzE7jopPaH4tE7YZT+kOXyEHa3pg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 15:19:46 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:19:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>,
 <u.kleine-koenig@pengutronix.de>, <linux-mtd@lists.infradead.org>,
 <js07.lee@gmail.com>
Subject: Re: [PATCH] spi-nor : Remove SPI_NOR_HAS_TB flag on s25fl512s
Thread-Topic: [PATCH] spi-nor : Remove SPI_NOR_HAS_TB flag on s25fl512s
Thread-Index: AQHVSEqp2T8+eQ9720CVfnNQG9cxFacERMGA
Date: Tue, 20 Aug 2019 15:19:46 +0000
Message-ID: <896ffad9-c3df-f765-11bb-2d3bdcccd814@microchip.com>
References: <CGME20190801092216epcas1p18622c765605e4b616d6eaf9fa55d2f3a@epcas1p1.samsung.com>
 <20190713135620.21016-1-js07.lee@samsung.com>
In-Reply-To: <20190713135620.21016-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::15) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab9cdbb9-66e7-4198-af9a-08d72581d5d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4223; 
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB4223FEB84F7C28127F96CE26F0AB0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(31686004)(53936002)(76176011)(11346002)(14454004)(229853002)(446003)(6436002)(86362001)(6486002)(6116002)(6512007)(2501003)(186003)(3846002)(25786009)(4744005)(966005)(6246003)(6306002)(2906002)(31696002)(36756003)(478600001)(66946007)(66556008)(66476007)(5660300002)(305945005)(7736002)(64756008)(66446008)(486006)(2616005)(81156014)(2201001)(26005)(476003)(81166006)(8936002)(8676002)(316002)(386003)(6506007)(14444005)(256004)(110136005)(66066001)(102836004)(53546011)(71190400001)(99286004)(52116002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xBBbNa2+i250gvFCwprg6I23D6faKPhE0NB+L7om01J50xQDV/IeQcNO4th1pxyf2LoSPpKTm9W8Wjjxw4HwpRuRlfC1ZG2ZwrpR/dEGmvBl8LMf9fUuvPLaKHvilNAxGGg+ET+a6k7RYtPudftTS4tVvv8mxIWQ8fBbmTFutfa9mLzvReefEt4JZbqk5F5t7/huMKBI91sMwXblLAKFzICUbs5DMKldbwD9z63TvlzT99QS+c7/gJGAJi5pP1QnPduYKPfWuVdPiaeQnvnygK96EMKUxVUhazJkybVouUEXpXZ924JbPAPYbq7HPJjhpcZJH9WPqzy1OJ7qNmJE4e08eWQ9QdJWvQVh74v2QSy2bp0NYWnbjn50j9OTnRkZQDVrLvNTAKyvD4FLWA1N8/SuSB6GyiXWDSC43tl2h+k=
x-ms-exchange-transport-forked: True
Content-ID: <52536430A3D5AD428070E74FA96547D1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9cdbb9-66e7-4198-af9a-08d72581d5d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:19:46.6063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWRj3/r3FvWivYkhFOk4n5i/CQUeNlKhvygqHZWGE2MAjgdnTcVuQQTG+bIttfjIvcQtZK8rqn7Iy86X3O9WoU/zvMQgDk9BxXB9Z7PAkhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_082010_870757_C7D6DA7E 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/13/2019 04:56 PM, Jungseung Lee wrote:
> External E-Mail
> 
> 
> Currently, the Top/Bottom protection function (SPI_NOR_HAS_TB) is
> implemented to fit some flashes with TB bit on SR.
> 
> s25fl512s has TBPROT bit on CR1, so the TB protection is not working on it.
> Fix the wrong flag on s25fl512s.
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---

spi-nor patches should be prefixed with "mtd: spi-nor:", so I corrected that and

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
