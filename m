Date: Fri, 7 Jan 2005 19:40:16 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41DEDECA.5070400@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501071938420.14398@phoenix.infradead.org>
References: <41DED6C5.3080502@imc-berlin.de> <41DED888.7040508@imc-berlin.de>
	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
	<41DEDECA.5070400@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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

On Fri, 7 Jan 2005, Steven Scholz wrote:

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
And  the job the thread performs seems to be CPU-boud (it checks CRCs). 
Thus, isn't it normal to eat a lot of CPU cycles? 

> And this slows down the start up of important user applications.
> 
> Would it help to enable CONFIG_PREEMPT?
> 
> --
> Steven
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
