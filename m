Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ka8NS-0004SO-Vf
	for linux-mtd@lists.infradead.org; Mon, 01 Sep 2008 12:19:27 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2823614wfc.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Sep 2008 05:19:25 -0700 (PDT)
Message-ID: <48BBDDC9.9020003@gmail.com>
Date: Mon, 01 Sep 2008 05:19:21 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] mtdchar.c: Fix regression in
	MEMGETREGIONINFO	ioctl()
References: <48ABCC0B.40607@gmail.com>	
	<20080822153451.bb79bd1f.akpm@linux-foundation.org>	
	<48AFC5ED.50005@gmail.com>	
	<20080823222707.2fb972b5.akpm@linux-foundation.org>	
	<48B13F88.3080306@gmail.com> <48B4D884.5040204@gmail.com>
	<1220266884.2982.62.camel@pmac.infradead.org>
In-Reply-To: <1220266884.2982.62.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zev Weiss <zevweiss@gmail.com>
Date: Mon, 1 Sep 2008 05:02:12 -0700
Subject: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO ioctl()

The MEMGETREGIONINFO ioctl() in mtdchar.c was clobbering user memory by
overwriting more than intended, due the size of struct mtd_erase_region_info
changing in commit 0ecbc81adfcb9f15f86b05ff576b342ce81bbef8.

Fix avoids this by copying struct members one by one with put_user(), as there
is no longer a convenient struct to use the size of as the length argument to
copy_to_user().

Signed-off-by: Zev Weiss <zevweiss@gmail.com>
---
  drivers/mtd/mtdchar.c |   16 ++++++++++------
  1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 13cc67a..424f318 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -410,16 +410,20 @@ static int mtd_ioctl(struct inode *inode, struct file *file,

  	case MEMGETREGIONINFO:
  	{
-		struct region_info_user ur;
+		u32 ur_idx;
+		struct mtd_erase_region_info *kr;
+		struct region_info_user *ur = (struct region_info_user *) argp;

-		if (copy_from_user(&ur, argp, sizeof(struct region_info_user)))
+		if (get_user(ur_idx,&(ur->regionindex)))
  			return -EFAULT;

-		if (ur.regionindex >= mtd->numeraseregions)
-			return -EINVAL;
-		if (copy_to_user(argp, &(mtd->eraseregions[ur.regionindex]),
-				sizeof(struct mtd_erase_region_info)))
+		kr = &(mtd->eraseregions[ur_idx]);
+
+		if (put_user(kr->offset, &(ur->offset))
+		    || put_user(kr->erasesize, &(ur->erasesize))
+		    || put_user(kr->numblocks, &(ur->numblocks)))
  			return -EFAULT;
+
  		break;
  	}

-- 
1.5.4.1
