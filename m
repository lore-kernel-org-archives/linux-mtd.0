Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJcsU-00062x-N7
 for linux-mtd@lists.infradead.org; Mon, 16 Apr 2012 03:45:23 +0000
Received: by yhjj52 with SMTP id j52so2507055yhj.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Apr 2012 20:45:19 -0700 (PDT)
MIME-Version: 1.0
From: John Williams <john.williams@petalogix.com>
Date: Mon, 16 Apr 2012 13:44:59 +1000
Message-ID: <CACPZLaXx3gHRZKxd=kD8rGUe5S4=Dc=NZhgbO1ND62w5FeaeqQ@mail.gmail.com>
Subject: QSPI support in MTD
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Michal Simek <michal.simek@petalogix.com>,
 Wendy Liang <wendy.liang@petalogix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are looking into adding support for QSPI flash devices in MTD.
It's easy enough to hack this up with roughly the following:
 1. query the device's support for QSPI (vendor/device specific)
 2. enable QSPI transfers on the device (vendor/device specific)
 3. query or hope that the parent SPI controller is itself QSPI-capable
 4. hope that the PCB is actually connected for QSPI
 5. if (1),(3) and (4) are all true, use QPAGE read/write commands for
data transfer (vendor/device specific - maybe).

There's an awful lot of vendor and device specificity there, and also
a little more 'hope' that I feel comfortable with.

In our research so far we've seen two different versions of (1) and
(2), from a sample size of 2.  The QPAGE data transfer commands
themselves are the same between these two devices, so I'm not sure how
much variability we are looking at there.

Point (4) probably must remain at the 'hope' level - if there's a
QSPI-capable controller connected to a QSPI-capable flash device, then
short a destructive test where we speculatively write then read back a
page using quad mode, I'm not sure how we can ever hope to know with
any certainty that the board is actually wired for QSPI operations.

You could maybe try a normal page read followed by a QSPI page read,
but in the case of an empty flash device I suspect you'd get all 0xFF
bytes in either case.

Before we dive too far down this particular rabbit hole I'd really
like to hear from anyone else who has looked into or attempted this.
Our thinking so far is:

 * extend the vendor/device table to capture info about how to query
and set QSPI support for each particular known flash device
 * add some property on the SPI controllers themselves regarding QSPI
support, and have this be queried by the flash driver

The sad thing is that the quick hack, non-portable version of this is
a trivial patch, which may be how vendors are doing this already.
However, doing it properly in a generic, runtime queried and managed
way is already feeling like pain.  I hope I'm wrong.

Thanks in advance for any contributions to the discussion.  Maybe
someone's solved this already and we've just plain missed it.

Regards,

John
--=20
John Williams, PhD, B. Eng, B. IT
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com=A0=A0p: +61-7-30090663=A0 f: +61-7-30090663
