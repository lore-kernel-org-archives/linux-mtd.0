Received: from smtp.mei.co.jp ([133.183.129.25] helo=jazz.mei.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6qnn-0006tq-UG
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2004 12:51:12 +0000
Received: by jazz.mei.co.jp (8.12.10/3.7W/bulls) with ESMTP id i2QCp6QG029916
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Mar 2004 21:51:06 +0900 (JST)
Received: by mail-gw.jp.panasonic.com (8.11.6p2/3.7W/somlx2) with ESMTP id
	i2QCp6g06805	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Mar 2004 21:51:06 +0900 (JST)
Received: by mail.jp.panasonic.com (8.11.6p2/3.7W/whitesox) with SMTP id
	i2QCp6D00279	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Mar 2004 21:51:06 +0900 (JST)
Message-Id: <200403260958.SAA05970@eagle.msr.mec.mei.co.jp>
Date: Fri, 26 Mar 2004 19:01:37 +0900
From: Kei Kurihara <kurihara@jp.panasonic.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Question about drivers/mtd/devices/slram.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

Are you going to respond the following restriction described in "slram.c"?

In slram.c
----------
  NOTE:
  With slram it's only possible to map a contigous memory region. Therfore
  if there's a device mapped somewhere in the region specified slram will
  fail to load (see kernel log if modprobe fails).

Is it because of technical problem of software or restriction of hardware?
If so, please let me know the problem and the hint for solving the problem.

best regards
