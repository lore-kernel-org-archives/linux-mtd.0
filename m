Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bhRH-0003JH-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 12:53:51 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id A696F479F
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 13:02:15 +0200 (CEST)
Message-ID: <3B8B87A9.2F622A89@dgt-lab.com.pl>
Date: Tue, 28 Aug 2001 13:59:37 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow :(
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have JFFS2 on my 8MBFujitsu Flash Chip connected to MPC850 (50Mhz).
I've decided to have root file system on that flash, but it boots
extremly slow.
It takes about 5 minutes. With compressed initial ram disk on flash it
takes less
than 30s.

Q1 Why?
Q2 I work on mtd-snapshot-20010628.tar.bz2. Are there any speed changes
in furthere releases?


--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
