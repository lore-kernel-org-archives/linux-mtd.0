Received: from n6-vm1.bullet.mail.in.yahoo.com ([202.86.4.133])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbBIj-0008WK-Tz
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 10:43:36 +0000
Message-ID: <753251.13822.qm@web95108.mail.in2.yahoo.com>
Date: Wed, 12 Aug 2009 16:06:26 +0530 (IST)
From: rohit cr <rohi_mot@yahoo.co.in>
Subject: Adding EBS support to 2.6.10 kernel
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 I'm a naive user for mtd utils.

 1.I was trying to look whether EBS patch can be back ported
   for 2.6.10 kernel.

 2.In this direction first i started building mtd utils.
   I built mtd utils from git tree after applying xattr related
   patches and compiling by "make WITHOUT_XATTR=3D1" to get    mkfs.jffs2 a=
nd sumtool with summary support.

 I built my jffs2 FS image(43MB) with this.=20
 But when i ran sumtool, the new jffs2 image size is reducing=20
 to 13MB like

"sumtool -e 256KiB -i my.jffs2 -o new.jffs2"

 Please throw some light on whether am on a feasible task
 and why sumtool is reducing my jffs2 image size

With lots of hope,

Thanks,
Rohit.C.R=0A=0A=0A      Yahoo! recommends that you upgrade to the new and s=
afer Internet Explorer 8. http://downloads.yahoo.com/in/internetexplorer/
