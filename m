Received: from smtp0.libero.it ([193.70.192.33])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnLkO-00073a-BB
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 14:23:21 -0400
Received: from localhost (172.16.1.82) by smtp0.libero.it (7.0.027-DD01)
	id 40D2BD60008BF299 for linux-mtd@lists.infradead.org;
	Wed, 21 Jul 2004 20:23:11 +0200
Received: from libero.it (172.16.1.87) by smtp3.libero.it (7.0.027-DD01)
	id 40D05CC20039032D for linux-mtd@lists.infradead.org;
	Wed, 21 Jul 2004 20:23:10 +0200
Date: Wed, 21 Jul 2004 20:23:10 +0200
Message-Id: <I17SEM$1DC26B36820863BFFC1F5CC60A6B7223@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "dibacco\@inwind\.it" <dibacco@inwind.it>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem mapping a file opened with flag O_RDWR. This file is hou=
sed on a jffs2 file system that currently lives on simple ram. Could you =
give me an hint where to search for a possible solution? If I open the fi=
le in O_RDONLY mode the mapping is done, instead with O_RDWR mmap returns=
 -EINVAL.

Thanks in advance,
Antonio.
