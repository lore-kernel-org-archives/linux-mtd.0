Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 192bhT-0006ky-Km
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 19:50:35 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'Mtd'" <linux-mtd@lists.infradead.org>
Date: Mon, 7 Apr 2003 14:50:49 -0400
Message-ID: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm running into compiler errors when trying to build the jffs2
utilities for a 2.4.17/mips target.  I've checked out the latest mtd
code according to www.linux-mtd.infradead.org, then have followed the
instructions in the mtd/util/README file (copied mtd/util contents to
directory under linux root and changed $CROSS as necessary since I'm
cross-compiling to mips).  I cd to <mips-kernel-path>/linux/utils and do
a make, but get errors immediately, which typically include the
following (depending on which util I'm trying to make)...

.../libc.so.6: undefined reference to 'no symbol'
.../mips-linux-ld: cannot find -lz

I'm really only after 'erase' and maybe 'jffs2reader' for use on my mips
embedded target; I already have mkfs.jffs2 as an x86 binary for my x86
development platform.  Any ideas, or better place for me to post this
question?

John
