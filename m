Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C69AC433E6
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:49:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51ED064DCF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 10:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51ED064DCF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cIIWU4LGOXAJ85MYvBn4Fz1fpl2uZzkQRk8vnCfJhcI=; b=noOX/21wNBHcPthW91TGB2bW4
	0+Cc7NPAYfazWygPMQx5B3idx3hcy5q26u4PuEXXUOgcFVPHE2JF3pvNgFEDNFZHyj4x2xR1OBQCf
	suy4VAG3wpq39CZnprKSomZ3StjEdz0vSI4aLaCKFZp1Bi7zVbsEg45S7EMFgYbKymBJIPLRTIMNq
	iD/My0FWY/jonxcsXPJfjt6fFCbBfkaR42V40Ad+j0B/mjOgu7ZpUnbnO52kP5tSTS9M4aBZofa/g
	1UKRyG351eDUTTcbYWjyqoR2n5dxmkKt8hAuA6CyXzLu3+WdPEHGVp9nI5SHtEr7ZdCm49y22bBVx
	pHmEdWPiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBxuR-00026J-DE; Tue, 16 Feb 2021 10:48:47 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBxuN-00025y-LU
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 10:48:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11GAmgjh005432;
 Tue, 16 Feb 2021 04:48:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1613472522;
 bh=LOaFpgw4GBINfJQ1qMnI6cBRJpKYlL0CIuWkoQOofSM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=SoVaexmRrTDFFeOy3gskfOYsMnJLrOlMIfQhSWHzyUCTpAORpqSWPeQkKq3rmtykQ
 44/sncyHo1S01maysMfAsL/BLnPwMClzG4byk/be4G6VALjraDVUJ7p0qqhcOrrVGl
 bmUbWBMDk8y3kfP4USe+DJ+DywfSkq8raj2OHFjU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11GAmgfF128165
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Feb 2021 04:48:42 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Feb 2021 04:48:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Feb 2021 04:48:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11GAmf4U054534;
 Tue, 16 Feb 2021 04:48:41 -0600
Date: Tue, 16 Feb 2021 16:18:40 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Message-ID: <20210216104838.ntzwot5dqszwriwn@ti.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <20210216101603.s22b2fs7en52ximf@ti.com>
 <20210216102029.uz3u6dzl2eoh5c7x@ti.com>
 <CAEyMn7YZ353TxcwF=N8Z8piiq=Us2=r-MNphsnEKuJs_8SJUBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7YZ353TxcwF=N8Z8piiq=Us2=r-MNphsnEKuJs_8SJUBA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_054843_873937_4465BF5F 
X-CRM114-Status: GOOD (  29.58  )
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

On 16/02/21 11:41AM, Heiko Thiery wrote:
> Hi,
> 
> Am Di., 16. Feb. 2021 um 11:20 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
> >
> > On 16/02/21 03:46PM, Pratyush Yadav wrote:
> > > On 16/02/21 10:48AM, Michael Walle wrote:
> > > > Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> > > > > On 15/02/21 10:53PM, Heiko Thiery wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > I faced an issue with a SPI flash on our board. We use a macronix
> > > > > > MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> > > > > > the MX25L12805D [2].
> > > > > >
> > > > > > The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> > > > > > while the older doesn't.
> > > > > >
> > > > > > I thought that I could do a fixup with a device specific
> > > > > > post_bfpt_fixups() call but by now this seems not possible. The older
> > > > > > MX25L12805D has no flags set that allows a call to
> > > > > > spi_nor_sfdp_init_params() and implements the fixup.
> > > > > >
> > > > > > Has anyone an idea how to solve this?
> > > > >
> > > > > The post_sfdp fixup is always run regardless of whether the flash has
> > > > > SFDP or not. You can try putting your flash-specific fixups there.
> > > >
> > > > Well the problem here is, that the SFDP setup is skipped though the
> > > > flash would support SFDP. If the jedec id wasn't already in the table,
> > > > there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> > > > parsed. But because there is already the legacy device (which likely
> > > > doesn't support SFDP) it really doesn't fit.
> > >
> > > Is it possible to differentiate between the two flashes in any way? If
> > > so you can use the init_params() fixup to check that add the flags for
> > > the new flash. Modifying nor->info feels kind of wrong but it is an
> > > acceptable compromise in this situation IMO.
> >
> > I take that back. nor->info is declared as const and let's keep it that
> > way. Maybe you can add something in nor->flags to indicate we want to
> > parse SFDP? Or maybe there is some other way to indicate SFDP support?
> 
> That was also my intention. I thought about something like
> SPI_NOR_FORCE_SFDP. But what will happen if we try to parse and the
> legacy device does not support SFDP read?

Most likely it will not do anything and SFDP parsing will fail because 
it can't find the SFDP signature. But let's try to avoid that if 
possible. Is it possible to differentiate between the two flashes in any 
way? If it is possible, then just set the flag for the new device and 
leave the legacy device alone.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
