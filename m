Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Co1Fq-0001bB-1a
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 10:14:51 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 4566F2F016
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 16:14:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 39F5911662
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 16:14:48 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 8F6D27A1E
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 16:14:47 +0100 (CET)
Message-ID: <41E29BE6.1020601@imc-berlin.de>
Date: Mon, 10 Jan 2005 16:14:46 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD List <linux-mtd@lists.infradead.org>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>	<41DBC52E.9020500@yandex.ru>	<41DBCB29.1090205@inf.u-szeged.hu>
	<41DBCE80.9040408@imc-berlin.de> <41DBD356.4080603@yandex.ru>
In-Reply-To: <41DBD356.4080603@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


>> Thanks a million. I'll try that. I guess I can just use your Patch on 
>> a vanilla linux-2.6.10!?
>>
>> BTW: On the link mentioned above I read "Speed up the mount time of 
>> JFFS2 - specially when it uses NAND flash. " How about NOR flash?
>>
> My understanding of the problem is that summary may help in case of NOR, 
> but in
> general it shouldn't increase the mount speed a lot (am I wrong?).

As I wrote in another thread the summary patch reduced the mount time from 6 
seconds to less than 1 second on my embedded ARM9 system with 8MB NAND flash.
But now GC still slows down the start up of user applications as it checks all 
CRCs right after booting.

> If we change
> the patch a bit (asking not to check any CRC in the block has summary) 
> we may
> have better mount speed (and iget()). And possibly in case of nor we 
> even doesn't
> need to store any data in summary - only header. Header will show us 
> that the block
> was successfully written (no unclean reboots) and we my trust it and do 
> not check CRC.

Makes sense to me.
Ferenc, what do you think about that?
No need to check CRC if we have a summary, right?
This could fix my GC problem mentioned above and in the thread
http://lists.infradead.org/pipermail/linux-mtd/2005-January/011411.html

--
Steven
