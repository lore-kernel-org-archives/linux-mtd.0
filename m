Received: from [207.215.131.7] (helo=mail.pioneer-pdt.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bj4Qv-0001e6-EI
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2004 19:05:34 -0400
Received: from 127.0.0.1 (localhost.pioneer-pdt.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id CD6289D81C
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Jul 2004 16:05:29 -0700 (PDT)
Received: from philt.pioneer-pdt.com (unknown [172.30.2.110])
	by mail.pioneer-pdt.com (Postfix) with ESMTP id 2A4EF9D81A
	for <linux-mtd@lists.infradead.org>;
	Fri,  9 Jul 2004 16:03:18 -0700 (PDT)
From: Patrick Hilt <philt@pioneer-pdt.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 9 Jul 2004 16:08:14 -0700
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200407091608.14442.philt@pioneer-pdt.com>
Subject: JFFS 2 Question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list!
Is there a way to make sure data is being written to physical flash when using 
JFFS2? In other words, After writing a file on a JFFS2 partition, is there 
anything that can be done to make sure that the data is getting written to 
the flash right away? Would "sync" or "fsync" have that effect?

Thanks a lot in advance for any input!!!

Happy weekend,

Patrick
