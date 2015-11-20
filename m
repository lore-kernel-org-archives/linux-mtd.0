Received: from 212-186-180-163.dynamic.surfer.at ([212.186.180.163]
 helo=cgate.sperl.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzimX-00008D-LX
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 10:19:07 +0000
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
From: Martin Sperl <martin@sperl.org>
In-Reply-To: <20151119171538.GO31303@sirena.org.uk>
Date: Fri, 20 Nov 2015 11:18:42 +0100
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 19.11.2015, at 18:15, Mark Brown <broonie@kernel.org> wrote:
>=20
>> I am in the progress of writing a (minimal) spi-core extension, that =
would allow=20
>> a spi_master to have a prepare_message function that would call some =
=E2=80=9Cmessage
>> translation functions=E2=80=9D.
>=20
>> The ones I have currently come up with are:
>> int spi_split_transfer_alignment(struct spi_message *msg, int =
alignment);
>> int spi_split_transfer_maxsize(struct spi_message *msg, size_t =
max_size);
>=20
> Please don't do things this way, please make this more data driven -
> have the drivers declare their capabilities so the core can just do
> these things based on those flags rather than requiring active code in
> drivers.  This keeps the code central which in turn helps keep things
> maintainable.
>=20

Well - I was thinking about starting with this approach for simplicity.

Making it automatic/data-driven by just defining limits that the core
can then handle transparently is something that could come as a next
step.

Also the bus master driver knows what its limitations are, so putting
them inside prepare_message seems reasonable to me - that is unless
you really have spi_device drivers that would handle those as separate
facts and not refuse to work.


So I wonder how much difference it makes:
int driver_prepare_message (struct spi_master *master,=20
                            struct spi_message *msg)
{
  int ret;

  if (ret =3D spi_split_transfer_alignment(msg, 4))
	ret ret;
  if (ret =3D spi_split_transfer_maxsize(msg, 65534))
	ret ret
  return 0;
}

driver_probe() {
  ...
  master->prepare_message =3D driver_prepare_message;
  ...
}

or:
driver_probe() {
  ...
  master->transfer_alignment =3D 4;
  master->max_transfer_size =3D 65534;=20
  ...
}

both work, but parametrizing may become a pain when more
limitations start to get created.

In my example when looking at the situation where we only care for
alignment when the transfer is valid for DMA (PIO does not care).

so you would need to add something like:
  master->transfer_alignment_min_size =3D 96;

to handle such =E2=80=9Cextra=E2=80=9D requirements for the spi_master.
(Sometimes ordering of =E2=80=9Crules=E2=80=9D may be important as well)

So the function inside the core we could then look like this:

int spi_core_prepare_message (struct spi_master *master,=20
                              struct spi_message *msg)
{
  int ret;

  if (master->transfer_alignment) {
    ret =3D spi_split_transfer_alignment(msg,
				       master->transfer_alignment,
				       =
master->transfer_alignment_min_size);
    if (ret)
      ret ret;
  }

  if (master->transfer_alignment) {
    ret =3D spi_split_transfer_maxsize(msg,
				     master->max_transfer_size);
    if (ret)
      ret ret;
  }
  return 0
}

Something like the above I envision as a second step,
but first start to make it work...

>> I guess this is a more transparent approach that does not require the
>> individual device drivers to query the spi_master about limitations
>> and replicate code in several drivers - also there is no maintenance =
cost on
>> individual device drivers to track when there is a new limitation =
introduced.
>=20
> You've got this back to front - drivers are responsible for =
initialising
> the master when they instantiate it.  There's nothing stopping them
> using the data if they have variants to handle but they shouldn't be
> speculatively looking at it on the off chance there's some limit.

I wonder if such a variant-construct does not create more headaches in
the long run as each spi_driver wanting to do something =E2=80=9Csomething=
=E2=80=9D
special would then need to get updated for any additional constraint=E2=80=
=A6

It seems as if we would need then to add 2 kinds of constraints:
* ones that may be of interest to spi_device to avoid unfavourable=20
  situations created by the core implementation (max_transfer_sizes)
* ones that are handled by spi-core
  (like the alignment constraints)


Martin
