Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JckBu-00067N-QH
	for linux-mtd@lists.infradead.org; Fri, 21 Mar 2008 16:34:04 +0000
Received: by fg-out-1718.google.com with SMTP id 22so1382065fge.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Mar 2008 09:33:58 -0700 (PDT)
Message-ID: <74d0deb30803210933u1d3ca18endcd942496409de28@mail.gmail.com>
Date: Fri, 21 Mar 2008 17:33:57 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Fwd: [PATCH 5/9] magician: enable flash VPP GPIO and build in MTD,
	physmap-flash and JFFS2
In-Reply-To: <74d0deb30803210448l49d2eea8ladd95766c47ba820@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1205785071.11350.39.camel@localhost.localdomain>
	<20080320210120.GI16166@flint.arm.linux.org.uk>
	<74d0deb30803210448l49d2eea8ladd95766c47ba820@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I'd like to forward you a question about this patch that I'd like
to get in via Russell King's queue.

The way the MTD subsystem / physmap driver handle set_vpp, can the
magician_set_vpp function below race with itself? Or would it be
better to use a counting approach like omap_set_vpp in the omap-nor
driver?

The full patch is here:
http://lists.arm.linux.org.uk/lurker/message/20080317.201751.2fa54cff.en.html

thanks
Philipp

---------- Forwarded message ----------
From: pHilipp Zabel <philipp.zabel@gmail.com>
Date: Fri, Mar 21, 2008 at 12:48 PM
Subject: Re: [PATCH 5/9] magician: enable flash VPP GPIO and build in
MTD, physmap-flash and JFFS2
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>

On Thu, Mar 20, 2008 at 10:01 PM, Russell King - ARM Linux
 <linux@arm.linux.org.uk> wrote:
 > On Mon, Mar 17, 2008 at 09:17:51PM +0100, Philipp Zabel wrote:
 >  > This enables rootfs on StrataFlash if the bootloader supplies the
 >  > partition list.
 >
 > > diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
 >  > index 3a3252e..531be3d 100644
 >  > --- a/arch/arm/mach-pxa/magician.c
 >  > +++ b/arch/arm/mach-pxa/magician.c
 >  > @@ -223,6 +223,15 @@ static struct pxaohci_platform_data
magician_ohci_info = {
 >  >   * StrataFlash
 >  >   */
 >  >
 >  > +static void magician_set_vpp(struct map_info *map, int vpp)
 >  > +{
 >  > +     static int old_vpp;
 >  > +     if (vpp == old_vpp)
 >  > +             return;
 >  > +     gpio_set_value(EGPIO_MAGICIAN_FLASH_VPP, vpp);
 >  > +     old_vpp = vpp;
 >  > +}
 >  > +
 >
 >  Have you checked that this can't race with itself?

 No, I have just seen that set_vpp is called very often in quick
 succession with the same vpp value and wanted to avoid overhead,
 assuming that the mtd subsystem cares about locking.
 I have just seen that omap-nor does something similar but with a
 counter. Maybe this would be better?

 static void omap_set_vpp(struct map_info *map, int enable)
 {
        static int      count;

        if (enable) {
                if (count++ == 0)
                        OMAP_EMIFS_CONFIG_REG |= OMAP_EMIFS_CONFIG_WP;
        } else {
                if (count && (--count == 0))
                        OMAP_EMIFS_CONFIG_REG &= ~OMAP_EMIFS_CONFIG_WP;
        }
 }

 There's also a comment in chips/cfi_cmdset_0001.c:
 /* We should really make set_vpp() count, rather than doing this */

 regards
 Philipp
