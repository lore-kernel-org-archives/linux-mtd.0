Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTzpV-0004yk-Pw
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2011 17:44:55 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 00/16] DocG3 fixes and write support
References: <1321714978-24543-1-git-send-email-robert.jarzmik@free.fr>
 <1321997351.2222.14.camel@koala>
Date: Fri, 25 Nov 2011 18:44:43 +0100
In-Reply-To: <1321997351.2222.14.camel@koala> (Artem Bityutskiy's message of
 "Tue, 22 Nov 2011 23:29:08 +0200")
Message-ID: <87hb1sw0z8.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> Hi, pushed to l2-mtd-2.6.git, thanks!
Great, seen it coming down to linux-next :)

> 1. The reviewers did not give you any "Reviewed-by:" ?
You already did all the work for me in linux-next, thanks.

> 2. This series has one checkpatch.pl complaint in patch 15, which looks
> fair:
In the patch following this mail taken into account.

> 3. When I compile with gcc-4.6 for x68_64 I see the following
> compilation warnings:
>
>   CC [M]  drivers/mtd/devices/docg3.o
> drivers/mtd/devices/docg3.c: In function =E2=80=98doc_read_oob=E2=80=99:
> drivers/mtd/devices/docg3.c:630:3: warning: passing argument 2 of =E2=80=
=98doc_get_hw_bch_syndroms=E2=80=99 from incompatible pointer type [enabled=
 by default]
> drivers/mtd/devices/docg3.c:513:13: note: expected =E2=80=98int *=E2=80=
=99 but argument is of
> type =E2=80=98u8 *=E2=80=99
In the patch following the mail, it was in one of Mike's last remarks.

> drivers/mtd/devices/docg3.c: At top level:
> drivers/mtd/devices/docg3.c:762:12: warning: =E2=80=98doc_get_erase_count=
=E2=80=99 defined but
> not used [-Wunused-function]
Ah, this one gives me trouble. I made that function so that future evolutio=
ns of
MTD api can cope with hardware knowing how many times a block was erased.

My proposition is to make a sysfs entry which will dump the list of all blo=
cks
(from 0 to 2047 for docg3), and for each block print the number of erases. =
This
will clear the warning, and can be used for very specialized userspace
applications when they choose which block to erase.
This will be another patch I didn't do yet.

> 4. sparse gives the following warning:
I don't have that warning with C=3D1.
Moreover, the line (630) in l2-mtd-git or linux-next points towards a comme=
nt
line. I tried to have a peek at all "syns" usage and it seems correct to me.
So let's think this was a transient error in the whole patch serie.

> Could you please look at 2, 3, and 4? I did not look whether they are
> fair or not. Please, do not re-send the series again, I think it is OK
> if you send incremental fixes instead. Or if you at some point re-send
> v4, you can incorporate the warnings fixes, but please, do not send 16
> patches again only because of this :-)

Roger, single little patch. Don't worry, I think the big work is over for
docg3 ... now Mike's docg3 will be comming soon :)

--=20
Robert
