Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hq8Dw-0002fK-0v
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 09:47:01 -0400
Received: from toronto.xi-lite.net (localhost.localdomain [127.0.0.1])
	by toronto.xi-lite.net (Postfix) with ESMTP id AB623658219
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 May 2007 13:46:50 +0000 (GMT)
Received: from mail.xi-lite.com (unknown [193.34.35.248])
	by toronto.xi-lite.net (Postfix) with ESMTP id 971A1658219
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 May 2007 13:46:50 +0000 (GMT)
Message-ID: <4651A1E2.60206@parrot.com>
Date: Mon, 21 May 2007 15:42:58 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 : duplicate node
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


With jffs2 from 2.6.20 with summary enabled, I manage to get duplicate 
inode node : there have the same (same header, crc, ...) [1]

Is that normal ?
I was thinking the version should be incremented each time the inode 
node is modified.


Matthieu

[1] for a partition in 80000 a80000, I got
- fcf7c 248000 (len 208) is the same
- 248100 885074 (len 75) is the same
- 24817c 8850f0 (len 88) is the same
