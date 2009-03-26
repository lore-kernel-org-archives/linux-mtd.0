Received: from proxy01.el-me.de ([212.184.203.66] helo=proxy02.el-me.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lmp2H-0001qH-9i
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 12:50:24 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: DirEntry without INodes - trying to access a "nonexistant ino"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2009 13:50:12 +0100
Message-ID: <9503E3D8EC34CC4EA3FBC01F3BFAB8AE205F5B@exchange05.elmedmn.local>
From: "Kreitner Richard" <r.kreitner@de.ccv.eu>
To: <linux-mtd@lists.infradead.org>
Cc: =?iso-8859-1?Q?Froschermeier_G=FCnther?= <g.froschermeier@de.ccv.eu>,
	Liegl Uwe <u.liegl@de.ccv.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

I am currently analyzing the JFFS2 file system of some embedded Linux =
devices (Kernel 2.4.31) which were returned due to a file system =
corruption in the SRAM.

What I found out so far is that there is a file consisting only of a =
single DirEntry but no corresponding INodes. As far as I understand the =
JFFS2, there has to be at least one zero size data INode belonging to a =
DirEntry to get a valid file. The driver also complains about this in =
the debug log (see below).

Trying to access the corrupt file which is not always the same in every =
image, results in an input/output error (e.g. by using the ls command). =
Our application wants to set permissions on it during the boot process =
and stops at this point with a fatal error.

In the case of the failing devices, the application is configured to =
continuously write a log file (600K ringbuffer) over a long period (up =
to 3 months), so there's heavy activity in the file system and the =
Garbage Collector should run very often.

Is it possible that the INode is overwritten with the data of another =
INode due to a bug in the Garbage Collector?

Or can anyone imagine of something else that could cause a problem like =
this?

...
Dirent 0: ".", ino #25
Dirent 1: "..", ino #2
Dirent 2: "eserver", ino #50, type 4
jffs2_readdir() out, offset =3D 3
jffs2_readdir() for dir_i #50
Dirent 0: ".", ino #50
Dirent 1: "..", ino #25
Dirent 2: "profiles.tlv", ino #683, type 8
Dirent 3: "transactionlog.tlv", ino #55, type 8
Skipping deletion dirent "configuration.tlv.tmp"
Dirent 5: "configuration.tlv", ino #686, type 8
Dirent 6: "terminallog.tlv", ino #58, type 8
Dirent 7: "transactionhistory.tlv", ino #56, type 8
jffs2_readdir() out, offset =3D 8
jffs2_do_read_inode() on nonexistent ino 55
...

Regards
=A0
R. Kreitner
