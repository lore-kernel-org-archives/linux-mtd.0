Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6fvJ-0003en-7I
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 11:59:34 +0000
Date: Tue, 6 Aug 2013 08:59:13 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Jens Renner (EFE)" <renner@efe-gmbh.de>
Subject: Re: [PATCH v2] mtd: Add LED trigger support "mtd-disk" to indicate
 activity
Message-ID: <20130806115912.GA2862@localhost>
References: <51AB6A69.9080004@efe-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51AB6A69.9080004@efe-gmbh.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jens,

On Sun, Jun 02, 2013 at 05:53:13PM +0200, Jens Renner (EFE) wrote:
> Register a MTD LED trigger called "mtd-disk" (similar to the "ide-disk" and
> "nand-disk" triggers) to indicate read / write / erase acitivity. Panic writes
> and OOB reads / writes are not covered as of now. The trigger is global as it
> does not discriminate between individual devices or partitions.
> The patch uses the generic LED trigger interface which can be configured via
> SYSFS (/sys/class/leds/<name>/trigger) or DTS file entry for "gpio-leds"
> (linux,default-trigger = "mtd-disk").
> 
> Since the MTD framework is independant of the memory devices, driver-specific
> LED triggers like "nand-disk" will indicate a subset of all MTD activity.
> 
> Tested on Microblaze architecture with Micron N25Q256A serial flash.
> Added a bit of documentation (including other new LED triggers).
> 

Thanks for doing this and sorry for such late feedback.
For some reason I thought this would be already merged,
and now looking at it in detail I have some comments about it.

I'm Ccing Brian, David and Artem just to make sure I don't say something
foolish.

I think you should re-work this entirely and add this trigger as a
selectable module just as the rest of the led triggers do it.
See drivers/led/trigger/ for examples.

In addition you could move nand-disk over there as well.

Having all related code in a single location is always better than
spreading all over the place: you get to hide implementation details
easier, and you can spot common code or bugs by comparison.

What do you think?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
