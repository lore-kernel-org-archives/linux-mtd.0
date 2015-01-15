Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBpHT-0002ON-QS
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 18:36:32 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Erik Ekman <erik@kryo.se>, Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: RE: Flash filesystem questions
Date: Thu, 15 Jan 2015 18:36:02 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD73526C10AA4@NTXBOIMBX03.micron.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
In-Reply-To: <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NOP, Number of Partial Page program depends on the geometry of the NAND.  O=
n 34nm NAND , NOP of 4 was typical , you could write to the same page 4 tim=
es.  As the geometry went down allowing partial page programming caused exc=
essive disturb and NOP dropped to 1.  So depending on the geometry writing =
to a page more than once will result in disturbs.




-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Erik Ekman
Sent: Thursday, January 15, 2015 9:49 AM
To: Ricard Wanderlof
Cc: Richard Weinberger; linux-mtd@lists.infradead.org
Subject: Re: Flash filesystem questions

On Wed, Jan 14, 2015 at 11:59 PM, Ricard Wanderlof <ricard.wanderlof@axis.c=
om> wrote:
>
> On Wed, 14 Jan 2015, Richard Weinberger wrote:
>
>> On Wed, Jan 14, 2015 at 9:21 PM, Erik Ekman <erik@kryo.se> wrote:
>> > Hi all,
>> >
[...]
>> >
>> > Could this problem be because of my driver? Is there some way to=20
>> > configure UBI for to only write once per flash block or is that the de=
fault?
>>
>> You can a block only write once. Then you have to erase it again.
>
> When I read Erik's original post I interpreted the 'write once per=20
> flash block' to mean that you can do a single write per block, and that's=
 it.
> Given the usage as a speedup component, it would make sense to copy=20
> the relevant data in one go, since no read/write file system would be=20
> implemented on the device, there would be no need for page based writes.
> The flash memory most likely doesn't have this limitation but the=20
> controller could I suppose.
>
> Erik, was that in fact what you meant?
>
> None of the Linux-based read/write file systems can handle the case of=20
> only being able to do a single write operation to a block. They are=20
> all based on the fact that you normally can write a page of data at a tim=
e.

I meant that each 4kB sector within in erase block can only be written once=
 per erase.
In the SoC flashes I have run into at work you can usually write many times=
 (only clearing bits of course, not setting them) to the same sector. What =
I see when I try is that the writes complete without problem but the next r=
ead of the same sector returns an error.

My code only read up to 4kB in one read command. It seems the kernel part a=
ttaching ubi did not like not getting all data in one operation. After fixi=
ng long reads I no longer get any asserts in the log. ubiattach does still =
not work though, but now I get a more normal CRC error:

[  834.723114] UBI: attaching mtd0 to ubi0 [  841.609879] UBI: scanning is =
finished [  841.612442] UBI error: vtbl_check: bad CRC at record 23:
0xf116c36b, not 0x000000
[  841.612450] Volume table record 23 dump:
[  841.612453] reserved_pebs   0
[  841.612456] alignment       0
[  841.612459] data_pad        0
[  841.612462] vol_type        0
[  841.612465] upd_marker      0
[  841.612468] name_len        0
[  841.612470] name            NULL
[  841.612501] UBI error: vtbl_check: bad CRC at record 23:
0xf116c36b, not 0x000000
[  841.612504] Volume table record 23 dump:
[  841.612507] reserved_pebs   0
[  841.612510] alignment       0
[  841.612513] data_pad        0
[  841.612515] vol_type        0
[  841.612518] upd_marker      0
[  841.612521] name_len        0
[  841.612523] name            NULL
[  841.612527] UBI error: process_lvol: both volume tables are corrupted [ =
 841.615924] UBI error: ubi_attach_mtd_dev: failed to attach mtd0, error -2=
2

I will try with the tests and investigate more.

Thanks for the help,

Erik

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
