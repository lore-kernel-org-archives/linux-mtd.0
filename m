Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm9HY-0008JD-Jo
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 06:24:53 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 268EB2F016
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 12:24:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 1B85A11608
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 12:24:48 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 6EB057A1E
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 12:24:47 +0100 (CET)
Message-ID: <41DBCE80.9040408@imc-berlin.de>
Date: Wed, 05 Jan 2005 12:24:48 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD List <linux-mtd@lists.infradead.org>
References: <20040113125031.GA5146@angel.research.nokia.com>	<41DAAF79.8020401@imc-berlin.de>
	<41DBC52E.9020500@yandex.ru> <41DBCB29.1090205@inf.u-szeged.hu>
In-Reply-To: <41DBCB29.1090205@inf.u-szeged.hu>
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

Hi Ferenc,

>> Note: JFFS3 development is in progress so be ready if it has bugs.
> 
> Becauseof it, we maintain a summary patch for JFFS2. You can download 
> the latest patch from http://www.inf.u-szeged.hu/jffs2/mount.php
> (I'm updating the page now, so you may wait a little.)
> 
> Summary designed specially to speed up the mounttime, so it should help 
> you.

Thanks a million. I'll try that. I guess I can just use your Patch on a vanilla 
linux-2.6.10!?

BTW: On the link mentioned above I read "Speed up the mount time of JFFS2 - 
specially when it uses NAND flash. " How about NOR flash?

--
Steven
