Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CnvRE-0007WD-H1
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 04:02:14 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 9FFB42F016
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 10:02:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 8AC881165E
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 10:02:06 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id DA8397A1E
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Jan 2005 10:02:05 +0100 (CET)
Message-ID: <41E2448C.2060003@imc-berlin.de>
Date: Mon, 10 Jan 2005 10:02:04 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <41DED6C5.3080502@imc-berlin.de>	 <41DED888.7040508@imc-berlin.de>	
	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>	
	<41DEDECA.5070400@imc-berlin.de>
	<1105129884.25392.19.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1105129884.25392.19.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:

>>Well but "in background" means 99.9% of cpu time!
>>And this slows down the start up of important user applications.
> 
> That's odd...  IIRC the thread schedules itself after every call to
> jffs2_garbage_collect_pass.  By how much are the startup of these apps
> delayed?  If it's using 99.9% of the cpu, maybe there is nothing else
> that your system can do at that particular point?

Ok. Maybe I exaggerated a bit. It consumes much time. But it seems to share it 
with my application. Shortly after boot I see something like 70-80% for gc and 
20% for my app. But this changes after a few seconds.

VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 76K

<6 seconds pause>

init started:  BusyBox v1.00 (2005.01.04-08:42+0000) multi-call binary
<1 seconds pause>
Please press Enter to activate this console.

After this gc is still running.

-- 
Steven Scholz
