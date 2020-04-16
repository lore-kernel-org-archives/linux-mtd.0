Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A2C2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 16:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB38B2078E
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 16:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z39uQT6x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="HoxDPtVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB38B2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFGKZgQypQ7VToi1KNlrQH28m2HD5vVkWRLbwktso/g=; b=Z39uQT6xvC5Lmh
	3OxGNM56Qs0S6vA6bJLC2eyqE7IsXOVLDKLCJHRe9Oqo0krnRu0Hj8QrOlfiaQW1Dlmyw0YNtatC+
	wrG972RM6J89Ym32X6FvybS6dlNm/o8Q8uDLvtIptY6gn6Y+052RW/rCAJmvdlGHQeER2Rs3kaJVz
	g/BNUT4fyuVKTIsetRpCp0a443og4gcK5W7NnpPsyVhN9LM0yCT4oaMkQEYvm4TyQ+WB9jamepiHq
	4pZmW3MW5qn82yGQUa/x2JaHo7dqyNfIiA/tVPAQmc3+x0Oz0Rzitj/hrLzQeE0G2LQMVO7vq6jMD
	0bvWS7NdQ9yuRQjdPFuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP7gS-000564-3a; Thu, 16 Apr 2020 16:48:12 +0000
Received: from mail-eopbgr760044.outbound.protection.outlook.com
 ([40.107.76.44] helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP7gP-00055K-4D
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 16:48:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMJ1hJhK9PmklCdNnjMaGitqiU3ECO6UkAhDUcQOsrRkkzpMQsn+WFYYwDkdM1WOfE0cj87gvSpcAAgV1KW2k1pb9IoZzSguoMtTH0pbPsNuB7ONeML70EmyEFi8EJfMCI1R7u+KSwhXHhr1xpye/cdb7bvo/NT8qd3Z0EzHoQdZFIjn0HWXbLQMw4Wxl4as1NoheRwkiFC1TbuZsaaD4P3mTnuHZ1xZzGq0wuDdFaytIJnHyd207pSWISs+uwDw2bC9p2qQP3jVVQugyizlGb4bJnpLpXw9IZ/OiTRkTBjZV7Q35a5g4NqkUh9Rk+02oKkJGGlE/tTdRIIzMSTs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49UDGj+oFDZqCKwwIvxzb3/w/JTioNNV8ddKmbsdbkQ=;
 b=ee6eGcvciT1b1bcwOHQKmX0QwRCF2U73minTQoPVd/5x/8qUgE0HvcMANMWI9HcjSu+VVEtE02zLNA0Juj427xqW49BxsdnLXM/8yxodyW3y314I7qRIBkF5l4H7V71M/JFIiPFi0RGIgnhClIMeXhZg3DIxXKEdcvTwzyor5iC80F3jDp5LHQuSYVRXsTfPPIc1OCbPZM7g+YwRCYauvZODx11qTPiVquxb5k7Tv6C+1dbjih89FkQzhcsjvv/R/tS1TpdrmUQXKtQSLcga+SYp7yfhrO89Z3YJdF4ErUSkayrSshp3RJBijbyxYYNO+1cCgf6qMDOXMcuAjeZl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49UDGj+oFDZqCKwwIvxzb3/w/JTioNNV8ddKmbsdbkQ=;
 b=HoxDPtVHze9KWkfTx7HvKap0T86VeXAtvtMzftWwrbYrM4mVpuqjN9DlG+g/uFiGMTgXhvws1cxEmGDASDYSVtsbnyGC1XKUOufa3bUX6m1K+3TMy5urI1If52xHBPiOE+aHca5aYRz/P+bsAF6R1RLuemoPWr7O+5OY/SrOKtc=
Received: from BN8PR13MB2611.namprd13.prod.outlook.com (2603:10b6:408:81::17)
 by BN8PR13MB2755.namprd13.prod.outlook.com (2603:10b6:408:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.18; Thu, 16 Apr
 2020 16:48:04 +0000
Received: from BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929]) by BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929%6]) with mapi id 15.20.2921.024; Thu, 16 Apr 2020
 16:48:04 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: Ron Minnich <rminnich@google.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: question on spi-nor/controllers/: nothing builds it?
