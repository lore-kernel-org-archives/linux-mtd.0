Received: from py-out-1112.google.com ([64.233.166.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6J1o-0004Qj-PB
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 00:33:24 -0400
Received: by py-out-1112.google.com with SMTP id a25so4656718pyi
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Jul 2007 21:33:14 -0700 (PDT)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l654a4Rs010545
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 5 Jul 2007 13:36:04 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l654a4Te010544
	for linux-mtd@lists.infradead.org; Thu, 5 Jul 2007 13:36:04 +0900
Date: Thu, 5 Jul 2007 13:36:04 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: write buffer for MTD devices?
Message-ID: <20070705043604.GA10478@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

You know that block devices such as hard disk has write buffer
in hard disk itself to speed up the write performance.
(The write buffer speed up when it works in write-back mode.)

My questions are: (only for NAND flash memory)

1) Then, does MTD devices has write buffer in device itself?

2) If ret->mtd->write() returns OK, is the data sent by user
   successfully written on flash memory media? (not cache or
   buffer)

Any comments, related matrials or URLs are needed.

--
Seongsu Lee, http://www.senux.com/
