Received: from fepd.post.tele.dk ([195.41.46.149])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AAvX-0006AH-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 15:47:51 +0100
Received: from PLJPC ([80.63.145.22]) by fepD.post.tele.dk
          (InterMail vM.4.01.03.23 201-229-121-123-20010418) with SMTP
          id <20020521144751.OTTA17099.fepD.post.tele.dk@PLJPC>
          for <linux-mtd@lists.infradead.org>;
          Tue, 21 May 2002 16:47:51 +0200
Message-ID: <005d01c200d6$a0f88c80$0201a8c0@PLJPC>
From: =?iso-8859-1?Q?Poul_Lund_J=F8rgensen?= <plj@pragmaticconsult.com>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 on DOC ?
Date: Tue, 21 May 2002 16:48:54 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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

Hi,

I am looking for a power fail safe way to run a DOC2000 device.

The system I am developing does only do little amount of disk writing so I
have been considering to using two partitions:
a read only boot partition containing the entire linux root and boot dir and
one writeable for the dynamic application files.

But from the mail archive I can see that the two partition solution does not
solve the problem if NFTL is involved as the wear levelling
will be done across partition boundaries, so the writeable partition may
corrupt the readonly.

Another solution would be to run jffs2 on the DOC. But the drivers that
comes with the kernel I use (2.4.18) does not support this.

Are there any version of the mtd drivers that currently support this ?

If no, do there exist a patch that makes the DOC driver compatible with
jffs2 or can anybody supply me with
description of the necessary modifications.

Any advice are appreciated.

Thanks,

Poul Lund Jørgensen
