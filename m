Date: Sat, 8 Jan 2005 12:43:57 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <41DEF6BB.6040704@mvista.com>
Message-ID: <Pine.LNX.4.58.0501081237420.18324@phoenix.infradead.org>
References: <41DED6C5.3080502@imc-berlin.de> <41DED888.7040508@imc-berlin.de>
	<Pine.LNX.4.58.0501071902390.13073@phoenix.infradead.org>
	<41DEDECA.5070400@imc-berlin.de>
	<Pine.LNX.4.58.0501071938420.14398@phoenix.infradead.org>
	<41DEF6BB.6040704@mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Jan 2005, Todd Poynor wrote:

> Steven Scholz wrote:
> 
> >>And this slows down the start up of important user applications.
> >>
> >>Would it help to enable CONFIG_PREEMPT?
> 
> It sounds like your apps need to write to an fs on flash and are blocked 
> on completion of the initial jffs2 gc pass, not that the cpu hogging is 
> blocking your apps.  If so, would suggest a separate partition with a 
> read-only fs (CramFS, etc.) for read-only data/executables (if not 
> already), maybe put /tmp and /var/tmp (or whatever dirs the apps are 
> writing to) in a ram fs such as tmpfs, and later copy 
> important/persistent data to jffs2 after everything's started up...
> 
If he have written something to fs and because of this have been blocked, 
CPU would have been consumed by the task which tried to write, not by the 
background task.But in his case the GC thread consumes CPU. So I don't 
think the problem is the early writing.

> -- 
> Todd
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
