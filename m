Received: from okigate.oki.co.jp ([202.226.91.194]
	helo=iscan2.intra.oki.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19yrlk-0005nq-4Q
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 12:43:48 +0100
Received: from s24c7.dm1.oii.oki.co.jp (IDENT:root@localhost.localdomain
	[127.0.0.1])
	by iscan2.intra.oki.co.jp (8.9.3/8.9.3) with ESMTP id UAA17156
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 20:43:03 +0900
Received: from t80c88 (t80c88.dm6.oii.oki.co.jp [172.17.73.88])
	by s24c7.dm1.oii.oki.co.jp (8.9.3/3.7W) with SMTP id UAA06912
	for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2003 20:42:50 +0900
	(envelope-from guo364@oki.com)
Message-ID: <001501c37b7e$8548eab0$584911ac@t80c88>
From: "guo zhenglin" <guo364@oki.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 15 Sep 2003 19:41:37 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Subject: the second flash and mtd0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have two flash ,
they partitions is :
flash1:  have 3 partitions.
flash2: have 2 partitions

flash1 baseaddr is 0xB0000000, total 4MB
flash2 baseaddr is 0xBD000000 , total 4MB

I know mtd0 is reprent the first flash , then what reprent 
the second flash? is mtd4? or other?

thank you .
