Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WMZH-0001GR-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 19:36:03 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9955F7@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Vipin Malik' <vipin@embeddedlinuxworks.com>,
	"MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 is broken
Date: Mon, 13 Aug 2001 14:34:09 -0400
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

Hi again Vipin,

I ran your JitterTest program on my MPC860T 50MHz embedded platform.  I
experienced worst case around 40 seconds like you did.  I think that =
such
jitter time is unacceptable in a real time embedded system like mine, =
so I
wonder what can be done to patch JFFS2 so it relinquish the CPU from =
time to
time... I spinkled a lot of loops into JFFS2 compression files with =
"if(
current->need_resched) schedule();" and the worst case was 4 seconds.=20

After having spinkled the code with schedule(), I ran another =
application
which accessses JFFS2 too at the same time that JitterTest, and the
execution of my program took 17% more time, which in my opinion is
acceptable because now JFFS2 has to cope with 2 applications accessing =
it at
the same time.=20

Do you think that something sharp and clean could be done with JFFS2 to =
fix
that problem once and for all?=20

Regards,

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Vipin Malik [mailto:vipin@embeddedlinuxworks.com]
Sent: Friday, August 10, 2001 10:47 PM
To: Frederic Giasson
Subject: RE: JFFS2 is broken


At 08:31 AM 8/10/2001 -0400, Frederic Giasson wrote:
>Hi Vipin,
>
>I'd be interested in having your testcase programs.  It would be much
>appreciated if you send me the sources.

Hi Frederic,

I've released the code under GPL and sent the entire CVS tree for the=20
jitter test program to David to put under the MTD tree.

He should have that done (hopefully) sometime this weekend or by =
Monday.

Let me know if it's not there by monday and I'll send you a private =
copy.

Vipin
