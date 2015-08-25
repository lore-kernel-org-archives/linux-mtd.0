Received: from mail-lb0-f171.google.com ([209.85.217.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUFqC-0006R9-G0
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 15:08:49 +0000
Received: by lbcbn3 with SMTP id bn3so101421030lbc.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 08:08:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55DC55A6.4000801@gmail.com>
References: <55DC55A6.4000801@gmail.com>
Date: Tue, 25 Aug 2015 12:08:25 -0300
Message-ID: <CAAEAJfA9=RaEd6VEobs53qLQTuY-w0PfYDjqA-HSY7xTq1oGTA@mail.gmail.com>
Subject: Re: Kernel Update on NAND (CM-510 Compulab)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Gabriel Dobato <dobatog@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+mtd folks

On 25 August 2015 at 08:46, Gabriel Dobato <dobatog@gmail.com> wrote:
> Hi Ezequiel,
>
> Sorry for disturbing you again. I contacted you when I was trying to set =
the
> Nand driver ( pxa3xx_nand) with Device Tree on 3.19 Kernel Version for
> Compulab CM-510 platform. Until now, it has worked right, I have made som=
e
> MTD tests and everything is OK.
>
> But now, I would like to update the kernel (/dev/mtd0), while the system =
is
> working on NAND. If I try it, I get some UbiFS Errors:
>
>
> root@debug:~# flash_eraseall /dev/mtd0
> flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please us=
e
> it
> Erasing 128 Kibyte @ f20000UBIFS error (pid 2679): ubifs_read_node: bad n=
ode
> type (255 but expected 2)
> 0 -- 47 % compleUBIFS error (pid 2679): ubifs_read_node: bad node at LEB
> 1055:59640, LEB mapping status 1
> Erasing 128 Not a node, first 24 bytes:Kibyte @ f220000
>  -- 47 % complet00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff
> ff ff ff ff ff ff ff                          ........................
> Erasing 128 KibyUBIFS error (pid 2681): ubifs_read_node: bad node type (2=
55
> but expected 2)
> te @ f2a0000 -- UBIFS error (pid 2681): ubifs_read_node: bad node at LEB
> 1055:34096, LEB mapping status 1
> ENot a node, first 24 bytes:rasing 128 Kibyt
> e @ f2c0000 -- 400000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff=
 ff
> ff ff ff ff ff ff ff                          ........................
> Erasing 128 Kibyte @ f300000 -- 47 UBIFS error (pid 2679): ubifs_read_nod=
e:
> bad node type (255 but expected 0)
> ErasUBIFS error (pid 2679): ubifs_read_node: bad node at LEB 1550:41016, =
LEB
> mapping status 1
> ing 128 Kibyte @Not a node, first 24 bytes: f320000 -- 47 %
> Erasi00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff f=
f
> ff ff ff ff                          ........................
> ng 128 Kibyte @ UBIFS error (pid 2679): ubifs_iget: failed to read inode
> 16299, error -22
> Erasing 128 Kibyte @ fUBIFS error (pid 2679): ubifs_lookup: dead director=
y
> entry 'sendmail', error -22
> Erasing 128 Kibyte @ 11040000 -- 53 % complete flash_erase: Skipping bad
> block at 11060000
> Erasing 128 Kibyte @ 1fee0000 -- 99 % complete flash_erase: Skipping bad
> block at 1ff00000
> flash_erase: Skipping bad block at 1ff20000
> flash_erase: Skipping bad block at 1ff40000
> flash_erase: Skipping bad block at 1ff60000
> flash_erase: Skipping bad block at 1ff80000
> flash_erase: Skipping bad block at 1ffa0000
> flash_erase: Skipping bad block at 1ffc0000
> flash_erase: Skipping bad block at 1ffe0000
> Erasing 128 Kibyte @ 1ffe0000 -- 100 % complete
>
>
> However if I try it from another space (SD-CARD) it works as expected.
>
> If you have a litle time, just to give me a direction in order to find ou=
t
> where the problem is, I really apreciate.

I'm not sure I'm following you:

Your /dev/mtd0 is attached to a mounted UBIFS while you are erasing it?

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
