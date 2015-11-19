Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]
 helo=cgate.sperl.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzQi7-00012V-RQ
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 15:01:34 +0000
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <20151119114057.GN31303@sirena.org.uk>
Date: Thu, 19 Nov 2015 16:00:45 +0100
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 19.11.2015, at 12:40, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Wed, Nov 18, 2015 at 11:50:00PM +0100, Heiner Kallweit wrote:
>> Am 18.11.2015 um 22:57 schrieb Mark Brown:
>>> On Wed, Nov 18, 2015 at 10:19:29PM +0100, Heiner Kallweit wrote:
>=20
>>>> There have been few discussions in the past about how to handle SPI =
controller
>>>> limitations like max message length. However they don't seem to =
have resulted
>>>> in accepted patches yet.
>=20
>>> No, they've resulted in people writing code.  We've got a bunch of
>>> things in the spi_master struct like the limits on speeds and bits =
per
>>> word.
>=20
>> Sure, I'm aware of this. To you it might sound obvious to handle such
>> limitations in the SPI core, however there have been several attempts
>> to deal with such limitations in controller or protocol drivers.
>=20
> They're documented using terms like "limits" and "constraints" - it's
> hard to see what we're missing there.
>=20
>>>> Maybe a better approach would be to introduce a new member of =
spi_master
>>>> dealing with controller limitations.
>=20
>>> That's what we've been doing...
>=20
>> Primary addressees of my comment were users of the SPI core trying to =
deal
>> in their own code with things which might be better dealt with in the =
core.
>=20
> Well, we do to the extent we can do anything useful in the core we =
have
> code to deal with them - we constrain clocks and we have error =
checking
> for the bits per word settings for example.
>=20
>> In case there should be more need to reflect such limitations in =
spi_master
>> it might be good to encapsulate them in a separate struct instead of =
adding
>> more such members to spi_master directly.
>=20
> It's going to be annoying to move everything over and TBH I'm not sure
> it really helps much.  This is honestly the first time I can recall
> anyone expressing any confusion here.

On the bcm2835 there are also some =E2=80=9Climitations=E2=80=9D (when =
transfers are not aligned
to word, transfers>65535 can=E2=80=99t DMA) which we work around right =
now inefficiently.

I am in the progress of writing a (minimal) spi-core extension, that =
would allow=20
a spi_master to have a prepare_message function that would call some =
=E2=80=9Cmessage
translation functions=E2=80=9D.

The ones I have currently come up with are:
int spi_split_transfer_alignment(struct spi_message *msg, int =
alignment);
int spi_split_transfer_maxsize(struct spi_message *msg, size_t =
max_size);

These would make the spi message conform to the drivers requirements for
alignment and max_size splitting transfers in the appropriate way before =
they
are are dma-mapped.

I guess this is a more transparent approach that does not require the
individual device drivers to query the spi_master about limitations
and replicate code in several drivers - also there is no maintenance =
cost on
individual device drivers to track when there is a new limitation =
introduced.

This may not handle every possible case/limitation, but could help in =
some cases.

Thanks,
	Martin=
