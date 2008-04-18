Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jmkwf-0004qF-0k
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 07:23:41 +0000
Message-ID: <48084B80.2050601@nokia.com>
Date: Fri, 18 Apr 2008 10:19:28 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Abhijit Singh <mail2abhijit@gmail.com>
Subject: Re: inconsistent behaviour with onenand with 2.6.24 kernel
References: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
In-Reply-To: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Abhijit Singh wrote:
> I am facing some problem with onenand with the kernel 2.6.24.

Yes it is broken.

Here is a list on OneNAND patches in 2.6.25

69d79186dc48ca22a0ce69511bef8ef6c2465ada [MTD] [OneNAND] Use pre-alloced oob buffer instead of local buffer
978cb38a296fceac82a8a757f6387d7ef2a21ac6 [MTD] [OneNAND] Use the u_char instead of char in oobbuf
b2581be291aa8595eadf3d6933d04d0f1d01b46d [MTD] [OneNAND] Check the initial bad block using ONENAND_CTRL_ERROR
e71f04fc9234b14636887ceb5862755f1690642c [MTD] [OneNAND] Get correct density from device ID
b21b72cf33bb212414c1d967850e261b795befa4 [MTD] [OneNAND] Consolidate OneNAND operation order
9d2f0b7a3de28d06ba4011b835b9a7e772553f0d [MTD] [OneNAND] fix call to onenand_verify when writing subpages
d0b36d8cc8f345ec5faadd15daaecfb409b94523 [MTD] [OneNAND] Do not release chip twice

The last one "[MTD] [OneNAND] Do not release chip twice" is absolutely essential, so here it is:


commit d0b36d8cc8f345ec5faadd15daaecfb409b94523
Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date:   Thu Jan 24 12:48:37 2008 +0200

    [MTD] [OneNAND] Do not release chip twice
    
    Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
    Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ed9f9c0..e5882b6 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1447,9 +1447,6 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
                buf += thislen;
        }
 
-       /* Deselect and wake up anyone waiting on the device */
-       onenand_release_device(mtd);
-
        ops->retlen = written;
 
        return ret;
