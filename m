Received: from mail1.efacec.com ([213.58.212.93])
 by merlin.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5CuX-0006Km-KE
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 10:48:43 +0000
Message-ID: <51FB8E49.9010305@efacec.com>
Date: Fri, 2 Aug 2013 11:47:37 +0100
From: =?ISO-8859-1?Q?An=EDbal_Almeida_Pinto?= <anibal.pinto@efacec.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: JFFS2 impact when don't have sub page access
References: <51F91E08.7030409@efacec.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F0091@DBDE04.ent.ti.com>
 <51FB43F3.7020909@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F00EA@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F00EA@DBDE04.ent.ti.com>
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

Em 02-08-2013 07:25, Gupta, Pekon escreveu:
> Hi,
>>
>> On Friday 02 August 2013 10:27 AM, Gupta, Pekon wrote:
>>> Hello,
>>>
>>>> Hi,
>>>>
>>>> I' am using an OMAP L138 with a NAND SLC (MT29F4G08)
>>>>
>>>> I was making some tests with Ubifs but found some errors due to OMAP
>>>> don't support sub pages access:
>>>>
>>> TI OMAP2-NAND supports sub-pages for SLC NAND.
>>>   http://lists.infradead.org/pipermail/linux-
>> mtd/attachments/20130405/a146567f/attachment.obj
>>>
>>> This patch was accepted in mainline linux-3.10,
>>> And tested on AM335x with 2K/64 NAND.
>>>
>>> You can follow this patch details here..
>>> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046285.html
>>
>> Yes, but An=EDbal is talking about OMAP-L138 which is actually a DaVinci
>> part and uses drivers/mtd/nand/davinci_nand.c
>>
> The patch adds support for subpage-write in generic NAND driver,
> So it should work directly for davinci_nand.c
>
>> May be you can clarify whether absence of subpage support will lead to
>> the kind of errors An=EDbal reported?
>>
> I suspect there is some mis-match in options passed while creating
> UBI image for sub-pages. With subpages the LEB size (-e) passed to
>   mkfs.ubifs has different calculation. It should be '(n-1) * page size'
> where 'n' is number of pages in the erase-block.
> This is because when using sub-pages both EraseHeader and
> VolumeHeader are packed in same page.
> I use some personal script to keep that handy, refer [1]
> You can also refer to
> http://processors.wiki.ti.com/index.php/UBIFS_Support
>
>
>> Also, the subject talks about JFFS2. There is no known affect of absence
>> of subpage support on JFFS2, right?
>>
> There should not be any problem in using either UBIFS or JFFS2.

Please, clarify me with the last statement.

There should be no problem using JFFS2 or UBIFS with the patch that you=20
mention applied or even without the patch ?

With OMAP L138 are some complains about using the ubifs and subpage=20
access, even on uboot [1] so it don't appear to be only a linux [2] problem=
.

And if the problems appear on ubifs it should affect the jffs2.

[1] - http://lists.denx.de/pipermail/u-boot/2011-April/090072.html
[2] - http://comments.gmane.org/gmane.linux.davinci/23836



Sem o patch h=E1 problemas manifestados por v=E1rias pessoas ...

>
>
> [1] create_ubi_image.sh
> (this script used fixed folder name 'rootfs' as -r option)
>
> #!/bin/sh
> #----------------------------------------------------------------------
> # Description: generic script to create UBI image for NAND devices
> #		with different page sizes.
> #
> # Author: 	Pekon Gupta (pekon@ti.com)
> # Usage:	create_ubi_image.sh <PAGE_SIZE> <SUBPAGE_SIZE> \
> #						<PARTITION_SIZE>
> # History:
> # version 1.1	pekon
> #		added calculation of LEB_SIZE while using subpages
> #
> #----------------------------------------------------------------------
> #-- remove old files --
> rm -v ubi.ubifs  ubi.img ubinize.cfg
>
> #-- user inputs --
> PAGE_SIZE=3D$1
> SUBPAGE_SIZE=3D$2
> PARTITION_SIZE=3D$3
>
> if test -z $1 || test -z $2  || test -z $3
> then
> echo "Error: incomplete inputs"
> echo "Usage: create_ubi_image.sh <PAGE_SIZE> <SUBPAGE_SIZE> <PARTITION_SI=
ZE>"
> exit
> fi
>
>
> #-- calculate UBI parameter --
> PEB_SIZE=3D$(( 64 * $PAGE_SIZE ))
>
> # LEB size =3D	PEB_SIZE - number_of_pages_used_for_UBI_headers * PAGE_SIZ=
E
> #		number_of_pages_used_for_UBI_header =3D 1 if using sub-pages
> #		number_of_pages_used_for_UBI_header =3D 2 if not using sub-pages
> if test $PAGE_SIZE -ne $SUBPAGE_SIZE
> then
> 	LEB_SIZE=3D$(( $PEB_SIZE - ( 1 * $PAGE_SIZE )))
> else
> 	LEB_SIZE=3D$(( $PEB_SIZE - ( 2 * $PAGE_SIZE )))
> fi
>
> LEB_COUNT=3D$(( $PARTITION_SIZE / $LEB_SIZE ))
>
> echo "LOG: PAGE_SIZE	=3D	$PAGE_SIZE"
> echo "LOG: SUBPAGE_SIZE	=3D	$SUBPAGE_SIZE"
> echo "LOG: PEB_SIZE	=3D	$PEB_SIZE"
> echo "LOG: LEB_SIZE	=3D	$LEB_SIZE"
> echo "LOG: LEB_COUNT	=3D	$LEB_COUNT"
>
>
> #-- generate ubinize.cfg --
> echo "[ubifs]"                	>> ubinize.cfg
> echo "mode=3Dubi"               	>> ubinize.cfg
> echo "image=3Dubi.ubifs"        	>> ubinize.cfg
> echo "vol_id=3D0"               	>> ubinize.cfg
> echo "vol_size=3D$PARTITION_SIZE"	>> ubinize.cfg
> echo "vol_type=3Ddynamic"       	>> ubinize.cfg
> echo "vol_name=3Dtest"         	>> ubinize.cfg
> echo "vol_flags=3D'autoresize'" 	>> ubinize.cfg
> echo "vol_alignment=3D1"        	>> ubinize.cfg
>
> #-- generate UBI image --
> mkfs.ubifs  -o ubi.ubifs  -m $PAGE_SIZE  -e $LEB_SIZE  -c $LEB_COUNT  -r =
rootfs
> ubinize     -o ubi.img    -m $PAGE_SIZE  -p $PEB_SIZE  -s $SUBPAGE_SIZE  =
-O $SUBPAGE_SIZE  -v  ubinize.cfg
> # ---------------------------------------------
>
