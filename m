Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDEDC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 11:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BE964DDA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BE964DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5KffowLu3VJh3lh7aUJW4x3HS6cR8MkgX4t3sEpjfFE=; b=NR6QxtZaTsThJIu9MpUn32wDy
	DY3IkmZqPIAVSx7Q0kWbOKzOBid19FgVcjGVdqyoR6qW5z+/SRheiXmcJHJPjP46712wNvEnO06u9
	M5YIv8d8WCnm7uniGKOx2qEMAgaWB6oS+kxmxTE368AGV6IQGOX54TVTFEp02Hv0vI0i6TWy/UPg4
	JDMCaXdekQvd4G0AYf+Bz746RgV3H6WjCneockjkD81YqBgoqWLuWcEMtB1aqAqXh5uoADfoUqrnu
	2ZFHw77jWk+tetLHjCbpL+RHd2+2D+4irDcGRzh5ZYAhrE4G8BTW5neqE7QiMvX9JLsABekwlhOuu
	UEmTGQ6kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lByAG-0003zJ-9I; Tue, 16 Feb 2021 11:05:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lByAC-0003yh-Os
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 11:05:05 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11GB53NC011406;
 Tue, 16 Feb 2021 05:05:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1613473503;
 bh=mxSMd/qZPy7Hpbc4hYgQCzDPtpHBTBHNSuPjhe8cqaI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dlAQr2cV6R4H41hhbhJdDGcyBRaKyQA82w8WlMRx+zWwlIA3VWQCv4wuA3zO05T1q
 u7ZXWBMnZ0xCTMydi6btm+3PjquZbOufAAS8ffJmr1FdKJ8Cy0Qw0P4rnwL5BVrwpy
 dNYiK0yKg4rttbBqZRypUtXHIt7xsjHKtqIKMins=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11GB52uu018844
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Feb 2021 05:05:03 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Feb 2021 05:05:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Feb 2021 05:05:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11GB51TE117759;
 Tue, 16 Feb 2021 05:05:02 -0600
Date: Tue, 16 Feb 2021 16:35:01 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Message-ID: <20210216110459.o5l3st3yjav2tzjd@ti.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <20210216101603.s22b2fs7en52ximf@ti.com>
 <20210216102029.uz3u6dzl2eoh5c7x@ti.com>
 <CAEyMn7YZ353TxcwF=N8Z8piiq=Us2=r-MNphsnEKuJs_8SJUBA@mail.gmail.com>
 <20210216104838.ntzwot5dqszwriwn@ti.com>
 <CAEyMn7bBLTMWbgHH9a-TZCA7Pe6-uiffMowHsv2Q6jxsVJ_now@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7bBLTMWbgHH9a-TZCA7Pe6-uiffMowHsv2Q6jxsVJ_now@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_060504_969519_937988E4 
X-CRM114-Status: GOOD (  34.92  )
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
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16/02/21 11:55AM, Heiko Thiery wrote:
> Hi,
> 
> Am Di., 16. Feb. 2021 um 11:48 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
> >
> > On 16/02/21 11:41AM, Heiko Thiery wrote:
> > > Hi,
> > >
> > > Am Di., 16. Feb. 2021 um 11:20 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
> > > >
> > > > On 16/02/21 03:46PM, Pratyush Yadav wrote:
> > > > > On 16/02/21 10:48AM, Michael Walle wrote:
> > > > > > Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> > > > > > > On 15/02/21 10:53PM, Heiko Thiery wrote:
> > > > > > > > Hi all,
> > > > > > > >
> > > > > > > > I faced an issue with a SPI flash on our board. We use a macronix
> > > > > > > > MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> > > > > > > > the MX25L12805D [2].
> > > > > > > >
> > > > > > > > The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> > > > > > > > while the older doesn't.
> > > > > > > >
> > > > > > > > I thought that I could do a fixup with a device specific
> > > > > > > > post_bfpt_fixups() call but by now this seems not possible. The older
> > > > > > > > MX25L12805D has no flags set that allows a call to
> > > > > > > > spi_nor_sfdp_init_params() and implements the fixup.
> > > > > > > >
> > > > > > > > Has anyone an idea how to solve this?
> > > > > > >
> > > > > > > The post_sfdp fixup is always run regardless of whether the flash has
> > > > > > > SFDP or not. You can try putting your flash-specific fixups there.
> > > > > >
> > > > > > Well the problem here is, that the SFDP setup is skipped though the
> > > > > > flash would support SFDP. If the jedec id wasn't already in the table,
> > > > > > there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> > > > > > parsed. But because there is already the legacy device (which likely
> > > > > > doesn't support SFDP) it really doesn't fit.
> > > > >
> > > > > Is it possible to differentiate between the two flashes in any way? If
> > > > > so you can use the init_params() fixup to check that add the flags for
> > > > > the new flash. Modifying nor->info feels kind of wrong but it is an
> > > > > acceptable compromise in this situation IMO.
> > > >
> > > > I take that back. nor->info is declared as const and let's keep it that
> > > > way. Maybe you can add something in nor->flags to indicate we want to
> > > > parse SFDP? Or maybe there is some other way to indicate SFDP support?
> > >
> > > That was also my intention. I thought about something like
> > > SPI_NOR_FORCE_SFDP. But what will happen if we try to parse and the
> > > legacy device does not support SFDP read?
> >
> > Most likely it will not do anything and SFDP parsing will fail because
> > it can't find the SFDP signature. But let's try to avoid that if
> > possible. Is it possible to differentiate between the two flashes in any
> > way? If it is possible, then just set the flag for the new device and
> > leave the legacy device alone.
> 
> Is there a good reason not to do the SFDP parsing in general? At the
> moment I have no other idea how to differentiate the two flashes.

The fact that the flash (legacy one) does not support the SFDP command 
at all is reason enough for me. Why issue commands that a flash doesn't 
support?

But if you don't manage to find anything better, I guess the SFDP 
command can be used to tell the flashes apart. But don't rely on 
spi_nor_parse_sfdp() to do so. Do it in the default_init() hook. Of 
course, details can be better fleshed out when there is an actual patch 
to read through :-)

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
