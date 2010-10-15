Received: from mx04.teleca.com ([212.92.145.6])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P6itD-0006iE-3o
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 11:55:59 +0000
Received: from RUNNAS001.global.ad.teleca.com (unknown [10.13.11.16])
	by mx04.teleca.com (Postfix) with ESMTP id 99EA84EECE9
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 15:43:11 +0400 (MSD)
Message-ID: <4CB8422C.7000409@nokia.com>
Date: Fri, 15 Oct 2010 15:59:40 +0400
From: Roman Borisov <ext-roman.borisov@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: question about jffs2: jffs2_scan_dirty_space() return value
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello,

The question was born when I discovered that in fs/jffs2/scan.c 
jffs2_scan_medium() a return value from fs/jffs2/nodelist.c 
jffs2_scan_dirty_space() is not checked;
However return value from jffs2_scan_dirty_space() is checked anywhere else.
jffs2_scan_dirty_space() investigation showed that it can't return 
anything except 0;

The question is: should the jffs2_scan_dirty_space() be changed to 
return some error instead BUG() macro for example?
<code>
     if (unlikely(size > jeb->free_size)) {
         printk(KERN_CRIT "Dirty space 0x%x larger then free_size 0x%x 
(wasted 0x%x)\n",
                size, jeb->free_size, jeb->wasted_size);
-        BUG();
+    return some_error;
     }
</code>
In this case we also should update jffs2_scan_medium() to check the 
error code.

Thanks,
Roman
