Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoHLk-000752-Vk
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 03:26:02 -0500
Message-ID: <41E38DCD.4080606@inf.u-szeged.hu>
Date: Tue, 11 Jan 2005 09:26:53 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>	<41DBC52E.9020500@yandex.ru>	<41DBCB29.1090205@inf.u-szeged.hu>	<41DBCE80.9040408@imc-berlin.de>
	<41DBD356.4080603@yandex.ru> <41E29BE6.1020601@imc-berlin.de>
In-Reply-To: <41E29BE6.1020601@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi Steven,

> As I wrote in another thread the summary patch reduced the mount time 
> from 6 seconds to less than 1 second on my embedded ARM9 system with 8MB 
> NAND flash.
> But now GC still slows down the start up of user applications as it 
> checks all CRCs right after booting.

>> If we change
>> the patch a bit (asking not to check any CRC in the block has summary) 
>> we may
>> have better mount speed (and iget()). And possibly in case of nor we 
>> even doesn't
>> need to store any data in summary - only header. Header will show us 
>> that the block
>> was successfully written (no unclean reboots) and we my trust it and 
>> do not check CRC.

If I am right CRCs are not only against the effect of unclean reboots 
but also to handle flash errors. On NAND flashes the ECC handles this 
problem but NOR doesn't have any error detection system.

> Ferenc, what do you think about that?
> No need to check CRC if we have a summary, right?

Give us some days to invetigate it more deeply. I think we will be able 
to imrove the summary patch in some way.

Bye,
Ferenc
