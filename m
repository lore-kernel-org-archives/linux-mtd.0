Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C6DC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3501E20870
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BlpGT5ZC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="do+BCNmO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3501E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFlaW49IscmA3CRAIGpYm32nKdkXo6IyWXyHbqy5M6U=; b=BlpGT5ZCwaN4Gb
	yf/s9BnMmdAFAic4BlBqQfQjN8bgtQQzSr8ysX1eX2IFZ5VNDoNVQA2ZQOYVTUd7apkBjlpvTt96j
	8ZhbxaSsXtBYzFN+LHfQjIMEWxz5/dvi7FEPMNLYDVtZMAynWwhg0+aiO0os3iiI2HRRmW1q/Ik7h
	4fKYsPny2u7+hMwmjKoMZX6fs5yVPl4LyA+HBNqexaUYcAT6wKqwRMWbU7OfhI38J6qBC/GfjtaKA
	A3YDQHAr86UXNpIdEZzEXHcWCYBnelHl64bmjrGCo6lXIqmY+RB6JaqfPg63ASIzD0+qZxemEoHQ5
	v0UNcK/5t07Qfj1y0r9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glzNe-0004Fi-HM; Tue, 22 Jan 2019 16:58:30 +0000
Received: from mail-eopbgr740055.outbound.protection.outlook.com
 ([40.107.74.55] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glzNZ-0004En-UH
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjvcbXsy9jesD7ZdRgCLWvbX8gZ67sBly8UEHQ8Uj/I=;
 b=do+BCNmOM3sdWV9nxZL6btYfAwrSGEF3xLbSdCZm6m3LYiacu0UuD9Z135Y7KhUsXjDKjKqdclaP892rNz8AKSBbbweGoxsQ5I4q6fE2pORn1CrVLB0VME5WrOnRcjKGdBbG0VW83WZiAoqaOMQc0+ulTncw8XImIF94ZUNXZNY=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3233.namprd10.prod.outlook.com (20.179.138.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.25; Tue, 22 Jan 2019 16:58:22 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::4854:26a0:6934:7aa8]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::4854:26a0:6934:7aa8%6]) with mapi id 15.20.1558.016; Tue, 22 Jan 2019
 16:58:22 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "ikegami_to@yahoo.co.jp" <ikegami_to@yahoo.co.jp>
Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Thread-Topic: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Thread-Index: AQHUbIBcpF/Co0QsPUW69co8TGHThqVB4PgQgACL9gCAAAx1cIAAB24ggHl6RACAABNDgA==
Date: Tue, 22 Jan 2019 16:58:21 +0000
Message-ID: <887991de8450f59b9019cc8e541c1026f109fad5.camel@infinera.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
 <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20181106093334.35864341@bbrezillon>
 <TYAPR01MB217508219EA8AEAA2071A018DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <002c01d4b26a$0bbcff40$2336fdc0$@yahoo.co.jp>
In-Reply-To: <002c01d4b26a$0bbcff40$2336fdc0$@yahoo.co.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN8PR10MB3233;
 6:GxqaZrGuFS/ahj/znICRYeT17fl7KvfSqpEYzKjIaGUfUSrAV+0P03L266NhpeslJq3N0gbYpI0DaJCQV3Lat94t1noxiIJVvo2h7keqAfk8k+sWU9k3G8YtXlgOyMqkkiYnsaGnnDfMcB4lAf8sz7nIBYhzRZ3vkLsqFD4XG2Kk//AfYcfmHBU+rC7wLepA+lidF1TWa87vyQNYbf00XYTJQkTYD/bvASGx/h15xcGa6c5plB2fYZIK9B0xLahBxKg4IVsC9dSmCVrIX6VatGyA66PAHMB23SEliuQ8vwJxa9g5yo5mhKNiSOuCH2SYHGCm2pe0dIM7f36EVTUk/CrNy6Anh9MAi/QfMAGR0k/RJ1ipGPWltTWiZBw5hQcqePitXzeETkWPZ7B8mii1YB3GSsXIZmd+g2f5sybg5xuHSBbMWMoIoocwZkg/pqSQFb9ywXNLwnow2slzOmGIvw==;
 5:7ZizuL/jdc1lfWrBxWw2OesetR04RkaNVi/LTl+zuBCGeAMsESVLLa0ZQ7l4WqTn67dVKdQ3aSJdg+IddL0BBRuiFfryakIK2hnUNmPVj6HGrEmPLDmAPi4DtqQhO9ZJYfb2ChhksJuBnccgW2nMVfU07xx9JCEfGfCZdnopekYTOW20JiR4lo8jIafzkJhuZbNUa75o0tFaoK5jWMUQHQ==;
 7:Q6ndsGTSeeaVE/tJ28U29wU+tQQ37zwYc9YVSGhR8Yss5MsnzWyDpeAKk3kqoBGFLXSlLk28x5U5N2c8ZMhDtZmTGvF0ifn9fthYDGrcUpNMRuanX1o3lJifzXHPbTCvDt2+l7meOY/3fnuIVc1n2A==
