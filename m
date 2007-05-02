Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjBSZ-00017U-Kt
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 10:49:20 +0100
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l429KPRj007784
	for <linux-mtd@lists.infradead.org>; Wed, 2 May 2007 12:20:32 +0300
Message-ID: <46385786.5020804@nokia.com>
Date: Wed, 02 May 2007 12:19:02 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 wrong data CRC message
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

Hi

Can someone explain why this message is not an error?

JFFS2 notice: (17573) read_dnode: wrong data CRC in data node at 0x07e85800: read 0x86c6656c, calculated 0xaf4f2bc5.
