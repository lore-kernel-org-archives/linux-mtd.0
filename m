Received: from mail1.efacec.com ([213.58.212.93])
 by merlin.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5EhQ-0001Xz-PG
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 12:43:18 +0000
Message-ID: <51FBA93C.1090201@efacec.com>
Date: Fri, 2 Aug 2013 13:42:36 +0100
From: =?ISO-8859-1?Q?An=EDbal_Almeida_Pinto?= <anibal.pinto@efacec.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: JFFS2 impact when don't have sub page access
References: <51F91E08.7030409@efacec.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F0091@DBDE04.ent.ti.com>
 <51FB43F3.7020909@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F00EA@DBDE04.ent.ti.com>
 <51FB8E49.9010305@efacec.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F028B@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F028B@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Fernando Gomes <fernando.gomes@efacec.com>,
 "davinci-linux-open-source@linux.davincidsp.com"
 <Davinci-linux-open-source@linux.davincidsp.com>, "Nori,
 Sekhar" <nsekhar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 02-08-2013 12:52, Gupta, Pekon escreveu:
> Hi,
>
>>>
>>>> Also, the subject talks about JFFS2. There is no known affect of absen=
ce
>>>> of subpage support on JFFS2, right?
>>>>
>>> There should not be any problem in using either UBIFS or JFFS2.
>>
>> Please, clarify me with the last statement.
>>
>> There should be no problem using JFFS2 or UBIFS with the patch that you
>> mention applied or even without the patch ?
>>
>
> For UBIFS to work,
> (1) please check following options passed for mkfs.ubifs
> - with this patch
> mkfs.ubifs -s 512  -m 2048
>
> - without this patch
> mkfs.ubifs -s 2048  -m 2048
>
> (2) Also please check for  'chip->options & NAND_NO_SUBPAGE_WRITE'.
> This flag is used for explicitely _disabling_ sub-pages in NAND driver.
>
>
>> With OMAP L138 are some complains about using the ubifs and subpage
>> access, even on uboot [1] so it don't appear to be only a linux [2] prob=
lem.
>>
>> And if the problems appear on ubifs it should affect the jffs2.
>>
>> [1] - http://lists.denx.de/pipermail/u-boot/2011-April/090072.html
> Yes, there is no subpage support in U-Boot.
> Also I hope you are using 'ubiformat' to format the NAND partition with
> UBI.img in kernel ? If that isn't the case, then I'm not sure what can be=
 the
> problem here.
> I have tested omap2-nand with subpage enabled and
> using ubiformat. And it works fine.
>
>
>> [2] - http://comments.gmane.org/gmane.linux.davinci/23836
>>
> Also from [2] last post, there seemed to be an issue with mis-match in
> ECC scheme used between U-Boot and ECC-scheme used in Kernel.
> (But this has nothing todo with sub-pages)..
> Your logs also show ECC errors, so I suggest please make sure you are
> using same ECC scheme in kernel, as the one with which you flashed
> the image.
> ----------------------------------------
>>> [  128.344667] UBI error: ubi_io_read: error -74 (ECC error) while
>>> reading 512 bytes from PEB 2:512, read 512 bytes
>>> [  128.883945] UBI error: ubi_io_read: error -74 (ECC error) while
>>> reading 512 bytes from PEB 1766:512, read 512 bytes
>>> [  128.884072] UBI: run torture test for PEB 1766
> ----------------------------------------

Pekon,

I have verified that disabling the NAND_NO_SUBPAGE_WRITE the images that=20
I have generated work.

Monday I will try test your patch and see the result with subpage.

If is clear on ubifs, we can't have it without disabling the sub page or=20
apply the patch, I don't understand how this influence jffs2 partitions.

On OMAP-L138 with subpage enabled, but not supported by the=20
processor/nand, JFFS2 partitions can be corrupted because of subpage=20
writes ?

Thanks.

Regards,
An=EDbal
