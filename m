Date: Fri, 19 Sep 2014 13:56:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBI: return on error in rename_volumes()
Message-ID: <20140919104848.GC26391@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed this during a code review.  We are checking that the strlen()
of ->name is not less than the ->name_len which the user gave us.  I
believe this bug is harmless but clearly we meant to return here instead
of setting an error code and then not using it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not totally familiar with the code so please review extra carefully.

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 20aeb27..59de69a 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -701,7 +701,7 @@ static int rename_volumes(struct ubi_device *ubi,
 		req->ents[i].name[req->ents[i].name_len] = '\0';
 		n = strlen(req->ents[i].name);
 		if (n != req->ents[i].name_len)
-			err = -EINVAL;
+			return -EINVAL;
 	}
 
 	/* Make sure volume IDs and names are unique */
