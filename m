Received: from exprod6ob109.obsmtp.com ([64.18.1.22] helo=psmtp.com)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyvfM-0008N8-BB
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 22:53:01 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] mtd_blkdevs.c: quiet a "symbol shadows" sparse warning
Date: Fri, 16 Oct 2009 18:52:53 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E2455C@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In register_mtd_blktrans(), the symbol 'ret' is already declared
as an int at the start of the function.  The inner loop declaration
is unnecessary.  Quiets the following sparse warning:

  warning: symbol 'ret' shadows an earlier one

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 8ca17a3..b76d6e5 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -379,7 +379,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops =
*tr)
 	tr->blkcore_priv->thread =3D kthread_run(mtd_blktrans_thread, tr,
 			"%sd", tr->name);
 	if (IS_ERR(tr->blkcore_priv->thread)) {
-		int ret =3D PTR_ERR(tr->blkcore_priv->thread);
+		ret =3D PTR_ERR(tr->blkcore_priv->thread);
 		blk_cleanup_queue(tr->blkcore_priv->rq);
 		unregister_blkdev(tr->major, tr->name);
 		kfree(tr->blkcore_priv);=20
