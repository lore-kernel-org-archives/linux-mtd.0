Received: from mail3.raymarine.com ([213.206.137.1]
	helo=RMUKMAIL.raymarine.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAOAZ-0006wu-Pe
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 12:28:00 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Mounting UBIFS fails intermittently
Date: Wed, 10 Dec 2008 12:27:49 -0000
Message-ID: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
From: "Manish Jain" <Manish.Jain@raymarine.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

In our system , we have created two partition in Nand flash. One is =
mounted as root and the other(which is quite big)is mounted for keeping =
data.
The problem is that data mount fails intermittently.

Here is the kernel error log, when we try to mount ubifs.

 error (pid 303): ubifs_scan: corrupt empty space at LEB 1:4160
UBIFS error (pid 303): ubifs_scanned_corruption: corrupted data at LEB =
1:4160
00000000: 49269565 00000000 49269553 00000000 00000000 00000000 00000000 =
00000002  e.&I....S.&I....................
00000020: 00000000 00000000 000041fd 00000000 00000000 00000000 00000000 =
00000000  .........A......................
00000040: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000  ................................
00000060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
00000080: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
 ...
 ...
00000fa0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
00000fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
00000fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
ffffffff  ................................
UBIFS error (pid 303): ubifs_scan: LEB 1 scanning failed
UBIFS error (pid 303): ubifs_recover_master_node: failed to recover =
master node

Kind Regards,
Manish
Reply
