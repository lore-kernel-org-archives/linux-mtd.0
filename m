Received: from chrudim.coprosys.cz ([194.108.73.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177y2S-0001rR-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 13:37:52 +0100
Received: from wolfhill.cz (user@ales.coprosys.cz [192.168.1.97])
	by chrudim.coprosys.cz (8.9.3/8.9.3) with ESMTP id OAA04358
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 14:37:49 +0200
Message-ID: <3CE256AD.1BF84F1C@wolfhill.cz>
Date: Wed, 15 May 2002 14:38:05 +0200
From: Ales Makarov <ales.makarov@wolfhill.cz>
Reply-To: ales.makarov@wolfhill.cz
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: MTD+JFFS2 on DragonBall VZ
Content-Type: text/plain; charset=us-ascii
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

Hi,

I've got MTD+JFFS2 running on our board with Motorola DragonBall 68VZ328
CPU. We use CFI (or JEDEC) flashes (AMD/Fujitsu type: 29LV160, 29LV320).
I use cfi_probe (or modified jedec_probe) and physmap.c.

Till now I needed MTD with only one chip. But I want use MTD also on the
second chip (with partitioning). Do I have to write my own mapper for
our board?

Ales
