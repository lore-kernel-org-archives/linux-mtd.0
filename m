Received: from smtp3.infineon.com ([203.126.106.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk953-0005ha-5x
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 19:56:52 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: Mkfs.jffs2 source download....
Date: Wed, 15 Nov 2006 08:56:38 +0800
Message-ID: <5049F8BE55F36348A315EFBE6CF3438697FCCC@sinse301.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi;
	I try to download jffs2 related source tree from
cvs.infradead.org server and I have the following error while trying to
log into the server:

$ cvs
-d:pserver;proxy=3D<xxx>;proxyport=3D<xx>:anoncvs@cvs.infradead.org:/home=
/cv
s login
Usage: cvs [cvs-options] command [command-options-and-arguments]
  where cvs-options are -q, -n, etc.
    (specify --help-options for a list of options)
  where command is add, admin, etc.
    (specify --help-commands for a list of commands
     or --help-synonyms for a list of command synonyms)
  where command-options-and-arguments depend on the specific command
    (specify -H followed by a command name for command-specific help)
  Specify --help to receive this message

The Concurrent Versions System (CVS) is a tool for version control.
For CVS updates and additional information, see
    the CVS home page at http://www.cvshome.org/ or
    Pascal Molli's CVS site at http://www.loria.fr/~molli/cvs-index.html
login: anonymous
Password:
Login incorrect

login: anoncvs
Password:
Login incorrect

login:

	I use anoncvs as password and I am accessing the server behind a
proxy. Any insight and advice is appreciated....

Regards,
KH
