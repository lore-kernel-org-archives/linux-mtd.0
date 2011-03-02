Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PuiJ9-000229-3I
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 09:25:23 +0000
Received: by pzk7 with SMTP id 7so1060389pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Mar 2011 01:25:20 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 2 Mar 2011 10:25:20 +0100
Message-ID: <AANLkTime=pOiKBaw4sP9jZsRzOSso09jfz1qHmnGwKbL@mail.gmail.com>
Subject: Hang in mlockall() when using JFFS2 blocks having CRC errors
From: thommy <thommy.nice@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From time to time my JFFS2 file system under 2.6.24.7-rt27
seems to hang the system in a live lock.

Situation:
=A0* immediately after boot an executable is started which calls mlockall()
   to commit all pages into RAM (this is a real time application)
=A0* the executable is read from a JFFS2 file system on NOR flash
=A0* mlockall() never terminates
=A0* console output is 'Data CRC f7e8ddd1 !=3D calculated CRC 47cee9c9
   for node at 00edc5cc' in an endless loop

My investigations are so far:
=A0* during boot some log output is written into a log file on the JFFS2
   that manipulates the file system --> no read only mount possible
=A0* the system is switched off at arbitrary times without clean unmount
   --> this clearly may leave behind blocks with data CRC errors
=A0* due to some reorganization (garbage collector?) my executable file
   data is moved across the flash
=A0* if such a move takes place exactly during power off two data frags
   carrying a portion of my executable file data are left behind, one "old"
   and correct frag and one "new" and incomplete frag with CRC error
=A0* during next boot mlockall() tries to read in all pages from the
   executable and fails on this point of CRC error

My questions:
=A0* is this a known behavior?
=A0* why is the fragment which has the CRC error relevant although
   the old and correct fragment is still in place?
=A0* are there relevant fixes in newer kernel versions which I should
   use? (I cannot update the kernel, but I may apply a patch)

Thanks a lot in advance!
Thommy
