Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHc9h-00038a-NE
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:39:22 +0000
From: Marek Vasut <marex@denx.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
Date: Mon, 18 Mar 2013 16:39:18 +0100
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <5147334C.3040505@parrot.com>
In-Reply-To: <5147334C.3040505@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201303181639.18602.marex@denx.de>
Cc: Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Matthieu CASTET,

> Brian Norris a =E9crit :
> > Traditionally, the command set used by SPI flash only supported a 3-byte
> > address. However, large SPI flash (>=3D 32MB, or 256Mbit) require 4 byt=
es
> > to address the entire flash. Most manufacturers have supplied a mode
> > switch (via a "bank register writer", or a "enable 4-byte mode"
> > command), which tells the flash to expect 4 address cycles from now on,
> > instead of 3. This mode remains until power is cut, the reset line is
> > triggered (on packages where present), or a command is sent to reset the
> > flash or to reset the 3-byte addressing mode.
> >=20
> > As an alternative, some flash manufacturers have developed a new command
> > set that accept a full 4-byte address. They can be used orthogonally to
> > any of the modes; that is, they can be used when the flash is in either
> > 3-byte or 4-byte address mode.
> >=20
> > Now, there are a number of reasons why the "stateful" 4-byte address
> > mode switch may not be acceptable. For instance, some SoC's perform a
> > dumb boot sequence in which they only send 3-byte read commands to the
> > flash. However, if an unexpected reset occurs, the flash chip cannot be
> > guaranteed to return to its 3-byte mode. Thus, the SoC controller and
> > flash will not understand each other.
>=20
> What's funny is the other side work :
>=20
> you can have a ROM that use 4-byte mode with 3-byte or 2-byte device as
> soon as the read command is the same. [1]

Well, all of these are crap design. The SPI flash shall be power-cycled if =
the=20
platform reboots no matter what exactly to prevent having it in undefined s=
tate.

Best regards,
Marek Vasut
