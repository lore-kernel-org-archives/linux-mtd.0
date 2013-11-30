Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmpOg-0004vc-83
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2013 18:36:06 +0000
Received: by mail-pb0-f50.google.com with SMTP id rr13so16112266pbb.23
 for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2013 10:35:44 -0800 (PST)
Date: Sat, 30 Nov 2013 10:35:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpio: Add DT property to automatically
 determine bus width
Message-ID: <20131130183537.GF29397@norris.computersforpeace.net>
References: <1384343884-29622-1-git-send-email-shc_work@mail.ru>
 <20131127012158.GR9468@ld-irv-0074.broadcom.com>
 <20131127012338.GS9468@ld-irv-0074.broadcom.com>
 <20131129122551.GC2815@localhost>
 <20131130091556.GD29397@norris.computersforpeace.net>
 <20131130111721.GA2330@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131130111721.GA2330@localhost>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Eric Miao <eric.y.miao@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 30, 2013 at 08:17:22AM -0300, Ezequiel Garcia wrote:
> Brian,
> 
> On Sat, Nov 30, 2013 at 01:15:56AM -0800, Brian Norris wrote:
> > 
> > > Can anyone help me understand if there's *any* valid use case where we
> > > want to specify a-priori the bus width, considering it's completely
> > > discoverable at run-time?
> > 
> > I think the primary use case should be to reflect a limitation in the
> > hardware (besides just the flash chip). It can mean that the controller
> > itself only supports one bus width, or that the board is only wired up
> > for x8, for instance.
> > 
> 
> What do you mean by "reflect a limitation" of the hardware?

Read the following sentence.

Limitations: the hardware could be hooked up only for 8 data lines; or
the controller could support only one particular bus width. Either of
these can only be reflected in device tree.

> Maybe I'm not really following you, but it sounds as you're mixing up
> the NAND device buswidth and the memory controller buswidth. At least
> I consider them as two different parameters for two different pieces
> of hardware.

Yes, maybe I'm combining two properties, but we only have one way to
express this for now. This should be resolved.

> Consider OMAP, just as an example. We currently have two DT properties:
> 
> 1. nand-bus-width: not related to OMAP but kernel wide. It's supposed
>    to specify the devices buswidth.
> 
> 2. gpmc,device-width: It specifies how the controller should be
>    configured (it doesn't really specify hardware, but configuration,
>    sadly).
> 
> I now realise maybe this piece of DT binding is not a good example of DT.
> 
> Anyway, once again: Why would we need to set "nand-bus-width" to specify
> the flash device width given we can discover that as soon as the NAND
> is detected?

You've asked two different questions.

Question 1:
  Can anyone help me understand if there's *any* valid use case where we
  want to specify a-priori the bus width, considering it's completely
  discoverable at run-time?

Question 2:
  Why would we need to set "nand-bus-width" to specify the flash device
  width given we can discover that as soon as the NAND is detected?

The first question is about the NAND core in general, where I strongly
believe that a NAND driver has the right to specify "a-priori" what its
supported bus width(s) is/are.

The second question is specifically about the nand-bus-width DT
property. I think the property is somewhat broken, since it describes
the flash chip and not exactly the board wiring or controller
capabilities.

So to keep this thread focused on Alexander's patch:

+- gpio-control-nand,bank-width-auto : Device bus width is determined
+  automatically by CFI/ONFI information from chip if "bank-width"
+  parameter is omitted (Boolean).

This description fits squarely into describing the flash chip (not the
board wiring or controller limitations), and so it seems superfluous (in
agreement with Ezequiel here, right?). But we have this property already
for GPIO:

- bank-width : Width (in bytes) of the device.  If not present, the width
  defaults to 1 byte.

This seems to describe the flash chip as well, and paints us into a
corner where we can't determine if it was used because of
board/controller limitations or because of the flash chip. We can get
out of this through the use of an additional property of some kind.

I think to describe the controller/board properly, we probably need
something like this for some drivers:

  <manufacturer>,supported-bus-widths = <LIST>;

Where <LIST> can be one or more of 8 or 16, and it reflects any hardware
limitations outside of the flash chip (e.g., # of data lines; controller
limitations). And if <manufacturer>,supported-bus-widths is missing,
then we default to say that the hardware *only* supports the bus width
found in "nand-bus-width"/"bank-width"/similar. So we have this:

[I]
  <manufacturer>,supported-bus-widths = <8>, <16>;
  nand-bus-width = <don't care>;

  ===> This means the NAND driver could allow auto-detect of the flash
       buswidth. The "nand-bus-width" (or "bank-width") can actually be
       "deprecated" here.

[II]
  <manufacturer>,supported-bus-widths = <X>; // X = 8 or 16
  nand-bus-width = <Y>; // Y = 8 or 16 or missing

  ===> This means the NAND driver should only configure bus width to X.
       If Y is missing, we're OK. If X != Y, then the device tree is
       malformed.

[III]
  <manufacturer>,supported-bus-widths is missing;
  nand-bus-width = <Y>; // Y = 8 or 16 or missing

  ===> This means the NAND driver should only configure bus width to Y.

This covers the most general DT description, I think. But in the GPIO
case, the "controller" is so dead simple that we can probably represent
the "supported-bus-widths" simply through the # of connected data lines:

  gpio,data-lines = <X>;

where X = 8 or 16. If X=16, that means it can support either x8 or x16
(and hence, auto-detection in the NAND core), but if X=8, we only
support x8 and no autodetection.

Brian
