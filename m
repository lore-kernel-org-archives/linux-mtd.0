Received: from smtp3.infineon.com ([203.126.106.229])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkBF7-0007Qq-D0
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 22:15:28 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: Mkfs.jffs2.c:68:21: sys/acl.h: No such file or directory
Date: Wed, 15 Nov 2006 11:15:12 +0800
Message-ID: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
In-Reply-To: <1163553993.19697.31.camel@crusty.rchland.ibm.com>
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

	I am trying to build mtd-utils-1.0.1 using a mips cross
toolchain and I am stumbled at mkfs.jffs2 which includes sys/acl.h and
it is not present anywhere in my mips toolchain include directory but it
is present in my host /usr/include/sys/acl.h Has anybody encoutered this
problem before that you could enlighten me on this?

Thanks & Regards,
KH
