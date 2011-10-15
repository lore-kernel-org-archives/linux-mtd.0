Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REwUq-0007dD-V1
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2011 05:09:21 +0000
Received: by eye3 with SMTP id 3so2134153eye.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 22:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20111015030415.GA8274@ponder.secretlab.ca>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
	<1318600108.12351.130.camel@sauron> <20111014142149.GA25079@totoro>
	<20111015030415.GA8274@ponder.secretlab.ca>
Date: Sat, 15 Oct 2011 06:09:18 +0100
Message-ID: <CACb=_tTV31Xq==DsKi0p86SmgOgXL__v4OuxR5bMZKyh=sGE-Q@mail.gmail.com>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
From: Jamie Iles <jamie@jamieiles.com>
To: Grant Likely <grant.likely@secretlab.ca>,
	Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
	devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 October 2011 04:04, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Fri, Oct 14, 2011 at 03:21:49PM +0100, Jamie Iles wrote:
>> Hi Artem,
>>
>> On Fri, Oct 14, 2011 at 04:48:20PM +0300, Artem Bityutskiy wrote:
>> > On Wed, 2011-10-12 at 00:10 +0100, Jamie Iles wrote:
>> > > +#ifdef CONFIG_OF
>> > > +static const struct of_device_id gpio_nand_id_table[] =3D {
>> > > + { .compatible =3D "gpio-control-nand" },
>> > > + {}
>> > > +};
>> > > +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
>> > ...
>> > > +#else /* CONFIG_OF */
>> > ...
>> > > +#endif /* CONFIG_OF */
>> >
>> > I wonder, why it is either OF of platform data? What if I want my kern=
el
>> > to fall-back to platform data if device tree data is absent? What is t=
he
>> > general policy? Sorry, I am not very well aware of the DT stuff. But o=
ff
>>
>> I think the general policy is that for device tree everything should be
>> in the device tree. =A0There is a mechanism for device tree platforms to
>> pass platform data too, but I believe this is more as a tool for
>> migrating existing platforms to device tree.
>>
>> Also, the device tree binding should be well documented - if the device
>> is present in the tree it should have all of the required properties.
>> If the device isn't there at all then it won't get registered.
>>
>> > the top of my head, it is logical when things go like this: I have a
>> > kernel with working platform data, but I can change that dynamically b=
y
>> > feeding it a device tree configuration. Hmm?
>>
>> I think in general platform data and device tree should be mutually
>> exclusive.
>
> No, Artem is correct. =A0It is *not* okay to break platform_data support
> simply by turning on CONFIG_OF. =A0The driver must be able to support
> both, and to choose its data source at runtime.
>
> Essentially, turning on CONFIG_OF adds the ability to boot with a
> device tree while still being able to boot on legacy platforms.

Gah!  Double fail.  I completely misunderstood Artem's question and my
own code.  I did have this ability in previous versions but somehow
managed to kill it in v5 against my best intentions.

Artem, Grant, thanks for spotting this and steering me in the right directi=
on!

Jamie
