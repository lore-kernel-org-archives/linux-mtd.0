Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Cg74-0002G2-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 May 2002 13:30:06 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF72@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Append does not return error on full disks
Date: Tue, 28 May 2002 08:30:03 -0400
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

	I have observed that jffs2 nevers returns a 'disk full' error when
an application appends data to an existing file.  I have setup a test =
which
opens an existing file for appending, and fwrite() data to it until =
fwrite()
returns error.
My test never stopped!  So when I manually stoppped it, the file system =
was
corrupted.  I was unable to unmount it, and neither I could remount it =
after
reboot.  I have setup a second test which is a script instead of being =
a
program, using the append '>>' command.  Same results.=20

	During my test, I did'nt open the file with OSYNC flag though, maybe
it could patch the problem.  I will try it.
Nevertheless, it shouldn't happen that a process be able to append data
indefinitely to a file without ever getting an error when the disk =
becomes
full.

	Does anyone have a clue about it?  Maybe there is a bug somewhere
down in the jffs2_reserve_space() function?

Fr=E9d=E9ric Giasson
