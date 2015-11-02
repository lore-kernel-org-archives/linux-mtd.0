From: Anup Patel <anup.patel@broadcom.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Linux MTD
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar
 Gala" <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "Pramod
 Kumar" <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>, Linux ARM Kernel
 <linux-arm-kernel@lists.infradead.org>, Device Tree
 <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Subject: RE: [PATCH v5 2/3] mtd: brcmnand: Force 8bit mode before doing
 nand_scan_ident()
Date: Mon, 2 Nov 2015 17:06:08 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7B063F0@SJEXCHMB10.corp.ad.broadcom.com>
References: <1446188361-15146-1-git-send-email-anup.patel@broadcom.com>
 <1446188361-15146-3-git-send-email-anup.patel@broadcom.com>
 <20151030194744.GJ13239@google.com>
In-Reply-To: <20151030194744.GJ13239@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: 31 October 2015 01:18
> To: Anup Patel
> Cc: David Woodhouse; Linux MTD; Rob Herring; Pawel Moll; Mark Rutland;
> Catalin Marinas; Will Deacon; Sudeep Holla; Ian Campbell; Kumar Gala; Ray=
 Jui;
> Scott Branden; Florian Fainelli; Pramod Kumar; Vikram Prakash; Sandeep
> Tripathy; Linux ARM Kernel; Device Tree; Linux Kernel; bcm-kernel-feedbac=
k-list
> Subject: Re: [PATCH v5 2/3] mtd: brcmnand: Force 8bit mode before doing
> nand_scan_ident()
>=20
> On Fri, Oct 30, 2015 at 12:29:20PM +0530, Anup Patel wrote:
> > Just like other NAND controllers,
>=20
> ^^ That part isn't strictly true. While READ ID data only comes out on th=
e lower 8
> bits, that doesn't *actually* mean you can't get valid data from a 16-bit=
 bus in
> general; you just have to drop the upper 8 bits. That's what these two co=
mmits
> did for read ID and parameter page read commands:
>=20
> commit 3dad2344e92c6e1aeae42df1c4824f307c51bcc7
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Wed Jan 29 14:08:12 2014 -0800
>=20
>     mtd: nand: force NAND_CMD_READID onto 8-bit bus
>=20
> commit bd9c6e99b58255b9de1982711ac9487c9a2f18be
> Author: Brian Norris <computersforpeace@gmail.com>
> Date:   Fri Nov 29 22:04:28 2013 -0800
>=20
>     mtd: nand: don't use read_buf for 8-bit ONFI transfers
>=20
> > the NAND READID command only works
> > in 8bit mode for all versions of BRCMNAND controller.
>=20
> But I presume *this* statement is actually true. This NAND controller doe=
sn't
> exactly give us a fully-flexible READID / read_byte / read_word command, =
as it
> works at a higher level than that (although LOW_LEVEL_OP gives us this
> flexibility now). I could imagine (though I never tested 16-bit NAND) tha=
t 16-bit
> READID is broken.
>=20
> BTW, did you ask the HW designer about this? It'd be nice to be 100% sure=
.

Yes, we had a discussed with HW designers and they confirmed
that READID command will only work in 8bit mode.

Regards,
Anup
