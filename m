Received: from xproxy.gmail.com ([66.249.82.194])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEUFF-0005Hd-IK
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2005 12:00:09 -0400
Received: by xproxy.gmail.com with SMTP id i26so2871244wxd
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2005 08:59:47 -0700 (PDT)
Message-ID: <4324530D.5090002@gmail.com>
Date: Sun, 11 Sep 2005 18:53:49 +0300
From: gxkahn <gxkahn@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: ioctl BLKROSET
Reply-To: gxkahn@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i have to set my device (NOR flash) to be RW or RO.
i found ioctl BLKROSET which doing (should do) this.
MTD ioctl call comes down to mtd_blkdevs.c to blktrans_ioctl(), where i 
believe should
be case for it. It was this way in code for kernel 2.4 and now?
am i missing something or just to send patch for it?
