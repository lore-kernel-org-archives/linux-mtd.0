Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UOsv-0000XA-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 09:40:13 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id KAA10919
	for <linux-mtd@lists.infradead.org>; Wed, 8 Aug 2001 10:45:59 +0200 (CEST)
Message-ID: <3B70FC27.2A6943E9@inventel.fr>
Date: Wed, 08 Aug 2001 10:45:27 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: jffs2 tests
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

Hello,
I do a similar test on jffs2 (20010802) as Frederic Giasson did :
1- copy randomly generated files of different sizes several times to
fill the jffs2 partition
2- df
3- remove all files
4- df

at step 4, most of the time I have :
/dev/mtdblock2            3200       648      2552  20%
/mnt/jffs2/jffs2_0
and from time to time :
/dev/mtdblock2            3200       904      2296  28%
/mnt/jffs2/jffs2_0
Nevertheless, as the following copy is able to copy the same amount of
files, it should be due to the latency of the garbage collector work
(confirm).

The only thing that seems odd to me is the occurence from time to time
of the following :

 rm -R /mnt/jffs2/jffs2_0/*
Unknown INCOMPAT nodetype C002 at 001B1588
jffs2_read_inode(): No data nodes found for ino #23289
Eep. read_inode() failed for ino #23289
Unknown INCOMPAT nodetype C002 at 000E1A8C
jffs2_read_inode(): No data nodes found for ino #23290
Eep. read_inode() failed for ino #23290

the unknown nodetype is always C002

What kind of debug is worth to be printed out to get more information
about that problem ?

Xavier
