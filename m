Received: from mail-qa0-f46.google.com ([209.85.216.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG9dP-0006Rh-MC
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 16:04:32 +0000
Received: by mail-qa0-f46.google.com with SMTP id k15so727917qaq.5
 for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2014 08:04:06 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 19 Feb 2014 13:04:03 -0300
Message-ID: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
Subject: Question about AM335x SoC supported NAND flash
From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
To: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 Daniel Mack <zonque@gmail.com>, Pekon Gupta <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

We're developing a custom AM335x-based board, which is meant to boot from N=
AND.

The flash device is a Micron MT29F8G08ABABA NAND. This device is ONFI-compl=
iant
and has 4 KiB page size, 512 KiB block size.

Accessing it from U-Boot and Linux works just fine, apparently in ECC BCH8 =
mode.

However, we cannot get the SoC to boot from NAND. We've double-checked
the hardware
and the SYSBOOT, but still no luck with it.

So, I thought about asking here, in case this device is (for some
reason) not supported by the
ROM code booting. Maybe someone already struggled with this and has
some idea to suggest?

Thanks!

PS: I'm sending this a to few developers I remember to have worked on this =
SoC.
Hope you don't mind!
--=20
Ezequiel Garc=EDa, VanguardiaSur
www.vanguardiasur.com.ar
