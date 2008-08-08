Received: from an-out-0708.google.com ([209.85.132.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KRWg7-00022q-Qk
	for linux-mtd@lists.infradead.org; Fri, 08 Aug 2008 18:27:08 +0000
Received: by an-out-0708.google.com with SMTP id c24so172546ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Aug 2008 11:27:05 -0700 (PDT)
Subject: U-Boot and UBI
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: u-boot@lists.denx.de, linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 08 Aug 2008 14:26:56 -0400
Message-Id: <1218220016.2328.109.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: Josh Boyer <jwboyer@gmail.com>
Cc: arnez@de.ibm.com, haver@vnet.ibm.com
Reply-To: jwboyer@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

As has been stated before by various people, IBM has added some form of
UBI support to an older version of U-Boot.  While we would love to be
able to forward port this to the latest version of U-Boot, we have
simply not found the time and don't see that being the case in the near
future.

So as an alternative, I have cleaned up the code slightly and pushed out
a version that applies to U-Boot 1.1.6.  This way there is at least some
form of code release that people can use as a reference.  I am not
pushing this for inclusion into the current U-Boot, as we are well aware
of the need for further adaptation and cleanup.

A few caveats:

- This is a quick forward port from a patched 1.1.4 tree to 1.1.6.  It
compiles for the example board (PowerPC 440EP Bamboo), but that example
code may not actually work due to the differences in how flash was read
between the code bases.  When moving to a newer U-Boot, I highly
recommend using the generic MTD interfaces.

- There might be slight differences in the UBI format that this code
base supports and what is in the upstream Linux kernel.  Comparison of
the data structures in the current kernel would be advised if you are
forward porting.

- There is no write support for UBI in this port.

- The interfaces have two methods of getting scan information.  The
first is having a bit of code that runs before U-Boot do the scan and
pass it.  The second is to have a user/script use the "ubiscan" command
to have U-Boot manually perform the scan itself.  The latter method is
likely more flexible for new boards.

All of that being said, we hope this code is useful as a guide.  I will
certainly answer questions as I can.  If for some unknown reason I find
a massive amount of spare time, I might even try to forward port it, but
that seems unlikely these days.

I would like to thank Frank Haverkamp, Thomas Gleixner, Andreas Arnez,
and Artem Bityutskiy for their work on UBI and the majority of the
U-Boot code we have.

The git tree can be found here:

git fetch git://git.infradead.org/users/jwboyer/u-boot.git ubi

http://git.infradead.org/users/jwboyer/u-boot.git?a=shortlog;h=refs/heads/ubi

josh
