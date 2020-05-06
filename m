Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF02C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 15:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3740620708
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 15:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VbctdqPL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="tWH2krQh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3740620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jj8LU01abZE3r/x48W9y9LgmOka/J3e9XKn88WDO/xU=; b=VbctdqPLhg8ll6
	NYG66KV+RXhd21c/eLpMtZtV8ZH3dvjaGhdbhwEEMW4KMPA5L7sXEcLAXFIhFrmLHWUiPIrZ+rbWK
	Ipmzmp8hEBv8iDQXS5veuCXz2zdHkJrEhG6juZ6allmEurlC3/Yh+t5OxbYJ4chelouhyjz9cbwKu
	fi36mYr1rgr2LWBCzf5+tQNm4mEJg1PyiZ1KWnotre9+MGYepktMJM5pKNa176ccA9zsf5JeYHweZ
	sEoZs5RYP/Dg+KDf9rIMv7UvOwha27Ti94BYo6QPfEF3M8CFPPXR81IZo5BVV+Ttt6nTB1S3/BYAd
	bxAUSb2xwOKACxgt6HhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWMJj-00043X-FH; Wed, 06 May 2020 15:50:39 +0000
Received: from mail-eopbgr700070.outbound.protection.outlook.com
 ([40.107.70.70] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWMJf-00042i-NJ
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 15:50:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrVLjyNAuMyMc+KRNfZ8IwdGW38u2zY2v6sOd745CDTdvj/8PXoPGeivKxBZ2VxDWZTIHToByJki+30zrA/tVH0GuK3cdDoslP/zzS8XgxAzxZ0rxufl7sd66fCe20xHkzmRVhWEwDpTSPP0r6kfxBF7aPglb/hbqpweVtbI/Y5kFavvUxxfYm92Dtc1oDVp90oQu8fJIM/x9/zXdsUYTjut5+XzTGFwPLCcwIl/FzfsmZjC3T0YQHin/8Sd7fwJ6V4xnlG2NXYZtd86+FKJT0rVXwo4IanFH+pKuOeztxcLtM1zHV2P2XyvqAY0KgKPnJBtXE7PNoRFVNL0As/rXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQXKNWRiAgnuNiO3ChRLo9bhR9FUQM8re1VPHcMJ6zI=;
 b=SJhuX1nKnIAul24514qYZl2nDjXyge88nZenbyH2Th0MMu8Cwkkl5oL98phDIqAfQwyEqFCxOkgK5ZnFH1dx0FKTus7seVunW5dMjlRfGduNoZFuHcnV3vfT3WPqSbSLtNtIDKtdLy23H877WHfvHMguIvJuPMxGrBy08XzJ7wZNdKHzbBesp0TzR+LWu0LDCd9UWcuoC+9DAVBcXII0KZBdhP+DZivUxuL9nKRmNeji04h1Wi5sIGnDqkZh0LApsSR/v4yva+2CvBd7ccZAG72YrK4uZ0P6vO8qeE6lwCFcOzrV45RSM4PTS+EydMxsx5fwvwNHCyduJdVlN0Ydww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQXKNWRiAgnuNiO3ChRLo9bhR9FUQM8re1VPHcMJ6zI=;
 b=tWH2krQhtrVfc5O4Z+aXCf3tqrQZoacJyJTE3CqTAKwbgo1KmCOCcBm4i7MjiAiu5sa75I3tW2h2vdue/FX2B1OVAwGdzLyE8Za7HxoL2i/mq35/2o+XJcPuTqAkRk8K1h65V0nhKayfYveRHYUoiLZ4TVor7WsmSpVGuWhX+8M=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB5601.namprd08.prod.outlook.com (2603:10b6:408:3f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29; Wed, 6 May
 2020 15:50:32 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Wed, 6 May 2020
 15:50:32 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUA==
Date: Wed, 6 May 2020 15:50:32 +0000
Message-ID: <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
In-Reply-To: <20200506104522.6c90f88f@collabora.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTRlYjZjNTMyLThmYjEtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFw0ZWI2YzUzNC04ZmIxLTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjIwNzUiIHQ9IjEzMjMzMjUzODI5MTA1NTY0OCIgaD0iS2pSMmNSL3R6dElPQ0xXQWpWVktBRWxseEZFPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFBZ2JCQVJ2aVBXQVZ5Znp2SDY4eCt0WEovTzhmcnpINjBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8cf758f-67fe-4334-9fb0-08d7f1d535a4
x-ms-traffictypediagnostic: BN7PR08MB5601:|BN7PR08MB5601:|BN7PR08MB5601:|BN7PR08MB5601:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB5601FE469FE2BE4BD7FB12D8DBA40@BN7PR08MB5601.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uSnh3EJrHjAr+SuO8Y/LM6lzvONucBUv95uPfNnXPSjZEPsa0qha3DYCLtaW1Lito92UBUVqkT83A1rnnfpKHMSjjuxshUxN1t3FuopKAFL3LVg9Zk8FvW6mG+EqV4jJOGgulfv/mpQIkrV/vEFjYPDde81nsWMuqXHpNTvIIwnTG/lpFEiczsCsLQg2PyJdeG4ArVbV+ohzgH4XXt4V8yG8wrXtdwgwmLcTKKQ6mJsRPCppEAxowqqifQqjNVl7atPfnwmoNMq2k8EgxmVVEbvUFe1Ziv3eR942ioH3vrNSsZpxTcnhg4dpmFEY6m4ZkkzlPXfbmmtN8FnFWTmN3DLeDP9Ua625sRhXWJr1iB4NpsgwNm0wxikc+bIcc+UCo2hvtrfEkAa/PFOjDwJaW0/xUO/8t8waytETKt4dKxzZH7vCLy7U3S2/QGhmmb0c1QpFMEJbkjVW/Hsem+kPbmQh2smFrcEoSJURLhC5Mf9uI9XFYIcXhwo8fAcH37r9BpZr7rx7ZTNlcR66e/r32g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(33430700001)(478600001)(52536014)(6506007)(54906003)(33440700001)(55236004)(186003)(4326008)(316002)(2906002)(33656002)(86362001)(66946007)(71200400001)(76116006)(55016002)(26005)(66446008)(8676002)(8936002)(64756008)(66476007)(5660300002)(110136005)(7696005)(9686003)(66556008)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QtcUP0rHpkb9vU21+dPpTgqZIsf/32SSx29ha80sIiRecqep+vKx1kgU2i29O+Jh6dbVtSd/pAIXBZyEeT44Z/19OjpEEy2FGUIx8S0yzM5ACfGKuGdDVsBDtsWY953pMWOJW6KE6R4J4zV5e0nchU1w46fI73QNd9HHRrKtZ1HKlBp/u2TVi85Q7mpGrYdPalFzUaPGZpuq3VEpXUQUlUFomEtgWoFgAzyzcjlvCxjVDOY5Yv4SubKweogZ+Ktlm8I0/gtWTZSz4oJY3vjxtapS/Fjy7BTq2CoL9rnEOI3mz3cgsjacjWTOrj0m+JACd+Hp1voCZWylww2R07Cep8eOTa+EFoa+L9vFDo8hBWY4TW6v3XDv13LuLtlXx6QTmTMutjiu3USRJL/q+21beaI2wTb6wTQeEumaW7YLzj6ja2BAJCERw9UQOSJL5eBVivqypd0+vlO52s38HuMAQlBaSW9W8JNhNm85nnEXzDCQhRtAhfKfaqLDMSSrM8KrV+rH0t4FwZ7YiP6AuaFAw87zXAtQdcQKFyOZLC4Q7iE0Eq/jo0VG0xeAbmjrC60kXe0wnR0df9yxFQQbwOgvvvV6XwYNy+f9lRKsEt8bwpLqK2XHv4qr3604piNhvMo3jOvLS4tzzkSHyltBA4uuNDnrXmPPE+Rv66soNAmPspxn2she8WBC/UmydcTq39hZx3jC7r6gFx3HICzZueYTvl9qHez7nBPwiI/x1G30zM6nKguhG212PYnEwXS8f+Mv96sp3DtN2GMmjmFVg0eNRR/7qQp0gp7S+Hl7hut0EuU=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cf758f-67fe-4334-9fb0-08d7f1d535a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 15:50:32.5294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+OesU7wEVaiWKXENrDitmM6/Ccf1HImIPCJq+EJmpiJGt0FolrQzZ9aLz+SqmIw19AZTxj8ZolCicQ4K2EcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_085035_783086_B616B3B5 
X-CRM114-Status: GOOD (  19.07  )
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

Hi, Boris

> 
> On Wed, 6 May 2020 08:28:43 +0000
> "Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> 
> > Hi, Miquel
> > I have two questions about your patch, please help me.
> >
> > > +	 */
> > > +	for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> > > +		/* Il all the first pages are not written yet, do it */
> > > +		if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> > > +			micron_nand_avoid_shallow_erase(chip, eb);
> > > +
> > > +		micron->writtenp[eb] = 0;
> > > +	}
> >
> >
> > Here, if the power loss happens before erasing this block, for the
> > next time boot up, What will happen from FS layer in case FS detect this filled
> data?
> 
> Most likely ECC errors will be returned, but that doesn't matter since this block
> was about to be erased. You have pretty much the same problem for partially
> erase blocks already, and that should be handled by the wear-leveling/FS, if not,
> that would be bug (note that it's properly handled by UBI, which just considers
> the block as invalid and schedules an erase).
> 

Concerning this, I still have question, for the UBIFS,  If I am correct, there are
EC and VID header both being damaged, then UBIFS will re-erase it. I don't know if
UBIFS can handle there is dirty/filling data in the some pages  and EC/VID valid.
Maybe Richard has fixed it.

> >
> > This micron->written is stored in the system memory, once power cut,
> > for the next time Boot up, will it be reinstated or it will be 0x00?
> 
> Yep, and that shouldn't be a problem, it just means we might have unneeded
> page writes if the pages were already written, but, other than the perf penalty it
> incurs, it should work fine.
> 
> We can optimize that a bit by adding a ->post_read_page() hook so we can flag
> already read pages as written/erased and avoid those unneeded writes in some
> situations.

That means we assume this block being read before erasing.

Thanks,

Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
