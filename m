Date: Fri, 7 Jan 2005 19:05:15 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41DED888.7040508@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
References: <41DED6C5.3080502@imc-berlin.de> <41DED888.7040508@imc-berlin.de>
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

> Hi there,
> 
> > I noticed that "jffs2_gcd_mtd0" is heavily running after boot consuming 
> > much time.
> > 
> > gc.c:jffs2_garbage_collect_pass() gets called very often - 596 times!
> 
> Well, actually it is only 293 times.
> (My mtd0 has 110 x 64KiB sectors = 7040KiB)
> 
> But still why is it done everytime I boot my target?
This is how JFFS2 implemented. It skips nodes CRC checking during mount 
and does this lated in background. Actually, you can't write anything to 
your flash untill the GC thread (jffs2_gcd_mtd0) have not completed 
checking. But you may read from JFFS2 during that checking process.

> 
> Thanks.
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
