Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmzW2-00047L-Id
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 14:11:23 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id ACF922F016
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 20:11:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id A0D9411651
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 20:11:07 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 010047A1E
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 20:11:07 +0100 (CET)
Message-ID: <41DEDECA.5070400@imc-berlin.de>
Date: Fri, 07 Jan 2005 20:11:06 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41DED6C5.3080502@imc-berlin.de> <41DED888.7040508@imc-berlin.de>
	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
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

Artem B. Bityuckiy wrote:

>>But still why is it done everytime I boot my target?
> 
> This is how JFFS2 implemented. It skips nodes CRC checking during mount 
> and does this lated in background. Actually, you can't write anything to 
> your flash untill the GC thread (jffs2_gcd_mtd0) have not completed 
> checking. But you may read from JFFS2 during that checking process.

Well but "in background" means 99.9% of cpu time!
And this slows down the start up of important user applications.

Would it help to enable CONFIG_PREEMPT?

--
Steven
