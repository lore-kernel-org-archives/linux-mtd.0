Received: from exprod6og106.obsmtp.com ([64.18.1.191])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVD9Q-0006zu-Dv
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 22:56:52 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Access entire device with mtdblock0
Date: Thu, 5 Feb 2009 17:56:30 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090120BA94@mi8nycmail19.Mi8.com>
In-Reply-To: <49839668.20502@jkmicro.com>
References: <4967F2B2.4060405@jkmicro.com>	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>	<878wpeclf1.fsf@macbook.be.48ers.dk>	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com><20090114115056.GD7994@leila.ping.de>
	<49839668.20502@jkmicro.com>
From: "hartleys" <hartleys@visionengravers.com>
To: "Adam Yergovich" <ayergo@jkmicro.com>,
	"Wolfgang Wegner" <wolfgang@leila.ping.de>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, January 30, 2009 5:08 PM, Adam Yergovich wrote:
> Wolfgang Wegner wrote:
>> On Wed, Jan 14, 2009 at 05:58:43AM -0500, Mike Frysinger wrote:
>>> On Wed, Jan 14, 2009 at 04:00, Peter Korsgaard wrote:
>>>> "Mike" =3D=3D Mike Frysinger <writes:
>>>>>> Any recommendations on a simple way to create a partition using=20
>>>>>> the entirety of flash?
>>>>> looks like no one responded.  i'm pretty sure the answer is to use
>>>>> add_mtd_device() even in face of add_mtd_partitions().
>>>> Why not just add a partition spanning the entire device in addition

>>>> to the other partitions?
>>> i was not aware partition tables allowed for overlaps.  if that's=20
>>> true, then the answer is obvious and easy to implement in boards ...
>>=20
>> They are allowed, but I have not been able yet to do a correct query=20
>> for erase_size in case of a partition covering a whole device having=20
>> multiple different-sized erase regions.
>>=20
>> Regards,
>> Wolfgang
>
> Hello All,
>=20
> Sorry for the delay in trying this out, I have been exceptionally
busy.
>=20
> The short story is: i got it all to work.
>=20
> The long story is:
>=20
> In reviewing the code i found that add_mtd_device was already being
> called after the partitioning.  As it wasn't giving mtdblock0 as the
> entire region it didn't seem to be the solution.
>=20
> I played around some more, and found disabling the mtd partitioning
> would give me one partition including all of flash.  If you'll note
> in the code (which has been present in physmap.c for some time I
> believe) it was getting to the add_mtd_device and adding it if and
> only if the redboot section was not called.
>=20
> I moved the add_mtd_device() call to before the redboot partitioning
> and it all worked brilliantly.
>=20
> I would like to suggest that this is perhaps a better construct
> overall as it adds a nice feature.
>=20
> Hopefully this is at very least useful to someone who looks at this
> in the future.  I thank you all for your help in this.

It appears this was originally thought about for mtd partitions.

In mdtpart.c, add_mtd_partitions() has a comment above it:

/*
 * This function, given a master MTD object and a partition table,
creates
 * and registers slave MTD objects which are bound to the master
according to
 * the partition definitions.
 * (Q: should we register the master MTD object as well?)
 */

Maybe it was just never revisited?

Hartley
