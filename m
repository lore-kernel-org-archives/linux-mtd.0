Received: from postfix4-2.free.fr ([213.228.0.176])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkejS-0000vL-Fx
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 04:03:15 -0400
Received: from free.fr (marcadet-6-82-226-93-109.fbx.proxad.net
	[82.226.93.109])
	by postfix4-2.free.fr (Postfix) with ESMTP id 17A3919DE52
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jul 2004 10:03:11 +0200 (CEST)
Message-ID: <40F4E8EA.6050903@free.fr>
Date: Wed, 14 Jul 2004 10:03:54 +0200
From: sc <stephane.carbillet@free.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 mount time on AMD flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello !

I work on an AT91RM9200 board with linux 2.4.26-vrs1.
I mount an empty JFFS2 partition of 14 Mo of Nor Flash (AM29LV320)
Each time, it takes about 7 s to mount it.

First is it a normal time ?

How could I have better performance ?

Stephane
