Received: from ext-ch1gw-1.online-age.net ([216.34.191.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtrfN-0003fq-VZ
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 17:08:50 +0000
Received: from int-ch1gw-1.online-age.net (int-ch1gw-1 [3.159.232.65])
	id i1JH8P8W019231	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Feb 2004 12:08:26 -0500 (EST)
Received: from uswaumsxb4medge.med.ge.com (localhost [127.0.0.1])
	id i1JH8OPP002030	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Feb 2004 12:08:25 -0500 (EST)
Message-ID: <77FE4A1FA59FF947845A42194AD667620A0FF2@uswaumsx07medge.med.ge.com>
From: "Howard, Michael (MED)" <Michael.Howard@med.ge.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 19 Feb 2004 11:08:13 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Block device vs char device reads
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've been doing some benchmarking on reading from the 2 drivers. The
number of page reads the block device requires is many times more than
the char.  I'm poking through mtdblock.c trying to understand what it is
doing.  Is this behaviour to be expected?  Is there any way to optimize
it?

I need to use the block device as I'm mounting JFFS2 on top but
performance has been terrible.  Any help would be much appreciated.


Thanks
Mike
