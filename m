Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiqGG-0006ar-CR
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 14:57:05 +0000
Received: by gxk27 with SMTP id 27so4758013gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 07:57:02 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 10 Aug 2010 08:56:42 -0600
Message-ID: <AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
Subject: Re: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add support to
	parse the SPI flash's partitions
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: kumar.gala@freescale.com, David Brownell <david-b@pacbell.net>,
	linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
	"linuxppc-dev@ozlabs.org Mingkai Hu" <Mingkai.hu@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 10, 2010 at 2:29 AM, Joakim Tjernlund
<joakim.tjernlund@transmode.se> wrote:
>> On Tue, Aug 10, 2010 at 1:14 AM, David Brownell <david-b@pacbell.net> wr=
ote:
>> >
>> >
>> > --- On Mon, 8/9/10, Grant Likely <grant.likely@secretlab.ca> wrote:
>> >
>> >
>> >> > + =A0 =A0 =A0 nr_parts =3D
>> >> of_mtd_parse_partitions(&spi->dev, np, &parts);
>> >
>> > Let's keep OF-specific logic out of drivers like
>> > this one ... =A0intended to work without OF.
>> >
>> > NAK on adding dependencies like OF to drivers
>> > and other infrastructure that starts generic.
>
> Agreed.
>
>>
>> The OF hooks compile to no-ops when CONFIG_OF is disabled. =A0I've been
>> very careful about that.
>
> OF should not be in the drivers, one should be able use some other method
> than OF.

If a device is described in the device tree, then the code has to live
*somewhere* to translate the data from the device tree into a form the
driver can use.  If not the driver, then where should that code live?

If it is in the machine support code, then that requires foreknowledge
about all the device specific data that needs to be translated out of
the device tree at device registration time, which also means that the
translation code cannot be a module and it nullifies some of the
advantages of the device tree.  Not to mention the fact that it is
just plain ugly!  :-)

Some of it can go into the infrastructure code, but only for parsing
common properties like irqs, address ranges, and some common bindings
like registering spi and i2c bus child nodes as devices.  (This
*particular* case may fall into this category if add_mtd_device() was
able to call the OF partition parsing hook if a device node pointer
was present; which does make a certain amount of sense, but I defer to
dwmw2 in this case).  However, device-specific properties cannot be
parsed in the infrastructure code because the infrastructure has no
knowledge of device specific bits.

The suggestion has been raised to use something like bus notifiers to
get a hook onto the device registration before the driver is probed so
that the platform_data can be translated in an separate chuck of code,
but down that path lies insanity.  There are all kinds of ordering
issues (like making sure the translation code is called before the
driver probe code), and it is a lot of complexity for what is really a
simple thing.

I've yet to be convinced that device-specific OF calls belongs
anywhere in the kernel other than in the driver that uses the data.

That being said, I completely agree that OF calls do not belong in the
vast majority of the driver code.  Using OF calls after the driver is
bound to the device is generally wrong.  However, they make perfect
sense in the probe hook who's whole purpose is to obtain data about
the device and register it.  The model is actually very simple:

if (dev->platform_data)
      get_platform_data();
else if (dev->of_node)
      get_of_data();

For the actual implementation in this case, my comments reflect what I
think is the clearest implementation.  However, if you'd prefer a
single function call at the start of the probe() hook to return a
flash_partition_data pointer, then I'm okay with that too.

Cheers,
g.
