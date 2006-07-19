Received: from webmail-outgoing.us4.outblaze.com ([205.158.62.67])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G31rf-0003a3-Bv
	for linux-mtd@lists.infradead.org; Wed, 19 Jul 2006 03:32:47 +0100
Received: from unknown (unknown [192.168.8.90])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	9DB7D1800D9E for <linux-mtd@lists.infradead.org>;
	Wed, 19 Jul 2006 02:32:25 +0000 (GMT)
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="big5"
MIME-Version: 1.0
From: dalalilala@hellokitty.com
To: linux-mtd@lists.infradead.org
Date: Wed, 19 Jul 2006 10:32:24 +0800
Subject: How to put "Erase Block Summary" on unused space?
Message-Id: <20060719023224.8B39D43CBF@ws5-1.us4.outblaze.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all:

In my experiment environment, the usable space of NOR flash is 29.75MB,=20
and the size of jffs2 image is 512KB. Therefore, there are 29.25MB of=20
unused space. And the mount time of original jffs2 and summary jffs2=20
are the same.

Following the "JFFS2 improvement project" homepage, I have understood=20
EBS stores summary information at the end of every (closed) erase=20
block. And there is a user space tool called sumtool to generate this=20
summary information for a JFFS2 image.

In this case, the EBS only exist in JFFS2 image. That is to say, EBS=20
only exist in the part of used space, and not exist in the part of=20
unused space. Is it right?

If it is correct to say so, how to put EBS on unused space?

Best regards,=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Chih-Chien Yang
Real-Time Embedded Systems Lab.
Electrical and Control Engineering
National Chiao Tung University
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


--=20
_______________________________________________
Get your free email from http://www.sanriotown.com
