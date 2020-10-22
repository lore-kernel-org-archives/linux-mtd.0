Return-Path: <SRS0=CH9v=D5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DFDC388F2
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 12:09:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC2A221FB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 12:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c3c2obpC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="SeMf5i/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC2A221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S9rXHrn3EPWcY26Rb+P/PvfBA3jG8bHZ4A5kXJxadOU=; b=c3c2obpCsqLVYa0ILckCWxojq
	omertM2ZqMULAZDg3xZOkKzb5UIfS59PujeVX5ca87gsrfea97dLKiX9nlmjhpg4NVgY3SQQ/O9s9
	lyMF6WHTbvq+j0XBzI4azK82yeFppqd9Gpfh9jGj93DwLuOxqTfMucHniOjrUe5DN96j/1Y094VML
	a8cIwuG65LasUVAHiVzbMR58GYdu4gMJeBsQ7f1BWVfn+1e8VtzrSXdL7r4tTLdxUjlmqY1j9II6/
	fC7m9V2B4n42mfZX3+1nGPdIGTTv5i+jd0EloF1JVijk9SbiFTiZbWViN2Ky5E+bB7PvkKVFOFyx9
	4gZNjMUmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVZOQ-0001sM-R0; Thu, 22 Oct 2020 12:08:31 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVZOM-0001r0-GC
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2020 12:08:27 +0000
Received: by mail-qt1-x843.google.com with SMTP id p88so782435qtd.12
 for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2020 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oS6+CP1ltilZOm3pmrV9A+jmYbWMo1I1JmCFycZs1zk=;
 b=SeMf5i/aS2x9E5JTzW3LT5KVl9x8FyRNR1mSVpUsz3xKT5ADHkCb0oEd7k7DUAdW7c
 yIeeS22Q7HZ1yISUQzxNrBG+F/7rXFXUB2clr8+fhVX1Y0ceTHVqJmNpift8KynZzVXI
 8ryJEoTDOWhZUq4VoGhtkw33YprrTupX4SfroqeYAMTeY6D8s5ODDW8as1yI9+OqxDNy
 BIILIT0mXBMO3YhyZHjdGSSeU4GmsrK+JVscmJSF/4MZTx3vOmTZ6dqdY9NfBkX80aBv
 8V0W2dRQmX6g1KswyVmkSUU5hA5lH42JMGvDHwwaYskUZ0y0+F1XS8JKG0+VMmQU/zxv
 zd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oS6+CP1ltilZOm3pmrV9A+jmYbWMo1I1JmCFycZs1zk=;
 b=irX31RKXqXDI0/RMWSzvRPm3Lf/gLSRgHOT9nO2iM07uXjMKeKCA8Y2IQbk2iK+8+g
 OvcBkiaPaKaZycvPm/8V0BTOnaWz21D2CXz0nQ9oVSpuE5qsC3tl8V749yRT5DdoiRH/
 Ros/sm4oUdeNDYQ0bnmePu+CZGC2eVCA92NsZklsFxalORtglNCCo5UQ0bPMihkFZ8ex
 myWLWhl5/uQOkb+Wf6M2c7aWwLrc5VMRizmMV/VNN2NVOIVUNoo+ptUIKHyIsmDyRJzi
 J7Uy2XJPkICGBxPK1Ew9P9sYTZkLnuKOh1WzzCRnI92bS51kE8+Dc9kaZo8R7g9IM1rR
 xUNA==
X-Gm-Message-State: AOAM532oAFxdCKTsEJqsK5SCPtNoBAoz1hsoEyN1m+Y5BBXsQ17Z6QVJ
 rmHj9+RIGr7vjw8Lw+wRQIdhrWkWqZkCDHaa/HKIaQ==
X-Google-Smtp-Source: ABdhPJwae4PbdaLza2pUQScdJt3BcKYNVW6EIEDp6C+VH8PT5g6A2k1eYi21e5cMTqW0LbvJxRs0X1kQkhPUYyTRLLg=
X-Received: by 2002:ac8:6982:: with SMTP id o2mr1571445qtq.193.1603368504565; 
 Thu, 22 Oct 2020 05:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
 <20200930163714.12879-3-daniel.gutson@eclypsium.com>
 <82bb95bd-988f-3cc2-40f7-8ebfd20b09d9@infradead.org>
In-Reply-To: <82bb95bd-988f-3cc2-40f7-8ebfd20b09d9@infradead.org>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Thu, 22 Oct 2020 09:08:13 -0300
Message-ID: <CAFmMkTFs-eOhyofpzEUusbx01HCbNmke6nct3HDqD3dsAmT_Nw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Platform integrity information in sysfs (version 9)
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_080826_824458_80A06637 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Oct 4, 2020 at 1:01 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/30/20 9:37 AM, Daniel Gutson wrote:
> > diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> > index 5c0e0ec2e6d1..e7eaef506fc2 100644
> > --- a/drivers/mtd/spi-nor/controllers/Kconfig
> > +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> > @@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
> >
> >  config SPI_INTEL_SPI
> >       tristate
> > +     depends on PLATFORM_INTEGRITY_DATA
>
> So SPI_INTEL_SPI_PCI selects SPI_INTEL_SPI:
>
> config SPI_INTEL_SPI_PCI
>         tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
>         depends on X86 && PCI
>         select SPI_INTEL_SPI
>
> without checking that PLATFORM_INTEGRITY_DATA is set/enabled.
>
> "select" does not follow any kconfig dependency chains, so when
> PLATFORM_INTEGRITY_DATA is not enabled, this should be causing
> a kconfig warning, which is not OK.

Since now SPI_INTEL_SPI_PCI can be enabled without PLATFORM_INTEGRITY_DATA
(thanks to the #ifdefs), I think I'll just remove the 'depends' and
will leave this as it was.

>
>
> --
> ~Randy
>


-- 


Daniel Gutson
Engineering Director
Eclypsium, Inc.


Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
