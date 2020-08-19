Return-Path: <SRS0=Mr3t=B5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4574C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 07:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC8A20738
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 07:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLrQfLJs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bq90YO/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC8A20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34H5Ev6ob0BYxPQjm+WQyFQKEjCnfOKd5AFtuq6xRRE=; b=aLrQfLJskpeZ30RnJwYLoxIxs
	c+aSoJ9qROMfPigFEc77HEdv+KRvb+CMZl0sqAktFun5e8QV7p0TOuUZ575Qh5c5F3/mbQ9rt+Hp6
	FvWynFuG6Kw1Ap6yqrx38TSKmBRJbha5XHBYIqmq7VN/YRKjw63IYtY+KzkCpIBtmlOwTDfKk/P/J
	4ACD76JdY8uUHSdFGSIcGqBWel0M3gYyVRuWmkEJ04vovMh4BMnGyFHa0OsiUSaITnJmAcFWg6zlj
	oTkUaNT5XbMkNT/dQ5B7AwrxgIxvpBi8lQpN0j6l36PfPQ5pYVbDMV0cp6ELNoRjIyhY8QqwzAYS1
	cpFsGOVFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8IKN-0005zS-Sm; Wed, 19 Aug 2020 07:16:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8IKM-0005k7-0s
 for linux-mtd@merlin.infradead.org; Wed, 19 Aug 2020 07:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Hl79WQijRnk5MxvskvsRFtdA/DX4LrNyjcXz80eUV/8=; b=Bq90YO/NVGLReCxPGvmrnwfKBM
 52ie+9HGmtvBeLjFiaajfMIBSQs8H+sNJBBwk7szPxhXTgJpGyDx/5AjxgKikyzJX88NqI6DYivSS
 XzW/ChO8hQV2cSGkwJq34uz2mtMmEIhXtW3TwyAVUkpP88ExFZiQVSVMm34QBgqqTNP73Wte9vKKL
 SLvMPR1AKsz+TDPA+2wdLYt5cgfzbB2ktOREIHHHoefZyqn/f97FNathRwm0in0PlVUf/1myjSNZ9
 kWOClAVczKSHfyPssdHNMLWWOlHTXB65NWz+qVvO6FXvEJ9Zt31paxbA7lbgvDOjHRrPcp/PJE+34
 1A1rGDEw==;
Received: from mga11.intel.com ([192.55.52.93])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I2Q-0000EV-S2
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2020 06:58:00 +0000
IronPort-SDR: NOw+/abQbpjHEHeAiP6LIEjezVe0J0UqHSxjblqylEZv5O2ULvK/lG+NQ+u8j8QTw6A2E5FZ0u
 eZtmAGKo2ZfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="152678672"
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="152678672"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 23:57:26 -0700
IronPort-SDR: mpXpKRmaLdaHbRyBhNIUX8gOdfa2tGzXchNdovhuh6Zk9QzF9XL14EXa4z+iNhNamAMOSSCJ7u
 BbEn9v8VddRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,330,1592895600"; d="scan'208";a="400736106"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 18 Aug 2020 23:57:22 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 19 Aug 2020 09:57:21 +0300
Date: Wed, 19 Aug 2020 09:57:21 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI
 flash chip writable
Message-ID: <20200819065721.GA1375436@lahna.fi.intel.com>
References: <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_075737_468619_1D79BF80 
X-CRM114-Status: GOOD (  28.96  )
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
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 12:55:59PM -0300, Daniel Gutson wrote:
> > If you care about other (malicious) code writing to the driver, please explain
> > what the specific attack scenario is that you are worried about, and
> > why you think
> > this is not sufficient. What code would be able to write to the device
> > if not the
> > device driver itself?
> 
> Maybe Mika can answer this better, but what I'm trying to do is to
> limit the possibility of
> damage, as explained in the Kconfig:
> "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> "Say N here unless you know what you are doing. Overwriting the
>   SPI flash may render the system unbootable."

Right, the PCI part of the driver unconditionally (and wrongly) tried to
set the chip writeable.

What this whole thing tries to protect is that the user does not
accidentally write to the flash chip. It contains BIOS and other
important firmware so touching it (if it is not locked in the BIOS side)
may potentially brick the system. That's why we also require that
command line parameter so the user who knows what he or she is doing can
enable it for writing.

Actually thinking about this bit more, to make PCI and the platform
parts consistent we can make the "writeable" control this for the PCI
part as well. So what if we add a callback to struct intel_spi_boardinfo
that the PCI driver populates and then the "core" driver uses to enable
writing when "writeable" is set to 1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
