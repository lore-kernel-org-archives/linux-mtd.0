Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195KjO-0008Im-Gn
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 08:19:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jeremy Bowen <Jeremy.Bowen@opennw.com>
In-Reply-To: <DEA23DB61B62D4118B5900508B323B840105552F@OPENMAIL>
References: <DEA23DB61B62D4118B5900508B323B840105552F@OPENMAIL>
Message-Id: <1050391194.3035.25.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 15 Apr 2003 08:19:54 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Unable to write to some JFFS partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1. Don't use JFFS, use JFFS2.
2. Don't attempt to use partitions which have fewer free blocks than are
   required to make progress -- combine all your file system space into
   one JFFS2 partition. Note that there exist bootloaders which can boot
   from JFFS2 so you can put the kernel in there too.
3. eraseall works on the /dev/mtd character devices, not the block 
   devices.

-- 
dwmw2
