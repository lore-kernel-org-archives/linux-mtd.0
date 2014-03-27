Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WT7Yb-0000zs-2v
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 10:29:10 +0000
Received: by mail-wg0-f41.google.com with SMTP id n12so2369374wgh.24
 for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2014 03:28:44 -0700 (PDT)
Date: Thu, 27 Mar 2014 10:28:35 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC 00/47] mtd: nand: Add new driver supporting ST's BCH h/w
Message-ID: <20140327102835.GA17779@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <20140325125050.GB665@arch.cereza> <20140325131139.GB24823@lee--X1>
 <20140325220045.GA12185@arch.cereza>
 <20140326072805.GB31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140326072805.GB31517@norris-Latitude-E6410>
Cc: angus.clark@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > After taking a quick glance at the whole driver I noticed you have something
> > strange going on. AFAIK, the typical NAND driver probe() should be one of
> > these two:
> > 
> > * Call nand_scan() which calls nand_scan_ident() + nand_scan_tail().
> > 
> > * Call nand_scan_ident() to identify the NAND device geometry, do some
> >   driver specific initialization, fill some hooks, and finally call
> >   nand_scan_tail() to complete the initialization.
> > 
> > You driver call nand_scan_ident() and then does some bad block scan, and
> > fills some callbacks on its own, but never calls nand_scan_tail().
> > 
> > The call to nand_scan_tail() would remove the need to export those NAND
> > core functions, and remove the need to scan and print the bad blocks.
> > I don't know if you have a real reason for not doing it this way, or
> > maybe it's the way this driver was originally written.
> > 
> > Care to review this and re-spin the driver? You'll have a more nicer
> > driver, and more framework-compliant.
> 
> A hearty +1 to this. You are avoiding much of the core of the NAND
> framework by avoiding the nand_chip callbacks and nand_scan_tail(), and
> by reimplementing the BBT. I will have to NAK to some of the patches
> that EXPORT the nand_base private core (e.g., nand_get_device()), and I
> will most likely NAK the custom BBT implementation (please improve
> nand_bbt.c as needed).

This is a good catch. I will attempt to reimplement the driver's
initialisation steps to utilise more of the core infrastructure in an
attempt to mitigate the requirement for exportation of private
routines.

The BBT requirements are somewhere more complex. To provide you with
the complete picture, a little knowledge of driver history is
required. When it was initially created the MTD core only supported
OOB BBTs, but the ST BCH Controller doesn't support OOB access, so
Angus wrote his on In-Band (IB) implementation. Unfortunately the IB
support which _is_ now present in the kernel doesn't match the
internal implementation. Normally this wouldn't be an issue in itself,
but ST's boot-stack and tooling (Primary Bootloader, U-Boot, various
Programmers, etc) are aware of the internal IB BTT and utilise it
in varying ways. Shifting over to the Mainline version in
one-foul-swoop _will_ cause lots of pain and will probably result in
the disownership of driver we're trying to Mainline today. Naturally
I'm keen to avoid this.

> > Also, if you plan to target v3.16 on this, I'd suggest that you pick
> > some pack of features and submit those first, reducing the amount of code
> > to be reviewed. For instance, you may choose to leave some of the ECC bits
> > aside for now.
> > 
> > It's just a suggestion to get at least some of the code merged quicker,
> > don't take me too seriously on this.
> 
> That's a possible approach if it still leaves your driver functional.
> But I wouldn't trim the driver too much just for sake of reviewing.
> 
> BTW, why do you call this driver stm_nand_bch? BCH is a particular type
> of ECC algorithm, not unique at all to ST's hardware. Can you drop the
> _bch and make it just stm_nand?

>From my knowledge (Angus feel free to jump in anywhere you like), ST
have 4 NAND drivers. This is just one of them. The others are EMI,
Flex and Advanced Flex (AFM). This particular controller is described
as the BCH throughout ST's documentation. Much of this documentation is
available freely online [1].

> Also, you might want to change the
> namespacing on some of your functions; for instance, I don't think you
> can own the name bch_write(). Possibly prefix things with stm_* or
> stm_nand_* where reasonable.

Yes, absolutely.

[1] http://www.stlinux.com/howto/NAND

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
