Received: from [160.114.120.248] (helo=eos.fwall.u-szeged.hu)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmVDl-0006NI-UY
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2005 05:50:34 -0500
Message-ID: <41DD17F4.2050603@inf.u-szeged.hu>
Date: Thu, 06 Jan 2005 11:50:28 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>	<41DBC52E.9020500@yandex.ru>	<41DBCB29.1090205@inf.u-szeged.hu>
	<41DBCE80.9040408@imc-berlin.de> <41DBD356.4080603@yandex.ru>
In-Reply-To: <41DBD356.4080603@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Steven Scholz <steven.scholz@imc-berlin.de>
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

>> Thanks a million. I'll try that. I guess I can just use your Patch on 
>> a vanilla linux-2.6.10!?
>>
>> BTW: On the link mentioned above I read "Speed up the mount time of 
>> JFFS2 - specially when it uses NAND flash. " How about NOR flash?
>>
> My understanding of the problem is that summary may help in case of NOR, 
> but in
> general it shouldn't increase the mount speed a lot (am I wrong?). 

Artem is right.

> Moreover, looking through the patch I suspect it wasn't tested with NOR, 
> is it?

It should work with NOR, too. Now we tested it again, and noticed some 
problems. One of them are "general", and an other is NOR specific. We 
will fix it soon, so you may wait a little before testing it.

 > If we change
 > the patch a bit (asking not to check any CRC in the block has summary)
 > we may
 > have better mount speed (and iget()). And possibly in case of nor we
 > even doesn't
 > need to store any data in summary - only header. Header will show us
 > that the block
 > was successfully written (no unclean reboots) and we my trust it and
 > do not check CRC.

Yes, if everything will be stable we should start to make it more optimal.

Bye,
Ferenc
