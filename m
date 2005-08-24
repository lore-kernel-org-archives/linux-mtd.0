Received: from wproxy.gmail.com ([64.233.184.203])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E84E6-0000eY-BX
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 19:00:16 -0400
Received: by wproxy.gmail.com with SMTP id i21so199488wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2005 16:00:06 -0700 (PDT)
Message-ID: <cc9bf44d050824160051965adb@mail.gmail.com>
Date: Thu, 25 Aug 2005 08:30:06 +0930
From: Paul Schulz <pschulz01@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Hardware design guide...
Reply-To: paul@mawsonlakes.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,
=20
 I am working closely with a hardware engineer to design an=20
 embedded I/O baord what will be connected to an ARM procesor
 board (CompuLab's ARMCore - uses PXA255).
=20
 The I/O board will have some Flash memory on it, and at this stage
 we are looking at either:
   E28F128 - Intel; or
   M29W320 - ST Thomson
=20
 Are there any resources/recommendations
/instructions on the best
 way to 'wire this up'? eg. A hardware design guide?
=20
   The MTD driver interface is very nicely modular (thanks everyone),
   and I want the hardware  to fit into this model. What should be =20
   avoided hardware wise, so that we can make best use of this API.
   (I don't want to have to hack source just because we made some=20
   assumption that doesn't hold..)
=20
   The current plan is to hook the chip onto the local and drive
   the control lines via a PLD controlled via a port addresses.=20
   eg. Chip enable,  VPEN(VPP),  and (more importantly) BusyBit.
=20
 Also, on a related note, I'm was looking through the MTD source code,=20
 trying to get a handle on the above questions, but couldn't find where
 the parameters for the chipsets were set... does such a thing exist?
=20
 Regards,
 Paul Schulz

ps. This email took 3 goes from my gmail account. Friends don't let friends
send HTMLemails. :-)
