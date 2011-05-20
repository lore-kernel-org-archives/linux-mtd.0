Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNMQy-0005I6-HN
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 09:55:53 +0000
Message-ID: <4DD65673.8080801@nokia.com>
Date: Fri, 20 May 2011 12:54:27 +0100
From: maxin <john.maxin@nokia.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] drivers: mtd: mtdswap: fix possible null dereference
References: <4DD3B4C2.30301@nokia.com> <1305870365.2630.92.camel@localhost>
In-Reply-To: <1305870365.2630.92.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 11-05-20 06:46 AM, ext Artem Bityutskiy wrote:
> On Wed, 2011-05-18 at 13:00 +0100, maxin wrote:
>> This patch fixes the possible null dereference of the variable "oinfo"
> 
> Does this print makes sense? Which ECC? I think it should me something
> like "mtd% does not have OOB", mtd->index.
> 

Thank you very much for reviewing the patch.I have updated the print message 
as per your suggestion as it makes more sense for this case.

> Moreover, you should make the print consistent with the other prints
> which start with MTDSWAP_PREFIX.
> 

I have updated the patch as per your comments.

Signed-off-by: Maxin B. John <john.maxin@nokia.com>
---
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index fed215c..62ddb3a 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1450,7 +1450,13 @@ static void mtdswap_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	}
 
 	oinfo = mtd->ecclayout;
-	if (!mtd->oobsize || !oinfo || oinfo->oobavail < MTDSWAP_OOBSIZE) {
+	if (!oinfo) {
+		printk(KERN_ERR "%s: mtd%d does not have OOB"
+			"\n", MTDSWAP_PREFIX, mtd->index);
+		return;
+	}
+
+	if (!mtd->oobsize || oinfo->oobavail < MTDSWAP_OOBSIZE) {
 		printk(KERN_ERR "%s: Not enough free bytes in OOB, "
 			"%d available, %zu needed.\n",
 			MTDSWAP_PREFIX, oinfo->oobavail, MTDSWAP_OOBSIZE);
