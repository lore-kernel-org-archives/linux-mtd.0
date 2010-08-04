Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgfZT-0004NO-02
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 15:07:56 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id F05F226027E
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Aug 2010 17:07:51 +0200 (CEST)
Message-ID: <4C598244.9060901@parrot.com>
Date: Wed, 4 Aug 2010 17:07:48 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtdchar : writing image with oob and NOP=1
References: <4C56801D.3040300@parrot.com>
In-Reply-To: <4C56801D.3040300@parrot.com>
Content-Type: multipart/mixed; boundary="------------080804020509070605030900"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------080804020509070605030900
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Matthieu CASTET a écrit :
> Hi,
> 
> We need to write our bootloader with a special ecc (use by cpu rom).
> 
> For that we use MTD_MODE_RAW, write and MEMWRITEOOB. This work fine, but 
> from my understanding this will do a first page program with oob set to 
> 0xff and then program again oob.
> 
> But some recent nand support only 1 program per page (NOP=1).
> How can we program nand with NOP=1 with a custom ecc ?
> 
>  From what I see in mtdchar either datbuf is set (and oobbuf is null) or 
> oobbuf is set (and datbuf is null).
> 
> So this mean we need to add an ioctl to do that ?
> 
For info here what we did for our 2.6.27 kernel.

Matthieu

--------------080804020509070605030900
Content-Type: text/x-diff; name="memwritepage.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="memwritepage.diff"

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e00d424..7621449 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -547,6 +547,84 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		break;
 
 	}
+	case MEMWRITEPAGE:
+	{
+		struct mtd_page_buf buf;
+		struct mtd_oob_ops ops;
+		struct mtd_page_buf __user *user_buf = argp;
+	        uint32_t retlen;
+
+		if(!(file->f_mode & 2))
+			return -EPERM;
+
+		if (copy_from_user(&buf, argp, sizeof(struct mtd_page_buf)))
+			return -EFAULT;
+
+		if (buf.length != mtd->writesize || buf.oob_length != mtd->oobsize)
+			return -EINVAL;
+
+		if (!mtd->write_oob)
+			return -EOPNOTSUPP;
+
+		ret = access_ok(VERIFY_READ, buf.ptr,
+					buf.length) ? 0 : EFAULT;
+		if (ret)
+			return ret;
+
+		ret = access_ok(VERIFY_READ, buf.oob_ptr,
+					buf.oob_length) ? 0 : EFAULT;
+		if (ret)
+			return ret;
+
+		ops.ooblen = mtd->oobsize;
+		ops.ooboffs = 0;
+		ops.len = mtd->writesize;
+		ops.mode = MTD_OOB_RAW;
+
+		if (ops.ooboffs && ops.ooblen > (mtd->oobsize - ops.ooboffs))
+			return -EINVAL;
+
+		ops.datbuf = kmalloc(buf.length, GFP_KERNEL);
+		if (!ops.datbuf)
+			return -ENOMEM;
+
+		if (copy_from_user(ops.datbuf, buf.ptr, buf.length)) {
+			kfree(ops.datbuf);
+			return -EFAULT;
+		}
+
+		ops.oobbuf = kmalloc(buf.oob_length, GFP_KERNEL);
+		if (!ops.oobbuf) {
+			kfree(ops.datbuf);
+			return -ENOMEM;
+		}
+
+		if (copy_from_user(ops.oobbuf, buf.oob_ptr, buf.oob_length)) {
+			kfree(ops.datbuf);
+			kfree(ops.oobbuf);
+			return -EFAULT;
+		}
+
+		ret = mtd->write_oob(mtd, buf.start, &ops);
+
+		if (!ret) {
+			retlen = ops.retlen;
+			if (copy_to_user(&user_buf->length, &retlen, sizeof(buf.length)))
+				ret = -EFAULT;
+		}
+
+		if (!ret) {
+			retlen = ops.oobretlen;
+			if (copy_to_user(&user_buf->oob_length, &retlen, sizeof(buf.oob_length)))
+				ret = -EFAULT;
+		}
+
+
+		kfree(ops.datbuf);
+		kfree(ops.oobbuf);
+		break;
+
+	}
 
 	case MEMREADOOB:
 	{
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6c61cd..3d9e3bc 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -16,6 +16,13 @@ struct mtd_oob_buf {
 	unsigned char __user *ptr;
 };
 
+struct mtd_page_buf {
+	uint32_t start;
+	uint32_t length;
+	unsigned char __user *ptr;
+	uint32_t oob_length;
+	unsigned char __user *oob_ptr;
+};
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -93,6 +100,7 @@ struct otp_info {
 #define ECCGETLAYOUT		_IOR('M', 17, struct nand_ecclayout)
 #define ECCGETSTATS		_IOR('M', 18, struct mtd_ecc_stats)
 #define MTDFILEMODE		_IO('M', 19)
+#define MEMWRITEPAGE		_IOWR('M', 30, struct mtd_page_buf)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace

--------------080804020509070605030900--
