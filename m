Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YudmS-0000Sb-BA
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 09:25:45 +0000
Received: by obcus9 with SMTP id us9so7528703obc.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 02:25:22 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Micha=C5=82_Le=C5=9Bniewski?= <mlesniew@gmail.com>
Date: Tue, 19 May 2015 11:24:41 +0200
Message-ID: <CAOh7PeaDU13o52BkRZ_woKCDB_TOC982Rz9RpBnnX6Lqu8ZMsg@mail.gmail.com>
Subject: Influence of mkfs.jffs2 parameters on file system behavior
To: linux-mtd@lists.infradead.org
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

Hi,

I have a question about the parameters passed to mkfs.jffs2 and their
influence on the JFFS2 behavior.

When generating an image one can specify the erase block size of the
flash, for which the image is generated, by suppling
`--eraseblock=3D...` on the command line.  There is also a `--pagesize`
parameter -- this parameter allows specifying the virtual memory page
size of the target system (often 4kB).

I found out that by mistake, I generated images with the wrong values
of these two parameters:

1. Some of the images I used were generated with the right page size
(4kB), but the wrong erase block size (flash memory has 128kB blocks,
the parameter supplied to mkfs.jffs2 was 64kB).  Surprisingly, I
didn't experience any problems with the file system, even when the
file system was heavily used (lots of file reads, rewrites, etc.).
However, when I switched the kernel from version 2.6.27 to version
3.4.31, sometimes files seemed to be trimmed or parts of them were
zeroed.  Could this be caused by the erase block size mismatch? The
documentation states that generating an image with a smaller erase
block than the actual flash device uses is harmless
(http://www.linux-mtd.infradead.org/doc/jffs2.html)...

2. Some other images I generated used the right erase block size but
the wrong virtual memory page size (2kB instead of 4kB).  I didn't
encounter any problems with the file system.  So in this case my
question is what influence does the `--pagesize` parameter have and
what's the worst thing that can happen if it's wrong?

Regards,
Micha=C5=82 Le=C5=9Bniewski
