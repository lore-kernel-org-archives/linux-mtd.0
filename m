Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cn16r-0005JZ-Qj
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 15:53:27 -0500
Message-ID: <41DEF6BB.6040704@mvista.com>
Date: Fri, 07 Jan 2005 12:53:15 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <41DED6C5.3080502@imc-berlin.de>
	<41DED888.7040508@imc-berlin.de>	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>	<41DEDECA.5070400@imc-berlin.de>
	<Pine.LNX.4.58.0501071938420.14398@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071938420.14398@phoenix.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Steven Scholz wrote:

>>And this slows down the start up of important user applications.
>>
>>Would it help to enable CONFIG_PREEMPT?

It sounds like your apps need to write to an fs on flash and are blocked 
on completion of the initial jffs2 gc pass, not that the cpu hogging is 
blocking your apps.  If so, would suggest a separate partition with a 
read-only fs (CramFS, etc.) for read-only data/executables (if not 
already), maybe put /tmp and /var/tmp (or whatever dirs the apps are 
writing to) in a ram fs such as tmpfs, and later copy 
important/persistent data to jffs2 after everything's started up...


-- 
Todd
