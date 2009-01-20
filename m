Received: from smtp6.centerbeam.com ([64.95.134.54])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPMmG-0006Yq-PH
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 20:00:51 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [JFFS2] kernel BUG at fs/jffs2/readinode.c:252
Date: Tue, 20 Jan 2009 12:00:43 -0800
Message-ID: <705901BA1DF18142AB3DE716DDF374F802189B86@CBA0E2K03.CBA0.centerbeam.com>
From: "Manu Rao" <MRao@AlienTechnology.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.
I have a kernel oops occurring at a point in /fs/jffs2/readinode.c on an
AT91 board /2.6.22 kernel/jffs2 Filesys on Samsung NAND flash.

Gdb led me to line 252:
		...
	while (this->overlapped)
            this =3D tn_prev(this);

      /* First node should never be marked overlapped */
      BUG_ON(!this);
      dbg_readinode("'this' found %#04x-%#04x (%s)\n",
		...

My problem occurs when 'this' becomes NULL. I have structured the loop
differently and that makes the OOPS go away, but I am concerned about
the actual cause for the OOPS. From what I can tell, the structure/flag
is in memory, and not in the flash.

What could cause this to happen? I am also not sure if the BUG_ON should
read BUG_ON(!this) or BUG_ON(!this->overlapped) as suggested by the
comment.

Any/All help appreciated.
