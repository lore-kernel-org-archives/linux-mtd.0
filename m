Received: from mail.imc-berlin.de ([217.110.46.186]
	helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192uAR-0003RL-Al
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 15:33:43 +0100
Message-ID: <3E92DDC9.7030000@imc-berlin.de>
Date: Tue, 08 Apr 2003 16:33:45 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <3E92D5C7.8020603@imc-berlin.de>
	<20030408141952.GA30313@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 uncompressed?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel schrieb:
> On Tue, 8 April 2003 15:59:35 +0200, Steven Scholz wrote:
> 
>>IIRC files are stored compressed on a JFFS2 partition.
>>
>>Is there any chance that I could use JFFS2 without any compression?
>>
>>I guess this might me faster for our embedded system!
> 
> 
> Piece of cake.
> Look at fs/jffs2/compr.c, first function. Add a couple of #if 0 and
> you're done.
Thanks!

How about mkfs.jff2? Do I have to change something there as well?

> Do the same with the second function and the kernel image should
> shrink a little.
:o)

Steven
