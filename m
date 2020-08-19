Return-Path: <SRS0=Mr3t=B5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AE6C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 09:12:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AF520738
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 09:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6gfN2ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AF520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6JIkwDg6rt2KtByTlN5cjDNepiH5uIqrRa4zuIHD+Rg=; b=g6gfN2iiybllGTb/v3bqdVuzF
	gqwjjyffEbTQE+RPxrXx95ifUeb7GkgY6B2951zqNXHxmcpo3RA/81YSwwajLJvJffuE1V1CR1j/i
	Cp8QP/4Zm0Srtk3usBpnuj8p+aRhxxb6Ry6kum5TZ130vdrvIp3oX3iE5NPxpr1rMC6J22tzm93Cl
	UBhCTbLaaMzTjgocfHKNTHgixAK+OJjuk+sCdM9+4z5+m47G9xVMTrK3D5+jm8YyhXdV52VVLwUqC
	zRbIZJzeqI4cF3Imrvom0hrMBqPavvyEinip5paj54z6G0LqVDOZ362EYln14kqDiXZP4Pda68rwG
	6sn8apg8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8K84-0001jc-8m; Wed, 19 Aug 2020 09:11:32 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8K81-0001iA-M9
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2020 09:11:30 +0000
IronPort-SDR: V1knm6HlsAncUwm+waqgn4gVZ+N4fnfdNk7q7rjGuvvy2hE0C8L5QIOX+KdHc4vujes2qJN8WW
 8VQeUbGN5sCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239906124"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="239906124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 02:11:27 -0700
IronPort-SDR: ENF7eXhSGo6i+2qQww+BDD1amp8qQ1Y8+ja5GK/SWuR3FLvne13EtcQ39J2VweT2UGLDBlmEYu
 LIneF3ufd3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="400770822"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 19 Aug 2020 02:11:24 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 19 Aug 2020 12:11:23 +0300
Date: Wed, 19 Aug 2020 12:11:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200819091123.GE1375436@lahna.fi.intel.com>
References: <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_051129_895063_A1A19429 
X-CRM114-Status: GOOD (  36.61  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 10:38:24AM +0200, Arnd Bergmann wrote:
> On Wed, Aug 19, 2020 at 8:57 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > On Tue, Aug 18, 2020 at 12:55:59PM -0300, Daniel Gutson wrote:
> > > > If you care about other (malicious) code writing to the driver, please explain
> > > > what the specific attack scenario is that you are worried about, and
> > > > why you think
> > > > this is not sufficient. What code would be able to write to the device
> > > > if not the
> > > > device driver itself?
> > >
> > > Maybe Mika can answer this better, but what I'm trying to do is to
> > > limit the possibility of
> > > damage, as explained in the Kconfig:
> > > "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > > "Say N here unless you know what you are doing. Overwriting the
> > >   SPI flash may render the system unbootable."
> >
> > Right, the PCI part of the driver unconditionally (and wrongly) tried to
> > set the chip writeable.
> >
> > What this whole thing tries to protect is that the user does not
> > accidentally write to the flash chip. It contains BIOS and other
> > important firmware so touching it (if it is not locked in the BIOS side)
> > may potentially brick the system. That's why we also require that
> > command line parameter so the user who knows what he or she is doing can
> > enable it for writing.
> 
> The same thing can happen with the platform driver if you load it
> once with 'writeable=1' and then unload, leaving the chip in writeable
> state. If you load it a second time without the module parameter, it
> will be in the same state as the PCI driver: the hardware bit allows
> writing, but the MTD layer prevents writes from being issued to the
> device.

Right.

> > Actually thinking about this bit more, to make PCI and the platform
> > parts consistent we can make the "writeable" control this for the PCI
> > part as well. So what if we add a callback to struct intel_spi_boardinfo
> > that the PCI driver populates and then the "core" driver uses to enable
> > writing when "writeable" is set to 1.
> 
> If you are really worried about the write protection being bypassed by
> a different driver or code injection, the best way would seem to be to
> only enable writing in the mtd write callback and disable it immediately
> after the write is complete. I still don't see why this hardware would
> be more susceptible to this kind of attack than other drivers though,
> as it already has the safeguard against writing through the MTD layer
> without the module parameter.

Hmm, is there already a mechanism at the MTD level to prevent writes? If
that's the case then sure we can use that instead.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
