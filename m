Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1DCC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xTBHEbaSK/CnzcFg+5RzLL0x8lIAXWHpH3SGf87r7o=; b=qm8IUGHtnbcPF1
	pX2epP07zI43+zachwVR6/Sqbh1e06bx+bRw103Ycs5zgLoNpEQlLIuJ4daXB0ROUAx5GkI4rKz/B
	I4+jiaFqvlPiEyKb+efsSFmLK24bU8Tbg5p8liA3VDdwFXWwjWibrGe4GDdlkkuCqG3W29NPEZyEB
	x0zGiNFNDCtuzdlLSo4w/OGZnywkKJjmmkrKSrQu4wBAQUddUDU2MHTAycpUzyC9yRb2gVFazYjt8
	YjQJ4N3jU4pwGXEc8Ia4+k3RSVtLwQ3Q5eCI30sX5Kz+y9aGngjC1rahWMayNrYEmhJcwwLdNRq68
	tKZan6ufYmvGTge2gv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r94lC-00DxON-0S;
	Fri, 01 Dec 2023 14:44:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r94lA-00DxNN-0B
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 14:44:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94l0-0007sC-5O; Fri, 01 Dec 2023 15:44:42 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94kz-00CsJd-4O; Fri, 01 Dec 2023 15:44:41 +0100
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r94kz-004lis-1Q; Fri, 01 Dec 2023 15:44:41 +0100
Date: Fri, 1 Dec 2023 15:44:41 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
Message-ID: <20231201144441.imk7rrjnv2dugo7p@pengutronix.de>
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
 <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
 <20231129174722.7d4e768c@xps-13>
 <0cb00798-6510-4456-81fd-90131b97fdb8@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cb00798-6510-4456-81fd-90131b97fdb8@app.fastmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_064452_116122_FD225A18 
X-CRM114-Status: GOOD (  23.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

On 23-11-29, Arnd Bergmann wrote:
> On Wed, Nov 29, 2023, at 17:47, Miquel Raynal wrote:
> > brgl@bgdev.pl wrote on Wed, 29 Nov 2023 10:10:28 +0100:
> >> Though if I'm being honest - I would prefer a single driver with
> >> backwards compatibility. Have you estimated the effort it would take
> >> to abstract both nvmem and mtd?
> >
> > Also agreed :-)
> 
> +1

Thank you very much for the input :) Of course having a single driver
would be better. Before spending to much effort for this I went the
simple way to gather some input in case of you don't like the approach
at all. I also hoped that we could deprecate the non MTD variant later
on. That beeinng said, MTD does not mean that we don't have access to
NVMEM since NVMEM is already supported by MTD as well. It's just not
under the same name and the backward/compatibility config is not set.
Therefore it's not a drop-in replacement right now.

> I think this particularly makes sense in the light the other
> at24 driver that was recently removed in commit 0113a99b8a75
> ("eeprom: Remove deprecated legacy eeprom driver").
> 
> The other problem with having two drivers is the need to
> arbitrate between them, e.g. when you have a machine with
> two at24 devices but want to use one of each for the two
> subsystems. This does not really work with our DT probing
> logic at the moment.

Yes this is not possible, but I also can't imagine such use-case. You
can use the MTD version for both since NVMEM is supported for the MTD
version as well.

Let me check how I can keep the backward compatiblity e.g. by guessing
which in case can be error prone as well.

Regards,
  Marco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
