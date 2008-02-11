Received: from coliposte.enst-bretagne.fr ([192.108.115.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JObgz-0005jc-BB
	for linux-mtd@lists.infradead.org; Mon, 11 Feb 2008 16:39:51 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by coliposte.enst-bretagne.fr (8.13.7/8.13.7/2006.08.14) with ESMTP id
	m1BGdh8C005140
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2008 17:39:43 +0100
Received: from courrier.enst-bretagne.fr (vss-mail-02.priv.enst-bretagne.fr
	[10.29.90.4])
	by coliposte.enst-bretagne.fr (8.13.7/8.13.7/2008.01.11) with ESMTP id
	m1BGdb4S005105
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2008 17:39:40 +0100
Received: from [192.44.75.62] (plohr.enst-bretagne.fr [192.44.75.62])
	by courrier.enst-bretagne.fr (8.13.1/8.13.1/2006.06.07) with ESMTP id
	m1BGdUJs006398
	for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2008 17:39:31 +0100
Message-ID: <47B07A44.6030003@enst-bretagne.fr>
Date: Mon, 11 Feb 2008 17:39:32 +0100
From: Christophe Lohr <Christophe.Lohr@enst-bretagne.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: how to mount this mtd filesystem image?
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I’m not sure to be on the right mailing list…

My problem is as follow: I have an mtd dump file. This is not a jffs2 
file system image. It looks like a plain old flash file system, but 
which one? How may I get the content of this file system?

00000000 46 66 73 23 00 03 01 00 c0 ff ff ff ff ff ff ff |Ffs#............|
00000010 2f 66 66 73 2d 72 6f 6f 74 00 ff ff ff ff ff ff |/ffs-root.......|
00000020 2e 6a 6f 75 72 6e 61 6c 00 ff ff ff c0 00 03 00 |.journal........|
00000030 02 00 00 00 c0 00 04 00 03 00 00 00 c0 00 05 00 |................|
00000040 04 00 00 00 c0 00 06 00 05 00 00 00 c0 00 07 00 |................|
00000050 06 00 00 00 c0 00 08 00 07 00 00 00 c0 00 09 00 |................|
(...)

Any help is welcome.
Thanks and regards.
Christophe
