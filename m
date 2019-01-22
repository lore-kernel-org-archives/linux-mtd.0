Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56990C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 15:49:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2676620855
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 15:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Us8gjkQi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="ITxNgtC3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2676620855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJkw7cYdaPchMuA56d2+jvglKqnzvN64OXLOWfY+C6M=; b=Us8gjkQimDHgy+
	BXNSm7mBGcftz4Nim2eiCLzse0MjPlKC1ih4lRP6JGfVEs8gnPEM5nKRv92mtijvXHRa/iAuFeUhi
	6HY/dUcoCv93Q0z+czOS0f0NYupeD3jCTz9JcJFfheyWqWmGM1Igjiv2KRGM8q1hLsfJKrsE7Lpzh
	699w/0Dyze/T3n3F04uIPjPvrUbj0FhiflrgoR8apTEPTWQ3nuEtwKISwD3so5jxcgO7FMytrJrvG
	lRxnwW9B1q/x3F1bf5fPvfOQOKC7jkRZpiIgmdydWAR8Sc1p/8UC0iBOkPflZKIrWuRtzicca6fqw
	Yqjt37ppwE2GVgaf+gXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glyJ7-0002KJ-Gd; Tue, 22 Jan 2019 15:49:45 +0000
Received: from nh601-vm3.bullet.mail.ssk.yahoo.co.jp ([182.22.90.12])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glyJ2-0002Jo-Vv
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 15:49:44 +0000
Received: from [182.22.66.103] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 22 Jan 2019 15:49:25 -0000
Received: from [182.22.91.206] by t601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 22 Jan 2019 15:49:25 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 22 Jan 2019 15:49:25 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 410820.64118.bm@omp609.mail.ssk.yahoo.co.jp
Received: (qmail 28059 invoked by alias); 22 Jan 2019 15:49:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1548172165; bh=D3oT48hXyvM/T/RA7xIbyf9xbMpTZRHo/7jzplYTE9s=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=ITxNgtC3T2UFMXRClozV4Fswe1IPe6iNbuLF3UvpLsTZwxLd54EufOduHufyMehIlaFXzT9WsNRSJQnKmZHkuQw978Ln/+8m/Ln2Al1MYShYoL/wHV8dAe17L1X9YMWNAtLjkZNClL5njMFafnCOJOL55+AzaVF3Rge22KPVy7c=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=NzRRvImWObUOG/p7rxK8T+zijIGVPIpLHomQE/bmrsDPQV0ysR/GhEfBTnfkwa8ySiHjFoY4PBGf+Seh8J+oepyk9KC5rkb2U9/sXQkhVWu8oHXf4PQy31YvovZTmp/TQfn8zDCSZNfuH4wpAX4NvVIQzosjLX0c4z90rytLrBI=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5010.mail.kks.ynwp.yahoo.co.jp with SMTP; 22 Jan 2019 15:49:24 -0000
X-YMail-JAS: u0Uz.Q0VM1nqaxUREaUEF7w7YbeQQdK39TfXRMNZMtdTB4Y_KL7SoSDtvB0iXe9rouvUl5AgUfusCJeZbjSq9eKUCZCip4wcYtQZ99I5aynflKqhxJylB7aW3mMa5zoEWSHDpMWkag--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: .Wc36jsVM1nZZmEmecOLtHnF5fdLmoLUXtZ68CaebOKAcZH
 BFYJYBVhZErSrCJYyPOG2tQN2.vODM6zlZCnTFRb8J8mOQ.IwL4gEVQa5GzA
 TJ_wc.Jd8uuiGT8HX2iSKTjDeli_etFSpO4Nwilbe6qu8NpP.r.dcCYBFuN_
 NaX8dLg6tamQsuqaayeZqgD3VwFtucmXMOOsgX_V5lAHF2W.G.4QnWoTbUKa
 4b7m3.ojE3wjLxpqapaPEeKRXBBRUml7b5eG26FYgg31HVDzvIob4rVo9U2B
 8urJb6gu5KQjkrgl0aAHY7oqdXgNzc_ReINSxYpaZaElTKzxpgSw9YiPnt59
 s1rBa2YC14J62Ny89nM2l4rheuYphkK_9gfSoSf4Esuivz1m6kbS3HcpijO4
 EdsNeIK9c4HKGqtoXifENGop3OT_fVSqq_TywlNUPmb9bBE9OPqUeneTKZMH
 hmP1KyITpSegmzYaTmSOGPWHT30Kqyjc9Lj.YWyZTWv0XAAwKpN0be_dcQcc
 z91.88bxQBzSOqMdwft53el5hhy2.rjWyj6Ddq2kU7Kkb87l_8ssL.uTgNSv
 EcPZUX4hR4v9AM2sV2bPVIb9B7aUAt8WexqUmygK0_fsqg1tF.rhH
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <boris.brezillon@bootlin.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
 <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20181106093334.35864341@bbrezillon>
 <TYAPR01MB217508219EA8AEAA2071A018DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB217508219EA8AEAA2071A018DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Wed, 23 Jan 2019 00:49:22 +0900
