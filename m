Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cn0ld-00050Y-EZ
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 15:31:33 -0500
Received: from westrelay01.boulder.ibm.com (westrelay01.boulder.ibm.com
	[9.17.195.10])
	by e35.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j07KVPZ7474254
	for <linux-mtd@lists.infradead.org>; Fri, 7 Jan 2005 15:31:25 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by westrelay01.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j07KVO0w347694
	for <linux-mtd@lists.infradead.org>; Fri, 7 Jan 2005 13:31:25 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j07KVOVX012218
	for <linux-mtd@lists.infradead.org>; Fri, 7 Jan 2005 13:31:24 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41DEDECA.5070400@imc-berlin.de>
References: <41DED6C5.3080502@imc-berlin.de> <41DED888.7040508@imc-berlin.de>
	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
	<41DEDECA.5070400@imc-berlin.de>
Content-Type: text/plain
Message-Id: <1105129884.25392.19.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Fri, 07 Jan 2005 14:31:24 -0600
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-07 at 13:11, Steven Scholz wrote:
> Artem B. Bityuckiy wrote:
> 
> >>But still why is it done everytime I boot my target?
> > 
> > This is how JFFS2 implemented. It skips nodes CRC checking during mount 
> > and does this lated in background. Actually, you can't write anything to 
> > your flash untill the GC thread (jffs2_gcd_mtd0) have not completed 
> > checking. But you may read from JFFS2 during that checking process.
> 
> Well but "in background" means 99.9% of cpu time!
> And this slows down the start up of important user applications.

That's odd...  IIRC the thread schedules itself after every call to
jffs2_garbage_collect_pass.  By how much are the startup of these apps
delayed?  If it's using 99.9% of the cpu, maybe there is nothing else
that your system can do at that particular point?

> 
> Would it help to enable CONFIG_PREEMPT?

Maybe...  but since the thread tries to schedule itself already, I'm not
sure by how much.

josh
