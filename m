Received: from beton.pi.net.pl ([195.116.221.97] helo=mail133.pi.net.pl)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CC0eg-0002gB-69
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2004 14:55:25 -0400
Message-ID: <000701c4a4c3$822d6e90$0b0aa8c0@maslow>
From: =?iso-8859-2?Q?Kornel_Mas=B3owski?= <maslow@pf.pl>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 27 Sep 2004 20:55:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-2";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure how jffs2 works.
I have jffs2 on  8bit NAND flash (page 512 B).
I want to append record 32B to the file on flash which current size is 10kB.
Flash device is almost empty.
How many pages will be written by jffs2? 
