Received: from webmail.mediatrix.com ([66.129.134.11] helo=mail.mediatrix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M8q6-0007sM-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 14:55:11 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995552@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Cc: Jean-Denis Boyer <jdboyer@mediatrix.com>
Subject: JFFS2  Stability problem!
Date: Mon, 16 Jul 2001 09:54:06 -0400
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

	I found a stability problem that looks like a flash space leak while
running intense test case with JFFS2.  Someone else with a diffenrent
platform with different flash driver at a different company told me he
encountered the same problem, so I think am not dreaming.  Here is what =
I do
and a description of the problem:

1- I erase my flash.
2- I mount JFFS2.  The empty file system reports a 22% disk usage when =
I
call "df" system command.
3- I start a script that does the following loop:
	a. Copy many files of various size and types to JFFS2 file system
using "cp" command.
	b. Call "df" system command after the transfer of the files.  After
the first transfer is completed, it reports a 88% 	   disk usage.
	c. Call "rm" command to erase all files on JFFS2 file system.

	The set of files copyied is always the same.  Logging the output of
my terminal, I noticed that after about 200 loops, the disk usage at =
step
3-b begins to grow slowly.  After about 500 loops, the disk usage as =
grown
so much that there is no longer enough room on the file system to store =
all
the same files that at first took 88% disk usage.  When my test case =
script
cannot copy all files, it stops.

	After the test case failure, I manually erased all files (using "rm"
again).  Then, calling "df" I got a 30% disk usage.  I ran the test =
case
many times on different machines (of the same types, though), and I =
obtained
the same failure after about the same number of test case loops.

Description of my platform:

Embedded MPC860T
2MB Atmel AT49BV16x4 single flash memory chip
16MB RAM
Linux Kernel 2.4.4

	Since my flash chip was not supported by MTD, I wrote my own driver
but I doubt greatly that the problem could come from it.  I tested it =
not
using JFFS2 and I did not get any error.  As I said, another developper =
ran
my test case and got the same problem and he have a different system =
with
differents drivers.

	Could it be a garbage collector problem?  Anyone who have a clue
about it is welcome to tell me even the slightyiest details, since =
resolving
this problem is very important to me.



Fr=E9d=E9ric Giasson
