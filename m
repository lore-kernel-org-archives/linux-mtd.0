Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA2DC4332E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10ACE206F8
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4bu0xc7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="l8nsVnBv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10ACE206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTr/VkvcKeNhJ9tk0r2oqN4ohivqgMvsX74t2Aa3BKQ=; b=P4bu0xc7zzhm7n
	+bFtRH9fZKJH896FrXB8gJAAsTVY0+XO7LynQAH+fG6PjYfuNSTLxh5tV3Q4ASZjkE5s0ZfyOpHTh
	bgoCxEvzGoZUP5XRPs0SsyHWLKa400RfFM53Ic+GGN8IrsqjhFX4MHwjNSaGoRVXvhtblXMNem7pZ
	jPQutGFy83VQbMHE7nkG1lfAMDV/08u+oA5gAab0QBmEUscJb2PkdXm5jY91q96Mf5XarAbMWeEm3
	XGXc8UPBanlU2HKhiCTJ81ZoRmeZRmZC/O6DR5B0/9aa5P9PTNd1oi1x66DlJYW354D0xS97bO5Gw
	p6PvnV55ZQVMsf4GGHKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGScj-0005a9-8E; Mon, 23 Mar 2020 19:20:33 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGScf-0005ZP-D0
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 19:20:31 +0000
IronPort-SDR: wUztVEaHDS3506/2Fl8wnTN6KQp80YwdGAfsucTpgTn1ImD+36J+SDpda8PRFc9Snx7TRSqDT2
 Q59kd7EoSSETylOweVsMolE2ha6qwo+DVsTUmn8lTQlAcGP1SFprRSTCGW11zW/o9FPUbMiTyR
 isrl2q2x8lTskDpm+MQDL0m3sBzQEPpbEcw/byL/2okI0Cwp6c8OKS/89HBWLtYl8RZX8uj/fv
 T2FYsvN/5w9Z5Pq2oIL7NwzUeWL1sjnJUgW8+Zpp9q1ocfhOAPiK7/hru69C6aZFJiQRuRuzDC
 /mI=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="73153954"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 12:20:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 12:20:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 12:20:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMuRubpD70JJz8A4YhguJ0PsKKzyonmCQb7eL4XPCCf/+WpyB8gQ7lNZFKapQdZ5cOMRd7PSMPmbG8CALqpgohJOfrbRAJTNwFpuN5/OCnizZvC/RSF7ABkqeS5uy9ghsQvbMtkNxbsjrl161Pa0ZkcJ4gCF1TTJoLcT6kkb0lfYvMXhcRL+i5xIdSxOgar2OrciQ7pkxh5KqqIO/8sN7e/mul5OeNu9Zk15hP0UT6thRKUtnNze2AVnQgv9TqkQxDokzOgGvvevF9n4RsFS8DXMLgfsgNVfSXhEHLWBNDWZ02EVa9/rGVMerKO52/7D8cnpPkUWLZxiQo5HgtkL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27qe76VmMt9gmQgO0fkGuTOdjHvdrNX1VorApMBY7SA=;
 b=POXTA5qrCpflfIdQbKwVBUyPSfWU0u+Pe65zpJk4mlbSh8vLn/12epchRSUzSs+3ncJy/y6Ps+X4/USpUp2uoDxFkcHV1Azknye7sD0BDct+aWlUSMyefQ9VvWhFO/MzDVyQ5WdU/9RF64xvIqgkREAcfbgw1bRWQx2w9BmH5UDyQQF837lQPtnTznQQvbxFagmRSuURAqk8Rqmsh7Vywe3pTLAzHFCiFI4E0CcYyfol5AoC1vLMC4VhnYb0p741xnNFUSfhotsRyAhHU0yB7/lrJjpkWGqnfpULkR+QyKxTJn1O7Ji6jDhRiXwbFNCEELcP2ZGjTzuvVSRYVhWcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27qe76VmMt9gmQgO0fkGuTOdjHvdrNX1VorApMBY7SA=;
 b=l8nsVnBvLWyWm81o37oWbAV+kHMAy+ifpEsRg6GIpkSy3yDsUZWAN3EbXSUzk+Jpy51RW0V2fTXIEicOiwBYqu6xyYpOlto6gAIUJIfNOx2sNiBYJ9ch589xbVmfmw7vayQU+5jXx4OAddiV5GYCMGTvTh/MQ7BeBZzSaqVIU7w=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4040.namprd11.prod.outlook.com (2603:10b6:a03:186::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19; Mon, 23 Mar
 2020 19:20:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 19:20:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVPw==
Date: Mon, 23 Mar 2020 19:20:25 +0000
Message-ID: <5899969.zVFlrMANan@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-2-tudor.ambarus@microchip.com>
 <b9a6d699790e48723489ecbbf1322dfe@walle.cc>
In-Reply-To: <b9a6d699790e48723489ecbbf1322dfe@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32482e35-83a7-485b-6aaa-08d7cf5f3d3d
x-ms-traffictypediagnostic: BY5PR11MB4040:
x-microsoft-antispam-prvs: <BY5PR11MB4040D261815A2F2BE8DDF422F0F00@BY5PR11MB4040.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(81156014)(14286002)(64756008)(6506007)(54906003)(53546011)(316002)(6512007)(9686003)(478600001)(6916009)(4326008)(5660300002)(66946007)(66476007)(6486002)(66556008)(91956017)(76116006)(86362001)(81166006)(8936002)(66446008)(8676002)(71200400001)(26005)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4040;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZXmK3B8NlY1Yt458hheEp/flT7DmcKwr1hQfK9p+HdR9aG/tnF7yIBf7NfwHcygMPuQIM2p0DXGcc9OwM0fmmTngLnsmU1EDkWHYxwZjPPFdKBRat15Q6bJytz9eL3WuLNbzfIJp7jAqaaJ+HjiSgPq6GMTZs6qRTVZrhAxUwqrNA5TrTMh7dyEVMqLaSkfsrYZvxoropQKR21McU7d6p8BnBXp2Olp7dd4UVInRRUfI9fhNYh8xy7W/wb6rmefGOaGwreXGiRr9W+NFmrLXmThgRcL2TD92hhXyDLfkq7SFPhvtOZQD2sNbaw1f5Si6xfQve54xrvyepF0ubQnpCfZvuZ+cjkcDxHggrIlTRxyUP7W5MehqVGxiV/oFfBljzIeMZnh08/FFQtoluK/1QLR0/G7CGVMzZIKl7rpYwQIFBVZswyEHIzBO/XkM+n1U
x-ms-exchange-antispam-messagedata: 6KJJ406bGAfnz22WjYSTO3+b2R17/zfidYr2v7g4kQNV4GhA7Smk0yJnPlHxOxaASaIbEJvut7gMWLp83YRlSRc+gEzfQ3bykAj1N30ucXOhYOUq5XgapcC2Q6hOf4Gr1ZA2guoaUEkyYgpjRKeSXA==
x-ms-exchange-transport-forked: True
Content-ID: <9D07E3BB52330B47BCDD5E6C0DDE80E6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 32482e35-83a7-485b-6aaa-08d7cf5f3d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 19:20:25.1383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prpd1wBe6Irz2z5BV7RqA0JaQkhFWE13CvcLsTs/bTqfCUFjy6cz4ljXM5t/Oi7qXbMjPBYDKCZxwsnpQ4lnfDxt+EHhtZdWVQwhtrmE7MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_122029_509982_DD3D9E4F 
X-CRM114-Status: GOOD (  18.82  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi,
> 
> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > Fix the gap for the SR block protection, the BP bits were set with
> > a +1 value than actually needed. This patch does not change the
> > behavior of the locking operations, just fixes the protected areas.
> 
> So instead of rounding up, it does round down now?

No. Why do you say that it rounds up? The behavior is not changed, the patch 
merely fix the protected area, which was wrong before. The round down is 
present before this patch.
 
> 
> > On a 16Mbit flash with 64KByte erase sector, the following changed
> > for the lock operation:
> > 
> > Number of blocks | BP2:0 before | BP2:0 now |
> > 
> >                1 | 010b         | 001b      |
> >                2 | 110b         | 010b      |
> >                3 | 110b         | 010b      |
> >                4 | 100b         | 011b      |
> >                5 | 100b         | 011b      |
> >                6 | 100b         | 011b      |
> >                7 | 100b         | 011b      |
> >                8 | 101b         | 100b      |
> >                9 | 101b         | 100b      |
> >              
> >              ... | ...          | ...       |
> > 
> > For the lock operation, if one requests to lock an area that is not
> > matching the upper boundary of a BP protected area, we round down
> > the total length and lock less than the user requested, in order to
> > not lock more than the user actually requested.
> 
> I don't know if that is really what a user really want. Because you'd
> end up with regions which the user believes are locked but are not.

True. I'm thinking of how we can improve this, but it's not in the scope of 
this patch set, because the behavior is not changed.

> IMHO if you'd have to make a choice I'd prefer to have the remainder
> locked. Not the other way around. Esp. since the user explicitly
> express to have a region locked.
> 

We can still talk about this. Please notice that the formula that we want to 
introduce does the same thing as described in this commit message: for 
unaligned locks, it round down the length, and for unaligned unlocks it rounds 
up the length.

I'm waiting for a reply.
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
