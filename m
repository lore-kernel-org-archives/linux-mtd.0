Received: from webmail.mediatrix.com ([66.129.134.11] helo=mail.mediatrix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GOT8-00036I-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2001 18:23:42 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954F9@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Intense JFFS2 testcase fails after 500 times
Date: Sat, 30 Jun 2001 13:23:22 -0400
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

I tested JFFS2 with an intense test case, along with the chip driver I
written.  My testcase simply copy a lot of small files to the JFFS2
filesystem, erase them all and start over again util an error occurs. =20

The first time I fill the flash, df command reports a 88% disk uasge.  =
It
remains like that until about 200 test case loops have executed.  But =
after
that, disk usage begins to grow slowly, and at about 520 loops, my =
testcase
fails, reporting a full disk.  After the test, I checked the flashes =
chips
and they are not burned out, they are still very good.  Did anyone ever =
ran
such tests?  If so, did it gave the same results?  If so, could there =
be
some sort of memory leaks with JFFS2 filesystem?

Thanks!

Fr=E9d=E9ric Giasson
