Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15USwQ-0000wi-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 14:00:07 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9955E6@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Xavier DEBREUIL' <xde@inventel.fr>, linux-mtd
	 <linux-mtd@lists.infradead.org>
Subject: RE: jffs2 tests
Date: Wed, 8 Aug 2001 08:58:33 -0400 
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

Hi Xavier,

I remember that I had that UNKNOWN_INCOMPAT_NODETYPE error message =
quite
some time ago, and I did what's described next and then the problem was
gone.  First, I peered into JFFS2 code and I added what follows to the
beggining of the default case of the switch block in =
jffs2_get_inode_nodes()
function, file nodelist.c:

		default:
			if (ref->flash_offset & 1)=20
			{
				/* Obsoleted */
				break;
			}
		...

I remember that I had summited this to David, but I did'nt check if it =
has
been done.  Try it and tell me if it solved the problem.

And about the garbage collector latency problem, I just figured out =
that the
same thing happens to me but it is very rare.  I looked at the log of =
my
testcase started last week, and the first occurence I seen was at loop
8736...  In my opinion though, it may not be due to garbage collector
latency because as soon as JFFS2 deletes an inode and all child nodes, =
it
marks them obsolete.  When df is called, obsolete nodes are taken in =
account
as free space.  But I may be wrong (anyone can correct me)? This =
problem
should definitely be addressed.

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Xavier DEBREUIL [mailto:xde@inventel.fr]
Sent: Wednesday, August 08, 2001 4:45 AM
To: linux-mtd
Subject: jffs2 tests


Hello,
I do a similar test on jffs2 (20010802) as Frederic Giasson did :
1- copy randomly generated files of different sizes several times to
fill the jffs2 partition
2- df
3- remove all files
4- df

at step 4, most of the time I have :
/dev/mtdblock2            3200       648      2552  20%
/mnt/jffs2/jffs2_0
and from time to time :
/dev/mtdblock2            3200       904      2296  28%
/mnt/jffs2/jffs2_0
Nevertheless, as the following copy is able to copy the same amount of
files, it should be due to the latency of the garbage collector work
(confirm).

The only thing that seems odd to me is the occurence from time to time
of the following :

 rm -R /mnt/jffs2/jffs2_0/*
Unknown INCOMPAT nodetype C002 at 001B1588
jffs2_read_inode(): No data nodes found for ino #23289
Eep. read_inode() failed for ino #23289
Unknown INCOMPAT nodetype C002 at 000E1A8C
jffs2_read_inode(): No data nodes found for ino #23290
Eep. read_inode() failed for ino #23290

the unknown nodetype is always C002

What kind of debug is worth to be printed out to get more information
about that problem ?

Xavier

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