Message-ID: <002c01d4b26a$0bbcff40$2336fdc0$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEc1iUTWNEuvW9CQnMWsmZI/tQqOQDV8xlaAXO9f/QCW1agNgFMmV8lAnyJYc6m56qfAA==
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_074941_446423_2CDBD10B 
X-CRM114-Status: GOOD (  48.79  )
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
Cc: boris.brezillon@free-electrons.com, 'Hauke Mehrtens' <hauke@hauke-m.de>,
 stable@vger.kernel.org, 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>,
 'PACKHAM Chris' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org,
 'Koen Vandeputte' <koen.vandeputte@ncentric.com>,
 'Fabio Bettoni' <fbettoni@gmail.com>, 'Felix Fietkau' <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris-san,

Very sorry for too late to update about this.
But could you please let me consult below about this patch?

I have tried to investigate the issue root cause and confirmed below but
still the root cause seems not clear.

  1. Without the change the write oneword is retried and recovered by the
current existing chip_good() checking.
     But after the 1,001 times recovery it was continued to fail recovery
with the 3 times retry.

  2. By the patch change the recovery failure can be avoided and the write
oneword works correctly without any failure.
     There are different from the original chip_good() checking as the
original code resets the chip before the retry.
     The patch change wait the chip_good() status until the timeout expiry
without the chip reset.
       Note: There is a different from the original OpenWrt patch and needed
to be changed as same and it will be done by the next v4 patch.

  3. To narrow down the cause I have added some delays into the original
code to check the chip ready and good status.
     But the failure behavior was not changed so it seems that the issue is
not depended to the timing. (But not sure)

  4. On the OpenWrt the write buffer is disabled but to narrow down the
issue I have changed to enable the write buffer.
     Then the flash error was not happened by the write buffer operation so
it seems that the flash driver works correctly.
     But another issue was caused and it is similar issue with the original
OpenWrt behavior with the patch change.
       Note: On the original OpenWrt needs to wait the file system
completion to build but it was not finished with the write buffer. (But not
sure about this behavior)

Do you have any comment about this result?

If you can agree about the patch change basically with the current situation
I will do send the v4 patch set later with fix for the comments.

But it seems that it is difficult to investigate the root cause more at this
moment to me.
Since but the behavior looks depended on the flash chip hardware behavior
and I cannot debug the hardware behavior more I think.
  Note: Now I can reproduce the flash error issue behavior on the OpenWrt
unit.

> > >     It is depended on the actual flash chip behavior so the root cause
> > is
> > >     unknown.
> >
> > Yes, and that's what I'd like you to figure out, or at least have a
> > good idea why this doesn't work on some chips but works on others.
> 
> I see.
> But it is a little bit difficult situation since I do not have the failure
> environment locally at this moment.
> But if needed I may ask to get the help for this to Fabio-san.

Regards,
Ikegami

