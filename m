Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO8vX-00071N-4C
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 16:56:16 +0000
Date: Thu, 13 Mar 2014 09:55:48 -0700
From: Tony Lindgren <tony@atomide.com>
To: Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for beaglebone
 NAND cape
Message-ID: <20140313165547.GB5576@atomide.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EAB2CF1@DBDE04.ent.ti.com>
 <CAGo_u6rvUqa-7afTFzBahDJuyVkXAj5J2LL8tQRjZuf8_xWXWA@mail.gmail.com>
 <CAOCHtYhqZoCF13e1YjBiWPufDEmVotL3chO9ZUtivWbVTWVfiQ@mail.gmail.com>
 <20140312192850.GF1996@atomide.com> <5320C8B5.601@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2E95@DBDE04.ent.ti.com>
 <20140312215337.GA5735@kahuna>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F96@DBDE04.ent.ti.com>
 <5321AC92.2090307@ti.com>
 <CAOCHtYhcJZ711XaJhBAPNSoHH-dK_tH8ZgB-AHZ86POXas1OfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCHtYhcJZ711XaJhBAPNSoHH-dK_tH8ZgB-AHZ86POXas1OfQ@mail.gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Robert Nelson <robertcnelson@gmail.com> [140313 06:33]:
> On Thu, Mar 13, 2014 at 8:03 AM, Nishanth Menon <nm@ti.com> wrote:
> > On 03/13/2014 01:19 AM, Gupta, Pekon wrote:
> > [..]
> >>> diff --git a/arch/arm/boot/dts/am335x-bone-memory-cape.dts b/arch/arm/boot/dts/am335x-bone-memory-cape.dts
> >>> new file mode 100644
> >>> index 0000000..7ab088d
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/am335x-bone-memory-cape.dts
> >>>
> >> From discussions, option I could think are..
> >>
> >> (a) NAND cape node added in both 'am335x-bone.dts' and
> >>    'am335x-boneblack.dts' but "disabled" by default.

The capes can live their own revision cycle from beaglebones,
so separate .dts files for each cape are probably better.

> >> (b) NAND cape node in new '.dts' file (as mentioned above), and generate
> >>    a separate blob individual for cape.

(b.2) NAND cape node in new '.dts' file but devices set to disabled
      by default. Included into am335x-*bone*.dts files. The found
      and configured cape devices set back to enabled by u-boot by
      modifying the .dtb by using the existing ft_board_setup() and
      fdt_find_and_setprop() in u-boot.

> >> (c) NAND cape node in existing 'am335x-bone-common.dtsi', "disabled"
> >>    by default. But there is no guarantee that future boards remain
> >>    compatible and same 'common_xx.dtsi' can be reused later.

This also has an issue of different revision cycle between beaglebones
and the capes.

> >> I'll wait for Tony/Benoit-C. to decide on what suits them, as they are the
> >> ones who have to maintain all these. Tony ?
> >>
> >
> > Key for us is that we'd have to live with what ever we introduce in
> > the interest of backward dtb compatibility. both (a) and (c) requires
> > hand modification by user of nand cape - considering this might be the
> > strategy for "most common capes", we might end up with confusing
> > entries that in many cases will require additional documentation
> > example: option a, c: consider both audio cape (which needs hdmi
> > disabled) and nand cape (which needs mmc2 disabled) - how'd the user
> > know which entries to enable/disable for the user of the cape -
> > documentation needed and potentially user error prone implementation
> > as well.
> >
> > There is as well a option (d) where we wait for FDT overlay to mature,
> > write up a resource manager and support all level capes.

Yeah option (d) and having the capes hotpluggable is probably the best
way to go in the long run.  Meanwhile, I'd suggest researching if
option (b.2) above is doable for enabling some capes.
 
> (b) is the direction i'm currently trying to transition the
> beagleboard.org community till (d) actually shows any life/hope again.
> 
> example:
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.13/patches/static-capes
> 
> I really like Nishanth's simpler version he posted, so I'll be
> converting mine to that style later today.

Yeah except most of these capes should be included into the
am335x-*bone*.dts files as in (b.2) above. All the internal omap
devices are still there on the SoC even if not wired to the cape.
The GPMC devices may cause more of an issue as we cannot just override
the chip select wiring by modifying the .dtb. But for the internal
devices modifying the .dtb to enable some of them might be doable.
 
> Also with u-boot v2014.04-rcX we now have "test -e" (exist support) so
> we can actively check for the presence of <board>-<cape>.dtb and
> safely fall back to <board>.dtb if it didn't actually exist.  The only
> requirement is the end user specify the <cape> as a variable in
> uEnv.txt
> 
> https://github.com/RobertCNelson/Bootloader-Builder/blob/master/patches/v2014.04-rc2/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch#L76

That's great!

Regards,

Tony
