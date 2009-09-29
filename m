Received: from smtpin2.mailsecure.in ([121.241.224.3])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsUnH-0008QR-8g
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 04:58:35 +0000
Message-ID: <4AC1947A.5060901@tataelxsi.co.in>
Date: Tue, 29 Sep 2009 10:30:42 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: Dennis McLeod <dmcleod@bittware.com>
Subject: Re: Mounting Entire Flash
References: <4ABB468D.9050009@tataelxsi.co.in>
	<1253797515.3722.3.camel@lusitania>
In-Reply-To: <1253797515.3722.3.camel@lusitania>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dennis,

> On Thu, 2009-09-24 at 15:44 +0530, Rahanesh wrote:
>  =20
>> Hi All,
>>
>> Currently I have 4 mtd partitions in Flash. They are all seen under /dev=20
>> directory as mtd0 mtd1 mtd2 and mtd3.
>>
>> mtd0-> Uboot + Itz Environment
>> mtd1-> JFFS
>> mtd2-> Config files
>> mtd3-> Not used
>>
>> I am currently trying to implement Image upgradation.
>>
>> I will need to update JFFS, uboot and Config files from Linux.
>>
>> I am currently achieving this through  flash_eraseall and dd  command .
>>
>> To Update U-boot First i will do a
>>
>> flash_eraseall /dev/mtd0 and then
>> dd if=3Duboot.bin of=3D/dev/mtd0 count=3Dsize;
>>
>> and similarly for all individual partitions.
>>
>> But If i have a combined image as combined.bin  how do i update the=20
>> entire flash .
>>
>> Is it possible to see entire flash as /dev/mtd  . i can very well=20
>> extract individual images from combined image and reflash to respective=20
>> partitions.
>>
>> But it would be generic if  we are able write to entire flash not to=20
>> individual partitions.
>>
>> Is it possible to Write to entire flash as such.
>>
>> Thanks
>> Rahanesh
>>    =20
>
> I always set up a partition that spans the entire flash chip..=20
>
> mtd0 -> 0:ENTIRE_SIZE
> mtd1 -> 0:+10M
> mtd2 -> 10M:22M
>  =20
         How do we achieve this? Should we edit /proc/mtd or=20
flash/driver code ?

        Thanks
        Rahanesh
