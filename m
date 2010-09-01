Received: from mail.datacast.com ([209.87.232.171] helo=datacast.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqmC8-00074R-N7
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 12:13:37 +0000
Received: from [192.168.2.130] by datacast.com (MDaemon PRO v9.6.1)
	with ESMTP id md50002093796.msg
	for <linux-mtd@lists.infradead.org>; Wed, 01 Sep 2010 08:13:35 -0400
Message-ID: <4C7E4540.9040203@datacast.com>
Date: Wed, 01 Sep 2010 08:21:20 -0400
From: Jonne Mintern <jmintern@datacast.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Reporting nand bad blocks in Linux
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: jmintern@datacast.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To report nand bad blocks, I have been using cmd 'nand bad' from uboot. What Linux cmd will get thesame report from a Linux prompt? I'm using Denx eldk4.2 on an AMCC PPC440EPx. I'm not sure what nand chip.
