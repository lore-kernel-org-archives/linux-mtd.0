Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OitXw-0007Rb-MY
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 18:27:34 +0000
Received: by yxj4 with SMTP id 4so4834513yxj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 11:27:31 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <OFF5EA512A.075E51C6-ONC125777B.005D9750-C125777B.005F8CAF@transmode.se>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
	<AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
	<OFF5EA512A.075E51C6-ONC125777B.005D9750-C125777B.005F8CAF@transmode.se>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 10 Aug 2010 12:27:11 -0600
Message-ID: <AANLkTi=EpjPC8Hf6dM1att8Mjg5vmfQxs2=4aUTYTrUL@mail.gmail.com>
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

On Tue, Aug 10, 2010 at 11:23 AM, Joakim Tjernlund
<joakim.tjernlund@transmode.se> wrote:
> glikely@secretlab.ca wrote on 2010/08/10 16:56:42:
>>
>> On Tue, Aug 10, 2010 at 2:29 AM, Joakim Tjernlund
>> <joakim.tjernlund@transmode.se> wrote:
>> >> On Tue, Aug 10, 2010 at 1:14 AM, David Brownell <david-b@pacbell.net>=
 wrote:
>> >> >
>> >> >
>> >> > --- On Mon, 8/9/10, Grant Likely <grant.likely@secretlab.ca> wrote:
>> >> >
>> >> >
>> >> >> > + =A0 =A0 =A0 nr_parts =3D
>> >> >> of_mtd_parse_partitions(&spi->dev, np, &parts);
>> >> >
>> >> > Let's keep OF-specific logic out of drivers like
>> >> > this one ... =A0intended to work without OF.
>> >> >
>> >> > NAK on adding dependencies like OF to drivers
>> >> > and other infrastructure that starts generic.
>> >
>> > Agreed.
>> >
>> >>
>> >> The OF hooks compile to no-ops when CONFIG_OF is disabled. =A0I've be=
en
>> >> very careful about that.
>> >
>> > OF should not be in the drivers, one should be able use some other met=
hod
>> > than OF.
>>
>> If a device is described in the device tree, then the code has to live
>> *somewhere* to translate the data from the device tree into a form the
>> driver can use. =A0If not the driver, then where should that code live?
>>
>> If it is in the machine support code, then that requires foreknowledge
>> about all the device specific data that needs to be translated out of
>> the device tree at device registration time, which also means that the
>> translation code cannot be a module and it nullifies some of the
>> advantages of the device tree. =A0Not to mention the fact that it is
>> just plain ugly! =A0:-)
>>
>> Some of it can go into the infrastructure code, but only for parsing
>> common properties like irqs, address ranges, and some common bindings
>> like registering spi and i2c bus child nodes as devices. =A0(This
>> *particular* case may fall into this category if add_mtd_device() was
>> able to call the OF partition parsing hook if a device node pointer
>> was present; which does make a certain amount of sense, but I defer to
>> dwmw2 in this case). =A0However, device-specific properties cannot be
>> parsed in the infrastructure code because the infrastructure has no
>> knowledge of device specific bits.
>
> I am no expert at this at all, but I can give you an example what I don't
> want. Look at spi_mpc8xxx.c, earlier it was possible to define your own
> CS functions and register them from board code. After OF:ication one can
> not and the current OF methods aren't expressive enough to do what I need=
.
> The spi subsystem has a general framework for dealing with SPI devices
> and I think OF should be built on top of the native methods, at the
> very least not disable those methods like spi_mpc8xxx.c does.

You're right and it's a problem.  There wasn't a good way to handle
this when powerpc first moved over to use OF.  I think we've got a
good solution now.  See the use of a bus notifier in
arch/powerpc/platforms/512x/pdm360ng.c in Linus' current tree.  Most
of the time that won't be needed, but when a platform specific
callback is required, this seems to be a clean solution.

g.