x-ms-office365-filtering-correlation-id: 78b23a68-cd2f-4366-7b45-08d6808ad10b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN8PR10MB3233; 
x-ms-traffictypediagnostic: BN8PR10MB3233:
x-microsoft-antispam-prvs: <BN8PR10MB3233F72753C819E5B0509989F4980@BN8PR10MB3233.namprd10.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(376002)(346002)(39850400004)(54094003)(13464003)(52314003)(199004)(189003)(26005)(478600001)(97736004)(118296001)(7416002)(8676002)(446003)(3846002)(6436002)(25786009)(6116002)(81156014)(11346002)(2501003)(71190400001)(71200400001)(76176011)(476003)(229853002)(72206003)(30864003)(316002)(4326008)(2616005)(102836004)(8936002)(966005)(53546011)(93886005)(486006)(6506007)(110136005)(53936002)(81166006)(54906003)(45080400002)(256004)(6486002)(66066001)(6306002)(14444005)(99286004)(39060400002)(105586002)(6512007)(14454004)(86362001)(106356001)(36756003)(7736002)(186003)(6246003)(68736007)(305945005)(2906002)(71610200001)(356934004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3233;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gcteDNkhngUwQUZ59DuHUyw6CcC058vOTFR77sr6QpuToi6bTtrbK13xJKVct8Je51CxDC81PuoYTiWnHsTQAneRrxGFAcQz9ctKdVP7nJzgkeTTpYm20qs5XmUCsv/sn4rViv1yDdg0BnxgqVracGk1H5Iw+gpTjQp4IcIBuPrLwEa2CWMqctiJLf+6cnCBLIPI5DNfcAiej48v9dR28BzsRTkSJKa9RFID727VCqvMpY7PoS4J147n8FNdzNfa3cXoVqh7oVxlLUUfo/SmkEJu32UdFXN0Q6jY2xPjAniDWIx/I+dBZ0nbbsoUGBCQEsciscIQ5xRAJImEG+xJKnOw1WsG9Qy4BZBFSGhpIApPrYjEmM04zKjW2OPgCNA4HAGqsUosDiZBbd+T5eUTPiYsFQ1Bryf+6DzoBZEXzBE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <D8501F7B9525BC4DB9DFDC381EFB2066@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b23a68-cd2f-4366-7b45-08d6808ad10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 16:58:21.9085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_085826_278453_2DDAD40A 
X-CRM114-Status: GOOD (  43.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "hauke@hauke-m.de" <hauke@hauke-m.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "chris.packham@alliedtelesis.co.nz" <chris.packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "koen.vandeputte@ncentric.com" <koen.vandeputte@ncentric.com>,
 "fbettoni@gmail.com" <fbettoni@gmail.com>, "nbd@nbd.name" <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-23 at 00:49 +0900, Tokunori Ikegami wrote:
> 
> 
> Hi Boris-san,
> 
> Very sorry for too late to update about this.
> But could you please let me consult below about this patch?
> 
> I have tried to investigate the issue root cause and confirmed below but
> still the root cause seems not clear.
> 
>   1. Without the change the write oneword is retried and recovered by the
> current existing chip_good() checking.
>      But after the 1,001 times recovery it was continued to fail recovery
> with the 3 times retry.

I have lost track of all the details regarding this issue. I just want to add:

There is a max number of suspend/resume cycles one can do during an erase(possibly also for write)
and once that number is hit you get an error. One way to avoid this could be to
wait after each resume until the erase has started again(look in status register)
before continuing.

If this has anything to do with this problem, I do not know.

 Jocke

>   2. By the patch change the recovery failure can be avoided and the write
> oneword works correctly without any failure.
>      There are different from the original chip_good() checking as the
> original code resets the chip before the retry.
>      The patch change wait the chip_good() status until the timeout expiry
> without the chip reset.
>        Note: There is a different from the original OpenWrt patch and needed
> to be changed as same and it will be done by the next v4 patch.
> 
>   3. To narrow down the cause I have added some delays into the original
> code to check the chip ready and good status.
>      But the failure behavior was not changed so it seems that the issue is
> not depended to the timing. (But not sure)
> 
>   4. On the OpenWrt the write buffer is disabled but to narrow down the
> issue I have changed to enable the write buffer.
>      Then the flash error was not happened by the write buffer operation so
> it seems that the flash driver works correctly.
>      But another issue was caused and it is similar issue with the original
> OpenWrt behavior with the patch change.
>        Note: On the original OpenWrt needs to wait the file system
> completion to build but it was not finished with the write buffer. (But not
> sure about this behavior)
> 
> Do you have any comment about this result?
> 
> If you can agree about the patch change basically with the current situation
> I will do send the v4 patch set later with fix for the comments.
> 
> But it seems that it is difficult to investigate the root cause more at this
> moment to me.
> Since but the behavior looks depended on the flash chip hardware behavior
> and I cannot debug the hardware behavior more I think.
>   Note: Now I can reproduce the flash error issue behavior on the OpenWrt
> unit.
> 
> > > >     It is depended on the actual flash chip behavior so the root cause
> > > is
> > > >     unknown.
> > > 
> > > Yes, and that's what I'd like you to figure out, or at least have a
> > > good idea why this doesn't work on some chips but works on others.
> > 
> > I see.
> > But it is a little bit difficult situation since I do not have the failure
> > environment locally at this moment.
> > But if needed I may ask to get the help for this to Fabio-san.
> 
> Regards,
> Ikegami
> 
> > -----Original Message-----
> > From: IKEGAMI Tokunori [mailto:ikegami@allied-telesis.co.jp]
> > Sent: Tuesday, November 6, 2018 6:47 PM
> > To: Boris Brezillon; ikegami_to@yahoo.co.jp
> > Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> > stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> > linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> > Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> > do_write_oneword() to use chip_good()
> > 
> > Sorry let me resend the mail below by changing the email address of
> > Felix-san.
> > 
> > -----Original Message-----
> > From: IKEGAMI Tokunori
> > Sent: Tuesday, November 06, 2018 6:37 PM
> > To: 'Boris Brezillon'; 'ikegami_to@yahoo.co.jp'
> > Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> > stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> > linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> > Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> > do_write_oneword() to use chip_good()
> > 
> > Hi Boris-san,
> > 
> > > -----Original Message-----
> > > From: stable-owner@vger.kernel.org
> > > [mailto:stable-owner@vger.kernel.org] On Behalf Of Boris Brezillon
> > > Sent: Tuesday, November 06, 2018 5:34 PM
> > > To: IKEGAMI Tokunori
> > > Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> > > stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> > > linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> > > Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> > > do_write_oneword() to use chip_good()
> > > 
> > > Hi IKEGAMI,
> > > 
> > > On Tue, 6 Nov 2018 00:25:43 +0000
> > > IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:
> > > 
> > > > > > Also the issue can be fixed by using chip_good() instead of
> > > chip_ready().
> > > > > > The chip_ready() just checks the value from flash memory twice.
> > > > > > And the chip_good() checks the value with the expected value.
> > > > > > Probably the issue can be fixed as checked correctly by the
> > chip_good().
> > > > > > So change to use chip_good() instead of chip_ready().
> > > > > 
> > > > > Well, that's not really explaining why you think chip_good() should
> > > be
> > > > > used instead of chip_ready(). So I went on and looked at the
> > > > > chip_good(), chip_ready() and do_write_oneword() implementation, and
> > > > > also looked at users of do_write_oneword(). It seems this function
> > is
> > > > > used to write data to the flash, and apparently the "one bit should
> > > > > toggle to reflect a busy state" does not apply when writing things
> > to
> > > > > the memory array (it's probably working for other CFI commands, but
> > > I
> > > > > guess it takes more time to actually change the level of a NOR cell,
> > > > > hence the result of 2 identical reads does not mean that the write
> > is
> > > > > done).
> > > > > 
> > > > > Also, it seems that cmdset_0001 is not implementing chip_ready() the
> > > > > same way, and I wonder if cmdset_0002 implementation is correct to
> > > > > start with. Or maybe I don't get what chip_ready() is for.
> > > > > 
> > > > > Anyway, this is the sort of clarification I'd like to have.
> > > > 
> > > > I am thinking to update the commit message as below.
> > > > 
> > > >     mtd: cfi_cmdset_0002: Use chip_good() to retry in
> > do_write_oneword()
> > > >     As reported by the OpenWRT team, write requests sometimes fail on
> > > some
> > > >     platforms.
> > > >     Currently to check the state chip_ready() is used correctly as
> > > described by
> > > >     the flash memory S29GL256P11TFI01 datasheet.
> > > 
> > > I had a look at the S29GL256P datasheet here [1], and if I'm correct,
> > > it's using cmdset 0001.
> > 
> > No actually the cmdset 0002 is used on the flash chip.
> > The manufacturer ID xx01h and Device ID 2201h are used to decide.
> > 
> > There is information from Fobis-san below also about this.
> > 
> > On forum thread musashino posted picture of flash chip:
> > https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fforum.openwrt.org%2Ft%2Fimpossible-to-install-update-any-packages-&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=NNGSYgq1VTuofPPMMlyKIm9W1DJHQFw0s94Ernq5cts%3D&amp;reserved=0
> > on-wzr-hp-g300nh-18-06-1
> > https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.cypress.com%2Fpart%2Fs29gl256p11tfi010&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=Twk1VUEESz14UpdJjU4ohuhiQ5jN1uHLh0cAhlAznW0%3D&amp;reserved=0
> > 
> > [    0.862264] physmap platform flash device: 02000000 at 1e000000
> > [    0.868331] physmap-flash: Found 1 x16 devices at 0x0 in 16-bit
> > bank. Manufacturer ID 0x000001 Chip ID 0x002201
> > [    0.878493] Amd/Fujitsu Extended Query Table at 0x0040
> > [    0.883668]   Amd/Fujitsu Extended Query version 1.3.
> > [    0.888768] number of CFI chips: 1
> > [    0.894557] Searching for RedBoot partition table in physmap-flash
> > at offset 0x1fc0000
> > [    0.918009] Searching for RedBoot partition table in physmap-flash
> > at offset 0x1fe0000
> > [    0.941464] No RedBoot partition table detected in physmap-flash
> > [    0.947926] Creating 5 MTD partitions on "physmap-flash":
> > [    0.953384] 0x000000000000-0x000000040000 : "u-boot"
> > [    0.960853] 0x000000040000-0x000000060000 : "u-boot-env"
> > [    0.968803] 0x000000060000-0x000001fc0000 : "firmware"
> > [    0.981859] 2 uimage-fw partitions found on MTD device firmware
> > [    0.987900] 0x000000060000-0x0000001b5706 : "kernel"
> > [    0.994916] 0x0000001b5706-0x000001fc0000 : "rootfs"
> > [    1.001986] mtd: device 4 (rootfs) set to be root filesystem
> > [    1.007789] 1 squashfs-split partitions found on MTD device rootfs
> > [    1.014014] 0x0000003c0000-0x000001fc0000 : "rootfs_data"
> > [    1.022093] 0x000001fc0000-0x000001fe0000 : "user_property"
> > [    1.030283] 0x000001fe0000-0x000002000000 : "art"
> > 
> > Maybe you could post links to forum thread, and data sheet.
> > 
> > > >     Also chip_good() is used to check if the write is succeeded and
> > it
> > > was
> > > >     implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve
> > > error
> > > >     checking").
> > > >     But actually the write failure is caused on some platforms and
> also
> > > it can
> > > >     be fixed by using chip_good() to check the state and retry
> instead.
> > > Do you know on which NOR chips this happens? Do you have access to the
> > > datasheet?
> > 
> > But it looks SST49LF008A [3] from the changes below but I am not sure at
> > this moment and probably it should be confirmed to the authr Eric W.
> > Biedermann <ebiederman@lnxi.com> to make sure.
> > 
> > +#define SST49LF008A            0x005a
> > 
> >  static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *,
> > u_char *);
> >  static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t,
> > size_t *, const u_char *);
> > @@ -191,6 +192,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
> >  };
> >  static struct cfi_fixup jedec_fixup_table[] = {
> >         { MANUFACTURER_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
> > +       { MANUFACTURER_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
> > 
> > > >     It is depended on the actual flash chip behavior so the root cause
> > > is
> > > >     unknown.
> > > 
> > > Yes, and that's what I'd like you to figure out, or at least have a
> > > good idea why this doesn't work on some chips but works on others.
> > 
> > I see.
> > But it is a little bit difficult situation since I do not have the failure
> > environment locally at this moment.
> > But if needed I may ask to get the help for this to Fabio-san.
> > 
> > > > If any comment please let me know.
> > > > 
> > > > > > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > > > > > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > > > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > > > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
> > > > > 
> > > > > Has the patch really gone through all those people? SoB is used when
> > > you
> > > > > apply a patch in your tree or when you're the original author.
> > > > 
> > > > I have just checked the OpenWRT git log again and it looks that it was
> > > originally
> > > > implemented by Felix Fietkau <nbd@openwrt.org> by the patch below so
> > I
> > > will update the Signed-off-by tag as so.
> > <https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.openwrt.org%2F%3Fp%3Dopenwrt%2Fopenwrt.git%3Ba%3Dcommitdiff%3Bh%3D2530640&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=w13ZTKwD1NiUQzxQfUou92KVDlW80qGUiZVIcjU%2BGPA%3D&amp;reserved=0
> > > f07cd2b3b14fe9ec03fa63a586452cc5f>
> > > > > > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > > > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > > > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
> > > > > 
> > > > > Not sure we want to add new undocumented tags, but you can mention
> > > > > that all those people helped you find/debug the issue. They can also
> > > > > add their Reviewed-by/Tested-by if they like.
> > > 
> > > My bad, I just noticed these are valid flags [2], so you can keep them,
> > > and according to the doc, you should also keep the SoB.
> > 
> > I see.
> > Yes I had also checked it.
> > 
> > By the way in near future my company email address will be not able to
> use.
> > So I will change the mail address to my personal email address [4] after
> > that or before.
> > 
> > Regards,
> > Ikegami
> > 
> > > Regards,
> > > 
> > > Boris
> > > 
> > > [1]https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.cypress.com%2Ffile%2F219926%2Fdownload&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=ILqgA75bFHZz9GnswZiDnknzEb3Dryha6CFuVb5Hvhs%3D&amp;reserved=0
> > > 
> > [2]https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2F&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=xRCLc%2FnYHeLAiyKoj3obuOuY19JnZPZFZAYrZh%2BJXUI%3D&amp;reserved=0
> > > tree/Documentation/process/submitting-patches.rst?h=v4.20-rc1#n546
> > 
> > [3]https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.microchip.com%2Fwwwproducts%2Fen%2FSST49LF008A&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C916af968b27a402da8cf08d680812fce%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C636837689680126557&amp;sdata=3v3AaOaxogw4PAydIISO3PTmkzXo4Tdbux2D0Q1V5sg%3D&amp;reserved=0
> > [4]ikegami_to@yahoo.co.jp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
