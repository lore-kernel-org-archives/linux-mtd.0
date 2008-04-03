Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JhNkE-0005Xg-Lc
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 11:36:39 +0000
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m33BcbSn028546
	for <linux-mtd@lists.infradead.org>; Thu, 3 Apr 2008 06:38:47 -0500
Subject: UBIFS: media format changes
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Apr 2008 14:37:05 +0300
Message-Id: <1207222625.8040.4.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

as we have announced UBIFS, it is good idea to notify people
who may try to use it about media format changes.

We now store nanoseconds in [amc]time in inodes, not just seconds,
and the latest UBIFS is incompatible to the previous versions,
which means it will refuse mounting older images.

You should also update mkfs.ubifs utility.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
