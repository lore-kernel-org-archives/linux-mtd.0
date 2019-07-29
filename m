Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCCBC7618B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 09:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD0C206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 09:12:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPGxeHcU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TMXotK78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD0C206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdfN8wNxBtmtIiVPdadjbryE+HaE1ygFVcL/TrAX/vk=; b=jPGxeHcUsMCNJx
	f9Q3YreCjdmDuUJWcJsTyFCVOceEjzHH64+3PiB9P+KEEbMTqgpM+mbunkJp+a2rWUb8vn/IKGW8v
	V5BDde1l3r2P+eM0/ojCpNw3AYz0aQYsMwrNyiAEc1Ynrb/Jq/LbkwMBdI1ucy0r74aNm4LFudEpu
	mCglN65ji2wvKr9Z+W3UYPCS6s3AHsyQ2RYgmX+0V+gD/bH7Cz2GjYTgtX9d3JPttTw7huGAi4OiF
	OhGGEr237fL7wv32LrOd/t8RQIeGoW7m/f9yTZAkWPlr6vveOWbcroB+ikA5lS5xlpfYfXdsXh4/C
	bdDs7QdrN3xRIRQIFtuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs1h3-0007rd-Kt; Mon, 29 Jul 2019 09:11:45 +0000
Received: from mail-eopbgr150082.outbound.protection.outlook.com
 ([40.107.15.82] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs1go-0007W8-My; Mon, 29 Jul 2019 09:11:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQHkwiHVIK7O9NaxQqBYg0Z3V8Dblmvnp5a81EfhA51sSBE7Um1etULDcEPNxDL8yKVQst3JRWMBenPEaMA6HbOmPBPDTmbPAdY+9ifY2nlfi/4GnAKJIMvmfGZXxB+tD4AzP1l5O6nfNLj0BBv1MxsroFIhR8v1r0LrSwTatr9cU0xftuz2KGw1ON1By8DFsf2P0EAnQ1TkPrn3Xu1ZOVGoRpX53wk1D3JEb4eafQvfiiI8meCVYhw1x001PJHMi3+dKrkBk2ejo4idS9xgvQthnWAyxf7F21MJI/TKMZa3xbbZlozzzg7heHLsTd7d2dN34nMkOqzGIkgJI9d/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DveM1W5+le6NwFjxDAyTFbwkrqroAW+OROLjAJ5deuE=;
 b=M1g4arWvv4xTlBijqpE9nMby774Ee1HdVsTiLKeKwkUcy22sSfABzwJZOEhGarRQNOogTKDzq9SA5PsCZcVXdl8OoDVzRH55G/FG5dhFe6THvaNP50r6Wd1ntVzZyxPSBgQJdo++7fZ4UFkHBfrXutaUWn424Tcu1iuYTBLouDTnXU32QtJrKkzAntUaRVwQFbfzJYsmFtsW+P52eETCq1IolDpqyhcOsl/dq8uefKO92s41mCtbokZPB3cCWYCWjPwGgO4e1+FS57l6OZDfWdIis6R6j1zus6k+vYY1H/OyHvI4MHEt2N4X+6cRx0Dk9iHYwF+SvRGFCrEBfsJrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DveM1W5+le6NwFjxDAyTFbwkrqroAW+OROLjAJ5deuE=;
 b=TMXotK78P0PRiowqYKu97VQgQKGSNDvFyzxc5ZP2N64IlxFWJp5O0ims545/vj/4SHmS3h6DsaOmTTb4H6cX0AMu0UQrneABz5K4eoMbH/0RGqAjEuhllc26MWw71vxyMGVu2Uzld+qpVKN6SUWF8ktqDK4E6S2RoZaB1QA/qWk=
Received: from VI1PR04MB4015.eurprd04.prod.outlook.com (10.171.182.24) by
 VI1PR04MB4909.eurprd04.prod.outlook.com (20.177.49.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 09:11:27 +0000
Received: from VI1PR04MB4015.eurprd04.prod.outlook.com
 ([fe80::9c4f:262d:db31:e339]) by VI1PR04MB4015.eurprd04.prod.outlook.com
 ([fe80::9c4f:262d:db31:e339%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 09:11:27 +0000
From: Ashish Kumar <ashish.kumar@nxp.com>
To: Rob Herring <robh@kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: RE: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add
 ls2080a compatibility string to bindings
Thread-Topic: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add
 ls2080a compatibility string to bindings
Thread-Index: AQHVJo/VeuuMDsBciEWXxGwYBY/pIqbC1w+AgB62iOA=
Date: Mon, 29 Jul 2019 09:11:27 +0000
Message-ID: <VI1PR04MB4015B154965BA4BEF402890B95DD0@VI1PR04MB4015.eurprd04.prod.outlook.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200837.GA7806@bogus>
In-Reply-To: <20190709200837.GA7806@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ashish.kumar@nxp.com; 
x-originating-ip: [92.120.0.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 021e5427-3df6-446f-c842-08d71404bcdd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4909; 
x-ms-traffictypediagnostic: VI1PR04MB4909:
x-microsoft-antispam-prvs: <VI1PR04MB49094FD491B98C12E9F5391F95DD0@VI1PR04MB4909.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:480;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(13464003)(199004)(189003)(53546011)(6506007)(6436002)(76176011)(26005)(110136005)(54906003)(6636002)(186003)(2906002)(316002)(256004)(44832011)(486006)(86362001)(66066001)(55016002)(71200400001)(71190400001)(446003)(11346002)(476003)(229853002)(68736007)(53936002)(52536014)(33656002)(7736002)(8936002)(6246003)(478600001)(25786009)(102836004)(99286004)(7696005)(76116006)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(3846002)(4326008)(6116002)(81166006)(8676002)(14454004)(81156014)(74316002)(9686003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4909;
 H:VI1PR04MB4015.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gD3W9ZnKW+I8ndf1ZMElNa3PBYuITlsb71h81vcs3kHtXGT4wuYXR+TYahAdYBQWvMHf55dCWFi7xyxmm7vGqtiVOPsICtKWYnmmTwcW50MmwejXZQU+o5+WHRMF2J/Na7ii9lu2ZjOP7G+xbUF3dPICKryvS6nCC2alUI7WjymsyqnDLPYtcdsNc+s0zijryPqGHliqyel87YTouX/OFF32NBN2QLwkAQbty4PWbNDLKs8ONPC4aQsPRz6Sr215mZzIF5eyc/ezEyNsOE3ed//sz6BdUIwVzmzSorlRkMtxORhGOryL6Cb+6Os5NFY6a2qNv45IW72M5rFm/Jjjf32GlgQ0t7KYgC5QAI8AAaVxJn9YpyVg+KbSQoYJwsy3iusBEceDnGcfTm+iCBZ0hyZ10x0690kMakjl8IMgxOY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021e5427-3df6-446f-c842-08d71404bcdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 09:11:27.5851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ashish.kumar@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_021130_755477_993B1C92 
X-CRM114-Status: GOOD (  12.19  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Kuldeep Singh <kuldeep.singh@nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, July 10, 2019 1:39 AM
> To: Ashish Kumar <ashish.kumar@nxp.com>
> Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org; broonie@kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org; Ashish
> Kumar <ashish.kumar@nxp.com>; Kuldeep Singh <kuldeep.singh@nxp.com>;
> Ashish Kumar <ashish.kumar@nxp.com>
> Subject: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
> compatibility string to bindings
> 
> Caution: EXT Email
> 
> On Wed, 19 Jun 2019 16:41:53 +0530, Ashish Kumar wrote:
> > There are 2 version of QSPI-IP, according to which controller
> > registers sets can be big endian or little endian.There are some other
> > minor changes like RX fifo depth etc.
> >
> > The big endian version uses driver compatible "fsl,ls1021a-qspi" and
> > little endian version uses driver compatible "fsl,ls2080a-qspi"
> >
> > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > ---
> > v3:
> > Rebase to top
> > v2:
> > Convert to patch series and rebasing done on top of tree
> >
> >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Leo,

I think Rob, is waiting for you ack.

Regards 
Ashish 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
