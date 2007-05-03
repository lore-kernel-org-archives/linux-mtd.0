Received: from wx-out-0506.google.com ([66.249.82.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hjdgs-0002LL-28
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 11:57:59 -0400
Received: by wx-out-0506.google.com with SMTP id t8so500122wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 May 2007 08:57:56 -0700 (PDT)
Message-ID: <463A04A5.5030103@gmail.com>
Date: Thu, 03 May 2007 11:49:57 -0400
From: Florin Malita <fmalita@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: [PATCH] UBI: dereference after kfree in create_vtbl
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Coverity (CID 1614) spotted new_seb being dereferenced after kfree() in 
create_vtbl's write_error path.


Signed-off-by: Florin Malita <fmalita@gmail.com>
---

 vtbl.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index b6fd6bb..91e3619 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -317,14 +317,13 @@ retry:
 	return err;
 
 write_error:
-	kfree(new_seb);
-	/* May be this physical eraseblock went bad, try to pick another one */
-	if (++tries <= 5) {
+	/* Maybe this physical eraseblock went bad, try to pick another one */
+	if (++tries <= 5)
 		err = ubi_scan_add_to_list(si, new_seb->pnum, new_seb->ec,
 					   &si->corr);
-		if (!err)
-			goto retry;
-	}
+	kfree(new_seb);	
+	if (!err)
+		goto retry;
 out_free:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
