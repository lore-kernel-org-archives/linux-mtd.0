Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOl3V-0001Rz-FA
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 09:06:46 +0000
Message-ID: <5242A805.50804@freescale.com>
Date: Wed, 25 Sep 2013 17:08:21 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
References: <522062B4.4080709@digi.com> <201309241150.09313.marex@denx.de>
 <52416D88.6030906@freescale.com> <201309241453.47069.marex@denx.de>
In-Reply-To: <201309241453.47069.marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 Hector Palacios <hector.palacios@digi.com>, linux-mtd@lists.infradead.org,
 dzu@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 20:53, Marek Vasut =E5=86=99=
=E9=81=93:
> Hello Huang,
>
>> =E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 17:50, Marek Vasut =E5=86=
=99=E9=81=93:
>>> Hello Huang,
>>>
>>> Can you please explain what is the exact difference between the NAND
>>> layout when using JFFS2 in FSL 2.6.35 and in mainline with your patch=
es
>>> ?
>> In FSL 2.6.35, there are some free space in the OOB;
>> while in mainline we use all the free space in the OOB.
> OK, let me understand this in more detail.
>
> How does the NAND page look when written by FSL 2.6.35 and how does the=
 NAND
> page look when written by current mainline ? Can you please tell in det=
ail?
>
[1] for FSL 2.6.35, see gpmi_nfc_set_geometry():
     The ecc_strength is set at a fix value, such as:
           "set ecc_strength with 8 for page size 2048";

     Why set the ecc_strength with 8? just based on the experiences, not=20
based on the
     chip's datasheets.

     So we can have some spare space in the OOB, after we setting the=20
BCH with the ecc_strength.

[2] for mainline, see common_nfc_set_geometry():
     Please see the diagrams in the set_geometry_by_ecc_info() and=20
legacy_set_geometry().


     If we CAN use the ecc info from the chip's datasheet, just like in=20
FSL_2.6.35, we may
     have some spare space in the OOB; else we use all the OOB.



>>> Is there any way to mount JFFS2 written with FSL 2.6.35 on current
>>> mainline? Thus far, neither me nor Hector were able to mount such
>>> partition with the same result.
>> The gpmi driver in FSL 2.6.35 is different from the mainline.
> I was under the impression the mainline driver is an evolution of the F=
SL 2.6.35
> driver. Is this assumption incorrect?
>
yes.
>> The two drivers are not compatible to each other.
> OK, like I said, if we cannot produce a drop-in replacement of old FSL =
2.6.35
> kernel, this is a problem. People will come and they will be running in=
to this
> issue. Thus, let us focus on producing a compatible JFFS2 patch.
I do not think it is a problem. The FSL 2.6.35 does not support the JFFS2=
.


thanks
Huang Shijie
