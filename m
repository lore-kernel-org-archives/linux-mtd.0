Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3194C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 23:37:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8582073B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 23:37:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NrAItX+z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YUa0UWl+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="UZ1VFv0q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8582073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Betk6lfslJAZIHSSK6DykhXll8NqUhjcmfzlTUghbLs=; b=NrAItX+zj6XAjS
	bpYlCZqYZ2iV7t317csYJHcfjFS0Unlhreex8/IjnYT2C/eokTNSg7vJAM5U0UXa3bJG/ndtrQdi3
	hg3Uo+HwxNM/Uvu9p3lJBB34+3+J5r42KzbGVvT4qsXGX7wVj4YFWUdsjeX+U+GUlG2nEcTN42/RL
	3TfeUuY3ks6kn/KAiPacMOdevPH0cVaSng2j/tgkKtgA2DlkPmccIjFvMzMlOry+wrR9OKiG55u83
	6S8YXdDEW/6rey4M4/tF73Ni9llB5JGiR8R+ooKHlWrPO746RXEkngNZU16Q1PG/MKxfmbzC0JkZs
	Omrne+cTLH7Vq48Gq6vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jftzf-000265-QI; Mon, 01 Jun 2020 23:37:23 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jftzc-00021F-GR
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 23:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1591054640; x=1622590640;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k17/yg2hIVDc146Ebpu0PUkQ8vi9Lap+mFKrSS+Ebmc=;
 b=YUa0UWl+TpLlatA71tzoLPwilb3qrSoa8hVQQkKc6yG8+OFfe3GOxfsO
 SbHp6bMr5FGNw71jCc6g58KPyqQ/6VGtiZ7yhcK0Q8uL/P3qw/893pnpt
 e+AVp+NUtOKRuIp6bVcpAASFwoSs4QkloPalrkItHgsN7Cdy8edSpEWe2
 MldZnvv3NkEuWjrmxBkWOAcF4RLIXNE+/QE1wtnNQomquLX547V+T7C/T
 9NqsQtiyy8SEMTYtiV4AODrP8JFaGVk5T4Jnv+N7Ha8Rryv6b5evXWwBQ
 z1rye9fWggukfNAXgl+Uj+4dAMlkI4LAVXEVWDeGPdqCUnlAq8/sNjNpC A==;
IronPort-SDR: /CnUb2ez5gmbYo4HylkOPY+MClQIuf4Bb7GEXr009NXNKFAzCbC+pKxC5TqdQhJ8Aw7/bBzHIq
 4vru1/mnoC6XZ9pLKGyYqTsMzMSH/8qVflVmdjnEj0zepxbszFXh2oUbpFRapCKojXrawO9VNj
 0Bmgtu1ha2p4d8iS0GDaPDyFtIVD+iHyNsqMv9dxu6BOepiSehEebVOcFAtAlBkFX+dsWtKH+k
 MyNCQWpqGUOQE7yDf2hw/oLZR31vzsVIB+/qF7gFpV41HtlT2gWlGpQHce9Phkzqm8aMNMRun+
 tgg=
