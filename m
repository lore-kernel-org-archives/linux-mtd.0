Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Se0E-0001LH-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 14:29:02 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ED011@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'nsnehaprabha@tnint11.telogy.design.ti.com'"
	 <nsnehaprabha@tnint11.telogy.design.ti.com>
Cc: "'CC:'" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 Problem
Date: Thu, 11 Jul 2002 09:29:00 -0400
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

This reminds me of a problem which I think was fixed a long time ago
(probably around the end of July 2001).  I was copying and erasing
repeateadly a certain amount of small files and subdirectories, and =
free
space reported by "df" was constantly decreasing. The memory leak was
occuring upon directories deletion, the metadata was remaining on the =
flash.
The fix was done in clear_inode() function.=20

If you are using an old version of JFFS2, maybe the fix was not =
present.
Originally, the patch was done in function jffs2_clear_inode(), file
readinode.c.  It has been moved to function jffs2_do_clear_inode() -
readinode.c:

	if (f->metadata) {
		if (!f->inocache->nlink)
			jffs2_mark_node_obsolete(c, f->metadata->raw);
		jffs2_free_full_dnode(f->metadata);
	}

Look in file readinode.c.  If you don't see the above code, you could =
try to
update you JFFS2 code and then look if the problem is gone.  If the fix =
is
in your code and the problem is still present, then I would appreciate =
if
you could explain to me how to reproduce your problem.

Fr=E9d=E9ric Giasson=20
