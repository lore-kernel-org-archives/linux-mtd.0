Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172WvX-0000HZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 13:40:15 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECEDE@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Endless gc spining on nearly full JFFS2 fs
Date: Tue, 30 Apr 2002 08:40:02 -0400
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

Hi,
=20
    I have noticed that the gc sometimes seems to spin-around for a =
very
long time, if not endlessly, when files are copied to a nearly full =
JFFS2
drive. =20

	For example, I have done some tests copying a huge, uncompressable
file whose size is a little less than the total space left on a jffs2 =
drive.
When I copy the file on an empty, freshly-mounted file system, the "cp"
command returns after a normal time.  But if I erase the file and try =
to
copy it back, the gc seems to spin-around, erasing the same sectors =
many
times.  I have put traces in my chip driver which shown that the same
sectors are erased many times during the process.

	I have done the same test with a set of smaller files (5 binary
executable files ranging from 300 KB to 1.7MB).  I let the test running
overnight and when I returned the next morning, it had completed after =
more
than 5 hours!  With this set of files, my JFFS2 drive is 91% used.

	I am using kernel 2.4.19 pre-7 and JFFS2 code included in this
version.  I have a 4MB AMD flash device, from which I withdraw 2 =
sectors
(128KB) for my boot loader and stuff, using a map driver.  This leaves
4063232 bytes for the JFFS2 drive.


Is it normal according to what JFFS2 has been designed for?  Does =
someone
else have ran similar tests with large files and obtained same results? =
  Is
there a way to avoid that?
=20
Thanks,
=20
Fr=E9d=E9ric Giasson
