Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FdcF-0000b4-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 16:22:00 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954F3@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: JFFS2: INCOMPAT inode types
Date: Thu, 28 Jun 2001 11:21:23 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi all,

	I am running intense test case on a chip driver I wrote and on
JFFS2.  I came up with the error print below.  The test case I am =
running is
quite simple: I fill the flash with files, delete them and fill all =
over
again.  The message below come out during file deletion ( rm * ). =20

	Sector at offset 1C0000 has been proved to be completely erased.
	Unknown INCOMPAT nodetype C002 at 0008F610
	CRC failed for read_inode of inode 4124 at physical location 0x70fd4
	Eep. read_inode() failed for ino #4124

Does anyone have a clue about it?

Thanks!

Fr=E9d=E9ric Giasson
