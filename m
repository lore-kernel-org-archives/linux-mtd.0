Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avXL9-0002aB-58
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 21:49:48 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Henry
 Shen" <Henry.Shen@alliedtelesis.co.nz>
Subject: Re: secure file deletion/SECRM support for JFFS2 and UBIFS
Date: Wed, 27 Apr 2016 21:49:21 +0000
Message-ID: <66249822349e4de191f8f67ca1a5c35c@svr-chch-ex1.atlnz.lc>
References: <b80a613015cd4b018148cf22865c43ea@svr-chch-ex1.atlnz.lc>
 <CAFLxGvz9ybdeSqqjUwy6zUe7aO9h1TeRXVHnA_WRERmahrxe-Q@mail.gmail.com>
 <CAFLxGvyXnP7VkrYcsokcz-iU3G=u0QmFvZnr6txbjMvYHk6gYA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/27/2016 07:06 PM, Richard Weinberger wrote:=0A=
> On Wed, Apr 27, 2016 at 9:05 AM, Richard Weinberger=0A=
> <richard.weinberger@gmail.com> wrote:=0A=
>>> Is that something people on this list would be interested in? I realize=
=0A=
>>> JFFS2 is kind of in a twilight phase but we're really not able to=0A=
>>> migrate some customers away from it.=0A=
>>=0A=
>> This is definitely a nice feature.=0A=
>> But please keep in mind that you can overwrite data on flash. :-)=0A=
>=0A=
> Should be read "can't", of course...=0A=
>=0A=
=0A=
You can't overwrite with arbitrary data. But for NOR flash at least you =0A=
_can_ overwrite with 0 (at least I think you can). In other words if the =
=0A=
erased state is 0xff you can write 0xaa you would not be able to write =0A=
0x55 without erasing the block first but you would be able to write 0x00.=
=0A=
=0A=
I was hoping to avoid having to do an immediate erase but if I'm wrong =0A=
that's what we'd have to do.=0A=
