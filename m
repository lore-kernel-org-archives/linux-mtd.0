Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm9cB-0000EX-Hm
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 06:46:14 -0500
Message-ID: <41DBD356.4080603@yandex.ru>
Date: Wed, 05 Jan 2005 14:45:26 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>	<41DBC52E.9020500@yandex.ru>
	<41DBCB29.1090205@inf.u-szeged.hu> <41DBCE80.9040408@imc-berlin.de>
In-Reply-To: <41DBCE80.9040408@imc-berlin.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Thanks a million. I'll try that. I guess I can just use your Patch on a 
> vanilla linux-2.6.10!?
> 
> BTW: On the link mentioned above I read "Speed up the mount time of 
> JFFS2 - specially when it uses NAND flash. " How about NOR flash?
> 
My understanding of the problem is that summary may help in case of NOR, 
but in
general it shouldn't increase the mount speed a lot (am I wrong?). If we 
change
the patch a bit (asking not to check any CRC in the block has summary) 
we may
have better mount speed (and iget()). And possibly in case of nor we 
even doesn't
need to store any data in summary - only header. Header will show us 
that the block
was successfully written (no unclean reboots) and we my trust it and do 
not check CRC.

Moreover, looking through the patch I suspect it wasn't tested with NOR, 
is it?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
