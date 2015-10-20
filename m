Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoUEN-0002k4-4q
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 10:33:25 +0000
Date: Tue, 20 Oct 2015 12:32:14 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roy Spliet <r.spliet@ultimaker.com>, Brian Norris
 <computersforpeace@gmail.com>
Cc: Linux MTD Mailinglist <linux-mtd@lists.infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
 Baruch Siach <baruch@tkos.co.il>, Rafal Milecki <zajec5@gmail.com>
Subject: Re: [RFC] Support custom timings for NAND chips
Message-ID: <20151020123214.1aa5c399@bbrezillon>
In-Reply-To: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
References: <1434447904-31748-1-git-send-email-r.spliet@ultimaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roy,

Sorry for the latency.

On Tue, 16 Jun 2015 11:45:01 +0200
Roy Spliet <r.spliet@ultimaker.com> wrote:

> Hello,
> 
> Following is a fairly simple set of three patches that both implement and
> demonstrate the use of custom timings for chip. This follows from the
> requirement to support the Hynix H27UBG8T2BTR-BC, as shipped by Olimex on
> their Allwinner-based ARM-boards.
> 
> I motivate my chosen approach as follows:
> 1) Requirement. The NAND chip is being used in the wild, and using the only
>    supported ONFI timing (0) is significantly degrading performance.
> 2) Simplicity. The three patches are fairly straightforward, and do what they
>    should do without compromise. Alternative approaches like sticking timings
>    in the DT makes it more difficult for distribution to ship universal
>    kernels and DTBs, because it's a NAND chip property and not a board
>    property.

AFAICT, it's even worst than that. I tried to boot this Olimex board
you are talking about, and it seems using ONFI timing mode 0 makes the
NAND completely unreliable. I'm not sure exactly why this happens but
here is what I suspect: the NAND is supposed to work in EDO mode, but
EDO is only active when tRC is lower than 30ns, which is not the case in
mode 0. ITOH, we cannot switch to mode 4 (which, according to the NAND
timings described in the datasheet, is the most appropriate) because
tADL is not met in this mode (tADL = 200ns, while mode 4 expect 70ns).

> 
> I send this out now (asap), because the only legacy that requires a change is
> sunxi-nand. The longer we wait, the harder it gets. Don't let that stop you
> from doing a proper review job! :-)
> Comments? Ideas?

Hm, maybe we should store nand timings directly in the nand_chip
struct, and let the core code fill it with ONFI values (when ONFI is
available) so that controller drivers do not have to do the ONFI mode
to timing struct dance.

For NAND specific timings like the ones you need for the
H27UBG8T2BTR-BC chip, maybe we could keep them in a vendor specific file
instead of defining them in the nand_ids.c file.
Also, I'm not sure whether we should define them with a new struct
nand_sdr_timings instance, or just provide a function adjusting some
fields based on the provided default ONFI timing mode.

Brian, any suggestion?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
