Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DTsG-0008Kx-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 17:33:36 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954DF@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: JFFS2: Problems with cache
Date: Fri, 22 Jun 2001 12:33:47 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi all,

I get pretty stange behavior from jffs2 when I copy files to it in
background (many copy operations at the same time).  Here is what I do:

- Erase flash completely
- Mount empty JFFS2 fs on it
- Fill flash with files, copying many at the same time
- When flash is full, rm *.*
Up to here, everything worked all right will all test I done
- Try copy many files again in background

Here is a trace of what I get:

>[root@10.1.0.138 /jffs2]# cp =
/home/fgiasson/linux-2.4.4-MPC860T/linux.bin
linux1.bin &
>[1] 47
>[root@10.1.0.138 /jffs2]# cp =
/home/fgiasson/linux-2.4.4-MPC860T/linux.bin
linux3.bin &
>[2] 48
>[root@10.1.0.138 /jffs2]# dfARGH. About to write node to 0x0008e4b4 on
flash, but there's data already there:
>0x0008e4b4: 10 48 31 1c 77 5b 77 1f 30 48 75 1d 30 48 75 1d
>Write to flash did not complete properly at address 8E4B4 with datum =
1985,
last: 3058, map_priv1: C2021000,
>map_priv1 + ofs: C20AF4B4
>Write of 4164 bytes at 0x0008e4b4 failed. returned -5, retlen 0
>Not marking the space at 0x0008e4b4 as dirty because the flash driver
returned retlen zero

I ensured that the sector was erased OK.  It is, always.  Then I tryed,
after the cp failure, to read manually with a small test program I =
wrote,
using a char access to my chip, the offset JFFS2 claims as not being =
erased:
it contains ones ( FFFF ).  Then I suspected the cache of my PPC to =
cheat on
me, even if I did ioremap_nocache in my physmap.c.  It didn't help.  I =
even
tried to insert cache invalidation assembly instruction in my read_16 /
write_16 function in my map driver, but it is still unsuccesful. =20


The problem is not happening if I do all copy operation ( cp ) in
foreground, one after another.

Does someone has a clue about it?

Fr=E9d=E9ric Giasson
