Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnWmF-000710-Bj
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 13:09:28 +0000
Received: by gyf2 with SMTP id 2so2450434gyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 06:09:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282565622.24044.20.camel@localhost>
References: <AANLkTikgBKD4yku0fF_WaatNaOsRWwPf-VLKrWXByk1a@mail.gmail.com>
	<1282560805.24044.5.camel@localhost>
	<AANLkTikc13g+5Q3YFMhgfJ1LWq_aMLUK1M9AFr2G1WSP@mail.gmail.com>
	<1282565622.24044.20.camel@localhost>
Date: Mon, 23 Aug 2010 15:09:26 +0200
Message-ID: <AANLkTinWcL_wQWCudD5sk=hHmKn8kYk7=+CS-t4OGSc-@mail.gmail.com>
Subject: Re: MTD Flash Partition: change possible?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2010-08-23 at 14:11 +0200, Arno Steffen wrote:
>> 2010/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
>> > On Mon, 2010-08-23 at 12:23 +0200, Arno Steffen wrote:
>> >> In my embedded system the Flash-partition table is compiled into kern=
el.
>> >> Is there a way to change partition table without booting a new kernel=
? How?
>> >>
>> >> Background: I want to update an embedded system and change the size o=
f
>> >> partitions. But tools as flash_eraseall and nandwrite use partitions
>> >> of the current kernel. If I want to change the size of the partitions=
,
>> >> this is impossible.
>> >> If I first flash a new kernel with new partition table, I have to
>> >> reboot and the system will not start, as the old partitioning scheme
>> >> is still active.
>> >
>> > There were at least 2 patches. One from Nokia - it was ok, but a small
>> > change was requested and the author disappeared. One was from Samsung =
-
>> > I did not look at it so far. The patches were sent to the MTD mailing
>> > list a month or 2 ago.
>> >
>> > --
>> > Best Regards,
>> > Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>> >
>> >
>>
>> Spasibo, Artem.
>>
>> I found the Nokia Patch
>> http://lists.infradead.org/pipermail/linux-mtd/2010-June/030645.html
>> This seems to be done for OneNand, while I am using Nand.
>
> No, it is not OneNAND-specific!
>
>> Regarding the pathes: That are requests to change, so it is not for
>> sure that this is implemented in a new kernel?
>>
>> I found this as an update to mtdutils.
>> http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html
>> =9ADoes this needs a new kernel to support this functions? I am using a =
2.6.33.
>
> Dunno, did not look at this.
>
>> Reading this, I think there is no solution for my current system.
>> Is there a way to show the startaddress of a partition? /proc/mtd
>> shows just size, not start address.
>
> I do not think we can change /proc/mtd, but isn't it easy to calculate
> the start address using partition sizes?
>
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>
>

If I check the git for mtd-utils, this pathes seems not to be
inserted. Do I have to patch manually?
http://git.infradead.org/mtd-utils.git

Calculating the address might work, but hasn't to be. It is not
forbidden to have "holes" in the partition table.
