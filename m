Received: from ext-ch1gw-5.online-age.net ([64.37.194.13])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AQDai-0005op-Jt
	for <linux-mtd@lists.infradead.org>; Sat, 29 Nov 2003 22:29:28 +0000
Received: from int-ch1gw-6.online-age.net (int-ch1gw-6 [3.159.232.70])
	id hATMRKqu003644	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Nov 2003 17:27:20 -0500 (EST)
Received: from uswaumsxb1medge.med.ge.com (localhost [127.0.0.1])
	id hATMRJpU011636	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Nov 2003 16:27:20 -0600 (CST)
Message-ID: <77FE4A1FA59FF947845A42194AD667620A0F45@uswaumsx07medge.med.ge.com>
From: "Howard, Michael (MED)" <Michael.Howard@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Sat, 29 Nov 2003 16:27:15 -0600
MIME-Version: 1.0
Content-Type: text/plain
Subject: 2048 byte page size in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a Samsung 256 Meg flash with a page size of 2048 bytes.  The latest
mtd code is blocking out any writes which are not page aligned.  However,
every time I try to copy to a JFFS2 mounted directory, it is calling the
nand write routines using 68 byte chucks which is then rejected.  

Can anyone tell me how to configure JFFS2 to write in 2048 chunks?  I was
poking around in write.c and think that I need to somehow increase the dnode
size to a fixed 2048.

Thanks
Mike
