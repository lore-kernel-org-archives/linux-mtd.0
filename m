Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qq5V-0001Px-GJ
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 16:03:33 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 54DF16D00BC
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 10:59:37 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 3CD906D00B9
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 14:59:37 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 10:51:41 -0400
MIME-Version: 1.0
Message-Id: <200306131051.42110.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Please Help, problem mounting jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have a problem with mounting my new mtd/jffs2 system
after lots of experiment I have found the after doing
'eraseall /dev/mtd0' I can 'mount -t jffs2 /dev/mtdblock0 /mnt/flash'
with no problem :) but if I umount it and try to re-mount it
will sit there forever !
If I cp a jffs2.img to the device the mount will also lockup=20
If I erase -> mount I can create files df with no problems,=20

It seem like the mount does not like mounting with anything
in the filesystem !

What infomation should I gather to find out whats gonig on here ?

Any help greatly appreciated,

TIA,
        Frank.
