Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HUWX-0000KS-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 19:40:33 +0000
Message-ID: <3CF3D7FB.5020500@redswitch.com>
Date: Tue, 28 May 2002 12:18:19 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Wolfgang Denk <wd@denx.de>
Subject: MTD access problem
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm experiencing a strange mtd access problem when two threads try to 
access two different mtd devices which are in the same chip (using CS0). 
This happens as follows.
1. Thread A calls get_mtd_device() to an mtd handle (e.g. mtd6), calls 
erase() to erase one sector (128K byte), and tries to write some data 
into this sector, then calls put_mtd_device() to return the handle.
2. At the same time, thread B tries the same action on another mtd 
device (e.g. mtd5).
3. The strange thing happens. The write action takes long time (10 
minutes, sometimes even longer) to finish.

I'm not sure this problem is usual or not. My flash is AMD29LV642D. The 
mtd code is from DENX distribution 2.4.4-2002-08-09. It may not be the 
latest one from CVS.

Wolfgang, is the mtd code from your distribution the same as the mtd cvs 
from infradead.org?

I hacked into the mtd source code "mtdcore.c" and found a *temporary* 
solution to my problem. I added the following two functions. Basically, 
I intentionally delay the release of mtd_table_mutex until a user calls 
rs_put_mtd_device() to release an mtd handle. When rs_get_mtd_device() 
is called, only one can get permission to access an mtd device, thus it 
prevents the above problem from taking place. Since my threads do not 
write to mtd devices very frequently, I can tolerate such inefficiency. 
Obviously, this is not a good fix, or may be a wrong one. Any 
suggestions? Thank you very much.

Happy Thanksgiving!

- Shawn.

struct mtd_info *rs_get_mtd_device(struct mtd_info *mtd, int num)
{
	struct mtd_info *ret = NULL;
	int i;

	down(&mtd_table_mutex);

	if (num == -1) {
		for (i=0; i< MAX_MTD_DEVICES; i++)
			if (mtd_table[i] == mtd)
				ret = mtd_table[i];
	} else if (num < MAX_MTD_DEVICES) {
		ret = mtd_table[num];
		if (mtd && mtd != ret)
			ret = NULL;
	}
	
	if (ret && ret->module && !try_inc_mod_count(ret->module)) {
		up(&mtd_table_mutex);
		return NULL;
	}

	return ret;
}

void rs_put_mtd_device(struct mtd_info *mtd)
{
	up(&mtd_table_mutex);

	if (mtd->module)
	       __MOD_DEC_USE_COUNT(mtd->module);
}

EXPORT_SYMBOL(rs_get_mtd_device);
EXPORT_SYMBOL(rs_put_mtd_device);
