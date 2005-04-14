Received: from rproxy.gmail.com ([64.233.170.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLxsI-0001lE-6M
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 02:30:51 -0400
Received: by rproxy.gmail.com with SMTP id y7so367468rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2005 23:30:44 -0700 (PDT)
Message-ID: <d59cd780050413233072eafaef@mail.gmail.com>
Date: Thu, 14 Apr 2005 14:30:43 +0800
From: Franz de Rama <pranss@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: flash_eraseall error
Reply-To: Franz de Rama <pranss@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am trying to move my DoC Millennium Plus 32mb file system from ext2
to jffs2. but when I issued the command '# flash_eraseall -j
/dev/mtd0', i get the following error message:

./flash_eraseall: /dev/mtd0: unable to get NAND oobinfo

=3D=3D=3D=3D

This is my 'cat /proc/mtd' result:

dev:    size   erasesize  name
mtd0: 02000000 00008000 "DiskOnChip Millennium Plus"

Any ideas where i went wrong?=20

Thanks in advance

-franz-
