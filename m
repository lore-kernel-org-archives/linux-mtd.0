Received: from [209.116.120.7] (helo=tnint11.telogy.design.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SPQE-0000Gn-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2002 22:54:54 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 Problem
Date: Wed, 10 Jul 2002 17:52:51 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200207101752.51379.nsnehaprabha@tnint11.telogy.design.ti.com>
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

I am having an issue with the JFFS2 file system, looks like the issue is =
with=20
Garbage Collection. This is what I have done -=20

I copy a file, and delete it for several times;  (You can think of a case=
=20
where a configuration file is written again and again).

Depending on the space I had initially, it reaches a stage, where I canno=
t =20
copy the file any more though 'df' shows enough available space for the f=
ile.

Is it an issue with GC ?

Any idea?


Sneha
