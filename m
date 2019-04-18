Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2235C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32D02054F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rew7GPXv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovjE5Vd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C32D02054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqd9bi8/F2/0DrrWW2UjPkXxm86oJmY4e9yDltfp4Co=; b=rew7GPXvRnvX2w
	h6aPgvjHbDetNq4Kh50pYW1zWji8pWbomJm2ylmkJdZoQhWhZ/9/OGn3rK4eDeO6owDKMqB2raac8
	FaROJgaSsnU2a5ZvNP1GMAW4vA5YuicNNPgbsZLQWk/Lmba8oie12YI8N2Z0Xc6ynnWkq9NYKaOVk
	TAZIEyAcGqf6LR85xKi4a5uIfGCRL9YeRswf8UdSB0l2jouhnKxhY2tvdyvwDHe/gZ3th9C+QcJwz
	x1YAWfnJquVth81BZWp7Dkm4CG7x/pgsyiCdhXmd/j06up34VeAJWotAJAqPXo28o7hzo6yBd92c9
	OkpEKYJW0JS/Esf0Eo/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCRU-00040R-Bm; Thu, 18 Apr 2019 19:11:28 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCRM-0003tN-2Q; Thu, 18 Apr 2019 19:11:21 +0000
Received: by mail-lj1-x241.google.com with SMTP id f23so2858741ljc.0;
 Thu, 18 Apr 2019 12:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHHGOHwosqs6I3QLp8i+LTp60aneQYuKN4bfTcUI3/I=;
 b=ovjE5Vd8ZSu6+B43E9Fbj+IMHu17dAnzXDECOxyNOcpzONlA7kswMXlwG5uyOlSwij
 PEarH3rsNx8Ku3yByZ6o2I2M1DIohaNPNwykzdgTCUsDMlwmb2RN6wYDHTNCC0GqKMr5
 j4d7OLud/4d9NgNrV3fhByj6eln0QWgSVHwPE9K1mNFrbZ2facA4jfgQs+9miyrUaW7K
 FodjWqe4kolh/KxPnZWJcon3brI6Fd9K6YkcXMDCwmW6ZwlVrjUmSR8E0Eluykb4Sqnr
 pS0xxEU0stGIiNGMlZnfDvJ/A7TEpEZADiN5t7ewB5C2vQCubfPtAN8mvSJwHQFDjl8I
 TY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHHGOHwosqs6I3QLp8i+LTp60aneQYuKN4bfTcUI3/I=;
 b=GIkZ/NZlVd9tYFXEXBOCKZeQiQhjnmfgXlaDRc+u2Q20vPq3lQETRX/XaV7ozk/DO4
 Eer2N3TOKrbTcbG7NAICmXaCyoqjmq9tCXEzlNCdiXRpyShWm0dVmtz6i34cTMIo1Jtu
 UOoiRt+bEgCIznhCNHfg3aBU157RF2wMlCigO8SzXH1ap3GDVxqvJ5nRNahFqRHI0Q8z
 nWU59++fm3Q/YxjPouPncZ95OnsoZhPhkmplckbVw8AQERICW4q4+DPV20geHu0eJI8h
 LXPm1PXb1cQS8VUYYW7BtUARaROaWuxGkoc31uFEzu1CbcjIaEYCjcRvUD9eLQYyeHBW
 +GVw==
X-Gm-Message-State: APjAAAWWJxHSj8TG4Wv9TUGjumU97FX+TeRuXZeY2HCYJx3P/ykylsdF
 Y32zLQNPQFJviJQ/E8aJ7vA=
X-Google-Smtp-Source: APXvYqyKbQ22SHB0KxSu19bxHvemm2v4ihEUCVkgWR3I43d2zScebayyk4m9Bq3kInadibOYAihC/A==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr11242504ljk.158.1555614678148; 
 Thu, 18 Apr 2019 12:11:18 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id j28sm655344lfh.81.2019.04.18.12.11.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 12:11:17 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Thu, 18 Apr 2019 21:11:14 +0200
Message-ID: <5022351.qh9aoUC7DE@z50>
In-Reply-To: <20190418084929.7ac2cb67@xps13>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <3638685.4RdFRBT8kZ@z50> <20190418084929.7ac2cb67@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_121120_130999_06F55051 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: linux-omap@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miqu=E8l,

I'm wondering if we could register up a custom mtd partition parser from th=
e =

board file.  It could return a pointer to a statically defined table.  Then=
 we =

could add its name to the list of parsers the driver is going to try if the =

board is enabled in .config.
Would that be acceptable from the MTD subsystem point of view?

Thanks,
Janusz


On Thursday, April 18, 2019 8:49:29 AM CEST Miquel Raynal wrote:
> Hi Janusz,
> =

> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Thu, 18 Apr 2019
> 01:09:59 +0200:
> =

> > Hi Aaro, Tony,
> > =

> > On Wednesday, April 17, 2019 11:40:10 AM CEST Miquel Raynal wrote:
> > > Hi Janusz,
> > > =

> > > Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote on Sun, 24 Mar 2019
> > > 23:33:44 +0100:
> > >   =

> > > > After recent modifications, only a hardcoded partition info makes
> > > > the driver device specific.  Other than that, the driver uses GPIO
> > > > exclusively and can be used on any hardware.
> > > > =

> > > > Drop the partition info and use MTD partition parser with default l=
ist
> > > > of parser names instead.  For the OF parser to work correctly, pass
> > > > device of_node to mtd.
> > > > =

> > > > Amstrad Delta users should append the following partition info to =

their
> > > > kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> > > > =

> > > > mtdparts=3Dams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-
boot_params),\
> > > > 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).
> > > > =

> > > > For their convenience, CONFIG_MTD_CMDLINE_PARTS symbol is selected
> > > > automatically from that board Kconfig if this NAND driver is also
> > > > selected.
> > > > =

> > > > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > > Cc: Tony Lindgren <tony@atomide.com>
> > > > ---  =

> > > =

> > > FYI I am okay with the change but I am waiting for acks before applyi=
ng
> > > it.  =

> > =

> > May we have an ack from you?
> > =

> > If still not convinced with my clarifications, I can add a comment to h=
elp =

text =

> > in Kconfig, either squashed or in a follow up patch, on the requirement=
 of =

> > appending mtdparts parameter to command line.  What do you think?
> =

> In the same patch I guess that would be fine.
> =

> Thanks,
> Miqu=E8l
> =






______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
