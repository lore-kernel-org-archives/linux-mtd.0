Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gno0-0007DR-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Sep 2001 14:42:24 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4DD0DB2D@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'simon gittins' <simon__gittins@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 speed question
Date: Tue, 11 Sep 2001 09:40:10 -0400
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

I have noticed such a problem and began to address it bug I lacked of =
time
and I have been moved on another project. =20

When I copyied large files under the same conditions you described, I
experienced quite some lag. But what really appeared to me to be a =
serious
problem is the following: When I copy a large file to JFFS2 ( which =
fills it
to about 95% disk usage ), then I reboot my platform and remount JFFS2, =
the
large file is still there of course.  But if I erase it and try to copy =
it
back, the rm command never returns.  It seems that there is a problem =
with
the garbage collector.  The garbage collector could be spinning around
constantly moving data. =20

Hope this will give you a hint.

Fr=E9d=E9ric Giasson





|-----Original Message-----
|From: simon gittins [mailto:simon__gittins@hotmail.com]
|Sent: Tuesday, September 11, 2001 12:50 AM
|To: linux-mtd@lists.infradead.org
|Subject: JFFS2 speed question
|
|
|Hi
|
|I've been looking at the performance of jffs2 when under high stress=20
|(copying large files when fs is largely full).  Looking at the=20
|kernel debug=20
|messages, I've noticed fairly frequent 3-5 second gaps.  I'm=20
|fairly new to=20
|jffs2, but I did some hacking in the source and found:
|
|1. The 5 second wait times are generally started by a request=20
|for a file=20
|semaphor, and are always terminated by kupdated, (which calls=20
|write_super?).=20
|  kupdated sleeps for 5 seconds (on my 2.4.9 kernel) between=20
|iterations.  Am=20
|I right in thinking that this is a large bottleneck in the=20
|system?  I can=20
|manually 'speed it up' by running the following shell commands=20
|during a=20
|block time:
|    kill -STOP 7; kill -CONT 7 #where 7 is the pid of kupdated
|Can we minimise the dependence of jffs2 on kupdated?
|
|
|2.  Semaphors appear to be held during the execution of=20
|schedule().  While I=20
|have not delved deeply enough to fully understand the=20
|algorithms in place, a=20
|plethora of printk's seem to suggest that there are occasions where a=20
|process (gc or user process) would hold the semaphor and go to=20
|sleep (via=20
|schedule) without releasing the semaphor.  The other process=20
|would then pick=20
|up the execution, and (eventually) try to access the semaphor=20
|and fall into=20
|a sleep as well.  This appears to often cause the symptoms in=20
|(1), where=20
|both processes are napping until kupdated comes along.
|
|Am I on the right track?
|
|Is there any development time being spent looking at the=20
|performance issue=20
|(apart from mine)?
|
|
|
|I am working with 3 September CVS code on a 2.4.9 kernel.  I=20
|am using a=20
|pseudo flash device with mtdram to perform my tests.
|
|Regards
|Simon Gittins
|
|
|
|_________________________________________________________________
|Get your FREE download of MSN Explorer at=20
|http://explorer.msn.com/intl.asp
|
|
|
|______________________________________________________
|Linux MTD discussion mailing list
|http://lists.infradead.org/mailman/listinfo/linux-mtd/
|
