Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KlrOY-0000qe-1y
	for linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 20:37:02 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m93KauQI027845
	for <linux-mtd@lists.infradead.org>; Fri, 3 Oct 2008 13:36:56 -0700
To: linux-mtd@lists.infradead.org
Subject: [RFC] Support for > 2Gib MTD
MIME-Version: 1.0
Message-ID: <OFBFC97F2E.8869DAF6-ON882574D7.006EFDFB-882574D7.00713C5B@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Fri, 3 Oct 2008 13:36:55 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So I'm back to work on this.  My last attempt was shot down in flames 
because I changed the kernel-user space API.  No worries on that.  Got a 
new plan.  Gonna' float it out there BEFORE I put a ton of work into it 
this time.

Here's a rough idea of what I'm thinking.  In .../include/mtd/mtd-abi.h 
add new 64 bit structs like this:

+struct erase_info_user_64 {
+       uint64_t start;
+       uint64_t length;
+}

+struct mtd_info_user_64 {
+       ...
+       uint32_t flags;
+       uint64_t size;
+       ...
+}

These new structs would be identical to the old ones execept for the types 
on a few fields.  To indicate that the new 64 bit interface is to be used 
I would introduce a new flag for 'struct mtd_info_user_XX->flags', 
something like this:

#define MTD_LARGE_SIZE 0x4000

In .../include/linux/mtd.h I would add new fields as follows:

struct erase_info {
        ...
        u_int32 fail_addr;
+       u_int64_t addr_64;
+       u_int64_t len_64;
+       u_int64_t fail_addr_64;
        u_long time;
        ...
}

struct mtd_info {
        ...
        u_int32_t size;
+       u_int64_t size_64;
        u_int32_t erasesize;
        ...
}

Plus a few new IOCTLs for getting info to/from user space if people want 
to use it.

Comments?

Bruce
