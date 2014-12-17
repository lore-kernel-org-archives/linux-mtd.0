Date: Wed, 17 Dec 2014 14:13:55 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <173348604.130724.1418847235940.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <20141217023344.GS9759@ld-irv-0074>
References: <1683475520.65208.1411665491176.JavaMail.zimbra@xes-inc.com>
 <673100209.65720.1411665624206.JavaMail.zimbra@xes-inc.com>
 <20141217023344.GS9759@ld-irv-0074>
Subject: Re: [PATCH 2/2] mtd: map_rom: Support UBI on ROM
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, I have responses to your questions inline below.

----- Original Message -----
> From: "Brian Norris" <computersforpeace@gmail.com>
> Sent: Tuesday, December 16, 2014 8:33:44 PM
> 
> Hi Aaron,
> 
> I see this has been sitting around way too long...
> 
> On Thu, Sep 25, 2014 at 12:20:24PM -0500, Aaron Sierra wrote:
> > UBI needs to know the physical erase block size, even on read-only
> > devices, since it defines the on-device layout. Use a device-tree
> > provided value to support previously written UBI on read-only NOR.
> > 
> > UBI also needs a non-zero writebufsize, so we set it to one.
> 
> Hmm, this one is a pretty big bug IIRC (don't you get an OOPS or
> BUG()?). Do you think it might be worth splitting into a separate patch
> and sending to stable?

The following assumes an initially unpatched map_rom.c.

Attempting to ubiattach a ROM partition (/dev/mtd5) with the default
map_rom writebufsize set to zero, I get the following error in the kernel
log:

UBI: attaching mtd5 to ubi0
UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit
ubiattach: error!: cannot attach "/dev/mtd5"
           error 22 (Invalid argument)

After assigning writebufsize to one and recompiling, attempting to
ubiattach without specifying an erase-size in the device-tree results
in the following error in the kernel log:

UBI: attaching mtd5 to ubi0
UBI: MTD device 5 is write-protected, attach in read-only mode
UBI: scanning is finished
UBI: empty MTD device detected
UBI error: ubi_early_get_peb: no free eraseblocks
UBI error: ubi_attach_mtd_dev: failed to attach mtd5, error -28
ubiattach: error!: cannot attach "/dev/mtd5"
           error 28 (No space left on device)

Neither of those errors are horrible, but both result in an inaccessible
read-only UBIFS.

> > 
> > Note: This was implemented because hardware write-protected CFI
> >       NOR cannot be probed for the physical erase block size.
> > 
> > Signed-off-by: Joe Schultz <jschultz@xes-inc.ccom>
> > Signed-off-by: Aaron Sierra <asierra@xes-inc.ccom>
> > ---
> >  Documentation/devicetree/bindings/mtd/mtd-physmap.txt |  5 +++++
> >  drivers/mtd/chips/map_rom.c                           | 13 ++++++++++++-
> >  2 files changed, 17 insertions(+), 1 deletion(-)
> > 

[ snip ]

> > +static unsigned int default_erasesize(struct map_info *map)
> > +{
> > +	const __be32 *erase_size = NULL;
> > +#ifdef CONFIG_OF
> > +	erase_size = of_get_property(map->device_node, "erase-size", NULL);
> > +#endif
> 
> I think you can just drop the #ifdef and have the same effect, no?

Yes, you are correct. I was being too cautious.

-Aaron
