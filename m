Received: from linuxgrrls.org ([212.18.228.66] helo=mail.linuxgrrls.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmvzE-0001KC-1b
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 10:25:13 -0500
Date: Fri, 7 Jan 2005 15:24:56 +0000 (GMT)
From: jasmine@linuxgrrls.org
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501071519100.13073@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.61.0501071522160.28962@hex.linuxgrrls.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>   
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>   
	<20041222160942.GC9783@wohnheim.fh-wedel.de>   
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>   
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<33370.192.168.0.2.1105109729.squirrel@192.168.0.2>
	<Pine.LNX.4.58.0501071519100.13073@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Fri, 7 Jan 2005, Artem B. Bityuckiy wrote:

>> i)  The instruction cache suffers from this penalty and is, in fact, the
>>     major issue here.  Most of the wasted cycles will be waiting for an
>>     instruction to arrive from the i-cache.

> I'm sorry, not exactly. Ok, could you please write the code you think is
> better? Currentlly it is:

I don't know.  I guess you'd need to use inline assembler to shove the 
code around.  I don't know how to do that in Linux any more, but in the 
OS I'm used to it would look something like this:

/* Trash the CPU data chache */
trash_cache();
ts1 = TIMESTAMP();
asm(ALIGN_32);
for (j = 0; j < memsizes[i]; j++)
 	mem[i][j] = mem[i][j] + 1;
asm(ALIGN_32);
for (j = 0; j < memsizes[i]; j++)
        mem[i][j] = mem[i][j] + 1;
ts2 = TIMESTAMP();
