Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69D8C41514
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 23:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA7D20679
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 23:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2UX6mDq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jsBHm+9r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA7D20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnZ81C1idUxizT2/skFYrUo0GZOjROL8BFKG88tcmsI=; b=P2UX6mDqAERPbS
	ygia4NrQdHO8Jaby9m1w/O0SVWdPIVmFo3j0py1dbdSJdeSDr5nlzOkmDuK4ofaklz0xnv16D5R9L
	/LQUJ7OQPeydG//rBidOGEDJFrXlhQcRIosY3ReMFrqSLt1qNEMJ+3ZOt0ed4Z3xrm855KpMIDS7z
	xZtC63vJ6QjIimKIaD1+n4TQpxb6LbP9KC6yYV3P5h1kIhKZz+lYcNIWb8zS+l/KIYKjrSH+D83hg
	HtHIRoz+SgzE9niNnWdVc3Q/ugXEC3t3q5U7fkDG6MIdhpLVVbhUOdoRWEA2kkJgxwcNti4mEiaoh
	Zb+ACVhvDmwaxTPVkyoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsy1m-0004Xd-BR; Wed, 31 Jul 2019 23:29:02 +0000
Received: from mail-eopbgr70045.outbound.protection.outlook.com ([40.107.7.45]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsy1e-0004Q7-F2; Wed, 31 Jul 2019 23:28:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4u5TL1L/NAbKJkW+mwKaQnTnhR25Moo6KBX/cPqjrOr2EcO4F3RIJxl0U5jG2GKmdLt5vwmAi//g4fck5NTj4XF0qpy9yYDP+8qp8fmh+hY2w6JJ4xqtIwFTigggiHZhIg7bpGMRq05is5LZ3JyFHqKGVhPr9cbWhCcTnfNWOxz/6tZ4Q5nMXcTRZ9mYwRnTBZEE4dZSz9VbuHimPTW4D+Sj13smMbIM6q/bOiBCohL9R5MYY9DxcJv9dCaOjyb2/JChyLpXt2vDuRjQVtI1QgRzR00vxPZeSuHV3My0KvkrcftiS02bw8cG8U5auwhKpY/DngyoFRveRk1J+mMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6ohJUkym84NfDDq+/PdrJTKvPG7zABfKOvK4usQaP4=;
 b=FFxIzI2kS0HpNlIlsyyOxIAikvbt7c+1pXLOrEVNio7vW/0DnmA7vF+vWe4wMSvSFToT27X9D9epD0QcIn7reMETcCgOv6HKqF8Gbx8s1qcU8uRlc9RLdaml5DU4jYmLcl5AJWT2ygUczoKLTs5UnQRyXWlCw7Hxv57xzcZvH3Mhf7v/ERkPDWyjQvqnnhOCrhJPA5zo3IAppBDCvEr12676DeEd3xnu1O8YZ4+yXtavcCVqRaW4IjZRsvftMZd3FAUdNg8lvAmLAbi6SxUTgyMILeux5KCXpjBVMivIt/Zo3IGRN0CiIaJzFrf5gYkh7JZgxFVK3DmqynAX5FH35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6ohJUkym84NfDDq+/PdrJTKvPG7zABfKOvK4usQaP4=;
 b=jsBHm+9rHVWkvWuDGQ0bk/cCPQxwTEUpHZPKWn/xiuCfwLqo1hYlGRzjlqXgrtNhcJmMJupqRlyX6efBsF8CvkQIg03KgKYgZnSb1BJiJi8DpnJrwNSvxuBhFPzftM7XO8l8btO4vb/8k1phyWkLtYR+NLBLngSaOKu3WY+d2rk=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6736.eurprd04.prod.outlook.com (20.179.235.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 31 Jul 2019 23:28:51 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3d61:6e52:a83c:7c59]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3d61:6e52:a83c:7c59%6]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 23:28:51 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ashish Kumar <ashish.kumar@nxp.com>, Rob Herring <robh@kernel.org>, Han Xu
 <han.xu@nxp.com>
Subject: RE: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
 bindings of ls1088a and ls1012a
