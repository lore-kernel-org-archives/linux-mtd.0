Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15X2KZ-0004CK-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2001 16:11:39 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4DD0DAEF@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Vipin Malik' <vipin@embeddedlinuxworks.com>
Cc: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 is broken 
Date: Wed, 15 Aug 2001 11:09:54 -0400
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

-----Original Message-----
From: Vipin Malik [mailto:vipin@embeddedlinuxworks.com]
Sent: Tuesday, August 14, 2001 5:57 PM
To: Frederic Giasson; MTD mailing list (E-mail)
Subject: RE: JFFS2 is broken=20



Be careful, in my tests, the worst case blocking times came when the =
flash=20
was >90+%
full. You may want to increase the full % on your flash full program =
and=20
retest.


I ran JitterTest with -w 1000 bytes and after a while, it began to slow =
down
a lot.  Note that I had the kernel image file stored in jffs2 during =
that
test, so that JitterTest had 50% of the flash left for itself.  When I
stopped JitterTest, the worst case was 24 seconds and the instant =
average
jitter was probably around 5 seconds... What is happening?  Is JFFS2
constantly gargabe collecting after a while?  I looked at the size of =
the
file created by the -f option, and along with my kernel file it was =
using
95% of the flash.


Fr=E9d=E9ric Giasson
