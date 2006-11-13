Received: from mout2.freenet.de ([194.97.50.155])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GjYiG-0008Hw-9H
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 10:06:52 +0000
Received: from [194.97.50.144] (helo=mx1.freenet.de)
	by mout2.freenet.de with esmtpa (Exim 4.62)
	(envelope-from <hermes33@freenet.de>) id 1GjYhW-0002NW-D5
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 11:06:02 +0100
Received: from www8.emo.freenet-rz.de ([194.97.107.211]:45699)
	by mx1.freenet.de with esmtp (port 25) (Exim 4.62 #12)
	id 1GjYhW-00010z-7g
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 11:06:02 +0100
Received: from www-data by www8.emo.freenet-rz.de with local (Exim 4.60 1
	(Panther_1)) id 1GjYhU-00007r-PL
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 11:06:00 +0100
To: linux-mtd@lists.infradead.org
From: hermes33@freenet.de
Subject: number mtd partitions on 16 limits?
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
Date: Mon, 13 Nov 2006 11:06:00 +0100
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I need more than 16 mtd partitions on a omap1610 (arm) with kernel 2.4.20.=
=20
I create 16 partitions. All ok, 'cat /proc/mtd' show mtd0 to mtd15.=20
I create 17 partitions. 'cat /proc/mtd' show only mtd0 to mtd15.=20
It seems to give a limit with 16 partitions.=20
Where can I change that? can someone help me?

Best regards

Robert
=0A=0A=0A=0A=0A=0A=0A=0A
