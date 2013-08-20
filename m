Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBcyK-0000hx-MX
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 03:51:11 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so6100164pdj.32
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 20:50:47 -0700 (PDT)
Date: Mon, 19 Aug 2013 20:50:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2] mtd: Add LED trigger support "mtd-disk" to indicate
 activity
Message-ID: <20130820035043.GB28421@norris.computersforpeace.net>
References: <51AB6A69.9080004@efe-gmbh.de>
 <20130806115912.GA2862@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130806115912.GA2862@localhost>
Cc: "Jens Renner \(EFE\)" <renner@efe-gmbh.de>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ LED mailing list

On Tue, Aug 06, 2013 at 08:59:13AM -0300, Ezequiel Garcia wrote:
> On Sun, Jun 02, 2013 at 05:53:13PM +0200, Jens Renner (EFE) wrote:
> > Register a MTD LED trigger called "mtd-disk" (similar to the "ide-disk" and
> > "nand-disk" triggers) to indicate read / write / erase acitivity. Panic writes
> > and OOB reads / writes are not covered as of now. The trigger is global as it
> > does not discriminate between individual devices or partitions.
> > The patch uses the generic LED trigger interface which can be configured via
> > SYSFS (/sys/class/leds/<name>/trigger) or DTS file entry for "gpio-leds"
> > (linux,default-trigger = "mtd-disk").
> > 
> > Since the MTD framework is independant of the memory devices, driver-specific
> > LED triggers like "nand-disk" will indicate a subset of all MTD activity.
> > 
> > Tested on Microblaze architecture with Micron N25Q256A serial flash.
> > Added a bit of documentation (including other new LED triggers).
> 
> Thanks for doing this and sorry for such late feedback.
> For some reason I thought this would be already merged,
> and now looking at it in detail I have some comments about it.
> 
> I'm Ccing Brian, David and Artem just to make sure I don't say something
> foolish.
> 
> I think you should re-work this entirely and add this trigger as a
> selectable module just as the rest of the led triggers do it.
> See drivers/led/trigger/ for examples.
> 
> In addition you could move nand-disk over there as well.

In case this is waiting on another opinion: I agree. And it doesn't make
sense to make calls to LED function on every MTD read/write even if we
don't have LED support compiled in. The existing LED triggers in
drivers/leds/trigger don't add any overhead when they are not enabled in
Kconfig.

Brian
