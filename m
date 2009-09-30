Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsuJj-0007mI-Kg
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 08:13:47 +0000
Received: by ywh1 with SMTP id 1so6509530ywh.25
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Sep 2009 01:13:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4AC1947A.5060901@tataelxsi.co.in>
References: <4ABB468D.9050009@tataelxsi.co.in>
	<1253797515.3722.3.camel@lusitania> <4AC1947A.5060901@tataelxsi.co.in>
Date: Wed, 30 Sep 2009 16:13:41 +0800
Message-ID: <8f6e22a70909300113q25e4286fp2d0d181a8dde0005@mail.gmail.com>
Subject: Re: Mounting Entire Flash
From: zheng shi <neversetsun@gmail.com>
To: Rahanesh <rahanesh@tataelxsi.co.in>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Dennis McLeod <dmcleod@bittware.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's a kernel command line parameter called mtdparts.
You may refer to the comments in drivers/mtd/cmdlinepart.c.

On Tue, Sep 29, 2009 at 1:00 PM, Rahanesh <rahanesh@tataelxsi.co.in> wrote:
> Hi Dennis,
>
>> On Thu, 2009-09-24 at 15:44 +0530, Rahanesh wrote:
>>
>>>
>>> Hi All,
>>>
>>> Currently I have 4 mtd partitions in Flash. They are all seen under /de=
v
>>> directory as mtd0 mtd1 mtd2 and mtd3.
>>>
>>> mtd0-> Uboot + Itz Environment
>>> mtd1-> JFFS
>>> mtd2-> Config files
>>> mtd3-> Not used
>>>
>>> I am currently trying to implement Image upgradation.
>>>
>>> I will need to update JFFS, uboot and Config files from Linux.
>>>
>>> I am currently achieving this through =A0flash_eraseall and dd =A0comma=
nd .
>>>
>>> To Update U-boot First i will do a
>>>
>>> flash_eraseall /dev/mtd0 and then
>>> dd if=3Duboot.bin of=3D/dev/mtd0 count=3Dsize;
>>>
>>> and similarly for all individual partitions.
>>>
>>> But If i have a combined image as combined.bin =A0how do i update the
>>> entire flash .
>>>
>>> Is it possible to see entire flash as /dev/mtd =A0. i can very well ext=
ract
>>> individual images from combined image and reflash to respective partiti=
ons.
>>>
>>> But it would be generic if =A0we are able write to entire flash not to
>>> individual partitions.
>>>
>>> Is it possible to Write to entire flash as such.
>>>
>>> Thanks
>>> Rahanesh
>>>
>>
>> I always set up a partition that spans the entire flash chip..
>> mtd0 -> 0:ENTIRE_SIZE
>> mtd1 -> 0:+10M
>> mtd2 -> 10M:22M
>>
>
> =A0 =A0 =A0 =A0How do we achieve this? Should we edit /proc/mtd or flash/=
driver code
> ?
>
> =A0 =A0 =A0 Thanks
> =A0 =A0 =A0 Rahanesh
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



--=20
Regards, Shizheng
