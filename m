Received: from [209.116.120.7] (helo=tnint11.telogy.design.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17xakT-0007In-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2002 23:16:41 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
To: linux-mtd@lists.infradead.org
Subject: cramfs issues
Date: Fri, 4 Oct 2002 18:17:04 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210041817.04501.nsnehaprabha@tnint11.telogy.design.ti.com>
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

Hi
=09I have a mtd partition for cramfs. I'm using 2.4.17 kernel. Also I am=20
building the mkcramfs utility against the files from scripts/cramfs direc=
tory=20
of the kernel distribution. I see that in the makefile this utility is li=
nked=20
with zlib library (libz.a). This crams image is mounted as root. Kernel c=
omes=20
up properly, but gives me the following message.
"Error -3 While decompressing!"

how do I make sure the versions of zlib used for compression on the host =
and=20
zlib for decompression (kernel) on the target are the same?

Please help.
Thanks
Sneha