> -----Original Message-----
> From: IKEGAMI Tokunori [mailto:ikegami@allied-telesis.co.jp]
> Sent: Tuesday, November 6, 2018 6:47 PM
> To: Boris Brezillon; ikegami_to@yahoo.co.jp
> Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> do_write_oneword() to use chip_good()
> 
> Sorry let me resend the mail below by changing the email address of
> Felix-san.
> 
> -----Original Message-----
> From: IKEGAMI Tokunori
> Sent: Tuesday, November 06, 2018 6:37 PM
> To: 'Boris Brezillon'; 'ikegami_to@yahoo.co.jp'
> Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> do_write_oneword() to use chip_good()
> 
> Hi Boris-san,
> 
> > -----Original Message-----
> > From: stable-owner@vger.kernel.org
> > [mailto:stable-owner@vger.kernel.org] On Behalf Of Boris Brezillon
> > Sent: Tuesday, November 06, 2018 5:34 PM
> > To: IKEGAMI Tokunori
> > Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> > stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> > linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> > Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> > do_write_oneword() to use chip_good()
> >
> > Hi IKEGAMI,
> >
> > On Tue, 6 Nov 2018 00:25:43 +0000
> > IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:
> >
> > > > > Also the issue can be fixed by using chip_good() instead of
> > chip_ready().
> > > > > The chip_ready() just checks the value from flash memory twice.
> > > > > And the chip_good() checks the value with the expected value.
> > > > > Probably the issue can be fixed as checked correctly by the
> chip_good().
> > > > > So change to use chip_good() instead of chip_ready().
> > > >
> > > > Well, that's not really explaining why you think chip_good() should
> > be
> > > > used instead of chip_ready(). So I went on and looked at the
> > > > chip_good(), chip_ready() and do_write_oneword() implementation, and
> > > > also looked at users of do_write_oneword(). It seems this function
> is
> > > > used to write data to the flash, and apparently the "one bit should
> > > > toggle to reflect a busy state" does not apply when writing things
> to
> > > > the memory array (it's probably working for other CFI commands, but
> > I
> > > > guess it takes more time to actually change the level of a NOR cell,
> > > > hence the result of 2 identical reads does not mean that the write
> is
> > > > done).
> > > >
> > > > Also, it seems that cmdset_0001 is not implementing chip_ready() the
> > > > same way, and I wonder if cmdset_0002 implementation is correct to
> > > > start with. Or maybe I don't get what chip_ready() is for.
> > > >
> > > > Anyway, this is the sort of clarification I'd like to have.
> > >
> > > I am thinking to update the commit message as below.
> > >
> > >     mtd: cfi_cmdset_0002: Use chip_good() to retry in
> do_write_oneword()
> > >
> > >     As reported by the OpenWRT team, write requests sometimes fail on
> > some
> > >     platforms.
> > >     Currently to check the state chip_ready() is used correctly as
> > described by
> > >     the flash memory S29GL256P11TFI01 datasheet.
> >
> > I had a look at the S29GL256P datasheet here [1], and if I'm correct,
> > it's using cmdset 0001.
> 
> No actually the cmdset 0002 is used on the flash chip.
> The manufacturer ID xx01h and Device ID 2201h are used to decide.
> 
> There is information from Fobis-san below also about this.
> 
> On forum thread musashino posted picture of flash chip:
> https://forum.openwrt.org/t/impossible-to-install-update-any-packages-
> on-wzr-hp-g300nh-18-06-1
> http://www.cypress.com/part/s29gl256p11tfi010
> 
> [    0.862264] physmap platform flash device: 02000000 at 1e000000
> [    0.868331] physmap-flash: Found 1 x16 devices at 0x0 in 16-bit
> bank. Manufacturer ID 0x000001 Chip ID 0x002201
> [    0.878493] Amd/Fujitsu Extended Query Table at 0x0040
> [    0.883668]   Amd/Fujitsu Extended Query version 1.3.
> [    0.888768] number of CFI chips: 1
> [    0.894557] Searching for RedBoot partition table in physmap-flash
> at offset 0x1fc0000
> [    0.918009] Searching for RedBoot partition table in physmap-flash
> at offset 0x1fe0000
> [    0.941464] No RedBoot partition table detected in physmap-flash
> [    0.947926] Creating 5 MTD partitions on "physmap-flash":
> [    0.953384] 0x000000000000-0x000000040000 : "u-boot"
> [    0.960853] 0x000000040000-0x000000060000 : "u-boot-env"
> [    0.968803] 0x000000060000-0x000001fc0000 : "firmware"
> [    0.981859] 2 uimage-fw partitions found on MTD device firmware
> [    0.987900] 0x000000060000-0x0000001b5706 : "kernel"
> [    0.994916] 0x0000001b5706-0x000001fc0000 : "rootfs"
> [    1.001986] mtd: device 4 (rootfs) set to be root filesystem
> [    1.007789] 1 squashfs-split partitions found on MTD device rootfs
> [    1.014014] 0x0000003c0000-0x000001fc0000 : "rootfs_data"
> [    1.022093] 0x000001fc0000-0x000001fe0000 : "user_property"
> [    1.030283] 0x000001fe0000-0x000002000000 : "art"
> 
> Maybe you could post links to forum thread, and data sheet.
> 
> >
> > >     Also chip_good() is used to check if the write is succeeded and
> it
> > was
> > >     implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve
> > error
> > >     checking").
> > >     But actually the write failure is caused on some platforms and
also
> > it can
> > >     be fixed by using chip_good() to check the state and retry
instead.
> >
> > Do you know on which NOR chips this happens? Do you have access to the
> > datasheet?
> 
> But it looks SST49LF008A [3] from the changes below but I am not sure at
> this moment and probably it should be confirmed to the authr Eric W.
> Biedermann <ebiederman@lnxi.com> to make sure.
> 
> +#define SST49LF008A            0x005a
> 
>  static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *,
> u_char *);
>  static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t,
> size_t *, const u_char *);
> @@ -191,6 +192,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  };
>  static struct cfi_fixup jedec_fixup_table[] = {
>         { MANUFACTURER_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
> +       { MANUFACTURER_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
> 
> >
> > >     It is depended on the actual flash chip behavior so the root cause
> > is
> > >     unknown.
> >
> > Yes, and that's what I'd like you to figure out, or at least have a
> > good idea why this doesn't work on some chips but works on others.
> 
> I see.
> But it is a little bit difficult situation since I do not have the failure
> environment locally at this moment.
> But if needed I may ask to get the help for this to Fabio-san.
> 
> >
> > >
> > > If any comment please let me know.
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > > > > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
> > > >
> > > > Has the patch really gone through all those people? SoB is used when
> > you
> > > > apply a patch in your tree or when you're the original author.
> > >
> > > I have just checked the OpenWRT git log again and it looks that it was
> > originally
> > > implemented by Felix Fietkau <nbd@openwrt.org> by the patch below so
> I
> > will update the Signed-off-by tag as so.
> > >
> >
> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=2530640
> > f07cd2b3b14fe9ec03fa63a586452cc5f>
> > >
> > > >
> > > > > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
> > > >
> > > > Not sure we want to add new undocumented tags, but you can mention
> > > > that all those people helped you find/debug the issue. They can also
> > > > add their Reviewed-by/Tested-by if they like.
> >
> > My bad, I just noticed these are valid flags [2], so you can keep them,
> > and according to the doc, you should also keep the SoB.
> 
> I see.
> Yes I had also checked it.
> 
> By the way in near future my company email address will be not able to
use.
> So I will change the mail address to my personal email address [4] after
> that or before.
> 
> Regards,
> Ikegami
> 
> >
> > Regards,
> >
> > Boris
> >
> > [1]http://www.cypress.com/file/219926/download
> >
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > tree/Documentation/process/submitting-patches.rst?h=v4.20-rc1#n546
> 
> [3]https://www.microchip.com/wwwproducts/en/SST49LF008A
> [4]ikegami_to@yahoo.co.jp


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
