Received: from bart.se.axis.com ([193.13.178.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1II2pI-0006at-Si
	for linux-mtd@lists.infradead.org; Mon, 06 Aug 2007 09:40:55 -0400
Received: from bart.se.axis.com (bart.se.axis.com [127.0.0.1])
	by bart.se.axis.com (Postfix) with ESMTP id 0E9EE63FFC
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Aug 2007 15:40:46 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by bart.se.axis.com (Postfix) with ESMTP id EF37E63FB1
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Aug 2007 15:40:45 +0200 (CEST)
Date: Mon, 6 Aug 2007 15:41:08 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
In-Reply-To: <EA3F0F32C26AA132D54202A0@franken3>
Message-ID: <Pine.LNX.4.64.0708061538220.9729@lnxricardw.se.axis.com>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
	<1178718379.11554.34.camel@localhost.localdomain>
	<AFDBC52C05E4EA53B68C61AD@franken3>
	<1178781348.11554.52.camel@localhost.localdomain>
	<20070510102703.04a398ee@dhcp-252-105.norway.atmel.com>
	<EA3F0F32C26AA132D54202A0@franken3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 10 May 2007, Michael K=F6nig wrote:

>> So if you have the patch available, now would probably be a good time
>> to post it ;-)
>
> Unfortunately I don't have any experience with GIT and also don't have th=
e=20
> time to set it up right now, but I'm attaching a "diff -p" for the change=
s to=20
> the latest cfi_cmdset_0002.c in the repository.

This was a long time ago, is there any reason the supplied patch was never=
=20
committed?

/Ricard

(for reference, since it was a while ago, the patch follows below)

--------------8<------------------

From=20Michael.Koenig@ipcas.de Thu May 10 10:44:49 2007
Date: Thu, 10 May 2007 10:42:53 +0200
From: "[UTF-8] Michael K=F6nig" <Michael.Koenig@ipcas.de>
To: dev-etrax@axis.com
Subject: Atmel Flash Fix: cfi_cmdset_0002.c (was: MTD problems)

     [ The following text is in the "utf-8" character set. ]
     [ Your display is set for the "ISO-8859-1" character set.  ]
     [ Some characters may be displayed incorrectly. ]

Hello again,

with the help of Hans-Christian Egtvedt from Atmel (thanks!) I was able to
track down my issues with the Atmel Flash.

On Atmel Flashes the do_write_buffer() function is not supposed to be
called, and it seems that some patches to make sure of that weren't applied
to the code in the Linux kernel GIT.

The following changes have to be applied to this file:
drivers/mtd/chips/cfi_cmdset_0002.c


Two lines (not counting the comment) are added to fixup_convert_atmel_pri()=
:

static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
{
 =09struct map_info *map =3D mtd->priv;
 =09struct cfi_private *cfi =3D map->fldrv_priv;
 =09struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;
 =09struct cfi_pri_atmel atmel_pri;

 =09memcpy(&atmel_pri, extp, sizeof(atmel_pri));
 =09memset((char *)extp + 5, 0, sizeof(*extp) - 5);

 =09if (atmel_pri.Features & 0x02)
 =09=09extp->EraseSuspend =3D 2;

 =09if (atmel_pri.BottomBoot)
 =09=09extp->TopBottom =3D 2;
 =09else
 =09=09extp->TopBottom =3D 3;

 =09/* burst write mode not supported */
 =09cfi->cfiq->BufWriteTimeoutTyp =3D 0;
 =09cfi->cfiq->BufWriteTimeoutMax =3D 0;
}


In the cfi_fixup_table[] "fixup_convert_atmel_pri" has to appear before
"fixup_use_write_buffers":

static struct cfi_fixup cfi_fixup_table[] =3D {
#ifdef AMD_BOOTLOC_BUG
 =09{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
#endif
 =09{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_AMD, 0x0055, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },
 =09{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
#if !FORCE_WORD_WRITE
 =09{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
#endif
 =09{ 0, 0, NULL, NULL }
};


Now Atmel Flash chips should work correctly with the latest SDK, at least m=
y
AT49BV642D does.

--=20
Mit freundlichen Gr=FC=DFen
Best regards
Michael K=F6nig

-------------8<---------

--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
