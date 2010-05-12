Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC7Bq-0000yY-UU
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 08:21:16 +0000
Received: by ywh35 with SMTP id 35so4556625ywh.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 May 2010 01:21:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273635175.8881.3.camel@localhost.localdomain>
References: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
	<z2z152584231004201324tc69525a0hb86ff9fdeb679ca4@mail.gmail.com>
	<1272373142.7750.5.camel@localhost>
	<AANLkTinWOfcRRrfhgUO2tvBeVDu_PvnKeKa_0MQKbJtG@mail.gmail.com>
	<1273635175.8881.3.camel@localhost.localdomain>
Date: Wed, 12 May 2010 10:21:12 +0200
Message-ID: <AANLkTimjSxP9tCJM86hNRRgFKvj5MQLSYowOF5P-PpOe@mail.gmail.com>
Subject: Re: Erase race?
From: massimo cirillo <maxcir@gmail.com>
To: Jon Ringle <jon@ringle.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,
I verified some particular error conditions regarding
the erase suspend in some nor flash chip.
Please tell me the part number of the flash you
are using and I will check it.

Max

2010/5/12 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-05-11 at 22:30 -0400, Jon Ringle wrote:
>> On Tue, Apr 27, 2010 at 8:59 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Tue, 2010-04-20 at 16:24 -0400, Jon Ringle wrote:
>> >> On Tue, Apr 13, 2010 at 4:15 PM, Jon Ringle <jon@ringle.org> wrote:
>> >> > Hi,
>> >> > I have a few machines that have UBI and UBIFS on NOR flash that are
>> >> > undergoing continuous reboot testing.
>> >> > One of them just caught the following failure:
>> >> >
>> >> > [ =C2=A0 51.250000] IXP4XX-Flash.0: buffer write error (status 0xd0=
)
>> >> > [ =C2=A0 51.250000] UBI error: ubi_io_write: error -22 while writin=
g 64
>> >> > bytes to PEB 226:0, written 0 bytes
>> >> > [ =C2=A0 51.270000] UBI error: erase_worker: failed to erase PEB 22=
6, error -22
>> >> > [ =C2=A0 51.270000] UBI warning: ubi_ro_mode: switch to read-only m=
ode
>> >> > [ =C2=A0 51.290000] UBI error: do_work: work failed with error code=
 -22
>> >> > [ =C2=A0 51.290000] UBI error: ubi_thread: ubi_bgt0d: work failed w=
ith error code -22
>> >> >
>> >> > Looking at this it appears that the failure might have been caused =
due
>> >> > to the erase_worker and ubi_io_write occurring out of order... sinc=
e
>> >> > it looks like ubi_io_write was trying to write at offset 0 of the P=
EB,
>> >> > which I imagine would have to be the EC header, which should happen
>> >> > after the block is erased. But it doesn't seem to be the case here.
>> >>
>> >> I had this issue occur again on another system:
>> >> [ =C2=A0 48.250000] IXP4XX-Flash.0: buffer write error (status 0xd0)
>> >> [ =C2=A0 48.250000] UBI error: ubi_io_write: error -22 while writing =
64
>> >> bytes to PEB 111:0, written 0 bytes
>> >> [ =C2=A0 48.280000] UBI error: erase_worker: failed to erase PEB 111,=
 error -22
>> >> [ =C2=A0 48.280000] UBI warning: ubi_ro_mode: switch to read-only mod=
e
>> >> [ =C2=A0 48.310000] UBI error: do_work: work failed with error code -=
22
>> >> [ =C2=A0 48.310000] UBI error: ubi_thread: ubi_bgt0d: work failed wit=
h error code -22
>> >>
>> >> Can anyone comment as to my theory that this is a race condition
>> >> between ubi_io_write and erase_worker occurring out of order?
>> >
>> > Did you debug this further? Any new findings?
>>
>> I finally got a capture of this with CONFIG_MTD_UBI_DEBUG turned on:
>>
>> [ =C2=A0 61.710000] IXP4XX-Flash.0: buffer write error (status 0xd0)
>> [ =C2=A0 61.710000] UBI error: ubi_io_write: error -22 while writing 64
>> bytes to PEB 136:0, written 0 bytes
>> [ =C2=A0 61.740000] [<c011a240>] (unwind_backtrace+0x0/0x170) from
>> [<bf0157a8>] (ubi_io_write+0x1ec/0x214 [ubi])
>> [ =C2=A0 61.770000] [<bf0157a8>] (ubi_io_write+0x1ec/0x214 [ubi]) from
>> [<bf01599c>] (ubi_io_write_vid_hdr+0x1cc/0x20c [ubi])
>> [ =C2=A0 61.800000] [<bf01599c>] (ubi_io_write_vid_hdr+0x1cc/0x20c [ubi]=
)
>> from [<bf016c50>] (sync_erase+0xd4/0x128 [ubi])
>> [ =C2=A0 61.830000] [<bf016c50>] (sync_erase+0xd4/0x128 [ubi]) from
>> [<bf017344>] (erase_worker+0x28/0x2d8 [ubi])
>> [ =C2=A0 61.860000] [<bf017344>] (erase_worker+0x28/0x2d8 [ubi]) from
>> [<bf0180e4>] (do_work+0x98/0x13c [ubi])
>> [ =C2=A0 61.860000] [<bf0180e4>] (do_work+0x98/0x13c [ubi]) from
>> [<bf01824c>] (ubi_thread+0xc4/0x158 [ubi])
>> [ =C2=A0 61.890000] [<bf01824c>] (ubi_thread+0xc4/0x158 [ubi]) from
>> [<c0142b84>] (kthread+0x7c/0x84)
>> [ =C2=A0 61.890000] [<c0142b84>] (kthread+0x7c/0x84) from [<c0115378>]
>> (kernel_thread_exit+0x0/0x8)
>> [ =C2=A0 61.920000] UBI error: erase_worker: failed to erase PEB 136, er=
ror -22
>> [ =C2=A0 61.920000] UBI warning: ubi_ro_mode: switch to read-only mode
>> [ =C2=A0 61.950000] UBI error: do_work: work failed with error code -22
>> [ =C2=A0 61.950000] UBI error: ubi_thread: ubi_bgt0d: work failed with e=
rror code -22
>
> So it is probably not a kind of race you assumed before. Your flash for
> some reasons encounters an error, dunno why.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
