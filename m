Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBNJR-0000MO-4g
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 10:35:38 +0000
Received: by mail-ie0-f181.google.com with SMTP id 17so3348729iea.12
 for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2013 02:35:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BAF0C2081321BA469F9ADF648F97D9B04C78FA6071@MCC023.weinmann.com>
References: <BAF0C2081321BA469F9ADF648F97D9B04C78FA6069@MCC023.weinmann.com>
 <CAN8TOE9YJBvUE9GDW3krZB-Js6gUkqY23gYNLS4gFX0e2NDNZw@mail.gmail.com>
 <BAF0C2081321BA469F9ADF648F97D9B04C78FA6071@MCC023.weinmann.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 1 Mar 2013 11:35:15 +0100
Message-ID: <CACQ1gAg0rE+X+uxRWbrPKhmdS1T0MG00cwwBbzWM+VwU4zaXmw@mail.gmail.com>
Subject: Re: Bug in mtd_get_device_size()?
To: "Velykokhatko, Sergey" <Sergey.Velykokhatko@mcc-med.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/3/1 Velykokhatko, Sergey <Sergey.Velykokhatko@mcc-med.de>:
> Hi Brian,
>
> Thanks for your answer. Ok, I have nothing against that my interpretation=
 of mtd_get_device_size() purpose is wrong. But what you mean under: "Becau=
se your BEB_LIMIT=3D100, you are reserving 100*size/1024 (that is 9.8% of y=
our total size, or 400 blocks) in *every* partition." Looks for me a little=
 bit strange. Why? Because I expected that UBI reserves the place for bad b=
lock handling pool depending on the size of MTD partition (on that it runni=
ng) and not on the size of the whole chip. Actually I have 2 partitions wit=
h UBI (for rootfs and for data) and without my patch UBI tries to reserve n=
early 400 blocks on each (see down).
Reserving bad blocks depending on the size of the MTD partition is
wrong, and here is why:
I didn't checked the datasheet of your nand chipset (actually, I
didn't found it).
But let's say it's a standard one : your chip has 4096 blocks, and the
manufacturer says that there won't be more than 80 bad blocks
(20/1024)on the device during its ENDURANCE LIFE (endurance life means
something like 100000 program/erase cylcles).
Those 80 bad blocks could appear *everywhere*, they won't be equally
disposed on the device.
=3D> If you have a small bare MTD partition of 16blocks, and do a lot of
write/erase cycles on it, we can imagine that there will be some bad
blocks on it, and maybe all those 16 blocks will turn bad.
If UBI takes the size of MTD partition to compute the maximum number
of bad erase blocks, for a 16blocks MTD partition, this would be
16*20/1024 =3D0.31 =3D> there will be a lack of reserved erase blocks.
said differently: if you want to be sure to have 2MB space (16blocks)
to write on, you have to reserve 80 blocks more. This is the worst
case scenario.
>
> Why I set CONFIG_MTD_UBI_BEB_LIMIT to such high limit? Well, you are righ=
t: our NAND from production could contain up to 40 bad blocks. That is 1% o=
f whole chip size. But our medical device should work in worst case each ni=
ght for 10 years. I expect that in whole device life more blocks will be de=
fect. Of course 10% for rootfs MTD is overkill since it will be updated ver=
y very seldom, but for data partititon 10% is probably even too low.
"I expect that in whole device life more blocks will be defect."
you have to double check that.
In all nand datasheets that I've seen, the given number was for the
endurance life.
>From a Micron Nand datasheet :
Micron NAND devices are specified to have a minimum of 2,008 (NVB)
valid blocks out
of every 2,048 total available blocks. This means the devices may have
blocks that are
invalid when they are shipped. An invalid block is one that contains
one or more bad
bits. Additional bad blocks may develop with use. However, the total
number of avail-
able blocks will not fall below NVB during the endurance life of the produc=
t.

As there's very little information on how bad blocks appear, we can
suppose that even on the 1st erase cycle of a block, it can turn bad.
That's why we have to use the worst case scenario.
>
>>That would reserve only 80 blocks on your system, and you would not see t=
hese warnings/errors, since you already have 115 blocks reserved.
> You mean *not on my system* but on each MTD running with UBI? :) Well I w=
as thinking to divide my UBI volumes on UBI1 in small sub MTDs. Since I had=
 2 times cases, when I couldn't mount my ubi1:ubivol_data (I don't know why=
 it happened, probably because of bugs in pretty new NAND driver from Atmel=
) and I should ubiformat/ubimkvolume for my MTD with loosing of extreme imp=
ortant data on ubi1:ubivol_device. If I really make new small MTDs for ubi1=
:ubivol_device/ ubi1:ubivol_config with the actual kernel state they will b=
e completely used with poll for reserved bad blocks. No room for my data :)

yes, using a lot of UBI partition is not space friendly.
The optimized way is one UBI partition, and many ubi volumes...

By the way,  even your kernel_a partition can be seen as undersized
(3MB). if your kernel is 2MB, there's only 1MB (8) left for eventual
bad blocks.
I understands that it's "unlikely" that more than 8 bad blocks appears
on a partition where you do not write very often, that this would be
"bad luck", but who knows...
That will depend on the criticality of your device, "do we accept to
may be brick one product out of xxxxx or not ?". If not, we have to
accept to loose some space for bad blocks, or use NOR :)

Best regards,
Richard.
