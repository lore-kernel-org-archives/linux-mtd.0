Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoHUM-0007Gj-QV
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 03:34:56 -0500
Message-ID: <41E38FAA.5020508@imc-berlin.de>
Date: Tue, 11 Jan 2005 09:34:50 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>	<41DBC52E.9020500@yandex.ru>	<41DBCB29.1090205@inf.u-szeged.hu>	<41DBCE80.9040408@imc-berlin.de>
	<41DBD356.4080603@yandex.ru> <41E29BE6.1020601@imc-berlin.de>
	<41E38DCD.4080606@inf.u-szeged.hu>
In-Reply-To: <41E38DCD.4080606@inf.u-szeged.hu>
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

Hi Ferenc,

> If I am right CRCs are not only against the effect of unclean reboots 
> but also to handle flash errors. On NAND flashes the ECC handles this 
> problem but NOR doesn't have any error detection system.
> 
>> Ferenc, what do you think about that?
>> No need to check CRC if we have a summary, right?
> 
> Give us some days to invetigate it more deeply. I think we will be able 
> to imrove the summary patch in some way.

I now get

Eep. Child "libutil.so" (ino #230) of dir ino #5 doesn't exist!
Eep. Child "libthread_db.so" (ino #227) of dir ino #5 doesn't exist!
Eep. Child "libutil.so.1" (ino #231) of dir ino #5 doesn't exist!
Eep. Child "libthread_db-1.0.so" (ino #226) of dir ino #5 doesn't exist!
Eep. Child "libutil-2.3.3.so" (ino #229) of dir ino #5 doesn't exist!
Eep. Child "libthread_db.so.1" (ino #228) of dir ino #5 doesn't exist!
Eep. Child "adjtimex" (ino #237) of dir ino #9 doesn't exist!
Eep. Child "backlight" (ino #238) of dir ino #9 doesn't exist!
Eep. Child "log" (ino #299) of dir ino #13 doesn't exist!
Eep. Child "demo_320_240_16.xml" (ino #234) of dir ino #232 doesn't exist!
Eep. Child "demo.xml" (ino #233) of dir ino #232 doesn't exist!
Eep. Child "fonttest" (ino #235) of dir ino #232 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 72K

while booting! :-(

I am not sure if this has to do with the summary patch. How can I find out?

--
Steven
