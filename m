Received: from mailrelay2.inwind.it ([212.141.54.102])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IY9D-0002c8-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 18:12:35 +0100
Received: from ester (62.98.14.112) by mailrelay2.inwind.it (6.5.015)
        id 3CF4B8F500B02D32 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2002 19:12:07 +0200
Message-ID: <00a601c212fd$a5c3e5a0$0100a8c0@ester>
Reply-To: "Krypton" <krypton8@inwind.it>
From: "Krypton" <krypton8@inwind.it>
To: <linux-mtd@lists.infradead.org>
References: <20020613161907.87873.qmail@web21503.mail.yahoo.com>
Subject: Howto create a new jffs2
Date: Thu, 13 Jun 2002 19:13:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I added my new 'test' MTD partition.
I'd like to add a new little home.jffs2
How can I mount a new little jffs2 partition when I have 
linux prompt ?
Thank you  

Creating 5 MTD partitions on "SA1100 flash":

0x00000000-0x00020000 : "firmware"

0x00020000-0x00040000 : "params"

0x00040000-0x00140000 : "kernel"

0x00140000-0x00fe0000 : "rootdisk"

0x00fe0000-0x01000000 : "test"
