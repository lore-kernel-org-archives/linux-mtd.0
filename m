Return-Path: <SRS0=VbW+=UN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563FBC31E44
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 07:19:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12EA62133D
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2019 07:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CYD0qmUK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="LHTNbbhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12EA62133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4EKYppIYyinPIEcXW0heBqJHT0KBjnzQxsiAx47J8M=; b=CYD0qmUKopdv4b
	rh15gVeEI06p5TwBoBQFKfPRhVlAxL8gylgUA33VKYuwewD2Yj4/ips8HHqGgNr1+FZa0GsQQbnOs
	N9u+X2XCatxpAzx4RTbxADX13lhGbRcJz2OLesXFJeOZHMiAsa40dXpTmT+AlMm6DE93ifly6CfSl
	M92tT4uBZJpE8tWKNIo7+B2UGYqbmIGnEDi2fbgY2oh149eXPNzvR0yqx9TkWPuntkULfpE1uT/Tu
	h9DqtCQqE30nA0BEL9zMAyhw0uKHmRuAah5HZFWcZke25IwIi+CLzatil0rEhvWWguhHREtCIFcmF
	1gKjmpdK2ea9dlWQprDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbgUK-0003Hj-1R; Fri, 14 Jun 2019 07:19:04 +0000
Received: from mail-bl2nam02on0625.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::625]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbgUG-0003H8-Tk
 for linux-mtd@lists.infradead.org; Fri, 14 Jun 2019 07:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQVIwQhFUQA5pGO+FPP6uNE0tc490PMkA2ca8P30ucc=;
 b=LHTNbbhVzhqyFLr4xe5qQDcngKnvOD1nKdUCjt1blzhU4UFolO18u+Y0zorB4UfQP4jbpPdlhkn+LintnXuWHYR/RK54OCXeLG4Y11jOPP9b7YzzkooocfavwMivw9tHUuS9r8+uast6bbpFNZhzOzJm8ZqGq8uehUIrmTmvrNI=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3716.namprd10.prod.outlook.com (20.179.97.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 14 Jun 2019 07:18:58 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8%6]) with mapi id 15.20.1987.010; Fri, 14 Jun 2019
 07:18:57 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard@nod.at" <richard@nod.at>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "Chris.Packham@alliedtelesis.co.nz" <Chris.Packham@alliedtelesis.co.nz>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: dynamically determine the max
 sectors
Thread-Topic: [PATCH] mtd: cfi_cmdset_0002: dynamically determine the max
 sectors
Thread-Index: AQHVEDJMcvGkuqihiUCZNx77fHSEkKaa4nYA
Date: Fri, 14 Jun 2019 07:18:57 +0000
Message-ID: <4913398a9317f240235e45f5d1ad886dd8c7e259.camel@infinera.com>
References: <20190522000628.13073-1-chris.packham@alliedtelesis.co.nz>
 <8e80d911f0dd4759b3edc72fb76530d6@svr-chch-ex1.atlnz.lc>
