Received: from [203.177.23.162] (helo=eazix-win2ks0.eazix.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DatRt-00083D-IV
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 06:49:19 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 May 2005 18:52:05 +0800
Message-ID: <E02DDFEE79372340B35395EDE51EFAEE33E0DE@eazix-win2ks0.eazix.com>
From: "Ina Miranda" <celina.miranda@eazix.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS on DoC Millenium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

We're using an MX1-based board with 32MB DoC Millenium Plus using Linux =
2.4.20.=20

We've successfully mounted the disk using ext2. We want to use JFFS and =
ext2, however, for our final system. When we try to mount =
/dev/mtdblock/0 as jffs we encounter a flash_safe_read() error. It seems =
that jffs tries to read 4k chunk of data but the read() of DoCMP driver =
only permits 512-byte read.

To summarize:
1. Is JFFS for DoCMP readily supported in Linux 2.4.20? Or do we have to =
do some tweaking for our system?
2. How can we partition DoCMP so that one partition supports JFFS and =
the other partition supports ext2?

Thanks,
Ina


=20

--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.322 / Virus Database: 266.11.15 - Release Date: 5/22/2005
=20

This email message (including attachments, if any) is intended for the =
use of the individual or entity to which it is addressed and may contain =
information that is privileged, proprietary and confidential. If you are =
not the intended recipient, you are notified that any dissemination, =
distribution or copying of this communication is strictly prohibited.  =
If you have received this communication in error, please notify the =
sender and erase this e-mail message immediately.
