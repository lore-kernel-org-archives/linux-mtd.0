Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PkLV-0005LN-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Jul 2002 14:39:02 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECFE4@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: linux-mtd@lists.infradead.org
Subject: Memory leak problem with JFFS2
Date: Wed, 3 Jul 2002 09:38:54 -0400 
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

I discovered what looks like a memory leak in JFFS2.
I setup a test in which a script does the following operations in =
order:
	1- mount JFFS2;
	2- sync;
	3- Erase linux kernel file from JFFS2;=20
	4- sync;=09
	5- Copy a new file to JFFS2 partition ( gzip-compressed linux kernel
)
	6- sync;
	7- umount JFFS2;
	8- vmstat;
	9- Goto step 1.

After numerous loops of this test script (between 110 and 470, it is =
never
the same), the system hangs at mount command.  Looking at the log, each =
time
vmstat is called I observe that free memory has gone down 8KB after =
each
loop of the script.  This is very likely to mean that there is a memory =
leak
related to JFFS2's memory usage ( free/dirty/very dirty lists and so =
forth
maybe ).  I did not dig into the code yet, I though that maybe someone =
else
encountered the problem and had already investigated it.

So a setup a second test script which is:

	1- mount JFFS2;
	2- sync;
	3- umount JFFS2;
	4- vmstat;
	5- goto step 1;

And I observed that free memory was going down 8KB each loop, same as =
in
first test. =20

So to confirm that the leak comes from the fact of doing repeated
mount/umount, I setup a third test which is exactly like the first =
test,
except that I removed mount and umount commands. That time free memory =
usage
remained constant, which make me think that the leak is probably =
related to
memory incorrectly freed at umount time.  Nevertheless, the third test =
also
hanged, after 170 loops, at copy command.	=09

Between, note that the sync command sprinkled in the test loops are =
there to
speed up the process.  In fact, I observed that doing a sync after a =
file
erasure triggers the gc and wait for it to complete its task, so when I
write data to JFFS2 after it does not need to garbage collect in the =
mean
time.  This makes write times to JFFS2 much more deterministic.

I am using linux kernel 2.4.19 pre 7, and JFFS2 code from CVS as per =
May
14th, 2002.  By the way, does anybody can tell me if there is some =
sorts of
branches or labels in JFFS2 CVS, other that time stamps?  Is there a =
label
per linux release, for instance?

Thanks in advance,

Fr=E9d=E9ric Giasson

	=20
