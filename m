Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejXNh-0003Uv-SH
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 21:35:55 +0000
Received: by mail-qt0-x235.google.com with SMTP id z10so3637252qti.5
 for <linux-mtd@lists.infradead.org>; Wed, 07 Feb 2018 13:35:42 -0800 (PST)
MIME-Version: 1.0
From: Ollie <ollie88r@gmail.com>
Date: Wed, 7 Feb 2018 22:35:20 +0100
Message-ID: <CAOa5LcGW6T3UwvKAUPL2BbWEsNjEgGywwkbHtzNASj=JdLWRzQ@mail.gmail.com>
Subject: JFFS2: conflicting erase-block and flash block sizes
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have two hardware platforms that utilize two different flash
hardware configurations resulting in one platform=E2=80=99s flash having a
block size of 128KiB, and the other 256KiB. I need to create a single
JFFS2 partition that is deployable on both targets. I have read that
it should not be a problem (data-loss wise) to compile the JFFS2
filesystem with an erase-block size smaller than the actual block-size
of the system's flash device. However, upon mounting the JFFS2
partition with an erase-block size of 128KiB on the target with a
flash block size of 256KiB, I get several of the the following warning
message:

> Empty flash at 0xXXXXXXXX ends at 0xXXXXXXXX

I have read the FAQ which states that this is =E2=80=9Cgenerally not a
problem=E2=80=9D, and that the message can be moved to a higher log level
=E2=80=9Conce you are sure that is it benign=E2=80=9D.

I have also found the following post on the mailing list in which
Thomas Gleixner explains that=E2=80=A6

> This happens due to NAND specific timed buffer flushing. JFFS2 fills
> up the write buffer to a full page boundary with 0xff and writes out
> the buffer to the chip, if you have no consecutive write within 2
> seconds. This is done to ensure, that data is written to FLASH.
> This fill looks like empty FLASH on mount. So JFFS2 is wondering why ther=
e
> is data after the =E2=80=9Cempty=E2=80=9D FLASH. No reason to worry.

http://www.infradead.org/pipermail/linux-mtd/2003-April/007624.html

I find the FAQ answer, in combination with the above quoted post,
slightly concerning in that they address this issue with different
tones of confidence that this is truly not an issue. I have examined
the source code and tested quite a few read/write scenarios that could
potentially expose flaws in using conflicting erase-block / flash
block size configurations, and have found no reason to believe that
anything is =E2=80=9Cmisbehaving=E2=80=9D or being corrupted. However, I ha=
ve some
questions I would like to ask before making a final design decision.

1) JFFS2 errors on the side of being vocal about what its doing. What
about the conditions of this =E2=80=9Cwarning=E2=80=9D message warrant it b=
eing at the
warning log level, and not the debug log level?

2) I need be able to say with 100% certainty that a JFFS2 partition
with a 128KiB erase-block size will not cause any data loss or
corruption on flash device with a block size of 256KiB. Is there any
explanation that asserts with 100% confidence that this will not be an
issue? As I said above, I have examined the code and functionality of
the JFFS2 driver and cannot find any reason to believe why it would
be.

Thank you in advance,
Ollie