Thread-Topic: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
 bindings of ls1088a and ls1012a
Thread-Index: AQHVJo/WR5aDyJa0DkeJCggmqW/DRqbC1yeAgB61yWCABBUxwA==
Date: Wed, 31 Jul 2019 23:28:51 +0000
Message-ID: <VE1PR04MB66879C5045A813E7311534D68FDF0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200857.GA8477@bogus>
 <VI1PR04MB4015206CD4AAA1E54C5978DA95DD0@VI1PR04MB4015.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB4015206CD4AAA1E54C5978DA95DD0@VI1PR04MB4015.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f271826-1235-4da0-6034-08d7160ed87b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6736; 
x-ms-traffictypediagnostic: VE1PR04MB6736:
x-microsoft-antispam-prvs: <VE1PR04MB67366A31C7AB050BA7F14ADD8FDF0@VE1PR04MB6736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(13464003)(189003)(199004)(256004)(14454004)(76176011)(6506007)(53546011)(446003)(11346002)(486006)(476003)(229853002)(7736002)(55016002)(6436002)(305945005)(5660300002)(53936002)(102836004)(86362001)(186003)(26005)(74316002)(71200400001)(71190400001)(478600001)(8936002)(52536014)(81166006)(81156014)(68736007)(8676002)(9686003)(6636002)(6246003)(4326008)(25786009)(7696005)(66446008)(64756008)(66556008)(66476007)(66946007)(3846002)(2906002)(76116006)(6116002)(54906003)(110136005)(316002)(66066001)(99286004)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6736;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ukhRpOyCwFonqWLpvEUPGEIrS1WRx26ANIG6L1T6slzLlRyCUkj0aV+lqN3uvqKL48tkGeI97y2rcIhX6u1OMR5qjq6ssqWFCuVIka+TesOvMBiuz/NHll8m+k48BBFYKZi82E2KnRAA/n4UH7IZgC+B+NBw3IBDawTlNLOaPO/30CIPfA4+SnpcPSwLAZZRkT5gGt4QACbxC4AUV3ngNgThnrBj0i+GjJPsCC1FxuZiWpQFzCrS6xZpjolZy9dX1s+xEuAp8CDnppWqzdujXn8LbbRVClbMaIMBCXEA0P6gctaEzlX4XNODDd8zIgpawFLiXf8irfYvkL/I9En60XkzhQ1TCAg8uWlY3hA4g9EXz1lZwZXe8PI25mnX98ESLZBkByyWTDj/JpicDmryoernfJDnyQ8ZvPx8/BXATB8=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f271826-1235-4da0-6034-08d7160ed87b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 23:28:51.1653 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_162854_511723_1176032D 
X-CRM114-Status: GOOD (  11.92  )
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
> From: Ashish Kumar
> Sent: Monday, July 29, 2019 4:09 AM
> To: Rob Herring <robh@kernel.org>; Leo Li <leoyang.li@nxp.com>
> Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org; broonie@kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org;
> Kuldeep Singh <kuldeep.singh@nxp.com>
> Subject: RE: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
> bindings of ls1088a and ls1012a
> 
> 
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Wednesday, July 10, 2019 1:39 AM
> > To: Ashish Kumar <ashish.kumar@nxp.com>
> > Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org;
> > broonie@kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-mtd@lists.infradead.org; Ashish Kumar <ashish.kumar@nxp.com>;
> > Kuldeep Singh <kuldeep.singh@nxp.com>; Ashish Kumar
> > <ashish.kumar@nxp.com>
> > Subject: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
> > bindings of ls1088a and ls1012a
> >
> > Caution: EXT Email
> >
> > On Wed, 19 Jun 2019 16:41:54 +0530, Ashish Kumar wrote:
> > > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > > ---
> > > v3:
> > > Rebase to top
> > > v2:
> > > Convert to patch series and rebasing done on top of tree
> > >
> > >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Hi Leo,
> 
> I think Rob, is waiting for you ack.

Binding patches usually go through subsystem tree.  So I think this actually need ack from qspi maintainer Han Xu and be picked up by SPI maintainer.

Regards,
Leo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
