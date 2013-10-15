Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWBly-0005oC-S2
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 21:03:23 +0000
Received: by mail-ie0-f180.google.com with SMTP id e14so11359314iej.11
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2013 14:03:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131015205254.GX2443@sirena.org.uk>
References: <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com>
 <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <20131015205254.GX2443@sirena.org.uk>
Date: Tue, 15 Oct 2013 14:03:01 -0700
Message-ID: <CA+7tXijF8VTsA3Mk3j8Qe7r0nqr+Xri6=GDfEZGH74Doup5=eA@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
From: Trent Piepho <tpiepho@gmail.com>
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Peter Korsgaard <peter@korsgaard.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 1:52 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Oct 15, 2013 at 06:33:23PM +0000, Gupta, Pekon wrote:
>
>> Therefore early suggestions were to make 'MM_MODE' as default
>> (if device enables it via DT). This means:
>> (1) switch to 'SPI_MODE' _only_ when required for commands like
>>  mtd_erase, etc. and switch back to 'MM_MODE' when done.
>> (2) And keep your controller clocks on.
>
> This sounds like a policy decision, I don't see any reason for it to be
> in DT.  What works well with one application stack may not be the best
> choice for another and future developments may change what's most
> sensible for a given system, it shouldn't be fixed in the DT.

I could see the driver using the transfer size to decide, memory
mapped or SPI with DMA.  Small transfers via memory mapped access and
larger would use DMA.  The spi-mxs driver does this to decide PIO or
DMA.  The threshold size is hard coded in the driver.  If you wanted
to be able to change it, I would think a sysfs attribute would be the
way to do that.

It does get tricky when you're dealing with flash roms, as people
often want to boot from those really fast, so you want the kernel to
know how to use them in the fastest way before it boots as opposed to
after booting when it's obviously too late to configure the kernel to
boot faster.