In-Reply-To: <8e80d911f0dd4759b3edc72fb76530d6@svr-chch-ex1.atlnz.lc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37aa4188-a705-49c5-64e6-08d6f0989114
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR10MB3716; 
x-ms-traffictypediagnostic: BN8PR10MB3716:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR10MB37161D32471AD757737BEA39F4EE0@BN8PR10MB3716.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(366004)(189003)(199004)(53754006)(5660300002)(256004)(14444005)(25786009)(186003)(102836004)(26005)(53546011)(6506007)(2501003)(6246003)(118296001)(53936002)(36756003)(7416002)(316002)(4326008)(71200400001)(71190400001)(68736007)(86362001)(110136005)(54906003)(2201001)(6512007)(6306002)(64756008)(6436002)(72206003)(229853002)(966005)(478600001)(14454004)(8676002)(8936002)(6486002)(91956017)(73956011)(66556008)(76116006)(66946007)(66446008)(2906002)(66476007)(486006)(11346002)(446003)(76176011)(476003)(2616005)(6116002)(45080400002)(305945005)(81156014)(66066001)(81166006)(7736002)(99286004)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3716;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: brdxTNBu+xzwu/I1mY/Qe4NZ3JN9L+vgBbixeBwAfJru3OWRmW6GT3ByBxyUrNT8xmU9MD9jPD4PRR06nmuLyZuExInbPaEZkzJqhlMRoI1/YMC23ejhcipyHImObOVNXNSsSkoPMKwh+pS8w3iya4HU0FUoOBSMzDBT3RAO2akunKirjDeR6j47i0m279eBi49P+vt3DNMJ7p8Dlr4avloAwNfPoZnq1jqxxIBxZMw94pEeK95ClQbNOdmvA4WP7UMqH/mHc7oqhb3Ia2jgQ24sny9csVOsOAKi9qGxRwViQc3YZhgQeVvrJ3ayvWf2DPoJnp3yXjzIFnueokXhAV1vCyxMp9uSecqy6mjI9ZPr5kAdajiDkKN00v/45Hfb3EgU4RDYLuaV277ZsHFs2SkLITY2M2PjrUmXqCvzDZI=
Content-ID: <7B11CE69052FDB4595E5025F7A013816@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa4188-a705-49c5-64e6-08d6f0989114
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 07:18:57.8912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jocke@infinera.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_001901_055983_15D10D1B 
X-CRM114-Status: GOOD (  22.14  )
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
Cc: "sr@denx.de" <sr@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2019-06-14 at 03:23 +0000, Chris Packham wrote:
> 
> 
> Hi All,
> 
> I think this may have got lost in the change of maintainer for mtd.

We need this too, ATM we have a local hack that just changes  MAX_SECTORS to 1024

> 
> On 22/05/19 12:06 PM, Chris Packham wrote:
> > Because PPB unlocking unlocks the whole chip cfi_ppb_unlock() needs to
> > remember the locked status for each sector so it can re-lock the
> > unaddressed sectors. Dynamically calculate the maximum number of sectors
> > rather than using a hardcoded value that is too small for larger chips.
> > 
> > Tested with Spansion S29GL01GS11TFI flash device.
> > 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >   drivers/mtd/chips/cfi_cmdset_0002.c | 13 ++++++++-----
> >   1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index c8fa5906bdf9..a1a7d334aa82 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -2533,8 +2533,6 @@ struct ppb_lock {
> >       int locked;
> >   };
> > 
> > -#define MAX_SECTORS                  512
> > -
> >   #define DO_XXLOCK_ONEBLOCK_LOCK             ((void *)1)
> >   #define DO_XXLOCK_ONEBLOCK_UNLOCK   ((void *)2)
> >   #define DO_XXLOCK_ONEBLOCK_GETLOCK  ((void *)3)
> > @@ -2633,6 +2631,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >       int i;
> >       int sectors;
> >       int ret;
> > +     int max_sectors;
> > 
> >       /*
> >        * PPB unlocking always unlocks all sectors of the flash chip.
> > @@ -2640,7 +2639,11 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >        * first check the locking status of all sectors and save
> >        * it for future use.
> >        */
> > -     sect = kcalloc(MAX_SECTORS, sizeof(struct ppb_lock), GFP_KERNEL);
> > +     max_sectors = 0;
> > +     for (i = 0; i < mtd->numeraseregions; i++)
> > +             max_sectors += regions[i].numblocks;
> > +
> > +     sect = kcalloc(max_sectors, sizeof(struct ppb_lock), GFP_KERNEL);
> >       if (!sect)
> >               return -ENOMEM;
> > 
> > @@ -2689,9 +2692,9 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
> >               }
> > 
> >               sectors++;
> > -             if (sectors >= MAX_SECTORS) {
> > +             if (sectors >= max_sectors) {
> >                       printk(KERN_ERR "Only %d sectors for PPB locking supported!\n",
> > -                            MAX_SECTORS);
> > +                            max_sectors);
> >                       kfree(sect);
> >                       return -EINVAL;
> >               }
> > 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> https://nam03.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mtd%2F&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C32742fa3a7134e77f21908d6f078e67b%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C636960799408384144&amp;sdata=JidMNGuW7GdQO%2FA%2BBs8Q0mnqt%2BWlDUnjsbCRJIDkDvU%3D&amp;reserved=0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
