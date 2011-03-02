Received: from mail-px0-f177.google.com ([209.85.212.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Puijf-00029a-Te
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 09:52:48 +0000
Received: by pxi10 with SMTP id 10so1063142pxi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Mar 2011 01:52:45 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 2 Mar 2011 10:52:45 +0100
Message-ID: <AANLkTikR6SFj2myksqiNgf8ZDEKDOGbJgeVeUFMC8pYR@mail.gmail.com>
Subject: Hang in mlockall() when using JFFS2 blocks having CRC errors
From: thommy <thommy.nice@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, (sorry for the retry, something cut my message off)

>From time to time my JFFS2 file system under 2.6.24.7-rt27
seems to hang the system in a live lock.

Situation:
 * immediately after boot an executable is started which calls mlockall()
  to commit all pages into RAM (this is a real time application)
 * the executable is read from a JFFS2 file system on NOR flash
 * mlockall() never terminates
 * console output is 'Data CRC f7e8ddd1 != calculated CRC 47cee9c9
  for node at 00edc5cc' in an endless loop

My investigations are so far:
 * during boot some log output is written into a log file on the JFFS2
  that manipulates the file system --> no read only mount possible
 * the system is switched off at arbitrary times without clean unmount
  --> this clearly may leave behind blocks with data CRC errors
 * due to some reorganization (garbage collector?) my executable file
  data is moved across the flash
 * if such a move takes place exactly during power off two data frags
  carrying a portion of my executable file data are left behind, one "old"
  and correct frag and one "new" and incomplete frag with CRC error
 * during next boot mlockall() tries to read in all pages from the
  executable and fails on this point of CRC error

My questions:
 * is this a known behavior?
 * why is the fragment which has the CRC error relevant although
  the old and correct fragment is still in place?
 * are there relevant fixes in newer kernel versions which I should
  use? (I cannot update the kernel, but I may apply a patch)

Thanks a lot in advance!
Thommy
