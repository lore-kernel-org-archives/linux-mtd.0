Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnVrw-00024Z-ND
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 12:11:17 +0000
Received: by iwn41 with SMTP id 41so6313299iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 05:11:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282560805.24044.5.camel@localhost>
References: <AANLkTikgBKD4yku0fF_WaatNaOsRWwPf-VLKrWXByk1a@mail.gmail.com>
	<1282560805.24044.5.camel@localhost>
Date: Mon, 23 Aug 2010 14:11:15 +0200
Message-ID: <AANLkTikc13g+5Q3YFMhgfJ1LWq_aMLUK1M9AFr2G1WSP@mail.gmail.com>
Subject: Re: MTD Flash Partition: change possible?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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
> On Mon, 2010-08-23 at 12:23 +0200, Arno Steffen wrote:
>> In my embedded system the Flash-partition table is compiled into kernel.
>> Is there a way to change partition table without booting a new kernel? H=
ow?
>>
>> Background: I want to update an embedded system and change the size of
>> partitions. But tools as flash_eraseall and nandwrite use partitions
>> of the current kernel. If I want to change the size of the partitions,
>> this is impossible.
>> If I first flash a new kernel with new partition table, I have to
>> reboot and the system will not start, as the old partitioning scheme
>> is still active.
>
> There were at least 2 patches. One from Nokia - it was ok, but a small
> change was requested and the author disappeared. One was from Samsung -
> I did not look at it so far. The patches were sent to the MTD mailing
> list a month or 2 ago.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

Spasibo, Artem.

I found the Nokia Patch
http://lists.infradead.org/pipermail/linux-mtd/2010-June/030645.html
This seems to be done for OneNand, while I am using Nand.

Regarding the pathes: That are requests to change, so it is not for
sure that this is implemented in a new kernel?

I found this as an update to mtdutils.
http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html
 Does this needs a new kernel to support this functions? I am using a 2.6.3=
3.

Reading this, I think there is no solution for my current system.
Is there a way to show the startaddress of a partition? /proc/mtd
shows just size, not start address.

Regards
Arno