X-IronPort-AV: E=Sophos;i="5.73,462,1583164800"; d="scan'208";a="139303581"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jun 2020 07:37:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNEExdpufi8OyoxcpEqdpn/zxd1kBulL2fLW2XuFKUNi45sIkMehi9gg8hKxlmM4LiMEvTK4wAVEVS45LpMUHvVUNTeOiHwZTg6qM5dRGrC+/YEBzNv6PQh1jhOCVOx8O6hHL5sYxqcpteOFszv5BE8dptc5kOA/1ocD4LuxVapM5mQvGVZRmYDI4jhkLRcEgx0OxBIPZAaXmHAg6K3WYefsVBLbmcRfSuHaohmapzhW/LYQLhSONbXtu7fsAroAUgGMcxFRh8L7SlYF0aXwHnS3IZPSiEEt/0Ol84S6+pw6JlK/wp9LewKAwIXDAdpZBAbwFup98pflmFYggHcSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k17/yg2hIVDc146Ebpu0PUkQ8vi9Lap+mFKrSS+Ebmc=;
 b=FoPqotP0Noc6J/7GsvzkbfrG9s+kJZHK3bKs8c63dnn1TgR/GsTmW/KztcuS5SzOqQrMxB3dgABW11tHkSOiv1Nb7/zi+rECJAvzNrt86gSMMUYX/vNNoiOGi6pSx11S4+gPl1WIDsKXfl78/wjEDrTTkL0tK0A54A+tRxx+HB78KcmDAs/NSn/0t7N91n6SkfBv+mvVXf0oLHFIhbmZZV5qJQbHi+5HgBqmx1L1grkbZjkSr2+Q6R3VKnexxZIdzczEJ7zsuvOfPq9gEiI0neVX90npiTLERPZeU7QNnddtRZX4LliDK2ahHIIZiAt6YyarV5eki1oPNBueVhsntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k17/yg2hIVDc146Ebpu0PUkQ8vi9Lap+mFKrSS+Ebmc=;
 b=UZ1VFv0qMvGpTJqvqm/RcExePvye0Sxy0dThGLv6xJNj5OnAwmmm74Av6582AeC9S8zvNMbUONV3gQfBt+QP3UEd9qRKKdcRrfjG93CnN8Xlmw/tfeHEieAke/6GIMzS2tgVUsc1ERId1BcLluJs3Ymo0b+MECoksbtf2NbdTMc=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0215.namprd04.prod.outlook.com (2603:10b6:903:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 23:37:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 23:37:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "ming.lei@redhat.com"
 <ming.lei@redhat.com>
Subject: Re: [PATCH] block: Flag elevators suitable for single queue
Thread-Topic: [PATCH] block: Flag elevators suitable for single queue
Thread-Index: AQHWNMe05j/yUN3OvkCO6kMWTOQvo6jDaO2AgAA/aQCAAAX7AIAAD3aAgACz0IA=
Date: Mon, 1 Jun 2020 23:37:14 +0000
Message-ID: <7f9aaf69b24b794ca4c9c126eb2394862e276c73.camel@wdc.com>
References: <20200528081003.238804-1-linus.walleij@linaro.org>
 <20200601074957.GE1181806@T590>
 <CACRpkdYL4-Z=kaS+RfniVr=Sn-yOf+=CKMJDsn=eTK3atmGohg@mail.gmail.com>
 <20200601115818.GB1190838@T590>
 <CAPDyKFq2paDu9ogEFh6VXWq8___FLeEaNyBWhkMSdpZYpEytQQ@mail.gmail.com>
In-Reply-To: <CAPDyKFq2paDu9ogEFh6VXWq8___FLeEaNyBWhkMSdpZYpEytQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: abb94424-c1c2-4051-3f00-08d80684b6f1
x-ms-traffictypediagnostic: CY4PR04MB0215:
x-microsoft-antispam-prvs: <CY4PR04MB0215BFB59FC293CBE6B1AA66E78A0@CY4PR04MB0215.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hoM4xAU3/0oDUlezvWmqqk21Ct+wy+hJyxgyp629gAGByVl/azPTk89ksbIQEGPN3TcL/zJ1rmnNg5EyAJP/mkB7H1+w393Bz1BGre0hke35PQw0wEwQhxLdGmPMkc67aEu4h4q+nWHLO7G4h4I/SK6Lc7j0Ty3nThxoTcdG6qRVI6/npuzUQdlLl3MYPlsTrqrEql+xwdsZoteDzObjHUKp8XgW+y0gVrNWFzTr3j7k3vtfDKOkpGIyQcMo+Racz0YbiEFHiIl3XPFW/ZKw4HF38LsvxdmEFAgrta6XllR0vE6X+CJsElFbtOdKv5hX18XIeky9QdB4Y4DZITzyDuVOk/EVriE2ZZdlV1FOAQ2LuY+9PQA9SmnIkVc1VZWBYm49e7iekmFoPMrBDYGjqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(66446008)(76116006)(64756008)(66476007)(86362001)(66556008)(36756003)(66946007)(186003)(5660300002)(8936002)(8676002)(91956017)(2906002)(6506007)(2616005)(53546011)(7416002)(71200400001)(966005)(110136005)(316002)(6486002)(83380400001)(478600001)(4326008)(6512007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jrw7ZwW0cRbNWNv+XN4gx8w8LDtDd2DY+iAtEEJlB45L3kP6sJrphuRiYO+8BaDSHhKC/7F6ubalVfYlHdyegqC2g39it4HnkO2drJUxXv/ZpYxg41o9wUsvPTwXV4aVAp9jCbkT8ywEJ5p/UFe0AeH3hLFqdo+Ag4BQNtHZ4S9crTvx1TEmTd3nAYUYW6x5h4emErj+PDhY0bZIunnM15amKcAnt7a5d5NczVGW6rIRFaQ6voo8iWtqy5ZQUzdHxy1PlA6pBdIyx3P4LWRxi2l+XJeB+Xa05gN5uqP/mvX9FOJZ8B/oEB8zq8twY9u1Z1zsEa+0UFXLu/XWdIZdo8OM4PtE8YKN7FGZixlI3RTSGozFi40+oEhYFnUZBUEtcav/sFmzDNg7X8/x+h6GbuTZys09lH4DJy8J6EO47/jFOafIuavopAfXv1MVbTABN7uwHk/EwqSh7ojjhZT/UzDOCLMe3m+305B1uSMIEuWbAoEivOD5hgqXFrK78zMQ+UAwJCv7C/c5QZx7ulEdu2L+CAPTJ0LjEe16vWfGJCEcK8HnUROd3yqfnkctKCEJ
x-ms-exchange-transport-forked: True
Content-ID: <E2CFAEAD7024954C872AB397F2A4CB10@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb94424-c1c2-4051-3f00-08d80684b6f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 23:37:14.6199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qEf2CvB9AO13efvtN6cLmLksZKnCLzm4F/+i87CPadFxdbKwzRqHYD4ODgXOStLwWGMLEoTph18Al/Tc698bIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_163720_664159_F4D334FB 
X-CRM114-Status: GOOD (  29.55  )
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "paolo.valente@linaro.org" <paolo.valente@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jthumshirn@suse.de" <jthumshirn@suse.de>, "hch@lst.de" <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-01 at 14:53 +0200, Ulf Hansson wrote:
> On Mon, 1 Jun 2020 at 13:58, Ming Lei <ming.lei@redhat.com> wrote:
> > On Mon, Jun 01, 2020 at 01:36:54PM +0200, Linus Walleij wrote:
> > > On Mon, Jun 1, 2020 at 9:50 AM Ming Lei <ming.lei@redhat.com> wrote:
> > > > On Thu, May 28, 2020 at 10:10:03AM +0200, Linus Walleij wrote:
> > > > > The Kyber block scheduler is not suitable for single hardware
> > > > > queue devices, so add a new flag for single hardware queue
> > > > > devices and add that to the deadline and BFQ schedulers
> > > > > so the Kyber scheduler will not be selected for single queue
> > > > > devices.
> > > > 
> > > > The above may not be true for some single hw queue high performance HBA(
> > > > such as megasas), which can get better performance from none, so it is
> > > > reasonable to get better performance from kyber, see 6ce3dd6eec11 ("blk-mq:
> > > > issue directly if hw queue isn't busy in case of 'none'"), and the
> > > > following link:
> > > > 
> > > > https://lore.kernel.org/linux-block/20180710010331.27479-1-ming.lei@redhat.com/
> > > 
> > > I see, but isn't the case rather that none is preferred and kyber gives
> > > the same characteristics because it's not standing in the way
> > > as much?
> > 
> > Kyber has its own characteristic, such as fair read & write, better
> > IO merge. And the decision on scheduler isn't only related with device,
> > but also with workloads.
> > 
> > > It looks like if we should add a special flag for these devices with
> > > very fast single queues so they can say "I prefer none", do you
> > > agree?
> > 
> > I am not sure if it is easy to add such flag, because it isn't only
> > related with HBA, but also with the attached disks.
> > 
> 
> In general I don't mind the idea of giving hints from lower layer
> block devices, about what kind of scheduling algorithm that could make
> sense (as long it's on a reasonable granularity).
> 
> If I understand your point correctly, what you are saying is that it
> isn't easy or even possible for some block devices HWs. However, that
> should be fine, as it wouldn't be mandatory to set this kind of flags,
> but
> instead could help where we see it fit, right?

The elevator features flag was implemented not as a hint, but as hard
requirements for elevators that are needed (mandatory) for a particular
device type for correct operation. By correct operation, I mean "no IO
errors or weird behavior resulting in errors such as timeouts". Until
now, the only hard requirement we have is for zoned block devices which
need mq-deadline to guarantee in-order dispatch of write commands (for
sequential zones writing).

We definitely could add hint flags to better help the block layer
decide on the default optimal elevator for a particular device type,
but as is, the elevator features will completely prevent the use of any
other elevator that does not have the feature set. Those elevators will
not be seen in /sys/block/<dev>/queue/scheduler. This may be a little
too much for hint level rather than hard requirement.

Furthermore, as Ming said, this depends on the HBA too rather than just
the device itself. E.g. the smartpqi driver (Microsemi SAS HBAs)
exposes single hard-disks as well as fast RAID arrays as multi-queue
devices. While kyber may make sense for the latter, it probably does
not make much sense for the former.

In kernel vs udev rules for setting the optimal elevator for a
particular device type should also be considered.

> 
> Kind regards
> Uffe

-- 
Damien Le Moal
Western Digital Research
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
