Received: from oe75.law10.hotmail.com ([64.4.14.210] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175a0v-0006YN-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 23:34:25 +0100
From: "Gregg C Levine" <mrspock1962@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Jedec probe for strange 28F800B3 chips (patch)
Date: Wed, 8 May 2002 18:34:04 -0400
Message-ID: <002201c1f6e0$75675ce0$3551580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1020891940.2172.32.camel@sycamore.mit.edu>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello from Gregg C Levine
Parts like that, are not uncommon, just darned annoying to fellow
designers. Suggest you call them, part-number-A, such as 28F800B3A. In
fact I suggest you examine the parts, to see what part number they have
stamped on them. I'd be surprised, if the thought never occurred to
Intel before.
-------------------
Gregg C Levine mrspock1962@hotmail.com
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of Colin Cross
> Sent: Wednesday, May 08, 2002 5:06 PM
> To: linux-mtd@lists.infradead.org
> Subject: Jedec probe for strange 28F800B3 chips (patch)
>=20
> I'm working on an embedded system that has two Flash chips labeled
> 28F800B3-10BD.  The Intel datasheets say they should have an
identifier
> of 0x8893 (which matches jedec_probe.c), but they report an identifier
> of 0x889D.  I found one errata datasheet that says the correct
> identifier for these chips is in fact 0x889D.  However, the block map
of
> this chip is completely different from the one described in the
> datasheets.  It has 1 16kB block, 2 8kB blocks, 1 96kB, and 7 128kB
> blocks.  This matches the block map for some other random Intel 8Mb
> flash chip, but I can't find any datasheets that give this block map
and
> identifier together.  I've added these chips to jedec_probe.c, and
they
> work fine once added, but I'm at a loss as to why these chips don't
> agree with the datasheets.  Can anyone offer any insight?  Does anyone
> have 28F800B3 chips that follow the datasheet?  I've attached a patch
> that adds support for them, but I'm not sure what to call them (Intel
> 28F800B3B version 2? for now).
