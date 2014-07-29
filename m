Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC3ci-000361-C2
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 09:23:12 +0000
Message-ID: <53D7677A.6000905@huawei.com>
Date: Tue, 29 Jul 2014 17:20:58 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC v2] ubi-utils: Introduce a utility ubidump
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Bill Pringlemeir <bpringlemeir@nbsps.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

After discussing with Artem, I've applied some of his ideas and
rewrite this utility.

Bill also gives me help. I reference his code about getting data
from MTD device.

Thank you all~!

v1:
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054541.html

Changes in v2:
 - modified ioctl() in ubi_vol which just return pnum now.
 - change libubifs.c/libubifs.h into libdump.c/libdump.h and
   remove ubi-level header dump function into libdump.c.
 - read data in eraseblock from MTD functionality.
 - add a new function "ubidump" to handle peb dumping.
 - modified options -H/-N into --ubi/--ubifs.

I found this utility can't dump lpt area correctly because we use
different structure to format this area. I will enable it soon. I
think we should confirm the mechanism of this utility first.
