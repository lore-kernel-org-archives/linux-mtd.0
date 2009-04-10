Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsHhF-0001SM-JJ
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 14:27:16 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Fri, 10 Apr 2009 08:27:04 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239366310.3390.9.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>,
	<linux-mtd@lists.infradead.org>
Cc: Urs Muff <urs_muff@trimble.com>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Mon, 2009-03-30 at 13:00 -0600, Eric Holmberg wrote:
> > Here is a basic summary of my findings to date for debugging=20
> > corruption of the root UBIFS volume which is located on NOR flash. =20
> > Please comment if you have any suggestions.
> >=20
>=20
> Hi, any news? Have you tried to enable UBI/UBIFS extra checks?

Hi Artem,

I have enabled the extra checks and the failure messages and they didn't
provide any additional information.  Since we have custom hardware, I
wrote some software that writes test patterns to the flash in U-Boot to
verify that we do not have an underlying problem with the NOR flash.
The software writes a test pattern to each physical erase block (PEB)
and then randomly erases and rewrites a sector with the test pattern
AA55AA## where ## is the block number.  A script then performs a
hardware reset of the processor and flash using JTAG.  All physical
sectors are verified after the erase and again after the write.

I did not see any issues where multiple PEB's were corrupted, but the
block being written or erased had some unexpected patterns when the
flash was reset during the middle of an operation.

Test setup:
 * Using U-Boot 1.3.0
 * Write buffering enabled
 * S29GL256F 256Mbit NOR flash w/ 32-word write buffer
 * Test software that performs read/erase/write operations
 * JTAG debugger that randomly resets the board

Reset during write (unexpected test pattern written after un-programmed
values):

30352240  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
30352280  ffffffff ffffffff ffffffff ffffffff
30352290  ffffffff ffffffff ffffffff ffffffff
303522a0  ffffffff ffffffff ffffffff ffffffff
303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
303522c0  ffffffff ffffffff ffffffff ffffffff
303522d0  ffffffff ffffffff ffffffff ffffffff
303522e0  ffffffff ffffffff ffffffff ffffffff

Reset during erase (unexpected - 1's change to zeros during erase):

30249930  aa55aa02 aa55aa02 aa55aa02 aa55aa02
30249940  aa55aa02 aa55aa02 aa55aa02 aa55aa02
30249950  8a51aa02 aa55aa02 a855aa02 aa55aa02
30249960  00000000 00000000 00000000 00000000
30249970  00000000 00000000 00000000 00000000
30249980  00000000 00000000 00000000 00000000
30249990  00000000 00000000 00000000 00000000
302499a0  00000000 00000000 00000000 80000000
302499b0  02000001 00000000 00000000 00000000
302499c0  00040000 00000000 00000000 80000000

Reset during erase (expected erase behavior - 0 not yet changed to 1):
30248ed0  ffffffff ffffffff ffffffff ffffffff
30248ee0  ffffffef ffffffff ffffffff ffffffff
30248ef0  ffffffff ffffffff ffffffff ffffffff


Questions
---------
How are interrupted writes or erase cycles handled in UBI / UBIFS for
NOR flash?  Are the unexpected PEB values that I am seeing properly
handled by the UBI/UBIFS error recovery process?  Are erase and write
operations journaled to allow restarting the process upon boot-up?

As a side note, MTD_BIT_WRITEABLE is not set for the NOR flash.  Is this
to be expected?  Do I need to set this in the partition table?  The NOR
flash does support programming a 1 to a 0, which is what I'm assuming
MTD_BIT_WRITEABLE means.

root@device:/# mtd_debug info /dev/mtd3
mtd.type =3D MTD_NORFLASH
mtd.flags =3D MTD_CAP_NORFLASH
mtd.size =3D 29360128 (28M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 1
mtd.oobsize =3D 0
regions =3D 0

Thanks for your help and time!

Regards,

Eric Holmberg
