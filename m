Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2a5-0003tm-TH
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:12:42 +0000
From: "Scott Branden" <sbranden@broadcom.com>
To: "Artem Bityutskiy" <dedekind@infradead.org>,
	"Leo (Hao) Chen" <leochen@broadcom.com>
Date: Sun, 9 Aug 2009 00:12:24 -0700
Subject: RE: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi
	nand driver support
Message-ID: <9383297B60843144AC17878B479520F1109ECFC740@SJEXCHCCR01.corp.ad.broadcom.com>
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>
	<1247980139.11353.194.camel@localhost.localdomain>
	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CCA@SJEXCHCCR02.corp.ad.broadcom.com>
	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CDD@SJEXCHCCR02.corp.ad.broadcom.com>,
	<1249794985.9157.36.camel@localhost>
In-Reply-To: <1249794985.9157.36.camel@localhost>
Content-Language: en-CA
MIME-Version: 1.0
Content-Type: text/plain;
 charset=koi8-r
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for the comments.

This particular code (nand_bcm_umi.h) is shared between multiple OS's, simu=
lation environments, and non-OS's.  As you are aware, this alone presents m=
aintenance challenges.  The simplest approach was to make an include file a=
nd wrap that for each particular environment.  We will look at splitting th=
is into a C and H file.

The file passes Linux's checkpatch scripts.  I don't see a need for any fur=
ther requirement?  It would be sad if a particular linux maintainer was stu=
ck on other stylistic concerns because other maintainers are not.  Especial=
ly when this code is not specifically written for linux and is supported, t=
ested, and maintained by us.

Regards,
 Scott

________________________________________
From: Artem Bityutskiy [dedekind@infradead.org]
Sent: August 8, 2009 10:16 PM
To: Leo (Hao) Chen
Cc: linux-mtd@lists.infradead.org; linux-arm-kernel@lists.arm.linux.org.uk
Subject: RE: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi nand d=
river support

Hi,

On Tue, 2009-07-28 at 15:38 -0700, Leo (Hao) Chen wrote:
>  include/linux/mtd/nand_bcm_umi.h              |  241 ++++++++

It does not look like you need to have this header file in
include/linux/mtd/. Also, this file contains huge inline functions,
which is not nice. We are trying not to make functions longer than
1-2 lines inline and let the compiler do the decisions. Of course,
there are exceptions, but your 'nand_bcm_umi_bch_correct_page' does
not look like this. Could you please go through all your inlines and
un-inline non-few-liners?

Sorry, I do not have time to do any real review, but from the stylistic
POW you have too many
/*********************************************************************/
things, as well as ThisLovelyWindowsStyle naming, which we do not
appreciate very much in the Linux Kernel.

--
Best Regards,
Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)


-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php=
