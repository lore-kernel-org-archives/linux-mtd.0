Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bbjfs-0004nw-Fp
	for linux-mtd@lists.infradead.org; Sat, 19 Jun 2004 13:30:41 -0400
Received: from eric by maxwell.lnxi.com with local (Exim 3.35 #1 (Debian))
	id 1Bbjfw-0002S1-00
	for <linux-mtd@lists.infradead.org>; Sat, 19 Jun 2004 11:30:44 -0600
To: <linux-mtd@lists.infradead.org> 
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 19 Jun 2004 11:30:44 -0600
Message-ID: <m38yejh2uz.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Subject: [PATCH] mtdchar API appears not to be 64bit clean....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Yesterday when attempting to flash a cfi device from a 64bit kernel 
I ran into some problems.  Since the same operation worked in 32bit
mode I knew it was not my test program.

Looking at the definitions of the mtd ioclts everything appears to
be 64bit safe.  And in fact the ioctls appear to be safe without
delegation as all of the structures use fixed size types that don't
change when going from 32bit to 64bit.

#define MEMGETINFO              _IOR('M', 1, struct mtd_info_user)
#define MEMERASE                _IOW('M', 2, struct erase_info_user)
#define MEMWRITEOOB             _IOWR('M', 3, struct mtd_oob_buf)
#define MEMREADOOB              _IOWR('M', 4, struct mtd_oob_buf)
#define MEMLOCK                 _IOW('M', 5, struct erase_info_user)
#define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
#define MEMGETREGIONCOUNT	_IOR('M', 7, int)
#define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)

However then I got to looking at the code...
MEMERASE, MEMLOCK, and MEMUNLOCK all operate in terms of unsigned long
instead of a fixed size time or struct erase_info_user.

MEMERASE still works correctly because it copies the longs onto a two
fixed size types.  So that is simply a case of two many bytes being
copied.  So as long as we don't care about the extra fields being
stomped we are ok.

MEMLOCK and MEMUNLOCK are just broken on a 64bit machine, as they
unsigned longs to read and write 32bit values.

Currently I cannot see any redeem value in this or any possibility
that the code is correct so I have committed the following patch
to mtd cvs.

Eric



--- linux-2.6.7/drivers/mtd/mtdchar.c	Tue Jun 15 23:19:42 2004
+++ linux-2.6.7.x86-64-mtd/drivers/mtd/mtdchar.c	Thu Jun 17 22:06:32 2004
@@ -302,7 +302,7 @@
 
 			memset (erase,0,sizeof(struct erase_info));
 			if (copy_from_user(&erase->addr, (u_long *)arg,
-					   2 * sizeof(u_long))) {
+				    sizeof(struct erase_info_user))) {
 				kfree(erase);
 				return -EFAULT;
 			}
@@ -415,29 +415,29 @@
 
 	case MEMLOCK:
 	{
-		unsigned long adrs[2];
+		struct erase_info_user info;
 
-		if (copy_from_user(adrs ,(void *)arg, 2* sizeof(unsigned long)))
+		if (copy_from_user(&info ,(void *)arg, sizeof(info)))
 			return -EFAULT;
 
 		if (!mtd->lock)
 			ret = -EOPNOTSUPP;
 		else
-			ret = mtd->lock(mtd, adrs[0], adrs[1]);
+			ret = mtd->lock(mtd, info.start, info.length);
 		break;
 	}
 
 	case MEMUNLOCK:
 	{
-		unsigned long adrs[2];
+		struct erase_info_user info;
 
-		if (copy_from_user(adrs, (void *)arg, 2* sizeof(unsigned long)))
+		if (copy_from_user(&info, (void *)arg, sizeof(info)))
 			return -EFAULT;
 
 		if (!mtd->unlock)
 			ret = -EOPNOTSUPP;
 		else
-			ret = mtd->unlock(mtd, adrs[0], adrs[1]);
+			ret = mtd->unlock(mtd, info.start, info.length);
 		break;
 	}
 
