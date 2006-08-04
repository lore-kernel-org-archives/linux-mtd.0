Received: from outsmtp.i-o.com ([63.85.34.2] helo=barracuda.i-o.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G93uv-0004LC-Mu
	for linux-mtd@lists.infradead.org; Fri, 04 Aug 2006 13:57:09 -0400
Received: from staf-exfe-mail.i-o.com (unknown [10.50.10.14])
	by barracuda.i-o.com (Spam Firewall) with ESMTP id 6876DD0DF186
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Aug 2006 12:57:02 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: 8gig multiCell nand parts
Date: Fri, 4 Aug 2006 12:57:32 -0500
Message-ID: <20CD42856DE21B48BC209EC1CBA00FB902B41976@STAFEXVS03.ioinc.ioroot.tld>
From: "Kevin Bradway" <Kevin.Bradway@i-o.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I need help trying to get 8/16 gig multicell (mlc) Micron/Samsung parts
working properly.  I am using JFFS2.

Both cells are always getting written??  They are duplicated.
I have 4 partitions=20
Starting at offset 0 and then using the MTDPART_OFS_APPEND with size
0x10000000.

The mlc parts require 2 CE#'s. One for each cell.

I have used the "number of chips" in the option of the nand driver.
This shows that the proper chip select is being selected but both cells
still get written too. =20

I have verified that the right chip select is set when the page address
rolls past the page mask.

I have verified the PLD addressing.

Any ideas would be helpful.

This email and any files transmitted with it are confidential and are =
intended solely for the use of the individual or entity to whom they are =
addressed.  If you are not the original recipient or the person =
responsible for delivering the email to the intended recipient, be =
advised that you have received this email in error, and that any use, =
dissemination, forwarding, printing, or copying of this email is =
strictly prohibited. If you received this email in error, please =
immediately notify the sender and delete the original.
