Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ35C-0005iG-0v
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 16:14:00 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala>
Date: Fri, 09 Dec 2011 17:13:46 +0100
In-Reply-To: <1323066682.2316.18.camel@koala> (Artem Bityutskiy's message of
 "Mon, 05 Dec 2011 08:31:19 +0200")
Message-ID: <877h2590zp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Fri, 2011-12-02 at 20:00 +0100, Robert Jarzmik wrote:
>> This patch takes into account checkpatch, sparse and ECC
>> comments.
>>=20
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Pushed to l2-mtd-2.6.git, thanks. But I still see this warning when
> I compile on x86_64:
>
> drivers/mtd/devices/docg3.c:1050:12: warning: =E2=80=98doc_get_erase_coun=
t=E2=80=99 defined
> but not used [-Wunused-function]

Hi Artem,

I have found no clean and good way to handle the erase count.  As a fallbac=
k,
please accept the following patch which removes the unused function. It's k=
ind
of a "looser" approach, but that's the best I can do by now.

The patch is based on your current l2-tree (commit
af64b37f63189cef7575fb3f8e670df767c3e15b "mtdoops: fix the oops_page_used a=
rray
size").

Cheers.

--
Robert

>From c87ece988e535905702b40460c6685984f08db88 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 9 Dec 2011 17:02:49 +0100
Subject: [PATCH] mtd: docg3: remove unused function

As the MTD api has no use for the number of erase cycles
each block has endured, remove the function which calculated
that value.

If one day MTD api finds it usefull for wear levelling
algorithms to have this information, the function should be
put back in place.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   42 ---------------------------------------=
---
 1 files changed, 0 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 2a32072..f05c5bc 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1038,48 +1038,6 @@ static int doc_block_isbad(struct mtd_info *mtd, lof=
f_t from)
 }
=20
 /**
- * doc_get_erase_count - Get block erase count
- * @docg3: the device
- * @from: the offset in which the block is.
- *
- * Get the number of times a block was erased. The number is the maximum of
- * erase times between first and second plane (which should be equal norma=
lly).
- *
- * Returns The number of erases, or -EINVAL or -EIO on error.
- */
-static int doc_get_erase_count(struct docg3 *docg3, loff_t from)
-{
-	u8 buf[DOC_LAYOUT_WEAR_SIZE];
-	int ret, plane1_erase_count, plane2_erase_count;
-	int block0, block1, page, ofs;
-
-	doc_dbg("doc_get_erase_count(from=3D%lld, buf=3D%p)\n", from, buf);
-	if (from % DOC_LAYOUT_PAGE_SIZE)
-		return -EINVAL;
-	calc_block_sector(from, &block0, &block1, &page, &ofs, docg3->reliable);
-	if (block1 > docg3->max_block)
-		return -EINVAL;
-
-	ret =3D doc_reset_seq(docg3);
-	if (!ret)
-		ret =3D doc_read_page_prepare(docg3, block0, block1, page,
-					    ofs + DOC_LAYOUT_WEAR_OFFSET);
-	if (!ret)
-		ret =3D doc_read_page_getbytes(docg3, DOC_LAYOUT_WEAR_SIZE,
-					     buf, 1);
-	doc_read_page_finish(docg3);
-
-	if (ret || (buf[0] !=3D DOC_ERASE_MARK) || (buf[2] !=3D DOC_ERASE_MARK))
-		return -EIO;
-	plane1_erase_count =3D (u8)(~buf[1]) | ((u8)(~buf[4]) << 8)
-		| ((u8)(~buf[5]) << 16);
-	plane2_erase_count =3D (u8)(~buf[3]) | ((u8)(~buf[6]) << 8)
-		| ((u8)(~buf[7]) << 16);
-
-	return max(plane1_erase_count, plane2_erase_count);
-}
-
-/**
  * doc_get_op_status - get erase/write operation status
  * @docg3: the device
  *
--=20
1.7.5.4
