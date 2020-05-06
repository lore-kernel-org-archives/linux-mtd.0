Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034EDC4724C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DE1208CA
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 16:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LX8b4wgW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="Uhq8gUCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DE1208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF7jKv+jmU4+THhqG1NvE8iJC5C+a18kPBxQS5YFhpg=; b=LX8b4wgWl/FE2Q
	Tg75oX5xOdZj07p76rLO6eDXZDLJX3jpCbPE0sk5tT8vprSasHXsHbRQ+dSoMbxcyvPjxxrbu5prO
	VdshPyYz1iCe9VV4EHcrLTvvCVoxPZZitKwE3wCWq07ombD4PXRN9tzwCoB9Dsa5Ajre8FE8nCYlp
	vrwSO8+CNpycrLGvNz2ZfV0gbM0UVTBSHswNoaV8Klj8PcTqof9aexnZVdgREbc26l7jfvPyjYbOl
	KACIaaJTRsaIPoVxQjAqklk/E7rbZdbM/40Lj1YPQ7yYTd1e0i3u+Bxy27XonZXq2pDYNaJkDL/Fo
	bQ9ARduKYUR+LTsXKOfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWNFK-0000JI-C9; Wed, 06 May 2020 16:50:10 +0000
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWNFF-0007Bf-Uh
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 16:50:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7PBjv31/4KNxsbiWl4AuOIk/8FYMFHievfLkXwypxITMIp7gwzdaX8+fhJQbJBLWbceke9gNQbnznRDeT4oD/5KUjpW8JZQ+JyL8saBWr7B1ggfcgga5CCuETSahl4gZygLId/Rk6gwaKcMFUkukBWAt2kNYQawJXx5yEYtTYE/g+XtjPvf1Fo62WvMF9H1PAv85/34TIK2bcenkmB2IHV3hnbgq9bRoQmhePjRuBz3uyuqblUE3rx0MnWcJ9V9Z09gkTp0mP1MHOSv/xh+K3/qKqqiBykGqMOKNlC3piKKD7056rXZmwdJ34nfbka/PoQnvdpUAm6LNFXjR3deSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR1gK3BNvfKtN5HZO7iYeaQcZePXC/A9HYirfP2RYeg=;
 b=IhGr6hI2JC0R44397XFMbXpR0UO09AtLIoamAxaZuqPXaGcNw5b2wJXJgje4LVJJ/+p63p9l3RbMVPfIoU0UzCR77oWnTwnTtKqQbvdCinBBoPXL+3Kpuj3VFExH6Pnozhulxbs2ay7mmP5oxEuEFjthNL/zOvntVU7jdlc187Z68gIkdFhKlUXPLvd30jroeWomevqhQmEh7UnrsOeGAFpXoPD/XKph4qySpFIQ6CgOUzwYEPIcK7CT9LMoxM20uQOI5V4wLSrzjyKihez2EuH8FEsV5skrBu2lyBJJB/qvfseiv014EN56Qa6uP28k0JTzWhdv1D2PK7uqoL+NdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR1gK3BNvfKtN5HZO7iYeaQcZePXC/A9HYirfP2RYeg=;
 b=Uhq8gUCs80bY+5LFIyQ+bMcOeotgw+4ULGnzfuiUvazd0EFkOXYR9XnDnHc+fyetFo8jQ2xgHXZYPwdIiLMZK8BINHSI+cFcDT9/aovY7DWpYxjTQBYSwMqGXb4t04tp3mYTBuKf9oFmqoJRrZcl2xWCtjinw+cabBuxJtygx/Q=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4098.namprd08.prod.outlook.com (2603:10b6:406:87::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 6 May
 2020 16:50:01 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Wed, 6 May 2020
 16:50:01 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUIAABVcAgAAAtICAAAY8AIAAAFTg
Date: Wed, 6 May 2020 16:50:01 +0000
Message-ID: <BN7PR08MB56848A1F463583DBDC697014DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506182910.6a9863bd@collabora.com>
In-Reply-To: <20200506182910.6a9863bd@collabora.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTllYzRkOGVjLThmYjktMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFw5ZWM0ZDhlZC04ZmI5LTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjIxNDgiIHQ9IjEzMjMzMjU3Mzk5NDMxOTgzNyIgaD0iWHBPdnQ1aStJS1dBUTQ4NWdSU1dBZ3RKUmYwPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFEZC95Umh4aVBXQVRGTzhVN2dMSTRiTVU3eFR1QXNqaHNBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9d823b7-8f4e-4289-cb3c-08d7f1dd850d
x-ms-traffictypediagnostic: BN7PR08MB4098:|BN7PR08MB4098:|BN7PR08MB4098:|BN7PR08MB4098:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB40982453FE9EE44767738938DBA40@BN7PR08MB4098.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JmcsLeN0js649KfI9ibosMXWL4uIv2MW91KfnJKexnX2++grUEnWMWYyUoT9A7TjP1UUSePJxcC2c/+8y1dhaI7/gYmSVC2ex3vgPWyPPkrYBUv6sAxhs+z89I6nY6YrLyYgTOo9kMFvpAw5fOrNYycU8+afT4MXPw2o/2Ub94w1+5QgJbQPll3hphK+J+inFPKNV/LPVMenDXl4VJUZdxeMnI6OciiMXgBmuR96DAF2tGyJWyvTzB4ycQAt27el7eBMYiaiH1tLHs6tIXO51rCklyJ3T9BRUfoaVIunOjzdgLI6/IoUhpnLE+5usLlUjfoQG7Afns/K6/NWIAxQvQICmpQFnc3gzErHspWKViYUeruijNVRQAz+dpHsw/jGmSxzDZLgGIucc5bYlLBf6GEJqVdVCMnZpqt7N5wGEwjgf88AgMzk+YuFhN64lGKQR8V/7UpLSP4MpS32fKqhuAHkMuNuj8OAWj1H3Lv90uL6Zt2naOnpO2bx72kYUPn3XymZdVOnsNGexY5nvkDE5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(33430700001)(33656002)(76116006)(6916009)(52536014)(8676002)(86362001)(498600001)(2906002)(9686003)(55016002)(8936002)(66946007)(66556008)(64756008)(66446008)(5660300002)(71200400001)(66476007)(54906003)(4326008)(6506007)(55236004)(26005)(7696005)(186003)(33440700001)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8kIVE//QoqVcq+iqZWa1MVoJ6xpsDdU15amFOZ++8O+U9GJ95nh4LkzhfeGCuvLGLJ8PE4F7Ew/yCImHi9LPDhL94dVE89OSi3vAqvos/G9XJYfg9i4yJpObjDufFD6QWdPpFYAkAWF45Wo9C2t0nC9A3kh1HH0qYXk1Tnf0lZ29gRz5RuQMDlg6xz42Sdgjq7GkMf+TQL/OQEUtb/0zvY9Q/PSHm50B9u6grnYyQyI2y3R/zFF5dWlO0/fG0uXY60gkVOmpV0hc9E5h1wWPF3Vr3b1xgxBbQKr8rKFNG8lrfHwB51aqx5BM26QW/z3muzv9syKYsAqPqoby5UgVHLIUKWtehwoN5qDm23luxrrAlME01ioAt5e24PChSZfjS19U2nYQFSVm4d72SWYCbXd/KlFZ8s8HxD0o/dd4ksTK986/NB0RX4Jg+cFNFvfHmJZuXy5w9YUlCD2sQlM3pja/K35u8C67DDpK9yOwM/cfg4jpN0WF9Q83aMiCT/Ix8Ul8jz1qjBEcKqaQh8V1o/r/tloO8/PT4mD3ZLWZ09kd4BC+4yd3FJbPbLKAiVCFmFGar340NV/2ps3/RoROsK51jrYEAdaPZ3lsZz50QUYagsYChYEc+4fhMxSylJ+Ll6UYkrW5dB9APd3EWVuwmWGGG2d4IGL/rmCi7CcfsgucsVl0Vhkm0IEw8cslv8b3HS1hepljeiY7t8gOUfWIF/KgySiVAkLF7ckWD/vtDkJgE9ScxNk2mkL2jQW/3Wivgqrgu9Y1EA5ghok1WX2VQ6EJVoCYsiL3ZPOMMwvaiZo=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d823b7-8f4e-4289-cb3c-08d7f1dd850d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 16:50:01.7565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0dwvHysJyoOpESOExB6fZH6Wq0lQJVMtHIkNWLuU9X4Yynefpk2F1dgUQtS5n+NPo7sPBByiZETEkZxj4EUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_095006_076555_F4BA484A 
X-CRM114-Status: GOOD (  19.60  )
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
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
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

> >
> > > > > > > +	}
> > > > > >
> > > > > >
> > > > > > Here, if the power loss happens before erasing this block, for
> > > > > > the next time boot up, What will happen from FS layer in case
> > > > > > FS detect this filled
> > > > > data?
> > > > >
> > > > > Most likely ECC errors will be returned, but that doesn't matter
> > > > > since this block was about to be erased. You have pretty much
> > > > > the same problem for partially erase blocks already, and that
> > > > > should be handled by the wear-leveling/FS, if not, that would be
> > > > > bug (note that it's properly handled by UBI, which just
> > > > > considers the block as invalid and
> > > schedules an erase).
> > > > >
> > > >
> > > > Concerning this, I still have question, for the UBIFS,  If I am
> > > > correct, there are EC and VID header both being damaged, then
> > > > UBIFS will re-erase it. I don't know if UBIFS can handle there is
> > > > dirty/filling data in the
> > > some pages  and EC/VID valid.
> > > > Maybe Richard has fixed it.
> > >
> > > If the block is being erased that means there's another one mapped
> > > to the same LEB, or the block is simply not needed anymore. In both
> > > cases, this old block shouldn't be referenced. Again, if that happens, it's a
> bug.
> >
> > Would you please help us confirm this?  how does ubifs handle this
> > situation? Also other FS? Eg, jffs2, yaffs
> >
> 
> And if you're really worried about that, forcibly writing all pages starting from 0
> should do the trick. But I don't think that's needed.
> As I said, when you trigger an erase, you're not guaranteed the erase will
> complete before a potential power-cut, meaning that part of your data might
> still be valid, while others could be corrupted.

Boris
I think, this patch wasn't fully tested on the system. This patch inevitably lengthen the erase time.
As long going into this function, from the software point, it is erasing operation.
And from physical side, it is not. 

Thanks,

Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
