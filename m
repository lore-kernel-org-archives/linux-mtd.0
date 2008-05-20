Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyKGg-0002bp-KA
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 05:20:10 +0000
Message-ID: <48325E70.4070201@nokia.com>
Date: Tue, 20 May 2008 08:15:28 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Question about the 2-bit EDC scrubbing at UBI
References: <9c9fda240805191849m6bdfd99fi7509c37128f5d989@mail.gmail.com>
In-Reply-To: <9c9fda240805191849m6bdfd99fi7509c37128f5d989@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

Kyungmin Park wrote:
> In internal layout handling in UBI, it plans to scrub the LEB if the
> 2-bit EDC is found.
> As you know, if the EDC is detected it can't trust which bit is wrong.
> So it needs another handling.
> But the code does as 1-bit ECC.
> 
> How do you think? Is that make a problem in use?

Hi, I think the code is OK. I've added an explanatory comment
below.

BTW, have you received a lengthy description about our OneNAND
read error occasion from Adrian which he sent probably about 3
weeks ago?

>From 6a1384fa8e384110cfb761aa5c25511fc8ae812e Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 20 May 2008 09:54:02 +0300
Subject: [PATCH] UBI: add a comment

It is not clear why we schedule PEB for scrubbing in case of
-EBADMSG. Elaborate.

Requested-by: Kyungmin Park <kmpark@infradead.org>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/vtbl.c |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 3c4d68f..42a7815 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -385,7 +385,16 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
 				       ubi->vtbl_size);
 		if (err == UBI_IO_BITFLIPS || err == -EBADMSG)
-			/* Scrub the PEB later */
+			/*
+			 * Scrub the PEB later. Note, -EBADMSG indicates an
+			 * uncorrectable ECC error, but we have our own CRC and
+			 * the data will be checked later. If the data is OK,
+			 * the PEB will be scrubbed (because we set
+			 * seb->scrub). If the data is not OK, the contents of
+			 * the PEB will be recovered from the second copy, and
+			 * seb->scrub will be cleared in
+			 * 'ubi_scan_add_used()'.
+			 */
 			seb->scrub = 1;
 		else if (err)
 			goto out_free;
-- 
1.5.4.1


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
