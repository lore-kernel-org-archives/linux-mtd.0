Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvhDN-0002x2-QH
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 07:17:54 +0000
Received: by paza2 with SMTP id a2so3415347paz.3
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 00:17:31 -0700 (PDT)
Date: Fri, 22 May 2015 00:17:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
Message-ID: <20150522071727.GD23718@brian-ubuntu>
References: <cover.1430403750.git.hramrach@gmail.com>
 <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
 <20150520233835.GX11598@ld-irv-0074>
 <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
 <20150521102802.GS21577@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150521102802.GS21577@sirena.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Michal Suchanek <hramrach@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "grmoore@altera.com" <grmoore@altera.com>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 devicetree <devicetree@vger.kernel.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 21, 2015 at 11:28:02AM +0100, Mark Brown wrote:
> On Thu, May 21, 2015 at 10:39:13AM +0200, Michal Suchanek wrote:
> > On 21 May 2015 at 01:38, Brian Norris <computersforpeace@gmail.com> wrote:
> 
> Why is this thread about SPI error handling CCed to quite so many
> people?

I can't really speak for the original patch author, who created the CC
list. I added you for comment on the SPI API (thanks BTW).

This is part of a series that included an ill-conceived DT binding for
recording a "max transfer length" property in the flash node. That's one
step that easily blows up the CC list for the series, as there are 5 DT
maintainers and a mailing list. Others are contributors to the m25p80 /
spi-nor drivers. (All in all, you can probably trace this back to
scripts/get_maintainer.pl.)

> > >> Check the amount of data actually written by the driver.
> 
> > > I'm not sure if we should just reactively use the retlen, or if we
> > > should be communicating such a limitation via the SPI API. Thoughts?
> 
> > Is there any driver that would break if the SPI master truncated
> > writes when the message is too long rather than returning an error an
> > refusing the transfer?
> 
> Any such driver is buggy, the actual length transferred has always been
> a part of the SPI API.

OK, so m25p80.c currently checks the retlen
(spi_message::actual_length), but it doesn't actually handle it well if
the SPI master can't write a full page-size chunk in one go. It looks
like we'd leave holes in the programmed data right now.

So that qualifies as buggy, and that's part of what Michal is trying to
fix, I think. Admittedly, as he's using an out-of-tree driver, I'm not
sure I know exactly what failure modes he is hitting yet.

> We should probably expose limitations so clients
> can query in advance (we don't at the minute) but it'd be a while before
> clients could rely on that information being useful and it's still
> possible things can be truncated by error.

That might help in the long run. In this case, I think we might be able
to get by (for a properly-functioning SPI driver with a limited transfer
size) with the current API, and handling the 'return length < message
length' case better.

BTW, one extra note for Michal regarding your SPI controller/driver
transfer length limitation: you would do well to try as much as possible
to allow full NOR pages to be programmed in one SPINOR_OP_PP sequence. I
know of some SPI NOR that, though they are byte addressable, actually
have opaque internal ECC which is encoded on page boundaries, so you
get better flash lifetime if you program on page boundaries, rather than
on whatever smaller chunk size your SPI driver supports. So that might
require a little more work on your SPI driver.

Brian
