Date: Wed, 12 Jan 2005 09:40:56 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41E4D801.2000502@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501120936510.10617@phoenix.infradead.org>
References: <41E4D801.2000502@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: disabling GC?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 Jan 2005, Steven Scholz wrote:

> Hi there,
> 
> what would be the impact if I disabled the GC thread on my embedded system?
If you disable GC thread, the GC function will check inodes anyway, but 
not in backgroun - in the context of the first process which will need to 
write and which will cause the GC to reserve some space.

So, disabling the GC thread one of you writer task will just be blocked 
for that checking time. IMHO, thats not what people usually want.
 
> I use an JFFS2 partition as root fs. But usually only write to it on firmware 
> update...
> 
> Thanks!
> 
> -- 
> Steven Scholz
> imc Measurement & Control
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
