Received: from freya.inter.net.il ([192.114.186.14])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189hQR-0004sh-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 07:50:03 +0000
Content-Type: text/plain;
  charset="us-ascii"
From: eylon eyal <ayalon@tadlys.com>
To: linux-mtd@lists.infradead.org
Subject: GRUB on DoC Millennium/2000 - Instructions (Revised)  problem
Date: Thu, 7 Nov 2002 10:20:16 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200211071020.16625.ayalon@tadlys.com>
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

I've read the last paper about how to use grub with doc 2000

http://lists.infradead.org/pipermail/linux-mtd/2002-October/006166.html

i downloaded the last mtd sources from the cvs as  following

       cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login=20
        (password =3D anoncvs)
        cvs -z3 -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd

and i downloaded the last grub source from cvs
now the instractions says that i need to patch the grub sources as follow

patch -p0 -i grub-2002-10-08-doc.patch

i understand that this patch should be under directory /usr/src/mtd/patch=
es/

but the last patch i find there is grub-2002-07-29-doc.patch

were can i get the correct patch? or is it ok to use this patch?

thanks alot ayalon
