Date: Fri, 7 Jan 2005 19:01:37 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41DED6C5.3080502@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501071841090.13073@phoenix.infradead.org>
References: <41DED6C5.3080502@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Jan 2005, Steven Scholz wrote:

> Hi there,
> 
> I am using linux-2.6.10 with recent MTD CVS and the SUMMARY patch on an embedded 
> ARM9 system (150MHz core, 48MHz SDRAM) with 8MB NOR flash as root fs.
> 
> The SUMMARY patch actually reduced the mount time - the time between
> 
>   NET: Registered protocol family 1
>   NET: Registered protocol family 17
> 
> and
> 
>   VFS: Mounted root (jffs2 filesystem).
>   Freeing init memory: 72K
> 
> - from 6 to less then 1 second (710ms)! :-)
Really? Seems I was wrong. But anyway, there should not be so big 
difference... I may try to explain it how jffs2_scan_medium() implemented. 
It reads PAGE_SIZE bytes to the buffer (jffs3_fill_scan_buf()) and the 
scan this buffer for nodes. Thus, it may end up reading the whole block.
In case of summaries, we only read summary node.

Another difference - without summary we check CRCs of node common headers 
and diretries fully. But with summary we do not do this - only check 
summary CRC once.

So, I wonder if we have fixed the above two issues would the summary data 
needed at all? Would we have better mount speed?

> 
> But then before
> 
>   init started:  BusyBox v1.00 (2005.01.04-08:42+0000) multi-call binary
> 
> appears still "nothing" happens for around 8 seconds.
> 
> I noticed that "jffs2_gcd_mtd0" is heavily running after boot consuming much time.
> 
> gc.c:jffs2_garbage_collect_pass() gets called very often - 596 times!
> 
> Why is that garbage collection running everytime I boot my target!?!?
> Is there anything I can do about it?

It checks all file on your flash. This is normal. I believe when Ferenc 
implement the feature I suggested, the checking time will be significantly reduced.

> 
> Thanks a million!
> 
> -- 
> Steven Scholz
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
