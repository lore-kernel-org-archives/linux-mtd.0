Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtNo-0000oa-W1
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:05:30 -0400
Received: from [212.69.243.82] (helo=fusion-exch1.fusiondigitec.com)
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bhked-0007eG-TS
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 08:46:16 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Jul 2004 08:45:50 +0100
Message-ID: <BB129E289E6ADE45AD0BE2C36324971F028DE5@fusion-exch1.fusiondigitec.com>
From: "Reynolds-Lear, Matthew" <m.reynolds-lear@fusiondigitec.com>
To: <linux-mtd@lists.infradead.org>
Subject: Common Flash Interface probe code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
I've written a flash driver based on CFI.  It was going so well until I
needed to detect if a device was top or bottom boot.
=20
Basically, from looking at different manufacturer datasheets, I am
totally lost as to the correct approach to determining if a device is
top or bottom boot, and if the CFI device's geometry data is presented
in a different order depending if the device is top or bottom boot.=20
=20
As I see it, here are my issues:
=20
1) I could determine if a device is top or bottom boot by reading the
private vendor specific table in the CFI.  However, it seems that this
table is not standardised and each manufacturer has their own version of
it.  Because the CFI indicates what algorithm can be used to perform
operations on the device, you shouldn't have to check the device ID etc
to determine anything about it - thus the idea behind the CFI.  It seems
though that each manufacturer can put slightly different data in the
private table so to find out exactly you'd need to read it's
manufacturer ID.  When you've done this you might as well have done a
JEDEC probe!
=20
2) Some manufacturers (e.g. AMD) don't even indicate in their private
table if the device is top or bottom boot so how are users of the CFI
supposed to find out apart from fetching the ID and looking it up in
some sort of table (again, the CFI was intended to remove having to do
this)?
=20
3) From reading some datasheets, some devices present their device
geometry CFI data differently if the device is top or bottom boot.
Thing is, other datasheets indicate that some devices do not do this. =20
=20
Basically, I want to avoid having to read the device's ID to determine
if it is top or bottom boot and what its sector map is since this
involves keeping a flash driver look up table up to date and drop in
replacement of flash devices won't be possible without updating this
table.  It seems that some device's CFI data in the private table will
do this tell me if it is top or bottom boot but the format of the table
is completely specific to the manufacturer (so I'd have to check the
manufacturer ID anyway) but other device's CFI data doesn't provide this
information so how are we supposed to know?!
=20
I've seen a few postings related to this problem and can't find anything
'solid' which will assist.
=20
Can anyone help?  It's all a bit frustrating.
=20
Many thanks.
  Matt
--=20
