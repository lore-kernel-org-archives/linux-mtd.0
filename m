Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGdPZ-0002gD-7y
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 13:34:37 +0100
Received: from localhost ([127.0.0.1] helo=auriga.ru)
	by mail.auriga.ru with esmtp (Exim 4.30)
	id 1BGdc8-0008IW-GB
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 16:47:36 +0400
Message-ID: <4087BBD5.5070205@auriga.ru>
Date: Thu, 22 Apr 2004 16:34:29 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

    I'm using jffs2 with nand mtd. Jffs2 driver starts printing such 
messages soon after deleting the last file in a jffs2 partition:

jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!

    The driver looks working after that. Any ideas what could it mean?

wbr, Dmitry.
