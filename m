Received: from zcars04e.nortelnetworks.com ([47.129.242.56])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bujis-0001Bd-UE
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2004 23:24:20 -0400
Received: from zcard303.ca.nortel.com (zcard303.ca.nortel.com [47.129.242.59])
	by zcars04e.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with
	ESMTP id i7B3OEp02696 for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2004 23:24:14 -0400 (EDT)
Received: from linhd by linhd-2.ca.nortel.com with local (Exim 3.36 #1
	(Debian)) id 1Bujin-0006DN-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Aug 2004 23:24:13 -0400
To: linux-mtd@lists.infradead.org
From: Linh Dang <linhd@nortelnetworks.com>
Date: Tue, 10 Aug 2004 23:24:13 -0400
Message-ID: <wn5oeli8ihu.fsf@linhd-2.ca.nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Linh Dang" <linhd@nortelnetworks.com>
Subject: beginner question about cfi_spin_lock()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



why the struct flchip must be protected with:

        - local_bh_disable()
        - preempt_disable()
        - spin_lock()

isn't that a bit overkill? Won't a mutex (semaphore) be sufficient?


Thanx

-- 
Linh Dang
