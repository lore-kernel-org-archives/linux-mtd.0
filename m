Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893CC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:09:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE368208CA
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nrMFAtdk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="YhLuQ+GO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE368208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QQTlj5YDsB5ZZaRdcO7kimpfWaXlaoi8HH5PqgcJuw=; b=nrMFAtdkpjDGq6
	UCrMRxtCEJ/rkpi8EwpooDFkDMyELh/Mex4NN12QOcQr7cJZMM2xxm1nit0lDcTyVn88ZLuUgOexw
	D02FCNJhgwtjU4dU1tAZVehm1WEdq200Vf4uXlnvhOpuIt7pBR164iguhNUKOj10Zfw9nIfpyG1bi
	8BBeT5seoaz5c6Z+UbJxtTbcRpiHjjr1ifXXMr0TOvX+ctT7z9gewh2ezVclfAp6TjF86Dg0O+Y2P
	Pt4cW9G3k94Bm8INd4JGx1adodnurfRE94LJCLa72Z321GgHRacSaLO1QKfW9GvMwJ0O+2QWjv+S5
	I55aaSlZiojJHRa11a5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWMbu-0007tn-3S; Wed, 06 May 2020 16:09:26 +0000
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWMbq-0007sM-B6
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 16:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSq5tjw8qtBLeg5WHoLb0wR6lVi7ouJHVNsiZWwlkvgsW8gnoTjsleXcrJ+Ypccm/CAtgTOGH/dyIkAWRRBLEcN1IsC96tItXUiVShFLrvDkFfEyXkTHI4ppk3a37OFTXnsCgvTnh5TEuAa2ju98NAUGPoKXC2Q2XYSxDoh8Y4zwQmFW5pLWqKZ+6c/ygfwo5tPpNaMhqRhH7lX1bzpuyblMVnXMAr9nU0h3vGMNehc5KEfSFoZYNl1FrU57pz7YQi2AO8Qvmultzmz9fnjgfRJF46XQt5Dk+fuzPoalRLA0BHHe3rOwthiqd/oPBuOZdOzNtjJvPAT0xEW6/hd2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOwaLQjrwog2h7sI7OZva69rWIbF99Vs5aP+C9gwi7I=;
 b=FuT/V6uU8fETosj164fGbTaz6Yt/kuJ2NmfJuZbK6HUyPc/7tf5QgE1tEDT4c3ARy1xo8N9bft6aU/CuGbTnOZw28O5ElVIo2aufx21D273ypgcU909712v6cOA3l9QcDhElvJrzCchyoX7H5uhGCDy5M1gUm1pmfzLGwTjZdmYn6pZKxOEsr3kcBJdzkNJEyeIkaCS0DtUAAZ/cxG0/CJ4GLALaLVebGry4OTDIF6R8Md0FZC0iW9BLnXiA42s+UdY1RA7mBsORbvc6ppye98PDz+X3tMUnkE/6t8pz/Hh1+7VXLHfLH91gu0DAYYsG+nNUuhZc0KNmJP3WKR10Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOwaLQjrwog2h7sI7OZva69rWIbF99Vs5aP+C9gwi7I=;
 b=YhLuQ+GOkVpDBOCBdTG764yJK8l4VSsbFk0YicIGAoHg+XNpX3uF9heBMXq9O/iapebHMrDhjgAYOHSpCZnqMCIkvyMmTAIC8Bd2L09/4Fw3YPDT+wNiChuH5rkFd/HaCLWAlQNbdQZLNzZRLY+D7IqPiW7TxbI+tAI8FTM2zqQ=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB5140.namprd08.prod.outlook.com (2603:10b6:408:30::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 16:09:19 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Wed, 6 May 2020
 16:09:19 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUIAABVcAgAAAtIA=
Date: Wed, 6 May 2020 16:09:19 +0000
Message-ID: <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
In-Reply-To: <20200506180420.13996633@collabora.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWVkZGM4M2Y5LThmYjMtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFxlZGRjODNmYi04ZmIzLTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjE0MjgiIHQ9IjEzMjMzMjU0OTU1MTQ1NjQ2OSIgaD0iS25vUngwUk9CbXA5Z3pvVHRTMGNqUFE5UnZrPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFEVmdEeXd3Q1BXQWMwRHVYOFovZFBFelFPNWZ4bjkwOFFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0def8e37-29e2-4d48-6b50-08d7f1d7d552
x-ms-traffictypediagnostic: BN7PR08MB5140:|BN7PR08MB5140:|BN7PR08MB5140:|BN7PR08MB5140:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB5140CDFB04A317FA8EFB6E65DBA40@BN7PR08MB5140.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8DziFly8U/cmy7ZeemlE5Wdhr2TDKC6vwYDd6aKE/MDC3aouEcxriUEUg2FsiKmvcz+XBJa7U2vL/p3QqG4qggbDfPxWziRPMsepnzOhv8w2vWi5jytgvdIl564ItxartgIAyooVwcNBmUCmiGjZjj5t1kz9Ohi2wA0r4+x3hCdO82UzP3DK8V0zo39rf8XfcdA3/HR+zZHsC7JfHwN9zt9kEvSbNrS+5ax5nynEZpQocs4DBCzyfkU+eKc75ES9v3J1/mO67mqW6MRn8aGwKx2hj4K7Lm4MTpsKSpEX3DMxN0Z2maJHbloH4j6l/6eGNaO0bCMabBolWl0v4dHN3Mk2U274uW5oukGPsial/WyuAx9E3AlfxqV5RLWLsnswMH2c/hI5WgsabGxo38scNmsckm6wpjmnFZc5FwR01gvawzc6+s2PJiPYMfFtzVRdqHwQgWATITlURm/GsQZZfI5YNPIeWmrVevO0Ibe+sgiGza0hYr7woPXPKpG34bEczbBxWMmOKzJiOIIwzzoj6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(33430700001)(71200400001)(76116006)(66446008)(66946007)(64756008)(66556008)(66476007)(2906002)(5660300002)(478600001)(33656002)(186003)(9686003)(8676002)(52536014)(55016002)(26005)(8936002)(7696005)(86362001)(6506007)(55236004)(33440700001)(7416002)(110136005)(316002)(4326008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wfB7sO7nHvNu8cymadbjYeL2DOz+Jj00CMjJkDoo7qlcwYCedTrJ1boYJZ6oIH1Lza7HmNDxiIe5mweiC4KwvaH9zX7zWstOnLA3pu6u91GM9CB9ru+iizvPz7C3OfvJiUnpCkd97aDkiW6lT4cXrFHjTZoLYqAgHJ+l7In50Q4QLlSVtgUl3+i1J9QnwJVT9xm0/OPlShN3xGYjAE7CLOGi/GfBGyiJPWioumoAkK6V/mCU36Ux7neION+4jn7tmSzdTslwW3SVkg2xTnlumMbWcM+01NjmeemjcNERTSKO1p1RjWTCYOW5XrcUcpo0dPyQ38LEaOLAz8tc8XVe1ASQHMVCx9xymte4a285tZQanQ4XyEDVpbyndsH4+ZV9L5obTXTEd1J7m/wkgc6TK9T9H3tJAQVoTDCLqdtKCnFJE2ZCybls27UltF9m/jSCXvlCn+w9LENxSX2LdjCvTdlNuKSTh6R2c5CxrqMuEbShr4dWd4Bh08R/1PLxr2IguagRNsMoTu6gVXMMIarfcpWspEF9zVxISKr3m9g5hV7eFnjp7N+dtaF/23KiJom8o9WUsskcX/9cStfjqhYpf0g50v32CuLg8HrqP3HM2mBsXGtr9TDNFKT8dSsZxhanjgzBFI9j9NKvmkRCw3/c8rMD24TDnQ0IDwLO+K+KxWrGIAAPN4fUFC4tvd6N6nJ4jcpJzGOk6uNvpmHG2CBtfzLWQ0uneYw3D9+5IK47PWTxXiCKN70rJCjPFNGVqUkXIAHM+8lzK2JwayyCrYVigFxLj6dRf8u7TMIICbTVb24=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0def8e37-29e2-4d48-6b50-08d7f1d7d552
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 16:09:19.4716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZO3sVDLwb0kE2JJzUlgAAUgjPMrnZ5PXCH+8ROV/07IL9m2Z5m2F5cbr0Mk5A1B9eUOrgvzqSq1AhuuBMHN+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_090922_386479_D37929B0 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Richard

> > > > > +	}
> > > >
> > > >
> > > > Here, if the power loss happens before erasing this block, for the
> > > > next time boot up, What will happen from FS layer in case FS
> > > > detect this filled
> > > data?
> > >
> > > Most likely ECC errors will be returned, but that doesn't matter
> > > since this block was about to be erased. You have pretty much the
> > > same problem for partially erase blocks already, and that should be
> > > handled by the wear-leveling/FS, if not, that would be bug (note
> > > that it's properly handled by UBI, which just considers the block as invalid and
> schedules an erase).
> > >
> >
> > Concerning this, I still have question, for the UBIFS,  If I am
> > correct, there are EC and VID header both being damaged, then UBIFS
> > will re-erase it. I don't know if UBIFS can handle there is dirty/filling data in the
> some pages  and EC/VID valid.
> > Maybe Richard has fixed it.
> 
> If the block is being erased that means there's another one mapped to the same
> LEB, or the block is simply not needed anymore. In both cases, this old block
> shouldn't be referenced. Again, if that happens, it's a bug.

Would you please help us confirm this?  how does ubifs handle this situation? Also other FS? Eg, jffs2, yaffs

Thanks,

Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