Thread-Topic: question on spi-nor/controllers/: nothing builds it?
Thread-Index: AQHWFAYJJd0kymzFik+zbTshzmVXMqh79E6A
Date: Thu, 16 Apr 2020 16:48:04 +0000
Message-ID: <BN8PR13MB2611E2F1C137108EAA6BBE8899D80@BN8PR13MB2611.namprd13.prod.outlook.com>
References: <CAPAv03NygZR1vOCHrhVcSotkCHKVxxwe0Y6Bpz9_LLKFhqS0bQ@mail.gmail.com>
In-Reply-To: <CAPAv03NygZR1vOCHrhVcSotkCHKVxxwe0Y6Bpz9_LLKFhqS0bQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sagar.kadam@sifive.com; 
x-originating-ip: [116.74.151.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b035665-bdb6-41b2-a0d8-08d7e225eed7
x-ms-traffictypediagnostic: BN8PR13MB2755:
x-microsoft-antispam-prvs: <BN8PR13MB2755C14B5AB5931E63656D4899D80@BN8PR13MB2755.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR13MB2611.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(396003)(346002)(376002)(136003)(366004)(39850400004)(81156014)(4744005)(186003)(33656002)(478600001)(8936002)(52536014)(966005)(110136005)(53546011)(66476007)(7696005)(5660300002)(6506007)(8676002)(76116006)(66446008)(64756008)(66556008)(66946007)(316002)(55236004)(44832011)(55016002)(9686003)(2906002)(71200400001)(86362001)(26005);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: korbVyi9JBikp553ZHSidGrUIGeBAQ5/K2KuabfjonbzVucJS81l8XEqacMtxXWjUwhQ4M779UrgUdYiCXrO6xPqwExNvvH1FEL7XDMQ3alrQxUX2ON3opH7dYwtWhay1Ta34zgmduJuUD72HEKvBgGPl21SPDuH3X2cFdKP0hFYkmcMMHuizeNawlSgNmNWpb0PGeWPWjMwTiLVJ4+SqC2WtxqhTcqduf3cTMiIoQafbHKSO4IijNfxC0A/pXkGaHTCXVQ2x1oS/KzUgMY+UPj2PjPyD46q8J0VO47NPWbqS/ogSeJCfzCcy7N8apUIPhYNz9K5LPP/9TqA9xDEOY3sYaOHE8t8vH69nFrGoIDz67CQMpic3mSsh+8r+YmfjuKrMh8W5ZtyN7CTMC3Fia4EWrXFnAIJ8AgPvpiTgNyo/LmF+DDnwOsv73S7/yyiLEz2dRh2swVxulKZ/zy+iVkY75tw+g8Q0Fzook0tYT6dTdf8Obdg9dIGorBHFQ50YX8Ol3KVWAgQwZ2sKacV3w==
x-ms-exchange-antispam-messagedata: cPnHGLtS6/6aql+W+2TpH46yJLK/HyNvf4A8KbgCuzHCJkaRcDOSakK8tdpORKk7GgpD/8wNTpTv82XO0ky1GwaAVM8IF55jC0WcEZi9BRF7Z38YTjHB9np7SLyr9p2PupGWbMN8q8kOzAcPNllMIQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b035665-bdb6-41b2-a0d8-08d7e225eed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 16:48:04.3441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rgBMnm8Qlxop40BS206x0poEVXtg+BDtfJEhkkEH2WMQJEDn1TJD+1jwa86RqaScEPtx0k00JIonEGIi7OEJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR13MB2755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_094809_281647_1820FCC7 
X-CRM114-Status: UNSURE (   8.96  )
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

Hi Ron,

> -----Original Message-----
> From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of Ron
> Minnich
> Sent: Thursday, April 16, 2020 9:15 PM
> To: linux-mtd@lists.infradead.org
> Subject: question on spi-nor/controllers/: nothing builds it?
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> I'm looking at 5.7.0-rc1, and I notice there is now a drivers/mtd/spi-
> nor/controllers Makefile, but for the life of me, I can't find anything that
> builds what is in there.
> 
> Am I missing something? When I enable CONFIG_SPI_INTEL_SPI_PLATFORM
> it does not get compiled.
> 
I think the patch here [1] can fix your issue.

[1] https://lkml.org/lkml/2020/4/9/728

Hope it helps.

Thanks,
Sagar

> thanks
> 
> ron
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
